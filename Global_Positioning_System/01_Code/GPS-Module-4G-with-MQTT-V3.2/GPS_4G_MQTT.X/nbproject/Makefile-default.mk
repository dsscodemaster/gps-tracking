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
${OBJECTDIR}/_ext/1693421727/App_Setup.o: ../Application/App_Setup.c  .generated_files/flags/default/1f00ea6e732886ead68ffc96200ea05b5bc6d5da .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_Setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_Setup.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_Setup.c  -o ${OBJECTDIR}/_ext/1693421727/App_Setup.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_Setup.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o: ../Application/App_quectel_common_interface.c  .generated_files/flags/default/f2f8fe7703e23375aae85b2e3a4c30f25d2c04bb .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_quectel_common_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o: ../Application/App_gps_comm_interface.c  .generated_files/flags/default/8b1d8c0f2db9df205be1966eb88a946df26e6d0c .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_gps_comm_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o: ../Application/App_gprs_comm_interface.c  .generated_files/flags/default/be8678054e4e8c9b4a9e5e592566ae4e54e6a017 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_gprs_comm_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_user_interface.o: ../Application/App_user_interface.c  .generated_files/flags/default/ccd3b170a273abee836f0e8f85bfbf5354df05ef .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_user_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_user_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_user_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/delay.o: ../common/delay.c  .generated_files/flags/default/6d0675302ffd237570f42986589be3c5bfc0c28b .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/delay.c  -o ${OBJECTDIR}/_ext/1270477542/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/delay.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/hexString.o: ../common/hexString.c  .generated_files/flags/default/4a5188c12b129e904366f6968fdbc5389e6f7226 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/hexString.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/hexString.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/hexString.c  -o ${OBJECTDIR}/_ext/1270477542/hexString.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/hexString.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/queue.o: ../common/queue.c  .generated_files/flags/default/2e055b55faada781d4ba1e8affb589fd511c7ec .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/queue.c  -o ${OBJECTDIR}/_ext/1270477542/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/queue.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/tick.o: ../common/tick.c  .generated_files/flags/default/64349eac1f392e779e59307d84ab1afff420e09f .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/tick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/tick.c  -o ${OBJECTDIR}/_ext/1270477542/tick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/tick.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/utility.o: ../common/utility.c  .generated_files/flags/default/df067db33fbb089a195117cc4b6a0401c03a5a7c .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/utility.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/utility.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/utility.c  -o ${OBJECTDIR}/_ext/1270477542/utility.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/utility.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/918604917/NMEA_parser.o: ../GPS_GNSS/NMEA_parser.c  .generated_files/flags/default/4b15b2d3a354e6080c81daf4408ee53fefb59b86 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/918604917" 
	@${RM} ${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/918604917/NMEA_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../GPS_GNSS/NMEA_parser.c  -o ${OBJECTDIR}/_ext/918604917/NMEA_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/clock.o: ../mcc_generated_files/clock.c  .generated_files/flags/default/75d4d8f0242b5370b292e3c6e33b56c914502d71 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/clock.c  -o ${OBJECTDIR}/_ext/1769188794/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/clock.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/interrupt_manager.o: ../mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/f51766d50ac6b036b47a43e2ddcf6d1eaca9f8be .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/mcc.o: ../mcc_generated_files/mcc.c  .generated_files/flags/default/8bc7acade3ed076553029e538b5ac38e39686f9b .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/mcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/mcc.c  -o ${OBJECTDIR}/_ext/1769188794/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/mcc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/pin_manager.o: ../mcc_generated_files/pin_manager.c  .generated_files/flags/default/9a3745a54b856a88c265c2a808a8576d637989fe .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/_ext/1769188794/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/pin_manager.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/rtcc.o: ../mcc_generated_files/rtcc.c  .generated_files/flags/default/4e71278735d0c8e1140062853b815ea7e80310b1 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/rtcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/rtcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/rtcc.c  -o ${OBJECTDIR}/_ext/1769188794/rtcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/rtcc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/spi1.o: ../mcc_generated_files/spi1.c  .generated_files/flags/default/850a4c440ba0f82bd55ce8e149ddff013cecc28f .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/spi1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/spi1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/spi1.c  -o ${OBJECTDIR}/_ext/1769188794/spi1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/spi1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/system.o: ../mcc_generated_files/system.c  .generated_files/flags/default/dc2b381280f13185a1c262ae08c78586c3fdd7b5 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/system.c  -o ${OBJECTDIR}/_ext/1769188794/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/tmr1.o: ../mcc_generated_files/tmr1.c  .generated_files/flags/default/59c80304d49bd373986ab660960036432c1e281d .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/_ext/1769188794/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/tmr1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/tmr3.o: ../mcc_generated_files/tmr3.c  .generated_files/flags/default/4f7b440337865a4239d6b66f4a3e6a83d258170f .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/tmr3.c  -o ${OBJECTDIR}/_ext/1769188794/tmr3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/tmr3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/traps.o: ../mcc_generated_files/traps.c  .generated_files/flags/default/4083c869f40abfe5a198c5e47eed82dfd1982327 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/traps.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/traps.c  -o ${OBJECTDIR}/_ext/1769188794/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/traps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/uart1.o: ../mcc_generated_files/uart1.c  .generated_files/flags/default/eae3798778b37e69eae4c0f2cae1f4195b65e983 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/uart1.c  -o ${OBJECTDIR}/_ext/1769188794/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/uart1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/uart2.o: ../mcc_generated_files/uart2.c  .generated_files/flags/default/4767a8ae9080cf763a0a5c6d9f6f3452e812acf8 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/uart2.c  -o ${OBJECTDIR}/_ext/1769188794/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/uart2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/638798250/Quectel_interface.o: ../Quectel/Quectel_interface.c  .generated_files/flags/default/bb06174727adc50e259fe90a9bf62862fd2e578c .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/638798250" 
	@${RM} ${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/638798250/Quectel_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Quectel/Quectel_interface.c  -o ${OBJECTDIR}/_ext/638798250/Quectel_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  .generated_files/flags/default/f0a257be0043e65ad9edf748930068ab6b7155ba .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/1693421727/App_Setup.o: ../Application/App_Setup.c  .generated_files/flags/default/d4e8381299110de044668eedfcb100a2056c1c3b .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_Setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_Setup.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_Setup.c  -o ${OBJECTDIR}/_ext/1693421727/App_Setup.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_Setup.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o: ../Application/App_quectel_common_interface.c  .generated_files/flags/default/e209f91ef34a6e544d6cabc1e081df776b228cd0 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_quectel_common_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o: ../Application/App_gps_comm_interface.c  .generated_files/flags/default/65965b253684876c87f11e148434d11e23c7c478 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_gps_comm_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o: ../Application/App_gprs_comm_interface.c  .generated_files/flags/default/57095c0bb0ae051c42c762ada45bde505282cc6d .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_gprs_comm_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_user_interface.o: ../Application/App_user_interface.c  .generated_files/flags/default/2796c77fc4dcd8f8bc585e211657fac08ecd3eb8 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_user_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_user_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_user_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/delay.o: ../common/delay.c  .generated_files/flags/default/e7cd5c9c72537a577d293d3317d0445b7ef453b6 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/delay.c  -o ${OBJECTDIR}/_ext/1270477542/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/delay.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/hexString.o: ../common/hexString.c  .generated_files/flags/default/37c32b0c785bebb065447b06b06c129a31dddc53 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/hexString.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/hexString.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/hexString.c  -o ${OBJECTDIR}/_ext/1270477542/hexString.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/hexString.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/queue.o: ../common/queue.c  .generated_files/flags/default/34dcf3586e380f90150798c8132bb271d02aa20 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/queue.c  -o ${OBJECTDIR}/_ext/1270477542/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/queue.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/tick.o: ../common/tick.c  .generated_files/flags/default/ddcd502808c2f666a5cab2eab36cbcb3c533d31f .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/tick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/tick.c  -o ${OBJECTDIR}/_ext/1270477542/tick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/tick.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/utility.o: ../common/utility.c  .generated_files/flags/default/bb0d8bc3f8b41b4a950c2d72d2e799dc884e8eba .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/utility.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/utility.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/utility.c  -o ${OBJECTDIR}/_ext/1270477542/utility.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/utility.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/918604917/NMEA_parser.o: ../GPS_GNSS/NMEA_parser.c  .generated_files/flags/default/514568195adc3cd4033b718b00fb752a43f93fa .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/918604917" 
	@${RM} ${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/918604917/NMEA_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../GPS_GNSS/NMEA_parser.c  -o ${OBJECTDIR}/_ext/918604917/NMEA_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/clock.o: ../mcc_generated_files/clock.c  .generated_files/flags/default/f5b3d9227cec00aaa2f766494f65da62a553c044 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/clock.c  -o ${OBJECTDIR}/_ext/1769188794/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/interrupt_manager.o: ../mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/2571db6fe50f909ddcff489be87a4ecd253ce14b .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/mcc.o: ../mcc_generated_files/mcc.c  .generated_files/flags/default/9927eb72ecea318c9986247d44f51f6a0b6e3eca .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/mcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/mcc.c  -o ${OBJECTDIR}/_ext/1769188794/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/mcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/pin_manager.o: ../mcc_generated_files/pin_manager.c  .generated_files/flags/default/af63c4c53cef7ad7c2c9aed2cb6bcff309ec1d94 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/_ext/1769188794/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/rtcc.o: ../mcc_generated_files/rtcc.c  .generated_files/flags/default/3774a5b86cc1180aab94f8fdac10b6d3006d0668 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/rtcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/rtcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/rtcc.c  -o ${OBJECTDIR}/_ext/1769188794/rtcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/rtcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/spi1.o: ../mcc_generated_files/spi1.c  .generated_files/flags/default/bbc1a519455636d3a6e7ced696b4d0e84001d73b .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/spi1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/spi1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/spi1.c  -o ${OBJECTDIR}/_ext/1769188794/spi1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/spi1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/system.o: ../mcc_generated_files/system.c  .generated_files/flags/default/cc7e6cc48b1c54a3cc300063a40f597a8c41ec99 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/system.c  -o ${OBJECTDIR}/_ext/1769188794/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/tmr1.o: ../mcc_generated_files/tmr1.c  .generated_files/flags/default/e4ef2d1ea31315a147cd20f5b9cb5b4ee87ec3ff .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/_ext/1769188794/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/tmr1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/tmr3.o: ../mcc_generated_files/tmr3.c  .generated_files/flags/default/908847e552545cc3d40f0c947c0c1763b26276b5 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/tmr3.c  -o ${OBJECTDIR}/_ext/1769188794/tmr3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/tmr3.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/traps.o: ../mcc_generated_files/traps.c  .generated_files/flags/default/4d69728fd6f4295b5075be914e6c1d87694ab235 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/traps.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/traps.c  -o ${OBJECTDIR}/_ext/1769188794/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/traps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/uart1.o: ../mcc_generated_files/uart1.c  .generated_files/flags/default/240ce68a82fd7571f6d258433f63359be7019313 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/uart1.c  -o ${OBJECTDIR}/_ext/1769188794/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/uart1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/uart2.o: ../mcc_generated_files/uart2.c  .generated_files/flags/default/27d90021ec5ec724b1b500bdcd1c296e09cbe694 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/uart2.c  -o ${OBJECTDIR}/_ext/1769188794/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/uart2.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/638798250/Quectel_interface.o: ../Quectel/Quectel_interface.c  .generated_files/flags/default/94e89b45b5446a65e9eb7bc3e7fd3cad37c66b25 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/638798250" 
	@${RM} ${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/638798250/Quectel_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Quectel/Quectel_interface.c  -o ${OBJECTDIR}/_ext/638798250/Quectel_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  .generated_files/flags/default/2ba9a5b5db81886421fda9ea50d0c2436a9ad902 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
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
