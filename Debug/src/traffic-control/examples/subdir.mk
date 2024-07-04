################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/traffic-control/examples/adaptive-red-tests.cc \
../src/traffic-control/examples/codel-vs-pfifo-asymmetric.cc \
../src/traffic-control/examples/codel-vs-pfifo-basic-test.cc \
../src/traffic-control/examples/fqcodel-l4s-example.cc \
../src/traffic-control/examples/pfifo-vs-red.cc \
../src/traffic-control/examples/pie-example.cc \
../src/traffic-control/examples/red-tests.cc \
../src/traffic-control/examples/red-vs-ared.cc 

CC_DEPS += \
./src/traffic-control/examples/adaptive-red-tests.d \
./src/traffic-control/examples/codel-vs-pfifo-asymmetric.d \
./src/traffic-control/examples/codel-vs-pfifo-basic-test.d \
./src/traffic-control/examples/fqcodel-l4s-example.d \
./src/traffic-control/examples/pfifo-vs-red.d \
./src/traffic-control/examples/pie-example.d \
./src/traffic-control/examples/red-tests.d \
./src/traffic-control/examples/red-vs-ared.d 

OBJS += \
./src/traffic-control/examples/adaptive-red-tests.o \
./src/traffic-control/examples/codel-vs-pfifo-asymmetric.o \
./src/traffic-control/examples/codel-vs-pfifo-basic-test.o \
./src/traffic-control/examples/fqcodel-l4s-example.o \
./src/traffic-control/examples/pfifo-vs-red.o \
./src/traffic-control/examples/pie-example.o \
./src/traffic-control/examples/red-tests.o \
./src/traffic-control/examples/red-vs-ared.o 


# Each subdirectory must supply rules for building sources it contributes
src/traffic-control/examples/%.o: ../src/traffic-control/examples/%.cc src/traffic-control/examples/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-traffic-2d-control-2f-examples

clean-src-2f-traffic-2d-control-2f-examples:
	-$(RM) ./src/traffic-control/examples/adaptive-red-tests.d ./src/traffic-control/examples/adaptive-red-tests.o ./src/traffic-control/examples/codel-vs-pfifo-asymmetric.d ./src/traffic-control/examples/codel-vs-pfifo-asymmetric.o ./src/traffic-control/examples/codel-vs-pfifo-basic-test.d ./src/traffic-control/examples/codel-vs-pfifo-basic-test.o ./src/traffic-control/examples/fqcodel-l4s-example.d ./src/traffic-control/examples/fqcodel-l4s-example.o ./src/traffic-control/examples/pfifo-vs-red.d ./src/traffic-control/examples/pfifo-vs-red.o ./src/traffic-control/examples/pie-example.d ./src/traffic-control/examples/pie-example.o ./src/traffic-control/examples/red-tests.d ./src/traffic-control/examples/red-tests.o ./src/traffic-control/examples/red-vs-ared.d ./src/traffic-control/examples/red-vs-ared.o

.PHONY: clean-src-2f-traffic-2d-control-2f-examples

