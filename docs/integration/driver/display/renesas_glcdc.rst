.. _renesas_glcdc:

==============
Renesas GLCDC
==============

Overview（概述）
----------------

.. image:: /misc/renesas/glcdc.png
    :alt: Architectural overview of Renesas GLCDC
    :align: center

|

.. raw:: html

   <details>
     <summary>显示原文</summary>

GLCDC is a multi-stage graphics output peripheral used in Renesas MCUs.
It is designed to automatically generate timing and data signals for different LCD panels.

- Supports LCD panels with RGB interface (up to 24 bits) and sync signals (HSYNC, VSYNC and Data Enable optional)
- Supports various color formats for input graphics planes (RGB888, ARGB8888, RGB565, ARGB1555, ARGB4444, CLUT8, CLUT4, CLUT1)
- Supports the Color Look-Up Table (CLUT) usage for input graphics planes (ARGB8888) with 512 words (32 bits/word)
- Supports various color formats for output (RGB888, RGB666, RGB565, Serial RGB888)
- Can input two graphics planes on top of the background plane and blend them on the screen
- Generates a dot clock to the panel. The clock source is selectable from internal or external (LCD_EXTCLK)
- Supports brightness adjustment, contrast adjustment, and gamma correction
- Supports GLCDC interrupts to handle frame-buffer switching or underflow detection

| Setting up a project and further integration with Renesas' ecosystem is described in detail on :ref:`page Renesas <renesas>`.
| Check out the `EK-RA8D1 example repository <https://github.com/lvgl/lv_port_renesas_ek-ra8d1>`__ for a ready-to-use example.

.. raw:: html

   </details>
   <br>


GLCDC 是在瑞萨微控制器中使用的多级图形输出外设。
它被设计为自动为不同的 LCD 面板生成时序和数据信号。

- 支持带有 RGB 接口（高达 24 位）和同步信号（HSYNC、VSYNC 和数据使能可选）的 LCD 面板
- 支持输入图形平面的各种颜色格式（RGB888、ARGB8888、RGB565、ARGB1555、ARGB4444、CLUT8、CLUT4、CLUT1）
- 支持输入图形平面（ARGB8888）使用颜色查找表（CLUT）具有 512 个条目（32 位/条目）
- 支持输出的多种颜色格式（RGB888、RGB666、RGB565、串行 RGB888）
- 可以在背景平面之上输入两个图形平面并在屏幕上混合它们
- 向面板生成点时钟。时钟源可以选择内部或外部（LCD_EXTCLK）
- 支持亮度调整、对比度调整和伽马校正
- 支持 GLCDC 中断以处理帧缓冲区切换或下溢检测

| 在 :ref:`page Renesas <renesas>` 页面上详细描述了项目的设置和与瑞萨生态系统的进一步集成。
| 查看 `EK-RA8D1 示例仓库 <https://github.com/lvgl/lv_port_renesas_ek-ra8d1>`__ 获取现成的示例。


Prerequisites（先决条件）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

- This diver relies on FSP generated code. Missing the step while setting up the project will cause a compilation error.
- Activate the diver by setting :c:macro:`LV_USE_DRAW_PXP` to ``1`` in your *"lv_conf.h"*.

.. raw:: html

   </details>
   <br>


- 此驱动依赖于 FSP 生成的代码。在设置项目时跳过此步骤将导致编译错误。
- 通过在您的 "lv_conf.h" 中将 :c:macro:`LV_USE_DRAW_PXP` 设置为 ``1`` 来激活驱动。


Usage（用法）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

There is no need to implement any platform-specific functions.

The following code demonstrates using the diver in :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_DIRECT` mode.

.. code:: c

    lv_display_t * disp = lv_renesas_glcdc_direct_create();
    lv_display_set_default(disp);

To use the driver in :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_PARTIAL` mode, an extra buffer must be allocated,
desireably in the fastest available memory region.
Buffer swapping can be activated by passing a second buffer of same size insted of the :cpp:expr:`NULL` argument.

.. code:: c

    static lv_color_t partial_draw_buf[DISPLAY_HSIZE_INPUT0 * DISPLAY_VSIZE_INPUT0 / 10] BSP_PLACE_IN_SECTION(".sdram") BSP_ALIGN_VARIABLE(1024);

    lv_display_t * disp = lv_renesas_glcdc_partial_create(partial_draw_buf, NULL, sizeof(partial_draw_buf));
    lv_display_set_default(disp);


.. raw:: html

   </details>
   <br>


无需实现任何特定平台的函数。

以下代码演示了在 :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_DIRECT` 模式下使用驱动。

.. code:: c

    lv_display_t * disp = lv_renesas_glcdc_direct_create();
    lv_display_set_default(disp);

要在 :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_PARTIAL` 模式下使用驱动，必须分配一个额外的缓冲区，最好在最快的可用内存区域中。
通过传递第二个相同大小的缓冲区而不是 :cpp:expr:`NULL` 参数，可以激活缓冲区交换。