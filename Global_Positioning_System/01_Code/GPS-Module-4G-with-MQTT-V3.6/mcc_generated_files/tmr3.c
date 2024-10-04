
/**
  TMR3 Generated Driver API Source File 

  @Company
    Microchip Technology Inc.

  @File Name
    tmr3.c

  @Summary
    This is the generated source file for the TMR3 driver using PIC24 / dsPIC33 / PIC32MM MCUs

  @Description
    This source file provides APIs for driver for TMR3. 
    Generation Information : 
        Product Revision  :  PIC24 / dsPIC33 / PIC32MM MCUs - 1.75.1
        Device            :  PIC24FJ256GA705
    The generated drivers are tested against the following:
        Compiler          :  XC16 v1.35
        MPLAB             :  MPLAB X v5.05
*/

/*
    (c) 2016 Microchip Technology Inc. and its subsidiaries. You may use this
    software and any derivatives exclusively with Microchip products.

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
    WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
    PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION
    WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION.

    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
    BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
    FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
    ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
    THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.

    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE
    TERMS.
*/

/**
  Section: Included Files
*/

#include <xc.h>
#include "tmr3.h"
#include "../hardware/bsp.h"


/**
  Section: Data Type Definitions
*/
uint8_t     time_delay_counter = 0;
uint8_t     notifier_LED_blink_freq = NOTIFIER_LED_BLINK_FREQ_DEFAULT;
uint16_t    location_update_interval_counter = 0;
uint16_t    gps_data_tx_interval_counter = 0;
uint16_t    battery_voltage_check_interval_counter = 0;
uint8_t     check_sim_card_interval_cnt = 0;
bool        get_gps_info = false;
bool        send_gps_info = false;
bool        detect_sim_card = true;
bool        check_battery_voltage = true;

/** TMR Driver Hardware Instance Object

  @Summary
    Defines the object required for the maintainence of the hardware instance.

  @Description
    This defines the object required for the maintainence of the hardware
    instance. This object exists once per hardware instance of the peripheral.

  Remarks:
    None.
*/

typedef struct _TMR_OBJ_STRUCT
{
    /* Timer Elapsed */
    bool                                                    timerElapsed;
    /*Software Counter value*/
    uint8_t                                                 count;

} TMR_OBJ;

static TMR_OBJ tmr3_obj;

/**
  Section: Driver Interface
*/

void TMR3_Initialize (void)
{
    //TMR3 0; 
    TMR3 = 0x00;
    //Period = (1/TMR3_CALLBACK_FREQUENCY) s; Frequency = 16000000 Hz; PR3 (62500/TMR3_CALLBACK_FREQUENCY); 
    PR3 = (0xF424/TMR3_CALLBACK_FREQUENCY);
    //TCKPS 1:256; TON enabled; TSIDL disabled; TCS FOSC/2; TECS SOSC; TGATE disabled; 
    T3CON = 0x8030;

    
    IFS0bits.T3IF = false;
    IEC0bits.T3IE = true;
	
    tmr3_obj.timerElapsed = false;

}



void __attribute__ ( ( interrupt, no_auto_psv ) ) _T3Interrupt (  )
{
    //***User Area Begin

    TMR3_CallBack();

    //***User Area End
    
    /* Check if the Timer Interrupt/Status is set */
    tmr3_obj.count++;
    tmr3_obj.timerElapsed = true;
    IFS0bits.T3IF = false;
}


void TMR3_Period16BitSet( uint16_t value )
{
    /* Update the counter values */
    PR3 = value;
    /* Reset the status information */
    tmr3_obj.timerElapsed = false;
}

uint16_t TMR3_Period16BitGet( void )
{
    return( PR3 );
}

void TMR3_Counter16BitSet ( uint16_t value )
{
    /* Update the counter values */
    TMR3 = value;
    /* Reset the status information */
    tmr3_obj.timerElapsed = false;
}

uint16_t TMR3_Counter16BitGet( void )
{
    return( TMR3 );
}


void __attribute__ ((weak)) TMR3_CallBack(void)
{
    // Increment and check time delay counter.
    if(notifier_LED_blink_freq != 0 &&
       ++time_delay_counter >= notifier_LED_blink_freq)
    {
        // Toggle notifier LED.
        BSP_LEDToggle(NOTIFIER_LED);        
        
        // Reset counter.
        time_delay_counter = 0;
    }
    
    // Check and increment GPS location fetch interval counter.
    if(get_gps_info == false &&
       ++location_update_interval_counter >= TMR3_CALLBACK_FREQUENCY*gprs_comm_interface.gps_location_update_interval)
    {
        // Set flag.
        get_gps_info = true;
        
        // Reset counter.
        location_update_interval_counter = 0;
        
    }
    
    // Check and increment GPS data transmit interval counter.
    if(++gps_data_tx_interval_counter >= TMR3_CALLBACK_FREQUENCY*gprs_comm_interface.gps_data_tx_interval)
    {
        // Set flag.
        send_gps_info = true;
        
        // Reset counter.
        gps_data_tx_interval_counter = 0;
    }
    
    // Check and increment battery voltage level check interval counter.
    if(++battery_voltage_check_interval_counter >= TMR3_CALLBACK_FREQUENCY*BATTERY_VOLTAGE_CHECKING_INTERVAL)
    {
        // Set flag.
        check_battery_voltage = true;
        
        // Reset counter.
        battery_voltage_check_interval_counter = 0;
    }
    
    // Check & increment detect SIM card interval counter.
    if(detect_sim_card == false &&
       ++check_sim_card_interval_cnt >= TMR3_CALLBACK_FREQUENCY*CHECK_SIM_CARD_INTERVAL)
    {
        // Set flag.
        detect_sim_card = true;
        
        // Reset counter.
        check_sim_card_interval_cnt = 0;
    }
    

}

void TMR3_Start( void )
{
    /* Reset the status information */
    tmr3_obj.timerElapsed = false;

    /*Enable the interrupt*/
    IEC0bits.T3IE = true;

    /* Start the Timer */
    T3CONbits.TON = 1;
}

void TMR3_Stop( void )
{
    /* Stop the Timer */
    T3CONbits.TON = false;

    /*Disable the interrupt*/
    IEC0bits.T3IE = false;
}

bool TMR3_GetElapsedThenClear(void)
{
    bool status;
    
    status = tmr3_obj.timerElapsed;

    if(status == true)
    {
        tmr3_obj.timerElapsed = false;
    }
    return status;
}

int TMR3_SoftwareCounterGet(void)
{
    return tmr3_obj.count;
}

void TMR3_SoftwareCounterClear(void)
{
    tmr3_obj.count = 0; 
}

/**
 End of File
*/
