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
#ifndef _QUECTEL_INTERFACE_H
#define	_QUECTEL_INTERFACE_H

#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#include "../common/tick.h"
#include "../common/delay.h"
#include "../mcc_generated_files/uart2.h"
#include "../Application/App_quectel_common_interface.h"


    /* Data structure of the used data nodes Start */


    /* Data structure of the used data nodes End  */

    /* Global variable declarations */


    /* Declarations of functions */
    bool Quectel_power_up(void);
    void Quectel_flush_received_data(void);
    bool Quectel_send_command_and_check_response(const char* cmd, char *expected_resp,
            char *rx_buf, uint16_t max_rx_len, uint32_t timeout,bool flag);
    char *Quectel_data_from_response(char *, const char *);
    bool Quectel_functionality_level(void);
    bool Detect_SIM_card(void);
    void MCU_interface_initialize(void);



#endif	/* _QUECTEL_INTERFACE_H */

