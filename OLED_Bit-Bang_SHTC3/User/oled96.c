#include "oled96.h"
#include "font1line.h"
#include "font2line.h"


void OledIoConfig(void)
{
	// IO Clock already enabled

	// Configure OLED IO Pins

    GPIO_InitTypeDef GPIO_InitStructure = {0};

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOD, ENABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC, ENABLE);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOC, &GPIO_InitStructure);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOD, &GPIO_InitStructure);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOD, &GPIO_InitStructure);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_5;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOD, &GPIO_InitStructure);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOD, &GPIO_InitStructure);

	SETPIN(OLED_CS_PORT, OLED_CS_PIN);// CS HIGH
	SETPIN(OLED_SCLK_PORT, OLED_SCLK_PIN);// CLK HIGH
	CLRPIN(OLED_RESET_PORT, OLED_RESET_PIN);// RESET LOW
	DELAY_OLED(10); //
	SETPIN(OLED_RESET_PORT, OLED_RESET_PIN);// RESET HIGH

	OledInit();
	OledSendCommand(0xA5); // DISPLAY OFF
	DELAY_OLED(100); // Delay
	OledSendCommand(0xA4); // DISPLAY ON
	DELAY_OLED(100); // Delay
	OledClearScreen(0xFF);

}

void OledInit(void)
{
    uint8_t oledConfig[24]  = {0xAE, 0x20, 0x00, 0x40, 0x81, 0xFF, 0xA0, 0xA7, 0xA8, 0x3F, 0xD3, 0x00, 0xD5, 0x10, 0xD9, 0x22, 0xDA, 0x12, 0xDB, 0x20, 0x8D, 0x14, 0x2E, 0xAF};   // Transmit buffer

    uint8_t x = 0;
    CLRPIN(OLED_CMD_SEL_PORT, OLED_CMD_SEL_PIN);// COMMAND - LOW
    CLRPIN(OLED_CS_PORT, OLED_CS_PIN);// CS LOW
    for(x = 0; x < 24; x++)
    {
        OledWriteSpiByte(oledConfig[x]);
    }
    SETPIN(OLED_CS_PORT, OLED_CS_PIN);// CS HIGH
    
}

void OledSendCommand(uint8_t command)
{
    CLRPIN(OLED_CMD_SEL_PORT, OLED_CMD_SEL_PIN);// COMMAND LOW
    CLRPIN(OLED_CS_PORT, OLED_CS_PIN);// CS LOW
    OledWriteSpiByte(command);
    SETPIN(OLED_CS_PORT, OLED_CS_PIN);// CS HIGH
}

void OledDisplayScreen(uint8_t *buffer)
{

	uint8_t i=0, j = 0;
	uint32_t offset = 0;

	for(i=0;i<0x08;i++)
	{
		offset = i * 128;
		OledSetPageAddress(i);
		OledSetColumnAddress(0x00);

		CLRPIN(OLED_CS_PORT, OLED_CS_PIN);// CS LOW

		SETPIN(OLED_CMD_SEL_PORT, OLED_CMD_SEL_PIN);// COMMAND - HIGH (DATA)
		for(j=0;j<0x80;j++)
		{
			OledWriteSpiByte(~buffer[offset+j]);
		}
		//HAL_GPIO_WritePin(OLED_CS_PORT, OLED_CS_PIN, GPIO_PIN_SET); // CS HIGH
		SETPIN(OLED_CS_PORT, OLED_CS_PIN);// CS HIGH
	}
}

void OledWriteSpiByte(uint8_t byte)
{
    uint8_t count = 0;
    for(count = 0; count < 8; count++)
    {
        if(byte & (0x80 >> count))
        {
            SETPIN(OLED_MOSI_PORT, OLED_MOSI_PIN);
        }
        else
        {
            CLRPIN(OLED_MOSI_PORT, OLED_MOSI_PIN);
        }

        CLRPIN(OLED_SCLK_PORT, OLED_SCLK_PIN);
        //delay(2);//
        SETPIN(OLED_SCLK_PORT, OLED_SCLK_PIN);
        //delay(2);//
    }

}

void OledSetPageAddress(uint8_t page)
{
    CLRPIN(OLED_CMD_SEL_PORT, OLED_CMD_SEL_PIN);// COMMAND - LOW
    CLRPIN(OLED_CS_PORT, OLED_CS_PIN);// CS LOW
    OledWriteSpiByte(0xB0| page);
    SETPIN(OLED_CS_PORT, OLED_CS_PIN); // CS HIGH
}

void OledSetColumnAddress(uint8_t column)
{
    CLRPIN(OLED_CMD_SEL_PORT, OLED_CMD_SEL_PIN); // COMMAND - LOW
    CLRPIN(OLED_CS_PORT, OLED_CS_PIN); // CS LOW
    OledWriteSpiByte(column & 0x0F);
    OledWriteSpiByte(0x10 + (column>>4));
    SETPIN(OLED_CS_PORT, OLED_CS_PIN);// CS HIGH

}

void OledClearScreen(uint8_t data)
{
	uint8_t i=0, j = 0;
	for(i=0;i<0x08;i++)
	{
		OledSetPageAddress(i);
        OledSetColumnAddress(0x00);
        CLRPIN(OLED_CS_PORT, OLED_CS_PIN); // CS LOW
        SETPIN(OLED_CMD_SEL_PORT, OLED_CMD_SEL_PIN);// COMMAND - HIGH (DATA)
        for(j=0;j<0x80;j++)
		{
		    OledWriteSpiByte(data);
		}
        SETPIN(OLED_CS_PORT, OLED_CS_PIN); // CS HIGH
	}
    
}

void OledPutChar(uint8_t line, uint8_t startingColumn, char characterToPrint, uint8_t dataLength)
{
	uint8_t loop = 0;
	OledSetPageAddress(line);
	OledSetColumnAddress(startingColumn);
    
	SETPIN(OLED_CMD_SEL_PORT, OLED_CMD_SEL_PIN); // COMMAND - HIGH (DATA)
	CLRPIN(OLED_CS_PORT, OLED_CS_PIN); // CS LOW
	for(loop = 0; loop < dataLength; loop++)
	{
		OledWriteSpiByte(~AARR_GlcdFont_U8[characterToPrint][loop]);
	}
    SETPIN(OLED_CS_PORT, OLED_CS_PIN); // CS HIGH
}

void OledPutString(uint8_t line, uint8_t startingColumn, char* stringToPrint, uint8_t stringLength)
{
		while(stringLength)
		{
                OledPutChar(line, startingColumn, *stringToPrint, 6);
				startingColumn +=6;
				stringToPrint++;
				stringLength--;
		}
        
}

void OledPutCharX(uint8_t line, uint8_t startingColumn, char characterToPrint, uint8_t dataLength)
{
	uint8_t loop = 0;
	uint32_t offset = 0;
	
	offset = (characterToPrint - 46) *23;
	
	OledSetPageAddress(line);
	OledSetColumnAddress(startingColumn);
    
    SETPIN(OLED_CMD_SEL_PORT, OLED_CMD_SEL_PIN);// COMMAND - HIGH (DATA)
    CLRPIN(OLED_CS_PORT, OLED_CS_PIN); // CS LOW
	for(loop = 1; loop < dataLength; loop++)
	{
		OledWriteSpiByte(~FCalibri11x15[offset + loop]);
		loop++;
	}
    SETPIN(OLED_CS_PORT, OLED_CS_PIN); // CS HIGH

	OledSetPageAddress(line+1);
	OledSetColumnAddress(startingColumn);

    SETPIN(OLED_CMD_SEL_PORT, OLED_CMD_SEL_PIN);// COMMAND - HIGH (DATA)
    CLRPIN(OLED_CS_PORT, OLED_CS_PIN); // CS LOW
	for(loop = 2; loop < dataLength; loop++)
	{
		OledWriteSpiByte(~FCalibri11x15[offset + loop]);
		loop++;
	}
    SETPIN(OLED_CS_PORT, OLED_CS_PIN); // CS HIGH

}

void OledPutCharXF(uint8_t line, uint8_t startingColumn, char characterToPrint, uint8_t dataLength)
{
	uint8_t loop = 0;
	uint32_t offset = 0;

	offset = (characterToPrint - 46) *23;

	OledSetPageAddress(line);
	OledSetColumnAddress(startingColumn);

    SETPIN(OLED_CMD_SEL_PORT, OLED_CMD_SEL_PIN);// COMMAND - HIGH (DATA)
    CLRPIN(OLED_CS_PORT, OLED_CS_PIN);// CS LOW
	for(loop = 1; loop < dataLength; loop++)
	{
		OledWriteSpiByte(FCalibri11x15[offset + loop]);
		loop++;
	}
    SETPIN(OLED_CS_PORT, OLED_CS_PIN);// CS HIGH
    
	OledSetPageAddress(line+1);
	OledSetColumnAddress(startingColumn);
    
    SETPIN(OLED_CMD_SEL_PORT, OLED_CMD_SEL_PIN);// COMMAND - HIGH (DATA)
    CLRPIN(OLED_CS_PORT, OLED_CS_PIN);// CS LOW
	for(loop = 2; loop < dataLength; loop++)
	{
		OledWriteSpiByte(FCalibri11x15[offset + loop]);
		loop++;
	}
    SETPIN(OLED_CS_PORT, OLED_CS_PIN);// CS HIGH
	
}

void OledPutChar2Line(uint8_t line, uint8_t startingColumn, char characterToPrint, uint8_t dataLength)
{
	uint8_t loop = 0;
	uint32_t offset = 0;

	offset = (characterToPrint) * 20;

	OledSetPageAddress(line);
	OledSetColumnAddress(startingColumn);

	SETPIN(OLED_CMD_SEL_PORT, OLED_CMD_SEL_PIN);// COMMAND - HIGH (DATA)
	CLRPIN(OLED_CS_PORT, OLED_CS_PIN);// CS LOW
	for(loop = 0; loop < dataLength; loop++)
	{
		OledWriteSpiByte(~Impact10x15[offset + loop]);
		loop++;
	}
    SETPIN(OLED_CS_PORT, OLED_CS_PIN);// CS HIGH

	OledSetPageAddress(line+1);
	OledSetColumnAddress(startingColumn);

	SETPIN(OLED_CMD_SEL_PORT, OLED_CMD_SEL_PIN);// COMMAND - HIGH (DATA)
	CLRPIN(OLED_CS_PORT, OLED_CS_PIN);// CS LOW
	for(loop = 1; loop < dataLength; loop++)
	{
		OledWriteSpiByte(~Impact10x15[offset + loop]);
		loop++;
	}
    SETPIN(OLED_CS_PORT, OLED_CS_PIN);// CS HIGH

}

void OledPutChar2LineF(uint8_t line, uint8_t startingColumn, char characterToPrint, uint8_t dataLength)
{
	uint8_t loop = 0;
	uint32_t offset = 0;

	offset = (characterToPrint) * 20;

	OledSetPageAddress(line);
	OledSetColumnAddress(startingColumn);

    SETPIN(OLED_CMD_SEL_PORT,OLED_CMD_SEL_PIN);// COMMAND - HIGH (DATA)
    CLRPIN(OLED_CS_PORT,OLED_CS_PIN);// CS LOW
	for(loop = 0; loop < dataLength; loop++)
	{
		OledWriteSpiByte(Impact10x15[offset + loop]);
		loop++;
	}

    SETPIN(OLED_CS_PORT,OLED_CS_PIN);// CS HIGH

	OledSetPageAddress(line+1);
	OledSetColumnAddress(startingColumn);

	SETPIN(OLED_CMD_SEL_PORT,OLED_CMD_SEL_PIN);// COMMAND - HIGH (DATA)

	CLRPIN(OLED_CS_PORT,OLED_CS_PIN);// CS LOW
	for(loop = 1; loop < dataLength; loop++)
	{
		OledWriteSpiByte(Impact10x15[offset + loop]);
		loop++;
	}

    SETPIN(OLED_CS_PORT,OLED_CS_PIN);// CS HIGH

}

void OledPutCharXX(uint8_t line, uint8_t startingColumn, char characterToPrint, uint8_t dataLength)
{
	uint8_t loop = 0;
	uint32_t offset = 0;
	
	offset = (characterToPrint - 45) * 42;

	OledSetPageAddress(line);
	OledSetColumnAddress(startingColumn);
    
    SETPIN(OLED_CMD_SEL_PORT, OLED_CMD_SEL_PIN); // COMMAND - HIGH (DATA)
    CLRPIN(OLED_CS_PORT, OLED_CS_PIN); // CS LOW
	for(loop = 0; loop < dataLength; loop++)
	{
		OledWriteSpiByte(~Impact14x24[offset + loop]);
		loop+=2;
	}
    SETPIN(OLED_CS_PORT, OLED_CS_PIN); // CS HIGH
    
	OledSetPageAddress(line+1);
	OledSetColumnAddress(startingColumn);
    
    SETPIN(OLED_CMD_SEL_PORT, OLED_CMD_SEL_PIN); // COMMAND - HIGH (DATA)
    CLRPIN(OLED_CS_PORT, OLED_CS_PIN); // CS LOW
	for(loop = 1; loop < dataLength; loop++)
	{
		OledWriteSpiByte(~Impact14x24[offset + loop]);
		loop+=2;
	}
    SETPIN(OLED_CS_PORT, OLED_CS_PIN); // CS HIGH
    
    OledSetPageAddress(line+2);
	OledSetColumnAddress(startingColumn);
    
    SETPIN(OLED_CMD_SEL_PORT, OLED_CMD_SEL_PIN); // COMMAND - HIGH (DATA)
    CLRPIN(OLED_CS_PORT, OLED_CS_PIN); // CS LOW
	for(loop = 2; loop < dataLength; loop++)
	{
		OledWriteSpiByte(~Impact14x24[offset + loop]);
		loop+=2;
	}
    SETPIN(OLED_CS_PORT, OLED_CS_PIN); // CS HIGH
	
}

/* Example Code
	//MCU Clock need to set
	//GPIO Clock need to be set
	
	OledIoConfig();  // Configure IO used for OLED Display Interface
  	

	While(1)
	{
		OledPutString(0, 0, "PALLAV", 6); 
	}
*/
