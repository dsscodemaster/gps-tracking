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

#ifndef _CUSTOM_TYPEDEFS_H
#define	_CUSTOM_TYPEDEFS_H

#ifdef	__cplusplus
extern "C" {
#endif /* __cplusplus */
    
    typedef enum { NOT_CONNECTED = 0,CONNECTED = 1 }CONNECTION_STATUS;
    typedef enum { LOW = 0,HIGH = 1 }STATE;
    typedef enum { SUCCESS = 0,FAILURE = -1 }STATUS; 
    typedef enum { OUTPUT = 0,INPUT = 1 }IO_DIRECTION;
    typedef enum { OFF = 0,ON = 1 }ONOFF_STATE;
    typedef enum { ENABLE = 1,DISABLE = 0}ENABLE_DISABLE;

#ifdef	__cplusplus
}
#endif /* __cplusplus */

#endif	/* _CUSTOM_TYPEDEFS_H */

