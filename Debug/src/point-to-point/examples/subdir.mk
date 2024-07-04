################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/point-to-point/examples/main-attribute-value.cc 

CC_DEPS += \
./src/point-to-point/examples/main-attribute-value.d 

OBJS += \
./src/point-to-point/examples/main-attribute-value.o 


# Each subdirectory must supply rules for building sources it contributes
src/point-to-point/examples/%.o: ../src/point-to-point/examples/%.cc src/point-to-point/examples/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-point-2d-to-2d-point-2f-examples

clean-src-2f-point-2d-to-2d-point-2f-examples:
	-$(RM) ./src/point-to-point/examples/main-attribute-value.d ./src/point-to-point/examples/main-attribute-value.o

.PHONY: clean-src-2f-point-2d-to-2d-point-2f-examples

