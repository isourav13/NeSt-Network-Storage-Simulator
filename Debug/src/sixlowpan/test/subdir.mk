################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/sixlowpan/test/sixlowpan-examples-test-suite.cc \
../src/sixlowpan/test/sixlowpan-fragmentation-test.cc \
../src/sixlowpan/test/sixlowpan-hc1-test.cc \
../src/sixlowpan/test/sixlowpan-iphc-test.cc 

CC_DEPS += \
./src/sixlowpan/test/sixlowpan-examples-test-suite.d \
./src/sixlowpan/test/sixlowpan-fragmentation-test.d \
./src/sixlowpan/test/sixlowpan-hc1-test.d \
./src/sixlowpan/test/sixlowpan-iphc-test.d 

OBJS += \
./src/sixlowpan/test/sixlowpan-examples-test-suite.o \
./src/sixlowpan/test/sixlowpan-fragmentation-test.o \
./src/sixlowpan/test/sixlowpan-hc1-test.o \
./src/sixlowpan/test/sixlowpan-iphc-test.o 


# Each subdirectory must supply rules for building sources it contributes
src/sixlowpan/test/%.o: ../src/sixlowpan/test/%.cc src/sixlowpan/test/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-sixlowpan-2f-test

clean-src-2f-sixlowpan-2f-test:
	-$(RM) ./src/sixlowpan/test/sixlowpan-examples-test-suite.d ./src/sixlowpan/test/sixlowpan-examples-test-suite.o ./src/sixlowpan/test/sixlowpan-fragmentation-test.d ./src/sixlowpan/test/sixlowpan-fragmentation-test.o ./src/sixlowpan/test/sixlowpan-hc1-test.d ./src/sixlowpan/test/sixlowpan-hc1-test.o ./src/sixlowpan/test/sixlowpan-iphc-test.d ./src/sixlowpan/test/sixlowpan-iphc-test.o

.PHONY: clean-src-2f-sixlowpan-2f-test

