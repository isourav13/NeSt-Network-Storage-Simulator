################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../scratch/dctcp_example/dctcp-example.cc 

CC_DEPS += \
./scratch/dctcp_example/dctcp-example.d 

OBJS += \
./scratch/dctcp_example/dctcp-example.o 


# Each subdirectory must supply rules for building sources it contributes
scratch/dctcp_example/%.o: ../scratch/dctcp_example/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


