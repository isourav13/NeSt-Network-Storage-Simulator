################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../examples/wireless/mixed-wired-wireless.cc \
../examples/wireless/wifi-80211e-txop.cc \
../examples/wireless/wifi-80211n-mimo.cc \
../examples/wireless/wifi-adhoc.cc \
../examples/wireless/wifi-aggregation.cc \
../examples/wireless/wifi-ap.cc \
../examples/wireless/wifi-backward-compatibility.cc \
../examples/wireless/wifi-blockack.cc \
../examples/wireless/wifi-clear-channel-cmu.cc \
../examples/wireless/wifi-dsss-validation.cc \
../examples/wireless/wifi-error-models-comparison.cc \
../examples/wireless/wifi-he-network.cc \
../examples/wireless/wifi-hidden-terminal.cc \
../examples/wireless/wifi-ht-network.cc \
../examples/wireless/wifi-mixed-network.cc \
../examples/wireless/wifi-multi-tos.cc \
../examples/wireless/wifi-multirate.cc \
../examples/wireless/wifi-ofdm-he-validation.cc \
../examples/wireless/wifi-ofdm-ht-validation.cc \
../examples/wireless/wifi-ofdm-validation.cc \
../examples/wireless/wifi-ofdm-vht-validation.cc \
../examples/wireless/wifi-pcf.cc \
../examples/wireless/wifi-power-adaptation-distance.cc \
../examples/wireless/wifi-power-adaptation-interference.cc \
../examples/wireless/wifi-rate-adaptation-distance.cc \
../examples/wireless/wifi-simple-adhoc-grid.cc \
../examples/wireless/wifi-simple-adhoc.cc \
../examples/wireless/wifi-simple-ht-hidden-stations.cc \
../examples/wireless/wifi-simple-infra.cc \
../examples/wireless/wifi-simple-interference.cc \
../examples/wireless/wifi-sleep.cc \
../examples/wireless/wifi-spatial-reuse.cc \
../examples/wireless/wifi-spectrum-per-example.cc \
../examples/wireless/wifi-spectrum-per-interference.cc \
../examples/wireless/wifi-spectrum-saturation-example.cc \
../examples/wireless/wifi-tcp.cc \
../examples/wireless/wifi-timing-attributes.cc \
../examples/wireless/wifi-txop-aggregation.cc \
../examples/wireless/wifi-vht-network.cc \
../examples/wireless/wifi-wired-bridging.cc 

CC_DEPS += \
./examples/wireless/mixed-wired-wireless.d \
./examples/wireless/wifi-80211e-txop.d \
./examples/wireless/wifi-80211n-mimo.d \
./examples/wireless/wifi-adhoc.d \
./examples/wireless/wifi-aggregation.d \
./examples/wireless/wifi-ap.d \
./examples/wireless/wifi-backward-compatibility.d \
./examples/wireless/wifi-blockack.d \
./examples/wireless/wifi-clear-channel-cmu.d \
./examples/wireless/wifi-dsss-validation.d \
./examples/wireless/wifi-error-models-comparison.d \
./examples/wireless/wifi-he-network.d \
./examples/wireless/wifi-hidden-terminal.d \
./examples/wireless/wifi-ht-network.d \
./examples/wireless/wifi-mixed-network.d \
./examples/wireless/wifi-multi-tos.d \
./examples/wireless/wifi-multirate.d \
./examples/wireless/wifi-ofdm-he-validation.d \
./examples/wireless/wifi-ofdm-ht-validation.d \
./examples/wireless/wifi-ofdm-validation.d \
./examples/wireless/wifi-ofdm-vht-validation.d \
./examples/wireless/wifi-pcf.d \
./examples/wireless/wifi-power-adaptation-distance.d \
./examples/wireless/wifi-power-adaptation-interference.d \
./examples/wireless/wifi-rate-adaptation-distance.d \
./examples/wireless/wifi-simple-adhoc-grid.d \
./examples/wireless/wifi-simple-adhoc.d \
./examples/wireless/wifi-simple-ht-hidden-stations.d \
./examples/wireless/wifi-simple-infra.d \
./examples/wireless/wifi-simple-interference.d \
./examples/wireless/wifi-sleep.d \
./examples/wireless/wifi-spatial-reuse.d \
./examples/wireless/wifi-spectrum-per-example.d \
./examples/wireless/wifi-spectrum-per-interference.d \
./examples/wireless/wifi-spectrum-saturation-example.d \
./examples/wireless/wifi-tcp.d \
./examples/wireless/wifi-timing-attributes.d \
./examples/wireless/wifi-txop-aggregation.d \
./examples/wireless/wifi-vht-network.d \
./examples/wireless/wifi-wired-bridging.d 

OBJS += \
./examples/wireless/mixed-wired-wireless.o \
./examples/wireless/wifi-80211e-txop.o \
./examples/wireless/wifi-80211n-mimo.o \
./examples/wireless/wifi-adhoc.o \
./examples/wireless/wifi-aggregation.o \
./examples/wireless/wifi-ap.o \
./examples/wireless/wifi-backward-compatibility.o \
./examples/wireless/wifi-blockack.o \
./examples/wireless/wifi-clear-channel-cmu.o \
./examples/wireless/wifi-dsss-validation.o \
./examples/wireless/wifi-error-models-comparison.o \
./examples/wireless/wifi-he-network.o \
./examples/wireless/wifi-hidden-terminal.o \
./examples/wireless/wifi-ht-network.o \
./examples/wireless/wifi-mixed-network.o \
./examples/wireless/wifi-multi-tos.o \
./examples/wireless/wifi-multirate.o \
./examples/wireless/wifi-ofdm-he-validation.o \
./examples/wireless/wifi-ofdm-ht-validation.o \
./examples/wireless/wifi-ofdm-validation.o \
./examples/wireless/wifi-ofdm-vht-validation.o \
./examples/wireless/wifi-pcf.o \
./examples/wireless/wifi-power-adaptation-distance.o \
./examples/wireless/wifi-power-adaptation-interference.o \
./examples/wireless/wifi-rate-adaptation-distance.o \
./examples/wireless/wifi-simple-adhoc-grid.o \
./examples/wireless/wifi-simple-adhoc.o \
./examples/wireless/wifi-simple-ht-hidden-stations.o \
./examples/wireless/wifi-simple-infra.o \
./examples/wireless/wifi-simple-interference.o \
./examples/wireless/wifi-sleep.o \
./examples/wireless/wifi-spatial-reuse.o \
./examples/wireless/wifi-spectrum-per-example.o \
./examples/wireless/wifi-spectrum-per-interference.o \
./examples/wireless/wifi-spectrum-saturation-example.o \
./examples/wireless/wifi-tcp.o \
./examples/wireless/wifi-timing-attributes.o \
./examples/wireless/wifi-txop-aggregation.o \
./examples/wireless/wifi-vht-network.o \
./examples/wireless/wifi-wired-bridging.o 


# Each subdirectory must supply rules for building sources it contributes
examples/wireless/%.o: ../examples/wireless/%.cc examples/wireless/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-examples-2f-wireless

clean-examples-2f-wireless:
	-$(RM) ./examples/wireless/mixed-wired-wireless.d ./examples/wireless/mixed-wired-wireless.o ./examples/wireless/wifi-80211e-txop.d ./examples/wireless/wifi-80211e-txop.o ./examples/wireless/wifi-80211n-mimo.d ./examples/wireless/wifi-80211n-mimo.o ./examples/wireless/wifi-adhoc.d ./examples/wireless/wifi-adhoc.o ./examples/wireless/wifi-aggregation.d ./examples/wireless/wifi-aggregation.o ./examples/wireless/wifi-ap.d ./examples/wireless/wifi-ap.o ./examples/wireless/wifi-backward-compatibility.d ./examples/wireless/wifi-backward-compatibility.o ./examples/wireless/wifi-blockack.d ./examples/wireless/wifi-blockack.o ./examples/wireless/wifi-clear-channel-cmu.d ./examples/wireless/wifi-clear-channel-cmu.o ./examples/wireless/wifi-dsss-validation.d ./examples/wireless/wifi-dsss-validation.o ./examples/wireless/wifi-error-models-comparison.d ./examples/wireless/wifi-error-models-comparison.o ./examples/wireless/wifi-he-network.d ./examples/wireless/wifi-he-network.o ./examples/wireless/wifi-hidden-terminal.d ./examples/wireless/wifi-hidden-terminal.o ./examples/wireless/wifi-ht-network.d ./examples/wireless/wifi-ht-network.o ./examples/wireless/wifi-mixed-network.d ./examples/wireless/wifi-mixed-network.o ./examples/wireless/wifi-multi-tos.d ./examples/wireless/wifi-multi-tos.o ./examples/wireless/wifi-multirate.d ./examples/wireless/wifi-multirate.o ./examples/wireless/wifi-ofdm-he-validation.d ./examples/wireless/wifi-ofdm-he-validation.o ./examples/wireless/wifi-ofdm-ht-validation.d ./examples/wireless/wifi-ofdm-ht-validation.o ./examples/wireless/wifi-ofdm-validation.d ./examples/wireless/wifi-ofdm-validation.o ./examples/wireless/wifi-ofdm-vht-validation.d ./examples/wireless/wifi-ofdm-vht-validation.o ./examples/wireless/wifi-pcf.d ./examples/wireless/wifi-pcf.o ./examples/wireless/wifi-power-adaptation-distance.d ./examples/wireless/wifi-power-adaptation-distance.o ./examples/wireless/wifi-power-adaptation-interference.d ./examples/wireless/wifi-power-adaptation-interference.o ./examples/wireless/wifi-rate-adaptation-distance.d ./examples/wireless/wifi-rate-adaptation-distance.o ./examples/wireless/wifi-simple-adhoc-grid.d ./examples/wireless/wifi-simple-adhoc-grid.o ./examples/wireless/wifi-simple-adhoc.d ./examples/wireless/wifi-simple-adhoc.o ./examples/wireless/wifi-simple-ht-hidden-stations.d ./examples/wireless/wifi-simple-ht-hidden-stations.o ./examples/wireless/wifi-simple-infra.d ./examples/wireless/wifi-simple-infra.o ./examples/wireless/wifi-simple-interference.d ./examples/wireless/wifi-simple-interference.o ./examples/wireless/wifi-sleep.d ./examples/wireless/wifi-sleep.o ./examples/wireless/wifi-spatial-reuse.d ./examples/wireless/wifi-spatial-reuse.o ./examples/wireless/wifi-spectrum-per-example.d ./examples/wireless/wifi-spectrum-per-example.o ./examples/wireless/wifi-spectrum-per-interference.d ./examples/wireless/wifi-spectrum-per-interference.o ./examples/wireless/wifi-spectrum-saturation-example.d ./examples/wireless/wifi-spectrum-saturation-example.o ./examples/wireless/wifi-tcp.d ./examples/wireless/wifi-tcp.o ./examples/wireless/wifi-timing-attributes.d ./examples/wireless/wifi-timing-attributes.o ./examples/wireless/wifi-txop-aggregation.d ./examples/wireless/wifi-txop-aggregation.o ./examples/wireless/wifi-vht-network.d ./examples/wireless/wifi-vht-network.o ./examples/wireless/wifi-wired-bridging.d ./examples/wireless/wifi-wired-bridging.o

.PHONY: clean-examples-2f-wireless

