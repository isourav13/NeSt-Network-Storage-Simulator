################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/internet-apps/examples/dhcp-example.cc \
../src/internet-apps/examples/traceroute-example.cc 

CC_DEPS += \
./src/internet-apps/examples/dhcp-example.d \
./src/internet-apps/examples/traceroute-example.d 

OBJS += \
./src/internet-apps/examples/dhcp-example.o \
./src/internet-apps/examples/traceroute-example.o 


# Each subdirectory must supply rules for building sources it contributes
src/internet-apps/examples/%.o: ../src/internet-apps/examples/%.cc src/internet-apps/examples/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-internet-2d-apps-2f-examples

clean-src-2f-internet-2d-apps-2f-examples:
	-$(RM) ./src/internet-apps/examples/dhcp-example.d ./src/internet-apps/examples/dhcp-example.o ./src/internet-apps/examples/traceroute-example.d ./src/internet-apps/examples/traceroute-example.o

.PHONY: clean-src-2f-internet-2d-apps-2f-examples

