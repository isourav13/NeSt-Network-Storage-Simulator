################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/MQsim/MQsim/model/exec/Device_Parameter_Set.cpp \
../src/MQsim/MQsim/model/exec/Execution_Parameter_Set.cpp \
../src/MQsim/MQsim/model/exec/Flash_Parameter_Set.cpp \
../src/MQsim/MQsim/model/exec/Host_Parameter_Set.cpp \
../src/MQsim/MQsim/model/exec/Host_System.cpp \
../src/MQsim/MQsim/model/exec/IO_Flow_Parameter_Set.cpp \
../src/MQsim/MQsim/model/exec/SSD_Device.cpp 

OBJS += \
./src/MQsim/MQsim/model/exec/Device_Parameter_Set.o \
./src/MQsim/MQsim/model/exec/Execution_Parameter_Set.o \
./src/MQsim/MQsim/model/exec/Flash_Parameter_Set.o \
./src/MQsim/MQsim/model/exec/Host_Parameter_Set.o \
./src/MQsim/MQsim/model/exec/Host_System.o \
./src/MQsim/MQsim/model/exec/IO_Flow_Parameter_Set.o \
./src/MQsim/MQsim/model/exec/SSD_Device.o 

CPP_DEPS += \
./src/MQsim/MQsim/model/exec/Device_Parameter_Set.d \
./src/MQsim/MQsim/model/exec/Execution_Parameter_Set.d \
./src/MQsim/MQsim/model/exec/Flash_Parameter_Set.d \
./src/MQsim/MQsim/model/exec/Host_Parameter_Set.d \
./src/MQsim/MQsim/model/exec/Host_System.d \
./src/MQsim/MQsim/model/exec/IO_Flow_Parameter_Set.d \
./src/MQsim/MQsim/model/exec/SSD_Device.d 


# Each subdirectory must supply rules for building sources it contributes
src/MQsim/MQsim/model/exec/%.o: ../src/MQsim/MQsim/model/exec/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


