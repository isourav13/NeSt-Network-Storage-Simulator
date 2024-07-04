################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/openflow/examples/openflow-switch.cc 

CC_DEPS += \
./src/openflow/examples/openflow-switch.d 

OBJS += \
./src/openflow/examples/openflow-switch.o 


# Each subdirectory must supply rules for building sources it contributes
src/openflow/examples/%.o: ../src/openflow/examples/%.cc src/openflow/examples/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-openflow-2f-examples

clean-src-2f-openflow-2f-examples:
	-$(RM) ./src/openflow/examples/openflow-switch.d ./src/openflow/examples/openflow-switch.o

.PHONY: clean-src-2f-openflow-2f-examples

