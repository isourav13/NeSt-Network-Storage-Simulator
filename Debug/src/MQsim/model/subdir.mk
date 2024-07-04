################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/MQsim/model/MQsim.cc 

CC_DEPS += \
./src/MQsim/model/MQsim.d 

OBJS += \
./src/MQsim/model/MQsim.o 


# Each subdirectory must supply rules for building sources it contributes
src/MQsim/model/%.o: ../src/MQsim/model/%.cc src/MQsim/model/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-MQsim-2f-model

clean-src-2f-MQsim-2f-model:
	-$(RM) ./src/MQsim/model/MQsim.d ./src/MQsim/model/MQsim.o

.PHONY: clean-src-2f-MQsim-2f-model

