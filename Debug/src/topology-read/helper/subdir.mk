################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/topology-read/helper/topology-reader-helper.cc 

CC_DEPS += \
./src/topology-read/helper/topology-reader-helper.d 

OBJS += \
./src/topology-read/helper/topology-reader-helper.o 


# Each subdirectory must supply rules for building sources it contributes
src/topology-read/helper/%.o: ../src/topology-read/helper/%.cc src/topology-read/helper/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-topology-2d-read-2f-helper

clean-src-2f-topology-2d-read-2f-helper:
	-$(RM) ./src/topology-read/helper/topology-reader-helper.d ./src/topology-read/helper/topology-reader-helper.o

.PHONY: clean-src-2f-topology-2d-read-2f-helper

