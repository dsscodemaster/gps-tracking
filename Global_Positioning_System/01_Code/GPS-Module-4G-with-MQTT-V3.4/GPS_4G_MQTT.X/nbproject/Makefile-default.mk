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
${OBJECTDIR}/_ext/1693421727/App_Setup.o: ../Application/App_Setup.c  .generated_files/flags/default/9b0ab00073ed647b01702739a04fee53203086a4 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_Setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_Setup.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_Setup.c  -o ${OBJECTDIR}/_ext/1693421727/App_Setup.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_Setup.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o: ../Application/App_quectel_common_interface.c  .generated_files/flags/default/b6e2333ef346fa881813eafd52939a34591edc6d .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_quectel_common_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o: ../Application/App_gps_comm_interface.c  .generated_files/flags/default/3afad88182ce9caf001a3bbeffa8bd3be889f570 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_gps_comm_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o: ../Application/App_gprs_comm_interface.c  .generated_files/flags/default/dae176426ef9801230caa472a34cc7fe13bd5aba .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_gprs_comm_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_user_interface.o: ../Application/App_user_interface.c  .generated_files/flags/default/35efd12a47ad7de9d2c9cfa4a2ce60dde404cd6a .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_user_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_user_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_user_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/delay.o: ../common/delay.c  .generated_files/flags/default/f89973562d346fc7b1ebaf60e24c591eefbac11e .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/delay.c  -o ${OBJECTDIR}/_ext/1270477542/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/delay.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/hexString.o: ../common/hexString.c  .generated_files/flags/default/7e6f3abcec7b0170f3c3fe570e16a6a0aa7489db .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/hexString.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/hexString.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/hexString.c  -o ${OBJECTDIR}/_ext/1270477542/hexString.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/hexString.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/queue.o: ../common/queue.c  .generated_files/flags/default/4865ba5436d3dd84244f0676178a9cd93bbf6964 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/queue.c  -o ${OBJECTDIR}/_ext/1270477542/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/queue.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/tick.o: ../common/tick.c  .generated_files/flags/default/5210c04d2becc3a100144c4cc031a160fa912eb8 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/tick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/tick.c  -o ${OBJECTDIR}/_ext/1270477542/tick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/tick.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/utility.o: ../common/utility.c  .generated_files/flags/default/b82f4ba5be2f60cb5a43f676a98dd4b72a47d678 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/utility.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/utility.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/utility.c  -o ${OBJECTDIR}/_ext/1270477542/utility.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/utility.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/918604917/NMEA_parser.o: ../GPS_GNSS/NMEA_parser.c  .generated_files/flags/default/8ce5e0a7b882d9e6e9093ef0124c333c062d3bb0 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/918604917" 
	@${RM} ${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/918604917/NMEA_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../GPS_GNSS/NMEA_parser.c  -o ${OBJECTDIR}/_ext/918604917/NMEA_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/clock.o: ../mcc_generated_files/clock.c  .generated_files/flags/default/1c65414759343b25b4a6a93119a36dcede4f1ce8 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/clock.c  -o ${OBJECTDIR}/_ext/1769188794/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/clock.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/interrupt_manager.o: ../mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/e3c5f7ba9e832b0ee60cdb75133c8361250df14c .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/mcc.o: ../mcc_generated_files/mcc.c  .generated_files/flags/default/652af814480f7275e602ac42dee56536c17294e3 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/mcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/mcc.c  -o ${OBJECTDIR}/_ext/1769188794/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/mcc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/pin_manager.o: ../mcc_generated_files/pin_manager.c  .generated_files/flags/default/aa8ec8a09fa39d4f40ee540fefbcf0c6312ee69f .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/_ext/1769188794/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/pin_manager.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/rtcc.o: ../mcc_generated_files/rtcc.c  .generated_files/flags/default/7145ce7f34ca9d53293126825fb3961308d73a1d .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/rtcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/rtcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/rtcc.c  -o ${OBJECTDIR}/_ext/1769188794/rtcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/rtcc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/spi1.o: ../mcc_generated_files/spi1.c  .generated_files/flags/default/d6e3e573e946365b409e66926f4c0d0bcfbcb1b3 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/spi1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/spi1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/spi1.c  -o ${OBJECTDIR}/_ext/1769188794/spi1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/spi1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/system.o: ../mcc_generated_files/system.c  .generated_files/flags/default/f3685daeacb02eeda47027d5084355c17d5782c2 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/system.c  -o ${OBJECTDIR}/_ext/1769188794/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/tmr1.o: ../mcc_generated_files/tmr1.c  .generated_files/flags/default/6ca92b929c6195f7ee639056bfc1e3c462492db1 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/_ext/1769188794/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/tmr1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/tmr3.o: ../mcc_generated_files/tmr3.c  .generated_files/flags/default/590b194e74869959da1fbfb7a625fb5ddc2e68a6 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/tmr3.c  -o ${OBJECTDIR}/_ext/1769188794/tmr3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/tmr3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/traps.o: ../mcc_generated_files/traps.c  .generated_files/flags/default/1f6d8c56e76d367a3b8523b171c8828d7b87e4e9 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/traps.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/traps.c  -o ${OBJECTDIR}/_ext/1769188794/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/traps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/uart1.o: ../mcc_generated_files/uart1.c  .generated_files/flags/default/61f4e82293b3c7d780e494a8f514a50d2dadeed4 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/uart1.c  -o ${OBJECTDIR}/_ext/1769188794/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/uart1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/uart2.o: ../mcc_generated_files/uart2.c  .generated_files/flags/default/a5658a403ec8ad244a1bed403923aeecf7b6218e .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/uart2.c  -o ${OBJECTDIR}/_ext/1769188794/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/uart2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/638798250/Quectel_interface.o: ../Quectel/Quectel_interface.c  .generated_files/flags/default/d69791e0997f7fb0891dfc00eb18dc720889bfbd .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/638798250" 
	@${RM} ${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/638798250/Quectel_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Quectel/Quectel_interface.c  -o ${OBJECTDIR}/_ext/638798250/Quectel_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  .generated_files/flags/default/8a94d86367de5b3502758b9ca6f28ce3aac4d2f1 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/1693421727/App_Setup.o: ../Application/App_Setup.c  .generated_files/flags/default/47cfddb2bfd7109e545342730ecea5dbbaec2f63 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_Setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_Setup.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_Setup.c  -o ${OBJECTDIR}/_ext/1693421727/App_Setup.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_Setup.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o: ../Application/App_quectel_common_interface.c  .generated_files/flags/default/9c66a25367ce76bd3059639942a920e144bef976 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_quectel_common_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o: ../Application/App_gps_comm_interface.c  .generated_files/flags/default/8a91d0948ef44f01e6df4ea3e2b39d918de4081c .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_gps_comm_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o: ../Application/App_gprs_comm_interface.c  .generated_files/flags/default/1cca55ed560106a66e3178cfd87849680622a372 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_gprs_comm_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_user_interface.o: ../Application/App_user_interface.c  .generated_files/flags/default/f0074de8e6d507a73ff7caa0f76b9fdd2e1232ca .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_user_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_user_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_user_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/delay.o: ../common/delay.c  .generated_files/flags/default/534f0dfbbee3bcb3fab91024bcd1c12775a23a1 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/delay.c  -o ${OBJECTDIR}/_ext/1270477542/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/delay.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/hexString.o: ../common/hexString.c  .generated_files/flags/default/4303154df64bebdaff903199a8ac6d3c3339b5b6 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/hexString.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/hexString.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/hexString.c  -o ${OBJECTDIR}/_ext/1270477542/hexString.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/hexString.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/queue.o: ../common/queue.c  .generated_files/flags/default/3c528e4d35a7f97938b3ad8b13ed054003c77d92 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/queue.c  -o ${OBJECTDIR}/_ext/1270477542/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/queue.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/tick.o: ../common/tick.c  .generated_files/flags/default/c726d407553646f2f7a2e5e16bcb3b3647469fe9 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/tick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/tick.c  -o ${OBJECTDIR}/_ext/1270477542/tick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/tick.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/utility.o: ../common/utility.c  .generated_files/flags/default/f8edc7e84dae183f155ecdba16727a413cecfbc6 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/utility.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/utility.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/utility.c  -o ${OBJECTDIR}/_ext/1270477542/utility.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/utility.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/918604917/NMEA_parser.o: ../GPS_GNSS/NMEA_parser.c  .generated_files/flags/default/a57ae8b76b23f15cfc5796408422a19b07b97f0f .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/918604917" 
	@${RM} ${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/918604917/NMEA_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../GPS_GNSS/NMEA_parser.c  -o ${OBJECTDIR}/_ext/918604917/NMEA_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/clock.o: ../mcc_generated_files/clock.c  .generated_files/flags/default/c63b6fe58986d9eabdff37ddf8808f65c0f6196c .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/clock.c  -o ${OBJECTDIR}/_ext/1769188794/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/interrupt_manager.o: ../mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/cd806d0f58977d0329de95db52474deecff0e227 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/mcc.o: ../mcc_generated_files/mcc.c  .generated_files/flags/default/68899b6698f9ea6e49924429e3173ebd2a0b07f4 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/mcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/mcc.c  -o ${OBJECTDIR}/_ext/1769188794/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/mcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/pin_manager.o: ../mcc_generated_files/pin_manager.c  .generated_files/flags/default/1bb6404a246032e14ca1c08e5ae84386d51a6ca0 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/_ext/1769188794/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/rtcc.o: ../mcc_generated_files/rtcc.c  .generated_files/flags/default/9a40bcb3d6efe847e888005c02cf7073a7796f6e .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/rtcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/rtcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/rtcc.c  -o ${OBJECTDIR}/_ext/1769188794/rtcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/rtcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/spi1.o: ../mcc_generated_files/spi1.c  .generated_files/flags/default/17683175d4672d164f3bf59bca391057d38fc54d .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/spi1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/spi1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/spi1.c  -o ${OBJECTDIR}/_ext/1769188794/spi1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/spi1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/system.o: ../mcc_generated_files/system.c  .generated_files/flags/default/cbebaab5a79d9e5f9a644859a08108484d52b5b6 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/system.c  -o ${OBJECTDIR}/_ext/1769188794/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/tmr1.o: ../mcc_generated_files/tmr1.c  .generated_files/flags/default/cc03098e0e1b6c614418bf59943936a0fb6fb861 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/_ext/1769188794/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/tmr1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/tmr3.o: ../mcc_generated_files/tmr3.c  .generated_files/flags/default/cc4085ebe45d9bb81769f081f37de74a5b6c45bf .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/tmr3.c  -o ${OBJECTDIR}/_ext/1769188794/tmr3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/tmr3.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/traps.o: ../mcc_generated_files/traps.c  .generated_files/flags/default/2bb64927fdf237f42618a50aa306cd67c3797c70 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/traps.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/traps.c  -o ${OBJECTDIR}/_ext/1769188794/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/traps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/uart1.o: ../mcc_generated_files/uart1.c  .generated_files/flags/default/f1a7db82380f87156d4921c06671ce756055ce1c .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/uart1.c  -o ${OBJECTDIR}/_ext/1769188794/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/uart1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/uart2.o: ../mcc_generated_files/uart2.c  .generated_files/flags/default/be8712db44ad10c9fe191f48ceecddc28d49c891 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/uart2.c  -o ${OBJECTDIR}/_ext/1769188794/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/uart2.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/638798250/Quectel_interface.o: ../Quectel/Quectel_interface.c  .generated_files/flags/default/13f21f629643ec2f0fd58a09e6eb85b4e155ae25 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/638798250" 
	@${RM} ${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/638798250/Quectel_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Quectel/Quectel_interface.c  -o ${OBJECTDIR}/_ext/638798250/Quectel_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  .generated_files/flags/default/77640c676addfec8d6e1f77a4c625aca2c6c673 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
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
