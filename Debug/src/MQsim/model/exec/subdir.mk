################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/MQsim/model/exec/Device_Parameter_Set.cpp \
../src/MQsim/model/exec/Execution_Parameter_Set.cpp \
../src/MQsim/model/exec/Flash_Parameter_Set.cpp \
../src/MQsim/model/exec/Host_Parameter_Set.cpp \
../src/MQsim/model/exec/Host_System.cpp \
../src/MQsim/model/exec/IO_Flow_Parameter_Set.cpp \
../src/MQsim/model/exec/SSD_Device.cpp 

CPP_DEPS += \
./src/MQsim/model/exec/Device_Parameter_Set.d \
./src/MQsim/model/exec/Execution_Parameter_Set.d \
./src/MQsim/model/exec/Flash_Parameter_Set.d \
./src/MQsim/model/exec/Host_Parameter_Set.d \
./src/MQsim/model/exec/Host_System.d \
./src/MQsim/model/exec/IO_Flow_Parameter_Set.d \
./src/MQsim/model/exec/SSD_Device.d 

OBJS += \
./src/MQsim/model/exec/Device_Parameter_Set.o \
./src/MQsim/model/exec/Execution_Parameter_Set.o \
./src/MQsim/model/exec/Flash_Parameter_Set.o \
./src/MQsim/model/exec/Host_Parameter_Set.o \
./src/MQsim/model/exec/Host_System.o \
./src/MQsim/model/exec/IO_Flow_Parameter_Set.o \
./src/MQsim/model/exec/SSD_Device.o 


# Each subdirectory must supply rules for building sources it contributes
src/MQsim/model/exec/%.o: ../src/MQsim/model/exec/%.cpp src/MQsim/model/exec/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-MQsim-2f-model-2f-exec

clean-src-2f-MQsim-2f-model-2f-exec:
	-$(RM) ./src/MQsim/model/exec/Device_Parameter_Set.d ./src/MQsim/model/exec/Device_Parameter_Set.o ./src/MQsim/model/exec/Execution_Parameter_Set.d ./src/MQsim/model/exec/Execution_Parameter_Set.o ./src/MQsim/model/exec/Flash_Parameter_Set.d ./src/MQsim/model/exec/Flash_Parameter_Set.o ./src/MQsim/model/exec/Host_Parameter_Set.d ./src/MQsim/model/exec/Host_Parameter_Set.o ./src/MQsim/model/exec/Host_System.d ./src/MQsim/model/exec/Host_System.o ./src/MQsim/model/exec/IO_Flow_Parameter_Set.d ./src/MQsim/model/exec/IO_Flow_Parameter_Set.o ./src/MQsim/model/exec/SSD_Device.d ./src/MQsim/model/exec/SSD_Device.o

.PHONY: clean-src-2f-MQsim-2f-model-2f-exec

