.. _nema_gfx:

====================
NemaGFX Acceleration
====================

.. raw:: html

   <details>
     <summary>显示原文</summary>

NemaGFX is a high-level graphics API supported
by many embedded 2.5D GPUs. LVGL can use it to
natively render LVGL graphics.

.. raw:: html

   </details>
   <br>

NemaGFX 是一个由许多嵌入式 2.5D GPU 支持的高级图形 API。LVGL 可以使用它原生渲染 LVGL 图形。

Get Started with the Riverdi STM32U5 5-inch Display
***************************************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

`lv_port_riverdi_stm32u5 <https://github.com/lvgl/lv_port_riverdi_stm32u5>`__
is a ready-to-use port for the Riverdi STM32 5.0" Embedded Display
(STM32U599NJH6Q or STM32U5A9NJH6Q) which has Nema enabled.
Follow the instructions in the readme to get started.

.. raw:: html

   </details>
   <br>


`lv_port_riverdi_stm32u5 <https://github.com/lvgl/lv_port_riverdi_stm32u5>`__ 
是一个针对 Riverdi STM32 5.0" 嵌入式显示器（STM32U599NJH6Q 或 STM32U5A9NJH6Q）并启用 Nema 的现成端口。
按照 readme 中的说明开始使用。

Usage and Configuration
***********************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable the renderer by setting :c:macro:`LV_USE_NEMA_GFX` to ``1`` in
lv_conf.h. If using :c:macro:`LV_USE_NEMA_VG`,
set :c:macro:`LV_NEMA_GFX_MAX_RESX` and :c:macro:`LV_NEMA_GFX_MAX_RESY`
to the size of the display you will be using so that enough static
memory will be reserved for VG. Without VG, more task types will be
performed by the software renderer.

"libs/nema_gfx" contains pre-compiled binaries for the Nema GPU
drivers. In `lv_port_riverdi_stm32u5 <https://github.com/lvgl/lv_port_riverdi_stm32u5>`__
the project is already configured to link the binaries when building.
With a different STM32CubeIDE project, you can configure the libraries to be linked
by right-clicking the project in the "Project Explorer" sidebar, clicking
"Properties", navigating to "C/C++ Build", "Settings", "MCU G++ Linker", and then
"Libraries". Add an entry under "Libraries (-l)" that is "nemagfx-float-abi-hard".
Add an entry under "Library search path (-L)" which is a path to
"libs/nema_gfx/lib/core/cortex_m33/gcc" e.g.
"${workspace_loc:/${ProjName}/Middlewares/LVGL/lvgl/libs/nema_gfx/lib/core/cortex_m33/gcc}".
You will also want to add the "libs/nema_gfx/include" directory to your include
search paths. Under "MCU GCC Compiler", "Include paths", add an entry to "Include paths (-I)"
which is a path to "libs/nema_gfx/include" e.g.
"${workspace_loc:/${ProjName}/Middlewares/LVGL/lvgl/libs/nema_gfx/include}".
Click "Apply and Close".

32 and 16 bit :c:macro:`LV_COLOR_DEPTH` is supported.

At the time of writing, :c:macro:`LV_USE_OS` support is experimental
and not yet working in
`lv_port_riverdi_stm32u5 <https://github.com/lvgl/lv_port_riverdi_stm32u5>`__

NemaGFX requires a simple HAL implementation to allocate memory and optionally
lock resources. You may use a custom HAL implementation for your platform or use one of the
provided implementations by setting :c:macro:`LV_USE_NEMA_HAL` to a value other than
:c:macro:`LV_NEMA_HAL_CUSTOM`.

.. raw:: html

   </details>
   <br>

通过在 ``lv_conf.h`` 中将宏 :c:macro:`LV_USE_NEMA_GFX` 设置为 ``1`` 来启用渲染器。
如果使用 :c:macro:`LV_USE_NEMA_VG`，请将 :c:macro:`LV_NEMA_GFX_MAX_RESX` 和 :c:macro:`LV_NEMA_GFX_MAX_RESY` 设置为将要使用的显示器的大小，以便为 VG 保留足够的静态内存。
如果没有使用 VG，更多的任务类型将由软件渲染器执行。

"libs/nema_gfx" 包含预编译的 Nema GPU 驱动程序二进制文件。在 `lv_port_riverdi_stm32u5 <https://github.com/lvgl/lv_port_riverdi_stm32u5>`__ 中，项目已配置为在构建时链接这些二进制文件。
对于其他 STM32CubeIDE 项目，可以通过右键单击 "Project Explorer" 侧边栏中的项目，点击 "Properties"，导航到 "C/C++ Build"、"Settings"、"MCU G++ Linker"，然后选择 "Libraries" 来配置库的链接。
在 "Libraries (-l)" 下添加一个条目 "nemagfx-float-abi-hard"。在 "Library search path (-L)" 下添加一个条目，指向 "libs/nema_gfx/lib/core/cortex_m33/gcc" 路径，例如：  
"${workspace_loc:/${ProjName}/Middlewares/LVGL/lvgl/libs/nema_gfx/lib/core/cortex_m33/gcc}"。  
还需要将 "libs/nema_gfx/include" 目录添加到您的包含搜索路径中。在 "MCU GCC Compiler" 的 "Include paths" 下，在 "Include paths (-I)" 中添加一个条目，指向 "libs/nema_gfx/include" 路径，例如：  
"${workspace_loc:/${ProjName}/Middlewares/LVGL/lvgl/libs/nema_gfx/include}"。  
点击 "Apply and Close"。

支持 32 位和 16 位的 :c:macro:`LV_COLOR_DEPTH`。

在编写本文时，:c:macro:`LV_USE_OS` 的支持仍处于实验阶段，尚未在 `lv_port_riverdi_stm32u5 <https://github.com/lvgl/lv_port_riverdi_stm32u5>`__ 中工作。

NemaGFX 需要一个简单的 HAL 实现来分配内存并可选地锁定资源。您可以为您的平台使用自定义 HAL 实现，或者通过将 :c:macro:`LV_USE_NEMA_HAL` 设置为不同于 :c:macro:`LV_NEMA_HAL_CUSTOM` 的值来使用提供的实现之一。

TSC Images
**********

.. raw:: html

   <details>
     <summary>显示原文</summary>

TSC (ThinkSillicon Compression) images can be drawn by this renderer. The
TSC 4/6/6A/12/12A color formats are part of :cpp:type:`lv_color_format_t`.
All other renderers will ignore images with these color formats.
Define an image descriptor variable with the corresponding
TSC color format and the GPU will be able to draw it directly.
Stride does not need to be specified because it will be computed by the
renderer.

.. code-block:: c

    const lv_image_dsc_t img_demo_widgets_avatar_tsc6a = {
        .header.cf = LV_COLOR_FORMAT_NEMA_TSC6A,
        .header.w = 144,
        .header.h = 144,
        .data = img_demo_widgets_avatar_tsc6a_map,
        .data_size = sizeof(img_demo_widgets_avatar_tsc6a_map),
    };

.. raw:: html

   </details>
   <br>

该渲染器可以绘制 TSC（ThinkSillicon Compression）图像。TSC 4/6/6A/12/12A 颜色格式是 :cpp:type:`lv_color_format_t` 的一部分。
所有其他渲染器将忽略具有这些颜色格式的图像。  

定义一个具有相应 TSC 颜色格式的图像描述符变量，GPU 将能够直接绘制它。  
不需要指定步幅（Stride），因为它将由渲染器计算。

.. code-block:: c

    const lv_image_dsc_t img_demo_widgets_avatar_tsc6a = {
        .header.cf = LV_COLOR_FORMAT_NEMA_TSC6A,
        .header.w = 144,
        .header.h = 144,
        .data = img_demo_widgets_avatar_tsc6a_map,
        .data_size = sizeof(img_demo_widgets_avatar_tsc6a_map),
    };

DMA2D
*****

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Nema renderer uses DMA2D to flush in parallel with rendering in
`lv_port_riverdi_stm32u5 <https://github.com/lvgl/lv_port_riverdi_stm32u5>`__.

If your STM does not have the Nema GPU, it may still support
DMA2D. DMA2D is a simple peripheral which can draw fills
and images independently of the CPU.
See the LVGL :ref:`DMA2D support <dma2d>`.

.. raw:: html

   </details>
   <br>

Nema 渲染器使用 DMA2D 与渲染并行刷新，在 `lv_port_riverdi_stm32u5 <https://github.com/lvgl/lv_port_riverdi_stm32u5>`__ 中实现。

如果您的 STM 没有 Nema GPU，它仍然可能支持 DMA2D。DMA2D 是一个简单的外设，可以独立于 CPU 绘制填充和图像。  
请参阅 LVGL :ref:`DMA2D support <dma2d>`。

API
***

:ref:`lv_draw_nema_gfx_h`

:ref:`lv_draw_nema_gfx_utils_h`
