################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../scratch/nvmetcp_new_RTT_alpha_check/dctcp-example.cc \
../scratch/nvmetcp_new_RTT_alpha_check/jb-application-container.cc \
../scratch/nvmetcp_new_RTT_alpha_check/jb-application-helper.cc \
../scratch/nvmetcp_new_RTT_alpha_check/jb-application.cc 

CC_DEPS += \
./scratch/nvmetcp_new_RTT_alpha_check/dctcp-example.d \
./scratch/nvmetcp_new_RTT_alpha_check/jb-application-container.d \
./scratch/nvmetcp_new_RTT_alpha_check/jb-application-helper.d \
./scratch/nvmetcp_new_RTT_alpha_check/jb-application.d 

OBJS += \
./scratch/nvmetcp_new_RTT_alpha_check/dctcp-example.o \
./scratch/nvmetcp_new_RTT_alpha_check/jb-application-container.o \
./scratch/nvmetcp_new_RTT_alpha_check/jb-application-helper.o \
./scratch/nvmetcp_new_RTT_alpha_check/jb-application.o 


# Each subdirectory must supply rules for building sources it contributes
scratch/nvmetcp_new_RTT_alpha_check/%.o: ../scratch/nvmetcp_new_RTT_alpha_check/%.cc scratch/nvmetcp_new_RTT_alpha_check/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-scratch-2f-nvmetcp_new_RTT_alpha_check

clean-scratch-2f-nvmetcp_new_RTT_alpha_check:
	-$(RM) ./scratch/nvmetcp_new_RTT_alpha_check/dctcp-example.d ./scratch/nvmetcp_new_RTT_alpha_check/dctcp-example.o ./scratch/nvmetcp_new_RTT_alpha_check/jb-application-container.d ./scratch/nvmetcp_new_RTT_alpha_check/jb-application-container.o ./scratch/nvmetcp_new_RTT_alpha_check/jb-application-helper.d ./scratch/nvmetcp_new_RTT_alpha_check/jb-application-helper.o ./scratch/nvmetcp_new_RTT_alpha_check/jb-application.d ./scratch/nvmetcp_new_RTT_alpha_check/jb-application.o

.PHONY: clean-scratch-2f-nvmetcp_new_RTT_alpha_check

