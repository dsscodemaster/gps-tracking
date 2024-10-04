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
#ifndef _APP_USER_INTERFACE_H
#define	_APP_USER_INTERFACE_H

#include "App_setup.h"

#define NOTIFIER_LED_BLINK_FREQ_DEFAULT         20      // 2 Seconds.
#define NOTIFIER_LED_BLINK_FREQ_HEALTH_OK       10      // 1 Second.
#define NOTIFIER_LED_BLINK_FREQ_GPS_NW_DOWN     5       // 0.5 Second.
#define NOTIFIER_LED_BLINK_FREQ_GPRS_NW_DOWN    2       // 0.2 Second.

#define CHECK_SIM_CARD_INTERVAL                 2       // In seconds.

#ifdef	__cplusplus
extern "C" {
#endif /* __cplusplus */

    /* Data structure of the used data nodes Start */

    typedef enum
    {
        ADDON_GPRS_DOWN_NOTIFICATION = 0,
        ADDON_FEATURE_COUNT
    }MODEM_ADDON_FEATURE_LIST;  
    
    typedef struct
    {
       char         apn[16];
       char         url[20];
       uint16_t     port;
       uint16_t     datarate;
    }svr_config_t;


    typedef union
    {
        struct __addon_feature_list_bits_t
        {
            uint8_t    gprs_down_notify: 1;
            uint8_t    metal_attached: 1;
            uint8_t    resvd: 6;
        }bits;
        uint8_t    all;
    }addon_feature_list_t;

    typedef struct
    {
        uint32_t                    magic_no;
        svr_config_t                svr_config;
        addon_feature_list_t        addon_feature;  
    }app_settings_t;

    extern app_settings_t       app_settings;   
    
    /* Data structure of the used data nodes End */
    
    /* Global variable declarations */
    
    
    /* Implemented function declarations */
    void App_user_interface_setup(void);
    void metal_attach_deattach_notifier_service(void);
    

#ifdef	__cplusplus
}
#endif /* __cplusplus */

#endif	/* _APP_USER_INTERFACE_H */

