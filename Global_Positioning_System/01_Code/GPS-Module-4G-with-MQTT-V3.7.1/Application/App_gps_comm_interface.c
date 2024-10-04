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
    char buff[64];
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
    // Turn on GNSS with relative specific parameter for GPS-GNSS accuracy.
    // Send command.
    if(Quectel_send_command_and_check_response("AT+QGPS=1,255,3,0,1\r\n","OK\r\n",NULL,0,5,true))
        return true;
    
    return false;
}

bool Turn_off_gnss(void)
{
    
    // Send command.
    if(Quectel_send_command_and_check_response("AT+QGPSEND\r\n","OK\r\n",NULL,0,5,true))
        return true;
    
    return false;
}


void App_quectel_gps_interface_setup(void)
{
    
    /* GPS-GNSS part is auto start by the modem on power up */
    
    uint8_t ret = 10;
    char buf[32];
    
    // Configure Assisted-GPS or AGPS; here AGPS is configured by default.
    // Enable AGPS feature.
    Quectel_send_command_and_check_response("AT+QAGPS=1\r\n","OK\r\n",NULL,0,2,true);
    
    // Check GPS-GNSS state.
    CHECK_GPS:
    ret = Get_gnss_state();
    if(ret == 1)
    {
        // GPS-GNSS is ON.Set flag.
        gps_common_interface.bits.gps_gnss_service_enabled = true;
    }
    else if(ret == 0)
    {
        // Turn on GPS-GNSS.
        if(Turn_on_gnss())
        {
            goto CHECK_GPS;
        }
        else
        {
            // GPS-GNSS is off. Set flag.
            gps_common_interface.bits.gps_gnss_service_enabled = false;
            return;            
        }
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
    bool get_data = true;
    
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
                
            
            // Get GGA format sentence.
            Quectel_send_command_and_check_response("AT+QGPSGNMEA=\"GGA\"\r\n","OK\r\n",buf,255,4,true);
            ptr = Quectel_data_from_response(buf,"QGPSGNMEA");
            
            if(ptr == NULL)
                return;
            
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
                // Check fix quality.
                if(!_isValid)
                {
                    // NMEA sentence is void.
                    gps_common_interface.latitude = 0;
                    gps_common_interface.longitude = 0;                
                }
                else
                {
                    // Get all accuracy parameters.
                    gps_common_interface.fixQuality = getFixQuality();
                    gps_common_interface.numSattelites = getNumSatellites();
                    gps_common_interface.hdop = getHDOP();
                    
                    if(gps_common_interface.fixQuality < 4)
                    {
                        if((gps_common_interface.hdop >= 13 ||                   /* HDOP should not be greater than 1.3 */
                           gps_common_interface.numSattelites < 4) &&
                           gps_common_interface.accuracy_fail_counter < HDOP_THRESHOLD_FAIL_COUNTER)
                        {
                           get_data = false;
                           gps_common_interface.accuracy_fail_counter++;
                        }
                        else if(gps_common_interface.accuracy_fail_counter >= HDOP_THRESHOLD_FAIL_COUNTER &&
                                gps_common_interface.hdop > 20)
                        {
                           get_data = false;
                           gps_common_interface.accuracy_fail_counter++;                            
                        }
                            
                        
                    }
                    
                    // Fetch position data.
                    if(get_data)
                    {
                        gps_common_interface.latitude = getLatitude();
                        gps_common_interface.longitude = getLongitude();

                        gps_common_interface.accuracy_fail_counter = 0;
                    }
                    
                }                 
            }
            else
            {
                // Error in NMEA sentence or improper sentence.
            } 
            
            // --------------------------------------------------------------------
            
            *ptr = NULL, c= NULL, len = 0, counter = 0;
            _unknownsentencehandler = false, _badchecksumhandler = false; 
            memset(buf,'\0',sizeof(buf));
            memset(gps_common_interface.nmea_sentence_buff,'\0',sizeof(gps_common_interface.nmea_sentence_buff));
            
            // Get RMC format sentence.
            Quectel_send_command_and_check_response("AT+QGPSGNMEA=\"RMC\"\r\n","OK\r\n",buf,255,4,true);
            ptr = Quectel_data_from_response(buf,"QGPSGNMEA");
            
            if(ptr == NULL)
                return;            
            
            // Check GPS fix quality.
            ptr1 = ptr;
            ptr1+= 17;
            if(*ptr1 == 'V') /* V = void */
            {
                // NMEA sentence is void.
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
                    gps_common_interface.speed = getSpeed();                
                }
            }
            else
            {
                // Error in NMEA sentence or improper sentence.                
            }
            
            
        }
        else
        {
            Turn_on_gnss();
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