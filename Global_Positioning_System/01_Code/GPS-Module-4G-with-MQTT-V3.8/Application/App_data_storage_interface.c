#include <string.h>
#include "App_data_storage_interface.h"


data_storage_interface_t    data_storage_interface;
bool                        flash_setup_success = false;
uint64_t                    last_offline_data_tx_time = 0;
char                        offline_data_packet_buffer[128];


/**
  @Summary
    
  @Description
    
  @Preconditions
    None.

  @Returns
    None.

  @Param
    None.

  @Comment
    
 
  @Example
    <code>
    
    </code>

*/
bool app_data_storage_interface_setup(void)
{
    uint16_t i = 0;
    data_storage_interface_t conf[2];
    uint32_t    address_base = (OFFLINE_DATA_HDR_BLOCK*FLASH_BLOCK_SIZE) + (OFFLINE_DATA_HDR_SECTOR_BASE*FLASH_SECTOR_SIZE);
    uint16_t    total_window_count = (OFFLINE_DATA_HDR_PAGE_COUNT*OFFLINE_DATA_HDR_WINDOW_PER_PAGE);
    uint32_t    current_address;
    
    
    memset(&conf[0],0,sizeof(data_storage_interface_t));
    
#ifdef DO_FLASH_PROTECT_BY_POWER_DOWN_METHOD
    w25qxxxf_drv_relaese_power_down();
#endif
    
    for(i=0; i<total_window_count; i++)
    {
        current_address = address_base + (i*OFFLINE_DATA_HDR_WINDOW_SIZE);
        memcpy(&conf[1],&conf[0],sizeof(data_storage_interface_t));
        w25qxxxf_interface_read_data_by_memory_address(current_address, (uint8_t *)&conf[0], sizeof(data_storage_interface_t));
        if(conf[0].magic_number != DATA_VALIDATION_MAGIC_NUMBER)
            break;
    }
    
    if(i == total_window_count)
        memcpy(&conf[1],&conf[0],sizeof(data_storage_interface_t));
    
    memcpy((uint8_t* )&data_storage_interface,(uint8_t* )&conf[1],sizeof(data_storage_interface_t));
    data_storage_interface.magic_number = DATA_VALIDATION_MAGIC_NUMBER;
    
#ifdef DO_FLASH_PROTECT_BY_POWER_DOWN_METHOD
    w25qxxxf_drv_power_down_flash();
#endif
    
    return true;
}

/**
  @Summary
    
  @Description
    
  @Preconditions
    None.

  @Returns
    None.

  @Param
    None.

  @Comment
    
 
  @Example
    <code>
    
    </code>

*/
void app_data_storage_load_user_configuration(void)
{
    app_settings_t setting;
    uint16_t n = 0;
     
#ifdef DO_FLASH_PROTECT_BY_POWER_DOWN_METHOD
    w25qxxxf_drv_relaese_power_down();
#endif
 
    n = sizeof(app_settings_t);
    w25qxxxf_interface_read_security_register(1, (uint8_t *)&setting, n);
    if(setting.magic_no == DATA_VALIDATION_MAGIC_NUMBER){
        memcpy((uint8_t *)&app_settings,(const uint8_t *)&setting, n);
    }
    
#ifdef DO_FLASH_PROTECT_BY_POWER_DOWN_METHOD
    w25qxxxf_drv_power_down_flash();
#endif
}

/**
  @Summary
    
  @Description
    
  @Preconditions
    None.

  @Returns
    None.

  @Param
    None.

  @Comment
    
 
  @Example
    <code>
    
    </code>

*/
bool app_data_storage_save_user_configuration(void)
{
    app_settings_t setting;
    bool success = true;
    uint16_t n = 0;
    
    n = sizeof(app_settings_t);
    memcpy((uint8_t *)&setting,(const uint8_t *)&app_settings, n);
    setting.magic_no = DATA_VALIDATION_MAGIC_NUMBER;
    
#ifdef DO_FLASH_PROTECT_BY_POWER_DOWN_METHOD
    w25qxxxf_drv_relaese_power_down();
#endif
    
    // Store new configuration in security register.
   success = w25qxxxf_interface_write_security_register(1, (uint8_t *)&setting, n);
   
#ifdef DO_FLASH_PROTECT_BY_POWER_DOWN_METHOD
    w25qxxxf_drv_power_down_flash();
#endif
    
    return success;
}

/**
  @Summary
    
  @Description
    
  @Preconditions
    None.

  @Returns
    None.

  @Param
    None.

  @Comment
    
 
  @Example
    <code>
    
    </code>

*/
bool app_data_storage_update_page_pointer_hdr()
{   
    uint32_t    address_base = (OFFLINE_DATA_HDR_BLOCK*FLASH_BLOCK_SIZE) + (OFFLINE_DATA_HDR_SECTOR_BASE*FLASH_SECTOR_SIZE);
    uint16_t    total_window_count = (OFFLINE_DATA_HDR_PAGE_COUNT*OFFLINE_DATA_HDR_WINDOW_PER_PAGE);
    uint16_t    current_window_index;
    uint32_t    current_address;
    data_storage_interface_t conf;
    bool        data_integrety_flag = false;
    
    current_window_index = data_storage_interface.write_index%total_window_count;

START_WRITE_HDR:
    if(current_window_index == 0)
    {
        w25qxxxf_interface_erase_block(OFFLINE_DATA_HDR_BLOCK);
        data_storage_interface.write_index = 0;
    }
    current_address = address_base + (current_window_index*OFFLINE_DATA_HDR_WINDOW_SIZE);
    w25qxxxf_interface_write_data_by_memory_address(current_address,(uint8_t *)&data_storage_interface, sizeof(data_storage_interface_t));
    delay_ms(10);
    w25qxxxf_interface_read_data_by_memory_address(current_address,(uint8_t *)&conf,sizeof(data_storage_interface_t));    
    if(memcmp(&data_storage_interface,&conf,sizeof(data_storage_interface_t)) != 0)
    {
        if(data_integrety_flag == true)
            return false;
        
        data_integrety_flag = true;
        current_window_index = 0;
        goto START_WRITE_HDR;
    }
    
    data_storage_interface.write_index += 1;
    return true;
}

/**
  @Summary
    
  @Description
    
  @Preconditions
    None.

  @Returns
    None.

  @Param
    None.

  @Comment
    
 
  @Example
    <code>
    
    </code>

*/
bool app_data_storage_push_location_data(char *data, uint16_t size)
{      
#ifdef DO_FLASH_PROTECT_BY_POWER_DOWN_METHOD
    w25qxxxf_drv_relaese_power_down();
#endif
    
    uint16_t current_page,page_base = (OFFLINE_DATA_CONTENT_BLOCK_BASE*FLASH_PAGE_PER_BLOCK),n;
    uint32_t magic_no;
       
    
    // Calculate basic page address to start with offline data storage then add-on
    // current page count to store new data.
    current_page = page_base + data_storage_interface.head;
    
    // Check current page count exceeds/ standing on number of pages per sector
    // or multiple of number of pages per sector.
    if((current_page%FLASH_PAGE_PER_SECTOR) == 0)
    {
        // Determine the sector number.
        n = (current_page/FLASH_PAGE_PER_SECTOR);
        
        // Erase the last sector used.
        w25qxxxf_interface_erase_sector(n);
    }

    // Insert data validation magic number.
    magic_no = DATA_VALIDATION_MAGIC_NUMBER;
    
    // Write magic number to current pointing page.
    w25qxxxf_interface_write_data_by_page_no(current_page, OFFLINE_DATA_CONTENT_VALIDATOR_ADDR_OFFSET, (uint8_t *)&magic_no, sizeof(uint32_t));
    // Now store data to rest position of current pointing page.
    w25qxxxf_interface_write_data_by_page_no(current_page, OFFLINE_DATA_CONTENT_ADDR_OFFSET, (uint8_t *)data, size);
    
    // Increment the page pointer to next page.
    data_storage_interface.head += 1;
    // If pointer exceeds maximum page allowed in offline mode then circulate it.
    if(data_storage_interface.head > OFFLINE_DATA_END_POINT)
        data_storage_interface.head = 0;
    
    // Store page pointer.
    app_data_storage_update_page_pointer_hdr();

#ifdef DO_FLASH_PROTECT_BY_POWER_DOWN_METHOD
    w25qxxxf_drv_power_down_flash();
#endif    
    
    return true;
}

/**
  @Summary
    
  @Description
    
  @Preconditions
    None.

  @Returns
    None.

  @Param
    None.

  @Comment
    
 
  @Example
    <code>
    
    </code>

*/
bool app_data_storage_pop_location_data(char *data,uint16_t size)
{
    // Check data storing pointer.
   if(data_storage_interface.head == data_storage_interface.tail)
       // No data is available in storage to fetch.
       return false;
   
    uint16_t current_page,page_base = (OFFLINE_DATA_CONTENT_BLOCK_BASE*256);
    uint32_t magic_no;
    
#ifdef DO_FLASH_PROTECT_BY_POWER_DOWN_METHOD
    w25qxxxf_drv_relaese_power_down();
#endif
    
    // Data available to fetch. Calculate basic page number to start with & increment
    // by last fetched page number to reach current page.
    current_page = page_base + data_storage_interface.tail;
    
    // Increment page pointer to next page to be fetched.
    data_storage_interface.tail += 1;
    if(data_storage_interface.tail > OFFLINE_DATA_END_POINT)
        data_storage_interface.tail = 0;
    
    app_data_storage_update_page_pointer_hdr();
    // Fetch data validating magic number first.
    w25qxxxf_interface_read_data_by_page_no(current_page, OFFLINE_DATA_CONTENT_VALIDATOR_ADDR_OFFSET, (uint8_t *)&magic_no, sizeof(uint32_t)); 
    // Check magic number.
    if(magic_no != DATA_VALIDATION_MAGIC_NUMBER)
        return false;

    // If magic number validates data then fetch rest data of the page.
    w25qxxxf_interface_read_data_by_page_no(current_page, OFFLINE_DATA_CONTENT_ADDR_OFFSET, (uint8_t *)data, size);
    
#ifdef DO_FLASH_PROTECT_BY_POWER_DOWN_METHOD
    w25qxxxf_drv_power_down_flash();
#endif
    
    return true;
}

static bool prepare_offline_data_packet(void)
{
    uint8_t len = 0;
    
    if(strlen(gps_common_interface.data_packet_buffer) == 0)
        return false;
    else
    {
        memset(offline_data_packet_buffer,'\0',sizeof(offline_data_packet_buffer));
        len = strlen(gps_common_interface.data_packet_buffer);
        memcpy(offline_data_packet_buffer,gps_common_interface.data_packet_buffer,len);
        
        return true;
    }
}


/**
  @Summary
    
  @Description
    
  @Preconditions
    None.

  @Returns
    None.

  @Param
    None.

  @Comment
    
 
  @Example
    <code>
    
    </code>

*/
void app_data_storage_location_data_maintainance_service(void)
{
    bool result = false;
    uint8_t len = 0;
    
    /* Data push service to flash chip */
    
    // Check location data loading status.
    if(gps_common_interface.bits.location_data_loaded)
    {
        // On successful preparation of data packet.
        char ts[24] = {'\0'};
        gps_common_interface.bits.location_data_loaded = false;

        // Check data sent status to server.
        if(!gprs_comm_interface.bits.data_sent_success)
        {
            len = strlen(gps_common_interface.data_packet_buffer);
            if(app_data_storage_push_location_data(gps_common_interface.data_packet_buffer,len))
            {
                // Fetch current time.
                time_now(ts);
                // Save the current time as last packet stored timestamp in offline mode.
                sprintf(gprs_comm_interface.datastats.last_pkt_stored_ts,"%s",ts);
                // Determine number of packets stored in offline; each data store in a single page each time.
                // so number of page count will be number of packets stored in offline mode.
                //gprs_comm_interface.datastats.offline_pkts_stored = data_storage_interface.head - data_storage_interface.tail;
            }

            /* Reset all parameters to zero so that same data can't reach to server again */
            //memset((uint8_t *)&kwh_mtr_interface.emdata.rawdata,0,sizeof(kwh_mtr_interface.emdata.rawdata)); 
        }
    }
    
    
    /* Data pop or retrieve service from flash chip */
    
    // Check data sending status.
    if(gprs_comm_interface.bits.data_sent_success)
    {
        // Allow entry at a 5 seconds interval.
        if(tick_now() - last_offline_data_tx_time > (5*TICK_SECOND))
        {
            // Update current time of sending.
            last_offline_data_tx_time = tick_now();
            
            // If last offline data packet sending failure then try that packet
            // else pop newer one.
            if(gprs_comm_interface.bits.last_offline_packet_tx_failed != true)
            {
                // pop new data packet;if any
                memset(gps_common_interface.data_packet_buffer,'\0',sizeof(gps_common_interface.data_packet_buffer));
                if(app_data_storage_pop_location_data(gps_common_interface.data_packet_buffer,sizeof(gps_common_interface.data_packet_buffer)))
                    result = prepare_offline_data_packet();
            }
            else
                result = true;
            
            if(result)
            {
                data_comm_MQTT_publish(offline_data_packet_buffer,gprs_comm_interface.mqtt_config_info.client_idx,
                                       gprs_comm_interface.mqtt_config_info.server_config_info.topic,len);
            }
        }
    }
    
            
}

/* End of File */