################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/mesh/examples/mesh.cc 

CC_DEPS += \
./src/mesh/examples/mesh.d 

OBJS += \
./src/mesh/examples/mesh.o 


# Each subdirectory must supply rules for building sources it contributes
src/mesh/examples/%.o: ../src/mesh/examples/%.cc src/mesh/examples/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-mesh-2f-examples

clean-src-2f-mesh-2f-examples:
	-$(RM) ./src/mesh/examples/mesh.d ./src/mesh/examples/mesh.o

.PHONY: clean-src-2f-mesh-2f-examples

