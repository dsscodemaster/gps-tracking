
/*******************************************************************************
  W25QXXXF Driver Source File
  
  Company:
    DSS
  
  File Name:
    w25qxxxf_drv.c

  Summary:
    This file contains the source code for the W25QXXXF Driver.

  Description:
    This file contains the source code for the W25QXXXF Driver.  It 
    implements the logic of the application's state machine and it may call 
    API routines of other modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// *****************************************************************************
// Section: Included Files
// *****************************************************************************
#include <string.h>
#include "../common/custom_typedefs.h"
#include "../common/delay.h"
#include "w25qxxxf_drv.h"

// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
#define select_chip()        W25QXXXF_SS_WRITE=LOW
#define deselect_chip()      W25QXXXF_SS_WRITE=HIGH
    
// *****************************************************************************
// Section: Static Functions
// *****************************************************************************
/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
static void write_command(FLASH_SPI_COMMAND cmd, uint8_t *cmd_data, uint16_t cmd_data_len)
{
    uint8_t buf[32];
    uint16_t n=0;
    
    buf[n++]=cmd;
    if(cmd_data_len > 0)
    {
        memcpy(&buf[n],cmd_data,cmd_data_len);
        n += cmd_data_len; 
    }
    
    select_chip();
    w25qxxxf_drv_spi_write(buf,n);
    deselect_chip();
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
static void write_enable(void)
{
    w25qxxxf_status_reg1_t status;
    
    write_command(FLASH_CMD_WRITE_ENABLE,NULL,0);
    do
    {
        status.all = w25qxxxf_drv_read_status_register(1);
        
    }while(!status.bits.WEL);
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
#ifdef __APP_DEBUG
static void write_disable(void)
{
    write_command(FLASH_CMD_WRITE_DISABLE,NULL,0);
}
#endif

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
static void write_enable_volatile(void)
{
    write_command(FLASH_CMD_VSR_WRITE_ENABLE,NULL,0);
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*//*
static void write_disable(void)
{
    write_command(FLASH_CMD_WRITE_DISABLE,NULL,0);
}
*/
/* *************************************************************************** */
/*                      Interfacing Functions                                  */
/* *************************************************************************** */
/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
void  w25qxxxf_drv_intialize_control_lines(void)
{
    W25QXXXF_SS_WRITE=HIGH;
    W25QXXXF_SS_TRIS=OUTPUT;
    
    W25QXXXF_WP_WRITE=LOW;
    W25QXXXF_WP_TRIS=OUTPUT;
    
    W25QXXXF_RESET_WRITE=HIGH;
    W25QXXXF_RESET_TRIS=OUTPUT;
    
#ifdef EXTRA_PIN_MODE    
    W25QXXXF_HOLD_WRITE=HIGH;
    W25QXXXF_HOLD_TRIS=OUTPUT; 
#endif    
    
    W25QXXXF_SCK_TRIS = OUTPUT;
    W25QXXXF_SDO_TRIS = OUTPUT;
    W25QXXXF_SDI_TRIS = INPUT;
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
uint8_t w25qxxxf_drv_read_status_register(uint8_t stat_reg_no )
{
    uint8_t buf[2] = {0},status;
    
    switch(stat_reg_no)
    {
        case 1:
            buf[0] = FLASH_CMD_READ_STAT_REG1;
            break;
            
        case 2:
            buf[0] = FLASH_CMD_READ_STAT_REG2;
            break;
            
        case 3:
            buf[0] = FLASH_CMD_READ_STAT_REG3;
            break;
    }

    select_chip();
    w25qxxxf_drv_spi_write(buf,1);
    w25qxxxf_drv_spi_read(&status,1);
    deselect_chip();
    
    return status;
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
void w25qxxxf_drv_write_nonvolatile_status_reg_bits(uint8_t stat_reg_no,uint8_t value )
{
    uint8_t buf[2] = {0};
    w25qxxxf_status_reg1_t stat;
    
    write_enable();
    do
    {
        stat.all = w25qxxxf_drv_read_status_register(1);
        
    }while(!stat.bits.WEL);
    
    switch(stat_reg_no)
    {
        case 1:
            buf[0] = FLASH_CMD_WRITE_STAT_REG1;
            break;
            
        case 2:
            buf[0] = FLASH_CMD_WRITE_STAT_REG2;
            break;
            
        case 3:
            buf[0] = FLASH_CMD_WRITE_STAT_REG3;
            break;
    }

    buf[1] = value;
    W25QXXXF_WP_WRITE=HIGH;
    select_chip();
    w25qxxxf_drv_spi_write(buf,2);
    deselect_chip();
    W25QXXXF_WP_WRITE=LOW;
    
    do
    {
        stat.all = w25qxxxf_drv_read_status_register(1);
        
    }while(stat.bits.BUSY || stat.bits.WEL);
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
void w25qxxxf_drv_write_volatile_status_reg_bits(uint8_t stat_reg_no,uint8_t value )
{
    uint8_t buf[2] = {0};
    
    write_enable_volatile();
    
    switch(stat_reg_no)
    {
        case 1:
            buf[0] = FLASH_CMD_WRITE_STAT_REG1;
            break;
            
        case 2:
            buf[0] = FLASH_CMD_WRITE_STAT_REG2;
            break;
            
        case 3:
            buf[0] = FLASH_CMD_WRITE_STAT_REG3;
            break;
    }

    buf[1] = value;
    W25QXXXF_WP_WRITE=HIGH;
    select_chip();
    w25qxxxf_drv_spi_write(buf,2);
    deselect_chip();
    W25QXXXF_WP_WRITE=LOW;
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
void w25qxxxf_drv_reset_device(void)
{
    write_command(FLASH_CMD_RESET_ENABLE,NULL,0);
    write_command(FLASH_CMD_RESET_DEVICE,NULL,0);
    delay_ms(20);
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
uint16_t w25qxxxf_drv_read_data(uint32_t addr, uint8_t *data, uint16_t rx_len)
{
    uint8_t buf[8]={0}, *ptr;
    uint32_t address = addr;;
    uint16_t n = 0,i;
    w25qxxxf_status_reg1_t status;
    
    do
    {
        status.all = w25qxxxf_drv_read_status_register(1);
        
    }while(status.bits.BUSY);
    
    buf[n++]=FLASH_CMD_READ_DATA;
    
    ptr = (uint8_t *)&address;
    for(i=0; i<3; i++)
    {
        buf[n++] = *(ptr+2-i);
    }
    
    select_chip();
    w25qxxxf_drv_spi_write(buf,n);
    n = w25qxxxf_drv_spi_read(data,rx_len);
    deselect_chip();
    
    return n;
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
uint16_t w25qxxxf_drv_fast_read_data(uint32_t addr, uint8_t *data, uint16_t rx_len)
{
    uint8_t buf[8]={0}, *ptr;
    uint32_t address = addr;
    uint16_t n = 0,i;
    w25qxxxf_status_reg1_t status;
    
    do
    {
        status.all = w25qxxxf_drv_read_status_register(1);
        
    }while(status.bits.BUSY);
    
    write_command(FLASH_CMD_VSR_WRITE_ENABLE,NULL,0);
    buf[n++]=FLASH_CMD_FAST_READ;
    
    ptr = (uint8_t *)&address;
    for(i=0; i<3; i++)
    {
        buf[n++] = *(ptr+2-i);
    }
    
    buf[n++] = 0x00;                       // dummy data for 8 more clock
    
    select_chip();
    w25qxxxf_drv_spi_write(buf,n);
    n = w25qxxxf_drv_spi_read(data,rx_len);
    deselect_chip();
    
    return n;
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
uint16_t w25qxxxf_drv_page_program(uint32_t addr, uint8_t *data, uint16_t wr_len)
{
    uint8_t buf[8]={0}, *ptr;
    uint32_t address = addr;
    uint16_t n = 0,i;
    w25qxxxf_status_reg1_t status;
    
    write_enable();    
    buf[n++]=FLASH_CMD_PAGE_PROGRAM;
    
    ptr = (uint8_t *)&address;
    for(i=0; i<3; i++)
    {
        buf[n++] = *(ptr+2-i);
    }
    
    select_chip();
    w25qxxxf_drv_spi_write(buf,n);
    n = w25qxxxf_drv_spi_write(data,wr_len);
    deselect_chip();
    
    do
    {
        status.all = w25qxxxf_drv_read_status_register(1);
        
    }while(status.bits.BUSY || status.bits.WEL);
    
    return n;
}
/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
void w25qxxxf_drv_erase_memory(uint8_t block_type, uint16_t block_no)
{
    uint8_t buf[8]={0}, *ptr;
    uint32_t address;
    uint16_t n = 0,i;
    w25qxxxf_status_reg1_t status;
    
    write_enable();
    
    switch(block_type)
    {
        case BLOCK_TYPE_4KB:
            buf[n++] = FLASH_CMD_SECTOR_ERASE_4K;
            address = (block_no*FLASH_SECTOR_SIZE);
            break;
            
        case BLOCK_TYPE_32KB:
            buf[n++] = FLASH_CMD_BLOCK_ERASE_32K;
            address = (block_no*8*FLASH_SECTOR_SIZE);
            break;
            
        case BLOCK_TYPE_64KB:
            buf[n++] = FLASH_CMD_BLOCK_ERASE_64K;
            address = (block_no*16*FLASH_SECTOR_SIZE);
            break;
        
        case BLOCK_TYPE_ENTIRE_CHIP:
            buf[n++] = FLASH_CMD_CHIP_ERASE;
            break;
    }

    if(block_type != BLOCK_TYPE_ENTIRE_CHIP)
    {
        ptr = (uint8_t *)&address;
        for(i=0; i<3; i++)
        {
            buf[n++] = *(ptr+2-i);
        }
    }

    select_chip();
    w25qxxxf_drv_spi_write(buf,n);
    deselect_chip();
    
    do
    {
        status.all = w25qxxxf_drv_read_status_register(1);
        
    }while(status.bits.BUSY || status.bits.WEL);
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
void w25qxxxf_drv_chip_erase(void)
{
    w25qxxxf_drv_erase_memory(BLOCK_TYPE_ENTIRE_CHIP,0);
}


/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
uint16_t w25qxxxf_drv_operate_on_security_register(uint8_t reg_no, FLASH_OPERATION_TYPE optype, uint8_t *data, uint16_t len)
{
    uint8_t buf[8]={0}, *ptr;
    uint32_t address;
    uint16_t n = 0,i;
    w25qxxxf_status_reg1_t status;
    
    // Select security register number & corresponding address.
    switch(reg_no)
    {
        case 1:        
            address = ADDR_SECURITY_REG1;
            break;
            
        case 2:
            address = ADDR_SECURITY_REG2;
            break;
            
        case 3:
            address = ADDR_SECURITY_REG3;
            break;
    }

    // Select operation type & prepare command buffer.
    switch(optype)
    {
        case FLASH_OPTYPE_READ:
            do{
                status.all = w25qxxxf_drv_read_status_register(1);        
            }while(status.bits.BUSY);
    
            buf[n++] = FLASH_CMD_READ_SECURITY_REG;
            break;
            
        case FLASH_OPTYPE_PROGRAM:
            write_enable();
            buf[n++] = FLASH_CMD_PROGRAM_SECURITY_REG;
            break;
            
        case FLASH_OPTYPE_ERASE:
            write_enable();            
            buf[n++] = FLASH_CMD_ERASE_SECURITY_REG;
            break;
    }
    
    // Stuff 24-bit address in command buffer.
    ptr = (uint8_t *)&address;
    for(i=0; i<3; i++){
        buf[n++] = *(ptr+2-i);      /* MSB first */
    }

    if(optype == FLASH_OPTYPE_READ){
        buf[n++] = 0x00;
    }


    select_chip();
    w25qxxxf_drv_spi_write(buf,n);      /* Write instruction code & start address */
    
    if(optype == FLASH_OPTYPE_PROGRAM)
       n = w25qxxxf_drv_spi_write(data,len);    /* Write data */

    if(optype == FLASH_OPTYPE_READ)
        n = w25qxxxf_drv_spi_read(data,len);
    
    deselect_chip();
    
    do
    {
        status.all = w25qxxxf_drv_read_status_register(1);        
    }while(status.bits.BUSY);   /* Hold until last instructed operation finished */
    
    return n;
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
void w25qxxxf_drv_suspend_operation(void)
{
    write_command(FLASH_CMD_PROG_ERASE_SUSPEND,NULL,0);    
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
void w25qxxxf_drv_resume_operation(void)
{
    write_command(FLASH_CMD_PROG_ERASE_RESUME,NULL,0);    
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
void w25qxxxf_drv_power_down_flash(void)
{
    write_command(FLASH_CMD_POWER_DOWN,NULL,0);  
    delay_ms(1);
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
void w25qxxxf_drv_relaese_power_down(void)
{
    write_command(FLASH_CMD_RELEASE_POWER_DOWN,NULL,0);  
    delay_ms(2);
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
void w25qxxxf_drv_release_power_down_with_id(uint8_t *id)
{
    uint8_t buf[8];
    uint16_t n = 0;
   
    buf[n++] = FLASH_CMD_RELEASE_POWER_DOWN;
    buf[n++] = 0x00;
    buf[n++] = 0x00;
    buf[n++] = 0x00;

    select_chip();
    w25qxxxf_drv_spi_write(buf,n);
    n = w25qxxxf_drv_spi_read(id,1);
    deselect_chip();
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
void w25qxxxf_drv_read_device_info(uint8_t *mf_id, uint8_t *dev_id, uint8_t *mem_type_id, uint8_t *capacity_id)
{
    uint8_t buf[8];
    uint8_t id[4];
    uint16_t n = 0;
   
    buf[n++] = FLASH_CMD_READ_MF_DEV_ID;
    buf[n++] = 0x00;
    buf[n++] = 0x00;
    buf[n++] = 0x00;

    select_chip();
    w25qxxxf_drv_spi_write(buf,n);
    n = w25qxxxf_drv_spi_read(id,2);
    deselect_chip();
    
    *mf_id = id[0];
    *dev_id = id[1];
    
    buf[0] = FLASH_CMD_READ_JEDEC_ID;
    select_chip();
    w25qxxxf_drv_spi_write(buf,1);
    n = w25qxxxf_drv_spi_read(id,3);
    deselect_chip();
    *mem_type_id = id[1];
    *capacity_id = id[2];
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
void w25qxxxf_drv_read_unique_device_number(uint8_t *uuid)
{
    uint8_t buf[8];
    uint16_t n = 0;
   
    buf[n++] = FLASH_CMD_READ_UNIQUE_ID;
    buf[n++] = 0x00;
    buf[n++] = 0x00;
    buf[n++] = 0x00;
    buf[n++] = 0x00;

    select_chip();
    w25qxxxf_drv_spi_write(buf,n);
    n = w25qxxxf_drv_spi_read(uuid,8);
    deselect_chip();
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
void w25qxxxf_drv_lock_unlock_block(uint8_t op_tpe, uint8_t block_no, uint8_t sector_no)
{
    uint32_t address;
    uint8_t buf[8],*ptr;
    uint16_t i,n = 0;
    
    write_enable();
    address = (block_no*FLASH_BLOCK_SIZE) + (sector_no*FLASH_SECTOR_SIZE);
    
    switch(op_tpe)
    {
        case FLASH_INDIVIDUAL_UNLOCK:
            buf[n++] = FLASH_CMD_INDIVIDUAL_BLOCK_UNLOCK;
            ptr = (uint8_t *)&address;
            for(i=0; i<3; i++)
            {
                buf[n++] = *(ptr+2-i);
            }
            break;
        case FLASH_INDIVIDUAL_LOCK:
            buf[n++] = FLASH_CMD_INDIVIDUAL_BLOCK_LOCK;
            ptr = (uint8_t *)&address;
            for(i=0; i<3; i++)
            {
                buf[n++] = *(ptr+2-i);
            }
            break;
        case FLASH_GLOBAL_UNLOCK:
            buf[n++] = FLASH_CMD_GLOBAL_BLOCK_UNLOCK;
            break;
        case FLASH_GLOBAL_LOCK:
            buf[n++] = FLASH_CMD_GLOBAL_BLOCK_LOCK;
            break;
    }

    select_chip();
    w25qxxxf_drv_spi_write(buf,n);
    deselect_chip();
    delay_ms(2);
}
        
/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
bool w25qxxxf_drv_read_block_lock(uint8_t block_no,uint8_t sector_no)
{
    uint32_t address;
    uint8_t buf[8],status,*ptr;
    uint16_t i,n = 0;
    
    address = (block_no*FLASH_BLOCK_SIZE) + (sector_no*FLASH_SECTOR_SIZE);
    buf[n++] = FLASH_CMD_READ_BLOCK_LOCK;
    
    ptr = (uint8_t *)&address;
    for(i=0; i<3; i++)
    {
        buf[n++] = *(ptr+2-i);
    }

    select_chip();
    w25qxxxf_drv_spi_write(buf,n);
    n = w25qxxxf_drv_spi_read(&status,1);
    deselect_chip();
    
    if(status == 0x01)
        return true;
    else
        return false;
}

/*  End Of File */