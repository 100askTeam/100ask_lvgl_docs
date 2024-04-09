.. _lcd_stm32_guide:

================================================================================================================================
Step-by-step Guide: How to use the LVGL v9 LCD drivers with STM32 devices（分步指南：如何将LVGL v9 LCD驱动程序与STM32设备一起使用）
================================================================================================================================

Introduction（介绍）
--------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

This guide is intended to be a step-by-step instruction of how to configure the STM32Cube HAL with the new TFT-LCD display drivers introduced in LVGL v9.0. The example code has been tested on the STM32F746-based Nucleo-F746ZG board with an ST7789-based LCD panel connected via SPI. The application itself and the hardware configuration code were generated with the STM32CubeIDE 1.14.0 tool.

.. tip::
	ST Micro provide their own TFT-LCD drivers in their X-CUBE-DISPLAY Software Extension Package. While these drivers can be used with LVGL as well, the LVGL LCD drivers do not depend on this package.
	
	The LVGL LCD drivers are meant as an alternative, simple to use API to implement LCD support for your LVGL-based project on any platform. Moreover, even in the initial release we support more LCD controllers than X-CUBE-DISPLAY currently provides, and we plan to add support for even more LCD controllers in the future.
	
	Please note however, that – unlike X-CUBE-DISPLAY – the LVGL LCD drivers do not implement the communication part, whether SPI, parallel i8080 bus or other. It is the user's responsibility to implement – and optimize – these on their chosen platform. LVGL will only provide examples for the most popular platforms.

By following the steps you will have a fully functional program, which can be used as the foundation of your own LVGL-based project. If you are in a hurry and not interested in the details, you can find the final project `here <https://github.com/lvgl/lv_port_lcd_stm32>`__. You will only need to configure LVGL to use the driver corresponding to your hardware (if it is other than the ST7789), and implement the function ``ui_init()`` to create your widgets.

.. note::

	This example is not meant as the best possible implementation, or the recommended solution. It relies solely on the HAL drivers provided by ST Micro, which favor portability over performance. Despite of this the performance is very good, thanks to the efficient, DMA-based implementation of the drivers.

.. note::

	Although the example uses FreeRTOS, this is not a strict requirement with the LVGL LCD display drivers.
	
You can find the source code snippets of this guide in the `lv_port_lcd_stm32_template.c <https://github.com/lvgl/lvgl/examples/porting/lv_port_lcd_stm32_template.c>`__ example.

.. raw:: html

   </details>
   <br>


本指南旨在逐步说明如何使用 LVGL v9.0 中引入的新 TFT-LCD 显示驱动程序配置 STM32Cube HAL。示例代码已在基于 STM32F746 的 Nucleo-F746ZG 板上进行了测试，并通过 SPI 连接了基于 ST7789 的 LCD 面板。应用程序本身和硬件配置代码是使用 STM32CubeIDE 1.14.0 工具生成的。

.. 提示::
	ST Micro 在其 X-CUBE-DISPLAY 软件扩展包中提供了自己的 TFT-LCD 驱动程序。虽然这些驱动程序也可以与 LVGL 一起使用，但 LVGL LCD 驱动程序不依赖于该包。

	LVGL LCD 驱动程序旨在作为一种易于使用的 API 替代方案，为任何平台上基于 LVGL 的项目实现 LCD 支持。此外，即使在最初的版本中，我们支持的 LCD 控制器也比 X-CUBE-DISPLAY 目前提供的更多，并且我们计划在未来添加对更多 LCD 控制器的支持。

	但请注意，与 X-CUBE-DISPLAY 不同的是，LVGL LCD 驱动程序不实现通信部分，无论是 SPI、并行 i8080 总线还是其他总线。用户有责任在他们选择的平台上实施并优化这些内容。LVGL 将仅提供最流行平台的示例。

通过执行以下步骤，您将拥有一个功能齐全的程序，该程序可以用作您自己的基于 LVGL 的项目的基础。如果您赶时间并且对细节不感兴趣，您可以在 `这里 <https://github.com/lvgl/lv_port_lcd_stm32>`__ 找到最终项目。您只需配置 LVGL 即可使用与您的硬件相对应的驱动程序（如果不是 ST7789），并实现 ``ui_init()`` 创建小部件的功能。

.. 注释::
	此示例并不意味着最好的实现或推荐的解决方案。它仅依赖于 ST Micro 提供的 HAL 驱动程序，该驱动程序更注重可移植性而不是性能。尽管如此，由于驱动程序基于 DMA 的高效实现，性能仍然非常好。
	
.. 注释::
	尽管该示例使用 FreeRTOS，但这并不是 LVGL LCD 显示驱动程序的严格要求。

您可以在 `lv_port_lcd_stm32_template.c <https://github.com/lvgl/lvgl/examples/porting/lv_port_lcd_stm32_template.c>`__  示例中找到本指南的源代码片段。


Hardware configuration（硬件配置）
----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

In this example we'll use the SPI1 peripheral to connect the microcontroller to the LCD panel. Besides the hardware-controlled SPI pins SCK and MOSI we need some additional output pins for the chip select, command/data select, and LCD reset:

.. raw:: html

   </details>
   <br>


在此示例中，我们将使用 SPI1 外设将微控制器连接到 LCD 面板。除了硬件控制的 SPI 引脚 SCK 和 MOSI 之外，我们还需要一些额外的输出引脚用于片选、命令/数据选择和 LCD 复位：


==== ============= ======= ==========
pin  configuration LCD     user label
==== ============= ======= ==========
PA4  GPIO_Output   CS	   LCD_CS
PA5  SPI1_SCK	   SCK	   --
PA7  SPI1_MOSI	   SDI     --
PA15 GPIO_Output   RESET   LCD_RESET
PB10 GPIO_Output   DC      LCD_DCX
==== ============= ======= ==========

Step-by-step instructions（分步说明）
-------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

#. Create new project in File/New/STM32 Project.
#. Select target processor/board.
#. Set project name and location.
#. Set Targeted Project Type to STM32Cube and press Finish.
#. Say "Yes" to Initialize peripherals with their default Mode? After the project is created, the configuration file (.ioc) is opened automatically.
#. Switch to the Pinout & Configuration tab.
#. In the System Core category switch to RCC.
#. Set High Speed Clock to "BYPASS Clock Source", and Low Speed Clock to "Crystal/Ceramic Resonator".
#. In the System Core category select SYS, and set Timebase Source to other than SysTick (in our example, TIM2).
#. Switch to the Clock Configuration tab.
#. Set the HCLK clock frequency to the maximum value (216 MHz for the STM32F746).
#. Switch back to the Pinout & Configuration tab, and in the Middleware and Software Packs category select FREERTOS.
#. Select Interface: CMSIS_V1.
#. In the Advanced Settings tab enable USE_NEWLIB_REENTRANT. We are finished here.
#. In the Pinout view configure PA5 as SPI1_SCK, PA7 as SPI1_MOSI (right click the pin and select the function).
#. In the Pinout & Configuration/Connectivity category select SPI1.
#. Set Mode to Transmit Only Master, and Hardware NSS Signal to Disable.
#. In the Configuration subwindow switch to Parameter Settings.
#. Set Frame Format to Motorola, Data Size to 8 Bits, First Bit to MSB First.
#. Set the Prescaler to the maximum value according to the LCD controller’s datasheet (e.g., 15 MBits/s). Set CPOL/CPHA as required (leave as default).
#. Set NSSP Mode to Disabled and NSS Signal Type to Software.
#. In DMA Settings add a new Request for SPI1_TX (when using SPI1).
#. Set Priority to Medium, Data Width to Half Word.
#. In NVIC Settings enable SPI1 global interrupt.
#. In GPIO Settings set SPI1_SCK to Pull-down and Very High output speed and set the User Label to ``LCD_SCK``.
#. Set SPI1_MOSI to Pull-up and Very High, and name it ``LCD_SDI``.
#. Select System Core/GPIO category. In the Pinout view configure additional pins for chip select, reset and command/data select. Name them ``LCD_CS``, ``LCD_RESET`` and ``LCD_DCX``, respectively. Configure them as GPIO Output. (In this example we will use PA4 for ``LCD_CS``, PA15 for ``LCD_RESET`` and PB10 for ``LCD_DCX``.)
#. Set ``LCD_CS`` to No pull-up and no pull-down, Low level and Very High speed.
#. Set ``LCD_RESET`` to Pull-up and High level.
#. Set ``LCD_DCX`` to No pull-up and no pull-down, High level and Very High speed.
#. Open the Project Manager tab, and select Advanced Settings. On the right hand side there is a Register Callback window. Select SPI and set it to ENABLE.
#. We are ready with the hardware configuration. Save the configuration and let STM32Cube generate the source.
#. In the project tree clone the LVGL repository into the Middlewares/Third_Party folder (this tutorial uses the release/v9.0 branch of LVGL):
	
	.. code:: dosbatch
	
		git clone https://github.com/lvgl/lvgl.git -b release/v9.0
	
#. Cloning should create an 'lvgl' subfolder inside the 'Third_Party' folder. From the 'lvgl' folder copy 'lv_conf_template.h' into the 'Middlewares' folder, and rename it to 'lv_conf.h'. Refresh the project tree.
#. Open 'lv_conf.h', and in line 15 change ``#if 0`` to ``#if 1``.
#. Search for the string ``LV_USE_ST7735``, and enable the appropriate LCD driver by setting its value to 1. This example uses the ST7789 driver:

	.. code:: c
	
		#define LV_USE_ST7789		1
	
#. Right click the folder 'Middlewares/Third_Party/lvgl/tests', select Resource Configurations/Exclude from Build..., check both Debug and Release, then press OK.
#. Right click the project name and select "Properties". In the C/C++ Build/Settings panel select MCU GCC Compiler/Include paths. In the Configuration dropdown select [ All configurations ]. Add the following Include path:

	.. code:: c
	
		../Middlewares/Third_Party/lvgl
		
#. Open Core/Src/stm32xxx_it.c (the file name depends on the processor variation). Add 'lv_tick.h' to the Private includes section:

	.. code:: c
	
		/* Private includes ----------------------------------------------------------*/
		/* USER CODE BEGIN Includes */
		#include "./src/tick/lv_tick.h"
		/* USER CODE END Includes */

#. Find the function ``TIM2_IRQHandler``. Add a call to ``lv_tick_inc()``:

	.. code:: c

		void TIM2_IRQHandler(void)
		{
		  /* USER CODE BEGIN TIM2_IRQn 0 */

		  /* USER CODE END TIM2_IRQn 0 */
		  HAL_TIM_IRQHandler(&htim2);
		  /* USER CODE BEGIN TIM2_IRQn 1 */
		  lv_tick_inc(1);
		  /* USER CODE END TIM2_IRQn 1 */
		}


#. Save the file, then open Core/Src/main.c. Add the following lines to the Private includes (if your LCD uses other than the ST7789, replace the driver path and header with the appropriate one):

	.. code:: c

		/* Private includes ----------------------------------------------------------*/
		/* USER CODE BEGIN Includes */
		#include "lvgl.h"
		#include "./src/drivers/display/st7789/lv_st7789.h"
		/* USER CODE END Includes */

#. Add the following lines to Private defines (change them according to your LCD specs):

	.. code:: c

		#define LCD_H_RES	240
		#define LCD_V_RES	320
		#define BUS_SPI1_POLL_TIMEOUT 0x1000U


#. Add the following lines to the Private variables:

	.. code:: c
		
		osThreadId LvglTaskHandle;
		lv_display_t *lcd_disp;
		volatile int lcd_bus_busy = 0;

#. Add the following line to the Private function prototypes:

	.. code:: c

		void ui_init(lv_display_t *disp);
		void LVGL_Task(void const *argument);

#. Add the following lines after USER CODE BEGIN RTOS_THREADS:

	.. code:: c

		osThreadDef(LvglTask, LVGL_Task, osPriorityIdle, 0, 1024);
		LvglTaskHandle = osThreadCreate(osThread(LvglTask), NULL);

.. raw:: html

   </details>
   <br>


#. 在文件/新建/STM32项目中创建新项目。

#. 选择目标处理器/板。

#. 设置项目名称和位置。

#. 将“目标项目类型”设置为“STM32Cube”并按“完成”。

#. 选择“是”以使用默认模式初始化外围设备？项目创建后，配置文件（.ioc）会自动打开。

#. 切换到引脚分配和配置选项卡。

#. 在系统核心类别中切换到 RCC。

#. 将高速时钟设置为“旁路时钟源”，将低速时钟设置为“晶体/陶瓷谐振器”。

#. 在“系统核心”类别中，选择 SYS，并将“时基源”设置为除 SysTick 之外的其他值（在我们的示例中为 TIM2）。

#. 切换到时钟配置选项卡。

#. 将 HCLK 时钟频率设置为最大值（STM32F746 为 216 MHz）。

#. 切换回引脚分配和配置选项卡，然后在中间件和软件包类别中选择 FREERTOS。

#. 选择接口：CMSIS_V1。

#. 在“高级设置”选项卡中启用 USE_NEWLIB_REENTRANT。我们到这里就结束了。

#. 在引脚布局视图中，将 PA5 配置为 SPI1_SCK，将 PA7 配置为 SPI1_MOSI（右键单击引脚并选择功能）。

#. 在引脚分配和配置/连接类别中，选择 SPI1。

#. 将模式设置为仅传输主设备，并将硬件 NSS 信号设置为禁用。

#. 在“配置”子窗口中切换到“参数设置”。

#. 将帧格式设置为 Motorola，数据大小设置为 8 位，第一位设置为 MSB First。

#. 根据 LCD 控制器的数据表将预分频器设置为最大值（例如 15 MBits/s）。根据需要设置 CPOL/CPHA（保留默认值）。

#. 将 NSSP 模式设置为禁用，将 NSS 信号类型设置为软件。

#. 在 DMA 设置中添加新的 SPI1_TX 请求（使用 SPI1 时）。

#. 将优先级设置为中，将数据宽度设置为半字。

#. 在 NVIC 设置中启用 SPI1 全局中断。

#. 在 GPIO 设置中，将 SPI1_SCK 设置为下拉和极高输出速度，并将用户标签设置为 ``LCD_SCK``。

#. 将 SPI1_MOSI 设置为 Pull-up 和 Very High，并将其命名为 ``LCD_SDI``。

#. 选择系统核心/GPIO 类别。在引脚布局视图中，配置用于芯片选择、复位和命令/数据选择的附加引脚。分别将它们命名为 ``LCD_CS`` 、 ``LCD_RESET`` 和 ``LCD_DCX``。将它们配置为 GPIO 输出。（在此示例中，我们将使用 PA4 表示 ``LCD_CS``、使用 PA15 表示 ``LCD_RESET``、使用 PB10 表示 ``LCD_DCX``。）

#. 设置 ``LCD_CS`` 为无上拉和无下拉、低电平和极高速度。

#. 设置 ``LCD_RESET`` 为上拉和高电平。

#. 设置 ``LCD_DCX`` 为无上拉和无下拉、高电平和极高速度。

#. 打开项目管理器选项卡，然后选择高级设置。右侧有一个注册回调窗口。选择 SPI 并将其设置为启用。

#. 我们已经准备好硬件配置。保存配置并让STM32Cube生成源。

#. 在项目树中，将 LVGL 存储库克隆到 Middlewares/Third_Party 文件夹中（本教程使用 LVGL 的 release/v9.0 分支）：
	
	.. code:: dosbatch
	
		git clone https://github.com/lvgl/lvgl.git -b release/v9.0
	
#. 克隆应在“Third_Party”文件夹内创建一个“lvgl”子文件夹。从“lvgl”文件夹将“lv_conf_template.h”复制到“Middlewares”文件夹中，并将其重命名为“lv_conf.h”。刷新项目树。

#. 打开 'lv_conf.h'，并在第 15 行更改为 ``#if 0`` 和 ``#if 1``

#. 搜索字符串 ``LV_USE_ST7735`` ，并将其值设置为 1 来启用相应的 LCD 驱动程序。本示例使用 ST7789 驱动程序：

	.. code:: c
	
		#define LV_USE_ST7789		1
	
#. 右键单击文件夹“Middlewares/Third_Party/lvgl/tests”，选择“资源配置/从构建中排除...”，选中“调试”和“发布”，然后按“确定”。

#. 右键单击项目名称并选择“属性”。在 C/C++ Build/Settings 面板中，选择 MCU GCC Compiler/Ininclude 路径。在配置下拉列表中选择 [ 所有配置 ]。添加以下包含路径：

	.. code:: c
	
		../Middlewares/Third_Party/lvgl
		
#. 打开 Core/Src/stm32xxx_it.c（文件名取决于处理器版本）。将“lv_tick.h”添加到“私有包含”部分：

	.. code:: c
	
		/* Private includes ----------------------------------------------------------*/
		/* USER CODE BEGIN Includes */
		#include "./src/tick/lv_tick.h"
		/* USER CODE END Includes */

#. 求函数 ``TIM2_IRQHandler``. 添加呼叫 ``lv_tick_inc()`` ：

	.. code:: c

		void TIM2_IRQHandler(void)
		{
		  /* USER CODE BEGIN TIM2_IRQn 0 */

		  /* USER CODE END TIM2_IRQn 0 */
		  HAL_TIM_IRQHandler(&htim2);
		  /* USER CODE BEGIN TIM2_IRQn 1 */
		  lv_tick_inc(1);
		  /* USER CODE END TIM2_IRQn 1 */
		}


#. 保存文件，然后打开 Core/Src/main.c。将以下行添加到 Private Includes（如果您的 LCD 使用 ST7789 以外的其他系统，请将驱动程序路径和标头替换为适当的路径和标头）：

	.. code:: c

		/* Private includes ----------------------------------------------------------*/
		/* USER CODE BEGIN Includes */
		#include "lvgl.h"
		#include "./src/drivers/display/st7789/lv_st7789.h"
		/* USER CODE END Includes */

#. 将以下行添加到私有定义中（根据您的 LCD 规格更改它们）：

	.. code:: c

		#define LCD_H_RES	240
		#define LCD_V_RES	320
		#define BUS_SPI1_POLL_TIMEOUT 0x1000U


#. 将以下行添加到私有变量中：

	.. code:: c
		
		osThreadId LvglTaskHandle;
		lv_display_t *lcd_disp;
		volatile int lcd_bus_busy = 0;

#. 将以下行添加到 Private 函数原型中：

	.. code:: c

		void ui_init(lv_display_t *disp);
		void LVGL_Task(void const *argument);

#. 在 USER CODE BEGIN RTOS_THREADS 之后添加以下行：

	.. code:: c

		osThreadDef(LvglTask, LVGL_Task, osPriorityIdle, 0, 1024);
		LvglTaskHandle = osThreadCreate(osThread(LvglTask), NULL);


.. raw:: html

   <details>
     <summary>显示原文</summary>

#. Copy and paste the hardware initialization and the transfer callback functions from the example code after USER CODE BEGIN 4:

	.. code:: c

		/* USER CODE BEGIN 4 */

		void lcd_color_transfer_ready_cb(SPI_HandleTypeDef *hspi)
		{
			/* CS high */
			HAL_GPIO_WritePin(LCD_CS_GPIO_Port, LCD_CS_Pin, GPIO_PIN_SET);
			lcd_bus_busy = 0;
			lv_display_flush_ready(lcd_disp);
		}

		/* Initialize LCD I/O bus, reset LCD */
		static int32_t lcd_io_init(void)
		{
			/* Register SPI Tx Complete Callback */
			HAL_SPI_RegisterCallback(&hspi1, HAL_SPI_TX_COMPLETE_CB_ID, lcd_color_transfer_ready_cb);

			/* reset LCD */
			HAL_GPIO_WritePin(LCD_RESET_GPIO_Port, LCD_RESET_Pin, GPIO_PIN_RESET);
			HAL_Delay(100);
			HAL_GPIO_WritePin(LCD_RESET_GPIO_Port, LCD_RESET_Pin, GPIO_PIN_SET);
			HAL_Delay(100);

			HAL_GPIO_WritePin(LCD_CS_GPIO_Port, LCD_CS_Pin, GPIO_PIN_SET);
			HAL_GPIO_WritePin(LCD_DCX_GPIO_Port, LCD_DCX_Pin, GPIO_PIN_SET);

			return HAL_OK;
		}

		/* Platform-specific implementation of the LCD send command function. In general this should use polling transfer. */
		static void lcd_send_cmd(lv_display_t *disp, const uint8_t *cmd, size_t cmd_size, const uint8_t *param, size_t param_size)
		{
			LV_UNUSED(disp);
			while (lcd_bus_busy);	/* wait until previous transfer is finished */
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

		/* Platform-specific implementation of the LCD send color function. For better performance this should use DMA transfer.
		 * In case of a DMA transfer a callback must be installed to notify LVGL about the end of the transfer.
		 */
		static void lcd_send_color(lv_display_t *disp, const uint8_t *cmd, size_t cmd_size, uint8_t *param, size_t param_size)
		{
			LV_UNUSED(disp);
			while (lcd_bus_busy);	/* wait until previous transfer is finished */
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
				/* Set the SPI in 16-bit mode to match endianness */
				hspi1.Init.DataSize = SPI_DATASIZE_16BIT;
				HAL_SPI_Init(&hspi1);
				lcd_bus_busy = 1;
				HAL_SPI_Transmit_DMA(&hspi1, param, (uint16_t)param_size / 2);
				/* NOTE: CS will be reset in the transfer ready callback */
			}
		}

.. raw:: html

   </details>
   <br>


#. 从 USER CODE BEGIN 4 之后的示例代码中复制并粘贴硬件初始化和传输回调函数：

	.. code:: c

		/* USER CODE BEGIN 4 */

		void lcd_color_transfer_ready_cb(SPI_HandleTypeDef *hspi)
		{
			/* CS high */
			HAL_GPIO_WritePin(LCD_CS_GPIO_Port, LCD_CS_Pin, GPIO_PIN_SET);
			lcd_bus_busy = 0;
			lv_display_flush_ready(lcd_disp);
		}

		/* Initialize LCD I/O bus, reset LCD */
		static int32_t lcd_io_init(void)
		{
			/* Register SPI Tx Complete Callback */
			HAL_SPI_RegisterCallback(&hspi1, HAL_SPI_TX_COMPLETE_CB_ID, lcd_color_transfer_ready_cb);

			/* reset LCD */
			HAL_GPIO_WritePin(LCD_RESET_GPIO_Port, LCD_RESET_Pin, GPIO_PIN_RESET);
			HAL_Delay(100);
			HAL_GPIO_WritePin(LCD_RESET_GPIO_Port, LCD_RESET_Pin, GPIO_PIN_SET);
			HAL_Delay(100);

			HAL_GPIO_WritePin(LCD_CS_GPIO_Port, LCD_CS_Pin, GPIO_PIN_SET);
			HAL_GPIO_WritePin(LCD_DCX_GPIO_Port, LCD_DCX_Pin, GPIO_PIN_SET);

			return HAL_OK;
		}

		/* Platform-specific implementation of the LCD send command function. In general this should use polling transfer. */
		static void lcd_send_cmd(lv_display_t *disp, const uint8_t *cmd, size_t cmd_size, const uint8_t *param, size_t param_size)
		{
			LV_UNUSED(disp);
			while (lcd_bus_busy);	/* wait until previous transfer is finished */
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

		/* Platform-specific implementation of the LCD send color function. For better performance this should use DMA transfer.
		 * In case of a DMA transfer a callback must be installed to notify LVGL about the end of the transfer.
		 */
		static void lcd_send_color(lv_display_t *disp, const uint8_t *cmd, size_t cmd_size, uint8_t *param, size_t param_size)
		{
			LV_UNUSED(disp);
			while (lcd_bus_busy);	/* wait until previous transfer is finished */
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
				lcd_bus_busy = 1;
				HAL_SPI_Transmit_DMA(&hspi1, param, (uint16_t)param_size / 2);
				/* NOTE: CS will be reset in the transfer ready callback */
			}
		}


.. raw:: html

   <details>
     <summary>显示原文</summary>

#. Add the LVGL_Task() function. Replace the ``lv_st7789_create()`` call with the appropriate driver. You can change the default orientation by adjusting the parameter of ``lv_display_set_rotation()``. You will also need to create the display buffers here. This example uses a double buffering scheme with 1/10th size partial buffers. In most cases this is a good compromise between the required memory size and performance, but you are free to experiment with other settings.

	.. code:: c
	
		void LVGL_Task(void const *argument)
		{
			/* Initialize LVGL */
			lv_init();

			/* Initialize LCD I/O */
			if (lcd_io_init() != 0)
				return;

			/* Create the LVGL display object and the LCD display driver */
			lcd_disp = lv_st7789_create(LCD_H_RES, LCD_V_RES, LV_LCD_FLAG_NONE, lcd_send_cmd, lcd_send_color);
			lv_display_set_rotation(lcd_disp, LV_DISPLAY_ROTATION_270);

			/* Allocate draw buffers on the heap. In this example we use two partial buffers of 1/10th size of the screen */
			lv_color_t * buf1 = NULL;
			lv_color_t * buf2 = NULL;

			uint32_t buf_size = LCD_H_RES * LCD_V_RES / 10 * lv_color_format_get_size(lv_display_get_color_format(lcd_disp));

			buf1 = lv_malloc(buf_size);
			if(buf1 == NULL) {
				LV_LOG_ERROR("display draw buffer malloc failed");
				return;
			}

			buf2 = lv_malloc(buf_size);
			if(buf2 == NULL) {
				LV_LOG_ERROR("display buffer malloc failed");
				lv_free(buf1);
				return;
			}
			lv_display_set_buffers(lcd_disp, buf1, buf2, buf_size, LV_DISPLAY_RENDER_MODE_PARTIAL);

			ui_init(lcd_disp);

			for(;;)	{
				/* The task running lv_timer_handler should have lower priority than that running `lv_tick_inc` */
				lv_timer_handler();
				/* raise the task priority of LVGL and/or reduce the handler period can improve the performance */
				osDelay(10);
			}
		}

.. raw:: html

   </details>
   <br>


#. 添加 LVGL_Task() 函数。将呼叫替换 ``lv_st7789_create()`` 为适当的驱动程序。您可以通过调整 的参数来更改默认方向 ``lv_display_set_rotation()``。您还需要在此处创建显示缓冲区。此示例使用具有 1/10 大小部分缓冲区的双缓冲方案。在大多数情况下，这是所需内存大小和性能之间的良好折衷，但您可以自由尝试其他设置。

	.. code:: c
	
		void LVGL_Task(void const *argument)
		{
			/* Initialize LVGL */
			lv_init();

			/* Initialize LCD I/O */
			if (lcd_io_init() != 0)
				return;

			/* Create the LVGL display object and the LCD display driver */
			lcd_disp = lv_st7789_create(LCD_H_RES, LCD_V_RES, LV_LCD_FLAG_NONE, lcd_send_cmd, lcd_send_color);
			lv_display_set_rotation(lcd_disp, LV_DISPLAY_ROTATION_270);

			/* Allocate draw buffers on the heap. In this example we use two partial buffers of 1/10th size of the screen */
			lv_color_t * buf1 = NULL;
			lv_color_t * buf2 = NULL;

			uint32_t buf_size = LCD_H_RES * LCD_V_RES / 10 * lv_color_format_get_size(lv_display_get_color_format(lcd_disp));

			buf1 = lv_malloc(buf_size);
			if(buf1 == NULL) {
				LV_LOG_ERROR("display draw buffer malloc failed");
				return;
			}

			buf2 = lv_malloc(buf_size);
			if(buf2 == NULL) {
				LV_LOG_ERROR("display buffer malloc failed");
				lv_free(buf1);
				return;
			}
			lv_display_set_buffers(lcd_disp, buf1, buf2, buf_size, LV_DISPLAY_RENDER_MODE_PARTIAL);

			ui_init(lcd_disp);

			for(;;)	{
				/* The task running lv_timer_handler should have lower priority than that running `lv_tick_inc` */
				lv_timer_handler();
				/* raise the task priority of LVGL and/or reduce the handler period can improve the performance */
				osDelay(10);
			}
		}


.. raw:: html

   <details>
     <summary>显示原文</summary>

#. All that's left is to implement ``ui_init()`` to create the screen. Here's a simple "Hello World" example:

	.. code:: c

		void ui_init(lv_display_t *disp)
		{
			lv_obj_t *obj;

			/* set screen background to white */
			lv_obj_t *scr = lv_screen_active();
			lv_obj_set_style_bg_color(scr, lv_color_white(), 0);
			lv_obj_set_style_bg_opa(scr, LV_OPA_100, 0);

			/* create label */
			obj = lv_label_create(scr);
			lv_obj_set_align(obj, LV_ALIGN_CENTER);
			lv_obj_set_height(obj, LV_SIZE_CONTENT);
			lv_obj_set_width(obj, LV_SIZE_CONTENT);
			lv_obj_set_style_text_font(obj, &lv_font_montserrat_14, 0);
			lv_obj_set_style_text_color(obj, lv_color_black(), 0);
			lv_label_set_text(obj, "Hello World!");
		}

.. raw:: html

   </details>
   <br>


#. 剩下的就是实现 ``ui_init()`` 创建屏幕了。这是一个简单的“Hello World”示例：

	.. code:: c

		void ui_init(lv_display_t *disp)
		{
			lv_obj_t *obj;

			/* set screen background to white */
			lv_obj_t *scr = lv_screen_active();
			lv_obj_set_style_bg_color(scr, lv_color_white(), 0);
			lv_obj_set_style_bg_opa(scr, LV_OPA_100, 0);

			/* create label */
			obj = lv_label_create(scr);
			lv_obj_set_align(obj, LV_ALIGN_CENTER);
			lv_obj_set_height(obj, LV_SIZE_CONTENT);
			lv_obj_set_width(obj, LV_SIZE_CONTENT);
			lv_obj_set_style_text_font(obj, &lv_font_montserrat_14, 0);
			lv_obj_set_style_text_color(obj, lv_color_black(), 0);
			lv_label_set_text(obj, "Hello World!");
		}

