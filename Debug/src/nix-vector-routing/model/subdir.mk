################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/nix-vector-routing/model/ipv4-nix-vector-routing.cc 

CC_DEPS += \
./src/nix-vector-routing/model/ipv4-nix-vector-routing.d 

OBJS += \
./src/nix-vector-routing/model/ipv4-nix-vector-routing.o 


# Each subdirectory must supply rules for building sources it contributes
src/nix-vector-routing/model/%.o: ../src/nix-vector-routing/model/%.cc src/nix-vector-routing/model/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-nix-2d-vector-2d-routing-2f-model

clean-src-2f-nix-2d-vector-2d-routing-2f-model:
	-$(RM) ./src/nix-vector-routing/model/ipv4-nix-vector-routing.d ./src/nix-vector-routing/model/ipv4-nix-vector-routing.o

.PHONY: clean-src-2f-nix-2d-vector-2d-routing-2f-model

