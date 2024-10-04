/**
  System Interrupts Generated Driver File 

  @Company:
    Microchip Technology Inc.

  @File Name:
    pin_manager.c

  @Summary:
    This is the generated manager file for the MPLAB(c) Code Configurator device.  This manager
    configures the pins direction, initial state, analog setting.
    The peripheral pin select, PPS, configuration is also handled by this manager.

  @Description:
    This source file provides implementations for MPLAB(c) Code Configurator interrupts.
    Generation Information : 
        Product Revision  :  MPLAB(c) Code Configurator - pic24-dspic-pic32mm : 1.75.1
        Device            :  PIC24FJ256GA705
    The generated drivers are tested against the following:
        Compiler          :  XC16 v1.35
        MPLAB             :  MPLAB X v5.05

    Copyright (c) 2013 - 2015 released Microchip Technology Inc.  All rights reserved.

    Microchip licenses to you the right to use, modify, copy and distribute
    Software only when embedded on a Microchip microcontroller or digital signal
    controller that is integrated into your product or third party product
    (pursuant to the sublicense terms in the accompanying license agreement).

    You should refer to the license agreement accompanying this Software for
    additional information regarding your rights and obligations.

    SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
    EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
    MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
    IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
    CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
    OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
    INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
    CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
    SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
    (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.

*/


/**
    Section: Includes
*/
#include <xc.h> 
#include "../hardware/bsp.h"
#include "pin_manager.h"
#include "../common/custom_typedefs.h"
#include "../Quectel/Quectel_HWprofile.h"
#include "../Application/App_user_interface.h"

/**
    void PIN_MANAGER_Initialize(void)
*/
void PIN_MANAGER_Initialize(void)
{
    /****************************************************************************
     * Setting the Output Latch SFR(s)
     ***************************************************************************/
    LATA = 0x0000;
    LATB = 0x0000;
    LATC = 0x0000;

    /****************************************************************************
     * Setting the GPIO Direction SFR(s)
     ***************************************************************************/
    TRISA = 0xffff;
    TRISB = 0xffff;
    TRISC = 0xffff;

    /****************************************************************************
     * Setting the Weak Pull Up and Weak Pull Down SFR(s)
     ***************************************************************************/
    IOCPDA = 0x0000;
    IOCPDB = 0x0000;
    IOCPDC = 0x0000;
    IOCPUA = 0x0000;
    IOCPUB = 0x0000;
    IOCPUC = 0x0000;

    /****************************************************************************
     * Setting the Open Drain SFR(s)
     ***************************************************************************/
    ODCA = 0x0000;
    ODCB = 0x0000;
    ODCC = 0x0000;

    /****************************************************************************
     * Setting the Analog/Digital Configuration SFR(s)
     ***************************************************************************/
    ANSA = 0x0000;
    ANSB = 0x0000;
    ANSC = 0x0000;
    
    /***************************************************************************
    *   Setting Peripheral PIN State 
     **************************************************************************/
    NOTIFIER_LED_WRITE = LOW;
    QUECTEL_RESET_WRITE = LOW;
    METAL_SENSOR_WRITE = LOW;
    VIBRATOR_MOTOR_CONTROL_WRITE = LOW;
    LOW_BATTERY_INDICATION_WRITE = LOW;
    
    /***************************************************************************
    *   Setting Peripheral PIN Direction 
     **************************************************************************/
    NOTIFIER_LED_TRIS = OUTPUT;
    QUECTEL_RESET_TRIS = OUTPUT;
    METAL_SENSOR_TRIS = INPUT;
    VIBRATOR_MOTOR_CONTROL_TRIS = OUTPUT;
    LOW_BATTERY_INDICATION_TRIS = OUTPUT;
    
    /****************************************************************************
     * Set the PPS
     ***************************************************************************/
    __builtin_write_OSCCONL(OSCCON & 0xbf); // unlock PPS

    RPOR3bits.RP7R = 0x0008;      //RB7->SPI1:SCK1OUT;
    RPINR18bits.U1RXR = 0x0000;   //RB0->UART1:U1RX;
    RPOR6bits.RP12R = 0x0005;     //RB12->UART2:U2TX;
    RPOR2bits.RP5R = 0x0007;      //RB5->SPI1:SDO1;
    RPOR0bits.RP1R = 0x0003;      //RB1->UART1:U1TX;
    RPINR20bits.SDI1R = 0x0006;   //RB6->SPI1:SDI1;
    RPINR19bits.U2RXR = 0x000D;   //RB13->UART2:U2RX;

    __builtin_write_OSCCONL(OSCCON | 0x40); // lock   PPS
    
    /****************************************************************************
     * Setting UART control lines
     ***************************************************************************/ 
    //LAT_REG_BIT(QUECTEL_TX_PORT,QUECTEL_TX_PIN) = HIGH;
    
    // Global interrupt settings.
    IEC1bits.IOCIE = 1;     // Enable global IOC interrupt. 
    PADCONbits.IOCON = 1;   // Enable IOC functionality.
    IFS1bits.IOCIF = 0;     // Enable global IOC interrupt flag.
    
    // IOC interrupt settings.
    METAL_SENSOR_PULLUP = 1;
    METAL_SENSOR_IOC_L2H = 1;
    METAL_SENSOR_IOC_H2L = 1;
    METAL_SENSOR_IOC_FLAG = 0;
}

/* Interrupt service routine for the IOCI interrupt. */
void __attribute__ (( interrupt, no_auto_psv )) _IOCInterrupt ( void )
{
    if(IFS1bits.IOCIF == 1)
    {
        // Run service routine.
        metal_attach_deattach_notifier_service();
        
        // Clear the flag
        IFS1bits.IOCIF = 0;
    }
}
