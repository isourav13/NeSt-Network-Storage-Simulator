################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/aodv/model/aodv-dpd.cc \
../src/aodv/model/aodv-id-cache.cc \
../src/aodv/model/aodv-neighbor.cc \
../src/aodv/model/aodv-packet.cc \
../src/aodv/model/aodv-routing-protocol.cc \
../src/aodv/model/aodv-rqueue.cc \
../src/aodv/model/aodv-rtable.cc 

CC_DEPS += \
./src/aodv/model/aodv-dpd.d \
./src/aodv/model/aodv-id-cache.d \
./src/aodv/model/aodv-neighbor.d \
./src/aodv/model/aodv-packet.d \
./src/aodv/model/aodv-routing-protocol.d \
./src/aodv/model/aodv-rqueue.d \
./src/aodv/model/aodv-rtable.d 

OBJS += \
./src/aodv/model/aodv-dpd.o \
./src/aodv/model/aodv-id-cache.o \
./src/aodv/model/aodv-neighbor.o \
./src/aodv/model/aodv-packet.o \
./src/aodv/model/aodv-routing-protocol.o \
./src/aodv/model/aodv-rqueue.o \
./src/aodv/model/aodv-rtable.o 


# Each subdirectory must supply rules for building sources it contributes
src/aodv/model/%.o: ../src/aodv/model/%.cc src/aodv/model/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-aodv-2f-model

clean-src-2f-aodv-2f-model:
	-$(RM) ./src/aodv/model/aodv-dpd.d ./src/aodv/model/aodv-dpd.o ./src/aodv/model/aodv-id-cache.d ./src/aodv/model/aodv-id-cache.o ./src/aodv/model/aodv-neighbor.d ./src/aodv/model/aodv-neighbor.o ./src/aodv/model/aodv-packet.d ./src/aodv/model/aodv-packet.o ./src/aodv/model/aodv-routing-protocol.d ./src/aodv/model/aodv-routing-protocol.o ./src/aodv/model/aodv-rqueue.d ./src/aodv/model/aodv-rqueue.o ./src/aodv/model/aodv-rtable.d ./src/aodv/model/aodv-rtable.o

.PHONY: clean-src-2f-aodv-2f-model

