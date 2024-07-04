################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/csma-layout/model/csma-star-helper.cc 

CC_DEPS += \
./src/csma-layout/model/csma-star-helper.d 

OBJS += \
./src/csma-layout/model/csma-star-helper.o 


# Each subdirectory must supply rules for building sources it contributes
src/csma-layout/model/%.o: ../src/csma-layout/model/%.cc src/csma-layout/model/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-csma-2d-layout-2f-model

clean-src-2f-csma-2d-layout-2f-model:
	-$(RM) ./src/csma-layout/model/csma-star-helper.d ./src/csma-layout/model/csma-star-helper.o

.PHONY: clean-src-2f-csma-2d-layout-2f-model

