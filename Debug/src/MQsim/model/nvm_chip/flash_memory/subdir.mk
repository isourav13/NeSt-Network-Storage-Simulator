################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/MQsim/model/nvm_chip/flash_memory/Block.cpp \
../src/MQsim/model/nvm_chip/flash_memory/Die.cpp \
../src/MQsim/model/nvm_chip/flash_memory/Flash_Chip.cpp \
../src/MQsim/model/nvm_chip/flash_memory/Physical_Page_Address.cpp \
../src/MQsim/model/nvm_chip/flash_memory/Plane.cpp 

CPP_DEPS += \
./src/MQsim/model/nvm_chip/flash_memory/Block.d \
./src/MQsim/model/nvm_chip/flash_memory/Die.d \
./src/MQsim/model/nvm_chip/flash_memory/Flash_Chip.d \
./src/MQsim/model/nvm_chip/flash_memory/Physical_Page_Address.d \
./src/MQsim/model/nvm_chip/flash_memory/Plane.d 

OBJS += \
./src/MQsim/model/nvm_chip/flash_memory/Block.o \
./src/MQsim/model/nvm_chip/flash_memory/Die.o \
./src/MQsim/model/nvm_chip/flash_memory/Flash_Chip.o \
./src/MQsim/model/nvm_chip/flash_memory/Physical_Page_Address.o \
./src/MQsim/model/nvm_chip/flash_memory/Plane.o 


# Each subdirectory must supply rules for building sources it contributes
src/MQsim/model/nvm_chip/flash_memory/%.o: ../src/MQsim/model/nvm_chip/flash_memory/%.cpp src/MQsim/model/nvm_chip/flash_memory/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-MQsim-2f-model-2f-nvm_chip-2f-flash_memory

clean-src-2f-MQsim-2f-model-2f-nvm_chip-2f-flash_memory:
	-$(RM) ./src/MQsim/model/nvm_chip/flash_memory/Block.d ./src/MQsim/model/nvm_chip/flash_memory/Block.o ./src/MQsim/model/nvm_chip/flash_memory/Die.d ./src/MQsim/model/nvm_chip/flash_memory/Die.o ./src/MQsim/model/nvm_chip/flash_memory/Flash_Chip.d ./src/MQsim/model/nvm_chip/flash_memory/Flash_Chip.o ./src/MQsim/model/nvm_chip/flash_memory/Physical_Page_Address.d ./src/MQsim/model/nvm_chip/flash_memory/Physical_Page_Address.o ./src/MQsim/model/nvm_chip/flash_memory/Plane.d ./src/MQsim/model/nvm_chip/flash_memory/Plane.o

.PHONY: clean-src-2f-MQsim-2f-model-2f-nvm_chip-2f-flash_memory

