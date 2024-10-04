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
    /*
    #define BSP_LED_1                       LATKbits.LATK0
    #define BSP_LED_2                       LATJbits.LATJ15
    #define BSP_LED_3                       LATAbits.LATA9

    #define BSP_SWITCH_1                    PORTAbits.RA10
    #define BSP_SWITCH_2                    PORTHbits.RH9
    #define BSP_SWITCH_3                    PORTHbits.RH10
    */
    #define BSP_RELAY_1                     LATAbits.LATA10
    #define BSP_RELAY_2                     LATAbits.LATA7

    #define BSP_RELAY_1_TRIS                TRISAbits.TRISA10
    #define BSP_RELAY_2_TRIS                TRISAbits.TRISA7
    
    #define HEARTBEAT_INDICATOR             LATBbits.LATB4
    #define HEARTBEAT_INDICATOR_TRIS        TRISBbits.TRISB4

    #define VBAT_INPUT_IOTYPE               ANSAbits.ANSA1
    #define VBAT_INPUT_CONNECTION_TRIS      TRISAbits.TRISA1
    
    #define VDD_INPUT_IOTYPE                ANSAbits.ANSA0
    #define VDD_INPUT_CONNECTION_TRIS       TRISAbits.TRISA0
    #define VDD_INPUT_DIGITAL_LEVEL         PORTAbits.RA0

    /* ********************************************************************** */
    /* Section: Controller ports and pins used for MAX487                    */
    /* ********************************************************************** */
    #define RS485HD_REDE_PORT          	A
    #define RS485HD_REDE_PIN           	12
	
	#define RS485HD_RO_PORT             B
	#define RS485HD_RO_PIN				0

	#define RS485HD_DI_PORT             B
	#define RS485HD_DI_PIN				1
    
    /* *************************************S******************************** */
    /*  Section: Controller ports and pins used for  flash                    */
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

    #define QUECTEL_RESET_PORT                  B
    #define QUECTEL_RESET_PIN                   15

    /* *************************************S******************************** */
    /*  Section: Controller ports and pins used for peripheral                */
    /* ********************************************************************** */    
    #define METAL_SENSOR_INPUT_PORT             B
    #define METAL_SENSOR_INPUT_PIN              14    
    
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
    

#ifdef	__cplusplus
}
#endif /* __cplusplus */

#endif	/* _BSP_H */

