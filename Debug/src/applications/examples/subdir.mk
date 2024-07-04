################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/applications/examples/three-gpp-http-example.cc 

CC_DEPS += \
./src/applications/examples/three-gpp-http-example.d 

OBJS += \
./src/applications/examples/three-gpp-http-example.o 


# Each subdirectory must supply rules for building sources it contributes
src/applications/examples/%.o: ../src/applications/examples/%.cc src/applications/examples/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-applications-2f-examples

clean-src-2f-applications-2f-examples:
	-$(RM) ./src/applications/examples/three-gpp-http-example.d ./src/applications/examples/three-gpp-http-example.o

.PHONY: clean-src-2f-applications-2f-examples

