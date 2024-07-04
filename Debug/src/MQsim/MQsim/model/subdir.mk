################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/MQsim/MQsim/model/MQsim.cc 

CC_DEPS += \
./src/MQsim/MQsim/model/MQsim.d 

OBJS += \
./src/MQsim/MQsim/model/MQsim.o 


# Each subdirectory must supply rules for building sources it contributes
src/MQsim/MQsim/model/%.o: ../src/MQsim/MQsim/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


