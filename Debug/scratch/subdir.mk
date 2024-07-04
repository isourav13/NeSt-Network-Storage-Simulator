################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../scratch/scratch-simulator.cc 

CC_DEPS += \
./scratch/scratch-simulator.d 

OBJS += \
./scratch/scratch-simulator.o 


# Each subdirectory must supply rules for building sources it contributes
scratch/%.o: ../scratch/%.cc scratch/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-scratch

clean-scratch:
	-$(RM) ./scratch/scratch-simulator.d ./scratch/scratch-simulator.o

.PHONY: clean-scratch

