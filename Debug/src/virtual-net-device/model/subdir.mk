################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/virtual-net-device/model/virtual-net-device.cc 

CC_DEPS += \
./src/virtual-net-device/model/virtual-net-device.d 

OBJS += \
./src/virtual-net-device/model/virtual-net-device.o 


# Each subdirectory must supply rules for building sources it contributes
src/virtual-net-device/model/%.o: ../src/virtual-net-device/model/%.cc src/virtual-net-device/model/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-virtual-2d-net-2d-device-2f-model

clean-src-2f-virtual-2d-net-2d-device-2f-model:
	-$(RM) ./src/virtual-net-device/model/virtual-net-device.d ./src/virtual-net-device/model/virtual-net-device.o

.PHONY: clean-src-2f-virtual-2d-net-2d-device-2f-model

