/*
 * File:   main.c
 * Author: Mrinmoy
 *
 * Created on May 30, 2022, 3:35 PM
 */

#include "Application/App_setup.h"

int main(void) 
{
    // clear watchdog event.
    disable_watchdog();    
    
    // Setup system of application.
    SYSTEM_Initialize();
         
    // TESTING : MCU Reset detection.
    BSP_RELAY_2 = HIGH;
    delay_ms(2000);
    BSP_RELAY_2 = LOW;
    delay_ms(1000);
    
    // Initialize application and system setup.
    System_Setup();    
    delay_ms(500);
    
    // Enable watchdog.
    //enable_watchdog();
       
    for(;;)
    {
        App_task();
        
        // Reset WDT.
        //clear_watchdog_timer();
    }
    
    return 0;
}
