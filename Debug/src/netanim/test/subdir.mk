################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/netanim/test/netanim-test.cc 

CC_DEPS += \
./src/netanim/test/netanim-test.d 

OBJS += \
./src/netanim/test/netanim-test.o 


# Each subdirectory must supply rules for building sources it contributes
src/netanim/test/%.o: ../src/netanim/test/%.cc src/netanim/test/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-netanim-2f-test

clean-src-2f-netanim-2f-test:
	-$(RM) ./src/netanim/test/netanim-test.d ./src/netanim/test/netanim-test.o

.PHONY: clean-src-2f-netanim-2f-test

