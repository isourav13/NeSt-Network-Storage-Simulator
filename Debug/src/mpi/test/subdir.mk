################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/mpi/test/mpi-test-suite.cc 

CC_DEPS += \
./src/mpi/test/mpi-test-suite.d 

OBJS += \
./src/mpi/test/mpi-test-suite.o 


# Each subdirectory must supply rules for building sources it contributes
src/mpi/test/%.o: ../src/mpi/test/%.cc src/mpi/test/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-mpi-2f-test

clean-src-2f-mpi-2f-test:
	-$(RM) ./src/mpi/test/mpi-test-suite.d ./src/mpi/test/mpi-test-suite.o

.PHONY: clean-src-2f-mpi-2f-test

