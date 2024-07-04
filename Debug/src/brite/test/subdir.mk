################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/brite/test/brite-test-topology.cc 

CC_DEPS += \
./src/brite/test/brite-test-topology.d 

OBJS += \
./src/brite/test/brite-test-topology.o 


# Each subdirectory must supply rules for building sources it contributes
src/brite/test/%.o: ../src/brite/test/%.cc src/brite/test/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-brite-2f-test

clean-src-2f-brite-2f-test:
	-$(RM) ./src/brite/test/brite-test-topology.d ./src/brite/test/brite-test-topology.o

.PHONY: clean-src-2f-brite-2f-test

