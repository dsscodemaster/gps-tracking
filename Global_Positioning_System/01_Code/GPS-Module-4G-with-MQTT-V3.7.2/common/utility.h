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
#ifndef _UTILITY_H
#define	_UTILITY_H

/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#ifdef	__cplusplus
extern "C" {
#endif /* __cplusplus */

    /* ********************************************************************** */
    /* Section: Constants                                                     */
    /* ********************************************************************** */ 
	#define COLOR_OFF					"\x1B[0m"
	#define COLOR_RED					"\x1B[0;91m"
	#define COLOR_GREEN					"\x1B[0;92m"
	#define COLOR_YELLOW				"\x1B[0;93m"
	#define COLOR_BLUE					"\x1B[0;94m"
	#define COLOR_MAGENTA				"\x1B[0;95m"
	#define COLOR_BOLDGRAY				"\x1B[1;30m"
	#define COLOR_BOLDWHITE				"\x1B[1;37m"
	
	
	#define PRLOG(...) \
	do { \
		printf(__VA_ARGS__); \
		print_prompt(); \
	} while (0)

	#ifndef MIN
	#define MIN(a, b) ((a) < (b) ? (a) : (b))
	#endif
	
	#ifndef MAX
	#define MAX(a, b) ((a) > (b) ? (a) : (b))
	#endif

    /* ********************************************************************** */
    /* Section: Constant data types                                           */
    /* ********************************************************************** */
	typedef struct
	{
		uint8_t data[8192];
		size_t 	len;
	}static_buf_t;
	
	typedef struct 
	{
	  char *data;
	  size_t size;
	}dynamic_buf_t;
	
	// Data filtering rule data structure
	typedef struct
	{
		uint16_t key;
		bool 	 available;
		union 
		{
			uint32_t all;
			struct _DATA_MASK_BITS
			{
				uint32_t b0: 1;
				uint32_t b1: 1;
				uint32_t b2: 1;
				uint32_t b3: 1;
				uint32_t b4: 1;
				uint32_t b5: 1;
				uint32_t b6: 1;
				uint32_t b7: 1;
				uint32_t b8: 1;
				uint32_t b9: 1;
				uint32_t b10: 1;
				uint32_t b11: 1;
				uint32_t b12: 1;
				uint32_t b13: 1;
				uint32_t b14: 1;
				uint32_t b15: 1;
				uint32_t resvd: 16;
			}bits;
		}mask;
	}ST_DATA_MASK;
	
	// Proceess filtering rule data structure
	typedef struct
	{
		uint16_t key;
		bool 	 required;
		union 
		{
			uint8_t all;
			struct _DPROCESS_RULE_BITS
			{
				uint8_t b0: 1;
				uint8_t b1: 1;
				uint8_t b2: 1;
				uint8_t b3: 1;
				uint8_t b4: 1;
				uint8_t b5: 1;
				uint8_t b6: 1;
				uint8_t b7: 1;
			}bits;
		}mask;
	}ST_PROCESS_MASK;
	
    /* ********************************************************************** */
    /* Section: Interface Functions                                           */
    /* ********************************************************************** */
	double utility_MovingAvgFiltering( uint16_t currVal,int16_t prevVal,uint16_t *sampleIndex,uint16_t sampleCount );
    int16_t utility_ConvertAsciitextStreamToTextStream(char *out, uint8_t *in, uint16_t len);
	int16_t utility_ConvertHexStreamToAsciiStream(char *out, uint8_t *in,uint16_t len);
	int16_t utility_ConvertAsciiStreamToHexStream(uint8_t *out, char *in,uint16_t len);
	uint16_t utility_GetIndexOfMaxValInt(int16_t *arr,int16_t size);
    uint16_t utility_GetIndexOfMaxval(double *data, uint16_t count);
	uint16_t utility_GetIndexOfMinval(double *data, uint16_t count);
	uint16_t utility_SortAccordingToIndex( double *data, uint16_t *idx, uint16_t count );
	void utility_sort_ascending_order( double *data, double *out, uint16_t n );
	char utility_nibbleToChar(uint8_t nibble);
	uint8_t utility_nibbleFromChar(char c);
	char* utility_bytesToHexString(uint8_t *bytes, size_t buflen);
	uint8_t* utility_hexStringToBytes(char *inhex);
	uint32_t utility_hexStringToDecimalValue(char *hexString,uint16_t len);
	char *utility_convert_string_case( int type, const char *in, char *out, uint16_t size );
	double utility_calculate_mean(double *x, uint16_t n);
	double utility_calculate_max(double *x, uint16_t n);
	double utility_calculate_min(double *x, uint16_t n);
	double utility_calculate_sd(double *x, uint16_t n);
	double utility_calculate_variance(double *x, uint16_t n);
	double utility_calculate_median(double *x, uint16_t n);
	double utility_calculate_rms( double *data, uint16_t n);
	void utility_convert_tick_to_time(uint64_t tick,uint16_t *days, uint16_t *hours, uint16_t *minutes);

	#define PTR_TO_UINT(p) ((unsigned int) ((uintptr_t) (p)))
	#define UINT_TO_PTR(u) ((void *) ((uintptr_t) (u)))

	#define PTR_TO_INT(p) ((int) ((intptr_t) (p)))
	#define INT_TO_PTR(u) ((void *) ((intptr_t) (u)))

	#define new0(type, count)			\
		(type *) (__extension__ ({		\
			size_t __n = (size_t) (count);	\
			size_t __s = sizeof(type);	\
			void *__p;			\
			__p = btd_malloc(__n * __s);	\
			memset(__p, 0, __n * __s);	\
			__p;				\
		}))

	#define newa(t, n) ((t*) alloca(sizeof(t)*(n)))
	#define malloc0(n) (calloc((n), 1))

	void *btd_malloc(size_t size);
#ifdef	__cplusplus
}
#endif /* __cplusplus */

#endif	/* _UTILITY_H */

