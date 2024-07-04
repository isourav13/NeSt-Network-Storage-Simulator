################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bindings/python/ns3module_helpers.cc 

CC_DEPS += \
./bindings/python/ns3module_helpers.d 

OBJS += \
./bindings/python/ns3module_helpers.o 


# Each subdirectory must supply rules for building sources it contributes
bindings/python/%.o: ../bindings/python/%.cc bindings/python/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-bindings-2f-python

clean-bindings-2f-python:
	-$(RM) ./bindings/python/ns3module_helpers.d ./bindings/python/ns3module_helpers.o

.PHONY: clean-bindings-2f-python

