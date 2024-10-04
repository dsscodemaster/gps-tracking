
/**
  ADC1 Generated Driver File

  @Company
    Microchip Technology Inc.

  @File Name
    adc1.c

  @Summary
    This is the generated header file for the ADC1 driver using PIC24 / dsPIC33 / PIC32MM MCUs

  @Description
    This header file provides APIs for driver for ADC1.
    Generation Information :
        Product Revision  :  PIC24 / dsPIC33 / PIC32MM MCUs - pic24-dspic-pic32mm : 1.75.1
        Device            :  PIC24FJ256GA705
    The generated drivers are tested against the following:
        Compiler          :  XC16 v1.35
        MPLAB 	          :  MPLAB X v5.05
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
#include <delay.h>
#include "adc1.h"

/**
  Section: Data Type Definitions
*/

/* ADC Driver Hardware Instance Object

  @Summary
    Defines the object required for the maintenance of the hardware instance.

  @Description
    This defines the object required for the maintenance of the hardware
    instance. This object exists once per hardware instance of the peripheral.

 */
typedef struct
{
	uint8_t intSample;
}

ADC_OBJECT;

static ADC_OBJECT adc1_obj;

/**
  Section: Driver Interface
*/


void ADC1_Initialize (void)
{   
    // GLOBAL SETTINGS
    AD1CON1=0;
    AD1CON2=0;
    AD1CON3=0;
    
    // Configure the A/D voltage references.
    AD1CON2bits.PVCFG = 0;                      // Vref+ = AVdd
    AD1CON2bits.NVCFG0 = 0;                     // Vref- = AVss
    AD1CON1bits.ADSIDL = 0;                     // ADSIDL disabled;
    AD1CON1bits.MODE12 = 1;                     // 12 bit conversion mode
    AD1CON1bits.SSRC = 7;                       // Internal counter ends sampling and starts conversion
    AD1CON1bits.FORM = 0;                       // Output format is unsigned integer.
    
    // Configure buffer storage settings and interrupt generation.
    AD1CON2bits.BUFREGEN = 0;                   // Result buffer is an FIFO buffer.
    AD1CON2bits.BUFM = 0;                       // Always start saving result from ADC1BUF0
    AD1CON2bits.CSCNA = 1;                      // Scan Inputs
#ifndef __APP_DEBUG
    AD1CON2bits.SMPI = 3;                       // Generate interrupt after completing the conversion of 3rd channel
#else
    AD1CON2bits.SMPI = 5;                       // Generate interrupt after completing the conversion of 5th channel
#endif
    // Configure the A/D clock.
    AD1CON3bits.ADRC = 1;                       // Conversion clock derived from RC clock
    AD1CON3bits.ADCS = 3;                       // Divide RC clock by 4(TAD = 1uS @ 4 MIPS).
    AD1CON3bits.SAMC = 15;                      // ADC Sample clock = 15Tad
    
    // MUX A and MUX B +ve and -ve channel select
    AD1CHSbits.CH0SA = 0;                       // AN0
    AD1CHSbits.CH0NA = 0;                       // AVss
    AD1CHSbits.CH0SB = 30;                      // AVdd
    AD1CHSbits.CH0NB = 0;                       // AVss

    // Select MUX A Scan input channels 
    AD1CSSLbits.CSS0 = 1;                       // CSS0 -> AN0 enabled;    
    AD1CSSLbits.CSS1 = 1;                       // CSS1 -> AN1 enabled;
    AD1CSSHbits.CSS28 = 1;                      // CSS28 -> VBG enabled;
#ifdef __APP_DEBUG
    AD1CSSHbits.CSS29 = 1;                      // CSS29 -> AVSS enabled;
    AD1CSSHbits.CSS30 = 1;                      // CSS28 -> AVDD enabled;
#endif
    
    // DMABL Allocates 1 word of buffer to each analog input; 
    AD1CON4 = 0x0000;

    // ASEN disabled; WM Legacy operation; ASINT No interrupt; CM Less Than mode; BGREQ disabled; CTMREQ disabled; LPEN disabled; 
    AD1CON5bits.BGREQ = 1;          			// Band gap enabled

    // CTMEN30 disabled; CTMEN29 disabled; CTMEN28 disabled; 
    AD1CTMENH = 0x0000;

    // CTMEN5 disabled; CTMEN6 disabled; CTMEN7 disabled; CTMEN8 disabled; CTMEN9 disabled; CTMEN12 disabled; CTMEN13 disabled; CTMEN10 disabled; CTMEN0 disabled; CTMEN11 disabled; CTMEN1 disabled; CTMEN2 disabled; CTMEN3 disabled; CTMEN4 disabled; CTMEN14 disabled; CTMEN15 disabled; 
    AD1CTMENL = 0x0000;

    // AD1RESDMA 0; 
    AD1RESDMA = 0x0000;

    ANCFG = 0x0000;

    AD1CON1bits.ADON = 1;

    adc1_obj.intSample = AD1CON2bits.SMPI;
   
}

void ADC1_Start(void)
{
   AD1CON1bits.SAMP = 1;
}

void ADC1_Stop(void)
{
   AD1CON1bits.SAMP = 0;
}

uint16_t ADC1_ConversionResultBufferGet(uint16_t *buffer)
{
    int count;
    uint16_t *ADC16Ptr;

    ADC16Ptr = (uint16_t *)&(ADC1BUF0);

    for(count=0;count<=adc1_obj.intSample;count++)
    {
        buffer[count] = (uint16_t)*ADC16Ptr;
        ADC16Ptr++;
    }
    return count;
}
uint16_t ADC1_ConversionResultGet(void)
{
    return ADC1BUF0;
}
bool ADC1_IsConversionComplete( void )
{
    return AD1CON1bits.DONE; //Wait for conversion to complete   
}
void ADC1_ChannelSelect( ADC1_CHANNEL channel )
{
    AD1CHS = channel;
}


bool ADC1_Tasks (uint16_t *buffer)
{
    uint16_t n = 0;
    
    IFS0bits.AD1IF = 0;                     // clear ADC interrupt flag
    AD1CON1bits.ASAM = 1;                   // auto start sampling for 31Tad, then go to conversion
    while (!IFS0bits.AD1IF)                 // conversion done?
    {
        delay_ms(1);
        if(++n > 500)
        {
            AD1CON1bits.ASAM = 0; 
            return false;
        }
    }              
    AD1CON1bits.ASAM = 0;                   // yes then stop sample/convert
    ADC1_ConversionResultBufferGet(buffer);
    return true;
}


/**
  End of File
*/
