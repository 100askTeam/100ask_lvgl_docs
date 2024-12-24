=================
STM32 LTDC Driver
=================

.. raw:: html

   <details>
     <summary>显示原文</summary>

Some STM32s have a specialized peripheral for driving
displays called LTDC (LCD-TFT display controller).

.. raw:: html

   </details>
   <br>

一些 STM32 具有一个用于驱动显示屏的专用外设，称为 LTDC（LCD-TFT 显示控制器）。

Usage Modes With LVGL
*********************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The driver within LVGL is designed to work with an
already-configured LTDC peripheral. It relies on the
HAL to detect information about the configuration.
The color format of the created LVGL display will
match the LTDC layer's color format. Use STM32CubeIDE
or STM32CubeMX to generate LTDC initialization code.

There are some different use cases for LVGL's driver.
All permutations of the below options are well supported.

- single or double buffered
- direct or partial render mode
- OS and no OS
- paralellized flushing with DMA2D (only for partial render mode)

If OS is enabled, a synchronization primitive will be used to
give the thread a chance to yield to other threads while blocked,
improving CPU utilization. See :c:macro:`LV_USE_OS` in your lv_conf.h

.. raw:: html

   </details>
   <br>

LVGL 中的驱动程序旨在与已配置的 LTDC 外设配合使用。它依赖 HAL 来检测有关配置的信息。所创建的 LVGL 显示的颜色格式将与 LTDC 层的颜色格式匹配。使用 STM32CubeIDE 或 STM32CubeMX 生成 LTDC 初始化代码。

LVGL 驱动程序有多种不同的使用场景，以下选项的所有排列组合都得到良好支持：

- 单缓冲或双缓冲  
- 直接渲染模式或部分渲染模式  
- 使用 OS 或不使用 OS  
- 使用 DMA2D 并行刷新（仅适用于部分渲染模式）  

如果启用了 OS，将使用同步原语，在线程阻塞时提供让出 CPU 给其他线程的机会，从而提高 CPU 利用率。请参阅 `lv_conf.h` 中的 :c:macro:`LV_USE_OS`。

LTDC Layers
***********

.. raw:: html

   <details>
     <summary>显示原文</summary>

This driver creates an LVGL display
which is only concerned with a specific layer of the LTDC peripheral, meaning
two LVGL LTDC displays can be created and operate independently on the separate
layers.

.. raw:: html

   </details>
   <br>

此驱动程序创建的 LVGL 显示仅与 LTDC 外设的特定层相关联，这意味着可以创建两个独立的 LVGL LTDC 显示，并在各自的层上独立运行。

Direct Render Mode
******************

.. raw:: html

   <details>
     <summary>显示原文</summary>

For direct render mode, invoke :cpp:func:`lv_st_ltdc_create_direct` like this:

.. code-block:: c

    void * my_ltdc_framebuffer_address = (void *)0x20000000u;
    uint32_t my_ltdc_layer_index = 0; /* typically 0 or 1 */
    lv_display_t * disp = lv_st_ltdc_create_direct(my_ltdc_framebuffer_address,
                                                   optional_other_full_size_buffer,
                                                   my_ltdc_layer_index);

``my_ltdc_framebuffer_address`` is the framebuffer configured for use by
LTDC. ``optional_other_full_size_buffer`` can be another buffer which is the same
size as the default framebuffer for double-buffered
mode, or ``NULL`` otherwise. ``my_ltdc_layer_index`` is the layer index of the
LTDC layer to create the display for.

For the best visial results, ``optional_other_full_size_buffer`` should be used
if enough memory is available. Single-buffered mode is what you should use
if memory is very scarce. If there is almost enough memory for double-buffered
direct mode, but not quite, then use partial render mode.

.. raw:: html

   </details>
   <br>

对于直接渲染模式，可以像这样调用 :cpp:func:`lv_st_ltdc_create_direct`：

.. code-block:: c

    void * my_ltdc_framebuffer_address = (void *)0x20000000u;
    uint32_t my_ltdc_layer_index = 0; /* 通常为 0 或 1 */
    lv_display_t * disp = lv_st_ltdc_create_direct(my_ltdc_framebuffer_address,
                                                   optional_other_full_size_buffer,
                                                   my_ltdc_layer_index);

``my_ltdc_framebuffer_address`` 是为 LTDC 配置的帧缓冲区地址。  
``optional_other_full_size_buffer`` 可以是另一个与默认帧缓冲区大小相同的缓冲区，用于双缓冲模式，否则为 ``NULL``。  
``my_ltdc_layer_index`` 是为其创建显示的 LTDC 层的索引。

为获得最佳的视觉效果，如果内存充足，建议使用 ``optional_other_full_size_buffer``。
如果内存非常有限，应使用单缓冲模式。如果内存几乎足够双缓冲直接模式，但稍有不足，则使用部分渲染模式。

Partial Render Mode
*******************

.. raw:: html

   <details>
     <summary>显示原文</summary>

For partial render mode, invoke :cpp:func:`lv_st_ltdc_create_partial` like this:

.. code-block:: c

    static uint8_t partial_buf1[65536];
    static uint8_t optional_partial_buf2[65536];
    uint32_t my_ltdc_layer_index = 0; /* typically 0 or 1 */
    lv_display_t * disp = lv_st_ltdc_create_partial(partial_buf1,
                                                    optional_partial_buf2,
                                                    65536,
                                                    my_ltdc_layer_index);

The driver will use the information in the LTDC layer configuration to find the
layer's framebuffer and flush to it.

Providing a second partial buffer can improve CPU utilization and increase
performance compared to
a single buffer if :c:macro:`LV_ST_LTDC_USE_DMA2D_FLUSH` is enabled.

.. raw:: html

   </details>
   <br>

对于部分渲染模式，可以像这样调用 :cpp:func:`lv_st_ltdc_create_partial`：

.. code-block:: c

    static uint8_t partial_buf1[65536];
    static uint8_t optional_partial_buf2[65536];
    uint32_t my_ltdc_layer_index = 0; /* 通常为 0 或 1 */
    lv_display_t * disp = lv_st_ltdc_create_partial(partial_buf1,
                                                    optional_partial_buf2,
                                                    65536,
                                                    my_ltdc_layer_index);

驱动程序将使用 LTDC 层配置中的信息来找到该层的帧缓冲区并将数据刷新到其中。

如果启用了 :c:macro:`LV_ST_LTDC_USE_DMA2D_FLUSH`，提供第二个部分缓冲区可以提高 CPU 利用率，并与单缓冲相比显著提升性能。

DMA2D
*****

.. raw:: html

   <details>
     <summary>显示原文</summary>

:c:macro:`LV_ST_LTDC_USE_DMA2D_FLUSH` can be enabled to use DMA2D to flush
partial buffers in parallel with other LVGL tasks, whether or not OS is
enabled. If the display is not partial, then there is no need to enable this
option.

It must not be enabled at the same time as :c:macro:`LV_USE_DRAW_DMA2D`.
See the :ref:`DMA2D support <dma2d>`.

.. raw:: html

   </details>
   <br>

:c:macro:`LV_ST_LTDC_USE_DMA2D_FLUSH` 可以启用，以便使用 DMA2D 并行刷新部分缓冲区，同时执行其他 LVGL 任务，无论是否启用了操作系统。

如果显示不是部分渲染模式，则无需启用此选项。

此选项不能与 :c:macro:`LV_USE_DRAW_DMA2D` 同时启用。详情请参阅 :ref:`DMA2D 支持 <dma2d>`。

.. admonition::  Further Reading

.. raw:: html

   <details>
     <summary>显示原文</summary>

    You may be interested in enabling the :ref:`Nema GFX renderer <nema_gfx>`
    if your STM32 has a NeoChrom GPU.

    `lv_port_riverdi_stm32u5 <https://github.com/lvgl/lv_port_riverdi_stm32u5>`__
    is a way to quick way to get started with LTDC on LVGL.

.. raw:: html

   </details>
   <br>

如果您的 STM32 配备了 NeoChrom GPU，您可能会对启用 :ref:`Nema GFX 渲染器 <nema_gfx>` 感兴趣。

可以使用 [`lv_port_riverdi_stm32u5`](https://github.com/lvgl/lv_port_riverdi_stm32u5) 快速开始在 LVGL 上使用 LTDC。

