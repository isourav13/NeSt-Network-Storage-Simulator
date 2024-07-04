################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/olsr/helper/olsr-helper.cc 

CC_DEPS += \
./src/olsr/helper/olsr-helper.d 

OBJS += \
./src/olsr/helper/olsr-helper.o 


# Each subdirectory must supply rules for building sources it contributes
src/olsr/helper/%.o: ../src/olsr/helper/%.cc src/olsr/helper/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-olsr-2f-helper

clean-src-2f-olsr-2f-helper:
	-$(RM) ./src/olsr/helper/olsr-helper.d ./src/olsr/helper/olsr-helper.o

.PHONY: clean-src-2f-olsr-2f-helper

