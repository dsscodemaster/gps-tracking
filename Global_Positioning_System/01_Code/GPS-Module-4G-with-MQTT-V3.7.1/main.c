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
    
    // Initialize core system of MCU.
    SYSTEM_Initialize();
    
    // Operate vibration motor on start up once.
    VIBRATOR_MOTOR_CONTROL_WRITE = HIGH;
    delay_ms(1000);
    VIBRATOR_MOTOR_CONTROL_WRITE = LOW;
    
    // Initialize peripheral and application setup.
    System_Setup();    
    delay_ms(500);
    
    // Enable watchdog.
    //enable_watchdog();
    
//    // TESTING.
//    LOW_BATTERY_INDICATION_WRITE = HIGH;
//    delay_ms(1000);
//    LOW_BATTERY_INDICATION_WRITE = LOW;
//    
//    QUECTEL_RESET_WRITE = HIGH;
       
    for(;;)
    {
        App_task();
        
        // Reset WDT.
        //clear_watchdog_timer();
    }
    
    return 0;
}
