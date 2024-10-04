/*
 * File:   App_gps_common_interface.c
 * Author: 2020
 *
 * Created on June 7, 2022, 6:19 PM
 */

#include "App_gps_comm_interface.h"

gps_common_interface_t  gps_common_interface;


uint8_t Get_gnss_state(void)
{
    char buff[32];
    char *ptr;
    
    // Send command and check response.
    Quectel_send_command_and_check_response("AT+QGPS?\r\n","OK\r\n",buff,48,5,true);
    ptr = Quectel_data_from_response(buff,"QGPS");
    
    if(ptr == NULL)
    {
        // Expected response not found.
        return 5;
    }
    
    // Check the state.
    if(*ptr == '1')
        return true;
    else if(*ptr == '0')
        return false;
    else
    {
        /* Do Nothing */
    }
    
    return false;
}

bool Turn_on_gnss(void)
{
    
    // Send command.
    if(Quectel_send_command_and_check_response("AT+QGPS=1","OK\r\n",NULL,0,5,true))
        return true;
    
    return false;
}

bool Turn_off_gnss(void)
{
    
    // Send command.
    if(Quectel_send_command_and_check_response("AT+QGPSEND","OK\r\n",NULL,0,5,true))
        return true;
    
    return false;
}


void App_quectel_gps_interface_setup(void)
{
    
    /* GPS-GNSS part is auto start by the modem on power up */
    
    uint8_t ret = 10;
    char buf[32];
    
    // Check GPS-GNSS state.
    ret = Get_gnss_state();
    if(ret == 1)
    {
        // GPS-GNSS is ON.Set flag.
        gps_common_interface.bits.gps_gnss_service_enabled = true;
    }
    else if(ret == 0)
    {
        // GPS-GNSS is off. Set flag.
        gps_common_interface.bits.gps_gnss_service_enabled = false;
        return;
    }
    else if(ret == 5)
    {
        // GPS_GNSS command not found.
        gps_common_interface.bits.gps_gnss_service_enabled = false;
        return;        
    }
    
    // Initialize NMEA parser.
    InitializeNMEA(gps_common_interface.nmea_sentence_buff, sizeof(gps_common_interface.nmea_sentence_buff));
    
    // Configure GNSS sentence in NMEA standard.
    if(Quectel_send_command_and_check_response("AT+QGPSCFG=\"nmeasrc\",1\r\n","OK\r\n",buf,32,5,true))
        gps_common_interface.bits.nmea_configured = true;
    
}


void Get_GPS_location_info(void)
{
    char buf[255], *ptr, *ptr1, c;
    uint8_t len = 0, counter = 0,test = 0;
    
    // Check flag to fetch GPS-GNSS information.
    if(get_gps_info)
    {
        // Check current gps state.
        if(Get_gnss_state())
        {
            if(!gps_common_interface.bits.nmea_configured)
            {
                // Configure GNSS sentence in NMEA standard.
                if(Quectel_send_command_and_check_response("AT+QGPSCFG=\"nmeasrc\",1\r\n","OK\r\n",buf,32,5,true))
                    gps_common_interface.bits.nmea_configured = true;
                else
                    return;
            }
                
            
            // Get GNSS data in configured standard.
            Quectel_send_command_and_check_response("AT+QGPSGNMEA=\"RMC\"\r\n","OK\r\n",buf,255,4,true);
            ptr = Quectel_data_from_response(buf,"QGPSGNMEA");
            
            if(ptr == NULL)
                return;
            
            // Check GPS fix quality.
            ptr1 = ptr;
            ptr1+= 17;
            if(*ptr1 == 'V') /* V = void */
            {
                gps_common_interface.latitude = 0;
                gps_common_interface.longitude = 0;
                gps_common_interface.speed = 0;
            }
            else if(*ptr1 == 'A') /* A = Active */
            {
                // Copy the NMEA sentence.
                strcpy(gps_common_interface.nmea_sentence_buff,ptr);
                len = strlen(gps_common_interface.nmea_sentence_buff);

                // Apply NMEA parser to get parameters.
                while(len != 0)
                {
                    c = gps_common_interface.nmea_sentence_buff[counter];
                    if(process(c))
                    {
                        test++;
                        break;                    
                    }
                    len--;
                    counter++;
                }

                // Check NMEA sentence processing status.
                if(_unknownsentencehandler != true &&
                   _badchecksumhandler != true)
                {
                    // Get parameter.
                    gps_common_interface.latitude = getLatitude();
                    gps_common_interface.longitude = getLongitude();
                    gps_common_interface.speed = getSpeed();
                    gps_common_interface.numSattelites = getNumSatellites();                
                }                
            }
            else
            {
                // Error in NMEA sentence or improper sentence.
                gps_common_interface.latitude = 0;
                gps_common_interface.longitude = 0;
                gps_common_interface.speed = 0;                
            }
            
            
        }
        
        
        // Reset flag.
        get_gps_info = false;
        _unknownsentencehandler = false;
        _badchecksumhandler = false;
    }
}


void Handle_GPS_GNSS_network_error(void)
{
    
    if(gps_common_interface.bits.gps_gnss_network_down &&
       gprs_comm_interface.bits.mqtt_service_up)
    {
        // Set notifier LED blinking frequency.
        notifier_LED_blink_freq = NOTIFIER_LED_BLINK_FREQ_GPS_NW_DOWN;
    }
    
    if(!gps_common_interface.bits.gps_gnss_network_down &&
       gprs_comm_interface.bits.mqtt_service_up)
    {
        // Set notifier LED blinking frequency.
        notifier_LED_blink_freq = NOTIFIER_LED_BLINK_FREQ_HEALTH_OK;
    }
        
        
}