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

#ifndef __TICK_H_
#define __TICK_H_

/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
#include <stdint.h>
#include <xc.h>
#include "../mcc_generated_files/clock.h"

#ifdef __cplusplus
extern "C" {
#endif

    #ifdef __PIC32MZ
        #define SYSTEM_TIMERT_CLOCK_INPUT   SYS_CLK_BUS_PERIPHERAL_3
    #elif defined __PIC32MX
        #define SYSTEM_TIMERT_CLOCK_INPUT   SYS_CLK_BUS_PERIPHERAL_1
    #elif defined __dsPIC30
        #define SYSTEM_TIMERT_CLOCK_INPUT   16000000ul
    #elif defined __PICC18__
        #define SYSTEM_TIMERT_CLOCK_INPUT   16000000ul
    #elif defined __XC8
        #define SYSTEM_TIMERT_CLOCK_INPUT   16000000ul
	#else 
		#define SYSTEM_TIMERT_CLOCK_INPUT   16000000ul
    #endif    
	// All TICKS are stored as 32-bit unsigned integers.
	// This is deprecated since it conflicts with other TICK definitions used in
	// other Microchip software libraries and therefore poses a merge and mainainance
	// problem.  Instead of using the TICK data type, just use the base uint32_t data
	// type instead.
	typedef __attribute__((__deprecated__)) uint32_t TICK;
	
    /* ************************************************************************** */
    /* Section: Constants                                                         */
    /* ************************************************************************** */

	// This value is used by TCP and other modules to implement timeout actions.
	// For this definition, the Timer must be initialized to use a 1:256 pre-scalar
	// in tick.c.  If using a 32kHz watch crystal as the time base, modify the
	// tick.c file to use no pre-scalar.
	#define TICKS_PER_SECOND        ((SYSTEM_TIMERT_CLOCK_INPUT+128ull)/256ull)  // Internal core clock drives timer with 1:64 prescaler
	//#define TICKS_PER_SECOND      (32768ul)                               // 32kHz crystal drives timer with no scalar

	#if defined(__XC8)
		// Represents one second in Ticks
		#define TICK_SECOND             (TICKS_PER_SECOND)
		// Represents one minute in Ticks
		#define TICK_MINUTE             (TICKS_PER_SECOND*60ull)
		// Represents one hour in Ticks
		#define TICK_HOUR               (TICKS_PER_SECOND*3600ull)
	#else
		// Represents one second in Ticks
		#define TICK_SECOND             ((uint64_t)TICKS_PER_SECOND)
		// Represents one minute in Ticks
		#define TICK_MINUTE             ((uint64_t)TICKS_PER_SECOND*60ull)
		// Represents one hour in Ticks
		#define TICK_HOUR               ((uint64_t)TICKS_PER_SECOND*3600ull)
	#endif /* __XC8 */

    // *****************************************************************************
    // Section: Data Types
    // *****************************************************************************


    // *****************************************************************************
    // Section: Interface Functions
    // *****************************************************************************
	void TickInit(void);
	void StartTickTimer(void);
	uint64_t tick_now(void);
	uint32_t TickGetDiv256(void);
	uint32_t TickGetDiv64K(void);
	uint32_t TickConvertToMilliseconds(uint32_t dwTickValue);
	void TickUpdate(void);

#ifdef __cplusplus
}
#endif

#endif   /*_TICK_H_ */
