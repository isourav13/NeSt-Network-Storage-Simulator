################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/MQsim/model/sim/Engine.cpp \
../src/MQsim/model/sim/EventTree.cpp 

CPP_DEPS += \
./src/MQsim/model/sim/Engine.d \
./src/MQsim/model/sim/EventTree.d 

OBJS += \
./src/MQsim/model/sim/Engine.o \
./src/MQsim/model/sim/EventTree.o 


# Each subdirectory must supply rules for building sources it contributes
src/MQsim/model/sim/%.o: ../src/MQsim/model/sim/%.cpp src/MQsim/model/sim/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-MQsim-2f-model-2f-sim

clean-src-2f-MQsim-2f-model-2f-sim:
	-$(RM) ./src/MQsim/model/sim/Engine.d ./src/MQsim/model/sim/Engine.o ./src/MQsim/model/sim/EventTree.d ./src/MQsim/model/sim/EventTree.o

.PHONY: clean-src-2f-MQsim-2f-model-2f-sim

