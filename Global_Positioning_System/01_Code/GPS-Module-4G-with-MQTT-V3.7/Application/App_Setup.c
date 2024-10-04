/*
 * File:   App_Setup.c
 * Author: 2020
 *
 * Created on June 1, 2022, 4:38 PM
 */

#include "App_setup.h"



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


void System_Setup(void)
{
    // Initialize module data nodes.
    memset((uint8_t *)&Quectel_common_interface,0,sizeof(Quectel_common_interface_t));    
    memset((uint8_t *)&gps_common_interface,0,sizeof(gps_common_interface_t));
    memset((uint8_t *)&gprs_comm_interface,0,sizeof(gprs_comm_interface_t));
    memset((uint8_t *)&app_settings,0,sizeof(app_settings_t));
    
    // User interface setup.
    App_user_interface_setup();    
    
    // Modem set up.
    App_modem_interface_setup();
    
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
    }

    
    // Task 5: Routine check-up service.
    Run_routine_check_up_script();
}

