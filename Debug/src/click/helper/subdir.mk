################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/click/helper/click-internet-stack-helper.cc 

CC_DEPS += \
./src/click/helper/click-internet-stack-helper.d 

OBJS += \
./src/click/helper/click-internet-stack-helper.o 


# Each subdirectory must supply rules for building sources it contributes
src/click/helper/%.o: ../src/click/helper/%.cc src/click/helper/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-click-2f-helper

clean-src-2f-click-2f-helper:
	-$(RM) ./src/click/helper/click-internet-stack-helper.d ./src/click/helper/click-internet-stack-helper.o

.PHONY: clean-src-2f-click-2f-helper

