################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/MQsim/helper/MQsim-helper.cc 

CC_DEPS += \
./src/MQsim/helper/MQsim-helper.d 

OBJS += \
./src/MQsim/helper/MQsim-helper.o 


# Each subdirectory must supply rules for building sources it contributes
src/MQsim/helper/%.o: ../src/MQsim/helper/%.cc src/MQsim/helper/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-MQsim-2f-helper

clean-src-2f-MQsim-2f-helper:
	-$(RM) ./src/MQsim/helper/MQsim-helper.d ./src/MQsim/helper/MQsim-helper.o

.PHONY: clean-src-2f-MQsim-2f-helper

