/*
 * File:   App_Setup.c
 * Author: Mrinmoy
 *
 * Created on June 1, 2022, 4:38 PM
 */

#include "App_setup.h"

bool    time_set_done = false;

void Quectel_interface_setup(void)
{
    /* Set up UART communication interface and fetch ME related parameters, 
     * GSM network interface, GPS-GNSS interface, GPRS interface in packet data mode */
       
    //clear_watchdog_timer();
    App_quectel_common_setup();
    //clear_watchdog_timer();
    App_quectel_configure_network_and_perform_registration();
    //clear_watchdog_timer();
    App_quectel_gps_interface_setup();
    //clear_watchdog_timer();
    App_quectel_gprs_interface_setup();    
}


void App_modem_interface_setup(void)
{
    // Check modem initial power up state and SIM status.
    if(Quectel_power_up())
    {
        // Modem & SIM successfully powered up.
        // Go for interface setup.
        INTERFACE_SETUP:
        Quectel_interface_setup();
    }
    else
    {
        /* Check modem functionality initialization by command */
        if(Quectel_functionality_level())
            goto INTERFACE_SETUP;
    }    
}

bool time_now(char *ts)
{
    struct tm t;
    
    if(time_set_done != true)
    {
        App_quectel_common_get_local_timestamp(ts);
        if(strlen(ts) > 0)
        {
            sscanf(ts,"%d/%d/%d,%d-%d-%d",&t.tm_mday,&t.tm_mon,&t.tm_year,&t.tm_hour,&t.tm_min,&t.tm_sec);
            if((t.tm_mday>0) && (t.tm_mday<32) && (t.tm_mon>0) && (t.tm_mon<13) && (t.tm_year<99) && (t.tm_year>18))
            {
                RTCC_TimeSet(&t);
                time_set_done = true;
                goto GET_TIME;
            }
        }
    
        strcpy(ts,"");
        return false;
    }
GET_TIME:    
    RTCC_TimeGet(&t);
    sprintf(ts,"%02d/%02d/%02d,%02d-%02d-%02d",t.tm_mday,t.tm_mon,t.tm_year,t.tm_hour,t.tm_min,t.tm_sec);
    return true;    
}


void System_Setup(void)
{
    // Initialize module data nodes.
    memset((uint8_t *)&Quectel_common_interface,0,sizeof(Quectel_common_interface_t));    
    memset((uint8_t *)&gps_common_interface,0,sizeof(gps_common_interface_t));
    memset((uint8_t *)&gprs_comm_interface,0,sizeof(gprs_comm_interface_t));
    memset((uint8_t *)&app_settings,0,sizeof(app_settings_t));
    
    // User interface setup.
    App_user_interface_setup();    
    
    // Modem interface set up.
    App_modem_interface_setup();
    
    // Flash chip set up.
    if(w25qxxxf_interface_setup() == true)
    {
        flash_setup_success = true;
        clear_watchdog_timer();
        app_data_storage_interface_setup();
    }    
    
}


void App_task(void)
{
    if(Quectel_common_interface.bits.sim_detected)
    {
        // Task 1: GPS location fetching service.
        Get_GPS_location_info();

        // Task 2: GPS location transferring service.
        Send_GPS_location_to_server();

        // Task 3: GPS-GNSS network down handling service.
        Handle_GPS_GNSS_network_error();

        // Task 4: GPRS or MQTT network down handling service.
        Handle_GPRS_MQTT_network_error();

        // Task 5: Check offline data storage status.
        app_data_storage_location_data_maintainance_service();
    }

    
    // Task 5: Routine check-up service.
    Run_routine_check_up_script();
}

