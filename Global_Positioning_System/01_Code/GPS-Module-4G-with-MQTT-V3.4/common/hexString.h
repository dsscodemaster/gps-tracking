/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */

#ifndef _HEXSTRING_H    /* Guard against multiple inclusion */
#define _HEXSTRING_H

/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif


    /* ************************************************************************** */
    /* Section: Constants                                                         */
    /* ************************************************************************** */


    // *****************************************************************************
    // Section: Data Types
    // *****************************************************************************


    // *****************************************************************************
    // Section: Interface Functions
    // *****************************************************************************
    char nibbleToChar(uint8_t nibble);
    uint8_t nibbleFromChar(char c);
    uint8_t *hexStringToBytes(char *inhex);
    char *bytesToHexString(uint8_t *bytes, size_t buflen);
    uint32_t hexStringToDecimalValue(char *hexString,uint16_t len);
#ifdef __cplusplus
}
#endif

#endif /* _HEXSTRING_H */

/* End of File */
