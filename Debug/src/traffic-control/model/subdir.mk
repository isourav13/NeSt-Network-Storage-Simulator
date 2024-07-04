################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/traffic-control/model/cobalt-queue-disc.cc \
../src/traffic-control/model/codel-queue-disc.cc \
../src/traffic-control/model/fifo-queue-disc.cc \
../src/traffic-control/model/fq-codel-queue-disc.cc \
../src/traffic-control/model/mq-queue-disc.cc \
../src/traffic-control/model/packet-filter.cc \
../src/traffic-control/model/pfifo-fast-queue-disc.cc \
../src/traffic-control/model/pie-queue-disc.cc \
../src/traffic-control/model/prio-queue-disc.cc \
../src/traffic-control/model/qtcp-red-queue.cc \
../src/traffic-control/model/queue-disc.cc \
../src/traffic-control/model/red-queue-disc.cc \
../src/traffic-control/model/tbf-queue-disc.cc \
../src/traffic-control/model/traffic-control-layer.cc 

CC_DEPS += \
./src/traffic-control/model/cobalt-queue-disc.d \
./src/traffic-control/model/codel-queue-disc.d \
./src/traffic-control/model/fifo-queue-disc.d \
./src/traffic-control/model/fq-codel-queue-disc.d \
./src/traffic-control/model/mq-queue-disc.d \
./src/traffic-control/model/packet-filter.d \
./src/traffic-control/model/pfifo-fast-queue-disc.d \
./src/traffic-control/model/pie-queue-disc.d \
./src/traffic-control/model/prio-queue-disc.d \
./src/traffic-control/model/qtcp-red-queue.d \
./src/traffic-control/model/queue-disc.d \
./src/traffic-control/model/red-queue-disc.d \
./src/traffic-control/model/tbf-queue-disc.d \
./src/traffic-control/model/traffic-control-layer.d 

OBJS += \
./src/traffic-control/model/cobalt-queue-disc.o \
./src/traffic-control/model/codel-queue-disc.o \
./src/traffic-control/model/fifo-queue-disc.o \
./src/traffic-control/model/fq-codel-queue-disc.o \
./src/traffic-control/model/mq-queue-disc.o \
./src/traffic-control/model/packet-filter.o \
./src/traffic-control/model/pfifo-fast-queue-disc.o \
./src/traffic-control/model/pie-queue-disc.o \
./src/traffic-control/model/prio-queue-disc.o \
./src/traffic-control/model/qtcp-red-queue.o \
./src/traffic-control/model/queue-disc.o \
./src/traffic-control/model/red-queue-disc.o \
./src/traffic-control/model/tbf-queue-disc.o \
./src/traffic-control/model/traffic-control-layer.o 


# Each subdirectory must supply rules for building sources it contributes
src/traffic-control/model/%.o: ../src/traffic-control/model/%.cc src/traffic-control/model/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-traffic-2d-control-2f-model

clean-src-2f-traffic-2d-control-2f-model:
	-$(RM) ./src/traffic-control/model/cobalt-queue-disc.d ./src/traffic-control/model/cobalt-queue-disc.o ./src/traffic-control/model/codel-queue-disc.d ./src/traffic-control/model/codel-queue-disc.o ./src/traffic-control/model/fifo-queue-disc.d ./src/traffic-control/model/fifo-queue-disc.o ./src/traffic-control/model/fq-codel-queue-disc.d ./src/traffic-control/model/fq-codel-queue-disc.o ./src/traffic-control/model/mq-queue-disc.d ./src/traffic-control/model/mq-queue-disc.o ./src/traffic-control/model/packet-filter.d ./src/traffic-control/model/packet-filter.o ./src/traffic-control/model/pfifo-fast-queue-disc.d ./src/traffic-control/model/pfifo-fast-queue-disc.o ./src/traffic-control/model/pie-queue-disc.d ./src/traffic-control/model/pie-queue-disc.o ./src/traffic-control/model/prio-queue-disc.d ./src/traffic-control/model/prio-queue-disc.o ./src/traffic-control/model/qtcp-red-queue.d ./src/traffic-control/model/qtcp-red-queue.o ./src/traffic-control/model/queue-disc.d ./src/traffic-control/model/queue-disc.o ./src/traffic-control/model/red-queue-disc.d ./src/traffic-control/model/red-queue-disc.o ./src/traffic-control/model/tbf-queue-disc.d ./src/traffic-control/model/tbf-queue-disc.o ./src/traffic-control/model/traffic-control-layer.d ./src/traffic-control/model/traffic-control-layer.o

.PHONY: clean-src-2f-traffic-2d-control-2f-model

