################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/aodv/helper/aodv-helper.cc 

CC_DEPS += \
./src/aodv/helper/aodv-helper.d 

OBJS += \
./src/aodv/helper/aodv-helper.o 


# Each subdirectory must supply rules for building sources it contributes
src/aodv/helper/%.o: ../src/aodv/helper/%.cc src/aodv/helper/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-aodv-2f-helper

clean-src-2f-aodv-2f-helper:
	-$(RM) ./src/aodv/helper/aodv-helper.d ./src/aodv/helper/aodv-helper.o

.PHONY: clean-src-2f-aodv-2f-helper

