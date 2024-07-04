################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/MQsim/MQsim/model/nvm_chip/flash_memory/Block.cpp \
../src/MQsim/MQsim/model/nvm_chip/flash_memory/Die.cpp \
../src/MQsim/MQsim/model/nvm_chip/flash_memory/Flash_Chip.cpp \
../src/MQsim/MQsim/model/nvm_chip/flash_memory/Physical_Page_Address.cpp \
../src/MQsim/MQsim/model/nvm_chip/flash_memory/Plane.cpp 

OBJS += \
./src/MQsim/MQsim/model/nvm_chip/flash_memory/Block.o \
./src/MQsim/MQsim/model/nvm_chip/flash_memory/Die.o \
./src/MQsim/MQsim/model/nvm_chip/flash_memory/Flash_Chip.o \
./src/MQsim/MQsim/model/nvm_chip/flash_memory/Physical_Page_Address.o \
./src/MQsim/MQsim/model/nvm_chip/flash_memory/Plane.o 

CPP_DEPS += \
./src/MQsim/MQsim/model/nvm_chip/flash_memory/Block.d \
./src/MQsim/MQsim/model/nvm_chip/flash_memory/Die.d \
./src/MQsim/MQsim/model/nvm_chip/flash_memory/Flash_Chip.d \
./src/MQsim/MQsim/model/nvm_chip/flash_memory/Physical_Page_Address.d \
./src/MQsim/MQsim/model/nvm_chip/flash_memory/Plane.d 


# Each subdirectory must supply rules for building sources it contributes
src/MQsim/MQsim/model/nvm_chip/flash_memory/%.o: ../src/MQsim/MQsim/model/nvm_chip/flash_memory/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


