#include "ch32v00x_conf.h"
#include "ch32v00x_gpio.h"
#include "debug.h"

//MACROS for the Pins used for OLED SPI interface
#define OLED_CS_PORT    	GPIOC
#define OLED_CS_PIN     	GPIO_Pin_0
#define OLED_CMD_SEL_PORT  	GPIOD
#define OLED_CMD_SEL_PIN   	GPIO_Pin_5
#define OLED_MOSI_PORT  	GPIOD
#define OLED_MOSI_PIN   	GPIO_Pin_4
#define OLED_SCLK_PORT  	GPIOD
#define OLED_SCLK_PIN   	GPIO_Pin_6
#define OLED_RESET_PORT 	GPIOD
#define OLED_RESET_PIN  	GPIO_Pin_0

#define COMMAND 			0
#define DATA 				1

#define SCREEN_FILL			0x00
#define SCREEN_CLEAR		0xFF

#define DELAY				10

/*********************************************************
 *  Define these macro to call MCU specific functions for GPIO SET high or Low
 */
#define SETPIN(PORT, PIN)   GPIO_SetBits(PORT, PIN);
#define CLRPIN(PORT, PIN)   GPIO_ResetBits(PORT, PIN);
#define DELAY_OLED(MSEC)    Delay_Ms(MSEC);


//******************************************************************************
/// Initialize all the GPIOs used for OLEDInterface
/// Calls OledInit function for basic initialization of the display
/// @param[in]    Nothing
/// @retval       Nothing
void OledIoConfig(void);

//******************************************************************************
/// Initialize the OLED Display using initialization sequence
/// @param[in]    Nothing
/// @retval       Nothing
void OledInit(void);

//******************************************************************************
/// Send Command to OLED Display
/// @param[in]    command		command byte to be sent
/// @retval       Nothing
void OledSendCommand(uint8_t command);

//******************************************************************************
/// Send SPI byte on OLED SPI(GPIO) Interface
/// @param[in]    byte			SPI data to be sent to the display
/// @retval       Nothing
void OledWriteSpiByte(uint8_t byte);

//******************************************************************************
/// Clears the OLED Screen with Fill(0x00) or Clear(0xFF).
/// @param[in]    data (Fill - 0x00, Clear - 0xFF, 0x01-0xFE - for any pattern)
/// @retval       Nothing
void OledClearScreen(uint8_t data);

//******************************************************************************
/// Set Page Address for OLED Display (used to address the line).
/// In a 128x64 OLED Display, there are 8 pages, one per line (0-7)
/// @param[in]    command	
/// @retval       Nothing
void OledSetPageAddress(uint8_t page);

//******************************************************************************
/// Set Page Address for OLED Display (used to address the line).
/// In a 128x64 OLED Display, there are 128 columns (0-127)
/// @param[in]    command
/// @retval       Nothing
void OledSetColumnAddress(uint8_t column);

//******************************************************************************
/// Put character on OLED display (font1line)
/// In a 128x64 OLED Display, there are 128 columns (0-127)
/// @param[in]    line				line address of the display	
/// @param[in]    startingColumn	starting column of the display
/// @param[in]    characterToPrint	character ASCII Value
/// @param[in]    dataLength		no of bytes( as per the font used)
/// @retval       Nothing
void OledPutChar(uint8_t line, uint8_t startingColumn, char characterToPrint, uint8_t dataLength);

//******************************************************************************
/// Put string on OLED display (Fonts used are in font1line / font2line)
/// In a 128x64 OLED Display, there are 128 columns (0-127)
/// @param[in]    line				line address of the display	
/// @param[in]    startingColumn	starting column of the display
/// @param[in]    stringToPrint		Pointer to the string
/// @param[in]    stringLength		length of the string
/// @retval       Nothing
void OledPutString(uint8_t line, uint8_t startingColumn, char* stringToPrint, uint8_t stringLength);
void OledPutCharX(uint8_t line, uint8_t startingColumn, char characterToPrint, uint8_t dataLength);
void OledPutCharXF(uint8_t line, uint8_t startingColumn, char characterToPrint, uint8_t dataLength);
void OledPutChar2Line(uint8_t line, uint8_t startingColumn, char characterToPrint, uint8_t dataLength);
void OledPutChar2LineF(uint8_t line, uint8_t startingColumn, char characterToPrint, uint8_t dataLength);
void OledPutCharXX(uint8_t line, uint8_t startingColumn, char characterToPrint, uint8_t dataLength);
