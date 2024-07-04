################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/uan/test/uan-energy-model-test.cc \
../src/uan/test/uan-test.cc 

CC_DEPS += \
./src/uan/test/uan-energy-model-test.d \
./src/uan/test/uan-test.d 

OBJS += \
./src/uan/test/uan-energy-model-test.o \
./src/uan/test/uan-test.o 


# Each subdirectory must supply rules for building sources it contributes
src/uan/test/%.o: ../src/uan/test/%.cc src/uan/test/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-uan-2f-test

clean-src-2f-uan-2f-test:
	-$(RM) ./src/uan/test/uan-energy-model-test.d ./src/uan/test/uan-energy-model-test.o ./src/uan/test/uan-test.d ./src/uan/test/uan-test.o

.PHONY: clean-src-2f-uan-2f-test

