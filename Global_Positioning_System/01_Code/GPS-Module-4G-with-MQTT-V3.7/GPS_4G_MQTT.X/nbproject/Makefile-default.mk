#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/GPS_4G_MQTT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/GPS_4G_MQTT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../Application/App_Setup.c ../Application/App_quectel_common_interface.c ../Application/App_gps_comm_interface.c ../Application/App_gprs_comm_interface.c ../Application/App_user_interface.c ../common/delay.c ../common/hexString.c ../common/queue.c ../common/tick.c ../common/utility.c ../GPS_GNSS/NMEA_parser.c ../mcc_generated_files/clock.c ../mcc_generated_files/interrupt_manager.c ../mcc_generated_files/mcc.c ../mcc_generated_files/pin_manager.c ../mcc_generated_files/rtcc.c ../mcc_generated_files/spi1.c ../mcc_generated_files/system.c ../mcc_generated_files/tmr1.c ../mcc_generated_files/tmr3.c ../mcc_generated_files/traps.c ../mcc_generated_files/uart1.c ../mcc_generated_files/uart2.c ../Quectel/Quectel_interface.c ../main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1693421727/App_Setup.o ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o ${OBJECTDIR}/_ext/1693421727/App_user_interface.o ${OBJECTDIR}/_ext/1270477542/delay.o ${OBJECTDIR}/_ext/1270477542/hexString.o ${OBJECTDIR}/_ext/1270477542/queue.o ${OBJECTDIR}/_ext/1270477542/tick.o ${OBJECTDIR}/_ext/1270477542/utility.o ${OBJECTDIR}/_ext/918604917/NMEA_parser.o ${OBJECTDIR}/_ext/1769188794/clock.o ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o ${OBJECTDIR}/_ext/1769188794/mcc.o ${OBJECTDIR}/_ext/1769188794/pin_manager.o ${OBJECTDIR}/_ext/1769188794/rtcc.o ${OBJECTDIR}/_ext/1769188794/spi1.o ${OBJECTDIR}/_ext/1769188794/system.o ${OBJECTDIR}/_ext/1769188794/tmr1.o ${OBJECTDIR}/_ext/1769188794/tmr3.o ${OBJECTDIR}/_ext/1769188794/traps.o ${OBJECTDIR}/_ext/1769188794/uart1.o ${OBJECTDIR}/_ext/1769188794/uart2.o ${OBJECTDIR}/_ext/638798250/Quectel_interface.o ${OBJECTDIR}/_ext/1472/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1693421727/App_Setup.o.d ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d ${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d ${OBJECTDIR}/_ext/1270477542/delay.o.d ${OBJECTDIR}/_ext/1270477542/hexString.o.d ${OBJECTDIR}/_ext/1270477542/queue.o.d ${OBJECTDIR}/_ext/1270477542/tick.o.d ${OBJECTDIR}/_ext/1270477542/utility.o.d ${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d ${OBJECTDIR}/_ext/1769188794/clock.o.d ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d ${OBJECTDIR}/_ext/1769188794/mcc.o.d ${OBJECTDIR}/_ext/1769188794/pin_manager.o.d ${OBJECTDIR}/_ext/1769188794/rtcc.o.d ${OBJECTDIR}/_ext/1769188794/spi1.o.d ${OBJECTDIR}/_ext/1769188794/system.o.d ${OBJECTDIR}/_ext/1769188794/tmr1.o.d ${OBJECTDIR}/_ext/1769188794/tmr3.o.d ${OBJECTDIR}/_ext/1769188794/traps.o.d ${OBJECTDIR}/_ext/1769188794/uart1.o.d ${OBJECTDIR}/_ext/1769188794/uart2.o.d ${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d ${OBJECTDIR}/_ext/1472/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1693421727/App_Setup.o ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o ${OBJECTDIR}/_ext/1693421727/App_user_interface.o ${OBJECTDIR}/_ext/1270477542/delay.o ${OBJECTDIR}/_ext/1270477542/hexString.o ${OBJECTDIR}/_ext/1270477542/queue.o ${OBJECTDIR}/_ext/1270477542/tick.o ${OBJECTDIR}/_ext/1270477542/utility.o ${OBJECTDIR}/_ext/918604917/NMEA_parser.o ${OBJECTDIR}/_ext/1769188794/clock.o ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o ${OBJECTDIR}/_ext/1769188794/mcc.o ${OBJECTDIR}/_ext/1769188794/pin_manager.o ${OBJECTDIR}/_ext/1769188794/rtcc.o ${OBJECTDIR}/_ext/1769188794/spi1.o ${OBJECTDIR}/_ext/1769188794/system.o ${OBJECTDIR}/_ext/1769188794/tmr1.o ${OBJECTDIR}/_ext/1769188794/tmr3.o ${OBJECTDIR}/_ext/1769188794/traps.o ${OBJECTDIR}/_ext/1769188794/uart1.o ${OBJECTDIR}/_ext/1769188794/uart2.o ${OBJECTDIR}/_ext/638798250/Quectel_interface.o ${OBJECTDIR}/_ext/1472/main.o

# Source Files
SOURCEFILES=../Application/App_Setup.c ../Application/App_quectel_common_interface.c ../Application/App_gps_comm_interface.c ../Application/App_gprs_comm_interface.c ../Application/App_user_interface.c ../common/delay.c ../common/hexString.c ../common/queue.c ../common/tick.c ../common/utility.c ../GPS_GNSS/NMEA_parser.c ../mcc_generated_files/clock.c ../mcc_generated_files/interrupt_manager.c ../mcc_generated_files/mcc.c ../mcc_generated_files/pin_manager.c ../mcc_generated_files/rtcc.c ../mcc_generated_files/spi1.c ../mcc_generated_files/system.c ../mcc_generated_files/tmr1.c ../mcc_generated_files/tmr3.c ../mcc_generated_files/traps.c ../mcc_generated_files/uart1.c ../mcc_generated_files/uart2.c ../Quectel/Quectel_interface.c ../main.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/GPS_4G_MQTT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ256GA705
MP_LINKER_FILE_OPTION=,--script=p24FJ256GA705.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1693421727/App_Setup.o: ../Application/App_Setup.c  .generated_files/flags/default/372eca6d13ce7d3f03ffdb22268637d767980017 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_Setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_Setup.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_Setup.c  -o ${OBJECTDIR}/_ext/1693421727/App_Setup.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_Setup.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o: ../Application/App_quectel_common_interface.c  .generated_files/flags/default/bdc5686e1887ec8be65e83810b818fa179302fe8 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_quectel_common_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o: ../Application/App_gps_comm_interface.c  .generated_files/flags/default/ab263b43e0ca2a5923eb0b0b8eb75352eb089d03 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_gps_comm_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o: ../Application/App_gprs_comm_interface.c  .generated_files/flags/default/2d7574634f082750c6393b7b7354653c043cc686 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_gprs_comm_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_user_interface.o: ../Application/App_user_interface.c  .generated_files/flags/default/4ad5ddbfd82699e75b89e706a78f52fe2a7b9f3a .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_user_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_user_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_user_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/delay.o: ../common/delay.c  .generated_files/flags/default/7006812949842af14b96ebc3110f9621507fbe40 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/delay.c  -o ${OBJECTDIR}/_ext/1270477542/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/delay.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/hexString.o: ../common/hexString.c  .generated_files/flags/default/257bee08fa3b8918ff89fa5db87dcee54b80e150 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/hexString.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/hexString.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/hexString.c  -o ${OBJECTDIR}/_ext/1270477542/hexString.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/hexString.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/queue.o: ../common/queue.c  .generated_files/flags/default/58008d64d9a7c13abca656913339aebfcc7cd8fb .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/queue.c  -o ${OBJECTDIR}/_ext/1270477542/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/queue.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/tick.o: ../common/tick.c  .generated_files/flags/default/666a0e33484882c01f07706440fbd040d080d841 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/tick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/tick.c  -o ${OBJECTDIR}/_ext/1270477542/tick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/tick.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/utility.o: ../common/utility.c  .generated_files/flags/default/c2b95f188c4ce333e4741fe540223d558087ac70 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/utility.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/utility.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/utility.c  -o ${OBJECTDIR}/_ext/1270477542/utility.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/utility.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/918604917/NMEA_parser.o: ../GPS_GNSS/NMEA_parser.c  .generated_files/flags/default/11ce2b66bf43616015a0d2bbb1c5bdefa186e7d3 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/918604917" 
	@${RM} ${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/918604917/NMEA_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../GPS_GNSS/NMEA_parser.c  -o ${OBJECTDIR}/_ext/918604917/NMEA_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/clock.o: ../mcc_generated_files/clock.c  .generated_files/flags/default/eb1d1a4390e0f81438b1982cc2933a1a4b9bbd79 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/clock.c  -o ${OBJECTDIR}/_ext/1769188794/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/clock.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/interrupt_manager.o: ../mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/7d3dfb1bcad4e938db5cff3205eb09dd5159185e .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/mcc.o: ../mcc_generated_files/mcc.c  .generated_files/flags/default/7171de9051bd84ca9da6fabdd0b8d3f6249a0619 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/mcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/mcc.c  -o ${OBJECTDIR}/_ext/1769188794/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/mcc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/pin_manager.o: ../mcc_generated_files/pin_manager.c  .generated_files/flags/default/1a8f788954e207afa6617f59ca897964cfc85f61 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/_ext/1769188794/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/pin_manager.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/rtcc.o: ../mcc_generated_files/rtcc.c  .generated_files/flags/default/f45ec5521d4949cc79e5148357714a77b1a7e238 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/rtcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/rtcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/rtcc.c  -o ${OBJECTDIR}/_ext/1769188794/rtcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/rtcc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/spi1.o: ../mcc_generated_files/spi1.c  .generated_files/flags/default/f91f86fcd0758adacf181a670f8806d31508c070 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/spi1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/spi1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/spi1.c  -o ${OBJECTDIR}/_ext/1769188794/spi1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/spi1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/system.o: ../mcc_generated_files/system.c  .generated_files/flags/default/503efff185e1666261bac2afe4a5a59816d9a6a8 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/system.c  -o ${OBJECTDIR}/_ext/1769188794/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/tmr1.o: ../mcc_generated_files/tmr1.c  .generated_files/flags/default/4cb5737cb6a6c0d43bf5de6483947baeae2818dc .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/_ext/1769188794/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/tmr1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/tmr3.o: ../mcc_generated_files/tmr3.c  .generated_files/flags/default/53ce94e5a6d0557c3b5b50909a2168f9a32ab54b .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/tmr3.c  -o ${OBJECTDIR}/_ext/1769188794/tmr3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/tmr3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/traps.o: ../mcc_generated_files/traps.c  .generated_files/flags/default/247dfc7392b01c4c3cb7d2bb6f066441af5996c2 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/traps.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/traps.c  -o ${OBJECTDIR}/_ext/1769188794/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/traps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/uart1.o: ../mcc_generated_files/uart1.c  .generated_files/flags/default/6b31e3fc2df05674ac5d0c5a5d298a5d814979b2 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/uart1.c  -o ${OBJECTDIR}/_ext/1769188794/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/uart1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/uart2.o: ../mcc_generated_files/uart2.c  .generated_files/flags/default/6ada0f9b079b91bb206500d3106313258824ca61 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/uart2.c  -o ${OBJECTDIR}/_ext/1769188794/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/uart2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/638798250/Quectel_interface.o: ../Quectel/Quectel_interface.c  .generated_files/flags/default/89bf0ff4930d28606ccc21ff33c3acd21a1c3356 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/638798250" 
	@${RM} ${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/638798250/Quectel_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Quectel/Quectel_interface.c  -o ${OBJECTDIR}/_ext/638798250/Quectel_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  .generated_files/flags/default/3a9de495e27678a6dd114d10be6433edc66124af .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/1693421727/App_Setup.o: ../Application/App_Setup.c  .generated_files/flags/default/740b941680b6bb1bb0c295c883d45937073ae773 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_Setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_Setup.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_Setup.c  -o ${OBJECTDIR}/_ext/1693421727/App_Setup.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_Setup.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o: ../Application/App_quectel_common_interface.c  .generated_files/flags/default/7b1ad47692d59811434c6e33824b331f00e7529a .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_quectel_common_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o: ../Application/App_gps_comm_interface.c  .generated_files/flags/default/37ed727011c7bcd4eb141c13246b2fc100f834fb .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_gps_comm_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o: ../Application/App_gprs_comm_interface.c  .generated_files/flags/default/16a2e16bf9522ced3ce6e700714ebcef0e4b1127 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_gprs_comm_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_user_interface.o: ../Application/App_user_interface.c  .generated_files/flags/default/378d7cf8a213b4dc078ecdbcd94f9d5c6285b5af .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_user_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_user_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_user_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/delay.o: ../common/delay.c  .generated_files/flags/default/e7a11b51ae0131e5e93cd585f6d7e0bb8a449b5c .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/delay.c  -o ${OBJECTDIR}/_ext/1270477542/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/delay.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/hexString.o: ../common/hexString.c  .generated_files/flags/default/4f3d2a83fff51871e4950d5615c4de895576b8d8 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/hexString.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/hexString.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/hexString.c  -o ${OBJECTDIR}/_ext/1270477542/hexString.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/hexString.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/queue.o: ../common/queue.c  .generated_files/flags/default/2ddcbd43c1b7ca43b058b336996e4b6550fdf41b .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/queue.c  -o ${OBJECTDIR}/_ext/1270477542/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/queue.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/tick.o: ../common/tick.c  .generated_files/flags/default/f0ae307185ff126be4d7c2412663b65db4e129a2 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/tick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/tick.c  -o ${OBJECTDIR}/_ext/1270477542/tick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/tick.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/utility.o: ../common/utility.c  .generated_files/flags/default/b383ff66b8f51a4925d963c95227c68c9726f09d .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/utility.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/utility.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/utility.c  -o ${OBJECTDIR}/_ext/1270477542/utility.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/utility.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/918604917/NMEA_parser.o: ../GPS_GNSS/NMEA_parser.c  .generated_files/flags/default/6ad06860d845e441d438f0b01bcdcf9ea710ea3d .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/918604917" 
	@${RM} ${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/918604917/NMEA_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../GPS_GNSS/NMEA_parser.c  -o ${OBJECTDIR}/_ext/918604917/NMEA_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/clock.o: ../mcc_generated_files/clock.c  .generated_files/flags/default/e0429d9e7f22cb635cf6920d6fc5c7d50aba008a .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/clock.c  -o ${OBJECTDIR}/_ext/1769188794/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/interrupt_manager.o: ../mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/f6837929f17ce9d62c9faa65586e665bd7a102d3 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/mcc.o: ../mcc_generated_files/mcc.c  .generated_files/flags/default/43655cbf670bb43ccd79b7009ea4a7d1ecfced8a .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/mcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/mcc.c  -o ${OBJECTDIR}/_ext/1769188794/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/mcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/pin_manager.o: ../mcc_generated_files/pin_manager.c  .generated_files/flags/default/fcaa5f057d0c71e0c44b74e184b4f34cdfd3b979 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/_ext/1769188794/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/rtcc.o: ../mcc_generated_files/rtcc.c  .generated_files/flags/default/97e0d743e649a1d170dc9096a8750ceaa82e1fe5 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/rtcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/rtcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/rtcc.c  -o ${OBJECTDIR}/_ext/1769188794/rtcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/rtcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/spi1.o: ../mcc_generated_files/spi1.c  .generated_files/flags/default/bd38c86d36aadb548afbb80d269b13687bb6d556 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/spi1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/spi1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/spi1.c  -o ${OBJECTDIR}/_ext/1769188794/spi1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/spi1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/system.o: ../mcc_generated_files/system.c  .generated_files/flags/default/b5fc6f4dabe2e571630890ca6c3d0fc137feba3c .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/system.c  -o ${OBJECTDIR}/_ext/1769188794/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/tmr1.o: ../mcc_generated_files/tmr1.c  .generated_files/flags/default/d2fcbe531f5499717c07f1e9ecd8edd7a01f7b52 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/_ext/1769188794/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/tmr1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/tmr3.o: ../mcc_generated_files/tmr3.c  .generated_files/flags/default/e774bce7b087373ec21abc00d95017d200cb2f2e .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/tmr3.c  -o ${OBJECTDIR}/_ext/1769188794/tmr3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/tmr3.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/traps.o: ../mcc_generated_files/traps.c  .generated_files/flags/default/28b7628d80affe13ea842fb0a7b9edee14972f7d .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/traps.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/traps.c  -o ${OBJECTDIR}/_ext/1769188794/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/traps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/uart1.o: ../mcc_generated_files/uart1.c  .generated_files/flags/default/809aaf685bd14910951bf30011545657e4883995 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/uart1.c  -o ${OBJECTDIR}/_ext/1769188794/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/uart1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/uart2.o: ../mcc_generated_files/uart2.c  .generated_files/flags/default/7c6471b39085f51f55c20a4709de540c2dbd0e23 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/uart2.c  -o ${OBJECTDIR}/_ext/1769188794/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/uart2.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/638798250/Quectel_interface.o: ../Quectel/Quectel_interface.c  .generated_files/flags/default/525948bf4f5a25882ba639334991cb639cd6399c .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/638798250" 
	@${RM} ${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/638798250/Quectel_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Quectel/Quectel_interface.c  -o ${OBJECTDIR}/_ext/638798250/Quectel_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  .generated_files/flags/default/59e8b32d756fcf8bc078dbed7c30b69d52c29568 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/GPS_4G_MQTT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/GPS_4G_MQTT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81B -mreserve=data@0x81C:0x81D -mreserve=data@0x81E:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x827 -mreserve=data@0x82A:0x84F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/GPS_4G_MQTT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/GPS_4G_MQTT.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/GPS_4G_MQTT.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
