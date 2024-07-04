################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/click/model/ipv4-click-routing.cc \
../src/click/model/ipv4-l3-click-protocol.cc 

CC_DEPS += \
./src/click/model/ipv4-click-routing.d \
./src/click/model/ipv4-l3-click-protocol.d 

OBJS += \
./src/click/model/ipv4-click-routing.o \
./src/click/model/ipv4-l3-click-protocol.o 


# Each subdirectory must supply rules for building sources it contributes
src/click/model/%.o: ../src/click/model/%.cc src/click/model/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-click-2f-model

clean-src-2f-click-2f-model:
	-$(RM) ./src/click/model/ipv4-click-routing.d ./src/click/model/ipv4-click-routing.o ./src/click/model/ipv4-l3-click-protocol.d ./src/click/model/ipv4-l3-click-protocol.o

.PHONY: clean-src-2f-click-2f-model

