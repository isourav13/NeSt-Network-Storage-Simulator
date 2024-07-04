################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/applications/test/bulk-send-application-test-suite.cc \
../src/applications/test/three-gpp-http-client-server-test.cc \
../src/applications/test/udp-client-server-test.cc 

CC_DEPS += \
./src/applications/test/bulk-send-application-test-suite.d \
./src/applications/test/three-gpp-http-client-server-test.d \
./src/applications/test/udp-client-server-test.d 

OBJS += \
./src/applications/test/bulk-send-application-test-suite.o \
./src/applications/test/three-gpp-http-client-server-test.o \
./src/applications/test/udp-client-server-test.o 


# Each subdirectory must supply rules for building sources it contributes
src/applications/test/%.o: ../src/applications/test/%.cc src/applications/test/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-applications-2f-test

clean-src-2f-applications-2f-test:
	-$(RM) ./src/applications/test/bulk-send-application-test-suite.d ./src/applications/test/bulk-send-application-test-suite.o ./src/applications/test/three-gpp-http-client-server-test.d ./src/applications/test/three-gpp-http-client-server-test.o ./src/applications/test/udp-client-server-test.d ./src/applications/test/udp-client-server-test.o

.PHONY: clean-src-2f-applications-2f-test

