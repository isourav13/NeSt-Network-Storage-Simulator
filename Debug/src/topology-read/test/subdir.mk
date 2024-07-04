################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/topology-read/test/rocketfuel-topology-reader-test-suite.cc 

CC_DEPS += \
./src/topology-read/test/rocketfuel-topology-reader-test-suite.d 

OBJS += \
./src/topology-read/test/rocketfuel-topology-reader-test-suite.o 


# Each subdirectory must supply rules for building sources it contributes
src/topology-read/test/%.o: ../src/topology-read/test/%.cc src/topology-read/test/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-topology-2d-read-2f-test

clean-src-2f-topology-2d-read-2f-test:
	-$(RM) ./src/topology-read/test/rocketfuel-topology-reader-test-suite.d ./src/topology-read/test/rocketfuel-topology-reader-test-suite.o

.PHONY: clean-src-2f-topology-2d-read-2f-test

