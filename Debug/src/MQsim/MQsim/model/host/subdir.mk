################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/MQsim/MQsim/model/host/host_check.cc 

CPP_SRCS += \
../src/MQsim/MQsim/model/host/IO_Flow_Base.cpp \
../src/MQsim/MQsim/model/host/IO_Flow_Synthetic.cpp \
../src/MQsim/MQsim/model/host/IO_Flow_Trace_Based.cpp \
../src/MQsim/MQsim/model/host/PCIe_Link.cpp \
../src/MQsim/MQsim/model/host/PCIe_Root_Complex.cpp \
../src/MQsim/MQsim/model/host/PCIe_Switch.cpp \
../src/MQsim/MQsim/model/host/SATA_HBA.cpp 

CC_DEPS += \
./src/MQsim/MQsim/model/host/host_check.d 

OBJS += \
./src/MQsim/MQsim/model/host/IO_Flow_Base.o \
./src/MQsim/MQsim/model/host/IO_Flow_Synthetic.o \
./src/MQsim/MQsim/model/host/IO_Flow_Trace_Based.o \
./src/MQsim/MQsim/model/host/PCIe_Link.o \
./src/MQsim/MQsim/model/host/PCIe_Root_Complex.o \
./src/MQsim/MQsim/model/host/PCIe_Switch.o \
./src/MQsim/MQsim/model/host/SATA_HBA.o \
./src/MQsim/MQsim/model/host/host_check.o 

CPP_DEPS += \
./src/MQsim/MQsim/model/host/IO_Flow_Base.d \
./src/MQsim/MQsim/model/host/IO_Flow_Synthetic.d \
./src/MQsim/MQsim/model/host/IO_Flow_Trace_Based.d \
./src/MQsim/MQsim/model/host/PCIe_Link.d \
./src/MQsim/MQsim/model/host/PCIe_Root_Complex.d \
./src/MQsim/MQsim/model/host/PCIe_Switch.d \
./src/MQsim/MQsim/model/host/SATA_HBA.d 


# Each subdirectory must supply rules for building sources it contributes
src/MQsim/MQsim/model/host/%.o: ../src/MQsim/MQsim/model/host/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/MQsim/MQsim/model/host/%.o: ../src/MQsim/MQsim/model/host/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


