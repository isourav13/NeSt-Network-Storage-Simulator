################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/click/test/ipv4-click-routing-test.cc 

CC_DEPS += \
./src/click/test/ipv4-click-routing-test.d 

OBJS += \
./src/click/test/ipv4-click-routing-test.o 


# Each subdirectory must supply rules for building sources it contributes
src/click/test/%.o: ../src/click/test/%.cc src/click/test/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-click-2f-test

clean-src-2f-click-2f-test:
	-$(RM) ./src/click/test/ipv4-click-routing-test.d ./src/click/test/ipv4-click-routing-test.o

.PHONY: clean-src-2f-click-2f-test

