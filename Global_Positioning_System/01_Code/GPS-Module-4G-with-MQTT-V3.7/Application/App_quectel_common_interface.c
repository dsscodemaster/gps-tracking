/*
 * File:   App_quectel_common_interface.c
 * Author: 2020
 *
 * Created on June 1, 2022, 4:39 PM
 */

#include "App_quectel_common_interface.h"


Quectel_common_interface_t    Quectel_common_interface;



static bool Quectel_run_configuration_script(void)
{
    char buf[64],temp[5];
    char *ptr,*ptr1;
    static bool one_time_config_done = false;
    uint8_t LpCnt = 0;

    
    if(!one_time_config_done)
    {
        one_time_config_done = true;
        
        /* AT echo mode off */
        Quectel_send_command_and_check_response("ATE0\r\n","OK\r\n",NULL,0,5,true);
        Quectel_send_command_and_check_response("AT+CTZU=1\r\n","OK\r\n",NULL,0,5,true);
        if(Quectel_common_interface.bits.fixed_baud_mode != true)
        {
            /* Set fixed baud rate for AT interface */
            if(!Quectel_send_command_and_check_response("AT+IPR?\r\n","115200\r\n",NULL,0,5,true))
            {
                Quectel_send_command_and_check_response("AT+IPR=115200\r\n","OK\r\n",NULL,0,5,true);
                Quectel_send_command_and_check_response("AT&W0\r\n","OK\r\n",NULL,0,5,true);
            }
            Quectel_common_interface.bits.fixed_baud_mode = true;
        }
    }
  
    
    /* Read IMEI number of the module */
    if(strlen(Quectel_common_interface.imei_no) == 0)
    {
    READ_IMEI:
        Quectel_send_command_and_check_response("AT+CGSN\r\n","OK\r\n",buf,48,5,true);
        ptr = strstr(buf,"\r\n");
        ptr1 = strstr(buf,"\r\n\r\nOK");
        *ptr1 = '\0';

        if(ptr1 != ptr)
        {
            sprintf(Quectel_common_interface.imei_no,"%s",ptr+2);
            if(strlen(Quectel_common_interface.imei_no) > 15)
                Quectel_common_interface.imei_no[15] = '\0';
            else if(strlen(Quectel_common_interface.imei_no) < 14)
                goto READ_IMEI;
        }
    }
    
    // Use IMEI number to complete client id for MQTT.
    for(LpCnt = 0; LpCnt < 4; LpCnt++)
    {
        temp[LpCnt] = Quectel_common_interface.imei_no[LpCnt+11];
    }
    temp[LpCnt] = '\0';
    strcat(gprs_comm_interface.mqtt_config_info.server_config_info.client_id,temp);
    
    return true;
}




bool App_quectel_common_setup(void)
{
    return Quectel_run_configuration_script();
}


bool Quectel_signal_strength(void)
{
    char buf[48],*ptr,*ptr1;
    
    Quectel_send_command_and_check_response("AT+CSQ\r\n","OK\r\n",buf,48,10,true);
    ptr = Quectel_data_from_response(buf,"CSQ");
    if(ptr != NULL)
    {
        ptr1 = strstr(ptr,",");
        *ptr1 = '\0';
        Quectel_common_interface.signal_strength = atoi(ptr);
        //Quectel_common_interface.signal_quality = atoi(ptr1+2);
        if(Quectel_common_interface.signal_strength >= 1)
            return true;
    }
    
    return false;
}


bool App_quectel_configure_network_and_perform_registration(void)
{
    
    if(!Quectel_common_interface.bits.sim_detected)
        return false; 
    
    if(Quectel_common_interface.bits.gsm_nw_up)
        return true;

    
    //--------------------------------------------------------------------------
    char buf[64];
    char *ptr,*ptr1,*ptr2,*ptr3;
    bool fail_flag = false;
    
    /* Configure network scan mode */
    Quectel_send_command_and_check_response("AT+QCFG=\"nwscanmode\",0,1\r\n","OK\r\n",buf,48,3,true);    /* Automatic mode - GSM/LTE*/
    
    /* Configure network bands to be searched */
    Quectel_send_command_and_check_response("AT+QCFG=\"band\",0xFFFF,0x1E2080800DF,1\r\n","OK\r\n",buf,48,3,true);    /* All frequency bands of GSM and LTE*/

    /* Get signal information */
    if(Quectel_signal_strength() == false)
        return false;    
    
    /* Read IMSI number */
    if(strlen(Quectel_common_interface.imsi_no) == 0)
    {
        if(Quectel_send_command_and_check_response("AT+CIMI\r\n","OK\r\n",buf,48,5,true))
        {
            ptr = strstr(buf,"\r\n");
            ptr1 = strstr(buf,"\r\n\r\nOK");
            *ptr1 = '\0';

            if(ptr && ptr1 && (ptr1 != ptr))
                sprintf(Quectel_common_interface.imsi_no,"%s",ptr+2);

        }
    }

    /* Get SIM ICCID */
    if(strlen(Quectel_common_interface.sim_iccid) == 0)
    {
        if(Quectel_send_command_and_check_response("AT+CCID\r\n","OK\r\n",buf,48,5,true))
        {
            ptr = strstr(buf,"\r\n");
            ptr1 = strstr(buf,"\r\n\r\nOK");
            *ptr1 = '\0';

            if(ptr && ptr1 && (ptr1 != ptr))
                sprintf(Quectel_common_interface.sim_iccid,"%s",ptr+9);
        }
    }
       
    /* Start network registration */    
    Quectel_send_command_and_check_response("AT+CREG?\r\n","OK\r\n",buf,48,5,true);
    ptr = strstr(buf,"CREG:");
    if(ptr == NULL)
        return false;
    else
    {
        if(strstr(ptr+5,"1,1") != NULL)                 /* Registered to home network */
        {
            Quectel_common_interface.bits.gsm_nw_up = true;
            Quectel_common_interface.bits.roaming = false;
        }
        else if(strstr(ptr+5,"1,5") != NULL)            /* Registered to roaming network */
        {
            Quectel_common_interface.bits.gsm_nw_up = true;
            Quectel_common_interface.bits.roaming = true;
        }
        else if(strstr(ptr+5,"0,1") != NULL)             /* Network Registration not requested yet; First network registration */
        {
            Quectel_send_command_and_check_response("AT+CREG=1\r\n","OK\r\n",NULL,0,5,true);
            Quectel_send_command_and_check_response("AT&W0\r\n","OK\r\n",NULL,0,5,true);  
            Quectel_common_interface.bits.gsm_nw_up = true;
        }
        else if(strstr(ptr+5,"1,2") != NULL)            /* Trying to register to home network */
            return false;
        else if(strstr(ptr+5,"1,3") != NULL)            /* Network Registration denied */
            fail_flag = true;
        else 
            return false;
    }

    if((strlen(Quectel_common_interface.svc_provider) == 0))    // && (strlen(app_settings.svr_config.apn) == 0))
    {
        /* Get service provider name */
        Quectel_send_command_and_check_response("AT+QSPN\r\n","OK\r\n",buf,48,5,true);
        ptr = Quectel_data_from_response(buf,"QSPN");
        if(ptr == NULL) 
        {
            Quectel_common_interface.bits.gsm_nw_up = false;
            fail_flag = true;
        }
        else
        {
            if((ptr1 = strstr(ptr,",\"")) != NULL)
            {
                ptr1+= 2;
                if((ptr2 = strstr(ptr1,",\"")) != NULL)
                {
                    if((ptr3 = strstr(ptr2,"\",")) != NULL)
                    {
                        *ptr3 = '\0';
                        sprintf(Quectel_common_interface.svc_provider,"%s",ptr2+2);                        
                    }

                }
            }
        }
    }
#if 0        
    /* Activate RTC */
    if(!sim800_send_command_and_check_response("AT+CLTS?\r\n","CLTS: 1",NULL,0,5,true))
    {
        sim800_send_command_and_check_response("AT+CLTS=1\r\n","OK\r\n",NULL,0,5,true);
        sim800_send_command_and_check_response("AT&W0\r\n","OK\r\n",NULL,0,5,true);
    }
#endif
    if(fail_flag == true)
    {
        Quectel_common_interface.nw_reg_fail_counter += 1;
        return false;
    }
    
    return true;    
    
}


void Run_routine_check_up_script(void)
{
    char buf[64], *ptr, *ptr1, *ptr2;
    uint16_t    vbat = 0,temp = 0;
    float       vbat_percentage = 0;
    
    
    // Task 1: Check periodically if SIM card not found.
    if(!Quectel_common_interface.bits.sim_detected)
    {
        if(detect_sim_card)
        {
            if(Detect_SIM_card())
                Quectel_common_interface.bits.sim_detected = true;
            
            // Reset flag.
            detect_sim_card = false;
        }
    }
    
    // Task 2: Check battery voltage level.
    if(check_battery_voltage)
    {
        // Send command.
        Quectel_send_command_and_check_response("AT+CBC\r\n","OK\r\n",buf,48,1,true);
        ptr = Quectel_data_from_response(buf,"CBC");
        
        if(ptr == NULL)
        {
            /* Required command not found */
        }
        else
        {
            // *ptr indicates ME charging or not charging status.
            ptr += 2;
            // *ptr indicates remaining battery capacity percentage.
            ptr1 = strstr(ptr,",");
            // *ptr1 indicates battery voltage in mV.
            ptr2 = strstr(ptr1,"\r\n");
            ptr2 = '\0';
            ptr1 += 1;
            vbat = atoi(ptr1);
            
            // Calculate remaining active battery voltage percentage.
            temp = vbat - QUECTEL_OPERATING_VOLTAGE_MIN;
            vbat_percentage = ((float)temp) / ((float)Quectel_common_interface.battery_operating_volt_range);
            vbat_percentage = vbat_percentage * ((float)100);
            
            if(vbat_percentage < 20)
            {
               LOW_BATTERY_INDICATION_WRITE = HIGH; 
               
               // Check lower limit of battery percentage to operate.
               if(vbat_percentage < 8)
               {
                   // Turn off module power in such low battery state.
                   Quectel_send_command_and_check_response("AT+QPOWD=1\r\n","POWERED DOWN",buf,48,60,true);
               }
            }
            else if(vbat_percentage >= 21)
                LOW_BATTERY_INDICATION_WRITE = LOW;
                
        }
        
        // Reset flag.
        check_battery_voltage = false;
    }
    

}