/* 
 * File:   app_offline_storage.h
 * Author: Mani
 *
 * Created on November 18, 2018, 7:17 PM
 */

#ifndef __APP_DATA_STORAGE_INTERFACE_H
#define	__APP_DATA_STORAGE_INTERFACE_H

#include "App_setup.h"

#ifdef	__cplusplus
extern "C" {
#endif
    
    typedef struct
    {
        uint16_t    head;
        uint16_t    tail;
        uint16_t    write_index;
        uint32_t    magic_number;        

    }data_storage_interface_t;

    extern data_storage_interface_t     data_storage_interface;
    extern bool                         flash_setup_success;
    extern uint64_t                     last_offline_data_tx_time;
    extern char                         offline_data_packet_buffer[128];
    
    bool app_data_storage_interface_setup(void);
    void app_data_storage_load_user_configuration(void);
    bool app_data_storage_save_user_configuration(void);
    bool app_data_storage_update_page_pointer_hdr(void);
    bool app_data_storage_push_location_data(char *data,uint16_t size);
    bool app_data_storage_pop_location_data(char *data,uint16_t size);
    void app_data_storage_location_data_maintainance_service(void);
    
#ifdef	__cplusplus
}
#endif

#endif	/* __APP_DATA_STORAGE_INTERFACE_H */

