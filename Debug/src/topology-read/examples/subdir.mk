################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/topology-read/examples/topology-example-sim.cc 

CC_DEPS += \
./src/topology-read/examples/topology-example-sim.d 

OBJS += \
./src/topology-read/examples/topology-example-sim.o 


# Each subdirectory must supply rules for building sources it contributes
src/topology-read/examples/%.o: ../src/topology-read/examples/%.cc src/topology-read/examples/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-topology-2d-read-2f-examples

clean-src-2f-topology-2d-read-2f-examples:
	-$(RM) ./src/topology-read/examples/topology-example-sim.d ./src/topology-read/examples/topology-example-sim.o

.PHONY: clean-src-2f-topology-2d-read-2f-examples

