################################################################################
# MRS Version: 1.9.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../User/ch32v00x_it.c \
../User/main.c \
../User/oled96.c \
../User/system_ch32v00x.c 

OBJS += \
./User/ch32v00x_it.o \
./User/main.o \
./User/oled96.o \
./User/system_ch32v00x.o 

C_DEPS += \
./User/ch32v00x_it.d \
./User/main.d \
./User/oled96.d \
./User/system_ch32v00x.d 


# Each subdirectory must supply rules for building sources it contributes
User/%.o: ../User/%.c
	@	@	riscv-none-embed-gcc -march=rv32ecxw -mabi=ilp32e -msmall-data-limit=0 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Debug" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Core" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\I2C\I2C_EEPROM\User" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@

