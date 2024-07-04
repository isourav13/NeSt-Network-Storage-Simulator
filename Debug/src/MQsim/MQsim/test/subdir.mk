################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/MQsim/MQsim/test/MQsim-test-suite.cc 

CC_DEPS += \
./src/MQsim/MQsim/test/MQsim-test-suite.d 

OBJS += \
./src/MQsim/MQsim/test/MQsim-test-suite.o 


# Each subdirectory must supply rules for building sources it contributes
src/MQsim/MQsim/test/%.o: ../src/MQsim/MQsim/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


