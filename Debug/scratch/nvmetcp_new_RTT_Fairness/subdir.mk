################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../scratch/nvmetcp_new_RTT_Fairness/dctcp-example.cc \
../scratch/nvmetcp_new_RTT_Fairness/jb-application-container.cc \
../scratch/nvmetcp_new_RTT_Fairness/jb-application-helper.cc \
../scratch/nvmetcp_new_RTT_Fairness/jb-application.cc 

CC_DEPS += \
./scratch/nvmetcp_new_RTT_Fairness/dctcp-example.d \
./scratch/nvmetcp_new_RTT_Fairness/jb-application-container.d \
./scratch/nvmetcp_new_RTT_Fairness/jb-application-helper.d \
./scratch/nvmetcp_new_RTT_Fairness/jb-application.d 

OBJS += \
./scratch/nvmetcp_new_RTT_Fairness/dctcp-example.o \
./scratch/nvmetcp_new_RTT_Fairness/jb-application-container.o \
./scratch/nvmetcp_new_RTT_Fairness/jb-application-helper.o \
./scratch/nvmetcp_new_RTT_Fairness/jb-application.o 


# Each subdirectory must supply rules for building sources it contributes
scratch/nvmetcp_new_RTT_Fairness/%.o: ../scratch/nvmetcp_new_RTT_Fairness/%.cc scratch/nvmetcp_new_RTT_Fairness/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-scratch-2f-nvmetcp_new_RTT_Fairness

clean-scratch-2f-nvmetcp_new_RTT_Fairness:
	-$(RM) ./scratch/nvmetcp_new_RTT_Fairness/dctcp-example.d ./scratch/nvmetcp_new_RTT_Fairness/dctcp-example.o ./scratch/nvmetcp_new_RTT_Fairness/jb-application-container.d ./scratch/nvmetcp_new_RTT_Fairness/jb-application-container.o ./scratch/nvmetcp_new_RTT_Fairness/jb-application-helper.d ./scratch/nvmetcp_new_RTT_Fairness/jb-application-helper.o ./scratch/nvmetcp_new_RTT_Fairness/jb-application.d ./scratch/nvmetcp_new_RTT_Fairness/jb-application.o

.PHONY: clean-scratch-2f-nvmetcp_new_RTT_Fairness

