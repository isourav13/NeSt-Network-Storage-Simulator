################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/MQsim/MQsim/examples/MQsim-example.cc 

CC_DEPS += \
./src/MQsim/MQsim/examples/MQsim-example.d 

OBJS += \
./src/MQsim/MQsim/examples/MQsim-example.o 


# Each subdirectory must supply rules for building sources it contributes
src/MQsim/MQsim/examples/%.o: ../src/MQsim/MQsim/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


