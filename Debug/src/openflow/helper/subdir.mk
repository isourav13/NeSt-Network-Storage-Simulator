################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/openflow/helper/openflow-switch-helper.cc 

CC_DEPS += \
./src/openflow/helper/openflow-switch-helper.d 

OBJS += \
./src/openflow/helper/openflow-switch-helper.o 


# Each subdirectory must supply rules for building sources it contributes
src/openflow/helper/%.o: ../src/openflow/helper/%.cc src/openflow/helper/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-openflow-2f-helper

clean-src-2f-openflow-2f-helper:
	-$(RM) ./src/openflow/helper/openflow-switch-helper.d ./src/openflow/helper/openflow-switch-helper.o

.PHONY: clean-src-2f-openflow-2f-helper

