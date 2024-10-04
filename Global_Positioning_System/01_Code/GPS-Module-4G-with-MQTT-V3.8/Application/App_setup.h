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
#ifndef _APP_SETUP_H
#define	_APP_SETUP_H

#define DATA_VALIDATION_MAGIC_NUMBER            170887ul


#include <xc.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#include "../hardware/bsp.h"

#include "../common/delay.h"
#include "../common/tick.h"
#include "../common/custom_typedefs.h"


#include "../mcc_generated_files/system.h"
#include "../mcc_generated_files/pin_manager.h"
#include "../mcc_generated_files/tmr3.h"
#include "../mcc_generated_files/rtcc.h"


#include "../Quectel/Quectel_interface.h"
#include "../Quectel/Quectel_HWprofile.h"
#include "../W25WxxxF/w25qxxxf_interface.h"


#include "App_data_storage_interface.h"
#include "App_quectel_common_interface.h"
#include "App_gps_comm_interface.h"
#include "App_gprs_comm_interface.h"
#include "App_user_interface.h"






    #define enable_watchdog()           RCONbits.SWDTEN=1
    #define disable_watchdog()          RCONbits.SWDTEN=0
    #define clear_watchdog_event()      RCONbits.WDTO=0
    #define clear_watchdog_timer()      asm("CLRWDT")

    extern bool                         time_set_done;
    //#define __DEBUG                     1

    /* Implemented function declarations */

    void App_task(void);
    void System_Setup(void);
    void Quectel_interface_setup(void);
    void App_modem_interface_setup(void);
    bool time_now(char *);
    

#endif	/* _APP_SETUP_H */


