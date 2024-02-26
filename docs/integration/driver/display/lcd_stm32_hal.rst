======================================================================================================================================================================
LCD driver SPI bus I/O implementation example for STM32 devices using the STM32Cube HAL SPI driver（STM32Cube HAL SPI驱动程序用于STM32设备的LCD驱动器SPI总线I/O实现示例）
======================================================================================================================================================================

.. raw:: html

   <details>
     <summary>显示原文</summary>

This is an example implementation of an SPI bus driver using STM32CubeIDE and the ST HAL libraries, tested on a Nucleo-F746ZG board. This code example only implements
the LCD driver specific parts, so you still have to configure the hardware using STM32CubeMX or STM32CubeIDE. It is not meant as the best possible implementation,
but since it uses DMA for the pixel transfer, it has a good performance.

To use this code without change you need to name the appropriate GPIO pins as follows:

.. code:: c

	LCD_RESET	/* Reset */
	LCD_CS		/* Chip Select */
	LCD_DCX		/* Data/Command Select */

The example code uses the SPI1 port. The SPI controller of the STM32F746 is capable of 16-bit transfers, and it can swap the 16-bit pixel data bytes on the fly, so
there is no need to do this in software. This improves the performance considerably.

This code implements a rather simple locking mechanism using a global variable :cpp:var:`my_disp_bus_busy` to prevent accessing the controller while there is a DMA transfer
going on in the background. In a more sophisticated implementation this could be replaced with a semaphore or a transaction queue.

.. code:: c

	#include "stm32f7xx_hal.h"
	#include "lvgl.h"
	
	...
	
	lv_display_t *my_disp;
	volatile int my_disp_bus_busy = 0;

	...
	
	/* DMA transfer ready callback */
	static void my_lcd_color_transfer_ready_cb(SPI_HandleTypeDef *hspi)
	{
		/* CS high */
		HAL_GPIO_WritePin(LCD_CS_GPIO_Port, LCD_CS_Pin, GPIO_PIN_SET);
		my_disp_bus_busy = 0;
		lv_display_flush_ready(my_disp);
	}

	/* Initialize LCD I/O bus, reset LCD */
	static int32_t my_lcd_io_init(void)
	{
		/* Register SPI Tx Complete Callback */
		HAL_SPI_RegisterCallback(&hspi1, HAL_SPI_TX_COMPLETE_CB_ID, stm32_lcd_color_transfer_ready_cb);

		/* reset LCD */
		HAL_GPIO_WritePin(LCD_RESET_GPIO_Port, LCD_RESET_Pin, GPIO_PIN_RESET);
		HAL_Delay(100);
		HAL_GPIO_WritePin(LCD_RESET_GPIO_Port, LCD_RESET_Pin, GPIO_PIN_SET);
		HAL_Delay(100);

		HAL_GPIO_WritePin(LCD_CS_GPIO_Port, LCD_CS_Pin, GPIO_PIN_SET);
		HAL_GPIO_WritePin(LCD_DCX_GPIO_Port, LCD_DCX_Pin, GPIO_PIN_SET);

		return HAL_OK;
	}

	/* Send short command to the LCD. This function shall wait until the transaction finishes. */
	static void my_lcd_send_cmd(lv_display_t *disp, const uint8_t *cmd, size_t cmd_size, const uint8_t *param, size_t param_size)
	{
		LV_UNUSED(disp);
		/* Set the SPI in 8-bit mode */
		hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
		HAL_SPI_Init(&hspi1);
		/* DCX low (command) */
		HAL_GPIO_WritePin(LCD_DCX_GPIO_Port, LCD_DCX_Pin, GPIO_PIN_RESET);
		/* CS low */
		HAL_GPIO_WritePin(LCD_CS_GPIO_Port, LCD_CS_Pin, GPIO_PIN_RESET);
		/* send command */
		if (HAL_SPI_Transmit(&hspi1, cmd, cmd_size, BUS_SPI1_POLL_TIMEOUT) == HAL_OK) {
			/* DCX high (data) */
			HAL_GPIO_WritePin(LCD_DCX_GPIO_Port, LCD_DCX_Pin, GPIO_PIN_SET);
			/* for short data blocks we use polling transfer */
			HAL_SPI_Transmit(&hspi1, (uint8_t *)param, (uint16_t)param_size, BUS_SPI1_POLL_TIMEOUT);
			/* CS high */
			HAL_GPIO_WritePin(LCD_CS_GPIO_Port, LCD_CS_Pin, GPIO_PIN_SET);
		}
	}

	/* Send large array of pixel data to the LCD. If necessary, this function has to do the byte-swapping. This function can do the transfer in the background. */
	static void my_lcd_send_color(lv_display_t *disp, const uint8_t *cmd, size_t cmd_size, uint8_t *param, size_t param_size)
	{
		LV_UNUSED(disp);
		while (my_disp_bus_busy);	/* wait until previous transfer is finished */
		/* Set the SPI in 8-bit mode */
		hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
		HAL_SPI_Init(&hspi1);
		/* DCX low (command) */
		HAL_GPIO_WritePin(LCD_DCX_GPIO_Port, LCD_DCX_Pin, GPIO_PIN_RESET);
		/* CS low */
		HAL_GPIO_WritePin(LCD_CS_GPIO_Port, LCD_CS_Pin, GPIO_PIN_RESET);
		/* send command */
		if (HAL_SPI_Transmit(&hspi1, cmd, cmd_size, BUS_SPI1_POLL_TIMEOUT) == HAL_OK) {
			/* DCX high (data) */
			HAL_GPIO_WritePin(LCD_DCX_GPIO_Port, LCD_DCX_Pin, GPIO_PIN_SET);
			/* for color data use DMA transfer */
			/* Set the SPI in 16-bit mode to match endianess */
			hspi1.Init.DataSize = SPI_DATASIZE_16BIT;
			HAL_SPI_Init(&hspi1);
			my_disp_bus_busy = 1;
			HAL_SPI_Transmit_DMA(&hspi1, param, (uint16_t)param_size / 2);

			/* NOTE: CS will be reset in the transfer ready callback */
		}
	}

.. raw:: html

   </details>
   <br>


这是一个使用STM32CubeIDE和ST HAL库实现SPI总线驱动程序的示例，测试于Nucleo-F746ZG开发板上。该代码示例仅实现了LCD驱动程序的特定部分，因此您仍需要使用STM32CubeMX或STM32CubeIDE配置硬件。它并不是最佳的实现方式，但由于使用了DMA进行像素传输，因此具有良好的性能。

要无需更改使用此代码，您需要将适当的GPIO引脚命名如下：

.. code:: c

	LCD_RESET	/* 复位引脚 */
	LCD_CS		/* 芯片选择引脚 */
	LCD_DCX		/* 数据/命令选择引脚 */

该示例代码使用SPI1端口。STM32F7的SPI控制器支持16位传输，并且可以实时交换16位像素数据字节，因此无需在软件中执行此操作。这大大提高了性能。

该代码实现了一种相当简单的锁定机制，使用一个全局变量 :cpp:var:`my_disp_bus_busy` 防止在后台进行DMA传输时访问控制器。在更复杂的实现中，可以将其替换为信号量或事务队列。

.. code:: c

	#include "stm32f7xx_hal.h"
	#include "lvgl.h"
	
	...
	
	lv_display_t *my_disp;
	volatile int my_disp_bus_busy = 0;

	...
	
	/* DMA传输就绪回调函数 */
	static void my_lcd_color_transfer_ready_cb(SPI_HandleTypeDef *hspi)
	{
		/* CS高电平 */
		HAL_GPIO_WritePin(LCD_CS_GPIO_Port, LCD_CS_Pin, GPIO_PIN_SET);
		my_disp_bus_busy = 0;
		lv_display_flush_ready(my_disp);
	}

	/* 初始化LCD I/O总线，复位LCD */
	static int32_t my_lcd_io_init(void)
	{
		/* 注册SPI Tx完成回调函数 */
		HAL_SPI_RegisterCallback(&hspi1, HAL_SPI_TX_COMPLETE_CB_ID, stm32_lcd_color_transfer_ready_cb);

		/* 复位LCD */
		HAL_GPIO_WritePin(LCD_RESET_GPIO_Port, LCD_RESET_Pin, GPIO_PIN_RESET);
		HAL_Delay(100);
		HAL_GPIO_WritePin(LCD_RESET_GPIO_Port, LCD_RESET_Pin, GPIO_PIN_SET);
		HAL_Delay(100);

		HAL_GPIO_WritePin(LCD_CS_GPIO_Port, LCD_CS_Pin, GPIO_PIN_SET);
		HAL_GPIO_WritePin(LCD_DCX_GPIO_Port, LCD_DCX_Pin, GPIO_PIN_SET);

		return HAL_OK;
	}

	/* 向LCD发送短命令。此函数将等待事务完成。 */
	static void my_lcd_send_cmd(lv_display_t *disp, const uint8_t *cmd, size_t cmd_size, const uint8_t *param, size_t param_size)
	{
		LV_UNUSED(disp);
		/* 设置SPI为8位模式 */
		hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
		HAL_SPI_Init(&hspi1);
		/* DCX低电平（命令） */
		HAL_GPIO_WritePin(LCD_DCX_GPIO_Port, LCD_DCX_Pin, GPIO_PIN_RESET);
		/* CS低电平 */
		HAL_GPIO_WritePin(LCD_CS_GPIO_Port, LCD_CS_Pin, GPIO_PIN_RESET);
		/* 发送命令 */
		if (HAL_SPI_Transmit(&hspi1, cmd, cmd_size, BUS_SPI1_POLL_TIMEOUT) == HAL_OK) {
			/* DCX高电平（数据） */
			HAL_GPIO_WritePin(LCD_DCX_GPIO_Port, LCD_DCX_Pin, GPIO_PIN_SET);
			/* 对于短数据块，我们使用轮询传输 */
			HAL_SPI_Transmit(&hspi1, (uint8_t *)param, (uint16_t)param_size, BUS_SPI1_POLL_TIMEOUT);
			/* CS高电平 */
			HAL_GPIO_WritePin(LCD_CS_GPIO_Port, LCD_CS_Pin, GPIO_PIN_SET);
		}
	}

	/* 向LCD发送大量像素数据数组。必要时，此函数必须进行字节交换。此函数可以在后台进行传输。 */
	static void my_lcd_send_color(lv_display_t *disp, const uint8_t *cmd, size_t cmd_size, uint8_t *param, size_t param_size)
	{
		LV_UNUSED(disp);
		while (my_disp_bus_busy);	/* 等待上一个传输完成 */
		/* 设置SPI为8位模式 */
		hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
		HAL_SPI_Init(&hspi1);
		/* DCX低电平（命令） */
		HAL_GPIO_WritePin(LCD_DCX_GPIO_Port, LCD_DCX_Pin, GPIO_PIN_RESET);
		/* CS低电平 */
		HAL_GPIO_WritePin(LCD_CS_GPIO_Port, LCD_CS_Pin, GPIO_PIN_RESET);
		/* 发送命令 */
		if (HAL_SPI_Transmit(&hspi1, cmd, cmd_size, BUS_SPI1_POLL_TIMEOUT) == HAL_OK) {
			/* DCX高电平（数据） */
			HAL_GPIO_WritePin(LCD_DCX_GPIO_Port, LCD_DCX_Pin, GPIO_PIN_SET);
			/* 对于彩色数据，使用DMA传输 */
			/* 设置SPI为16位模式以匹配字节序 */
			hspi1.Init.DataSize = SPI_DATASIZE_16BIT;
			HAL_SPI_Init(&hspi1);
			my_disp_bus_busy = 1;
			HAL_SPI_Transmit_DMA(&hspi1, param, (uint16_t)param_size / 2);

			/* 注意：在传输就绪回调函数中将复位CS引脚 */
		}
	}

