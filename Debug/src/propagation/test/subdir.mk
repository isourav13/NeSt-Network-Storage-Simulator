################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/propagation/test/channel-condition-model-test-suite.cc \
../src/propagation/test/itu-r-1411-los-test-suite.cc \
../src/propagation/test/itu-r-1411-nlos-over-rooftop-test-suite.cc \
../src/propagation/test/kun-2600-mhz-test-suite.cc \
../src/propagation/test/okumura-hata-test-suite.cc \
../src/propagation/test/probabilistic-v2v-channel-condition-model-test.cc \
../src/propagation/test/propagation-loss-model-test-suite.cc \
../src/propagation/test/three-gpp-propagation-loss-model-test-suite.cc 

CC_DEPS += \
./src/propagation/test/channel-condition-model-test-suite.d \
./src/propagation/test/itu-r-1411-los-test-suite.d \
./src/propagation/test/itu-r-1411-nlos-over-rooftop-test-suite.d \
./src/propagation/test/kun-2600-mhz-test-suite.d \
./src/propagation/test/okumura-hata-test-suite.d \
./src/propagation/test/probabilistic-v2v-channel-condition-model-test.d \
./src/propagation/test/propagation-loss-model-test-suite.d \
./src/propagation/test/three-gpp-propagation-loss-model-test-suite.d 

OBJS += \
./src/propagation/test/channel-condition-model-test-suite.o \
./src/propagation/test/itu-r-1411-los-test-suite.o \
./src/propagation/test/itu-r-1411-nlos-over-rooftop-test-suite.o \
./src/propagation/test/kun-2600-mhz-test-suite.o \
./src/propagation/test/okumura-hata-test-suite.o \
./src/propagation/test/probabilistic-v2v-channel-condition-model-test.o \
./src/propagation/test/propagation-loss-model-test-suite.o \
./src/propagation/test/three-gpp-propagation-loss-model-test-suite.o 


# Each subdirectory must supply rules for building sources it contributes
src/propagation/test/%.o: ../src/propagation/test/%.cc src/propagation/test/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-propagation-2f-test

clean-src-2f-propagation-2f-test:
	-$(RM) ./src/propagation/test/channel-condition-model-test-suite.d ./src/propagation/test/channel-condition-model-test-suite.o ./src/propagation/test/itu-r-1411-los-test-suite.d ./src/propagation/test/itu-r-1411-los-test-suite.o ./src/propagation/test/itu-r-1411-nlos-over-rooftop-test-suite.d ./src/propagation/test/itu-r-1411-nlos-over-rooftop-test-suite.o ./src/propagation/test/kun-2600-mhz-test-suite.d ./src/propagation/test/kun-2600-mhz-test-suite.o ./src/propagation/test/okumura-hata-test-suite.d ./src/propagation/test/okumura-hata-test-suite.o ./src/propagation/test/probabilistic-v2v-channel-condition-model-test.d ./src/propagation/test/probabilistic-v2v-channel-condition-model-test.o ./src/propagation/test/propagation-loss-model-test-suite.d ./src/propagation/test/propagation-loss-model-test-suite.o ./src/propagation/test/three-gpp-propagation-loss-model-test-suite.d ./src/propagation/test/three-gpp-propagation-loss-model-test-suite.o

.PHONY: clean-src-2f-propagation-2f-test

