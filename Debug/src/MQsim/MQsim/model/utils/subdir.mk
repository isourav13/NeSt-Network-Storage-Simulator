################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/MQsim/MQsim/model/utils/CMRRandomGenerator.cpp \
../src/MQsim/MQsim/model/utils/Helper_Functions.cpp \
../src/MQsim/MQsim/model/utils/Logical_Address_Partitioning_Unit.cpp \
../src/MQsim/MQsim/model/utils/RandomGenerator.cpp \
../src/MQsim/MQsim/model/utils/StringTools.cpp \
../src/MQsim/MQsim/model/utils/XMLWriter.cpp 

OBJS += \
./src/MQsim/MQsim/model/utils/CMRRandomGenerator.o \
./src/MQsim/MQsim/model/utils/Helper_Functions.o \
./src/MQsim/MQsim/model/utils/Logical_Address_Partitioning_Unit.o \
./src/MQsim/MQsim/model/utils/RandomGenerator.o \
./src/MQsim/MQsim/model/utils/StringTools.o \
./src/MQsim/MQsim/model/utils/XMLWriter.o 

CPP_DEPS += \
./src/MQsim/MQsim/model/utils/CMRRandomGenerator.d \
./src/MQsim/MQsim/model/utils/Helper_Functions.d \
./src/MQsim/MQsim/model/utils/Logical_Address_Partitioning_Unit.d \
./src/MQsim/MQsim/model/utils/RandomGenerator.d \
./src/MQsim/MQsim/model/utils/StringTools.d \
./src/MQsim/MQsim/model/utils/XMLWriter.d 


# Each subdirectory must supply rules for building sources it contributes
src/MQsim/MQsim/model/utils/%.o: ../src/MQsim/MQsim/model/utils/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


