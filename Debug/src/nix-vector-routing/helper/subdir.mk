################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/nix-vector-routing/helper/ipv4-nix-vector-helper.cc 

CC_DEPS += \
./src/nix-vector-routing/helper/ipv4-nix-vector-helper.d 

OBJS += \
./src/nix-vector-routing/helper/ipv4-nix-vector-helper.o 


# Each subdirectory must supply rules for building sources it contributes
src/nix-vector-routing/helper/%.o: ../src/nix-vector-routing/helper/%.cc src/nix-vector-routing/helper/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-nix-2d-vector-2d-routing-2f-helper

clean-src-2f-nix-2d-vector-2d-routing-2f-helper:
	-$(RM) ./src/nix-vector-routing/helper/ipv4-nix-vector-helper.d ./src/nix-vector-routing/helper/ipv4-nix-vector-helper.o

.PHONY: clean-src-2f-nix-2d-vector-2d-routing-2f-helper

