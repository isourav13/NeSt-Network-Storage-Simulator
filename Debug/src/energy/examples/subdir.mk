################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/energy/examples/basic-energy-model-test.cc \
../src/energy/examples/li-ion-energy-source.cc \
../src/energy/examples/rv-battery-model-test.cc 

CC_DEPS += \
./src/energy/examples/basic-energy-model-test.d \
./src/energy/examples/li-ion-energy-source.d \
./src/energy/examples/rv-battery-model-test.d 

OBJS += \
./src/energy/examples/basic-energy-model-test.o \
./src/energy/examples/li-ion-energy-source.o \
./src/energy/examples/rv-battery-model-test.o 


# Each subdirectory must supply rules for building sources it contributes
src/energy/examples/%.o: ../src/energy/examples/%.cc src/energy/examples/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-energy-2f-examples

clean-src-2f-energy-2f-examples:
	-$(RM) ./src/energy/examples/basic-energy-model-test.d ./src/energy/examples/basic-energy-model-test.o ./src/energy/examples/li-ion-energy-source.d ./src/energy/examples/li-ion-energy-source.o ./src/energy/examples/rv-battery-model-test.d ./src/energy/examples/rv-battery-model-test.o

.PHONY: clean-src-2f-energy-2f-examples

