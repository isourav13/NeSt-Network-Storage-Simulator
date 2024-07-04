################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/brite/examples/brite-MPI-example.cc \
../src/brite/examples/brite-generic-example.cc 

CC_DEPS += \
./src/brite/examples/brite-MPI-example.d \
./src/brite/examples/brite-generic-example.d 

OBJS += \
./src/brite/examples/brite-MPI-example.o \
./src/brite/examples/brite-generic-example.o 


# Each subdirectory must supply rules for building sources it contributes
src/brite/examples/%.o: ../src/brite/examples/%.cc src/brite/examples/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-brite-2f-examples

clean-src-2f-brite-2f-examples:
	-$(RM) ./src/brite/examples/brite-MPI-example.d ./src/brite/examples/brite-MPI-example.o ./src/brite/examples/brite-generic-example.d ./src/brite/examples/brite-generic-example.o

.PHONY: clean-src-2f-brite-2f-examples

