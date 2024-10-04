/* 
 * File:   w25qxxxf_app.h
 * Author: Maniruz Zaman
 *
 * Created on 12 February, 2016, 12:10 PM
 */
#ifndef W25QXXXF_INTERFACE_H
#define	W25QXXXF_INTERFACE_H
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
#include "w25qxxxf_drv.h"


#ifdef	__cplusplus
extern "C" {
#endif

#define DO_FLASH_PROTECT_BY_INDIVIDUAL_BLOCK_PROTECT_METHOD
#ifndef DO_FLASH_PROTECT_BY_INDIVIDUAL_BLOCK_PROTECT_METHOD
    #define DO_FLASH_PROTECT_BY_POWER_DOWN_METHOD
#endif
/* ************************************************************************** */
/* Section: Constants Data Types                                              */
/* ************************************************************************** */
/* Modem Management */
#define MANAGEMENT_DATA_BLOCK                           0ul
      
/* Firmware Upgrade Data Management */    
#define FIRMWARE_UPGRADE_DATA_BLOCK_BASE                1ul
    
/* Offline Data Management */
#define OFFLINE_DATA_HDR_BLOCK                          15ul    
#define OFFLINE_DATA_HDR_PAGE_COUNT                     250ul
#define OFFLINE_DATA_HDR_SECTOR_BASE                    0ul
#define OFFLINE_DATA_HDR_WINDOW_SIZE                    16ul
#define OFFLINE_DATA_HDR_WINDOW_PER_PAGE                (FLASH_PAGE_SIZE/OFFLINE_DATA_HDR_WINDOW_SIZE)

#define OFFLINE_DATA_CONTENT_BLOCK_BASE                 16ul    
#define OFFLINE_DATA_CONTENT_VALIDATOR_ADDR_OFFSET      0ul
#define OFFLINE_DATA_CONTENT_ADDR_OFFSET                10ul
    
#define OFFLINE_DATA_END_POINT                          60000ul  
/* ************************************************************************** */
/* Section: Data types                                                        */
/* ************************************************************************** */     
typedef struct 
{
    uint8_t     mf_id;
    uint8_t     dev_id; 
    uint8_t     mem_type_id;
    uint8_t     capacity_id;
    uint8_t     uuid[10];

    union
    {
        struct _w25qxxxf_interface_t_bits
        {
            uint8_t setup_done: 1;
            uint8_t resvd: 7;
        }bits;
        uint8_t flag;
    };
}w25qxxxf_interface_t;

/**************************************************************************/
// Exposed function to the other files.                                          */
/**************************************************************************/
    bool w25qxxxf_interface_setup(void); 
    uint16_t  w25qxxxf_interface_read_data_by_page_no(uint16_t page_no, uint8_t offset, uint8_t *data, uint16_t len);
    uint16_t  w25qxxxf_interface_read_data_by_memory_address(uint32_t address, uint8_t *data, uint16_t len);
    uint16_t  w25qxxxf_interface_write_data_by_page_no(uint16_t page_no, uint8_t offset, uint8_t *data, uint16_t len);
    uint16_t  w25qxxxf_interface_write_data_by_memory_address(uint32_t address, uint8_t *data, uint16_t len);
    bool w25qxxxf_interface_erase_sector(uint16_t sector_no);
    bool w25qxxxf_interface_erase_block(uint16_t block_no);
    void w25qxxxf_interface_chip_erase(void);
    bool w25qxxxf_interface_read_security_register(uint8_t reg_no, uint8_t *data, uint16_t len);
    bool w25qxxxf_interface_write_security_register(uint8_t reg_no, uint8_t *data, uint16_t len);
    bool w25qxxxf_interface_lock_security_register(uint8_t reg_no);
#ifdef	__cplusplus
}
#endif

#endif	/* W25QXXXF_INTERFACE_H */

