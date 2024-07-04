################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../examples/channel-models/three-gpp-v2v-channel-example.cc 

CC_DEPS += \
./examples/channel-models/three-gpp-v2v-channel-example.d 

OBJS += \
./examples/channel-models/three-gpp-v2v-channel-example.o 


# Each subdirectory must supply rules for building sources it contributes
examples/channel-models/%.o: ../examples/channel-models/%.cc examples/channel-models/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-examples-2f-channel-2d-models

clean-examples-2f-channel-2d-models:
	-$(RM) ./examples/channel-models/three-gpp-v2v-channel-example.d ./examples/channel-models/three-gpp-v2v-channel-example.o

.PHONY: clean-examples-2f-channel-2d-models

