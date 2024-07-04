################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-application-container.cc \
../scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-application-helper.cc \
../scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-application.cc \
../scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-response-application-container.cc \
../scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-response-application-helper.cc \
../scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-response-application.cc \
../scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/mqsim-qtcp-example.cc \
../scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/mqsimTag.cc 

CC_DEPS += \
./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-application-container.d \
./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-application-helper.d \
./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-application.d \
./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-response-application-container.d \
./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-response-application-helper.d \
./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-response-application.d \
./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/mqsim-qtcp-example.d \
./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/mqsimTag.d 

OBJS += \
./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-application-container.o \
./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-application-helper.o \
./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-application.o \
./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-response-application-container.o \
./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-response-application-helper.o \
./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-response-application.o \
./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/mqsim-qtcp-example.o \
./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/mqsimTag.o 


# Each subdirectory must supply rules for building sources it contributes
scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/%.o: ../scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/%.cc scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-scratch-2f-tompecs_mqsim_trace_throughput_pm-2f-tompecs_mqsim_trace_throughput_pm

clean-scratch-2f-tompecs_mqsim_trace_throughput_pm-2f-tompecs_mqsim_trace_throughput_pm:
	-$(RM) ./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-application-container.d ./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-application-container.o ./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-application-helper.d ./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-application-helper.o ./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-application.d ./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-application.o ./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-response-application-container.d ./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-response-application-container.o ./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-response-application-helper.d ./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-response-application-helper.o ./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-response-application.d ./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/jb-response-application.o ./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/mqsim-qtcp-example.d ./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/mqsim-qtcp-example.o ./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/mqsimTag.d ./scratch/tompecs_mqsim_trace_throughput_pm/tompecs_mqsim_trace_throughput_pm/mqsimTag.o

.PHONY: clean-scratch-2f-tompecs_mqsim_trace_throughput_pm-2f-tompecs_mqsim_trace_throughput_pm

