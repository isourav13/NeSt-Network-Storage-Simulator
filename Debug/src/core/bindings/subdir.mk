################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/core/bindings/module_helpers.cc 

CC_DEPS += \
./src/core/bindings/module_helpers.d 

OBJS += \
./src/core/bindings/module_helpers.o 


# Each subdirectory must supply rules for building sources it contributes
src/core/bindings/%.o: ../src/core/bindings/%.cc src/core/bindings/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-core-2f-bindings

clean-src-2f-core-2f-bindings:
	-$(RM) ./src/core/bindings/module_helpers.d ./src/core/bindings/module_helpers.o

.PHONY: clean-src-2f-core-2f-bindings

