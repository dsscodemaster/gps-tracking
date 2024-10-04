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
 * Author: Mrinmoy
 * Comments:
 * Revision history: 
 */

// This is a guard condition so that contents of this file are not included
// more than once.  
#ifndef _APP_QUECTEL_COMMON_INTERFACE_H
#define	_APP_QUECTEL_COMMON_INTERFACE_H

#include "App_setup.h"

#ifdef	__cplusplus
extern "C" {
#endif
    
#define SERVICE_PROVIDER_NAME_VODAFONE      "Vodafone IN"
#define SERVICE_PROVIDER_NAME_AIRTEL        "airtel"
#define SERVICE_PROVIDER_NAME_IDEA          "idea"
#define SERVICE_PROVIDER_NAME_BSNL          "bsnl"
#define SERVICE_PROVIDER_NAME_JIO           "Jio"
#define SERVICE_PROVIDER_NAME_RELIANCE      "reliance"
#define SERVICE_PROVIDER_NAME_AIRCEL        "aircel"
#define SERVICE_PROVIDER_NAME_MTNL          "mtnl"
#define SERVICE_PROVIDER_NAME_TDOCOMO       "tata docomo"

#define GPRS_APN_NAME_VODAFONE              "www"
#define GPRS_APN_NAME_AIRTEL                "airtelgprs.com"
#define GPRS_APN_NAME_IDEA                  "internet"
#define GPRS_APN_NAME_BSNL                  "bsnllive"
#define GPRS_APN_NAME_JIO                   "jionet"
#define GPRS_APN_NAME_RELIANCE              "rcomwap"
#define GPRS_APN_NAME_AIRCEL                "aircelgprs"
#define GPRS_APN_NAME_MTNL                  "mtnl.net"
#define GPRS_APN_NAME_TDOCOMO               "TATA.DOCOMO.DIVE.IN"
    
#define SIM_DETECTION_INTERVAL              5       // In seconds.
#define QUECTEL_OPERATING_VOLTAGE_MAX       4200    // In mV.
#define QUECTEL_OPERATING_VOLTAGE_MIN       2500    // In mV.

    typedef enum 
    { 
        VODAFONE = 0,AIRTEL,IDEA,BSNL,JIO,RELIANCE,AIRCEL,MTNL,TDOCOMO,
        SVC_PROVIDER_COUNT 
    }SERVICE_PROVIDER_LIST;
          
        
#define SIM_CHARSETSTR_GSM          "GSM"       //GSM 7 bit default alphabet (3GPP TS 23.038);
#define SIM_CHARSETSTR_UCS2         "UCS2"      /*16-bit universal multiple-octet coded character set (ISO/IEC10646); 
                                                UCS2 character strings are converted to hexadecimal numbers from 0000 to FFFF; e.g.
                                                "004100620063" equals three 16-bit characters with decimal values 65, 98 and 99*/
#define SIM_CHARSETSTR_IRA          "IRA"       //International reference alphabet (ITU-T T.50)
#define SIM_CHARSETSTR_HEX          "HEX"       //Character strings consist only of hexadecimal numbers from 00 to FF;
#define SIM_CHARSETSTR_PCCP         "PCCP"      //PC character set Code
#define SIM_CHARSETSTR_PCDN         "PCDN"      //PC Danish/Norwegian character set
#define SIM_CHARSETSTR_ISO8859_L1   "8859-1"    //ISO 8859 Latin 1 character set
    
#define BATTERY_VOLTAGE_CHECKING_INTERVAL       60  // In seconds.
    
    /* Data structure of the used data nodes Start */
    
    typedef enum
    {
        SIM_CHARSET_GSM = 0,
        SIM_CHARSET_UCS2,
        SIM_CHARSET_IRA,
        SIM_CHARSET_HEX,
        SIM_CHARSET_PCCP,
        SIM_CHARSET_PCDN,
        SIM_CHARSET_ISO8589_L1
    }SIM800_TE_CHARSET;
    
#ifdef USE_WHITELIST   
    typedef struct
    {
        char                number[16];
        bool                is_valid_number;
    }sim800c_whitelist_info_t;
#endif
    
    typedef struct
    {
        char                        imei_no[32];
        char                        pin[8];
        char                        imsi_no[32];
        char                        sim_iccid[32];
        char                        *svc_provider_list[SVC_PROVIDER_COUNT];
        char                        svc_provider[16];
        SERVICE_PROVIDER_LIST       svc_provider_index;
        uint8_t                     signal_strength;
        uint8_t                     signal_quality;
        SIM800_TE_CHARSET           te_charset;
        char                        te_charset_str[8];
        uint8_t                     sim_detection_interval;
        uint8_t                     nw_reg_fail_counter;
        uint16_t                    battery_operating_volt_range;
        uint8_t                     battery_remaining_volt_percentage;


        union
        {
            struct _quectel_common_data_bits_t
            {
                uint8_t sim_detected: 1;
                uint8_t gsm_nw_up: 1;
                uint8_t gprs_nw_up: 1;
                uint8_t gprs_nw_failure: 1;
                uint8_t roaming: 1;
                uint8_t reset: 1;
                uint8_t full_func_mode: 1;
                uint8_t fixed_baud_mode: 1;
                uint8_t detect_sim_card: 1;
            }bits;
            uint8_t flags;
        };
        
    }Quectel_common_interface_t;
    
    /* Data structure of the used data nodes End */
    
    /* Global variable declarations */
    
    extern Quectel_common_interface_t    Quectel_common_interface;
    
    /* Implemented function declarations */
    
    bool App_quectel_common_setup(void);
    bool App_quectel_configure_network_and_perform_registration(void);
    bool Quectel_signal_strength(void);
    void Run_routine_check_up_script(void);

#ifdef	__cplusplus
}
#endif


#endif	/* _APP_QUECTEL_COMMON_INTERFACE_H */

