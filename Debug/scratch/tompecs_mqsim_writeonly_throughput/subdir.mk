################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../scratch/tompecs_mqsim_writeonly_throughput/jb-application-container.cc \
../scratch/tompecs_mqsim_writeonly_throughput/jb-application-helper.cc \
../scratch/tompecs_mqsim_writeonly_throughput/jb-application.cc \
../scratch/tompecs_mqsim_writeonly_throughput/jb-response-application-container.cc \
../scratch/tompecs_mqsim_writeonly_throughput/jb-response-application-helper.cc \
../scratch/tompecs_mqsim_writeonly_throughput/jb-response-application.cc \
../scratch/tompecs_mqsim_writeonly_throughput/mqsim-qtcp-example.cc \
../scratch/tompecs_mqsim_writeonly_throughput/mqsimTag.cc 

CC_DEPS += \
./scratch/tompecs_mqsim_writeonly_throughput/jb-application-container.d \
./scratch/tompecs_mqsim_writeonly_throughput/jb-application-helper.d \
./scratch/tompecs_mqsim_writeonly_throughput/jb-application.d \
./scratch/tompecs_mqsim_writeonly_throughput/jb-response-application-container.d \
./scratch/tompecs_mqsim_writeonly_throughput/jb-response-application-helper.d \
./scratch/tompecs_mqsim_writeonly_throughput/jb-response-application.d \
./scratch/tompecs_mqsim_writeonly_throughput/mqsim-qtcp-example.d \
./scratch/tompecs_mqsim_writeonly_throughput/mqsimTag.d 

OBJS += \
./scratch/tompecs_mqsim_writeonly_throughput/jb-application-container.o \
./scratch/tompecs_mqsim_writeonly_throughput/jb-application-helper.o \
./scratch/tompecs_mqsim_writeonly_throughput/jb-application.o \
./scratch/tompecs_mqsim_writeonly_throughput/jb-response-application-container.o \
./scratch/tompecs_mqsim_writeonly_throughput/jb-response-application-helper.o \
./scratch/tompecs_mqsim_writeonly_throughput/jb-response-application.o \
./scratch/tompecs_mqsim_writeonly_throughput/mqsim-qtcp-example.o \
./scratch/tompecs_mqsim_writeonly_throughput/mqsimTag.o 


# Each subdirectory must supply rules for building sources it contributes
scratch/tompecs_mqsim_writeonly_throughput/%.o: ../scratch/tompecs_mqsim_writeonly_throughput/%.cc scratch/tompecs_mqsim_writeonly_throughput/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-scratch-2f-tompecs_mqsim_writeonly_throughput

clean-scratch-2f-tompecs_mqsim_writeonly_throughput:
	-$(RM) ./scratch/tompecs_mqsim_writeonly_throughput/jb-application-container.d ./scratch/tompecs_mqsim_writeonly_throughput/jb-application-container.o ./scratch/tompecs_mqsim_writeonly_throughput/jb-application-helper.d ./scratch/tompecs_mqsim_writeonly_throughput/jb-application-helper.o ./scratch/tompecs_mqsim_writeonly_throughput/jb-application.d ./scratch/tompecs_mqsim_writeonly_throughput/jb-application.o ./scratch/tompecs_mqsim_writeonly_throughput/jb-response-application-container.d ./scratch/tompecs_mqsim_writeonly_throughput/jb-response-application-container.o ./scratch/tompecs_mqsim_writeonly_throughput/jb-response-application-helper.d ./scratch/tompecs_mqsim_writeonly_throughput/jb-response-application-helper.o ./scratch/tompecs_mqsim_writeonly_throughput/jb-response-application.d ./scratch/tompecs_mqsim_writeonly_throughput/jb-response-application.o ./scratch/tompecs_mqsim_writeonly_throughput/mqsim-qtcp-example.d ./scratch/tompecs_mqsim_writeonly_throughput/mqsim-qtcp-example.o ./scratch/tompecs_mqsim_writeonly_throughput/mqsimTag.d ./scratch/tompecs_mqsim_writeonly_throughput/mqsimTag.o

.PHONY: clean-scratch-2f-tompecs_mqsim_writeonly_throughput

