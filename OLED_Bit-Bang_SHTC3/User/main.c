/********************************** (C) COPYRIGHT *******************************
 * File Name          : main.c
 * Author             : WCH
 * Version            : V1.0.0
 * Date               : 2022/08/08
 * Description        : Main program body.
 *********************************************************************************
 * Copyright (c) 2021 Nanjing Qinheng Microelectronics Co., Ltd.
 * Attention: This software (modified or not) and binary are used for 
 * microcontroller manufactured by Nanjing Qinheng Microelectronics.
 *******************************************************************************/

/*
 *@Note
 *This example code reads temperature and humidity reading from Sensirion's SHTC3 sensor and displays on the OLED display
 *OLED Display is connect to CH32V003 MCU via GPIOs and SPI is generated using Big-banging for this example
 */

#include "debug.h"
#include "oled96.h"

uint32_t T1 = 0;
uint32_t H1 = 0;

void IIC_Init(u32 bound, u16 address)
{
    GPIO_InitTypeDef GPIO_InitStructure={0};
    I2C_InitTypeDef I2C_InitTSturcture={0};

    RCC_APB2PeriphClockCmd( RCC_APB2Periph_GPIOC | RCC_APB2Periph_AFIO, ENABLE );
    RCC_APB1PeriphClockCmd( RCC_APB1Periph_I2C1, ENABLE );

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_OD;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init( GPIOC, &GPIO_InitStructure );

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_1;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_OD;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init( GPIOC, &GPIO_InitStructure );

    I2C_InitTSturcture.I2C_ClockSpeed = bound;
    I2C_InitTSturcture.I2C_Mode = I2C_Mode_I2C;
    I2C_InitTSturcture.I2C_DutyCycle = I2C_DutyCycle_2;
    I2C_InitTSturcture.I2C_OwnAddress1 = address;
    I2C_InitTSturcture.I2C_Ack = I2C_Ack_Enable;
    I2C_InitTSturcture.I2C_AcknowledgedAddress = I2C_AcknowledgedAddress_7bit;
    I2C_Init( I2C1, &I2C_InitTSturcture );

    I2C_Cmd( I2C1, ENABLE );

    I2C_AcknowledgeConfig( I2C1, ENABLE );
}

//Send two bytes wakeup command to the sensor
void SHTC3Wakeup(uint8_t deviceAddress)
{
    while( I2C_GetFlagStatus( I2C1, I2C_FLAG_BUSY ) != RESET );
    I2C_GenerateSTART( I2C1, ENABLE );

    while( !I2C_CheckEvent( I2C1, I2C_EVENT_MASTER_MODE_SELECT ) );
    I2C_Send7bitAddress( I2C1, (deviceAddress << 1), I2C_Direction_Transmitter );

    while( !I2C_CheckEvent( I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED ) );


    I2C_SendData( I2C1, (u8)(0x35) );
    while( !I2C_CheckEvent( I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED ) );

    I2C_SendData( I2C1, (u8)(0x17) );
    while( !I2C_CheckEvent( I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED ) );


    I2C_GenerateSTOP( I2C1, ENABLE );
}

//Send two byte command to Sensor that Temperature Data should come First, Clock stretching should be Enabled
void SHTC3MeasureCMDTFCE(uint8_t deviceAddress)
{
    while( I2C_GetFlagStatus( I2C1, I2C_FLAG_BUSY ) != RESET );
    I2C_GenerateSTART( I2C1, ENABLE );

    while( !I2C_CheckEvent( I2C1, I2C_EVENT_MASTER_MODE_SELECT ) );
    I2C_Send7bitAddress( I2C1, (deviceAddress << 1), I2C_Direction_Transmitter );

    while( !I2C_CheckEvent( I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED ) );

    I2C_SendData( I2C1, (u8)(0x78) );
    while( !I2C_CheckEvent( I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED ) );

    I2C_SendData( I2C1, (u8)(0x66) );
    while( !I2C_CheckEvent( I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED ) );

    I2C_GenerateSTOP( I2C1, ENABLE );

}


void I2CReadBytes(uint8_t deviceAddress, uint8_t *dataBuffer, uint16_t length)
{
    I2C_GenerateSTART( I2C1, ENABLE );
    while( !I2C_CheckEvent( I2C1, I2C_EVENT_MASTER_MODE_SELECT ) );

    I2C_Send7bitAddress( I2C1, deviceAddress<<1, I2C_Direction_Receiver );

    while( !I2C_CheckEvent( I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED ) );
    I2C_AcknowledgeConfig( I2C1, ENABLE );
    //length--;
    while(length)
    {
        if( I2C_GetFlagStatus( I2C1, I2C_FLAG_RXNE ) !=  RESET )
        {
            dataBuffer[0] = I2C_ReceiveData( I2C1 );
            dataBuffer++;
            length--;
            if(length ==1) I2C_AcknowledgeConfig( I2C1, DISABLE );
        }
    }
    I2C_GenerateSTOP( I2C1, ENABLE );


}



/*********************************************************************
 * @fn      main
 *
 * @brief   Main program.
 *
 * @return  none
 */
int main(void)
{
    uint8_t data[10] = {0};
    uint8_t tDigit[3] = {0};
    uint8_t hDigit[3] = {0};

    SystemCoreClockUpdate();
    Delay_Init();

    IIC_Init( 50000, 0x70);

    OledIoConfig();  // Configure IO used for OLED Display Interface


    while(1)
    {
        //OledPutString(0, 0, "PALLAV", 6);
        //OledPutChar2Line(0, 0, '0'-32, 20);
        //OledPutChar2Line(0, 10, '1'-32, 20);
        //OledPutChar2Line(0, 20, '2'-32, 20);
        //OledPutChar2Line(0, 30, '3'-32, 20);

        SHTC3Wakeup(0x70);
        Delay_Ms(1);

        SHTC3MeasureCMDTFCE(0x70);
        Delay_Ms(50);

        I2CReadBytes(0x70, data, 6);

        T1 = (((data[0]*256 + data[1]) * 1750)/65536)-450;
        tDigit[0] = (T1/100)%10;
        tDigit[1] = (T1/10)%10;
        tDigit[2] = (T1%10);

        H1 = ((data[3]*256 + data[4])*1000)/65536;
        hDigit[0] = (H1/100)%10;
        hDigit[1] = (H1/10)%10;
        hDigit[2] = (H1%10);

        OledPutCharXX(0,  0, 'B', 42);
        OledPutCharXX(0, 16, '-', 42);
        OledPutCharXX(0, 40, tDigit[0]+48, 42);
        OledPutCharXX(0, 56, tDigit[1]+48, 42);
        OledPutCharXX(0, 72, '.', 42);
        OledPutCharXX(0, 80, tDigit[2]+48, 42);
        OledPutCharXX(0, 95, 58, 42);
        OledPutCharXX(0, 105, ';', 42);

        OledPutCharXX(3,  0, '=', 42);
        OledPutCharXX(3, 16, '-', 42);
        OledPutCharXX(3, 40, hDigit[0]+48, 42);
        OledPutCharXX(3, 56, hDigit[1]+48, 42);
        OledPutCharXX(3, 72, '.', 42);
        OledPutCharXX(3, 80, hDigit[2]+48, 42);
        OledPutCharXX(3, 96, '>', 42);

        Delay_Ms(1000);
    }

}
