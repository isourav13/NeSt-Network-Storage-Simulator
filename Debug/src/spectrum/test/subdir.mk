################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/spectrum/test/spectrum-ideal-phy-test.cc \
../src/spectrum/test/spectrum-interference-test.cc \
../src/spectrum/test/spectrum-value-test.cc \
../src/spectrum/test/spectrum-waveform-generator-test.cc \
../src/spectrum/test/three-gpp-channel-test-suite.cc \
../src/spectrum/test/tv-helper-distribution-test.cc \
../src/spectrum/test/tv-spectrum-transmitter-test.cc 

CC_DEPS += \
./src/spectrum/test/spectrum-ideal-phy-test.d \
./src/spectrum/test/spectrum-interference-test.d \
./src/spectrum/test/spectrum-value-test.d \
./src/spectrum/test/spectrum-waveform-generator-test.d \
./src/spectrum/test/three-gpp-channel-test-suite.d \
./src/spectrum/test/tv-helper-distribution-test.d \
./src/spectrum/test/tv-spectrum-transmitter-test.d 

OBJS += \
./src/spectrum/test/spectrum-ideal-phy-test.o \
./src/spectrum/test/spectrum-interference-test.o \
./src/spectrum/test/spectrum-value-test.o \
./src/spectrum/test/spectrum-waveform-generator-test.o \
./src/spectrum/test/three-gpp-channel-test-suite.o \
./src/spectrum/test/tv-helper-distribution-test.o \
./src/spectrum/test/tv-spectrum-transmitter-test.o 


# Each subdirectory must supply rules for building sources it contributes
src/spectrum/test/%.o: ../src/spectrum/test/%.cc src/spectrum/test/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-spectrum-2f-test

clean-src-2f-spectrum-2f-test:
	-$(RM) ./src/spectrum/test/spectrum-ideal-phy-test.d ./src/spectrum/test/spectrum-ideal-phy-test.o ./src/spectrum/test/spectrum-interference-test.d ./src/spectrum/test/spectrum-interference-test.o ./src/spectrum/test/spectrum-value-test.d ./src/spectrum/test/spectrum-value-test.o ./src/spectrum/test/spectrum-waveform-generator-test.d ./src/spectrum/test/spectrum-waveform-generator-test.o ./src/spectrum/test/three-gpp-channel-test-suite.d ./src/spectrum/test/three-gpp-channel-test-suite.o ./src/spectrum/test/tv-helper-distribution-test.d ./src/spectrum/test/tv-helper-distribution-test.o ./src/spectrum/test/tv-spectrum-transmitter-test.d ./src/spectrum/test/tv-spectrum-transmitter-test.o

.PHONY: clean-src-2f-spectrum-2f-test

