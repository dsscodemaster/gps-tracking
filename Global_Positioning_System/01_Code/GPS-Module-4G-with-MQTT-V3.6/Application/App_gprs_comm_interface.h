/* Microchip Technology Inc. and its subsidiaries.  You may use this software 
 * and any derivatives exclusively with Microchip products. 
 * 
 * THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS".  NO WARRANTIES, WHETHER 
 * EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED 
 * WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A 
 * PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION 
 * WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION. 
 *
 * IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
 * INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
 * WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS 
 * BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE.  TO THE 
 * FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS 
 * IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF 
 * ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *
 * MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE 
 * TERMS. 
 */

/* 
 * File:   
 * Author: 
 * Comments:
 * Revision history: 
 */

// This is a guard condition so that contents of this file are not included
// more than once.  
#ifndef _APP_GPRS_COMM_INTERFACE_H
#define	_APP_GPRS_COMM_INTERFACE_H

#include "App_setup.h"

#define LOCATION_UPDATE_INTERVAL_MAX        15   // In seconds.
#define LOCATION_UPDATE_INTERVAL_MIN        1   // In seconds.
#define BMODE_DATA_TX_INTERVAL_MIN          3   // In seconds.
#define GPRS_PDP_CID                        1
#define QUECTEL_MODEM_MACID                 "BC:DD:C2:2E:D6:02"

#define MQTT_CLIENT_INDEX_DEFAULT           1
#define MQTT_SERVER_URL_DEFAULT             "45.64.237.125"
#define MQTT_SERVER_PORT_DEFAULT            8883
#define MQTT_PUBLISH_TOPIC                  "test"

#define MQTT_CLIENT_ID                      "DSS_GPS_"
#define MQTT_CLIENT_USERNAME                "dssgpsservice"
#define MQTT_CLIENT_PASSWORD                "dss@2118"

#define MQTT_DATA_PACKET_TIMEOUT            2   // In seconds.
#define MQTT_DATA_PACKET_RETRY              2
#define MQTT_CONNECTION_KEEP_ALIVE          30
#define MQTT_URC_CONTAINED_RECV_MSG         0
#define MQTT_URC_NOT_CONTAINED_RECV_MSG     1

#define MQTT_URC_NOT_CONTAINED_LEN_OF_RECV_MSG  0
#define MQTT_URC_CONTAINED_LEN_OF_RECV_MSG      1

#ifdef	__cplusplus
extern "C" {
#endif /* __cplusplus */
    
    /* Data structure of the used data nodes Start */
    
    typedef enum
    {
        CHECK_MQTT_CONNECTION = 0,
        CHECK_MQTT_NETWORK,
        CHECK_GPRS_NETWORK_REGISTRATION
    }GPRS_MQTT_NETWORK_ERROR_STATE;
    
    typedef enum
    {
        FAILED_TO_OPEN_NETWORK = -1,
        NETWORK_OPENED_SUCCESSFULLY = 0,
        WRONG_PARAMETER,
        MQTT_IDENTIFIER_IS_OCCUPIED,
        FAILED_TO_ACTIAVTE_PDP,
        FAILED_TO_PARSE_DOMAIN_NAME,
        NETWORK_CONNECTION_ERROR,
        NETWORK_COMMAND_NOT_FOUND
    }NETWORK_STATUS_FOR_MQTT_CLIENT;
    
    typedef enum
    {
        CONNECTION_ACCEPTED = 0,
        CONNECTION_REFUSED_UNACCEPTABLE_PROTOCOL_VERSION,
        CONNECTION_REFUSED_IDENTIFIER_REJECTED,
        CONNECTION_REFUSED_SERVER_UNAVAIABLE,
        CONNECTION_REFUSED_BAD_USERNAME_OR_PASSWORD,
        CONNECTION_REFUSED_NOT_AUTHORIZED
    }MQTT_CLIENT_SERVER_CONNECTION_STATUS;
    
    typedef enum
    {
        PACKET_SENT_AND_ACKNOWLEDGEMENT_RECEIVED = 0,
        PACKET_RETRANSMISSION,
        FAILED_TO_SEND_PACKET
    }MQTT_CONNECTION_PACKET_STATUS;
    
    typedef enum
    {
        MESSAGE_SENT_AND_ACKNOWLEDGEMENT_RECEIVED = 0,
        MESSAGE_RETRANSMISSION,
        FAILED_TO_SEND_MESSAGE
    }MQTT_PUBLISH_MSG_STATUS;
    
    typedef enum
    {
        MQTT_IS_INITIAL = 1,
        MQTT_IS_CONNECTING,
        MQTT_IS_CONNECTED,
        MQTT_IS_DISCONNECTING,
        CONN_COMMAND_NOT_FOUND       
    }MQTT_CONNECTION_STATE;

    typedef enum
    {
        GPRSSETUPSTATE_START = 0,
        GPRSSETUPSTATE_ATTACH_TO_GPRS_SERVICE,
        GPRSSETUPSTATE_APN_SETTING,
        GPRSSETUPSTATE_ACTIVATE_PDP,
        GPRSSETUPSTATE_NW_REGISTRATION,
        GPRSSETUPSTATE_GET_IP_ADDR,
        GPRSSETUPSTATE_CONNECTED
    }GPRS_SETUP_STATE;    
    
    typedef enum
    {
        NOT_REGISTERED_NOT_SEARCHING = 0,
        REGISTERED_TO_HOME_NETWORK,
        NOT_REGISTERED_BUT_SEARCHING,
        REGISTRATION_DENIED,
        UNKNOWN_STATE,
        REGISTERED_TO_ROAMING
    }GPRS_NETWORK_REGISTRATION_STATE;

    typedef struct
    {
        uint32_t            pkt_sent;
        uint32_t            pkt_unsent;
        uint32_t            pkt_rcvd;
        int16_t             error_code;
        uint64_t            last_sent_pkt_time;
        char                macid[20];
    }modem_data_stats_t;  
    
    typedef struct
    {
        uint8_t                     ms_class;
        uint8_t                     pdp_cid;
        char                        apn[20];
        char                        ip[20];
        char                        user[32];
        char                        password[32];
    }gprs_status_info_t;
    
    typedef struct
    {
        char        url[20];
        uint16_t    port;
        char        client_id[30];
        char        client_username[30];
        char        client_password[30];
        char        topic[20];
        
    }server_config_t;
    
    typedef struct
    {
        NETWORK_STATUS_FOR_MQTT_CLIENT          mqtt_client_network_status;
        MQTT_CLIENT_SERVER_CONNECTION_STATUS    client_server_connection_status;
        MQTT_CONNECTION_PACKET_STATUS           connection_packet_status;
        MQTT_PUBLISH_MSG_STATUS                 last_pub_msg_status;
        server_config_t                         server_config_info;
        uint8_t                                 client_idx;   
        uint8_t                                 packet_timeout;
        uint8_t                                 retry_times;
        uint16_t                                keep_alive_time;
        uint8_t                                 msg_recv_mode;
        uint8_t                                 msg_len_enable;
        uint64_t                                error_handling_delay_start;
        
    }mqtt_connection_config_t;

    typedef struct
    {
        GPRS_SETUP_STATE                        setup_state;
        GPRS_MQTT_NETWORK_ERROR_STATE           network_error_handling_state;
        gprs_status_info_t                      gprs_info;
        modem_data_stats_t                      datastats;
        mqtt_connection_config_t                mqtt_config_info;
        uint64_t                                nw_fail_th_timer;
        uint64_t                                gprs_task_start_timer;
        uint16_t                                gps_location_update_interval;
        uint16_t                                gps_data_tx_interval;
        union
        {
            struct _app_data_comm_interface_t_bits
            {
                uint16_t data_roaming: 1;
                uint16_t modem_info_loaded: 1;
                uint16_t modem_info_sent: 1;
                uint16_t data_sent_success: 1;
                uint16_t mqtt_service_up: 1;
                uint16_t gprs_core_task_started: 1;
                uint16_t gprs_service_enabled: 1;
                uint16_t gprs_connection_down: 1; 
                uint16_t sch_conf_chk_fail: 1;
                uint16_t resvd: 7;
            }bits;
            uint16_t flags;
        };
    }gprs_comm_interface_t;    
    
    
    /* Data structure of the used data nodes End */
    
    /* Global variable declarations */
    
    extern gprs_comm_interface_t    gprs_comm_interface;
    extern uint8_t                  error_handling_retry_cnt;
    
    /* Implemented function declarations */
    
    void App_quectel_gprs_interface_setup(void);
    void Send_GPS_location_to_server(void);
    void Handle_GPRS_MQTT_network_error(void);
        

#ifdef	__cplusplus
}
#endif /* __cplusplus */

#endif	/* _APP_GPRS_COMM_INTERFACE_H */

