################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-application-container.cc \
../scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-application-helper.cc \
../scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-application.cc \
../scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-response-application-container.cc \
../scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-response-application-helper.cc \
../scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-response-application.cc \
../scratch/tompecs_mqsim_readonly_throughput_pm_fattree/mqsim-qtcp-example.cc \
../scratch/tompecs_mqsim_readonly_throughput_pm_fattree/mqsimTag.cc 

CC_DEPS += \
./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-application-container.d \
./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-application-helper.d \
./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-application.d \
./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-response-application-container.d \
./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-response-application-helper.d \
./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-response-application.d \
./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/mqsim-qtcp-example.d \
./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/mqsimTag.d 

OBJS += \
./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-application-container.o \
./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-application-helper.o \
./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-application.o \
./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-response-application-container.o \
./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-response-application-helper.o \
./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-response-application.o \
./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/mqsim-qtcp-example.o \
./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/mqsimTag.o 


# Each subdirectory must supply rules for building sources it contributes
scratch/tompecs_mqsim_readonly_throughput_pm_fattree/%.o: ../scratch/tompecs_mqsim_readonly_throughput_pm_fattree/%.cc scratch/tompecs_mqsim_readonly_throughput_pm_fattree/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-scratch-2f-tompecs_mqsim_readonly_throughput_pm_fattree

clean-scratch-2f-tompecs_mqsim_readonly_throughput_pm_fattree:
	-$(RM) ./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-application-container.d ./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-application-container.o ./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-application-helper.d ./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-application-helper.o ./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-application.d ./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-application.o ./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-response-application-container.d ./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-response-application-container.o ./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-response-application-helper.d ./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-response-application-helper.o ./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-response-application.d ./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/jb-response-application.o ./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/mqsim-qtcp-example.d ./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/mqsim-qtcp-example.o ./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/mqsimTag.d ./scratch/tompecs_mqsim_readonly_throughput_pm_fattree/mqsimTag.o

.PHONY: clean-scratch-2f-tompecs_mqsim_readonly_throughput_pm_fattree

