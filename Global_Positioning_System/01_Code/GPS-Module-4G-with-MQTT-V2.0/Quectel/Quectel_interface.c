/*
 * File:   Quectel_interface.c
 * Author: 2020
 *
 * Created on June 1, 2022, 4:44 PM
 */

#include "Quectel_interface.h"




void Quectel_flush_received_data(void) 
{
    uint8_t dummy[50];

    do
    {
        delay_ms(10);
    }while(UART2_ReadBuffer(dummy, 50) > 0);
}


bool Quectel_send_command_and_check_response(const char* cmd, char *expected_resp, char *rx_buf, uint16_t max_out_len, uint32_t timeout, bool flag) 
{

    if (flag == true)
        Quectel_flush_received_data();

    if(strlen(cmd) > 0)
        UART2_WriteBuffer((uint8_t *) cmd, strlen(cmd));
    
    if((expected_resp == NULL) && (rx_buf == NULL))
        return true;
    
    uint16_t rx_len = 0, n = 0, buf_out_len = 0;
    char buf[255] = {'\0'};
    uint64_t t;
    uint32_t to = (timeout*TICK_SECOND);
       
    t = tick_now();
    do 
    {      
        n = UART2_ReadBuffer((uint8_t *) & buf[rx_len], (255 - rx_len));
        buf[rx_len + n] = '\0';

        if((max_out_len > 0) && (rx_buf != NULL))
        {
            if (buf_out_len < max_out_len)
            {
                if ((buf_out_len + n) < max_out_len) {
                    sprintf(&rx_buf[buf_out_len], "%s", &buf[rx_len]);
                }
                else {
                    memcpy(&rx_buf[buf_out_len],&buf[rx_len],(max_out_len - buf_out_len - 1));
                    rx_buf[max_out_len-1] = '\0';
                }
            }
            buf_out_len += n;
            if((expected_resp == NULL) && (buf_out_len >= max_out_len))
            {
                rx_buf[max_out_len-1] = '\0';
                return true;
            }
        }
        
        rx_len += n;
        if(rx_len >= 255)
            rx_len = 0;
        
        if(strlen(buf) > 0)
        {
            if(expected_resp != NULL)
            {
                if (strstr(buf, expected_resp))
                    return true;
            }
            
            if(strstr(buf,"ERROR\r\n"))
                return false; 
        }

    }while ((tick_now() - t) < to);

    return false;
}



bool Quectel_sync_at_interface() 
{
    //int count = 5;
    //char buf[255] = {'\0'};


    

    

    return false;
}


char *Quectel_data_from_response(char *datain, const char *cmdstr) 
{
    char *ptr;
    uint16_t n = 0;

    if (cmdstr == NULL)
        return datain;

    n = strlen(cmdstr);
    if (n == 0)
        return datain;

    if ((ptr = strstr(datain, cmdstr)) == NULL)
        return NULL;

    ptr += (n + 1);
    while (*ptr == ' ')
        ptr++;

    return ptr;
}


bool Quectel_power_up(void)
{
    
    /* On system power up the quectel module powered up first and then it powered
       the microcontroller unit */
    
    char buf[255] = {'\0'};
    
    // Check for modem URC commands.
    Quectel_send_command_and_check_response("",NULL,buf,128,5,false);    
    
    // Check for modem initialization ready and full functionality status.
    if(strstr(buf,"RDY"))
    {
        if(strstr(buf,"+CFUN: 1"))
        {
            // Set flag.
            Quectel_common_interface.bits.full_func_mode = true;
            return true;
        }
    }    
    
    return false;
}


bool Quectel_functionality_level(void)
{
    char buff[32],*ptr;
    
    // Send command.
   Quectel_send_command_and_check_response("AT+CFUN?\r\n","OK\r\n",buff,48,15,true);
   
   // Check the response.
   if((ptr = strstr(buff,"+CFUN: 1")) != NULL)
   {
       // Set flag.
       Quectel_common_interface.bits.full_func_mode = true;
       return true;
   }   
   
   return false;
}