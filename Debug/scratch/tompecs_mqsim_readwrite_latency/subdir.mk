################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../scratch/tompecs_mqsim_readwrite_latency/jb-application-container.cc \
../scratch/tompecs_mqsim_readwrite_latency/jb-application-helper.cc \
../scratch/tompecs_mqsim_readwrite_latency/jb-application.cc \
../scratch/tompecs_mqsim_readwrite_latency/jb-response-application-container.cc \
../scratch/tompecs_mqsim_readwrite_latency/jb-response-application-helper.cc \
../scratch/tompecs_mqsim_readwrite_latency/jb-response-application.cc \
../scratch/tompecs_mqsim_readwrite_latency/mqsim-qtcp-example.cc \
../scratch/tompecs_mqsim_readwrite_latency/mqsimTag.cc 

CC_DEPS += \
./scratch/tompecs_mqsim_readwrite_latency/jb-application-container.d \
./scratch/tompecs_mqsim_readwrite_latency/jb-application-helper.d \
./scratch/tompecs_mqsim_readwrite_latency/jb-application.d \
./scratch/tompecs_mqsim_readwrite_latency/jb-response-application-container.d \
./scratch/tompecs_mqsim_readwrite_latency/jb-response-application-helper.d \
./scratch/tompecs_mqsim_readwrite_latency/jb-response-application.d \
./scratch/tompecs_mqsim_readwrite_latency/mqsim-qtcp-example.d \
./scratch/tompecs_mqsim_readwrite_latency/mqsimTag.d 

OBJS += \
./scratch/tompecs_mqsim_readwrite_latency/jb-application-container.o \
./scratch/tompecs_mqsim_readwrite_latency/jb-application-helper.o \
./scratch/tompecs_mqsim_readwrite_latency/jb-application.o \
./scratch/tompecs_mqsim_readwrite_latency/jb-response-application-container.o \
./scratch/tompecs_mqsim_readwrite_latency/jb-response-application-helper.o \
./scratch/tompecs_mqsim_readwrite_latency/jb-response-application.o \
./scratch/tompecs_mqsim_readwrite_latency/mqsim-qtcp-example.o \
./scratch/tompecs_mqsim_readwrite_latency/mqsimTag.o 


# Each subdirectory must supply rules for building sources it contributes
scratch/tompecs_mqsim_readwrite_latency/%.o: ../scratch/tompecs_mqsim_readwrite_latency/%.cc scratch/tompecs_mqsim_readwrite_latency/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-scratch-2f-tompecs_mqsim_readwrite_latency

clean-scratch-2f-tompecs_mqsim_readwrite_latency:
	-$(RM) ./scratch/tompecs_mqsim_readwrite_latency/jb-application-container.d ./scratch/tompecs_mqsim_readwrite_latency/jb-application-container.o ./scratch/tompecs_mqsim_readwrite_latency/jb-application-helper.d ./scratch/tompecs_mqsim_readwrite_latency/jb-application-helper.o ./scratch/tompecs_mqsim_readwrite_latency/jb-application.d ./scratch/tompecs_mqsim_readwrite_latency/jb-application.o ./scratch/tompecs_mqsim_readwrite_latency/jb-response-application-container.d ./scratch/tompecs_mqsim_readwrite_latency/jb-response-application-container.o ./scratch/tompecs_mqsim_readwrite_latency/jb-response-application-helper.d ./scratch/tompecs_mqsim_readwrite_latency/jb-response-application-helper.o ./scratch/tompecs_mqsim_readwrite_latency/jb-response-application.d ./scratch/tompecs_mqsim_readwrite_latency/jb-response-application.o ./scratch/tompecs_mqsim_readwrite_latency/mqsim-qtcp-example.d ./scratch/tompecs_mqsim_readwrite_latency/mqsim-qtcp-example.o ./scratch/tompecs_mqsim_readwrite_latency/mqsimTag.d ./scratch/tompecs_mqsim_readwrite_latency/mqsimTag.o

.PHONY: clean-scratch-2f-tompecs_mqsim_readwrite_latency

