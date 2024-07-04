################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../scratch/nvmetcp_new_tcp_friendliness_latest/dctcp-example.cc \
../scratch/nvmetcp_new_tcp_friendliness_latest/jb-application-container.cc \
../scratch/nvmetcp_new_tcp_friendliness_latest/jb-application-helper.cc \
../scratch/nvmetcp_new_tcp_friendliness_latest/jb-application.cc 

CC_DEPS += \
./scratch/nvmetcp_new_tcp_friendliness_latest/dctcp-example.d \
./scratch/nvmetcp_new_tcp_friendliness_latest/jb-application-container.d \
./scratch/nvmetcp_new_tcp_friendliness_latest/jb-application-helper.d \
./scratch/nvmetcp_new_tcp_friendliness_latest/jb-application.d 

OBJS += \
./scratch/nvmetcp_new_tcp_friendliness_latest/dctcp-example.o \
./scratch/nvmetcp_new_tcp_friendliness_latest/jb-application-container.o \
./scratch/nvmetcp_new_tcp_friendliness_latest/jb-application-helper.o \
./scratch/nvmetcp_new_tcp_friendliness_latest/jb-application.o 


# Each subdirectory must supply rules for building sources it contributes
scratch/nvmetcp_new_tcp_friendliness_latest/%.o: ../scratch/nvmetcp_new_tcp_friendliness_latest/%.cc scratch/nvmetcp_new_tcp_friendliness_latest/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-scratch-2f-nvmetcp_new_tcp_friendliness_latest

clean-scratch-2f-nvmetcp_new_tcp_friendliness_latest:
	-$(RM) ./scratch/nvmetcp_new_tcp_friendliness_latest/dctcp-example.d ./scratch/nvmetcp_new_tcp_friendliness_latest/dctcp-example.o ./scratch/nvmetcp_new_tcp_friendliness_latest/jb-application-container.d ./scratch/nvmetcp_new_tcp_friendliness_latest/jb-application-container.o ./scratch/nvmetcp_new_tcp_friendliness_latest/jb-application-helper.d ./scratch/nvmetcp_new_tcp_friendliness_latest/jb-application-helper.o ./scratch/nvmetcp_new_tcp_friendliness_latest/jb-application.d ./scratch/nvmetcp_new_tcp_friendliness_latest/jb-application.o

.PHONY: clean-scratch-2f-nvmetcp_new_tcp_friendliness_latest

