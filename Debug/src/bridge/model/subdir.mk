################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/bridge/model/bridge-channel.cc \
../src/bridge/model/bridge-net-device.cc 

CC_DEPS += \
./src/bridge/model/bridge-channel.d \
./src/bridge/model/bridge-net-device.d 

OBJS += \
./src/bridge/model/bridge-channel.o \
./src/bridge/model/bridge-net-device.o 


# Each subdirectory must supply rules for building sources it contributes
src/bridge/model/%.o: ../src/bridge/model/%.cc src/bridge/model/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-bridge-2f-model

clean-src-2f-bridge-2f-model:
	-$(RM) ./src/bridge/model/bridge-channel.d ./src/bridge/model/bridge-channel.o ./src/bridge/model/bridge-net-device.d ./src/bridge/model/bridge-net-device.o

.PHONY: clean-src-2f-bridge-2f-model

