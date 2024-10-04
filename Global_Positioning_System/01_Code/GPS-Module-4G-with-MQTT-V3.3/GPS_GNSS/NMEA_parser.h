/* Microchip Technology Inc. and its subsidiaries.  You may use this software 
 * and any derivatives exclusively with Microchip products. 
 * 
 * THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS".  NO WARRANTIES, WHETHER 
 * EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED 
 * WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A 
 * PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION 
 * WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION. 
 *
 * IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
 * INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
 * WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS 
 * BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE.  TO THE 
 * FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS 
 * IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF 
 * ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *
 * MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE 
 * TERMS. 
 */

/* 
 * File:   
 * Author: 
 * Comments:
 * Revision history: 
 */

// This is a guard condition so that contents of this file are not included
// more than once.  
#ifndef _NMEA_PARSER_H
#define	_NMEA_PARSER_H

#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include <limits.h>
#include <ctype.h>
#include <string.h>



#ifdef	__cplusplus
extern "C" {
#endif /* __cplusplus */

    /************** Data structure of the used data nodes Start ***************/
    
    /************** Data structure of the used data nodes End *****************/
    
    /******************** Global variable declarations ************************/
	extern uint8_t _bufferLen;
	extern char* _buffer;
	extern char *_ptr;    
    
	// Information from current MicroNMEA sentence
	extern char _talkerID;
	extern char _messageID[6];

	// Variables parsed and kept for user
	extern char _navSystem;
	extern bool _isValid;
	extern long _latitude, _longitude; // In millionths of a degree
	extern long _altitude; // In millimetres
	extern bool _altitudeValid;
	extern long _speed, _course;
	extern uint16_t _year;
	extern uint8_t _month, _day, _hour, _minute, _second, _hundredths;
	extern uint8_t _numSat;
	extern uint8_t _hdop; 
    
    extern bool _badchecksumhandler;
    extern bool _unknownsentencehandler;
   
    
    /**************** Implemented function declarations ***********************/
    
    // Initialize NMEA parser with NMEA sentence buffer and its size.
    void InitializeNMEA(void *, uint8_t);
    
	// Message ID for current MicroNMEA sentence
	const char* getMessageID(void);
    
	// Talker ID for current MicroNMEA sentence
	//char getTalkerID(void);

    	/**
	 * @brief Get NMEA sentence
	 *
	 * @return const char*
	 */
	const char* getSentence(void);
    
	/**
	 * @brief Instruct MicroNMEA to process a character
	 *
	 * @param c Character to process
	 * @return true A complete non-empty sentence has been processed (may not be valid)
	 * @return false End of sentence not detected
	 */
	bool process(char);


    	/**
	 * @brief Get the direction of travel
	 * @return Direction in thousandths of a degree, clockwise from North
	 */
	long getCourse(void);
    
	/**
	 * @brief Get the speed
	 *
	 * @return uint8_t speed
	 */
	long getSpeed(void);

    	/**
	 * @brief Get the hundredths part of the second
	 *
	 * @return uint8_t hundredths
	 */
	uint8_t getHundredths(void);
    
	/**
	 * @brief Get the year
	 *
	 * @return uint16_t year
	 */
	uint16_t getYear(void);

	/**
	 * @brief Get the month (1 - 12 inclusive)
	 *
	 * @return uint8_t year
	 */
	uint8_t getMonth(void);

	/**
	 * @brief Get the day of month (1 - 31 inclusive)
	 *
	 * @return uint8_t month
	 */
	uint8_t getDay(void);

	/**
	 * @brief Get the hour
	 *
	 * @return uint8_t hour
	 */
	uint8_t getHour(void);

	/**
	 * @brief Get the minute
	 *
	 * @return uint8_t minute
	 */
	uint8_t getMinute(void);

	/**
	 * @brief Get the integer part of the second
	 *
	 * @return uint8_t second
	 */
	uint8_t getSecond(void);

    	/**
	 * @brief Get the latitude, in millionths of a degree
	 * @details North is positive.
	 * @return long
	 */
	long getLatitude(void);

	/**
	 * @brief Get the longitude, in millionths of a degree
	 * @details East is positive.
	 * @return long
	 */
	long getLongitude(void);

	// Altitude in millimetres.
	/**
	 * @brief Get the altitude in millmetres
	 *
	 * @param alt Reference to long value where altitude is to be stored
	 * @return true Altitude is valid
	 * @return false Altitude not valid
	 */
	bool getAltitude(long *);
    
	/**
	 * @brief Get the navigation system in use
	 * @details `N` = GNSS, `P` = GPS, `L` = GLONASS, `A` = Galileo, `\0` = none
	 * @return char
	 */
	char getNavSystem(void);

	/**
	 * @brief Get the number of satellites in use
	 *
	 * @return uint8_t
	 */
	uint8_t getNumSatellites(void);

	/**
	 * @brief Get the horizontal dilution of precision (HDOP), in tenths
	 * @details A HDOP value of 1.1 is returned as `11`
	 * @return uint8_t
	 */
	uint8_t getHDOP(void);

	/**
	 * @brief Inquire if latest fix is valid
	 *
	 * @return true Valid
	 * @return false Not valid
	 */
	bool isValid(void);

	/**
	 * @brief Set the buffer object
	 *
	 * @param buf Address of the buffer
	 * @param len Number of bytes allocated
	 */
	void setBuffer(void*, uint8_t);

	// Clear all fix information. isValid() will return false, Year,
	// month and day will all be zero. Hour, minute and second time will
	// be set to 99. Speed, course and altitude will be set to
	// LONG_MIN; the altitude validity flag will be false. Latitude and
	// longitude will be set to 999 degrees.
	/**
	 * @brief Clear all fix information
	 * @details `isValid()` will return false, year,
	 * month and day will all be zero. Hour, minute and second will
	 * be set to 99. Speed, course and altitude will be set to
	 * `LONG_MIN`; the altitude validity flag will be false. Latitude and
	 * longitude will be set to 999 degrees.
	 */
	void clear(void);    
    
    
    

#ifdef	__cplusplus
}
#endif /* __cplusplus */

#endif	/* _NMEA_PARSER_H */

