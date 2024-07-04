################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/network/examples/lollipop-comparisions.cc \
../src/network/examples/main-packet-header.cc \
../src/network/examples/main-packet-tag.cc \
../src/network/examples/packet-socket-apps.cc 

CC_DEPS += \
./src/network/examples/lollipop-comparisions.d \
./src/network/examples/main-packet-header.d \
./src/network/examples/main-packet-tag.d \
./src/network/examples/packet-socket-apps.d 

OBJS += \
./src/network/examples/lollipop-comparisions.o \
./src/network/examples/main-packet-header.o \
./src/network/examples/main-packet-tag.o \
./src/network/examples/packet-socket-apps.o 


# Each subdirectory must supply rules for building sources it contributes
src/network/examples/%.o: ../src/network/examples/%.cc src/network/examples/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-network-2f-examples

clean-src-2f-network-2f-examples:
	-$(RM) ./src/network/examples/lollipop-comparisions.d ./src/network/examples/lollipop-comparisions.o ./src/network/examples/main-packet-header.d ./src/network/examples/main-packet-header.o ./src/network/examples/main-packet-tag.d ./src/network/examples/main-packet-tag.o ./src/network/examples/packet-socket-apps.d ./src/network/examples/packet-socket-apps.o

.PHONY: clean-src-2f-network-2f-examples

