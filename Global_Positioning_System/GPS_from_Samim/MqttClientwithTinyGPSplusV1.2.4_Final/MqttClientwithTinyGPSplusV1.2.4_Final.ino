#include <TinyGPS++.h>  /* GNSS NMEA sentense */

#define TINY_GSM_MODEM_MC60
// #define TINY_GSM_MODEM_MC60E

#include <TinyGsmClient.h>  /* GPRS services */

// Use Hardware Serial on Mega, Leonardo, Micro
#define SerialAT Serial1

// You can change it to TIM2, TIM3, or whatever.
#define TIMER  TIM4

// The serial connection to the GPS device
HardwareSerial Serial3(PB11, PB10);

// The TinyGPS++ object
TinyGPSPlus gps;

TinyGsm modem(SerialAT);
//TinyGsmClient client(modem);

// Your GPRS credentials
// Leave empty, if missing user or pass

#define MC60_POWERON PA2

String buf = "";

const char apn[]  = "airtelgprs.com";
const char user[] = "";
const char pass[] = "";
String macid = "BC:DD:C2:2E:D6:00,";

volatile static TIM_HandleTypeDef HTIMx;
volatile static uint32_t gu32_ticks = 0;

char msg[50];
int delay_ms = 500;
int _timeDelay = 1000, DEFAULT_TIMEOUT = 2;

/************************************************************************************************************************/

void sendCmd(const char* cmd) {
  for(uint16_t i = 0; i < strlen(cmd); i++) {
    Serial1.write(cmd[i]);
  }
}

/************************************************************************************************************************/

int sendCmdAndWaitForResp(const char* cmd, const char* resp, unsigned timeout) {
  sendCmd(cmd);
  return waitForResp(resp, timeout);
}

/************************************************************************************************************************/
int waitForResp(const char* resp, unsigned int timeout) {
  int len = strlen(resp);
  int sum = 0;
  unsigned long timerStart, timerEnd;
  timerStart = millis();

  while (1) {
    if (Serial1.available()) {
      char c = Serial1.read();
      sum = (c == resp[sum]) ? sum + 1 : 0;
      if (sum == len) {
          break;
      }
    }
    timerEnd = millis();
    if (timerEnd - timerStart > 1000 * timeout) {
        return -1;
    }
  }
  while (Serial1.available()) {
    Serial1.read();
  }
  return 0;
}

void flush_serial1() {
  while (Serial1.available()) {
    Serial1.read();
  }
}

/************************************************************************************************************************/
void _gnssOn(void) {
  
  sendCmdAndWaitForResp("AT\r\n", "OK", DEFAULT_TIMEOUT);
  sendCmdAndWaitForResp("AT+QGNSSC=0\r\n", "OK", DEFAULT_TIMEOUT);
  if(sendCmdAndWaitForResp("AT+QGNSSC?\r\n", "+QGNSSC: 0", DEFAULT_TIMEOUT) != -1) {
    sendCmdAndWaitForResp("AT+QGNSSC=1\r\n", "OK", DEFAULT_TIMEOUT);
    Serial.println("GNSS ON");
  }
  sendCmdAndWaitForResp("AT+QGNSSC=1\r\n", "OK", DEFAULT_TIMEOUT);

  /*sendCmd("AT+QGNSSCMD=0,\"$PMTK010,001*2E\"\r\n");   //PMTK_SYS_MSG
  while (Serial1.available()){
     String inData = Serial1.readStringUntil('\n');
     Serial.println("PMTK_SYS_MSG: " + inData);
     inData="";
  }
  delay(delay_ms);*/

  sendCmd("AT+QGNSSCMD=0,\"$PMTK104*37\"\r\n");     //GNSS full cold start
  while (SerialAT.available()){
     String inData = Serial1.readStringUntil('\n');
     Serial.println("GNSS full cold start: " + inData);
     inData="";
  }
  DWT_Delay_ms(_timeDelay);
 
  sendCmd("AT+QGNSSCMD=0,\"$PMTK353,1,1,1,1,0*2B\"\r\n");   //GNSS Searching successed
  while (SerialAT.available()){
     String inData = SerialAT.readStringUntil('\n');
     Serial.println("GNSS Searching successed: " + inData);
     inData="";
  }
  DWT_Delay_ms(_timeDelay);

  sendCmd("AT+QGNSSCMD=0,\"$PMTK353,1,1,1,1,0*2B\"\r\n");   //GNSS Searching successed
  while (SerialAT.available()){
     String inData = SerialAT.readStringUntil('\n');
     Serial.println("GNSS Searching successed: " + inData);
     inData="";
  }
  DWT_Delay_ms(_timeDelay);
  
  sendCmd("AT+QGNSSCMD=0,\"$PMTK386,0.3*3E\"\r\n");       //PMTK_API_SET_STATIC_NAV_THD
  while (SerialAT.available()){
     String inData = SerialAT.readStringUntil('\n');
     Serial.println("PMTK_API_SET_STATIC_NAV_THD: " + inData);
     inData="";
  }
  DWT_Delay_ms(_timeDelay);
  
  sendCmd("AT+QGNSSCMD=0,\"$PMTK386,0.3*3E\"\r\n");       //PMTK_API_SET_STATIC_NAV_THD
  while (SerialAT.available()){
     String inData = SerialAT.readStringUntil('\n');
     Serial.println("PMTK_API_SET_STATIC_NAV_THD: " + inData);
     inData="";
  }
  DWT_Delay_ms(_timeDelay);

  sendCmd("AT+QGNSSTS?\r\n");
  while (SerialAT.available()){
     String inData = SerialAT.readStringUntil('\n');
     Serial.println("PMTK_SET_NMEA_UPDATERATE: " + inData);
     inData="";
  }
  DWT_Delay_ms(_timeDelay);

  sendCmd("AT+QGNSSEPO=1\r\n");
  while (SerialAT.available()){
     String inData = SerialAT.readStringUntil('\n');
     Serial.println("PMTK_SET_NMEA_UPDATERATE: " + inData);
     inData="";
  }
  DWT_Delay_ms(_timeDelay);
  
  sendCmd("AT+QGEPOAID\r\n");
  while (SerialAT.available()){
     String inData = SerialAT.readStringUntil('\n');
     Serial.println("PMTK_SET_NMEA_UPDATERATE: " + inData);
     inData="";
  }
  DWT_Delay_ms(_timeDelay);

}

/************************************************************************************************************************/

// Every second, print on serial MyData. And increment it.
void Update_gps_callback(void) {
  while (Serial3.available() > 0) {
    if (gps.encode(Serial3.read())) {
      if (gps.location.isValid()) {
        buf = "";        
        buf += macid;
        buf += String(gps.location.lat(), 6);
        buf += F(",");
        buf += String(gps.location.lng(), 6);
        buf += F(",");
        buf += String(gps.speed.kmph());
        buf += String("\0\r\n");
        //Serial.print(buf); Serial.println("Timer Call");
      }
    }
  }
}

/************************************************************************************************************************/

uint32_t DWT_Delay_Init(void) {
  /* Disable TRC */
  CoreDebug->DEMCR &= ~CoreDebug_DEMCR_TRCENA_Msk; // ~0x01000000;
  /* Enable TRC */
  CoreDebug->DEMCR |=  CoreDebug_DEMCR_TRCENA_Msk; // 0x01000000;

  /* Disable clock cycle counter */
  DWT->CTRL &= ~DWT_CTRL_CYCCNTENA_Msk; //~0x00000001;
  /* Enable  clock cycle counter */
  DWT->CTRL |=  DWT_CTRL_CYCCNTENA_Msk; //0x00000001;

  /* Reset the clock cycle counter value */
  DWT->CYCCNT = 0;

  /* 3 NO OPERATION instructions */
  __ASM volatile ("NOP");
  __ASM volatile ("NOP");
  __ASM volatile ("NOP");

  /* Check if clock cycle counter has started */
  if(DWT->CYCCNT)
  {
     return 0; /*clock cycle counter started*/
  }
  else
  {
    return 1; /*clock cycle counter not started*/
  }
}

/************************************************************************************************************************/
// This Function Provides Delay In Microseconds Using DWT
 
void DWT_Delay_us(volatile uint32_t au32_microseconds) {
  uint32_t au32_initial_ticks = DWT->CYCCNT;
  uint32_t au32_ticks = (HAL_RCC_GetHCLKFreq() / 1000000);
  au32_microseconds *= au32_ticks;
  while ((DWT->CYCCNT - au32_initial_ticks) < au32_microseconds-au32_ticks);
}

/************************************************************************************************************************/
// This Function Provides Delay In Milliseconds Using DWT
 
void DWT_Delay_ms(volatile uint32_t au32_milliseconds) {
  uint32_t au32_initial_ticks = DWT->CYCCNT;
  uint32_t au32_ticks = (HAL_RCC_GetHCLKFreq() / 1000);
  au32_milliseconds *= au32_ticks;
  while ((DWT->CYCCNT - au32_initial_ticks) < au32_milliseconds);
}

/************************************************************************************************************************/

void setup() {
  // Set console baud rate
  Serial.begin(115200);
  Serial3.begin(115200);
  // Set GSM module baud rate
  SerialAT.begin(115200);

  DWT_Delay_Init();
  
  pinMode(MC60_POWERON, OUTPUT);
  DWT_Delay_ms(1000);
  
  DWT_Delay_ms(300);
  digitalWrite(MC60_POWERON, HIGH);              // turn the GSM Modem ON by making the voltage HIGH
  DWT_Delay_ms(1000);
  digitalWrite(MC60_POWERON, LOW);               // turn the GSM Modem off by making the voltage LOW
  DWT_Delay_ms(2000); 
 
  // Restart takes quite some time
  // To skip it, call init() instead of restart()
  Serial.println("Initializing modem...");
  modem.restart();

  //String modemInfo = modem.getModemInfo();
  //Serial.println("Modem: " + modem.getModemInfo());
  //Serial.println(modemInfo);

  // Unlock your SIM card with a PIN
  //modem.simUnlock("1234");

  Serial.println("Waiting for network...");
  if (!modem.waitForNetwork()) {
    Serial.println(" fail");
    //while (true);
  }
  Serial.println(" OK");

  if (modem.isNetworkConnected()) {
    Serial.println("Network connected"); 
  }

  /*Serial.print("Connecting to ");
  Serial.print(apn);
  if (modem.gprsConnect(apn, user, pass)) {
    Serial.println("gprsConnected");
    //while (true);
  }
  //Serial.println(" OK");*/
   
  if(!modem.deleteAllSMS()) {
    Serial.println("SMSDeleteAll");
  }

  _gnssOn();
  DWT_Delay_ms(_timeDelay);
  
#if defined(TIM2)
  TIM_TypeDef *Instance = TIM1;
#else
  TIM_TypeDef *Instance = TIM2;
#endif

  // Instantiate HardwareTimer object. Thanks to 'new' instanciation, HardwareTimer is not destructed when setup() function is finished.
  HardwareTimer *MyTim = new HardwareTimer(Instance);

  MyTim->setOverflow(1, HERTZ_FORMAT); // 1 Hz
  MyTim->attachInterrupt(std::bind(Update_gps_callback)); // bind argument to callback: When Update_IT_callback is called MyData will be given as argument
  MyTim->resume();
}

/************************************************************************************************************************/

void loop() {
  // Make sure we're still registered on the network
  
  while (Serial3.available() > 0) {
    if (gps.encode(Serial3.read())) {
        if (!modem.isNetworkConnected()) {
          Serial.println("Network disconnected");
          if (!modem.waitForNetwork(10000L, true)) {
            Serial.println(" fail");
            DWT_Delay_ms(5000);
            return;
          }
        if (modem.isNetworkConnected()) {
          Serial.println("Network re-connected");
        }
    
    #if TINY_GSM_USE_GPRS
        // and make sure GPRS/EPS is still connected
        if (!modem.isGprsConnected()) {
          Serial.println("GPRS disconnected!");
          Serial.print(F("Connecting to "));
          Serial.print(apn);
          if (!modem.gprsConnect(apn, gprsUser, gprsPass)) {
            Serial.println(" fail");
            DWT_Delay_ms(5000);
            return;
          }
          if (modem.isGprsConnected()) { Serial.println("GPRS reconnected"); }
        }
    #endif
      }
      displayInfo(buf);
    }
  }

  if (millis() > 5000 && gps.charsProcessed() < 10)
  {
    Serial.println(F("No GPS detected: check wiring."));
    while(true);
  }
}

void flush_print(String nam){
  while (SerialAT.available()){
    String inData = SerialAT.readStringUntil('\n');
    Serial.println(nam + inData);
    inData="";
  }
}

/************************************************************************************************************************/

void displayInfo(String buf) {
  Serial.print(F("Location: ")); 
  if (gps.location.isValid()) {
    
    Serial.println(buf);

    if(sendCmdAndWaitForResp("AT+QMTCFG=\"WILL\",0,0,0,0\n\r", "OK", DEFAULT_TIMEOUT) != -1) {
      //sendCmdAndWaitForResp("AT+QGNSSC=1\r\n", "OK", DEFAULT_TIMEOUT);
      Serial.println("WILL ON");
    }

    if(sendCmdAndWaitForResp("AT+QMTCFG=\"TIMEOUT\",0,10,5\n\r", "OK", DEFAULT_TIMEOUT) != -1) {
      //sendCmdAndWaitForResp("AT+QGNSSC=1\r\n", "OK", DEFAULT_TIMEOUT);
      Serial.println("TIMEOUT ON");
    }
     
    if(sendCmdAndWaitForResp("AT+QMTCFG=\"SESSION\",0,0\n\r", "OK", DEFAULT_TIMEOUT) != -1) {
      //sendCmdAndWaitForResp("AT+QGNSSC=1\r\n", "OK", DEFAULT_TIMEOUT);
      Serial.println("SESSION ON");
    }

    if(sendCmdAndWaitForResp("AT+QMTCFG=\"KEEPALIVE\",0,30\n\r", "OK", DEFAULT_TIMEOUT) != -1) {
      //sendCmdAndWaitForResp("AT+QGNSSC=1\r\n", "OK", DEFAULT_TIMEOUT);
      Serial.println("KEEPALIVE ON");
    }

    if(sendCmdAndWaitForResp("AT+QMTOPEN=0,\"45.64.237.125\",8883\r\n", "+QMTOPEN: 0,0", DEFAULT_TIMEOUT) != -1) {
      //sendCmdAndWaitForResp("AT+QGNSSC=1\r\n", "OK", DEFAULT_TIMEOUT);
      Serial.println("AT+QMTOPEN=0,\"45.64.237.125\",8883\r\n");
    }

    if(sendCmdAndWaitForResp("AT+QMTCONN=0,\"test\"\r\n", "+QMTCONN: 0,0,0", DEFAULT_TIMEOUT) != -1) {
      //sendCmdAndWaitForResp("AT+QGNSSC=1\r\n", "OK", DEFAULT_TIMEOUT);
      Serial.println("AT+QMTCONN=0,\"test\"\r\n");
    }
    
    sprintf(msg,"AT+QMTPUB=0,1,1,0,\"test\",%d\r\n",strlen(buf.c_str()));
    DWT_Delay_ms(200);

    if(sendCmdAndWaitForResp(msg, ">", DEFAULT_TIMEOUT) != -1) {
      //sendCmdAndWaitForResp("AT+QGNSSC=1\r\n", "OK", DEFAULT_TIMEOUT);
      Serial.println(">");
    }

    if(sendCmdAndWaitForResp(buf.c_str(), "OK", DEFAULT_TIMEOUT) != -1) {
      //sendCmdAndWaitForResp("AT+QGNSSC=1\r\n", "OK", DEFAULT_TIMEOUT);
      Serial.println(buf.c_str());
    }

    if(sendCmdAndWaitForResp("AT+QMTDISC=0\r\n", "+QMTDISC: 0,0", DEFAULT_TIMEOUT) != -1) {
      //sendCmdAndWaitForResp("AT+QGNSSC=1\r\n", "OK", DEFAULT_TIMEOUT);
      Serial.println("AT+QMTDISC=0");
    }
    
  }
  else {
    Serial.println(F("INVALID"));
    DWT_Delay_ms(_timeDelay);
  }
}
