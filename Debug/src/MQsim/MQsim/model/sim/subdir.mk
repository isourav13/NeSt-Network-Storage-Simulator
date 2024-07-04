################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/MQsim/MQsim/model/sim/Engine.cpp \
../src/MQsim/MQsim/model/sim/EventTree.cpp 

OBJS += \
./src/MQsim/MQsim/model/sim/Engine.o \
./src/MQsim/MQsim/model/sim/EventTree.o 

CPP_DEPS += \
./src/MQsim/MQsim/model/sim/Engine.d \
./src/MQsim/MQsim/model/sim/EventTree.d 


# Each subdirectory must supply rules for building sources it contributes
src/MQsim/MQsim/model/sim/%.o: ../src/MQsim/MQsim/model/sim/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


