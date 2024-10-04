/*
 * File:   App_user_interface.c
 * Author: 2020
 *
 * Created on June 10, 2022, 12:23 PM
 */

#include "App_user_interface.h"

app_settings_t  app_settings;



void App_user_interface_setup(void)
{
    
    // Set GPS location update interval.
    gprs_comm_interface.gps_location_update_interval = LOCATION_UPDATE_INTERVAL_MIN;
    
    // Set GPS location transmit interval to server.
    gprs_comm_interface.gps_data_tx_interval = BMODE_DATA_TX_INTERVAL_MIN;
    
    // Set cid for packet data protocol(PDP).
    gprs_comm_interface.gprs_info.pdp_cid = GPRS_PDP_CID;
    
    // Set SIM detection interval.
    Quectel_common_interface.sim_detection_interval = SIM_DETECTION_INTERVAL;
    
    // Set modem MAC ID.
    if(gprs_comm_interface.datastats.macid[0] == '\0')
        strcpy(gprs_comm_interface.datastats.macid,QUECTEL_MODEM_MACID);
    
    // Set MQTT client index.
    gprs_comm_interface.mqtt_config_info.client_idx = MQTT_CLIENT_INDEX_DEFAULT;
    
    // Set MQTT server url.
    if(gprs_comm_interface.mqtt_config_info.server_config_info.url[0] == '\0')
        strcpy(gprs_comm_interface.mqtt_config_info.server_config_info.url,MQTT_SERVER_URL_DEFAULT);
    
    // Set MQTT server port.
    if(gprs_comm_interface.mqtt_config_info.server_config_info.port == 0)
        gprs_comm_interface.mqtt_config_info.server_config_info.port = MQTT_SERVER_PORT_DEFAULT;
    
    // Set MQTT client ID.(Partially)
    if(gprs_comm_interface.mqtt_config_info.server_config_info.client_id[0] == '\0')
        strcpy(gprs_comm_interface.mqtt_config_info.server_config_info.client_id,MQTT_CLIENT_ID);   /* Complete client ID includes last 4 digit of IMEI */
    
    // Set MQTT client username(for authentication to server).
    if(gprs_comm_interface.mqtt_config_info.server_config_info.client_username[0] == '\0')
        strcpy(gprs_comm_interface.mqtt_config_info.server_config_info.client_username,MQTT_CLIENT_USERNAME);
    
    // Set MQTT client password(for authentication to server).
    if(gprs_comm_interface.mqtt_config_info.server_config_info.client_password[0] == '\0')
        strcpy(gprs_comm_interface.mqtt_config_info.server_config_info.client_password,MQTT_CLIENT_PASSWORD);
    
    // Set MQTT data packet sent timeout.
    gprs_comm_interface.mqtt_config_info.packet_timeout = MQTT_DATA_PACKET_TIMEOUT;
    
    // Set MQTT data packet transmit retry count.
    gprs_comm_interface.mqtt_config_info.retry_times = MQTT_DATA_PACKET_RETRY;
    
    // Set MQTT connection keep alive time.
    gprs_comm_interface.mqtt_config_info.keep_alive_time = MQTT_CONNECTION_KEEP_ALIVE;
    
    // Set MQTT receive message mode.
    gprs_comm_interface.mqtt_config_info.msg_recv_mode = MQTT_URC_NOT_CONTAINED_RECV_MSG;
    
    // Set MQTT received message settings.
    gprs_comm_interface.mqtt_config_info.msg_len_enable = MQTT_URC_CONTAINED_LEN_OF_RECV_MSG;
    
    // Set MQTT publish topic.
    if(gprs_comm_interface.mqtt_config_info.server_config_info.topic[0] == '\0')
        strcpy(gprs_comm_interface.mqtt_config_info.server_config_info.topic,MQTT_PUBLISH_TOPIC);
        
    
    
    // Calculate operating voltage range of Quectel.
    Quectel_common_interface.battery_operating_volt_range = (QUECTEL_OPERATING_VOLTAGE_MAX - QUECTEL_OPERATING_VOLTAGE_MIN);
}


void metal_attach_deattach_notifier_service(void)
{
    
    // Check flag to sense any change detected on metal sensor input port.
    if(IOCSTATbits.IOCPBF == 1)
    {
        // Check any change is there in metal sensor input pin.
        if(METAL_SENSOR_IOC_FLAG == 1)
        {
            // Check the PIN state.
            if(METAL_SENSOR_READ == HIGH)
                app_settings.addon_feature.bits.metal_attached = true;
            else
                app_settings.addon_feature.bits.metal_attached = false;
                
            // clear flag.
            METAL_SENSOR_IOC_FLAG = 0;
        }
        
    }
}
