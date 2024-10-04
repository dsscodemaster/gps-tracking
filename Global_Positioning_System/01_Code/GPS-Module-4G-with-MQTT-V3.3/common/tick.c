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

#define __TICK_C_

#include "tick.h"

// Internal counter to store Ticks.  This variable is incremented in an ISR and
// therefore must be marked volatile to prevent the compiler optimizer from
// reordering code to use this value in the main context while interrupts are
// disabled.
volatile uint32_t dwInternalTicks = 0;

// 6-byte value to store Ticks.  Allows for use over longer periods of time.
static volatile uint8_t vTickReading[6] __attribute__ ((aligned));

static void GetTickCopy(void);

typedef union 
{
    uint16_t Val;
    uint8_t v[2];
}TCPIP_UINT16_VAL;
/*****************************************************************************
  Function:
    void TickInit(void)

  Summary:
    Initializes the Tick manager module.

  Description:
    Configures the Tick module and any necessary hardware resources.

  Precondition:
    None

  Parameters:
    None

  Returns:
    None

  Remarks:
    This function is called only one during lifetime of the application.
  ***************************************************************************/
void TickInit(void)
{
#if defined(__XC8)
    // Use Timer0 for 8 bit processors
    // Initialize the time
    TMR0H = 0;
    TMR0L = 0;

    // Set up the timer interrupt
    INTCON2bits.TMR0IP = 0;     // Low priority
    INTCONbits.TMR0IF = 0;
    INTCONbits.TMR0IE = 1;      // Enable interrupt

    // Timer0 on, 16-bit, internal timer, 1:256 pre-scalar
    T0CON = 0x87;

#else
    // Use Timer 1 for 16-bit and 32-bit processors
    //3 = 1:256 pre-scale, 2 = 1:64 pre-scale,
    T1CONbits.TCKPS = 3;
    // Base
    PR1 = 0xFFFF;
    // Clear counter
    TMR1 = 0;

    // Enable timer interrupt
    #if defined(__XC16)
        IPC0bits.T1IP = 2;  // Interrupt priority 2 (low)
        IFS0bits.T1IF = 0;
        IEC0bits.T1IE = 1;
    #else
        IPC1bits.T1IP = 2;  // Interrupt priority 2 (low)
        IFS0CLR = _IFS0_T1IF_MASK;
        IEC0SET = _IEC0_T1IE_MASK;
    #endif
    
#endif
}

/*****************************************************************************
  Function:
    static void GetTickCopy(void)

  Summary:
    Reads the tick value.

  Description:
    This function performs an interrupt-safe and synchronized read of the
    48-bit Tick value.

  Precondition:
    None

  Parameters:
    None

  Returns:
    None
  ***************************************************************************/
static void GetTickCopy(void)
{
    // Perform an Interrupt safe and synchronized read of the 48-bit
    // tick value
#if defined(__XC8)
    do
    {
        INTCONbits.TMR0IE = 1;      // Enable interrupt
        Nop();
        INTCONbits.TMR0IE = 0;      // Disable interrupt
        vTickReading[0] = TMR0L;
        vTickReading[1] = TMR0H;
        *((uint32_t*)&vTickReading[2]) = dwInternalTicks;
    } while(INTCONbits.TMR0IF);
    INTCONbits.TMR0IE = 1;          // Enable interrupt
#elif defined(__XC16)
    do
    {
        uint32_t dwTempTicks;
        TCPIP_UINT16_VAL wTemp;

        IEC0bits.T1IE = 1;          // Enable interrupt
        Nop();
        IEC0bits.T1IE = 0;          // Disable interrupt

        // Get low 2 bytes
        wTemp.Val = TMR1;
        vTickReading[0] = wTemp.v[0];
        vTickReading[1] = wTemp.v[1];
        //((uint16_t*)vTickReading)[0] = TMR1;

        // Correct corner case where interrupt increments byte[4+] but
        // TMR1 hasn't rolled over to 0x0000 yet
        dwTempTicks = dwInternalTicks;
        //if(((uint16_t*)vTickReading)[0] == 0xFFFFu)
        if(wTemp.Val == 0xFFFFu)
            dwTempTicks--;

        // Get high 4 bytes
        vTickReading[2] = ((uint8_t*)&dwTempTicks)[0];
        vTickReading[3] = ((uint8_t*)&dwTempTicks)[1];
        vTickReading[4] = ((uint8_t*)&dwTempTicks)[2];
        vTickReading[5] = ((uint8_t*)&dwTempTicks)[3];
    } while(IFS0bits.T1IF);
    IEC0bits.T1IE = 1;              // Enable interrupt
#else   // PIC32
    do
    {
        uint32_t dwTempTicks;
        TCPIP_UINT16_VAL wTemp;

        IEC0SET = _IEC0_T1IE_MASK;  // Enable interrupt
        Nop();
        IEC0CLR = _IEC0_T1IE_MASK;  // Disable interrupt

        // Get low 2 bytes
        wTemp.Val = TMR1;
        vTickReading[0] = wTemp.v[0];
        vTickReading[1] = wTemp.v[1];
        //((volatile uint16_t*)vTickReading)[0] = TMR1;

        // Correct corner case where interrupt increments byte[4+] but
        // TMR1 hasn't rolled over to 0x0000 yet
        dwTempTicks = dwInternalTicks;

        // PIC32MX3XX/4XX devices trigger the timer interrupt when TMR1 == PR1
        // (TMR1 prescalar is 0x00), requiring us to undo the ISR's increment
        // of the upper 32 bits of our 48 bit timer in the special case when
        // TMR1 == PR1 == 0xFFFF.  For other PIC32 families, the ISR is
        // triggered when TMR1 increments from PR1 to 0x0000, making no special
        // corner case.
        // Get high 4 bytes
        vTickReading[2] = ((uint8_t*)&dwTempTicks)[0];
        vTickReading[3] = ((uint8_t*)&dwTempTicks)[1];
        vTickReading[4] = ((uint8_t*)&dwTempTicks)[2];
        vTickReading[5] = ((uint8_t*)&dwTempTicks)[3];
    } while(IFS0bits.T1IF);
    IEC0SET = _IEC0_T1IE_MASK;      // Enable interrupt
#endif
}


/*****************************************************************************
  Function:
    uint32_t TickGet(void)

  Summary:
    Obtains the current Tick value.

  Description:
    This function retrieves the current Tick value, allowing timing and
    measurement code to be written in a non-blocking fashion.  This function
    retrieves the least significant 32 bits of the internal tick counter,
    and is useful for measuring time increments ranging from a few
    microseconds to a few hours.  Use TickGetDiv256 or TickGetDiv64K for
    longer periods of time.

  Precondition:
    None

  Parameters:
    None

  Returns:
    Lower 32 bits of the current Tick value.
  ***************************************************************************/
uint64_t tick_now(void)
{
    uint64_t qw;

    GetTickCopy();
    ((uint8_t*)&qw)[0] = vTickReading[0];   // Note: This copy must be done one
    ((uint8_t*)&qw)[1] = vTickReading[1];   // byte at a time to prevent misaligned
    ((uint8_t*)&qw)[2] = vTickReading[2];   // memory reads, which will reset the PIC.
    ((uint8_t*)&qw)[3] = vTickReading[3];
    ((uint8_t*)&qw)[4] = vTickReading[4];
    ((uint8_t*)&qw)[5] = vTickReading[5];
    ((uint8_t*)&qw)[6] = 0;
    ((uint8_t*)&qw)[7] = 0;
    
    return qw;
}

/*****************************************************************************
  Function:
    uint32_t TickGetDiv256(void)

  Summary:
    Obtains the current Tick value divided by 256.

  Description:
    This function retrieves the current Tick value, allowing timing and
    measurement code to be written in a non-blocking fashion.  This function
    retrieves the middle 32 bits of the internal tick counter,
    and is useful for measuring time increments ranging from a few
    minutes to a few weeks.  Use TickGet for shorter periods or TickGetDiv64K
    for longer ones.

  Precondition:
    None

  Parameters:
    None

  Returns:
    Middle 32 bits of the current Tick value.
  ***************************************************************************/
uint32_t TickGetDiv256(void)
{
    uint32_t dw;

    GetTickCopy();
    ((uint8_t*)&dw)[0] = vTickReading[1];   // Note: This copy must be done one
    ((uint8_t*)&dw)[1] = vTickReading[2];   // byte at a time to prevent misaligned
    ((uint8_t*)&dw)[2] = vTickReading[3];   // memory reads, which will reset the PIC.
    ((uint8_t*)&dw)[3] = vTickReading[4];

    return dw;
}

/*****************************************************************************
  Function:
    uint32_t TickGetDiv64K(void)

  Summary:
    Obtains the current Tick value divided by 64K.

  Description:
    This function retrieves the current Tick value, allowing timing and
    measurement code to be written in a non-blocking fashion.  This function
    retrieves the most significant 32 bits of the internal tick counter,
    and is useful for measuring time increments ranging from a few
    days to a few years, or for absolute time measurements.  Use TickGet or
    TickGetDiv256 for shorter periods of time.

  Precondition:
    None

  Parameters:
    None

  Returns:
    Upper 32 bits of the current Tick value.
  ***************************************************************************/
uint32_t TickGetDiv64K(void)
{
    uint32_t dw;

    GetTickCopy();
    ((uint8_t*)&dw)[0] = vTickReading[2];   // Note: This copy must be done one
    ((uint8_t*)&dw)[1] = vTickReading[3];   // byte at a time to prevent misaligned
    ((uint8_t*)&dw)[2] = vTickReading[4];   // memory reads, which will reset the PIC.
    ((uint8_t*)&dw)[3] = vTickReading[5];

    return dw;
}


/*****************************************************************************
  Function:
    uint32_t TickConvertToMilliseconds(uint32_t dwTickValue)

  Summary:
    Converts a Tick value or difference to milliseconds.

  Description:
    This function converts a Tick value or difference to milliseconds.  For
    example, TickConvertToMilliseconds(32768) returns 1000 when a 32.768kHz
    clock with no prescaler drives the Tick module interrupt.

  Precondition:
    None

  Parameters:
    dwTickValue - Value to convert to milliseconds

  Returns:
    Input value expressed in milliseconds.

  Remarks:
    This function performs division on DWORDs, which is slow.  Avoid using
    it unless you absolutely must (such as displaying data to a user).  For
    timeout comparisons, compare the current value to a multiple or fraction
    of TICK_SECOND, which will be calculated only once at compile time.
  ***************************************************************************/
uint32_t TickConvertToMilliseconds(uint32_t dwTickValue)
{
    return (dwTickValue+(TICKS_PER_SECOND/2000ul))/((uint32_t)(TICKS_PER_SECOND/1000ul));
}


/*****************************************************************************
  Function:
    void TickUpdate(void)

  Description:
    Updates the tick value when an interrupt occurs.

  Precondition:
    None

  Parameters:
    None

  Returns:
    None
  ***************************************************************************/
void TickUpdate(void)
{        
    // Increment internal high tick counter
    dwInternalTicks++;
}

