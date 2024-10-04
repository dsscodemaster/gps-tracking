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
#ifndef _BSP_H
#define	_BSP_H

#include <xc.h>

#ifdef __cplusplus
extern "C" {
#endif
   
    #define BSP_SWITCH_STATE_PRESSED        1
    #define BSP_SWITCH_STATE_UNPRESSED      0
    
    /* *************************************S******************************** */
    /*  Section: Controller ports and pins used for Flash Memory              */
    /* ********************************************************************** */
    #define W25QXXXF_SS_PORT                   B
    #define W25QXXXF_SS_PIN                    8

    #define W25QXXXF_RESET_PORT                C
    #define W25QXXXF_RESET_PIN                 4

    #define W25QXXXF_SCK_PORT                  B
    #define W25QXXXF_SCK_PIN                   7

    #define W25QXXXF_SDO_PORT                  B
    #define W25QXXXF_SDO_PIN                   5

    #define W25QXXXF_SDI_PORT                  B
    #define W25QXXXF_SDI_PIN                   6

    #define W25QXXXF_WP_PORT                   A
    #define W25QXXXF_WP_PIN                    14

    #define W25QXXXF_HOLD_PORT                 C
    #define W25QXXXF_HOLD_PIN                  5

    /* *************************************S******************************** */
    /* Section: Controller ports and pins used for MODEM                      */
    /* ********************************************************************** */
    #define QUECTEL_TX_PORT                     B
    #define QUECTEL_TX_PIN                      12

    #define QUECTEL_RX_PORT                     B
    #define QUECTEL_RX_PIN                      13    

    #define QUECTEL_RESET_PORT                  C
    #define QUECTEL_RESET_PIN                   9

    /* *************************************S******************************** */
    /*  Section: Controller ports and pins used for Peripheral                */
    /* ********************************************************************** */    
    #define METAL_SENSOR_INPUT_PORT             B
    #define METAL_SENSOR_INPUT_PIN              9

    #define NOTIFIER_LED_OUTPUT_PORT            A
    #define NOTIFIER_LED_OUTPUT_PIN             8

    #define VIBRATOR_MOTOR_CONTROL_PORT         C
    #define VIBRATOR_MOTOR_CONTROL_PIN          1

    #define LOW_BATTERY_INDICATION_PORT         C
    #define LOW_BATTERY_INDICATION_PIN          0
    
    /* ********************************************************************** */
    /* Section: I/O Register mapping macros                                   */
    /* ********************************************************************** */    
    #define _TRIS_REG_BIT(x,y)	TRIS##x##bits.TRIS##x##y
    #define TRIS_REG_BIT(x,y)	_TRIS_REG_BIT(x,y)

    #define _LAT_REG_BIT(x,y)	LAT##x##bits.LAT##x##y
    #define LAT_REG_BIT(x,y)	_LAT_REG_BIT(x,y)

    #define _PORT_REG_BIT(x,y)	PORT##x##bits.R##x##y
    #define PORT_REG_BIT(x,y)	_PORT_REG_BIT(x,y)

    #define _CNPU_REG_BIT(x,y)	CNPU##x##bits.CNPU##x##y
    #define CNPU_REG_BIT(x,y)	_CNPU_REG_BIT(x,y)    

    #define _CNPD_REG_BIT(x,y)	CNPD##x##bits.CNPD##x##y
    #define CNPD_REG_BIT(x,y)	_CNPD_REG_BIT(x,y)    

    #define BSP_SwitchStateGet(x)   x
    #define BSP_LEDStateGet(x)      x
    #define BSP_LEDStateSet(x,y)    x = y
    #define BSP_LEDToggle(x)        x ^= 1

    
    /* ********************************************************************** */
    /* Section: Controller Hardware PIN profile                               */
    /* ********************************************************************** */    
    #define NOTIFIER_LED_TRIS       TRIS_REG_BIT(NOTIFIER_LED_OUTPUT_PORT,NOTIFIER_LED_OUTPUT_PIN)
    #define NOTIFIER_LED_WRITE      LAT_REG_BIT(NOTIFIER_LED_OUTPUT_PORT,NOTIFIER_LED_OUTPUT_PIN)
    #define NOTIFIER_LED_READ       PORT_REG_BIT(NOTIFIER_LED_OUTPUT_PORT,NOTIFIER_LED_OUTPUT_PIN)
    #define NOTIFIER_LED_PULLUP     CNPU_REG_BIT(NOTIFIER_LED_OUTPUT_PORT,NOTIFIER_LED_OUTPUT_PIN)
    #define NOTIFIER_LED_PULLDOWN   CNPD_REG_BIT(NOTIFIER_LED_OUTPUT_PORT,NOTIFIER_LED_OUTPUT_PIN)
    #define NOTIFIER_LED            LATAbits.LATA8

    #define METAL_SENSOR_TRIS       TRIS_REG_BIT(METAL_SENSOR_INPUT_PORT,METAL_SENSOR_INPUT_PIN)
    #define METAL_SENSOR_WRITE      LAT_REG_BIT(METAL_SENSOR_INPUT_PORT,METAL_SENSOR_INPUT_PIN)
    #define METAL_SENSOR_READ       PORT_REG_BIT(METAL_SENSOR_INPUT_PORT,METAL_SENSOR_INPUT_PIN)
    #define METAL_SENSOR_PULLUP     CNPU_REG_BIT(METAL_SENSOR_INPUT_PORT,METAL_SENSOR_INPUT_PIN)
    #define METAL_SENSOR_PULLDOWN   CNPD_REG_BIT(METAL_SENSOR_INPUT_PORT,METAL_SENSOR_INPUT_PIN)
    #define METAL_SENSOR_IOC_L2H     IOCPBbits.IOCPB9
    #define METAL_SENSOR_IOC_H2L     IOCNBbits.IOCNB9
    #define METAL_SENSOR_IOC_FLAG    IOCFBbits.IOCFB9

    #define VIBRATOR_MOTOR_CONTROL_TRIS     TRIS_REG_BIT(VIBRATOR_MOTOR_CONTROL_PORT,VIBRATOR_MOTOR_CONTROL_PIN)
    #define VIBRATOR_MOTOR_CONTROL_WRITE    LAT_REG_BIT(VIBRATOR_MOTOR_CONTROL_PORT,VIBRATOR_MOTOR_CONTROL_PIN)
    #define VIBRATOR_MOTOR_CONTROL_READ     PORT_REG_BIT(VIBRATOR_MOTOR_CONTROL_PORT,VIBRATOR_MOTOR_CONTROL_PIN)
    #define VIBRATOR_MOTOR_CONTROL_PULLUP   CNPU_REG_BIT(VIBRATOR_MOTOR_CONTROL_PORT,VIBRATOR_MOTOR_CONTROL_PIN)
    #define VIBRATOR_MOTOR_CONTROL_PULLDOWN CNPD_REG_BIT(VIBRATOR_MOTOR_CONTROL_PORT,VIBRATOR_MOTOR_CONTROL_PIN)

    #define LOW_BATTERY_INDICATION_TRIS     TRIS_REG_BIT(LOW_BATTERY_INDICATION_PORT,LOW_BATTERY_INDICATION_PIN)
    #define LOW_BATTERY_INDICATION_WRITE    LAT_REG_BIT(LOW_BATTERY_INDICATION_PORT,LOW_BATTERY_INDICATION_PIN)
    #define LOW_BATTERY_INDICATION_READ     PORT_REG_BIT(LOW_BATTERY_INDICATION_PORT,LOW_BATTERY_INDICATION_PIN)
    #define LOW_BATTERY_INDICATION_PULLUP   CNPU_REG_BIT(LOW_BATTERY_INDICATION_PORT,LOW_BATTERY_INDICATION_PIN)
    #define LOW_BATTERY_INDICATION_PULLDOWN CNPD_REG_BIT(LOW_BATTERY_INDICATION_PORT,LOW_BATTERY_INDICATION_PIN)

    

#ifdef	__cplusplus
}
#endif /* __cplusplus */

#endif	/* _BSP_H */

