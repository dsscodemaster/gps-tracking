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
SOURCEFILES_QUOTED_IF_SPACED=../Application/App_Setup.c ../Application/App_quectel_common_interface.c ../Application/App_gps_comm_interface.c ../Application/App_gprs_comm_interface.c ../Application/App_user_interface.c ../common/delay.c ../common/hexString.c ../common/queue.c ../common/tick.c ../common/utility.c ../mcc_generated_files/clock.c ../mcc_generated_files/interrupt_manager.c ../mcc_generated_files/mcc.c ../mcc_generated_files/pin_manager.c ../mcc_generated_files/rtcc.c ../mcc_generated_files/spi1.c ../mcc_generated_files/system.c ../mcc_generated_files/tmr1.c ../mcc_generated_files/tmr3.c ../mcc_generated_files/traps.c ../mcc_generated_files/uart1.c ../mcc_generated_files/uart2.c ../Quectel/Quectel_interface.c ../main.c ../GPS_GNSS/NMEA_parser.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1693421727/App_Setup.o ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o ${OBJECTDIR}/_ext/1693421727/App_user_interface.o ${OBJECTDIR}/_ext/1270477542/delay.o ${OBJECTDIR}/_ext/1270477542/hexString.o ${OBJECTDIR}/_ext/1270477542/queue.o ${OBJECTDIR}/_ext/1270477542/tick.o ${OBJECTDIR}/_ext/1270477542/utility.o ${OBJECTDIR}/_ext/1769188794/clock.o ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o ${OBJECTDIR}/_ext/1769188794/mcc.o ${OBJECTDIR}/_ext/1769188794/pin_manager.o ${OBJECTDIR}/_ext/1769188794/rtcc.o ${OBJECTDIR}/_ext/1769188794/spi1.o ${OBJECTDIR}/_ext/1769188794/system.o ${OBJECTDIR}/_ext/1769188794/tmr1.o ${OBJECTDIR}/_ext/1769188794/tmr3.o ${OBJECTDIR}/_ext/1769188794/traps.o ${OBJECTDIR}/_ext/1769188794/uart1.o ${OBJECTDIR}/_ext/1769188794/uart2.o ${OBJECTDIR}/_ext/638798250/Quectel_interface.o ${OBJECTDIR}/_ext/1472/main.o ${OBJECTDIR}/_ext/918604917/NMEA_parser.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1693421727/App_Setup.o.d ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d ${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d ${OBJECTDIR}/_ext/1270477542/delay.o.d ${OBJECTDIR}/_ext/1270477542/hexString.o.d ${OBJECTDIR}/_ext/1270477542/queue.o.d ${OBJECTDIR}/_ext/1270477542/tick.o.d ${OBJECTDIR}/_ext/1270477542/utility.o.d ${OBJECTDIR}/_ext/1769188794/clock.o.d ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d ${OBJECTDIR}/_ext/1769188794/mcc.o.d ${OBJECTDIR}/_ext/1769188794/pin_manager.o.d ${OBJECTDIR}/_ext/1769188794/rtcc.o.d ${OBJECTDIR}/_ext/1769188794/spi1.o.d ${OBJECTDIR}/_ext/1769188794/system.o.d ${OBJECTDIR}/_ext/1769188794/tmr1.o.d ${OBJECTDIR}/_ext/1769188794/tmr3.o.d ${OBJECTDIR}/_ext/1769188794/traps.o.d ${OBJECTDIR}/_ext/1769188794/uart1.o.d ${OBJECTDIR}/_ext/1769188794/uart2.o.d ${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d ${OBJECTDIR}/_ext/1472/main.o.d ${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1693421727/App_Setup.o ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o ${OBJECTDIR}/_ext/1693421727/App_user_interface.o ${OBJECTDIR}/_ext/1270477542/delay.o ${OBJECTDIR}/_ext/1270477542/hexString.o ${OBJECTDIR}/_ext/1270477542/queue.o ${OBJECTDIR}/_ext/1270477542/tick.o ${OBJECTDIR}/_ext/1270477542/utility.o ${OBJECTDIR}/_ext/1769188794/clock.o ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o ${OBJECTDIR}/_ext/1769188794/mcc.o ${OBJECTDIR}/_ext/1769188794/pin_manager.o ${OBJECTDIR}/_ext/1769188794/rtcc.o ${OBJECTDIR}/_ext/1769188794/spi1.o ${OBJECTDIR}/_ext/1769188794/system.o ${OBJECTDIR}/_ext/1769188794/tmr1.o ${OBJECTDIR}/_ext/1769188794/tmr3.o ${OBJECTDIR}/_ext/1769188794/traps.o ${OBJECTDIR}/_ext/1769188794/uart1.o ${OBJECTDIR}/_ext/1769188794/uart2.o ${OBJECTDIR}/_ext/638798250/Quectel_interface.o ${OBJECTDIR}/_ext/1472/main.o ${OBJECTDIR}/_ext/918604917/NMEA_parser.o

# Source Files
SOURCEFILES=../Application/App_Setup.c ../Application/App_quectel_common_interface.c ../Application/App_gps_comm_interface.c ../Application/App_gprs_comm_interface.c ../Application/App_user_interface.c ../common/delay.c ../common/hexString.c ../common/queue.c ../common/tick.c ../common/utility.c ../mcc_generated_files/clock.c ../mcc_generated_files/interrupt_manager.c ../mcc_generated_files/mcc.c ../mcc_generated_files/pin_manager.c ../mcc_generated_files/rtcc.c ../mcc_generated_files/spi1.c ../mcc_generated_files/system.c ../mcc_generated_files/tmr1.c ../mcc_generated_files/tmr3.c ../mcc_generated_files/traps.c ../mcc_generated_files/uart1.c ../mcc_generated_files/uart2.c ../Quectel/Quectel_interface.c ../main.c ../GPS_GNSS/NMEA_parser.c



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
${OBJECTDIR}/_ext/1693421727/App_Setup.o: ../Application/App_Setup.c  .generated_files/flags/default/4f6d29d6a7fae2f438f2c9fd0a812533883edfb9 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_Setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_Setup.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_Setup.c  -o ${OBJECTDIR}/_ext/1693421727/App_Setup.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_Setup.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o: ../Application/App_quectel_common_interface.c  .generated_files/flags/default/4baee99a0387583952d53a66de11fb9cd2911fed .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_quectel_common_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o: ../Application/App_gps_comm_interface.c  .generated_files/flags/default/cf4b1cd3eea69b97d4dfcf6f826ed00bb53b3b6f .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_gps_comm_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o: ../Application/App_gprs_comm_interface.c  .generated_files/flags/default/c741d9e36f321df9b17a48e5b1bdcb83683176c2 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_gprs_comm_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_user_interface.o: ../Application/App_user_interface.c  .generated_files/flags/default/96bb6e96b2fa1008b2f6a90c20d322ae08d92554 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_user_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_user_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_user_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/delay.o: ../common/delay.c  .generated_files/flags/default/87c90bbaa39dec35d4768c6d157a7b8b768eec9e .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/delay.c  -o ${OBJECTDIR}/_ext/1270477542/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/delay.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/hexString.o: ../common/hexString.c  .generated_files/flags/default/51cf5572773eb74d56d04fee8f7c847b4e460d9e .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/hexString.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/hexString.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/hexString.c  -o ${OBJECTDIR}/_ext/1270477542/hexString.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/hexString.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/queue.o: ../common/queue.c  .generated_files/flags/default/ab608ad36e441b5e171b50a5c5ee04c269755574 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/queue.c  -o ${OBJECTDIR}/_ext/1270477542/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/queue.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/tick.o: ../common/tick.c  .generated_files/flags/default/5f69c76036767055b1e1745d68819ec00dccd578 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/tick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/tick.c  -o ${OBJECTDIR}/_ext/1270477542/tick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/tick.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/utility.o: ../common/utility.c  .generated_files/flags/default/f20ddb5a706c54477eb7e7638d74d2c41da42f8f .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/utility.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/utility.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/utility.c  -o ${OBJECTDIR}/_ext/1270477542/utility.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/utility.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/clock.o: ../mcc_generated_files/clock.c  .generated_files/flags/default/5990db89e2b0d716e0302fd66aa2cc822bdc75 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/clock.c  -o ${OBJECTDIR}/_ext/1769188794/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/clock.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/interrupt_manager.o: ../mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/420ff32c6dc35eb04dee4069b4ee321ad1554bac .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/mcc.o: ../mcc_generated_files/mcc.c  .generated_files/flags/default/53529fa5788a7f44eec44ffa17b5ab38ceb74e .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/mcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/mcc.c  -o ${OBJECTDIR}/_ext/1769188794/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/mcc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/pin_manager.o: ../mcc_generated_files/pin_manager.c  .generated_files/flags/default/17facd2c0b9b0e089b23a5dabcd7cd271e2b2b32 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/_ext/1769188794/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/pin_manager.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/rtcc.o: ../mcc_generated_files/rtcc.c  .generated_files/flags/default/bfbe29bc8ca1b3f408abb0babb050f02b98b280d .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/rtcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/rtcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/rtcc.c  -o ${OBJECTDIR}/_ext/1769188794/rtcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/rtcc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/spi1.o: ../mcc_generated_files/spi1.c  .generated_files/flags/default/1a958dbf646aae0e7f57a8a0f809a78607f195f7 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/spi1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/spi1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/spi1.c  -o ${OBJECTDIR}/_ext/1769188794/spi1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/spi1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/system.o: ../mcc_generated_files/system.c  .generated_files/flags/default/88bf12492e04f14761137a45bc2677bb6d04169b .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/system.c  -o ${OBJECTDIR}/_ext/1769188794/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/tmr1.o: ../mcc_generated_files/tmr1.c  .generated_files/flags/default/c3bac149065b381a21ab878d996bc5f6908aacbf .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/_ext/1769188794/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/tmr1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/tmr3.o: ../mcc_generated_files/tmr3.c  .generated_files/flags/default/6b39058546300aae97fb8a8fd410ecc15b5bb772 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/tmr3.c  -o ${OBJECTDIR}/_ext/1769188794/tmr3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/tmr3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/traps.o: ../mcc_generated_files/traps.c  .generated_files/flags/default/189011e4981ae86e5de29aa48bd0ea81f66cae71 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/traps.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/traps.c  -o ${OBJECTDIR}/_ext/1769188794/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/traps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/uart1.o: ../mcc_generated_files/uart1.c  .generated_files/flags/default/c01621e38afe6b9f607464dbb80a3beec41b91bb .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/uart1.c  -o ${OBJECTDIR}/_ext/1769188794/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/uart1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/uart2.o: ../mcc_generated_files/uart2.c  .generated_files/flags/default/8004d7a30c99ca0f20cd7f9154cf26590a90007c .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/uart2.c  -o ${OBJECTDIR}/_ext/1769188794/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/uart2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/638798250/Quectel_interface.o: ../Quectel/Quectel_interface.c  .generated_files/flags/default/538e30f10553271205ec795cf0c929fc56fd7277 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/638798250" 
	@${RM} ${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/638798250/Quectel_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Quectel/Quectel_interface.c  -o ${OBJECTDIR}/_ext/638798250/Quectel_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  .generated_files/flags/default/c56308d96ba0d8ab27d9e28d36c69181fc155f46 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/918604917/NMEA_parser.o: ../GPS_GNSS/NMEA_parser.c  .generated_files/flags/default/5ae6f3db92d08ffb6e535431d375d2730b195c4a .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/918604917" 
	@${RM} ${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/918604917/NMEA_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../GPS_GNSS/NMEA_parser.c  -o ${OBJECTDIR}/_ext/918604917/NMEA_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/1693421727/App_Setup.o: ../Application/App_Setup.c  .generated_files/flags/default/8428a7118fc231b4682586904c87832e697deab9 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_Setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_Setup.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_Setup.c  -o ${OBJECTDIR}/_ext/1693421727/App_Setup.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_Setup.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o: ../Application/App_quectel_common_interface.c  .generated_files/flags/default/b35d606c00c63c8f968dd45e7b722113996d0ae .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_quectel_common_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o: ../Application/App_gps_comm_interface.c  .generated_files/flags/default/b72ff571f46ee84200541d8abf854b326a086ee1 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_gps_comm_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o: ../Application/App_gprs_comm_interface.c  .generated_files/flags/default/22668e10f58375b6255adf678be9c828be5f7dc .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_gprs_comm_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_user_interface.o: ../Application/App_user_interface.c  .generated_files/flags/default/38cf7fd95bbd7fae56be1a0e134a6896203bfbd4 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_user_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_user_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_user_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/delay.o: ../common/delay.c  .generated_files/flags/default/10adc141220f5b690ec238cf744383213371122e .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/delay.c  -o ${OBJECTDIR}/_ext/1270477542/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/delay.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/hexString.o: ../common/hexString.c  .generated_files/flags/default/94b4cecb97186788e552d39f25571dde7292693f .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/hexString.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/hexString.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/hexString.c  -o ${OBJECTDIR}/_ext/1270477542/hexString.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/hexString.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/queue.o: ../common/queue.c  .generated_files/flags/default/732e276203f816ceac69996fcccca7e29dff3e64 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/queue.c  -o ${OBJECTDIR}/_ext/1270477542/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/queue.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/tick.o: ../common/tick.c  .generated_files/flags/default/899e80b95a08f1718f69cfbb6c4002fe087b4a23 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/tick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/tick.c  -o ${OBJECTDIR}/_ext/1270477542/tick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/tick.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/utility.o: ../common/utility.c  .generated_files/flags/default/9aef95a08019922ebe62148146a70c765ac3e053 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/utility.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/utility.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/utility.c  -o ${OBJECTDIR}/_ext/1270477542/utility.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/utility.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/clock.o: ../mcc_generated_files/clock.c  .generated_files/flags/default/5a86d3aae7aaf9033cdf348ef1a8bfde9ee73e71 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/clock.c  -o ${OBJECTDIR}/_ext/1769188794/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/interrupt_manager.o: ../mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/5219095ffb04015e8e4dfad68478fda79dcd75a .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/mcc.o: ../mcc_generated_files/mcc.c  .generated_files/flags/default/1dde9dcd3e162d2c5ea5a7f0f5d0f2a652161045 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/mcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/mcc.c  -o ${OBJECTDIR}/_ext/1769188794/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/mcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/pin_manager.o: ../mcc_generated_files/pin_manager.c  .generated_files/flags/default/1ec229ec9f1da454e05c2fc071468e6cd855337b .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/_ext/1769188794/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/rtcc.o: ../mcc_generated_files/rtcc.c  .generated_files/flags/default/3a6ed4b267ee89bff4c5cfe54e9bb8443ea4f7da .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/rtcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/rtcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/rtcc.c  -o ${OBJECTDIR}/_ext/1769188794/rtcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/rtcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/spi1.o: ../mcc_generated_files/spi1.c  .generated_files/flags/default/d366c19172a6ab253618b9f4d6a8eb1a8b71fbf3 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/spi1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/spi1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/spi1.c  -o ${OBJECTDIR}/_ext/1769188794/spi1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/spi1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/system.o: ../mcc_generated_files/system.c  .generated_files/flags/default/1bf09e502ebd5feccd13815df63462d0f9fb7f50 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/system.c  -o ${OBJECTDIR}/_ext/1769188794/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/tmr1.o: ../mcc_generated_files/tmr1.c  .generated_files/flags/default/66fe6b02ca9209ea3bbfea469445b16142b78aec .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/_ext/1769188794/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/tmr1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/tmr3.o: ../mcc_generated_files/tmr3.c  .generated_files/flags/default/e9e8d71bd39cc9a513f888f106ef7b07fa5a43ea .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/tmr3.c  -o ${OBJECTDIR}/_ext/1769188794/tmr3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/tmr3.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/traps.o: ../mcc_generated_files/traps.c  .generated_files/flags/default/23392a088a3e82d0a6efa8b55e77da0fb78884e7 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/traps.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/traps.c  -o ${OBJECTDIR}/_ext/1769188794/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/traps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/uart1.o: ../mcc_generated_files/uart1.c  .generated_files/flags/default/6c9d4c4189799c28708db221a8b3a01542223392 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/uart1.c  -o ${OBJECTDIR}/_ext/1769188794/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/uart1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/uart2.o: ../mcc_generated_files/uart2.c  .generated_files/flags/default/6b0297f507c7a305ee9d6b557d98c8acd2e4379b .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/uart2.c  -o ${OBJECTDIR}/_ext/1769188794/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/uart2.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/638798250/Quectel_interface.o: ../Quectel/Quectel_interface.c  .generated_files/flags/default/f9149076111dcda5ec5b7a2add8dcfc655d7d2f .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/638798250" 
	@${RM} ${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/638798250/Quectel_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Quectel/Quectel_interface.c  -o ${OBJECTDIR}/_ext/638798250/Quectel_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  .generated_files/flags/default/75e39690a0dac123030fbedb2122a5707e39953e .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/918604917/NMEA_parser.o: ../GPS_GNSS/NMEA_parser.c  .generated_files/flags/default/8ffd6a83b9eddf46093c20b2d29111d0b985781e .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/918604917" 
	@${RM} ${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/918604917/NMEA_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../GPS_GNSS/NMEA_parser.c  -o ${OBJECTDIR}/_ext/918604917/NMEA_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
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
