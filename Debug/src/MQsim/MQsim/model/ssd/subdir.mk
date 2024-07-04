################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/MQsim/MQsim/model/ssd/Address_Mapping_Unit_Base.cpp \
../src/MQsim/MQsim/model/ssd/Address_Mapping_Unit_Hybrid.cpp \
../src/MQsim/MQsim/model/ssd/Address_Mapping_Unit_Page_Level.cpp \
../src/MQsim/MQsim/model/ssd/Data_Cache_Flash.cpp \
../src/MQsim/MQsim/model/ssd/Data_Cache_Manager_Base.cpp \
../src/MQsim/MQsim/model/ssd/Data_Cache_Manager_Flash_Advanced.cpp \
../src/MQsim/MQsim/model/ssd/Data_Cache_Manager_Flash_Simple.cpp \
../src/MQsim/MQsim/model/ssd/FTL.cpp \
../src/MQsim/MQsim/model/ssd/Flash_Block_Manager.cpp \
../src/MQsim/MQsim/model/ssd/Flash_Block_Manager_Base.cpp \
../src/MQsim/MQsim/model/ssd/Flash_Transaction_Queue.cpp \
../src/MQsim/MQsim/model/ssd/GC_and_WL_Unit_Base.cpp \
../src/MQsim/MQsim/model/ssd/GC_and_WL_Unit_Page_Level.cpp \
../src/MQsim/MQsim/model/ssd/Host_Interface_Base.cpp \
../src/MQsim/MQsim/model/ssd/Host_Interface_NVMe.cpp \
../src/MQsim/MQsim/model/ssd/Host_Interface_SATA.cpp \
../src/MQsim/MQsim/model/ssd/NVM_Firmware.cpp \
../src/MQsim/MQsim/model/ssd/NVM_PHY_Base.cpp \
../src/MQsim/MQsim/model/ssd/NVM_PHY_ONFI.cpp \
../src/MQsim/MQsim/model/ssd/NVM_PHY_ONFI_NVDDR2.cpp \
../src/MQsim/MQsim/model/ssd/NVM_Transaction_Flash.cpp \
../src/MQsim/MQsim/model/ssd/NVM_Transaction_Flash_ER.cpp \
../src/MQsim/MQsim/model/ssd/NVM_Transaction_Flash_RD.cpp \
../src/MQsim/MQsim/model/ssd/NVM_Transaction_Flash_WR.cpp \
../src/MQsim/MQsim/model/ssd/ONFI_Channel_Base.cpp \
../src/MQsim/MQsim/model/ssd/ONFI_Channel_NVDDR2.cpp \
../src/MQsim/MQsim/model/ssd/Queue_Probe.cpp \
../src/MQsim/MQsim/model/ssd/Stats.cpp \
../src/MQsim/MQsim/model/ssd/TSU_Base.cpp \
../src/MQsim/MQsim/model/ssd/TSU_FLIN.cpp \
../src/MQsim/MQsim/model/ssd/TSU_OutofOrder.cpp \
../src/MQsim/MQsim/model/ssd/TSU_Priority_OutOfOrder.cpp \
../src/MQsim/MQsim/model/ssd/User_Request.cpp 

OBJS += \
./src/MQsim/MQsim/model/ssd/Address_Mapping_Unit_Base.o \
./src/MQsim/MQsim/model/ssd/Address_Mapping_Unit_Hybrid.o \
./src/MQsim/MQsim/model/ssd/Address_Mapping_Unit_Page_Level.o \
./src/MQsim/MQsim/model/ssd/Data_Cache_Flash.o \
./src/MQsim/MQsim/model/ssd/Data_Cache_Manager_Base.o \
./src/MQsim/MQsim/model/ssd/Data_Cache_Manager_Flash_Advanced.o \
./src/MQsim/MQsim/model/ssd/Data_Cache_Manager_Flash_Simple.o \
./src/MQsim/MQsim/model/ssd/FTL.o \
./src/MQsim/MQsim/model/ssd/Flash_Block_Manager.o \
./src/MQsim/MQsim/model/ssd/Flash_Block_Manager_Base.o \
./src/MQsim/MQsim/model/ssd/Flash_Transaction_Queue.o \
./src/MQsim/MQsim/model/ssd/GC_and_WL_Unit_Base.o \
./src/MQsim/MQsim/model/ssd/GC_and_WL_Unit_Page_Level.o \
./src/MQsim/MQsim/model/ssd/Host_Interface_Base.o \
./src/MQsim/MQsim/model/ssd/Host_Interface_NVMe.o \
./src/MQsim/MQsim/model/ssd/Host_Interface_SATA.o \
./src/MQsim/MQsim/model/ssd/NVM_Firmware.o \
./src/MQsim/MQsim/model/ssd/NVM_PHY_Base.o \
./src/MQsim/MQsim/model/ssd/NVM_PHY_ONFI.o \
./src/MQsim/MQsim/model/ssd/NVM_PHY_ONFI_NVDDR2.o \
./src/MQsim/MQsim/model/ssd/NVM_Transaction_Flash.o \
./src/MQsim/MQsim/model/ssd/NVM_Transaction_Flash_ER.o \
./src/MQsim/MQsim/model/ssd/NVM_Transaction_Flash_RD.o \
./src/MQsim/MQsim/model/ssd/NVM_Transaction_Flash_WR.o \
./src/MQsim/MQsim/model/ssd/ONFI_Channel_Base.o \
./src/MQsim/MQsim/model/ssd/ONFI_Channel_NVDDR2.o \
./src/MQsim/MQsim/model/ssd/Queue_Probe.o \
./src/MQsim/MQsim/model/ssd/Stats.o \
./src/MQsim/MQsim/model/ssd/TSU_Base.o \
./src/MQsim/MQsim/model/ssd/TSU_FLIN.o \
./src/MQsim/MQsim/model/ssd/TSU_OutofOrder.o \
./src/MQsim/MQsim/model/ssd/TSU_Priority_OutOfOrder.o \
./src/MQsim/MQsim/model/ssd/User_Request.o 

CPP_DEPS += \
./src/MQsim/MQsim/model/ssd/Address_Mapping_Unit_Base.d \
./src/MQsim/MQsim/model/ssd/Address_Mapping_Unit_Hybrid.d \
./src/MQsim/MQsim/model/ssd/Address_Mapping_Unit_Page_Level.d \
./src/MQsim/MQsim/model/ssd/Data_Cache_Flash.d \
./src/MQsim/MQsim/model/ssd/Data_Cache_Manager_Base.d \
./src/MQsim/MQsim/model/ssd/Data_Cache_Manager_Flash_Advanced.d \
./src/MQsim/MQsim/model/ssd/Data_Cache_Manager_Flash_Simple.d \
./src/MQsim/MQsim/model/ssd/FTL.d \
./src/MQsim/MQsim/model/ssd/Flash_Block_Manager.d \
./src/MQsim/MQsim/model/ssd/Flash_Block_Manager_Base.d \
./src/MQsim/MQsim/model/ssd/Flash_Transaction_Queue.d \
./src/MQsim/MQsim/model/ssd/GC_and_WL_Unit_Base.d \
./src/MQsim/MQsim/model/ssd/GC_and_WL_Unit_Page_Level.d \
./src/MQsim/MQsim/model/ssd/Host_Interface_Base.d \
./src/MQsim/MQsim/model/ssd/Host_Interface_NVMe.d \
./src/MQsim/MQsim/model/ssd/Host_Interface_SATA.d \
./src/MQsim/MQsim/model/ssd/NVM_Firmware.d \
./src/MQsim/MQsim/model/ssd/NVM_PHY_Base.d \
./src/MQsim/MQsim/model/ssd/NVM_PHY_ONFI.d \
./src/MQsim/MQsim/model/ssd/NVM_PHY_ONFI_NVDDR2.d \
./src/MQsim/MQsim/model/ssd/NVM_Transaction_Flash.d \
./src/MQsim/MQsim/model/ssd/NVM_Transaction_Flash_ER.d \
./src/MQsim/MQsim/model/ssd/NVM_Transaction_Flash_RD.d \
./src/MQsim/MQsim/model/ssd/NVM_Transaction_Flash_WR.d \
./src/MQsim/MQsim/model/ssd/ONFI_Channel_Base.d \
./src/MQsim/MQsim/model/ssd/ONFI_Channel_NVDDR2.d \
./src/MQsim/MQsim/model/ssd/Queue_Probe.d \
./src/MQsim/MQsim/model/ssd/Stats.d \
./src/MQsim/MQsim/model/ssd/TSU_Base.d \
./src/MQsim/MQsim/model/ssd/TSU_FLIN.d \
./src/MQsim/MQsim/model/ssd/TSU_OutofOrder.d \
./src/MQsim/MQsim/model/ssd/TSU_Priority_OutOfOrder.d \
./src/MQsim/MQsim/model/ssd/User_Request.d 


# Each subdirectory must supply rules for building sources it contributes
src/MQsim/MQsim/model/ssd/%.o: ../src/MQsim/MQsim/model/ssd/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


