################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/internet-apps/test/dhcp-test.cc 

CC_DEPS += \
./src/internet-apps/test/dhcp-test.d 

OBJS += \
./src/internet-apps/test/dhcp-test.o 


# Each subdirectory must supply rules for building sources it contributes
src/internet-apps/test/%.o: ../src/internet-apps/test/%.cc src/internet-apps/test/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-internet-2d-apps-2f-test

clean-src-2f-internet-2d-apps-2f-test:
	-$(RM) ./src/internet-apps/test/dhcp-test.d ./src/internet-apps/test/dhcp-test.o

.PHONY: clean-src-2f-internet-2d-apps-2f-test

