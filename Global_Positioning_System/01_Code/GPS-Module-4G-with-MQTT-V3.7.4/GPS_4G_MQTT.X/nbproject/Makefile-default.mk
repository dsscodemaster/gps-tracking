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
${OBJECTDIR}/_ext/1693421727/App_Setup.o: ../Application/App_Setup.c  .generated_files/flags/default/d57251a19733fecc14b1ba4744caf4b454b096f1 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_Setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_Setup.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_Setup.c  -o ${OBJECTDIR}/_ext/1693421727/App_Setup.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_Setup.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o: ../Application/App_quectel_common_interface.c  .generated_files/flags/default/9b69dcb6abe8c418d617a82355a6006a62d9fd38 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_quectel_common_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o: ../Application/App_gps_comm_interface.c  .generated_files/flags/default/c67b5060457d8de36d05ac84c74820a4a5b2f862 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_gps_comm_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o: ../Application/App_gprs_comm_interface.c  .generated_files/flags/default/aee63c598f3fb6e4359b859c0dd6c7980925f777 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_gprs_comm_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_user_interface.o: ../Application/App_user_interface.c  .generated_files/flags/default/7b29afe00c303d210079ce3b607e9293789f1f6e .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_user_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_user_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_user_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/delay.o: ../common/delay.c  .generated_files/flags/default/91805625e5a14b6daba55ee2ee368d6a34ae7132 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/delay.c  -o ${OBJECTDIR}/_ext/1270477542/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/delay.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/hexString.o: ../common/hexString.c  .generated_files/flags/default/84a4ad11bdd979cfe3b2da20bc52c9ae09783583 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/hexString.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/hexString.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/hexString.c  -o ${OBJECTDIR}/_ext/1270477542/hexString.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/hexString.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/queue.o: ../common/queue.c  .generated_files/flags/default/5f56de5256bfd234fc7d8e246b26e5971d5f95e9 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/queue.c  -o ${OBJECTDIR}/_ext/1270477542/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/queue.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/tick.o: ../common/tick.c  .generated_files/flags/default/8659b55472a3ebbff9664834d9ded1407e04711d .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/tick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/tick.c  -o ${OBJECTDIR}/_ext/1270477542/tick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/tick.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/utility.o: ../common/utility.c  .generated_files/flags/default/569c514b03c1a46198eec3e8e38cede8b8b7f081 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/utility.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/utility.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/utility.c  -o ${OBJECTDIR}/_ext/1270477542/utility.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/utility.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/918604917/NMEA_parser.o: ../GPS_GNSS/NMEA_parser.c  .generated_files/flags/default/2de693bc039c00b6c4feeb3896c43fa8ae14eba0 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/918604917" 
	@${RM} ${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/918604917/NMEA_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../GPS_GNSS/NMEA_parser.c  -o ${OBJECTDIR}/_ext/918604917/NMEA_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/clock.o: ../mcc_generated_files/clock.c  .generated_files/flags/default/e78e88b06b91c63e46dfd65edad33b88181cac6a .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/clock.c  -o ${OBJECTDIR}/_ext/1769188794/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/clock.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/interrupt_manager.o: ../mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/51b2ac7a3c63854e4b719b5c68f2eac0f9797ae9 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/mcc.o: ../mcc_generated_files/mcc.c  .generated_files/flags/default/5ab3baed3f01dfd46245f084dd14fc1d278bdaee .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/mcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/mcc.c  -o ${OBJECTDIR}/_ext/1769188794/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/mcc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/pin_manager.o: ../mcc_generated_files/pin_manager.c  .generated_files/flags/default/77a6edfede7f6396cfcc372184067048b1749fd8 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/_ext/1769188794/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/pin_manager.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/rtcc.o: ../mcc_generated_files/rtcc.c  .generated_files/flags/default/d269613a19e29d557777b1c2e5d88577178119df .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/rtcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/rtcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/rtcc.c  -o ${OBJECTDIR}/_ext/1769188794/rtcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/rtcc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/spi1.o: ../mcc_generated_files/spi1.c  .generated_files/flags/default/45be1d079e795791c5d6ddddeb8ec72e77a3db32 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/spi1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/spi1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/spi1.c  -o ${OBJECTDIR}/_ext/1769188794/spi1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/spi1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/system.o: ../mcc_generated_files/system.c  .generated_files/flags/default/e7cd0f61636d01bfb1ffa5fb099281c04c46ec1a .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/system.c  -o ${OBJECTDIR}/_ext/1769188794/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/tmr1.o: ../mcc_generated_files/tmr1.c  .generated_files/flags/default/bd1b1990050539ee6c2c7f20a5f26e286c28ce01 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/_ext/1769188794/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/tmr1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/tmr3.o: ../mcc_generated_files/tmr3.c  .generated_files/flags/default/c56cfec472af0e7963469ff08ec4ad74a94750d .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/tmr3.c  -o ${OBJECTDIR}/_ext/1769188794/tmr3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/tmr3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/traps.o: ../mcc_generated_files/traps.c  .generated_files/flags/default/da20e040b2a1278a0200cf150a034cbf2985b8f6 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/traps.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/traps.c  -o ${OBJECTDIR}/_ext/1769188794/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/traps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/uart1.o: ../mcc_generated_files/uart1.c  .generated_files/flags/default/54979098197a3c2efbaf5ae66527a6061d900af5 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/uart1.c  -o ${OBJECTDIR}/_ext/1769188794/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/uart1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/uart2.o: ../mcc_generated_files/uart2.c  .generated_files/flags/default/63c8178c8221006489016c7091630a00e328369a .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/uart2.c  -o ${OBJECTDIR}/_ext/1769188794/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/uart2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/638798250/Quectel_interface.o: ../Quectel/Quectel_interface.c  .generated_files/flags/default/c688efc6c9883b91e610f7f4d05690cc4fe2a32d .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/638798250" 
	@${RM} ${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/638798250/Quectel_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Quectel/Quectel_interface.c  -o ${OBJECTDIR}/_ext/638798250/Quectel_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  .generated_files/flags/default/b7cb3d91532d50c1b52ddcc581f87d15b2c7de59 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/1693421727/App_Setup.o: ../Application/App_Setup.c  .generated_files/flags/default/f50929867522bb9580ef60ba68b0d1d5460028d4 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_Setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_Setup.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_Setup.c  -o ${OBJECTDIR}/_ext/1693421727/App_Setup.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_Setup.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o: ../Application/App_quectel_common_interface.c  .generated_files/flags/default/9d1a6e950f62430ba2c553fab1e77fccecd399d7 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_quectel_common_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_quectel_common_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o: ../Application/App_gps_comm_interface.c  .generated_files/flags/default/78654081505b9284f87209bbafbd7fd3e9650530 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_gps_comm_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_gps_comm_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o: ../Application/App_gprs_comm_interface.c  .generated_files/flags/default/35f90260a440808094173e3f4cc0f59dd473f95a .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_gprs_comm_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_gprs_comm_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1693421727/App_user_interface.o: ../Application/App_user_interface.c  .generated_files/flags/default/ba4566a2146c2beda936b9fe851ef0580e38a1ac .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1693421727" 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1693421727/App_user_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Application/App_user_interface.c  -o ${OBJECTDIR}/_ext/1693421727/App_user_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1693421727/App_user_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/delay.o: ../common/delay.c  .generated_files/flags/default/bd59c44772c97588f3d760745b29aec28dbbfb9f .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/delay.c  -o ${OBJECTDIR}/_ext/1270477542/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/delay.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/hexString.o: ../common/hexString.c  .generated_files/flags/default/373cf1bcb56d3bb094280706419bac6d31dade00 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/hexString.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/hexString.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/hexString.c  -o ${OBJECTDIR}/_ext/1270477542/hexString.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/hexString.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/queue.o: ../common/queue.c  .generated_files/flags/default/5fa8360fa61800cf5b3d722ec93887d64f7de455 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/queue.c  -o ${OBJECTDIR}/_ext/1270477542/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/queue.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/tick.o: ../common/tick.c  .generated_files/flags/default/a7f12ae054a8a000b39b89c604a3a19767494d89 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/tick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/tick.c  -o ${OBJECTDIR}/_ext/1270477542/tick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/tick.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1270477542/utility.o: ../common/utility.c  .generated_files/flags/default/6f73cd15c3940acc1ec5be177c5ec7f22643461c .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/utility.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/utility.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../common/utility.c  -o ${OBJECTDIR}/_ext/1270477542/utility.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1270477542/utility.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/918604917/NMEA_parser.o: ../GPS_GNSS/NMEA_parser.c  .generated_files/flags/default/97bc9e510aba3d1b7efe77f4242ccba6156a3a9e .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/918604917" 
	@${RM} ${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/918604917/NMEA_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../GPS_GNSS/NMEA_parser.c  -o ${OBJECTDIR}/_ext/918604917/NMEA_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/918604917/NMEA_parser.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/clock.o: ../mcc_generated_files/clock.c  .generated_files/flags/default/1ca0a374cf608932b1aabdf1662ff8a257cb0724 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/clock.c  -o ${OBJECTDIR}/_ext/1769188794/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/interrupt_manager.o: ../mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/c41c154b4808bf57c64af5ca644f23c48fb93e02 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/_ext/1769188794/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/interrupt_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/mcc.o: ../mcc_generated_files/mcc.c  .generated_files/flags/default/4d9d69735775a38a23721cf074eafba585ad050d .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/mcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/mcc.c  -o ${OBJECTDIR}/_ext/1769188794/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/mcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/pin_manager.o: ../mcc_generated_files/pin_manager.c  .generated_files/flags/default/dc59d6da194d6e48414b59a8a28e6961d2a3db56 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/_ext/1769188794/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/rtcc.o: ../mcc_generated_files/rtcc.c  .generated_files/flags/default/4154d254200fbac0c803023fb40ff21e9416b3c5 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/rtcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/rtcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/rtcc.c  -o ${OBJECTDIR}/_ext/1769188794/rtcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/rtcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/spi1.o: ../mcc_generated_files/spi1.c  .generated_files/flags/default/9ec9b2417ba65b327866b2dc77164b3ee6a7f69c .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/spi1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/spi1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/spi1.c  -o ${OBJECTDIR}/_ext/1769188794/spi1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/spi1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/system.o: ../mcc_generated_files/system.c  .generated_files/flags/default/bf513664bddd8abd59addca219ff3b02e162d592 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/system.c  -o ${OBJECTDIR}/_ext/1769188794/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/tmr1.o: ../mcc_generated_files/tmr1.c  .generated_files/flags/default/dcd0b491bab1ad67418f466d220c7ee2844e0ad8 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/_ext/1769188794/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/tmr1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/tmr3.o: ../mcc_generated_files/tmr3.c  .generated_files/flags/default/2099c9691fbf76a69b4aabe842dfc9f66eff8483 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/tmr3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/tmr3.c  -o ${OBJECTDIR}/_ext/1769188794/tmr3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/tmr3.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/traps.o: ../mcc_generated_files/traps.c  .generated_files/flags/default/95d0cf1d1f3bf589dcef836c399d8c0bc0b31506 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/traps.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/traps.c  -o ${OBJECTDIR}/_ext/1769188794/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/traps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/uart1.o: ../mcc_generated_files/uart1.c  .generated_files/flags/default/b128d6d1b8ca5f6b3f85f9d303566454a89df104 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/uart1.c  -o ${OBJECTDIR}/_ext/1769188794/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/uart1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1769188794/uart2.o: ../mcc_generated_files/uart2.c  .generated_files/flags/default/8d68171be627521f39bb58a68caab6bcb56c2672 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/1769188794" 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1769188794/uart2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../mcc_generated_files/uart2.c  -o ${OBJECTDIR}/_ext/1769188794/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1769188794/uart2.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/638798250/Quectel_interface.o: ../Quectel/Quectel_interface.c  .generated_files/flags/default/e2a4a04a832f01c9b8fbaeba178d62d1ba008b78 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
	@${MKDIR} "${OBJECTDIR}/_ext/638798250" 
	@${RM} ${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/638798250/Quectel_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Quectel/Quectel_interface.c  -o ${OBJECTDIR}/_ext/638798250/Quectel_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/638798250/Quectel_interface.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  .generated_files/flags/default/e6411d060a6d3e91174b3936fddf0f1becbe2733 .generated_files/flags/default/bfa23f04ccfc60090bb47af0108a2dc8eac21fdd
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
