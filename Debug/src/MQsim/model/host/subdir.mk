################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/MQsim/model/host/host_check.cc 

CPP_SRCS += \
../src/MQsim/model/host/IO_Flow_Base.cpp \
../src/MQsim/model/host/IO_Flow_NS3_Based.cpp \
../src/MQsim/model/host/IO_Flow_Synthetic.cpp \
../src/MQsim/model/host/IO_Flow_Trace_Based.cpp \
../src/MQsim/model/host/PCIe_Link.cpp \
../src/MQsim/model/host/PCIe_Root_Complex.cpp \
../src/MQsim/model/host/PCIe_Switch.cpp \
../src/MQsim/model/host/PLMSpecs.cpp \
../src/MQsim/model/host/SATA_HBA.cpp 

CC_DEPS += \
./src/MQsim/model/host/host_check.d 

CPP_DEPS += \
./src/MQsim/model/host/IO_Flow_Base.d \
./src/MQsim/model/host/IO_Flow_NS3_Based.d \
./src/MQsim/model/host/IO_Flow_Synthetic.d \
./src/MQsim/model/host/IO_Flow_Trace_Based.d \
./src/MQsim/model/host/PCIe_Link.d \
./src/MQsim/model/host/PCIe_Root_Complex.d \
./src/MQsim/model/host/PCIe_Switch.d \
./src/MQsim/model/host/PLMSpecs.d \
./src/MQsim/model/host/SATA_HBA.d 

OBJS += \
./src/MQsim/model/host/IO_Flow_Base.o \
./src/MQsim/model/host/IO_Flow_NS3_Based.o \
./src/MQsim/model/host/IO_Flow_Synthetic.o \
./src/MQsim/model/host/IO_Flow_Trace_Based.o \
./src/MQsim/model/host/PCIe_Link.o \
./src/MQsim/model/host/PCIe_Root_Complex.o \
./src/MQsim/model/host/PCIe_Switch.o \
./src/MQsim/model/host/PLMSpecs.o \
./src/MQsim/model/host/SATA_HBA.o \
./src/MQsim/model/host/host_check.o 


# Each subdirectory must supply rules for building sources it contributes
src/MQsim/model/host/%.o: ../src/MQsim/model/host/%.cpp src/MQsim/model/host/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/MQsim/model/host/%.o: ../src/MQsim/model/host/%.cc src/MQsim/model/host/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-MQsim-2f-model-2f-host

clean-src-2f-MQsim-2f-model-2f-host:
	-$(RM) ./src/MQsim/model/host/IO_Flow_Base.d ./src/MQsim/model/host/IO_Flow_Base.o ./src/MQsim/model/host/IO_Flow_NS3_Based.d ./src/MQsim/model/host/IO_Flow_NS3_Based.o ./src/MQsim/model/host/IO_Flow_Synthetic.d ./src/MQsim/model/host/IO_Flow_Synthetic.o ./src/MQsim/model/host/IO_Flow_Trace_Based.d ./src/MQsim/model/host/IO_Flow_Trace_Based.o ./src/MQsim/model/host/PCIe_Link.d ./src/MQsim/model/host/PCIe_Link.o ./src/MQsim/model/host/PCIe_Root_Complex.d ./src/MQsim/model/host/PCIe_Root_Complex.o ./src/MQsim/model/host/PCIe_Switch.d ./src/MQsim/model/host/PCIe_Switch.o ./src/MQsim/model/host/PLMSpecs.d ./src/MQsim/model/host/PLMSpecs.o ./src/MQsim/model/host/SATA_HBA.d ./src/MQsim/model/host/SATA_HBA.o ./src/MQsim/model/host/host_check.d ./src/MQsim/model/host/host_check.o

.PHONY: clean-src-2f-MQsim-2f-model-2f-host

