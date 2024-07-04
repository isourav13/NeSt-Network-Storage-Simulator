################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/sixlowpan/helper/sixlowpan-helper.cc 

CC_DEPS += \
./src/sixlowpan/helper/sixlowpan-helper.d 

OBJS += \
./src/sixlowpan/helper/sixlowpan-helper.o 


# Each subdirectory must supply rules for building sources it contributes
src/sixlowpan/helper/%.o: ../src/sixlowpan/helper/%.cc src/sixlowpan/helper/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-sixlowpan-2f-helper

clean-src-2f-sixlowpan-2f-helper:
	-$(RM) ./src/sixlowpan/helper/sixlowpan-helper.d ./src/sixlowpan/helper/sixlowpan-helper.o

.PHONY: clean-src-2f-sixlowpan-2f-helper

