/*
 * File:   App_gprs_comm_interface.c
 * Author: 2020
 *
 * Created on June 9, 2022, 5:08 PM
 */

#include "App_gprs_comm_interface.h"

gprs_comm_interface_t   gprs_comm_interface;
uint8_t                 error_handling_retry_cnt = 0;


static bool run_gprs_connection_script(void)
{   
    
    char buf[64] = {'\0'},resp_buf[64],*ptr,*ptr1,*ptr2;
    bool skip = false;
    
    if(!Quectel_common_interface.bits.gsm_nw_up)
        return false;
      
        
    //clear_watchdog_timer();
    Quectel_common_interface.bits.gprs_nw_up = false;
    switch(gprs_comm_interface.setup_state)
    {
        case GPRSSETUPSTATE_START:
            /* ----------------------------------------------------------------------- */
            /*                  GPRS CONNECTION INDICATION SETTING                     */
            /* ----------------------------------------------------------------------- */
#if 0 
            if(!sim800_send_command_and_check_response("AT+CNETLIGHT?\r\n","CNETLIGHT: 1",NULL,0,5,true))
            {
                sim800_send_command_and_check_response("AT+CNETLIGHT=1\r\n","OK\r\n",NULL,0,5,true);
                sim800_send_command_and_check_response("AT&W0\r\n","OK\r\n",NULL,0,5,true);
            }
#endif            
            gprs_comm_interface.setup_state = GPRSSETUPSTATE_ATTACH_TO_GPRS_SERVICE;
        
        case GPRSSETUPSTATE_ATTACH_TO_GPRS_SERVICE:
            /* ----------------------------------------------------------------------- */
            /*                  GPRS ATTACHMENT PROCESS                                */
            /* ----------------------------------------------------------------------- */            
            if(!gprs_comm_interface.bits.gprs_service_enabled)
            {
                if(Quectel_send_command_and_check_response("AT+CGATT?\r\n","OK\r\n",resp_buf,48,5,true))
                {
                    if(!strstr(resp_buf,"+CGATT: 1"))
                    {
                        if(Quectel_send_command_and_check_response("AT+CGATT=1\r\n","OK\r\n",NULL,0,20,true))
                            return false;
                    }
                    gprs_comm_interface.bits.gprs_service_enabled = true;
                }
            }
        
            gprs_comm_interface.setup_state = GPRSSETUPSTATE_APN_SETTING;
            
        case GPRSSETUPSTATE_APN_SETTING:
            /* ----------------------------------------------------------------------- */
            /*                  DEFINE PACKET DATA PROTOCOL(PDP) CONTEXT               */
            /* ----------------------------------------------------------------------- */            
            // Check PDP context state.
            if(Quectel_send_command_and_check_response("AT+CGACT?\r\n","+CGACT: 1,1",NULL,48,5,true))
                skip = true;
            
            if(!skip)
            {
                if(strstr(Quectel_common_interface.svc_provider,SERVICE_PROVIDER_NAME_VODAFONE) != NULL)
                    sprintf(app_settings.svr_config.apn,"%s",GPRS_APN_NAME_VODAFONE);
                else if(strstr(Quectel_common_interface.svc_provider,SERVICE_PROVIDER_NAME_AIRTEL) != NULL)
                    sprintf(app_settings.svr_config.apn,"%s",GPRS_APN_NAME_AIRTEL);
                else if(strstr(Quectel_common_interface.svc_provider,SERVICE_PROVIDER_NAME_IDEA) != NULL)
                    sprintf(app_settings.svr_config.apn,"%s",GPRS_APN_NAME_IDEA);
                else if(strstr(Quectel_common_interface.svc_provider,SERVICE_PROVIDER_NAME_BSNL) != NULL)
                    sprintf(app_settings.svr_config.apn,"%s",GPRS_APN_NAME_BSNL);
                else if(strstr(Quectel_common_interface.svc_provider,SERVICE_PROVIDER_NAME_JIO) != NULL)
                    sprintf(app_settings.svr_config.apn,"%s",GPRS_APN_NAME_JIO);
                else if(strstr(Quectel_common_interface.svc_provider,SERVICE_PROVIDER_NAME_RELIANCE) != NULL)
                    sprintf(app_settings.svr_config.apn,"%s",GPRS_APN_NAME_RELIANCE);
                else if(strstr(Quectel_common_interface.svc_provider,SERVICE_PROVIDER_NAME_AIRCEL) != NULL)
                    sprintf(app_settings.svr_config.apn,"%s",GPRS_APN_NAME_AIRCEL);
                else if(strstr(Quectel_common_interface.svc_provider,SERVICE_PROVIDER_NAME_MTNL) != NULL)
                    sprintf(app_settings.svr_config.apn,"%s",GPRS_APN_NAME_MTNL);
                else if(strstr(Quectel_common_interface.svc_provider,SERVICE_PROVIDER_NAME_TDOCOMO) != NULL)
                    sprintf(app_settings.svr_config.apn,"%s",GPRS_APN_NAME_TDOCOMO);
    #if 0
                sprintf(buf,"AT+SAPBR=3,1,\"APN\",\"%s\"\r\n",app_settings.svr_config.apn);
    #endif
                sprintf(buf,"AT+CGDCONT=%d,\"IP\",\"%s\"\r\n",gprs_comm_interface.gprs_info.pdp_cid,app_settings.svr_config.apn);
                if(!Quectel_send_command_and_check_response(buf,"OK\r\n",NULL,0,5,true))
                    return false;                
            }
            
            gprs_comm_interface.setup_state = GPRSSETUPSTATE_ACTIVATE_PDP;
            
        case GPRSSETUPSTATE_ACTIVATE_PDP:
            /* ----------------------------------------------------------------------- */
            /*                  PACKET DATA PROTOCOL(PDP) ACTIVATION PROCESS           */
            /* ----------------------------------------------------------------------- */            
            if(!skip)
            {
                memset(buf,'\0',sizeof(buf));
                sprintf(buf,"AT+CGACT=1,%d\r\n",gprs_comm_interface.gprs_info.pdp_cid);
                if(!Quectel_send_command_and_check_response(buf,"OK\r\n",NULL,0,30,true))
                    return false;                 
            }
            
            gprs_comm_interface.setup_state = GPRSSETUPSTATE_NW_REGISTRATION;
            
        case GPRSSETUPSTATE_NW_REGISTRATION:
            /* ----------------------------------------------------------------------- */
            /*                  GPRS NETWORK REGISTRATION SETTING                      */
            /* ----------------------------------------------------------------------- */    
            Quectel_send_command_and_check_response("AT+CGREG?\r\n","OK\r\n",resp_buf,48,5,true);
            ptr = Quectel_data_from_response(resp_buf,"CGREG");
            if(ptr != NULL)
            {
                if(strstr(ptr,"1,1") != NULL)
                {
                    Quectel_common_interface.bits.gprs_nw_up = true;
                    gprs_comm_interface.bits.data_roaming = false;
                }
                else if(strstr(ptr,"1,5") != NULL)
                {
                    Quectel_common_interface.bits.gprs_nw_up = true;
                    gprs_comm_interface.bits.data_roaming = true;
                }
                else if(strstr(ptr,"0,1") != NULL)
                {
                    Quectel_send_command_and_check_response("AT+CGREG=1\r\n","OK\r\n",NULL,0,5,true);
                    Quectel_send_command_and_check_response("AT&W0\r\n","OK\r\n",NULL,0,5,true);
                    Quectel_common_interface.bits.gprs_nw_up = true;
                }
                else if(strstr(ptr,"1,2") != NULL)
                {
                    Quectel_common_interface.bits.gprs_nw_up = false;
                    return false;
                }
                else if(strstr(ptr,"1,3") != NULL)
                {
                    Quectel_common_interface.bits.gprs_nw_up = false;
                    return false;
                }
            }
            gprs_comm_interface.setup_state = GPRSSETUPSTATE_GET_IP_ADDR;
        
        case GPRSSETUPSTATE_GET_IP_ADDR:
            /* ----------------------------------------------------------------------- */
            /*                  GET ALLOCATED IP ADDRESS FOR PDP                           */
            /* ----------------------------------------------------------------------- */
            if(!skip)
            {
                memset(buf,'\0',sizeof(buf));
                sprintf(buf,"AT+CGPADDR=%d\r\n",gprs_comm_interface.gprs_info.pdp_cid);                
                Quectel_send_command_and_check_response(buf,"OK\r\n",resp_buf,48,5,true);
                ptr = Quectel_data_from_response(resp_buf,"CGPADDR");
                
                if(ptr == NULL)
                    return false;
                
                if((ptr1 = strstr(ptr,",\"")) != NULL)
                {
                    if((ptr2 = strstr(ptr1,"\"\r\n")) != NULL)
                    {
                        *ptr2 = '\0';
                        sprintf(gprs_comm_interface.gprs_info.ip,"%s",ptr1+2);
                    }
                }
            }
            
            gprs_comm_interface.setup_state = GPRSSETUPSTATE_CONNECTED;
            
        case GPRSSETUPSTATE_CONNECTED:    
            Quectel_common_interface.bits.gprs_nw_up = true;
            gprs_comm_interface.bits.gprs_connection_down = false;
            Quectel_common_interface.bits.gprs_nw_failure = false;
            gprs_comm_interface.nw_fail_th_timer = tick_now();
            gprs_comm_interface.gprs_task_start_timer = gprs_comm_interface.nw_fail_th_timer;
            return true;
    }

    return false;
}

static void set_status_code(uint8_t code)
{
    
    switch(code)
    {
//        case FAILED_TO_OPEN_NETWORK:
//            break;
        case NETWORK_OPENED_SUCCESSFULLY:
            gprs_comm_interface.mqtt_config_info.mqtt_client_network_status = NETWORK_OPENED_SUCCESSFULLY;
            break;
        case WRONG_PARAMETER:
            gprs_comm_interface.mqtt_config_info.mqtt_client_network_status = WRONG_PARAMETER;
            break;
        case MQTT_IDENTIFIER_IS_OCCUPIED:
            gprs_comm_interface.mqtt_config_info.mqtt_client_network_status = MQTT_IDENTIFIER_IS_OCCUPIED;
            break;
        case FAILED_TO_ACTIAVTE_PDP:
            gprs_comm_interface.mqtt_config_info.mqtt_client_network_status = FAILED_TO_ACTIAVTE_PDP;
            break;
        case FAILED_TO_PARSE_DOMAIN_NAME:
            gprs_comm_interface.mqtt_config_info.mqtt_client_network_status = FAILED_TO_PARSE_DOMAIN_NAME;
            break;
        case NETWORK_CONNECTION_ERROR:
            gprs_comm_interface.mqtt_config_info.mqtt_client_network_status = NETWORK_CONNECTION_ERROR;
            break;
        default:
            break;
    }
}

static void set_connection_status_code(uint8_t result, uint8_t ret_code)
{
    switch(result)
    {
        case PACKET_SENT_AND_ACKNOWLEDGEMENT_RECEIVED:
            gprs_comm_interface.mqtt_config_info.connection_packet_status = PACKET_SENT_AND_ACKNOWLEDGEMENT_RECEIVED;
            break;
        case PACKET_RETRANSMISSION:
            gprs_comm_interface.mqtt_config_info.connection_packet_status = PACKET_RETRANSMISSION;
            break;
        case FAILED_TO_SEND_PACKET:
            gprs_comm_interface.mqtt_config_info.connection_packet_status = FAILED_TO_SEND_PACKET;
            break;   
        default:
            break;
    }
    
    switch(ret_code)
    {
        case CONNECTION_ACCEPTED:
            gprs_comm_interface.mqtt_config_info.client_server_connection_status = CONNECTION_ACCEPTED;
            break;
        case CONNECTION_REFUSED_UNACCEPTABLE_PROTOCOL_VERSION:
            gprs_comm_interface.mqtt_config_info.client_server_connection_status = CONNECTION_REFUSED_UNACCEPTABLE_PROTOCOL_VERSION;
            break;
        case CONNECTION_REFUSED_IDENTIFIER_REJECTED:
            gprs_comm_interface.mqtt_config_info.client_server_connection_status = CONNECTION_REFUSED_IDENTIFIER_REJECTED;
            break;
        case CONNECTION_REFUSED_SERVER_UNAVAIABLE:
            gprs_comm_interface.mqtt_config_info.client_server_connection_status = CONNECTION_REFUSED_SERVER_UNAVAIABLE;
            break;
        case CONNECTION_REFUSED_BAD_USERNAME_OR_PASSWORD:
            gprs_comm_interface.mqtt_config_info.client_server_connection_status = CONNECTION_REFUSED_BAD_USERNAME_OR_PASSWORD;
            break;
        case CONNECTION_REFUSED_NOT_AUTHORIZED:
            gprs_comm_interface.mqtt_config_info.client_server_connection_status = CONNECTION_REFUSED_NOT_AUTHORIZED;
            break;            
        default:
            break;
    }
        
    
}

static uint8_t chartointeger(char *p)
{
    uint8_t int_val = 0;
    
    int_val = *((uint8_t *)p);
    int_val = int_val - '0';
    
    return int_val;
}


static void Run_mqtt_configuration_script(void)
{
    char buff[64];
    
    // Set MQTT version.
    sprintf(buff,"AT+QMTCFG=\"version\",%d,3\r\n",gprs_comm_interface.mqtt_config_info.client_idx);
    Quectel_send_command_and_check_response(buff,"OK\r\n",NULL,48,5,true);
    
    memset(buff,'\0',sizeof(buff));
    
    // Set packet data protocol cid used in MQTT.
    sprintf(buff,"AT+QMTCFG=\"pdpcid\",%d,%d\r\n",gprs_comm_interface.mqtt_config_info.client_idx,gprs_comm_interface.gprs_info.pdp_cid);
    Quectel_send_command_and_check_response(buff,"OK\r\n",NULL,48,5,true);
    
    memset(buff,'\0',sizeof(buff));
    
    // Set will configuration.
    sprintf(buff,"AT+QMTCFG=\"will\",%d,0\r\n",gprs_comm_interface.mqtt_config_info.client_idx);
    Quectel_send_command_and_check_response(buff,"OK\r\n",NULL,48,5,true);
    
    memset(buff,'\0',sizeof(buff));
    
    // Set packet timeout configuration.
    sprintf(buff,"AT+QMTCFG=\"timeout\",%d,%d,%d,0\r\n",gprs_comm_interface.mqtt_config_info.client_idx,
                                                        gprs_comm_interface.mqtt_config_info.packet_timeout,
                                                        gprs_comm_interface.mqtt_config_info.retry_times);
    Quectel_send_command_and_check_response(buff,"OK\r\n",NULL,48,5,true);
    
    memset(buff,'\0',sizeof(buff));
    
    // Set session type.
    sprintf(buff,"AT+QMTCFG=\"session\",%d,1\r\n",gprs_comm_interface.mqtt_config_info.client_idx);
    Quectel_send_command_and_check_response(buff,"OK\r\n",NULL,48,5,true);
    
    memset(buff,'\0',sizeof(buff));
    
    // Set keep-alive time for MQTT client.
    sprintf(buff,"AT+QMTCFG=\"keepalive\",%d,%u\r\n",gprs_comm_interface.mqtt_config_info.client_idx,
                                                     gprs_comm_interface.mqtt_config_info.keep_alive_time);
    Quectel_send_command_and_check_response(buff,"OK\r\n",NULL,48,5,true);
    
    memset(buff,'\0',sizeof(buff));
    
    // Set data receive mode configuration from server.
    sprintf(buff,"AT+QMTCFG=\"recv/mode\",%d,%d,%d\r\n",gprs_comm_interface.mqtt_config_info.client_idx,
                                                        gprs_comm_interface.mqtt_config_info.msg_recv_mode,
                                                        gprs_comm_interface.mqtt_config_info.msg_len_enable);
    Quectel_send_command_and_check_response(buff,"OK\r\n",NULL,48,5,true);
}


static bool run_mqtt_connection_script(void)
{
    char buff[255],resp_buf[255],*ptr;
    uint8_t client_idx = 0,nw_status_code = 10,conn_result = 10,conn_ret_code = 10;
    
    // Step 1: Configure MQTT client optional configuration before connection.
    Run_mqtt_configuration_script();
    
    // Step 2: Open a network for MQTT client.
    sprintf(buff,"AT+QMTOPEN=%d,\"%s\",%d\r\n",gprs_comm_interface.mqtt_config_info.client_idx,
                                               gprs_comm_interface.mqtt_config_info.server_config_info.url,
                                               gprs_comm_interface.mqtt_config_info.server_config_info.port);
    
    Quectel_send_command_and_check_response(buff,NULL,resp_buf,23,65,true);
    ptr = Quectel_data_from_response(resp_buf,"QMTOPEN");
    
    if(ptr == NULL)
    {
        return false;
    }
    
    // Check response.
    client_idx = chartointeger(ptr);
    if(client_idx == gprs_comm_interface.mqtt_config_info.client_idx)
    {
        ptr+= 2;
        if(*ptr == '-')
        {
            ptr++;
            nw_status_code = chartointeger(ptr);
        }
        else
        {
            nw_status_code = chartointeger(ptr);   
        }
        set_status_code(nw_status_code);
    }
    
    // Step 3: Connect MQTT client to server.
    if(gprs_comm_interface.mqtt_config_info.mqtt_client_network_status == NETWORK_OPENED_SUCCESSFULLY)
    {
        // Clear buffer.
        memset(buff,0,sizeof(buff));
        memset(resp_buf,0,sizeof(resp_buf));
        client_idx = 10;
        
        sprintf(buff,"AT+QMTCONN=%d,\"%s\",\"%s\",\"%s\"\r\n",gprs_comm_interface.mqtt_config_info.client_idx,
                                                              gprs_comm_interface.mqtt_config_info.server_config_info.client_id,
                                                              gprs_comm_interface.mqtt_config_info.server_config_info.client_username,
                                                              gprs_comm_interface.mqtt_config_info.server_config_info.client_password);
        Quectel_send_command_and_check_response(buff,NULL,resp_buf,25,65,true);
        ptr = Quectel_data_from_response(resp_buf,"QMTCONN");
        
        if(ptr == NULL)
        {
            return false;
        }

        // Check response.
        client_idx = chartointeger(ptr);
        if(client_idx == gprs_comm_interface.mqtt_config_info.client_idx)
        {
            // Pointer located at connection result status in response buffer.
            ptr+= 2;
            conn_result = chartointeger(ptr);
            
            // pointer located at connection return code in response buffer.
            ptr+= 2;
            conn_ret_code = chartointeger(ptr);

            set_connection_status_code(conn_result,conn_ret_code);
        }
    }
    
    if(gprs_comm_interface.mqtt_config_info.client_server_connection_status == CONNECTION_ACCEPTED &&
       gprs_comm_interface.mqtt_config_info.connection_packet_status == PACKET_SENT_AND_ACKNOWLEDGEMENT_RECEIVED)
    {
        gprs_comm_interface.bits.mqtt_service_up = true;
        return true;
    }
        
    return false; 
}



void App_quectel_gprs_interface_setup(void)
{
    if(run_gprs_connection_script())
        run_mqtt_connection_script();
    
}

static bool prepare_data_buffer_to_send(char *buffer)
{
    double lat,log,alt,speed;

    if(gps_common_interface.speed == 0 || gps_common_interface.latitude == 0 ||
       gps_common_interface.longitude == 0)
    {
        gps_common_interface.bits.gps_gnss_network_down = true;
        return false;
    }
    else
        gps_common_interface.bits.gps_gnss_network_down = false;
        
    
    speed = (gps_common_interface.speed * KNOT_TO_KMPH_MUL_FACTOR);
    speed /= 1000;
    
    lat = (gps_common_interface.latitude / ((double)1000000));
    log = (gps_common_interface.longitude / ((double)1000000));
    alt = (gps_common_interface.altitude / ((double)1000));
    
//    if(alt != 0)
//    {
//        sprintf(buffer,"%s,%.6lf,%.6lf,%.1lf,%.3lf,%u,%u",gprs_comm_interface.datastats.macid,lat,log,alt,speed,
//                                                        Quectel_common_interface.battery_remaining_volt_percentage,
//                                                        app_settings.addon_feature.bits.metal_attached);        
//    }
//    else
//    {
        sprintf(buffer,"%s,%.6lf,%.6lf,%.3lf,%u,%u",gprs_comm_interface.datastats.macid,lat,log,speed,
                                                    Quectel_common_interface.battery_remaining_volt_percentage,
                                                    app_settings.addon_feature.bits.metal_attached);
        //sprintf(buffer,"%s,%.6lf,%.6lf,%u",gprs_comm_interface.datastats.macid,lat,log,gps_access_counter);        
    //}
    
    return true;
}

void Send_GPS_location_to_server(void)
{
    char data_buff[128],send_buff[128],resp_buff[64],*ptr;
    uint8_t len = 0,timeout = 0,test = 0,client_idx = 10,result = 10;
    
    if(send_gps_info)
    {
        if(gprs_comm_interface.bits.mqtt_service_up)
        {
            if(prepare_data_buffer_to_send(data_buff))
            {
                len = strlen(data_buff);

                // Prepare command.
                sprintf(send_buff,"AT+QMTPUBEX=%d,1,2,0,\"%s\",%d\r\n",gprs_comm_interface.mqtt_config_info.client_idx,
                                                                       gprs_comm_interface.mqtt_config_info.server_config_info.topic,
                                                                       len);
                if(Quectel_send_command_and_check_response(send_buff,">",resp_buff,25,10,true))
                {
                    // Calculate maximum time to response.
                    timeout = (gprs_comm_interface.mqtt_config_info.packet_timeout * gprs_comm_interface.mqtt_config_info.retry_times);
                    Quectel_send_command_and_check_response(data_buff,NULL,resp_buff,26,timeout,true);
                    ptr = Quectel_data_from_response(resp_buff,"QMTPUBEX");

                    if(ptr != NULL)
                    {
                        // Pointer position located at client index in response.
                        client_idx = chartointeger(ptr);
                        if(client_idx == gprs_comm_interface.mqtt_config_info.client_idx)
                        {
                            // client index matched.
                            ptr+= 4;

                            // pinter located at result of last publish message command.
                            result = chartointeger(ptr);
                            switch(result)
                            {
                                case MESSAGE_SENT_AND_ACKNOWLEDGEMENT_RECEIVED:
                                    gprs_comm_interface.mqtt_config_info.last_pub_msg_status = MESSAGE_SENT_AND_ACKNOWLEDGEMENT_RECEIVED;
                                    gprs_comm_interface.datastats.pkt_sent++;
                                    gprs_comm_interface.datastats.last_sent_pkt_time = tick_now();
                                    gprs_comm_interface.bits.data_sent_success = true;
                                    break;
                                case MESSAGE_RETRANSMISSION:
                                    gprs_comm_interface.mqtt_config_info.last_pub_msg_status = MESSAGE_RETRANSMISSION;
                                    break;
                                case FAILED_TO_SEND_MESSAGE:
                                    gprs_comm_interface.mqtt_config_info.last_pub_msg_status = FAILED_TO_SEND_MESSAGE;
                                    gprs_comm_interface.datastats.pkt_unsent++;
                                    gprs_comm_interface.bits.data_sent_success = false;
                                    gprs_comm_interface.bits.mqtt_service_up = false;
                                    gprs_comm_interface.network_error_handling_state = CHECK_MQTT_CONNECTION;
                                    Quectel_common_interface.bits.detect_sim_card = true;
                                    break; 
                                default:
                                    break;
                            }
                        }
                    }
                }
                else
                {
                    // Check response buffer.
                    if(strstr(resp_buff,"ERROR"))
                    {
                        gprs_comm_interface.bits.mqtt_service_up = false;
                        gprs_comm_interface.network_error_handling_state = CHECK_MQTT_CONNECTION;
                        Quectel_common_interface.bits.detect_sim_card = true;
                    }                
                }
            }            
        }

        // Reset flag.
        test++;
        send_gps_info = false;
    }
    
}

void Handle_GPRS_MQTT_network_error(void)
{
    char resp_buff[64],buff[64],*ptr;
    uint8_t client_idx = 10,state = 10;
    
    if(!gprs_comm_interface.bits.mqtt_service_up)
    {
        // Set notifier LED blinking frequency.
        notifier_LED_blink_freq = NOTIFIER_LED_BLINK_FREQ_GPRS_NW_DOWN;
        
        // Check SIM card presence.
        if(Quectel_common_interface.bits.detect_sim_card)
        {
            if(Detect_SIM_card())
                Quectel_common_interface.bits.sim_detected = true;
            else
            {
                Quectel_common_interface.bits.sim_detected = false;
                notifier_LED_blink_freq = 0;
                NOTIFIER_LED_WRITE = HIGH;
                return;
            }
            
            Quectel_common_interface.bits.detect_sim_card = false;
        }
        
        
        // Handle network error.
        switch(gprs_comm_interface.network_error_handling_state)
        {
            case CHECK_MQTT_CONNECTION:
                // wait for 10 seconds in case of mqtt is connecting state.
                if((tick_now() - gprs_comm_interface.mqtt_config_info.error_handling_delay_start) >= 10*TICK_SECOND)
                {
                    // Send command.
                    Quectel_send_command_and_check_response("AT+QMTCONN?\r\n",NULL,resp_buff,23,30,true);
                    ptr = Quectel_data_from_response(resp_buff,"QMTCONN");

                    if(ptr == NULL)
                        state = CONN_COMMAND_NOT_FOUND;
                    else
                    {
                        client_idx = chartointeger(ptr);
                        if(client_idx == gprs_comm_interface.mqtt_config_info.client_idx)
                        {
                            ptr+= 2;
                            state = chartointeger(ptr);
                        }
                    }

                    switch(state)
                    {
                        case MQTT_IS_CONNECTED:
                            gprs_comm_interface.bits.mqtt_service_up = true;
                            gprs_comm_interface.network_error_handling_state = CHECK_MQTT_CONNECTION;
                            
                            // Reset variables.
                            gprs_comm_interface.mqtt_config_info.error_handling_delay_start = 0;
                            error_handling_retry_cnt = 0;                            
                            break;
                        case MQTT_IS_INITIAL:

                        case CONN_COMMAND_NOT_FOUND:

                        case MQTT_IS_DISCONNECTING:
                            gprs_comm_interface.network_error_handling_state = CHECK_MQTT_NETWORK;
                            
                            // Reset variables.
                            gprs_comm_interface.mqtt_config_info.error_handling_delay_start = 0;
                            error_handling_retry_cnt = 0;                            
                            break;
                        case MQTT_IS_CONNECTING:
                            gprs_comm_interface.mqtt_config_info.error_handling_delay_start = tick_now();
                            if(++error_handling_retry_cnt >= 3)
                            {
                                // Reset variables.
                                gprs_comm_interface.mqtt_config_info.error_handling_delay_start = 0;
                                error_handling_retry_cnt = 0;
                                
                                // Set next state.
                                gprs_comm_interface.network_error_handling_state = CHECK_MQTT_NETWORK;
                            }
                            break;
                        default:
                            break;
                    }                        
                }
                
                break;
            case CHECK_MQTT_NETWORK:
                // Send command.
                Quectel_send_command_and_check_response("AT+QMTOPEN?\r\n",NULL,resp_buff,42,30,true);
                ptr = Quectel_data_from_response(resp_buff,"QMTOPEN");
                
                if(ptr == NULL)
                {
                    /* Network connection command not found */
                    gprs_comm_interface.network_error_handling_state = CHECK_GPRS_NETWORK_REGISTRATION;
                }
                else
                {
                    sprintf(buff,"+QMTOPEN: %d,\"%s\",%u",gprs_comm_interface.mqtt_config_info.client_idx,
                                                          gprs_comm_interface.mqtt_config_info.server_config_info.url,
                                                          gprs_comm_interface.mqtt_config_info.server_config_info.port);
                    if(strstr(ptr,buff))
                    {
                        /* Initiate to close the connection */
                    }
                    else
                    {
                        // connection with desired host and port not found. connection may be closed
                        gprs_comm_interface.network_error_handling_state = CHECK_GPRS_NETWORK_REGISTRATION;
                    }
                }  
                
                break;
            case CHECK_GPRS_NETWORK_REGISTRATION:
                // wait for 20 seconds in case of network searching state.
                if((tick_now() - gprs_comm_interface.mqtt_config_info.error_handling_delay_start) >= 20*TICK_SECOND)
                {
                    gprs_comm_interface.bits.gprs_service_enabled = false;
                    // Send command.
                    Quectel_send_command_and_check_response("AT+CGREG?\r\n",NULL,resp_buff,21,5,true);
                    ptr = Quectel_data_from_response(resp_buff,"CGREG");

                    if(ptr == NULL)
                        return;
                    else
                    {
                        // Get network registration status.
                        ptr+= 2;
                        state = chartointeger(ptr);

                        switch(state)
                        {
                            case REGISTERED_TO_HOME_NETWORK:

                            case REGISTERED_TO_ROAMING:
                                if(run_gprs_connection_script())
                                    run_mqtt_connection_script();
                                else
                                {
                                    if(!Quectel_common_interface.bits.gsm_nw_up)
                                        App_quectel_configure_network_and_perform_registration();
                                }
                                
                                // Reset variables.
                                gprs_comm_interface.mqtt_config_info.error_handling_delay_start = 0;
                                error_handling_retry_cnt = 0;
                                break;
                            case NOT_REGISTERED_NOT_SEARCHING:

                            case NOT_REGISTERED_BUT_SEARCHING:

                            case UNKNOWN_STATE:
                                gprs_comm_interface.mqtt_config_info.error_handling_delay_start = tick_now();
                                
                                if(++error_handling_retry_cnt >= 5)
                                {
                                    // Reset the modem; modem reset in turn cause MCU reset.
                                    QUECTEL_RESET_WRITE = HIGH;
                                }
                                break;

                            default:
                                break;
                        }
                    }                    
                }

                    
                break;                
            default:
                break;
        }
        
    }
}