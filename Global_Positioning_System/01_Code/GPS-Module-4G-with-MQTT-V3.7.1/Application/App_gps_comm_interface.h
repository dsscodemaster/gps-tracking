/* Microchip Technology Inc. and its subsidiaries.  You may use this software 
 * and any derivatives exclusively with Microchip products. 
 * 
 * THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS".  NO WARRANTIES, WHETHER 
 * EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED 
 * WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A 
 * PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION 
 * WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION. 
 *
 * IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
 * INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
 * WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS 
 * BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE.  TO THE 
 * FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS 
 * IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF 
 * ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *
 * MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE 
 * TERMS. 
 */

/* 
 * File:   
 * Author: 
 * Comments:
 * Revision history: 
 */

// This is a guard condition so that contents of this file are not included
// more than once.  
#ifndef _APP_GPS_COMM_INTERFACE_H
#define	_APP_GPS_COMM_INTERFACE_H

#include "App_setup.h"
#include "../GPS_GNSS/NMEA_parser.h"

#define KNOT_TO_KMPH_MUL_FACTOR         1.852
#define HDOP_THRESHOLD_FAIL_COUNTER     30

#ifdef	__cplusplus
extern "C" {
#endif /* __cplusplus */

    /* Data structure of the used data nodes Start */
    
    typedef struct
    {
        char    nmea_sentence_buff[128];
        long    latitude;
        long    longitude;
        long    speed;
        long    course;
        char    navsystem;
        uint8_t numSattelites;
        uint8_t hdop;
        uint8_t fixQuality;
        char    talkerID;
        char    msgID[6];
        uint8_t accuracy_fail_counter;
        
        union
        {
            struct
            {
                uint8_t gps_gnss_service_enabled: 1;
                uint8_t gps_gnss_network_down: 1;
                uint8_t nmea_configured: 1;
                uint8_t resrvd: 5;
                
            }bits;
            
            uint8_t flags;
        };
        
        
    }gps_common_interface_t;
    
    /* Data structure of the used data nodes End */
    
    /* Global variable declarations */
    
    extern gps_common_interface_t       gps_common_interface;
        
    /* Implemented function declarations */
    
    void App_quectel_gps_interface_setup(void);
    uint8_t Get_gps_state(void);
    bool Turn_on_gnss(void);
    bool Turn_off_gnss(void);
    void Get_GPS_location_info(void);
    void Handle_GPS_GNSS_network_error(void);
    

#ifdef	__cplusplus
}
#endif /* __cplusplus */

#endif	/* _APP_GPS_COMM_INTERFACE_H */

