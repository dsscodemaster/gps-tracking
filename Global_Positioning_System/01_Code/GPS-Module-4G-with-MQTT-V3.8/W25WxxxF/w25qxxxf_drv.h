/* 
 * File:   W25QXXXF_drv.h
 * Author: deepak_dogra
 *
 * Created on 12 February, 2016, 12:10 PM
 */

#ifndef W25QXXXF_DRV_H
#define	W25QXXXF_DRV_H

#include <stdint.h>
#include <stdbool.h>
#include "../common/tick.h"
#include "../mcc_generated_files/spi1.h"
#include "w25qxxxf_database.h" 
#include "w25qxxxf_hwprofile.h"

#ifdef	__cplusplus
extern "C" {
#endif
    

    #define w25qxxxf_drv_spi_read(x,y)     SPI1_Exchange8bitBuffer(NULL,y,x)
    #define w25qxxxf_drv_spi_write(x,y)    SPI1_Exchange8bitBuffer(x,y,NULL)

    typedef enum
    {
        BLOCK_TYPE_4KB = 0,
        BLOCK_TYPE_32KB,
        BLOCK_TYPE_64KB,
        BLOCK_TYPE_ENTIRE_CHIP
    }FLASH_BLOCK_TYPE;
    
    typedef enum
    {
        FLASH_OPTYPE_READ = 0,
        FLASH_OPTYPE_PROGRAM,
        FLASH_OPTYPE_ERASE
    }FLASH_OPERATION_TYPE;
    
    typedef enum
    {
        FLASH_INDIVIDUAL_UNLOCK = 0,
        FLASH_INDIVIDUAL_LOCK,
        FLASH_GLOBAL_UNLOCK,
        FLASH_GLOBAL_LOCK
    }FLASH_PROTECT_OPTYPE;
    
void w25qxxxf_drv_intialize_control_lines(void);
uint8_t w25qxxxf_drv_read_status_register(uint8_t stat_reg_no );
void w25qxxxf_drv_write_nonvolatile_status_reg_bits(uint8_t stat_reg_no,uint8_t value );
void w25qxxxf_drv_write_volatile_status_reg_bits(uint8_t stat_reg_no,uint8_t value );
void w25qxxxf_drv_reset_device(void);
uint16_t w25qxxxf_drv_read_data(uint32_t addr, uint8_t *data, uint16_t rx_len);
uint16_t w25qxxxf_drv_fast_read_data(uint32_t addr, uint8_t *data, uint16_t rx_len);
uint16_t w25qxxxf_drv_page_program(uint32_t addr, uint8_t *data, uint16_t wr_len);
void w25qxxxf_drv_erase_memory(uint8_t block_type, uint16_t segment_no);
void w25qxxxf_drv_chip_erase(void);
uint16_t w25qxxxf_drv_operate_on_security_register(uint8_t reg_no, FLASH_OPERATION_TYPE optype, uint8_t *data, uint16_t len);
void w25qxxxf_drv_suspend_operation(void);
void w25qxxxf_drv_resume_operation(void);
void w25qxxxf_drv_power_down_flash(void);
void w25qxxxf_drv_relaese_power_down(void);
void w25qxxxf_drv_release_power_down_with_id(uint8_t *id);
void w25qxxxf_drv_read_device_info(uint8_t *mf_id, uint8_t *dev_id, uint8_t *mem_type_id, uint8_t *capacity_id);
void w25qxxxf_drv_read_unique_device_number(uint8_t *uuid);
void w25qxxxf_drv_lock_unlock_block(uint8_t op_tpe, uint8_t block_no, uint8_t sector_no);
bool w25qxxxf_drv_read_block_lock(uint8_t block_no, uint8_t sector_no);

#ifdef	__cplusplus
}
#endif

#endif	/* W25QXXXF_DRV_H */

