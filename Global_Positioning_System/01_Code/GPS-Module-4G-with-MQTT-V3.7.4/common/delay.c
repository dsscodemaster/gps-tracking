/* ************************************************************************** */
/*  Company:                                                                  */
/*    Microchip Technology Inc.                                               */
/*                                                                            */
/*  File Name:                                                                */
/*    main.c                                                                  */
/*                                                                            */
/*  Summary:                                                                  */
/*    This file contains the "main" function for an MPLAB Harmony project.    */
/*                                                                            */
/*  Description:                                                              */
/*    This file contains the "main" function for an MPLAB Harmony project.The */
/*    "main" function calls the "SYS_Initialize" function to initialize the   */
/*    state machines of all MPLAB Harmony modules in the system and it calls  */
/*    the "SYS_Tasks" function from within a system-wide "super" loop to      */
/*    maintain their correct operation. These two functions are implemented   */
/*    in configuration-specific files (usually "system_init.c" and            */
/*    "system_tasks.c") in a configuration-specific folder under the "src/    */
/*    system_config" folder within this project's top-level folder. An MPLAB  */
/*    Harmony project may have more than one configuration, each contained    */
/*    within it's own folder under the "system_config" folder.                */
/* ************************************************************************** */

/* ************************************************************************** */
/* Section: Included Files 												      */
/* ************************************************************************** */
#include <stdint.h>
#include "delay.h"

/* ************************************************************************** */
/* Section: Global Data Definitions											  */
/* ************************************************************************** */


/* ************************************************************************** */
/* Section: User Functions													  */
/* ************************************************************************** */
/**
  <p><b>Function:</b></p>

  <p><b>Summary:</b></p>

  <p><b>Description:</b></p>

  <p><b>Remarks:</b></p>
*/
void usDelay( uint32_t x)
{
    volatile unsigned long l;
    
    l = x*(SYS_CLK_FREQ/2000000ul);
    l = l/12;
    while(l > 0)
    { 
        l = l - 1; 
    }
}

/**
  <p><b>Function:</b></p>

  <p><b>Summary:</b></p>

  <p><b>Description:</b></p>

  <p><b>Remarks:</b></p>
 */
void delay_ms(uint32_t delay)
{
    uint32_t dly = delay;
    while( dly > 0 )
    {
        usDelay(1000);
        dly--;
    }
}

/* End of file */
