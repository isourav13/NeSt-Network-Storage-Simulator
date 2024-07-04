################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/config-store/examples/config-store-save.cc 

CC_DEPS += \
./src/config-store/examples/config-store-save.d 

OBJS += \
./src/config-store/examples/config-store-save.o 


# Each subdirectory must supply rules for building sources it contributes
src/config-store/examples/%.o: ../src/config-store/examples/%.cc src/config-store/examples/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-config-2d-store-2f-examples

clean-src-2f-config-2d-store-2f-examples:
	-$(RM) ./src/config-store/examples/config-store-save.d ./src/config-store/examples/config-store-save.o

.PHONY: clean-src-2f-config-2d-store-2f-examples

