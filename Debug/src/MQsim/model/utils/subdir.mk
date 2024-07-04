################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/MQsim/model/utils/CMRRandomGenerator.cpp \
../src/MQsim/model/utils/Helper_Functions.cpp \
../src/MQsim/model/utils/Logical_Address_Partitioning_Unit.cpp \
../src/MQsim/model/utils/RandomGenerator.cpp \
../src/MQsim/model/utils/SimInterface.cpp \
../src/MQsim/model/utils/StringTools.cpp \
../src/MQsim/model/utils/XMLWriter.cpp 

CPP_DEPS += \
./src/MQsim/model/utils/CMRRandomGenerator.d \
./src/MQsim/model/utils/Helper_Functions.d \
./src/MQsim/model/utils/Logical_Address_Partitioning_Unit.d \
./src/MQsim/model/utils/RandomGenerator.d \
./src/MQsim/model/utils/SimInterface.d \
./src/MQsim/model/utils/StringTools.d \
./src/MQsim/model/utils/XMLWriter.d 

OBJS += \
./src/MQsim/model/utils/CMRRandomGenerator.o \
./src/MQsim/model/utils/Helper_Functions.o \
./src/MQsim/model/utils/Logical_Address_Partitioning_Unit.o \
./src/MQsim/model/utils/RandomGenerator.o \
./src/MQsim/model/utils/SimInterface.o \
./src/MQsim/model/utils/StringTools.o \
./src/MQsim/model/utils/XMLWriter.o 


# Each subdirectory must supply rules for building sources it contributes
src/MQsim/model/utils/%.o: ../src/MQsim/model/utils/%.cpp src/MQsim/model/utils/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-MQsim-2f-model-2f-utils

clean-src-2f-MQsim-2f-model-2f-utils:
	-$(RM) ./src/MQsim/model/utils/CMRRandomGenerator.d ./src/MQsim/model/utils/CMRRandomGenerator.o ./src/MQsim/model/utils/Helper_Functions.d ./src/MQsim/model/utils/Helper_Functions.o ./src/MQsim/model/utils/Logical_Address_Partitioning_Unit.d ./src/MQsim/model/utils/Logical_Address_Partitioning_Unit.o ./src/MQsim/model/utils/RandomGenerator.d ./src/MQsim/model/utils/RandomGenerator.o ./src/MQsim/model/utils/SimInterface.d ./src/MQsim/model/utils/SimInterface.o ./src/MQsim/model/utils/StringTools.d ./src/MQsim/model/utils/StringTools.o ./src/MQsim/model/utils/XMLWriter.d ./src/MQsim/model/utils/XMLWriter.o

.PHONY: clean-src-2f-MQsim-2f-model-2f-utils

