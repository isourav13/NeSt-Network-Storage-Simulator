################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/mesh/helper/mesh-helper.cc \
../src/mesh/helper/mesh-stack-installer.cc 

CC_DEPS += \
./src/mesh/helper/mesh-helper.d \
./src/mesh/helper/mesh-stack-installer.d 

OBJS += \
./src/mesh/helper/mesh-helper.o \
./src/mesh/helper/mesh-stack-installer.o 


# Each subdirectory must supply rules for building sources it contributes
src/mesh/helper/%.o: ../src/mesh/helper/%.cc src/mesh/helper/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-mesh-2f-helper

clean-src-2f-mesh-2f-helper:
	-$(RM) ./src/mesh/helper/mesh-helper.d ./src/mesh/helper/mesh-helper.o ./src/mesh/helper/mesh-stack-installer.d ./src/mesh/helper/mesh-stack-installer.o

.PHONY: clean-src-2f-mesh-2f-helper

