################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../scratch/tompecs_mqsim_readwrite_latency2/jb-application-container.cc \
../scratch/tompecs_mqsim_readwrite_latency2/jb-application-helper.cc \
../scratch/tompecs_mqsim_readwrite_latency2/jb-application.cc \
../scratch/tompecs_mqsim_readwrite_latency2/jb-response-application-container.cc \
../scratch/tompecs_mqsim_readwrite_latency2/jb-response-application-helper.cc \
../scratch/tompecs_mqsim_readwrite_latency2/jb-response-application.cc \
../scratch/tompecs_mqsim_readwrite_latency2/mqsim-qtcp-example.cc \
../scratch/tompecs_mqsim_readwrite_latency2/mqsimTag.cc 

CC_DEPS += \
./scratch/tompecs_mqsim_readwrite_latency2/jb-application-container.d \
./scratch/tompecs_mqsim_readwrite_latency2/jb-application-helper.d \
./scratch/tompecs_mqsim_readwrite_latency2/jb-application.d \
./scratch/tompecs_mqsim_readwrite_latency2/jb-response-application-container.d \
./scratch/tompecs_mqsim_readwrite_latency2/jb-response-application-helper.d \
./scratch/tompecs_mqsim_readwrite_latency2/jb-response-application.d \
./scratch/tompecs_mqsim_readwrite_latency2/mqsim-qtcp-example.d \
./scratch/tompecs_mqsim_readwrite_latency2/mqsimTag.d 

OBJS += \
./scratch/tompecs_mqsim_readwrite_latency2/jb-application-container.o \
./scratch/tompecs_mqsim_readwrite_latency2/jb-application-helper.o \
./scratch/tompecs_mqsim_readwrite_latency2/jb-application.o \
./scratch/tompecs_mqsim_readwrite_latency2/jb-response-application-container.o \
./scratch/tompecs_mqsim_readwrite_latency2/jb-response-application-helper.o \
./scratch/tompecs_mqsim_readwrite_latency2/jb-response-application.o \
./scratch/tompecs_mqsim_readwrite_latency2/mqsim-qtcp-example.o \
./scratch/tompecs_mqsim_readwrite_latency2/mqsimTag.o 


# Each subdirectory must supply rules for building sources it contributes
scratch/tompecs_mqsim_readwrite_latency2/%.o: ../scratch/tompecs_mqsim_readwrite_latency2/%.cc scratch/tompecs_mqsim_readwrite_latency2/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-scratch-2f-tompecs_mqsim_readwrite_latency2

clean-scratch-2f-tompecs_mqsim_readwrite_latency2:
	-$(RM) ./scratch/tompecs_mqsim_readwrite_latency2/jb-application-container.d ./scratch/tompecs_mqsim_readwrite_latency2/jb-application-container.o ./scratch/tompecs_mqsim_readwrite_latency2/jb-application-helper.d ./scratch/tompecs_mqsim_readwrite_latency2/jb-application-helper.o ./scratch/tompecs_mqsim_readwrite_latency2/jb-application.d ./scratch/tompecs_mqsim_readwrite_latency2/jb-application.o ./scratch/tompecs_mqsim_readwrite_latency2/jb-response-application-container.d ./scratch/tompecs_mqsim_readwrite_latency2/jb-response-application-container.o ./scratch/tompecs_mqsim_readwrite_latency2/jb-response-application-helper.d ./scratch/tompecs_mqsim_readwrite_latency2/jb-response-application-helper.o ./scratch/tompecs_mqsim_readwrite_latency2/jb-response-application.d ./scratch/tompecs_mqsim_readwrite_latency2/jb-response-application.o ./scratch/tompecs_mqsim_readwrite_latency2/mqsim-qtcp-example.d ./scratch/tompecs_mqsim_readwrite_latency2/mqsim-qtcp-example.o ./scratch/tompecs_mqsim_readwrite_latency2/mqsimTag.d ./scratch/tompecs_mqsim_readwrite_latency2/mqsimTag.o

.PHONY: clean-scratch-2f-tompecs_mqsim_readwrite_latency2

