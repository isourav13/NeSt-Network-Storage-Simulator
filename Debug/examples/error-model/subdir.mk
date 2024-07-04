################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../examples/error-model/simple-error-model.cc 

CC_DEPS += \
./examples/error-model/simple-error-model.d 

OBJS += \
./examples/error-model/simple-error-model.o 


# Each subdirectory must supply rules for building sources it contributes
examples/error-model/%.o: ../examples/error-model/%.cc examples/error-model/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-examples-2f-error-2d-model

clean-examples-2f-error-2d-model:
	-$(RM) ./examples/error-model/simple-error-model.d ./examples/error-model/simple-error-model.o

.PHONY: clean-examples-2f-error-2d-model

