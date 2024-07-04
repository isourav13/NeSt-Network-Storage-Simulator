################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/mesh/helper/dot11s/dot11s-installer.cc 

CC_DEPS += \
./src/mesh/helper/dot11s/dot11s-installer.d 

OBJS += \
./src/mesh/helper/dot11s/dot11s-installer.o 


# Each subdirectory must supply rules for building sources it contributes
src/mesh/helper/dot11s/%.o: ../src/mesh/helper/dot11s/%.cc src/mesh/helper/dot11s/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-mesh-2f-helper-2f-dot11s

clean-src-2f-mesh-2f-helper-2f-dot11s:
	-$(RM) ./src/mesh/helper/dot11s/dot11s-installer.d ./src/mesh/helper/dot11s/dot11s-installer.o

.PHONY: clean-src-2f-mesh-2f-helper-2f-dot11s

