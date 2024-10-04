/* 
 * File:   w25qxxxf_database.h
 * Author: Maniruzzaman
 *
 * Created on 14 December, 2018, 1:17 PM
 */

#ifndef W25QXXXF_DATABASE_H
#define	W25QXXXF_DATABASE_H

#ifdef	__cplusplus
extern "C" {
#endif

    // Store all instruction code of the flash drive. Instruction codes are used
    // to perform co-responding job of the instruction name.
    typedef enum
    {
        FLASH_CMD_WRITE_ENABLE = 0x06,
        FLASH_CMD_VSR_WRITE_ENABLE = 0x50,
        FLASH_CMD_WRITE_DISABLE = 0x04,
        FLASH_CMD_READ_STAT_REG1 = 0x05,
        FLASH_CMD_WRITE_STAT_REG1 = 0x01,
        FLASH_CMD_READ_STAT_REG2 = 0x35,
        FLASH_CMD_WRITE_STAT_REG2 = 0x31,
        FLASH_CMD_READ_STAT_REG3 = 0x15,
        FLASH_CMD_WRITE_STAT_REG3= 0x11,
        FLASH_CMD_CHIP_ERASE = 0xC7,
        FLASH_CMD_PROG_ERASE_SUSPEND = 0x75,
        FLASH_CMD_PROG_ERASE_RESUME = 0x7A,
        FLASH_CMD_POWER_DOWN = 0xB9,
        FLASH_CMD_RELEASE_POWER_DOWN = 0xAB,
        FLASH_CMD_READ_MF_DEV_ID = 0x90,
        FLASH_CMD_READ_JEDEC_ID = 0x9F,
        FLASH_CMD_GLOBAL_BLOCK_LOCK = 0x7E,
        FLASH_CMD_GLOBAL_BLOCK_UNLOCK = 0x98,
        FLASH_CMD_ENTER_QPI_MODE = 0x38,
        FLASH_CMD_RESET_ENABLE = 0x66,
        FLASH_CMD_RESET_DEVICE = 0x99,
        FLASH_CMD_READ_UNIQUE_ID = 0x4B,
        FLASH_CMD_PAGE_PROGRAM = 0x02,
        FLASH_CMD_QUAD_PAGE_PROGRAM = 0x32,
        FLASH_CMD_SECTOR_ERASE_4K = 0x20,
        FLASH_CMD_BLOCK_ERASE_32K = 0x52,
        FLASH_CMD_BLOCK_ERASE_64K = 0xD8,
        FLASH_CMD_READ_DATA = 0x03,
        FLASH_CMD_FAST_READ = 0x0B,
        FLASH_CMD_FAST_READ_DUAL_OUT = 0x3B,
        FLASH_CMD_FAST_READ_QUAD_OUT = 0x6B,
        FLASH_CMD_READ_SFDP_REG = 0x5A,
        FLASH_CMD_ERASE_SECURITY_REG = 0x44,
        FLASH_CMD_PROGRAM_SECURITY_REG = 0x42,
        FLASH_CMD_READ_SECURITY_REG = 0x48,
        FLASH_CMD_INDIVIDUAL_BLOCK_LOCK = 0x36,
        FLASH_CMD_INDIVIDUAL_BLOCK_UNLOCK = 0x39,
        FLASH_CMD_READ_BLOCK_LOCK = 0x3D
                
    }FLASH_SPI_COMMAND;
    

    typedef enum
    {
        ADDR_SECURITY_REG1 = 0x001000,
        ADDR_SECURITY_REG2 = 0x002000,
        ADDR_SECURITY_REG3 = 0x003000
    }FLASH_SECURITY_REG_ADDRESS;
    
// constant information.
    typedef enum
    {
        W25QXXXF_MF_ID = 0xEF,          // JEDEC assign Manufacturer ID for win-bond.
        W25QXXXF_DEVICE_ID = 0x17,      // JEDEC assign Device ID for win-bond.
        W25QXXXF_JEDEC_ID = 0x4018      // Memory type & Capacity of w25qxxxf.
                
    }FLASH_DEVICE_INFO;     // Flash chip internal information section.
    
    // Data structure of status & configuration registers.Three status register
    // each of 8-bit provided by w25qxxxf.
    
    // Status register-1.
    typedef union
    {
        struct _w25qxxxf_status_reg1_bits
        {
            uint8_t BUSY: 1;    // Busy : Erase/write in-progress.
            uint8_t WEL: 1;     // WEL : Write enable latch.
            uint8_t BP: 3;      // BP0~2 : Block protect bit(non-volatile writable  ).
            uint8_t TB: 1;      // TB : Top/Bottom protect(non-volatile writable).
            uint8_t SEC: 1;     // SEC : Sector protect(non-volatile writable).
            uint8_t SRP0: 1;    // Status register hardware protect.
        }bits;
        
        uint8_t all;
    }w25qxxxf_status_reg1_t;
    
    // Status register-2.
    typedef union
    {
        struct _w25qxxxf_status_reg2_bits
        {
            uint8_t SRP1: 1;    // Status register hardware protect; register lock.
            uint8_t QE: 1;      // QE : Quad enable(volatile/non-volatile write enable)
            uint8_t resvd: 1;   // Reserved.
            uint8_t LB: 3;      // LB1~3 : Security register lock bits.
            uint8_t CMP: 1;     // CMP : Complement protect.(writable)
            uint8_t SUS: 1;     // SUS : Suspend status.
        }bits;
        
        uint8_t all;
    }w25qxxxf_status_reg2_t;
    
    // Status register-3.
    typedef union
    {
        struct _w25qxxxf_status_reg3_bits
        {
            uint8_t resvd0: 2;      // 2-bit Reserved.
            uint8_t WPS: 1;         // WPS : Write protect selection.(writable)
            uint8_t resvd1: 2;      // 2-bit Reserved.
            uint8_t DRV: 2;         // DRV1~2 : Output driver strength.(writable)
            uint8_t HOLD_RST: 1;    // HOLD_RST : Hold reset.
        }bits;
        
        uint8_t all;
    }w25qxxxf_status_reg3_t;
    
/*******************************************************************************/   
#define FLASH_PAGE_SIZE                 256ul    
#define FLASH_PAGE_COUNT                65536ul    
#define FLASH_BLOCK_SIZE                65536ul
#define FLASH_BLOCK_COUNT               256ul
#define FLASH_PAGE_PER_BLOCK            (FLASH_BLOCK_SIZE/FLASH_PAGE_SIZE) 
#define FLASH_SECTOR_SIZE               4096ul
#define FLASH_SECTOR_PER_BLOCK          (FLASH_BLOCK_SIZE/FLASH_SECTOR_SIZE)
#define FLASH_PAGE_PER_SECTOR           (FLASH_SECTOR_SIZE/FLASH_PAGE_SIZE)     
#define FLASH_START_ADDRESS             0x000000
#define FLASH_END_ADDRESS               0xFFFFFF     

#ifdef	__cplusplus
}
#endif

#endif	/* W25QXXXF_DATABASE_H */

