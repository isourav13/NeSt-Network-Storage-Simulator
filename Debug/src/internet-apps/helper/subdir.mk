################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/internet-apps/helper/dhcp-helper.cc \
../src/internet-apps/helper/ping6-helper.cc \
../src/internet-apps/helper/radvd-helper.cc \
../src/internet-apps/helper/v4ping-helper.cc \
../src/internet-apps/helper/v4traceroute-helper.cc 

CC_DEPS += \
./src/internet-apps/helper/dhcp-helper.d \
./src/internet-apps/helper/ping6-helper.d \
./src/internet-apps/helper/radvd-helper.d \
./src/internet-apps/helper/v4ping-helper.d \
./src/internet-apps/helper/v4traceroute-helper.d 

OBJS += \
./src/internet-apps/helper/dhcp-helper.o \
./src/internet-apps/helper/ping6-helper.o \
./src/internet-apps/helper/radvd-helper.o \
./src/internet-apps/helper/v4ping-helper.o \
./src/internet-apps/helper/v4traceroute-helper.o 


# Each subdirectory must supply rules for building sources it contributes
src/internet-apps/helper/%.o: ../src/internet-apps/helper/%.cc src/internet-apps/helper/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-internet-2d-apps-2f-helper

clean-src-2f-internet-2d-apps-2f-helper:
	-$(RM) ./src/internet-apps/helper/dhcp-helper.d ./src/internet-apps/helper/dhcp-helper.o ./src/internet-apps/helper/ping6-helper.d ./src/internet-apps/helper/ping6-helper.o ./src/internet-apps/helper/radvd-helper.d ./src/internet-apps/helper/radvd-helper.o ./src/internet-apps/helper/v4ping-helper.d ./src/internet-apps/helper/v4ping-helper.o ./src/internet-apps/helper/v4traceroute-helper.d ./src/internet-apps/helper/v4traceroute-helper.o

.PHONY: clean-src-2f-internet-2d-apps-2f-helper

