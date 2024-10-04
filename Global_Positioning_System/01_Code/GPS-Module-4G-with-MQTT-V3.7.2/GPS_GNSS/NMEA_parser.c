/*
 * File:   NMEA_parser.c
 * Author: 2020
 *
 * Created on June 13, 2022, 3:24 PM
 */

#include "NMEA_parser.h"

uint8_t     _bufferLen          = 0;
char*       _buffer             = '\0';
char        *_ptr               = '\0';  
char        _talkerID           = '\0';
char        _messageID[6];
char        _navSystem          = '\0';
bool        _isValid;
long        _latitude, _longitude;
long        _altitude;
bool        _altitudeValid;
long        _speed, _course;
uint16_t    _year;
uint8_t     _month, _day, _hour, _minute, _second, _hundredths;
uint8_t     _numSat;
uint8_t     _hdop;
uint8_t     _fixQuality;
bool        _unknownsentencehandler;
bool        _badchecksumhandler;



void setBuffer(void* buf, uint8_t len)
{
	_bufferLen = len;
	_buffer = (char*)buf;
	_ptr = _buffer;
	if (_bufferLen) {
		*_ptr = '\0';
		_buffer[_bufferLen - 1] = '\0';
	}   
    
}

void clear(void)
{
	_navSystem = '\0';
	_numSat = 0;
	_hdop = 255;
	_isValid = false;
	_latitude = 999000000L;
	_longitude = 999000000L;
	_altitude = _speed = _course = LONG_MIN;    /* LONG_MIN -> Minimum value for a variable of type long*/
	_altitudeValid = false;
	_year = _month = _day = 0;
	_hour = _minute = _second = 99;
	_hundredths = 0; 
    
    _unknownsentencehandler = false;
    _badchecksumhandler = false;
    
}

void InitializeNMEA(void* buf, uint8_t len)
{
    uint8_t counter = 0;
    
	_talkerID = '\0';
	for(counter = 0; counter < 6; counter++)
    {
        _messageID[counter] = '\0';
    }
            
	setBuffer(buf, len);
	clear();            
}

static char toHex(uint8_t nibble)
{
	if (nibble >= 10)
		return nibble + 'A' - 10;
	else
		return nibble + '0';

}

static long Exp10(uint8_t b)
{
	long r = 1;
	while (b--)
		r *= 10;
	return r;
}

static const char* generateChecksum(const char* s, char* checksum)
{
	uint8_t c = 0;
	// Initial $ is omitted from checksum, if present ignore it.
	if (*s == '$')
		++s;

	while (*s != '\0' && *s != '*')
		c ^= *s++;

	if (checksum) {
		checksum[0] = toHex(c / 16);
		checksum[1] = toHex(c % 16);
	}
    
	return s;    
}


static bool testChecksum(const char* s)
{
	char checksum[2];
	const char* p = generateChecksum(s, checksum);
	return *p == '*' && p[1] == checksum[0] && p[2] == checksum[1];    
}

static inline bool isEndOfFields(char c) 
{
    return c == '*' || c == '\0' || c == '\r' || c == '\n';
}

static const char* skipField(const char* s)
{
	if (s == NULL)
		return NULL;

	while (!isEndOfFields(*s)) {
		if (*s == ',') {
			// Check next character
			if (isEndOfFields(*++s))
				break;
			else
				return s;
		}
		++s;
	}
	return NULL; // End of string or valid sentence
}

static long parseFloat(const char* s, uint8_t log10Multiplier, const char** eptr)
{
	int8_t neg = 1;
	long r = 0;
	while (isspace(*s))
		++s;
	if (*s == '-') {
		neg = -1;
		++s;
	}
	else if (*s == '+')
		++s;

	while (isdigit(*s))
		r = 10*r + *s++ - '0';
	r *= Exp10(log10Multiplier);

	if (*s == '.') {
		++s;
		long frac = 0;
		while (isdigit(*s) && log10Multiplier) {
			frac = 10 * frac + *s++ -'0';
			--log10Multiplier;
		}
		frac *= Exp10(log10Multiplier);
		r += frac;
	}
	r *= neg; // Include effect of any minus sign

	if (eptr)
		*eptr = skipField(s);

	return r;
}

static unsigned int parseUnsignedInt(const char *s, uint8_t len)
{
	int r = 0;
	while (len--)
		r = 10 * r + *s++ - '0';
	return r;
}

static long parseDegreeMinute(const char* s, uint8_t degWidth,
								  const char **eptr)
{
	if (*s == ',') {
		if (eptr)
			*eptr = skipField(s);
		return 0;
	}
	long r = parseUnsignedInt(s, degWidth) * 1000000L;
	s += degWidth;
	r += parseFloat(s, 6, eptr) / 60;
	return r;
}

static const char* parseField(const char* s, char *result, int len)
{
	if (s == NULL)
		return NULL;

	int i = 0;
	while (*s != ',' && !isEndOfFields(*s)) {
		if (result && i++ < len)
			*result++ = *s;
		++s;
	}
	if (result && i < len)
		*result = '\0'; // Terminate unless too long

	if (*s == ',')
		return ++s; // Location of start of next field
	else
		return NULL; // End of string or valid sentence
}

static const char* parseTime(const char* s)
{
	if (*s == ',')
		return skipField(s);
	_hour = parseUnsignedInt(s, 2);
	_minute = parseUnsignedInt(s + 2, 2);
	_second = parseUnsignedInt(s + 4, 2);
	_hundredths = parseUnsignedInt(s + 7, 2);
	return skipField(s + 9);
}

static const char* parseDate(const char* s)
{
	if (*s == ',')
		return skipField(s);
	_day = parseUnsignedInt(s, 2);
	_month = parseUnsignedInt(s + 2, 2);
	_year = parseUnsignedInt(s + 4, 2) + 2000;
	return skipField(s + 6);
}


static bool processGGA(const char *s)
{
	// If GxGSV messages are received _talker_ID can be changed after
	// other MicroNMEA sentences. Compatibility modes can set the talker ID
	// to indicate GPS regardless of actual navigation system used.
	_navSystem = _talkerID;

	s = parseTime(s);
	if (s == NULL)
		return false;
	// ++s; 
    
	_latitude = parseDegreeMinute(s, 2, &s);
	if (s == NULL)
		return false;
	if (*s == ',')
		++s;
	else {
		if (*s == 'S')
			_latitude *= -1;
		s += 2; // Skip N/S and comma
	} 
    
	_longitude = parseDegreeMinute(s, 3, &s);
	if (s == NULL)
		return false;
	if (*s == ',')
		++s;
	else {
		if (*s == 'W')
			_longitude *= -1;
		s += 2; // Skip E/W and comma
	} 
    
	_isValid = (*s >= '1' && *s <= '5');
    _fixQuality = *((uint8_t *)s);
    _fixQuality = _fixQuality - '0';
    
	s += 2; // Skip position fix flag and comma
	long tmp = parseFloat(s, 0, &s);
	_numSat = (tmp > 255 ? 255 : (tmp < 0 ? 0 : tmp));
    
	if (s == NULL)
		return false;
	tmp = parseFloat(s, 1, &s);  
	_hdop = (tmp > 255 || tmp < 0 ? 255 : tmp);
    
	if (s == NULL)
		return false;
	_altitude = parseFloat(s, 3, &s);
    
	if (s == NULL)
		return false;
	_altitudeValid = true;
	// That's all we care about
	return true;    
    
}

static bool processRMC(const char* s)
{
	// If GxGSV messages are received _talker_ID can be changed after
	// other MicroNMEA sentences. Compatibility modes can set the talker
	// ID to indicate GPS regardless of actual navigation system used.
	_navSystem = _talkerID;

	s = parseTime(s);
	if (s == NULL)
		return false;
	_isValid = (*s == 'A');
    
	s += 2; // Skip validity and comma
	_latitude = parseDegreeMinute(s, 2, &s);
    
	if (s == NULL)
		return false;
	if (*s == ',')
		++s;
	else {
		if (*s == 'S')
			_latitude *= -1;
		s += 2; // Skip N/S and comma
	}
	_longitude = parseDegreeMinute(s, 3, &s);
    
	if (s == NULL)
		return false;
	if (*s == ',')
		++s;
	else {
		if (*s == 'W')
			_longitude *= -1;
		s += 2; // Skip E/W and comma
	}
	_speed = parseFloat(s, 3, &s);
    
	if (s == NULL)
		return false;
	_course = parseFloat(s, 3, &s);
    
	if (s == NULL)
		return false;
	s = parseDate(s);
	// That's all we care about
	return true;
}

bool process(char c)
{
    
	if (_buffer == NULL || _bufferLen == 0)
		return false;   
    
    if (c == '\0' || c == '\n' || c == '\r')
    {
		// Terminate buffer then reset pointer
		*_ptr = '\0';
		_ptr = _buffer;

        if (*_buffer == '$' && testChecksum(_buffer))
        {
			// Valid message
			const char* data;
			if (_buffer[1] == 'G') 
            {
				_talkerID = _buffer[2];
				data = parseField(&_buffer[3], &_messageID[0], sizeof(_messageID));
			}        
			else 
            {
				_talkerID = '\0';
				data = parseField(&_buffer[1], &_messageID[0], sizeof(_messageID));
			}   
            
			if (data != NULL && strcmp(&_messageID[0], "GGA") == 0)
				return processGGA(data);
			else if (data != NULL && strcmp(&_messageID[0], "RMC") == 0)
				return processRMC(data);
//			else if (_unknownSentenceHandler)
//				(*_unknownSentenceHandler)(*this); 
            else
            {
                /* Unknown sentence handler*/
                _unknownsentencehandler = true;
            }  
        }
		else 
        {
//			if (_badChecksumHandler && *_buffer != '\0') // don't send empty buffers as bad checksums!
//				(*_badChecksumHandler)(*this);
            
            /* Bad checksum handler */
            _badchecksumhandler = true;
		} 
        
		// Return true for a complete, non-empty, sentence (even if not a valid one; including bad checksum and unknown sentence).
		return *_buffer != '\0';         
    }
	else 
    {
		*_ptr = c;
		if (_ptr < &_buffer[_bufferLen - 1])
			++_ptr;
	}

	return false;    
    
}

/****************** User accessible functions or methods **********************/

char getNavSystem(void)
{
    return _navSystem;
}    

uint8_t getNumSatellites(void)
{
    return _numSat;
}

uint8_t getHDOP(void)
{
    return _hdop;
}

bool isValid(void)
{
    return _isValid;
}

long getLatitude(void)
{
    return _latitude;
}

long getLongitude(void)
{
    return _longitude;
}

bool getAltitude(long *alt)
{
    if (_altitudeValid)
        alt = &_altitude;
    return _altitudeValid;
}

uint16_t getYear(void)
{
    return _year;
}

uint8_t getMonth(void)
{
    return _month;
}

uint8_t getDay(void)
{
    return _day;
}

uint8_t getHour(void)
{
    return _hour;
}

uint8_t getMinute(void)
{
    return _minute;
}

uint8_t getSecond(void)
{
    return _second;
}

uint8_t getHundredths(void)
{
    return _hundredths;
}

long getSpeed(void)
{
    return _speed;
}

long getCourse(void)
{
    return _course;
}

const char* getSentence(void)
{
    return _buffer;
}

char getTalkerID(void)
{
    return _talkerID;
}

const char* getMessageID(void)
{
    return (const char*)_messageID;
}

uint8_t getFixQuality(void)
{
    return  _fixQuality;
}