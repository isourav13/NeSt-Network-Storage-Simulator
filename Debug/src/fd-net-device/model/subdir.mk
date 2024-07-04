################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/fd-net-device/model/dpdk-net-device.cc \
../src/fd-net-device/model/fd-net-device.cc \
../src/fd-net-device/model/netmap-net-device.cc 

CC_DEPS += \
./src/fd-net-device/model/dpdk-net-device.d \
./src/fd-net-device/model/fd-net-device.d \
./src/fd-net-device/model/netmap-net-device.d 

OBJS += \
./src/fd-net-device/model/dpdk-net-device.o \
./src/fd-net-device/model/fd-net-device.o \
./src/fd-net-device/model/netmap-net-device.o 


# Each subdirectory must supply rules for building sources it contributes
src/fd-net-device/model/%.o: ../src/fd-net-device/model/%.cc src/fd-net-device/model/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-fd-2d-net-2d-device-2f-model

clean-src-2f-fd-2d-net-2d-device-2f-model:
	-$(RM) ./src/fd-net-device/model/dpdk-net-device.d ./src/fd-net-device/model/dpdk-net-device.o ./src/fd-net-device/model/fd-net-device.d ./src/fd-net-device/model/fd-net-device.o ./src/fd-net-device/model/netmap-net-device.d ./src/fd-net-device/model/netmap-net-device.o

.PHONY: clean-src-2f-fd-2d-net-2d-device-2f-model

