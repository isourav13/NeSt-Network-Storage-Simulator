################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../scratch/mqsim_qtcp_example/jb-application-container.cc \
../scratch/mqsim_qtcp_example/jb-application-helper.cc \
../scratch/mqsim_qtcp_example/jb-application.cc \
../scratch/mqsim_qtcp_example/jb-response-application-container.cc \
../scratch/mqsim_qtcp_example/jb-response-application-helper.cc \
../scratch/mqsim_qtcp_example/jb-response-application.cc \
../scratch/mqsim_qtcp_example/mqsim-qtcp-example.cc \
../scratch/mqsim_qtcp_example/mqsimTag.cc 

CC_DEPS += \
./scratch/mqsim_qtcp_example/jb-application-container.d \
./scratch/mqsim_qtcp_example/jb-application-helper.d \
./scratch/mqsim_qtcp_example/jb-application.d \
./scratch/mqsim_qtcp_example/jb-response-application-container.d \
./scratch/mqsim_qtcp_example/jb-response-application-helper.d \
./scratch/mqsim_qtcp_example/jb-response-application.d \
./scratch/mqsim_qtcp_example/mqsim-qtcp-example.d \
./scratch/mqsim_qtcp_example/mqsimTag.d 

OBJS += \
./scratch/mqsim_qtcp_example/jb-application-container.o \
./scratch/mqsim_qtcp_example/jb-application-helper.o \
./scratch/mqsim_qtcp_example/jb-application.o \
./scratch/mqsim_qtcp_example/jb-response-application-container.o \
./scratch/mqsim_qtcp_example/jb-response-application-helper.o \
./scratch/mqsim_qtcp_example/jb-response-application.o \
./scratch/mqsim_qtcp_example/mqsim-qtcp-example.o \
./scratch/mqsim_qtcp_example/mqsimTag.o 


# Each subdirectory must supply rules for building sources it contributes
scratch/mqsim_qtcp_example/%.o: ../scratch/mqsim_qtcp_example/%.cc scratch/mqsim_qtcp_example/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-scratch-2f-mqsim_qtcp_example

clean-scratch-2f-mqsim_qtcp_example:
	-$(RM) ./scratch/mqsim_qtcp_example/jb-application-container.d ./scratch/mqsim_qtcp_example/jb-application-container.o ./scratch/mqsim_qtcp_example/jb-application-helper.d ./scratch/mqsim_qtcp_example/jb-application-helper.o ./scratch/mqsim_qtcp_example/jb-application.d ./scratch/mqsim_qtcp_example/jb-application.o ./scratch/mqsim_qtcp_example/jb-response-application-container.d ./scratch/mqsim_qtcp_example/jb-response-application-container.o ./scratch/mqsim_qtcp_example/jb-response-application-helper.d ./scratch/mqsim_qtcp_example/jb-response-application-helper.o ./scratch/mqsim_qtcp_example/jb-response-application.d ./scratch/mqsim_qtcp_example/jb-response-application.o ./scratch/mqsim_qtcp_example/mqsim-qtcp-example.d ./scratch/mqsim_qtcp_example/mqsim-qtcp-example.o ./scratch/mqsim_qtcp_example/mqsimTag.d ./scratch/mqsim_qtcp_example/mqsimTag.o

.PHONY: clean-scratch-2f-mqsim_qtcp_example

