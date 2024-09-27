======================================================================================
Generic MIPI DCS compatible LCD Controller driver（通用MIPI DCS兼容的液晶控制器驱动程序）
======================================================================================

Overview（概览）
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

From the `Wikipedia <https://en.wikipedia.org/wiki/MIPI_Alliance>`__:

	`MIPI Alliance <https://www.mipi.org/>`__ is a global business alliance that develops technical specifications
	for the mobile ecosystem, particularly smart phones but including mobile-influenced industries. MIPI was founded in 2003 by Arm, Intel, Nokia, Samsung,
	STMicroelectronics and Texas Instruments.

MIPI Alliance published a series of specifications related to display devices, including DBI (Display Bus Interface), DSI (Display Serial Interface) and DCS
Display Command Set). Usually when one talks about a MIPI-compatible display, one thinks of a device with a DSI serial interface. However, the Display Bus Interface specification
includes a number of other, legacy interfaces, like SPI serial, or i8080-compatible parallel interface, which are often used to interface LCD displays to lower-end microcontrollers.
Furthermore, the DCS specification contains a standard command set, which is supported by a large number of legacy TFT LCD controllers, including the popular Sitronix
(ST7735, ST7789, ST7796) and Ilitek (ILI9341) SOCs. These commands provide a common interface to configure display orientation, color resolution, various power modes, and provide generic video memory access. On top of that standard command set each LCD controller chip has a number of vendor-specific commands to configure voltage generator levels, timings, or gamma curves.

.. note::

	It is important to understand that this generic MIPI LCD driver is not a hardware driver for displays with the DSI ("MIPI") serial interface. Instead, it implements the MIPI DCS command set used in many LCD controllers with an SPI or i8080 bus, and provides a common framework for chip-specific display controllers.

.. tip::
	Although this is a generic driver, it can be used to support compatible chips which do not have a specific driver.

.. raw:: html

   </details>
   <br>


来自 `维基百科 <https://en.wikipedia.org/wiki/MIPI_Alliance>`__：

	`MIPI 联盟 <https://www.mipi.org/>`__ 是一个全球性的商业联盟，致力于开发移动生态系统的技术规范，特别是智能手机，但也包括移动相关行业。MIPI于2003年由Arm、Intel、Nokia、三星、STMicroelectronics和Texas Instruments共同创立。

MIPI联盟发表了一系列与显示设备相关的规范，包括Display Bus Interface (DBI)、Display Serial Interface (DSI)和Display Command Set (DCS)等。通常提到兼容MIPI的显示器时，人们会想到带有DSI串行接口的设备。但是，Display Bus Interface规范中还包括其他一些传统接口，如SPI串口和i8080兼容的并行接口，这些接口通常用于将LCD显示器与低端微控制器进行接口连接。此外，DCS规范包含了一套标准的命令集，被许多传统TFT LCD控制器所支持，包括流行的Sitronix（ST7735、ST7789、ST7796）和Ilitek（ILI9341）SOC。

这些命令集提供了一个通用接口，可以配置显示方向、颜色分辨率、各种电源模式，并提供通用的视频存储器访问。在这个标准命令集的基础上，每个LCD控制器芯片还有一些供应商特定的命令，用于配置电压发生器电平、时序或伽玛曲线。

.. 注释::

重要的是要理解，此通用MIPI LCD驱动程序不是具有DSI（“MIPI”）串行接口的显示器的硬件驱动程序。相反，它通过SPI或i8080总线实现了许多LCD控制器中使用的MIPI DCS命令集，并为芯片特定的显示控制器提供了通用框架。

.. 提示::
尽管这是一个通用驱动程序，但它可以用于支持没有特定驱动程序的兼容芯片。


Prerequisites（先决条件）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

There are no prerequisites.

.. raw:: html

   </details>
   <br>


没有先决条件。


Configuring the driver（配置驱动程序）
-------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable the generic MIPI LCD driver support in lv_conf.h, by cmake compiler define or by KConfig

.. code:: c

	#define LV_USE_GENERIC_MIPI  1

.. note::
	``LV_USE_GENERIC_MIPI`` is automatically enabled when a compatible driver is enabled.

.. raw:: html

   </details>
   <br>


在lv_conf.h中启用通用MIPI LCD驱动程序支持，可以通过cmake编译器定义或通过KConfig进行配置。

.. code:: c

	#define LV_USE_GENERIC_MIPI  1

.. note::
	``LV_USE_GENERIC_MIPI``会在启用兼容驱动程序时自动启用。


Usage（用法）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You need to implement two platform-dependent functions:

.. code:: c

	/* Send short command to the LCD. This function shall wait until the transaction finishes. */
	int32_t my_lcd_send_cmd(lv_display_t *disp, const uint8_t *cmd, size_t cmd_size, const uint8_t *param, size_t param_size)
	{
		...
	}

	/* Send large array of pixel data to the LCD. If necessary, this function has to do the byte-swapping. This function can do the transfer in the background. */
	int32_t my_lcd_send_color(lv_display_t *disp, const uint8_t *cmd, size_t cmd_size, uint8_t *param, size_t param_size)
	{
		...
	}

The only difference between the :cpp:func:`my_lcd_send_cmd()` and :cpp:func:`my_lcd_send_color()` functions is that :cpp:func:`my_lcd_send_cmd()` is used to send short commands and it is expected
complete the transaction when it returns (in other words, it should be blocking), while :cpp:func:`my_lcd_send_color()` is only used to send pixel data, and it is recommended to use
DMA to transmit data in the background. More sophisticated methods can be also implemented, like queuing transfers and scheduling them in the background.

Please note that while display flushing is handled by the driver, it is the user's responsibility to call :cpp:func:`lv_display_flush_ready()`
when the color transfer completes. In case of a DMA transfer this is usually done in a transfer ready callback.

.. note::
	While it is acceptable to use a blocking implementation for the pixel transfer as well, performance will suffer.

.. tip::
	Care must be taken to avoid sending a command while there is an active transfer going on in the background. It is the user's responsibility to implement this either
	by polling the hardware, polling a global variable (which is reset at the end of the transfer), or by using a semaphore or other locking mechanism.

Please also note that the driver does not handle the draw buffer allocation, because this may be platform-dependent, too. Thus you need to allocate the buffers and assign them
to the display object as usual by calling :cpp:func:`lv_display_set_buffers()`.

The driver can be used to create multiple displays. In such a configuration the callbacks must be able to distinguish between the displays. Usually one would
implement a separate set of callbacks for each display. Also note that the user must take care of arbitrating the bus when multiple devices are connected to it.

.. raw:: html

   </details>
   <br>


您需要实现两个依赖于平台的函数：

.. code:: c

	/* 向LCD发送短命令。此函数将等待事务完成。*/
	int32_t my_lcd_send_cmd(lv_display_t *disp, const uint8_t *cmd, size_t cmd_size, const uint8_t *param, size_t param_size)
	{
		...
	}

	/* 向LCD发送大批量像素数据。必要时，此函数必须对字节进行交换。此函数可以在后台进行传输。*/
	int32_t my_lcd_send_color(lv_display_t *disp, const uint8_t *cmd, size_t cmd_size, uint8_t *param, size_t param_size)
	{
		...
	}

:cpp:func:`my_lcd_send_cmd()` 和 :cpp:func:`my_lcd_send_color()` 函数之间唯一的区别在于 :cpp:func:`my_lcd_send_cmd()` 用于发送短命令，且希望在返回时完成事务（换句话说，它应该是阻塞的），而 :cpp:func:`my_lcd_send_color()` 仅用于发送像素数据，并建议使用 DMA 在后台传输数据。还可以实现更复杂的方法，如排队传输并在后台调度它们。

请注意，虽然显示刷新由驱动程序处理，但用户有责任在颜色传输完成时调用 :cpp:func:`lv_display_flush_ready()`。在 DMA 传输的情况下，通常是在传输就绪回调中完成的。

.. note::
	虽然可以为像素传输使用阻塞实现，但性能会受到影响。

.. tip::
	必须注意避免在后台有活动传输时发送命令。用户有责任通过轮询硬件、轮询全局变量（在传输结束时重置）或使用信号量或其他锁定机制来实现这一点。

还请注意，驱动程序不处理绘制缓冲区分配，因为这可能是依赖于平台的。因此，您需要按照平常的做法分配缓冲区并将其分配给显示对象，通过调用 :cpp:func:`lv_display_set_buffers()`。

驱动程序可用于创建多个显示。在这种配置中，回调必须能够区分显示。通常，会为每个显示实现一个单独的回调集。还请注意，用户必须在多个设备连接到总线时协调总线的使用。


Example（例子）
---------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

.. note::
	You can find a step-by-step guide and the actual implementation of the callbacks on an STM32F746 using STM32CubeIDE and the ST HAL libraries here: :ref:`lcd_stm32_guide`

.. code:: c

	#include "src/drivers/display/st7789/lv_st7789.h"

	#define LCD_H_RES		240
	#define LCD_V_RES		320
	#define LCD_BUF_LINES	60

	lv_display_t *my_disp;

	...

	/* Initialize LCD I/O bus, reset LCD */
	static int32_t my_lcd_io_init(void)
	{
		...
		return HAL_OK;
	}

	/* Send command to the LCD controller */
	static void my_lcd_send_cmd(lv_display_t *disp, const uint8_t *cmd, size_t cmd_size, const uint8_t *param, size_t param_size)
	{
		...
	}

	/* Send pixel data to the LCD controller */
	static void my_lcd_send_color(lv_display_t *disp, const uint8_t *cmd, size_t cmd_size, uint8_t *param, size_t param_size)
	{
		...
	}

	int main(int argc, char ** argv)
	{
		...

		/* Initialize LVGL */
		lv_init();

		/* Initialize LCD bus I/O */
		if (my_lcd_io_init() != 0)
			return;

		/* Create the LVGL display object and the LCD display driver */
		my_disp = lv_lcd_generic_mipi_create(LCD_H_RES, LCD_V_RES, LV_LCD_FLAG_NONE, my_lcd_send_cmd, my_lcd_send_color);

		/* Set display orientation to landscape */
		lv_display_set_rotation(my_disp, LV_DISPLAY_ROTATION_90);

		/* Configure draw buffers, etc. */
		uint8_t * buf1 = NULL;
		uint8_t * buf2 = NULL;

		uint32_t buf_size = LCD_H_RES * LCD_BUF_LINES * lv_color_format_get_size(lv_display_get_color_format(my_disp));

		buf1 = lv_malloc(buf_size);
		if(buf1 == NULL) {
			LV_LOG_ERROR("display draw buffer malloc failed");
			return;
		}
		/* Allocate secondary buffer if needed */
		...

		lv_display_set_buffers(my_disp, buf1, buf2, buf_size, LV_DISPLAY_RENDER_MODE_PARTIAL);

		ui_init(my_disp);

		while(true) {
			...

			/* Periodically call the lv_timer handler */
			lv_timer_handler();
		}
	}

.. raw:: html

   </details>
   <br>


.. note::
	您可以在以下位置找到使用STM32CubIDE和ST HAL库的STM32F746上回调的分步指南和实际实现这里：:ref:`lcd_stm32_guide`

.. code:: c

	#include "src/drivers/display/st7789/lv_st7789.h"

	#define LCD_H_RES		240
	#define LCD_V_RES		320
	#define LCD_BUF_LINES	60

	lv_display_t *my_disp;

	...

	/* Initialize LCD I/O bus, reset LCD */
	static int32_t my_lcd_io_init(void)
	{
		...
		return HAL_OK;
	}

	/* Send command to the LCD controller */
	static void my_lcd_send_cmd(lv_display_t *disp, const uint8_t *cmd, size_t cmd_size, const uint8_t *param, size_t param_size)
	{
		...
	}

	/* Send pixel data to the LCD controller */
	static void my_lcd_send_color(lv_display_t *disp, const uint8_t *cmd, size_t cmd_size, uint8_t *param, size_t param_size)
	{
		...
	}

	int main(int argc, char ** argv)
	{
		...

		/* Initialize LVGL */
		lv_init();

		/* Initialize LCD bus I/O */
		if (my_lcd_io_init() != 0)
			return;

		/* Create the LVGL display object and the LCD display driver */
		my_disp = lv_lcd_generic_mipi_create(LCD_H_RES, LCD_V_RES, LV_LCD_FLAG_NONE, my_lcd_send_cmd, my_lcd_send_color);

		/* Set display orientation to landscape */
		lv_display_set_rotation(my_disp, LV_DISPLAY_ROTATION_90);

		/* Configure draw buffers, etc. */
		uint8_t * buf1 = NULL;
		uint8_t * buf2 = NULL;

		uint32_t buf_size = LCD_H_RES * LCD_BUF_LINES * lv_color_format_get_size(lv_display_get_color_format(my_disp));

		buf1 = lv_malloc(buf_size);
		if(buf1 == NULL) {
			LV_LOG_ERROR("display draw buffer malloc failed");
			return;
		}
		/* Allocate secondary buffer if needed */
		...

		lv_display_set_buffers(my_disp, buf1, buf2, buf_size, LV_DISPLAY_RENDER_MODE_PARTIAL);

		ui_init(my_disp);

		while(true) {
			...

			/* Periodically call the lv_timer handler */
			lv_timer_handler();
		}
	}


Advanced topics（高级主题）
--------------------------

Create flags（创建旗帜）
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

The third argument of the :cpp:func:`lv_lcd_generic_mipi_create()` function is a flag array. This can be used to configure the orientation and RGB ordering of the panel if the
default settings do not work for you. In particular, the generic MIPI driver accepts the following flags:

.. code:: c

	LV_LCD_FLAG_NONE
	LV_LCD_FLAG_MIRROR_X
	LV_LCD_FLAG_MIRROR_Y
	LV_LCD_FLAG_BGR

You can pass multiple flags by ORing them together, e.g., :c:macro:`LV_LCD_FLAG_MIRROR_X | LV_LCD_FLAG_BGR`.

.. raw:: html

   </details>
   <br>


:cpp:func:`lv_lcd_generic_mipi_create()` 函数的第三个参数是一个标志数组。如果默认设置不适用，可以使用它来配置面板的方向和RGB顺序。特别是，通用MIPI驱动程序接受以下标志：

.. code:: c

	LV_LCD_FLAG_NONE
	LV_LCD_FLAG_MIRROR_X
	LV_LCD_FLAG_MIRROR_Y
	LV_LCD_FLAG_BGR

您可以通过使用OR运算符将多个标志传递给它，例如：:c:macro:`LV_LCD_FLAG_MIRROR_X | LV_LCD_FLAG_BGR`。


Custom command lists（自定义命令列表）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

While the chip-specific drivers do their best to initialize the LCD controller correctly, it is possible, that different TFT panels need different configurations.
In particular a correct gamma setup is crucial for good color reproduction. Unfortunately, finding a good set of parameters is not easy. Usually the manufacturer
of the panel provides some example code with recommended register settings.

You can use the ``my_lcd_send_cmd()`` function to send an arbitrary command to the LCD controller. However, to make it easier to send a large number of parameters
the generic MIPI driver supports sending a custom command list to the controller. The commands must be put into a 'uint8_t' array:

.. code:: c

	static const uint8_t init_cmd_list[] = {
		<command 1>, <number of parameters>, <parameter 1>, ... <parameter N>,
		<command 2>, <number of parameters>, <parameter 1>, ... <parameter N>,
		...
		LV_LCD_CMD_DELAY_MS, LV_LCD_CMD_EOF		/* terminate list: this is required! */
	};

	...

	lv_lcd_generic_mipi_send_cmd_list(my_disp, init_cmd_list);

You can add a delay between the commands by using the pseudo-command ``LV_LCD_CMD_DELAY_MS``, which must be followed by the delay given in 10ms units.
To terminate the command list you must use a delay with a value of ``LV_LCD_CMD_EOF``, as shown above.

See an actual example of sending a command list `here <https://github.com/lvgl/lvgl/src/drivers/display/st7789/lv_st7789.c>`__.

.. raw:: html

   </details>
   <br>


尽管特定芯片的驱动程序尽力正确初始化LCD控制器，但不同的TFT面板可能需要不同的配置。
特别是正确的伽马设置对于良好的色彩再现非常关键。不幸的是，找到一组良好的参数并不容易。通常面板制造商会提供一些示例代码和建议的寄存器设置。

您可以使用 ``my_lcd_send_cmd()`` 函数将任意命令发送到LCD控制器。然而，为了更容易发送大量的参数，通用的MIPI驱动程序支持向控制器发送自定义命令列表。命令必须放入一个'uint8_t'数组中：

.. code:: c

	static const uint8_t init_cmd_list[] = {
		<命令1>, <参数数量>, <参数1>, ... <参数N>,
		<命令2>, <参数数量>, <参数1>, ... <参数N>,
		...
		LV_LCD_CMD_DELAY_MS, LV_LCD_CMD_EOF		/* 终止列表：这是必需的！ */
	};

	...

	lv_lcd_generic_mipi_send_cmd_list(my_disp, init_cmd_list);

您可以使用伪命令 ``LV_LCD_CMD_DELAY_MS`` 在命令之间添加延迟，后面必须是以10ms为单位给出的延迟值。要终止命令列表，您必须使用值为 ``LV_LCD_CMD_EOF`` 的延迟，如上所示。

在此处可以看到发送命令列表的实际示例 `这里 <https://github.com/lvgl/lvgl/src/drivers/display/st7789/lv_st7789.c>`__.

