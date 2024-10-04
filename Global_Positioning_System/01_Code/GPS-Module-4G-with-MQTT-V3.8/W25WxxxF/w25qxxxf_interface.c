/*******************************************************************************
  W25QXXXF Application Source File
  
  Company:
    DSS
  
  File Name:
    w25qxxxf_app.c

  Summary:
    This file contains the source code for the W25QXXXF application.

  Description:
    This file contains the source code for the W25QXXXF application.  It 
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
#include <stdio.h>
#include <string.h>
#include "../common/delay.h"
#include "w25qxxxf_interface.h"

// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
w25qxxxf_interface_t   w25qxxxf_interface; 


// *****************************************************************************
// Section: Static Functions
// *****************************************************************************
/* 
  @Function
	static void w25qxxxf_interface_InitVariables(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/

static void initialize_variables(void)
{
    memset((uint8_t *)&w25qxxxf_interface,0,sizeof(w25qxxxf_interface_t));
}

/* 
  @Function
	int w25qxxxf_interface_GetFrmwreVersn(uint8_t* version)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
static void read_flash_device_details(void)
{
    w25qxxxf_drv_read_device_info(&w25qxxxf_interface.mf_id, &w25qxxxf_interface.dev_id, &w25qxxxf_interface.mem_type_id, &w25qxxxf_interface.capacity_id);
    w25qxxxf_drv_read_unique_device_number(w25qxxxf_interface.uuid); 
}
// *****************************************************************************
/* 
  @Function
	static w25qxxxf_interface_SETUPSTATES w25qxxxf_interface_SetUpModule(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
bool w25qxxxf_interface_setup(void)
{
    w25qxxxf_status_reg1_t status1;
    w25qxxxf_status_reg2_t status2;
    w25qxxxf_status_reg3_t status3;
    
    initialize_variables();
    w25qxxxf_drv_intialize_control_lines();
    SPI1_Initialize();
    w25qxxxf_drv_reset_device();

    status1.all = w25qxxxf_drv_read_status_register(1);
    status2.all = w25qxxxf_drv_read_status_register(2);
    status3.all = w25qxxxf_drv_read_status_register(3);
    
    if(status1.bits.SRP0 != 1)
    {
        status1.bits.SRP0 = 1;      /* Status registers Hardware Protected*/
        w25qxxxf_drv_write_nonvolatile_status_reg_bits(1,status1.all);
    }
    
    if(status2.bits.SRP1 != 0)
    {
        status2.bits.SRP1 = 0;
        w25qxxxf_drv_write_nonvolatile_status_reg_bits(2,status2.all);
    }
#ifdef DO_FLASH_PROTECT_BY_INDIVIDUAL_BLOCK_PROTECT_METHOD
    if((status3.bits.WPS != 1) || (status3.bits.DRV != 0x02))
    {
        status3.bits.WPS = 1;       /* Protect individual blocks */
        status3.bits.DRV = 0x02;    /* Output driver strength = 50% */ 
        w25qxxxf_drv_write_nonvolatile_status_reg_bits(3,status3.all);
    }
#else
    if((status3.bits.WPS != 0) || (status3.bits.DRV != 0x02))
    {
        status3.bits.WPS = 0;       /* Protect individual blocks - off */
        status3.bits.DRV = 0x02;    /* Output driver strength = 50% */ 
        w25qxxxf_drv_write_nonvolatile_status_reg_bits(3,status3.all);
    }
#endif
    
#ifdef __APP_DEBUG    
    status1.all = w25qxxxf_drv_read_status_register(1);
    status2.all = w25qxxxf_drv_read_status_register(2);
    status3.all = w25qxxxf_drv_read_status_register(3);
#endif
     
    read_flash_device_details();
    
    if((w25qxxxf_interface.mf_id == W25QXXXF_MF_ID) && (w25qxxxf_interface.dev_id == W25QXXXF_DEVICE_ID))
    {
        w25qxxxf_interface.bits.setup_done = true;
    
    #ifdef DO_FLASH_PROTECT_BY_POWER_DOWN_METHOD
        w25qxxxf_drv_power_down_flash();
    #endif
    
        return true;
    }
    else
    {
        w25qxxxf_interface.bits.setup_done = false;
        return false;
    }
}

/* 
  @Function
	void  w25qxxxf_interface_GetStoredParameters(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
 
uint16_t  w25qxxxf_interface_read_data_by_page_no(uint16_t page_no, uint8_t offset, uint8_t *data, uint16_t len)
{  
    if(w25qxxxf_interface.bits.setup_done != true)
        return 0;
    
    uint32_t address;
    uint16_t n = 0,m = 0;
    uint16_t max_rdlen = FLASH_PAGE_SIZE;
        
    address = (page_no*FLASH_PAGE_SIZE) + offset;
    if((offset+len)> max_rdlen)
    {
        n = w25qxxxf_drv_read_data(address,(uint8_t *)&data[0],max_rdlen-offset);
        m = page_no;
        do
        {
            m++;
            if((len-n) > max_rdlen)
                n += w25qxxxf_drv_read_data((m*FLASH_PAGE_SIZE),(uint8_t *)&data[n],max_rdlen);
            else
                n += w25qxxxf_drv_read_data((m*FLASH_PAGE_SIZE),(uint8_t *)&data[n],len-n);

        }while(n < len);
    }
    else 
    {
        n = w25qxxxf_drv_read_data(address,(uint8_t *)&data[0],len);
    }
    
    return n;
}
/* 
  @Function
	void  w25qxxxf_interface_GetStoredParameters(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
 
uint16_t  w25qxxxf_interface_read_data_by_memory_address(uint32_t address, uint8_t *data, uint16_t len)
{
    uint16_t n =0;
    uint16_t page_no;
    uint8_t offset;
    
    page_no = address/FLASH_PAGE_SIZE;
    offset = address%FLASH_PAGE_SIZE;
    
    n = w25qxxxf_interface_read_data_by_page_no(page_no,offset,(uint8_t *)data,len);
    
    return n;
}

/* 
  @Function
	void  w25qxxxf_interface_GetStoredParameters(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
 
uint16_t  w25qxxxf_interface_write_data_by_page_no(uint16_t page_no, uint8_t offset, uint8_t *data, uint16_t len)
{   
    if(w25qxxxf_interface.bits.setup_done != true)
        return 0;
    
    uint32_t address;
    uint16_t n = 0,m = 0;
    uint16_t max_wrlen = FLASH_PAGE_SIZE;
        
#ifdef DO_FLASH_PROTECT_BY_INDIVIDUAL_BLOCK_PROTECT_METHOD   
    uint8_t sector_no = 0;
    w25qxxxf_status_reg3_t status3;
    
    if(((page_no/FLASH_PAGE_PER_BLOCK) == 0) || ((page_no/FLASH_PAGE_PER_BLOCK) == 255))
        sector_no = page_no%FLASH_PAGE_PER_BLOCK;
    
    status3.bits.WPS = 0;
    w25qxxxf_drv_write_nonvolatile_status_reg_bits(3,status3.all);
    w25qxxxf_drv_lock_unlock_block(FLASH_INDIVIDUAL_UNLOCK,page_no/FLASH_PAGE_PER_BLOCK,sector_no);
#endif
    
    address = (page_no*FLASH_PAGE_SIZE) + offset;
    if((offset+len)> max_wrlen)
    {
        n = w25qxxxf_drv_page_program(address,(uint8_t *)&data[0],max_wrlen-offset);
        m = page_no;
        do
        {
            m++;
            if((len-n) > max_wrlen)
                n += w25qxxxf_drv_page_program((m*FLASH_PAGE_SIZE),(uint8_t *)&data[n],max_wrlen);
            else
                n += w25qxxxf_drv_page_program((m*FLASH_PAGE_SIZE),(uint8_t *)&data[n],len-n);

        }while(n < len);
    }
    else 
    {
        n = w25qxxxf_drv_page_program(address,(uint8_t *)&data[0],len);
    }

#ifdef DO_FLASH_PROTECT_BY_INDIVIDUAL_BLOCK_PROTECT_METHOD
    w25qxxxf_drv_lock_unlock_block(FLASH_INDIVIDUAL_LOCK,page_no/FLASH_PAGE_PER_BLOCK,sector_no);
    status3.bits.WPS = 1;
    w25qxxxf_drv_write_nonvolatile_status_reg_bits(3,status3.all);
#endif
    
    return n;
}

/* 
  @Function
	void  w25qxxxf_interface_GetStoredParameters(void)

  @Summary
        `   
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/ 
uint16_t  w25qxxxf_interface_write_data_by_memory_address(uint32_t address, uint8_t *data, uint16_t len)
{
    uint16_t n =0;
    uint16_t page_no;
    uint8_t offset;
    
    page_no = address/FLASH_PAGE_SIZE;
    offset = address%FLASH_PAGE_SIZE;
    
    n = w25qxxxf_interface_write_data_by_page_no(page_no,offset,(uint8_t *)data,len);
    
    return n;
}

/* 
  @Function
	void  w25qxxxf_interface_GetStoredParameters(void)

  @Summary
        `   
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
bool w25qxxxf_interface_erase_sector(uint16_t sector_no)
{
    if(w25qxxxf_interface.bits.setup_done != true)
        return false;
    
#ifdef DO_FLASH_PROTECT_BY_INDIVIDUAL_BLOCK_PROTECT_METHOD
    uint8_t sector_offset = 0;
    w25qxxxf_status_reg3_t status3;
    
    if(((sector_no/FLASH_SECTOR_PER_BLOCK) == 0) || ((sector_no/FLASH_SECTOR_PER_BLOCK) == 255))
        sector_offset = sector_no%FLASH_SECTOR_PER_BLOCK;
    
    status3.all = w25qxxxf_drv_read_status_register(3);    
    status3.bits.WPS = 0;
    w25qxxxf_drv_write_nonvolatile_status_reg_bits(3,status3.all);
    w25qxxxf_drv_lock_unlock_block(FLASH_INDIVIDUAL_UNLOCK,sector_no/FLASH_SECTOR_PER_BLOCK,sector_offset);
    delay_ms(2);
#endif
    
    w25qxxxf_drv_erase_memory(BLOCK_TYPE_4KB,sector_no);
    
#ifdef DO_FLASH_PROTECT_BY_INDIVIDUAL_BLOCK_PROTECT_METHOD
    w25qxxxf_drv_lock_unlock_block(FLASH_INDIVIDUAL_LOCK,sector_no/FLASH_SECTOR_PER_BLOCK,sector_offset);
    status3.bits.WPS = 1;
    w25qxxxf_drv_write_nonvolatile_status_reg_bits(3,status3.all);
#endif
    
    return true;
}

/* 
  @Function
	void  w25qxxxf_interface_GetStoredParameters(void)

  @Summary
        `   
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
bool w25qxxxf_interface_erase_block(uint16_t block_no)
{
    if(w25qxxxf_interface.bits.setup_done != true)
        return false;

#ifdef DO_FLASH_PROTECT_BY_INDIVIDUAL_BLOCK_PROTECT_METHOD    
    w25qxxxf_status_reg3_t status3;
    
    if((block_no == 0) || (block_no == 255))
        w25qxxxf_drv_lock_unlock_block(FLASH_GLOBAL_UNLOCK,0,0);
    else
    {
        status3.all = w25qxxxf_drv_read_status_register(3);    
        status3.bits.WPS = 0;
        w25qxxxf_drv_write_nonvolatile_status_reg_bits(3,status3.all);
        w25qxxxf_drv_lock_unlock_block(FLASH_INDIVIDUAL_UNLOCK,block_no,0);
    }
#endif
    
    w25qxxxf_drv_erase_memory(BLOCK_TYPE_64KB,block_no);
    
#ifdef DO_FLASH_PROTECT_BY_INDIVIDUAL_BLOCK_PROTECT_METHOD    
    if((block_no == 0) || (block_no == 255))
        w25qxxxf_drv_lock_unlock_block(FLASH_GLOBAL_UNLOCK,0,0);
    else
    {
        w25qxxxf_drv_lock_unlock_block(FLASH_INDIVIDUAL_LOCK,block_no,0);
        status3.bits.WPS = 1;
        w25qxxxf_drv_write_nonvolatile_status_reg_bits(3,status3.all);
    }
#endif    
    
    return true;
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
void w25qxxxf_interface_chip_erase(void)
{
#ifdef DO_FLASH_PROTECT_BY_INDIVIDUAL_BLOCK_PROTECT_METHOD
    w25qxxxf_drv_lock_unlock_block(FLASH_GLOBAL_UNLOCK,0,0);
    delay_ms(5);
#else
    w25qxxxf_drv_relaese_power_down();
#endif
    w25qxxxf_drv_chip_erase();
    
#ifdef DO_FLASH_PROTECT_BY_INDIVIDUAL_BLOCK_PROTECT_METHOD
    w25qxxxf_drv_lock_unlock_block(FLASH_GLOBAL_LOCK,0,0);
#else
    w25qxxxf_drv_power_down_flash();
#endif
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
bool w25qxxxf_interface_read_security_register(uint8_t reg_no, uint8_t *data, uint16_t len)
{
    if(w25qxxxf_interface.bits.setup_done != true)
        return false;

    uint8_t buf[256] = {0};
    uint16_t n;
    
    if(len > 256)
        n = 256;
    else
        n = len;
    
    if(w25qxxxf_drv_operate_on_security_register(reg_no, FLASH_OPTYPE_READ,buf,n) != n)
    {
        memset(data,0,len);
        return false;
    }
    
    memcpy(data,buf,n);
    return true;
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
bool w25qxxxf_interface_write_security_register(uint8_t reg_no, uint8_t *data, uint16_t len)
{
    if(w25qxxxf_interface.bits.setup_done != true)
        return false;

    uint16_t n;
    
    // Restrict data length by length of each security register i.e. 256 bytes.
    if(len > 256)
        n = 256;
    else
        n = len;
    
    // To store new configuration erase previous one.
    w25qxxxf_drv_operate_on_security_register(reg_no, FLASH_OPTYPE_ERASE,NULL,0);
    // Now store newer one.
    if(w25qxxxf_drv_operate_on_security_register(reg_no, FLASH_OPTYPE_PROGRAM,data,n) != n)
        return false;
    else
        return true;
}

/* 
  @Function
	static void  WINBOND_APP_IntializeControlLines(void)

  @Summary
        
  
  @Arguments
         
  @Returns
        
  @Remarks
        
*/
bool w25qxxxf_interface_lock_security_register(uint8_t reg_no)
{
    if(w25qxxxf_interface.bits.setup_done != true)
        return false;
    
    w25qxxxf_status_reg2_t status2;
    
    status2.all = w25qxxxf_drv_read_status_register(2);
    status2.bits.LB = reg_no;
    w25qxxxf_drv_write_nonvolatile_status_reg_bits(2,status2.all);
    delay_ms(50);
    status2.all = w25qxxxf_drv_read_status_register(2);
    if(status2.bits.LB == reg_no)
        return true;
    else
        return false;
}

/*  End of file  */