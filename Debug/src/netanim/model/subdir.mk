################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/netanim/model/animation-interface.cc 

CC_DEPS += \
./src/netanim/model/animation-interface.d 

OBJS += \
./src/netanim/model/animation-interface.o 


# Each subdirectory must supply rules for building sources it contributes
src/netanim/model/%.o: ../src/netanim/model/%.cc src/netanim/model/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-netanim-2f-model

clean-src-2f-netanim-2f-model:
	-$(RM) ./src/netanim/model/animation-interface.d ./src/netanim/model/animation-interface.o

.PHONY: clean-src-2f-netanim-2f-model

