################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/MQsim/test/MQsim-test-suite.cc 

CC_DEPS += \
./src/MQsim/test/MQsim-test-suite.d 

OBJS += \
./src/MQsim/test/MQsim-test-suite.o 


# Each subdirectory must supply rules for building sources it contributes
src/MQsim/test/%.o: ../src/MQsim/test/%.cc src/MQsim/test/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-MQsim-2f-test

clean-src-2f-MQsim-2f-test:
	-$(RM) ./src/MQsim/test/MQsim-test-suite.d ./src/MQsim/test/MQsim-test-suite.o

.PHONY: clean-src-2f-MQsim-2f-test

