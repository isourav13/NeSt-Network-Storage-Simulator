################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/openflow/test/openflow-switch-test-suite.cc 

CC_DEPS += \
./src/openflow/test/openflow-switch-test-suite.d 

OBJS += \
./src/openflow/test/openflow-switch-test-suite.o 


# Each subdirectory must supply rules for building sources it contributes
src/openflow/test/%.o: ../src/openflow/test/%.cc src/openflow/test/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-openflow-2f-test

clean-src-2f-openflow-2f-test:
	-$(RM) ./src/openflow/test/openflow-switch-test-suite.d ./src/openflow/test/openflow-switch-test-suite.o

.PHONY: clean-src-2f-openflow-2f-test

