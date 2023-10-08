################################################################################
# MRS Version: 1.9.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Debug/debug.c 

OBJS += \
./Debug/debug.o 

C_DEPS += \
./Debug/debug.d 


# Each subdirectory must supply rules for building sources it contributes
Debug/debug.o: D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Debug/debug.c
	@	@	riscv-none-embed-gcc -march=rv32ecxw -mabi=ilp32e -msmall-data-limit=0 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Debug" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Core" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\I2C\I2C_EEPROM\User" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@

