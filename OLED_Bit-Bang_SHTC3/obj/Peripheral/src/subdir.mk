################################################################################
# MRS Version: 1.9.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_adc.c \
D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_dbgmcu.c \
D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_dma.c \
D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_exti.c \
D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_flash.c \
D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_gpio.c \
D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_i2c.c \
D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_iwdg.c \
D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_misc.c \
D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_opa.c \
D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_pwr.c \
D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_rcc.c \
D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_spi.c \
D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_tim.c \
D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_usart.c \
D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_wwdg.c 

OBJS += \
./Peripheral/src/ch32v00x_adc.o \
./Peripheral/src/ch32v00x_dbgmcu.o \
./Peripheral/src/ch32v00x_dma.o \
./Peripheral/src/ch32v00x_exti.o \
./Peripheral/src/ch32v00x_flash.o \
./Peripheral/src/ch32v00x_gpio.o \
./Peripheral/src/ch32v00x_i2c.o \
./Peripheral/src/ch32v00x_iwdg.o \
./Peripheral/src/ch32v00x_misc.o \
./Peripheral/src/ch32v00x_opa.o \
./Peripheral/src/ch32v00x_pwr.o \
./Peripheral/src/ch32v00x_rcc.o \
./Peripheral/src/ch32v00x_spi.o \
./Peripheral/src/ch32v00x_tim.o \
./Peripheral/src/ch32v00x_usart.o \
./Peripheral/src/ch32v00x_wwdg.o 

C_DEPS += \
./Peripheral/src/ch32v00x_adc.d \
./Peripheral/src/ch32v00x_dbgmcu.d \
./Peripheral/src/ch32v00x_dma.d \
./Peripheral/src/ch32v00x_exti.d \
./Peripheral/src/ch32v00x_flash.d \
./Peripheral/src/ch32v00x_gpio.d \
./Peripheral/src/ch32v00x_i2c.d \
./Peripheral/src/ch32v00x_iwdg.d \
./Peripheral/src/ch32v00x_misc.d \
./Peripheral/src/ch32v00x_opa.d \
./Peripheral/src/ch32v00x_pwr.d \
./Peripheral/src/ch32v00x_rcc.d \
./Peripheral/src/ch32v00x_spi.d \
./Peripheral/src/ch32v00x_tim.d \
./Peripheral/src/ch32v00x_usart.d \
./Peripheral/src/ch32v00x_wwdg.d 


# Each subdirectory must supply rules for building sources it contributes
Peripheral/src/ch32v00x_adc.o: D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_adc.c
	@	@	riscv-none-embed-gcc -march=rv32ecxw -mabi=ilp32e -msmall-data-limit=0 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Debug" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Core" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\I2C\I2C_EEPROM\User" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v00x_dbgmcu.o: D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_dbgmcu.c
	@	@	riscv-none-embed-gcc -march=rv32ecxw -mabi=ilp32e -msmall-data-limit=0 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Debug" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Core" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\I2C\I2C_EEPROM\User" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v00x_dma.o: D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_dma.c
	@	@	riscv-none-embed-gcc -march=rv32ecxw -mabi=ilp32e -msmall-data-limit=0 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Debug" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Core" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\I2C\I2C_EEPROM\User" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v00x_exti.o: D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_exti.c
	@	@	riscv-none-embed-gcc -march=rv32ecxw -mabi=ilp32e -msmall-data-limit=0 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Debug" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Core" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\I2C\I2C_EEPROM\User" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v00x_flash.o: D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_flash.c
	@	@	riscv-none-embed-gcc -march=rv32ecxw -mabi=ilp32e -msmall-data-limit=0 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Debug" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Core" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\I2C\I2C_EEPROM\User" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v00x_gpio.o: D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_gpio.c
	@	@	riscv-none-embed-gcc -march=rv32ecxw -mabi=ilp32e -msmall-data-limit=0 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Debug" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Core" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\I2C\I2C_EEPROM\User" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v00x_i2c.o: D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_i2c.c
	@	@	riscv-none-embed-gcc -march=rv32ecxw -mabi=ilp32e -msmall-data-limit=0 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Debug" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Core" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\I2C\I2C_EEPROM\User" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v00x_iwdg.o: D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_iwdg.c
	@	@	riscv-none-embed-gcc -march=rv32ecxw -mabi=ilp32e -msmall-data-limit=0 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Debug" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Core" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\I2C\I2C_EEPROM\User" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v00x_misc.o: D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_misc.c
	@	@	riscv-none-embed-gcc -march=rv32ecxw -mabi=ilp32e -msmall-data-limit=0 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Debug" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Core" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\I2C\I2C_EEPROM\User" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v00x_opa.o: D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_opa.c
	@	@	riscv-none-embed-gcc -march=rv32ecxw -mabi=ilp32e -msmall-data-limit=0 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Debug" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Core" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\I2C\I2C_EEPROM\User" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v00x_pwr.o: D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_pwr.c
	@	@	riscv-none-embed-gcc -march=rv32ecxw -mabi=ilp32e -msmall-data-limit=0 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Debug" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Core" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\I2C\I2C_EEPROM\User" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v00x_rcc.o: D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_rcc.c
	@	@	riscv-none-embed-gcc -march=rv32ecxw -mabi=ilp32e -msmall-data-limit=0 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Debug" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Core" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\I2C\I2C_EEPROM\User" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v00x_spi.o: D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_spi.c
	@	@	riscv-none-embed-gcc -march=rv32ecxw -mabi=ilp32e -msmall-data-limit=0 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Debug" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Core" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\I2C\I2C_EEPROM\User" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v00x_tim.o: D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_tim.c
	@	@	riscv-none-embed-gcc -march=rv32ecxw -mabi=ilp32e -msmall-data-limit=0 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Debug" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Core" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\I2C\I2C_EEPROM\User" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v00x_usart.o: D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_usart.c
	@	@	riscv-none-embed-gcc -march=rv32ecxw -mabi=ilp32e -msmall-data-limit=0 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Debug" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Core" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\I2C\I2C_EEPROM\User" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v00x_wwdg.o: D:/Google\ Drive/1.\ Freelance\ Work/CH32V003\ Programming/CH32V003EVT/EVT/EXAM/SRC/Peripheral/src/ch32v00x_wwdg.c
	@	@	riscv-none-embed-gcc -march=rv32ecxw -mabi=ilp32e -msmall-data-limit=0 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Debug" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Core" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\I2C\I2C_EEPROM\User" -I"D:\Google Drive\1. Freelance Work\CH32V003 Programming\CH32V003EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@

