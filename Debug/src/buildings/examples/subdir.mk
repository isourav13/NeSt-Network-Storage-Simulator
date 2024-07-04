################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/buildings/examples/buildings-pathloss-profiler.cc \
../src/buildings/examples/outdoor-random-walk-example.cc 

CC_DEPS += \
./src/buildings/examples/buildings-pathloss-profiler.d \
./src/buildings/examples/outdoor-random-walk-example.d 

OBJS += \
./src/buildings/examples/buildings-pathloss-profiler.o \
./src/buildings/examples/outdoor-random-walk-example.o 


# Each subdirectory must supply rules for building sources it contributes
src/buildings/examples/%.o: ../src/buildings/examples/%.cc src/buildings/examples/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-buildings-2f-examples

clean-src-2f-buildings-2f-examples:
	-$(RM) ./src/buildings/examples/buildings-pathloss-profiler.d ./src/buildings/examples/buildings-pathloss-profiler.o ./src/buildings/examples/outdoor-random-walk-example.d ./src/buildings/examples/outdoor-random-walk-example.o

.PHONY: clean-src-2f-buildings-2f-examples

