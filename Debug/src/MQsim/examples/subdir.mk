################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/MQsim/examples/MQsim-example.cc 

CC_DEPS += \
./src/MQsim/examples/MQsim-example.d 

OBJS += \
./src/MQsim/examples/MQsim-example.o 


# Each subdirectory must supply rules for building sources it contributes
src/MQsim/examples/%.o: ../src/MQsim/examples/%.cc src/MQsim/examples/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-MQsim-2f-examples

clean-src-2f-MQsim-2f-examples:
	-$(RM) ./src/MQsim/examples/MQsim-example.d ./src/MQsim/examples/MQsim-example.o

.PHONY: clean-src-2f-MQsim-2f-examples

