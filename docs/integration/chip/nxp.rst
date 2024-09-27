===
NXP
===

.. raw:: html

   <details>
     <summary>显示原文</summary>

NXP has integrated LVGL into the MCUXpresso SDK packages for several of our
microcontrollers as an optional software component, allowing easy evaluation and
migration into your product design. LVGL is a free and open-source embedded
graphic library with features that enable you need to create embedded GUIs with
intuitive graphical elements, beautiful visual effects and a low memory
footprint. The complete graphic framework includes a variety of widgets for you
to use in the creation of your GUI, and supports more advanced functions such as
animations and anti-aliasing.

LVGL enables graphics in our free GUI Guider UI tool. It's available for use
with NXP’s general purpose and crossover microcontrollers, providing developers
with a tool for creating complete, high quality GUI applications with LVGL.

.. raw:: html

   </details>
   <br>


NXP已将LVGL集成到MCUXpresso SDK包中，作为可选的软件组件，可以轻松评估并迁移到您的产品设计中。LVGL是一个免费且开源的嵌入式图形库，具有使您能够创建具有直观图形元素、美观视觉效果和低内存占用的嵌入式GUI所需的功能。完整的图形框架包括各种小部件，可用于创建您的GUI，并支持诸如动画和抗锯齿等更高级的功能。

LVGL可使我们的免费GUI Guider UI工具支持图形功能。它可用于NXP的通用用途和跨界微控制器，为开发人员提供了一个使用LVGL创建完整、高质量GUI应用程序的工具。


Creating new project with LVGL（使用LVGL创建新项目）
---------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

`Download an SDK for a supported board <https://www.nxp.com/design/software/embedded-software/littlevgl-open-source-graphics-library:LITTLEVGL-OPEN-SOURCE-GRAPHICS-LIBRARY?&tid=vanLITTLEVGL-OPEN-SOURCE-GRAPHICS-LIBRARY>`__
today and get started with your next GUI application. It comes fully configured
with LVGL (and with PXP/VGLite support if the modules are present), no
additional integration work is required.

.. raw:: html

   </details>
   <br>


`下载适用于支持的开发板的软件开发工具包（SDK） <https://www.nxp.com/design/software/embedded-software/littlevgl-open-source-graphics-library:LITTLEVGL-OPEN-SOURCE-GRAPHICS-LIBRARY?&tid=vanLITTLEVGL-OPEN-SOURCE-GRAPHICS-LIBRARY>`__ 并开始你的下一个图形用户界面（GUI）应用程序开发。
该SDK已经完全配置好了LVGL（如果模块存在，则还包括PXP/VGLite支持），无需额外的集成工作。


HW acceleration for NXP iMX RT platforms（NXP iMX RT 平台的硬件加速）
--------------------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Depending on the RT platform used, the acceleration can be done by NXP PXP
(PiXel Pipeline) and/or the Verisilicon GPU through an API named VGLite. Each
accelerator has its own context that allows them to be used individually as well
simultaneously (in LVGL multithreading mode).

.. raw:: html

   </details>
   <br>


根据使用的 RT 平台不同，加速可以通过 NXP PXP（PiXel Pipeline）和/或 Verisilicon GPU 进行，通过名为 VGLite 的 API 实现。
每个加速器都有自己的上下文，使其可以单独使用，也可以在 LVGL 多线程模式下同时使用。


PXP accelerator（PXP加速器）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Basic configuration:（基本配置：）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

- Select NXP PXP engine in "lv_conf.h": Set :c:macro:`LV_USE_DRAW_PXP` to `1`.
- Enable PXP asserts in "lv_conf.h": Set :c:macro: `LV_USE_PXP_ASSERT` to `1`.
  There are few PXP assertions that can stop the program execution in case the
  c:macro: `LV_ASSERT_HANDLER` is set to `while(1);` (Halt by default). Else,
  there will be logged just an error message via `LV_LOG_ERROR`.
- If :c:macro:`SDK_OS_FREE_RTOS` symbol is defined, FreeRTOS implementation
  will be used, otherwise bare metal code will be included.

.. raw:: html

   </details>
   <br>


- 在 "lv_conf.h" 中选择 NXP PXP 引擎: 将 :c:macro:`LV_USE_DRAW_PXP` 设置为 `1`。
- 在 "lv_conf.h" 中启用 PXP 断言: 将 :c:macro:`LV_USE_PXP_ASSERT` 设置为 `1`。
  如果 :c:macro:`LV_ASSERT_HANDLER` 设置为 `while(1);` (默认情况下为停止)，则会有几个 PXP 断言可能会停止程序执行。否则，只会通过 `LV_LOG_ERROR` 记录错误消息。
- 如果定义了 :c:macro:`SDK_OS_FREE_RTOS` 符号，则会使用 FreeRTOS 实现，否则将包含裸机代码。


Basic initialization:（基本初始化：）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

PXP draw initialization is done automatically in :cpp:func:`lv_init()` once the
PXP is enabled, no user code is required:

.. code:: c

  #if LV_USE_DRAW_PXP
    lv_draw_pxp_init();
  #endif

During PXP initialization, a new draw unit `lv_draw_pxp_unit_t` will be created
with the additional callbacks:

.. code:: c

    lv_draw_pxp_unit_t * draw_pxp_unit = lv_draw_create_unit(sizeof(lv_draw_pxp_unit_t));
    draw_pxp_unit->base_unit.evaluate_cb = _pxp_evaluate;
    draw_pxp_unit->base_unit.dispatch_cb = _pxp_dispatch;
    draw_pxp_unit->base_unit.delete_cb = _pxp_delete;

and an addition thread `_pxp_render_thread_cb()` will be spawned in order to
handle the supported draw tasks.

.. code:: c

  #if LV_USE_OS
    lv_thread_init(&draw_pxp_unit->thread, LV_THREAD_PRIO_HIGH, _pxp_render_thread_cb, 2 * 1024, draw_pxp_unit);
  #endif

If `LV_USE_OS` is not defined, then no additional draw thread will be created
and the PXP drawing task will get executed on the same LVGL main thread.

`_pxp_evaluate()` will get called after each task is being created and will
analyze if the task is supported by PXP or not. If it is supported, then an
preferred score and the draw unit id will be set to the task. An `score` equal
to `100` is the default CPU score. Smaller score means that PXP is capable of
drawing it faster.

`_pxp_dispatch()` is the PXP dispatcher callback, it will take a ready to draw
task (having the `DRAW_UNIT_ID_PXP` set) and will pass the task to the PXP draw
unit for processing.

`_pxp_delete()` will cleanup the PXP draw unit.

.. raw:: html

   </details>
   <br>


PXP绘图的初始化在 `lv_init()` 函数中自动完成，一旦启用PXP，不需要用户代码：

.. code:: c

  #if LV_USE_DRAW_PXP
    lv_draw_pxp_init();
  #endif

在PXP初始化过程中，将创建一个新的绘图单元 `lv_draw_pxp_unit_t`，其中包含额外的回调函数：

.. code:: c

    lv_draw_pxp_unit_t * draw_pxp_unit = lv_draw_create_unit(sizeof(lv_draw_pxp_unit_t));
    draw_pxp_unit->base_unit.evaluate_cb = _pxp_evaluate;
    draw_pxp_unit->base_unit.dispatch_cb = _pxp_dispatch;
    draw_pxp_unit->base_unit.delete_cb = _pxp_delete;
 
还将启动一个名为 `_pxp_render_thread_cb()` 的线程，用于处理支持的绘图任务：

.. code:: c

  #if LV_USE_OS
    lv_thread_init(&draw_pxp_unit->thread, LV_THREAD_PRIO_HIGH, _pxp_render_thread_cb, 2 * 1024, draw_pxp_unit);
  #endif

如果没有定义 `LV_USE_OS`，那么不会创建额外的绘图线程，PXP绘图任务将在同一个LVGL主线程上执行。

`_pxp_evaluate()` 函数在每个任务创建后被调用，分析该任务是否受PXP支持。如果受支持，则会设置一个优先级分数和绘图单元ID给该任务。默认的CPU分数为 `100`。较小的分数意味着PXP能够更快地绘制。

`_pxp_dispatch()` 是PXP消息分发回调函数，它将接收一个准备好绘制的任务（设置了 `DRAW_UNIT_ID_PXP` ），并将任务传递给PXP绘图单元进行处理。

`_pxp_delete()` 函数将清理PXP绘图单元。


Features supported:（支持的功能：）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Several drawing features in LVGL can be offloaded to the PXP engine. The CPU is
available for other operations while the PXP is running. RTOS is required to
block the LVGL drawing thread and switch to another task or suspend the CPU for
power savings.

Supported draw tasks are available in "src/draw/nxp/pxp/lv_draw_pxp.c":

.. code:: c

    switch(t->type) {
        case LV_DRAW_TASK_TYPE_FILL:
            lv_draw_pxp_fill(draw_unit, t->draw_dsc, &t->area);
            break;
        case LV_DRAW_TASK_TYPE_IMAGE:
            lv_draw_pxp_img(draw_unit, t->draw_dsc, &t->area);
            break;
        case LV_DRAW_TASK_TYPE_LAYER:
            lv_draw_pxp_layer(draw_unit, t->draw_dsc, &t->area);
            break;
        default:
            break;
    }

Additional, the screen rotation can be handled by the PXP:

.. code::c

  void lv_draw_pxp_rotate(const void * src_buf, void * dest_buf, int32_t src_width, int32_t src_height,
                          int32_t src_stride, int32_t dest_stride, lv_display_rotation_t rotation,
                          lv_color_format_t cf);

- Fill area with color (w/o radius, w/o gradient) + optional opacity.
- Blit source image RGB565/ARGB888/XRGB8888 over destination.
  RGB565/RGB888/ARGB888/XRGB8888 + optional opacity.
- Recolor source image RGB565.
- Scale and rotate (90, 180, 270 degree) source image RGB565.
- Blending layers (w/ same supported formats as blitting).
- Rotate screen (90, 180, 270 degree).

.. raw:: html

   </details>
   <br>


LVGL中的几个绘图特性可以通过PXP引擎来卸载。当PXP运行时，CPU可以用于其他操作。使用RTOS可以阻塞LVGL绘图线程并切换到另一个任务或暂停CPU以节省电力。

支持的绘图任务在"src/draw/nxp/pxp/lv_draw_pxp.c"中可用：

.. code:: c

    switch(t->type) {
        case LV_DRAW_TASK_TYPE_FILL:
            lv_draw_pxp_fill(draw_unit, t->draw_dsc, &t->area);
            break;
        case LV_DRAW_TASK_TYPE_IMAGE:
            lv_draw_pxp_img(draw_unit, t->draw_dsc, &t->area);
            break;
        case LV_DRAW_TASK_TYPE_LAYER:
            lv_draw_pxp_layer(draw_unit, t->draw_dsc, &t->area);
            break;
        default:
            break;
    }


此外，屏幕旋转也可以由PXP处理：


.. code::c

  void lv_draw_pxp_rotate(const void * src_buf, void * dest_buf, int32_t src_width, int32_t src_height,
                          int32_t src_stride, int32_t dest_stride, lv_display_rotation_t rotation,
                          lv_color_format_t cf);


- 使用颜色填充区域（无半径，无渐变）+ 可选的不透明度。
- 将源图像RGB565/ARGB888/XRGB8888覆盖到目标图像上。
  RGB565/RGB888/ARGB888/XRGB8888 + 可选的不透明度。
- 对源图像RGB565重新上色。
- 缩放和旋转（90度，180度，270度）源图像RGB565。
- 混合图层（与混合格式相同）。
- 旋转屏幕（90度，180度，270度）。


Known limitations:（已知的限制：）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

- PXP can only rotate at 90x angles.
- Rotation is not supported for images unaligned to blocks of 16x16 pixels. PXP
  is set to process 16x16 blocks to optimize the system for memory bandwidth and
  image processing time. The output engine essentially truncates any output
  pixels after the desired number of pixels has been written. When rotating a
  source image and the output is not divisible by the block size, the incorrect
  pixels could be truncated and the final output image can look shifted.
- Recolor or transformation for images w/ opacity or alpha channel can't be
  obtained in a single PXP pipeline configuration. Two or multiple steps would
  be required.
- Buffer address must be aligned to 64 bytes: set :c:macro:`LV_DRAW_BUF_ALIGN`
  to `64` in "lv_conf.h".
  No stride alignment is required: set :c:macro:`LV_DRAW_BUF_STRIDE_ALIGN` to
  `1` in "lv_conf.h".

.. raw:: html

   </details>
   <br>


- PXP只能以90度的角度进行旋转。
- 不支持对未对齐到16x16像素块的图像进行旋转。PXP被设置为处理16x16块，以优化系统的内存带宽和图像处理时间。输出引擎在写入所需数量的像素后会截断任何输出像素。当旋转源图像且输出不可被块大小整除时，可能会截断错误的像素，最终输出的图像可能会看起来偏移。
- 无法在单个PXP管线配置中获得带不透明度或Alpha通道的图像的重新着色或变换。需要进行两个或多个步骤。
- 缓冲区地址必须对齐到64字节：在"lv_conf.h"中将 `LV_DRAW_BUF_ALIGN` 设置为 `64` 。不需要对齐步幅：在"lv_conf.h"中将 `LV_DRAW_BUF_STRIDE_ALIGN` 设置为 `1` 。


Project setup:（项目设置：）
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

- Add PXP related source files (and corresponding headers if available) to
  project:

   - "src/draw/nxp/pxp/lv_draw_buf_pxp.c": draw buffer callbacks
   - "src/draw/nxp/pxp/lv_draw_pxp_fill.c": fill area
   - "src/draw/nxp/pxp/lv_draw_pxp_img.c": blit image (w/ optional recolor or
   transformation)
   - "src/draw/nxp/pxp/lv_draw_pxp_layer.c": layer blending
   - "src/draw/nxp/pxp/lv_draw_pxp.c": draw unit initialization
   - "src/draw/nxp/pxp/lv_pxp_cfg.c": init, deinit, run/wait PXP device
   - "src/draw/nxp/pxp/lv_pxp_osa.c": OS abstraction (FreeRTOS or bare metal)
   - "src/draw/nxp/pxp/lv_pxp_utils.c": function helpers

- PXP related code depends on two drivers provided by MCU SDK. These drivers
  need to be added to project:

   - fsl_pxp.c: PXP driver
   - fsl_cache.c: CPU cache handling functions

.. raw:: html

   </details>
   <br>


- 添加与PXP相关的源文件（如果有的话，也包括相应的头文件）到项目中：

   - "src/draw/nxp/pxp/lv_draw_buf_pxp.c": 绘制缓冲回调
   - "src/draw/nxp/pxp/lv_draw_pxp_fill.c": 填充区域
   - "src/draw/nxp/pxp/lv_draw_pxp_img.c": 混合图像（可选择重新着色或变换）
   - "src/draw/nxp/pxp/lv_draw_pxp_layer.c": 图层混合
   - "src/draw/nxp/pxp/lv_draw_pxp.c": 绘制单元初始化
   - "src/draw/nxp/pxp/lv_pxp_cfg.c": 初始化、去初始化、运行/等待PXP设备
   - "src/draw/nxp/pxp/lv_pxp_osa.c": 操作系统抽象（FreeRTOS或裸机）
   - "src/draw/nxp/pxp/lv_pxp_utils.c": 功能辅助

- 与PXP相关的代码依赖于MCU SDK提供的两个驱动程序。这些驱动程序需要被添加到项目中：

   - fsl_pxp.c: PXP驱动程序
   - fsl_cache.c: CPU缓存处理函数


PXP default configuration:（PXP默认配置：）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

- Implementation depends on multiple OS-specific functions. The struct
  :cpp:struct:`pxp_cfg_t` with callback pointers is used as a parameter for the
  :cpp:func:`lv_pxp_init()` function. Default implementation for FreeRTOS and
  bare metal is provided in lv_pxp_osa.c.

   - :cpp:func:`pxp_interrupt_init()`: Initialize PXP interrupt (HW setup,
   OS setup)
   - :cpp:func:`pxp_interrupt_deinit()`: Deinitialize PXP interrupt (HW setup,
   OS setup)
   - :cpp:func:`pxp_run()`: Start PXP job. Use OS-specific mechanism to block
   drawing thread.
   - :cpp:func:`pxp_wait()`: Wait for PXP completion.

.. raw:: html

   </details>
   <br>


- 实现取决于多个特定于操作系统的函数。带有回调函数指针的结构 :cpp:struct:`pxp_cfg_t` 用作 :cpp:func:`lv_pxp_init()` 函数的参数。在 `lv_pxp_osa.c` 中提供了适用于 FreeRTOS 和裸机的默认实现。

   - :cpp:func:`pxp_interrupt_init()`: 初始化 PXP 中断（硬件设置，操作系统设置）
   - :cpp:func:`pxp_interrupt_deinit()`: 取消初始化 PXP 中断（硬件设置，操作系统设置）
   - :cpp:func:`pxp_run()`: 启动 PXP 任务。使用特定于操作系统的机制阻塞绘制线程。
   - :cpp:func:`pxp_wait()`: 等待 PXP 完成。


VGLite accelerator（VGLite加速器）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Extra drawing features in LVGL can be handled by the VGLite engine. The
CPU is available for other operations while the VGLite is running. An
RTOS is required to block the LVGL drawing thread and switch to another
task or suspend the CPU for power savings.

.. raw:: html

   </details>
   <br>


在LVGL中，额外的绘图特性可以由VGLite引擎处理。当VGLite正在运行时，CPU可用于其他操作。
需要RTOS来阻塞LVGL绘图线程并切换到另一个任务，或者将CPU挂起以节省电源。

Basic configuration:（基本配置：）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

- Select NXP VGLite engine in "lv_conf.h": Set :c:macro:`LV_USE_DRAW_VGLITE` to
  `1`. :c:macro:`SDK_OS_FREE_RTOS` symbol needs to be defined so that FreeRTOS
  driver osal implementation will be enabled.
- Enable VGLite asserts in "lv_conf.h": Set :c:macro: `LV_USE_VGLITE_ASSERT` to
  `1`.
  VGLite assertions will verify the driver API status code and in any error, it
  can stop the program execution in case the c:macro: `LV_ASSERT_HANDLER` is set
  to `while(1);` (Halt by default). Else, there will be logged just an error
  message via `LV_LOG_ERROR`.

.. raw:: html

   </details>
   <br>


- 在"lv_conf.h"中选择NXP VGLite引擎：将 :c:macro:`LV_USE_DRAW_VGLITE` 设置为 `1` 。需要定义 :c:macro:`SDK_OS_FREE_RTOS` 符号，以启用FreeRTOS驱动的操作系统适配层实现。
- 在"lv_conf.h"中启用VGLite断言：将 :c:macro:`LV_USE_VGLITE_ASSERT` 设置为 `1` 。
  VGLite断言将验证驱动API的状态码，在任何错误情况下，如果 :c:macro:`LV_USE_VGLITE_ASSERT` 设置为 `while(1);`（默认情况下为停止），它可以停止程序执行。否则，将只通过 `LV_LOG_ERROR` 记录错误消息。


Basic initialization:（基本初始化:）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Initialize VGLite GPU before calling :cpp:func:`lv_init()` by specifying the
width/height of tessellation window. The default values for tesselation width
and height, and command buffer size are in the SDK file "vglite_support.h".

.. code:: c

  #if LV_USE_GPU_NXP_VG_LITE
    #include "vg_lite.h"
    #include "vglite_support.h"
  #endif
    ...
  #if LV_USE_DRAW_VGLITE
    if(vg_lite_init(DEFAULT_VG_LITE_TW_WIDTH, DEFAULT_VG_LITE_TW_HEIGHT) != VG_LITE_SUCCESS)
    {
        PRINTF("VGLite init error. STOP.");
        vg_lite_close();
        while (1)
            ;
    }

    if (vg_lite_set_command_buffer_size(VG_LITE_COMMAND_BUFFER_SIZE) != VG_LITE_SUCCESS)
    {
        PRINTF("VGLite set command buffer. STOP.");
        vg_lite_close();
        while (1)
            ;
    }
  #endif

VGLite draw initialization is done automatically in :cpp:func:`lv_init()` once
the VGLite is enabled, no user code is required:

.. code:: c

  #if LV_USE_DRAW_VGLITE
    lv_draw_vglite_init();
  #endif

During VGLite initialization, a new draw unit `lv_draw_vglite_unit_t` will be
created with the additional callbacks:

.. code:: c

    lv_draw_vglite_unit_t * draw_vglite_unit = lv_draw_create_unit(sizeof(lv_draw_vglite_unit_t));
    draw_vglite_unit->base_unit.evaluate_cb = _vglite_evaluate;
    draw_vglite_unit->base_unit.dispatch_cb = _vglite_dispatch;
    draw_vglite_unit->base_unit.delete_cb = _vglite_delete;

and an addition thread `_vglite_render_thread_cb()` will be spawned in order to
handle the supported draw tasks.

.. code:: c

  #if LV_USE_OS
    lv_thread_init(&draw_vglite_unit->thread, LV_THREAD_PRIO_HIGH, _vglite_render_thread_cb, 2 * 1024, draw_vglite_unit);
  #endif

If `LV_USE_OS` is not defined, then no additional draw thread will be created
and the VGLite drawing task will get executed on the same LVGL main thread.

`_vglite_evaluate()` will get called after each task is being created and will
analyze if the task is supported by VGLite or not. If it is supported, then an
preferred score and the draw unit id will be set to the task. An `score` equal
to `100` is the default CPU score. Smaller score means that VGLite is capable of
drawing it faster.

`_vglite_dispatch()` is the VGLite dispatcher callback, it will take a ready to
draw task (having the `DRAW_UNIT_ID_VGLITE` set) and will pass the task to the
VGLite draw unit for processing.

`_vglite_delete()` will cleanup the VGLite draw unit.

.. raw:: html

   </details>
   <br>


在调用 :cpp:func:`lv_init()` 之前，请通过指定镶嵌窗口的宽度/高度来初始化VGLite GPU。镶嵌窗口的默认宽度和高度以及指令缓冲区大小的默认值可以在SDK文件"vglite_support.h"中找到。

.. code:: c

  #if LV_USE_GPU_NXP_VG_LITE
    #include "vg_lite.h"
    #include "vglite_support.h"
  #endif
    ...
  #if LV_USE_DRAW_VGLITE
    if(vg_lite_init(DEFAULT_VG_LITE_TW_WIDTH, DEFAULT_VG_LITE_TW_HEIGHT) != VG_LITE_SUCCESS)
    {
        PRINTF("VGLite初始化错误。停止。");
        vg_lite_close();
        while (1)
            ;
    }

    if (vg_lite_set_command_buffer_size(VG_LITE_COMMAND_BUFFER_SIZE) != VG_LITE_SUCCESS)
    {
        PRINTF("VGLite设置指令缓冲区错误。停止。");
        vg_lite_close();
        while (1)
            ;
    }
  #endif

VGLite绘制初始化在启用VGLite后会自动在 :cpp:func:`lv_init()` 中完成，不需要用户代码：

.. code:: c

  #if LV_USE_DRAW_VGLITE
    lv_draw_vglite_init();
  #endif

在VGLite初始化期间，将使用附加回调函数创建一个新的绘制单元 `lv_draw_vglite_unit_t`：

.. code:: c

    lv_draw_vglite_unit_t * draw_vglite_unit = lv_draw_create_unit(sizeof(lv_draw_vglite_unit_t));
    draw_vglite_unit->base_unit.evaluate_cb = _vglite_evaluate;
    draw_vglite_unit->base_unit.dispatch_cb = _vglite_dispatch;
    draw_vglite_unit->base_unit.delete_cb = _vglite_delete;

并会生成一个额外的线程 `_vglite_render_thread_cb()` 来处理支持的绘制任务。

.. code:: c

  #if LV_USE_OS
    lv_thread_init(&draw_vglite_unit->thread, LV_THREAD_PRIO_HIGH, _vglite_render_thread_cb, 2 * 1024, draw_vglite_unit);
  #endif

如果未定义`LV_USE_OS`，则不会创建额外的绘制线程，VGLite绘制任务将在相同的LVGL主线程上执行。

`_vglite_evaluate()` 将在每个任务创建后被调用，并分析该任务是否受到VGLite支持。如果受支持，则将为任务设置一个优先评分和绘制单元ID。默认的CPU评分为 `100`。较低的评分意味着VGLite能够更快地绘制。
 
`_vglite_dispatch()` 是VGLite调度回调函数，它将获取一个准备好绘制的任务（设置了 `DRAW_UNIT_ID_VGLITE` ），并将任务传递给VGLite绘制单元进行处理。

`_vglite_delete()` 将清理VGLite绘制单元。


Advanced configuration:（高级配置：）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

- Enable VGLite blit split in "lv_conf.h":
  Set :c:macro: `LV_USE_VGLITE_BLIT_SPLIT` to `1`.
  Enabling the blit split workaround will mitigate any quality degradation issue
  on screen's dimension > 352 pixels.

.. code:: c

  #define VGLITE_BLIT_SPLIT_THR 352

- By default, the blit split threshold is set to 352. Blits with width or height
  higher than this value will be done in multiple steps. Value must be multiple
  of stride alignment in px. For most color formats, the alignment is 16px
  (except the index formats). Transformation will not be supported once with
  the blit split.

- Enable VGLite draw task synchronously in "lv_conf.h":
  Set :c:macro: `LV_USE_VGLITE_DRAW_ASYNC` to `1`.
  Multiple draw tasks can be queued and flushed them once to the GPU based on
  the GPU idle status. If GPU is busy, the task will be queued, and the VGLite
  dispatcher will ask for a new available task. If GPU is idle, the queue with
  any pending tasks will be flushed to the GPU. The completion status of draw
  task will be sent to the main LVGL thread asynchronously.

.. raw:: html

   </details>
   <br>


- 在 "lv_conf.h" 中启用 VGLite blit 分割：
  将 :c:macro: `LV_USE_VGLITE_BLIT_SPLIT` 设置为 `1`。
  启用 blit 分割 workaround 将减轻屏幕尺寸大于352像素时的任何质量损失问题。

.. code:: c

  #define VGLITE_BLIT_SPLIT_THR 352

- 默认情况下，blit 分割阈值设置为352。宽度或高度大于此值的 blits 将以多个步骤完成。
值必须是像素中的对齐倍数。对于大多数颜色格式，对齐方式是16像素（除了索引格式）。在进行 blit 分割时将不支持转换操作。

- 在 "lv_conf.h" 中同步启用 VGLite 绘制任务：
  将 :c:macro:`LV_USE_VGLITE_DRAW_ASYNC` 设置为 `1`。
  可以将多个绘制任务排队并基于 GPU 的空闲状态一次刷新到 GPU 中。如果 GPU 正忙，任务将被排队，而 VGLite 调度程序将请求新的可用任务。
  如果 GPU 空闲，则将刷新带有任何待处理任务的队列到 GPU。绘制任务的完成状态将异步发送给主 LVGL 线程。


Features supported:（支持的功能：）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Several drawing features in LVGL can be offloaded to the VGLite engine. The CPU
is available for other operations while the GPU is running. RTOS is required to
block the LVGL drawing thread and switch to another task or suspend the CPU for
power savings.

Supported draw tasks are available in "src/draw/nxp/pxp/lv_draw_vglite.c":

.. code:: c

    switch(t->type) {
        case LV_DRAW_TASK_TYPE_LABEL:
            lv_draw_vglite_label(draw_unit, t->draw_dsc, &t->area);
            break;
        case LV_DRAW_TASK_TYPE_FILL:
            lv_draw_vglite_fill(draw_unit, t->draw_dsc, &t->area);
            break;
        case LV_DRAW_TASK_TYPE_BORDER:
            lv_draw_vglite_border(draw_unit, t->draw_dsc, &t->area);
            break;
        case LV_DRAW_TASK_TYPE_IMAGE:
            lv_draw_vglite_img(draw_unit, t->draw_dsc, &t->area);
            break;
        case LV_DRAW_TASK_TYPE_ARC:
            lv_draw_vglite_arc(draw_unit, t->draw_dsc, &t->area);
            break;
        case LV_DRAW_TASK_TYPE_LINE:
            lv_draw_vglite_line(draw_unit, t->draw_dsc);
            break;
        case LV_DRAW_TASK_TYPE_LAYER:
            lv_draw_vglite_layer(draw_unit, t->draw_dsc, &t->area);
            break;
        case LV_DRAW_TASK_TYPE_TRIANGLE:
            lv_draw_vglite_triangle(draw_unit, t->draw_dsc);
            break;
        default:
            break;
    }

All the below operation can be done in addition with optional opacity.
- Fill area with color (w/ radius or gradient).
- Blit source image (any format from `_vglite_src_cf_supported()`) over
  destination (any format from `_vglite_dest_cf_supported()`).
- Recolor source image.
- Scale and rotate (any decimal degree) source image.
- Blending layers (w/ same supported formats as blitting).
- Draw letters (blit bitmap letters - raster font).
- Draw full borders (LV_BORDER_SIDE_FULL).
- Draw arcs (w/ rounded edges).
- Draw lines (w/ dash or rounded edges).
- Draw triangles with color (w/ gradient).

.. raw:: html

   </details>
   <br>


在LVGL中，可以将一些绘图功能卸载到VGLite引擎中。当GPU运行时，CPU可以用于其他操作。为了节省功耗，需要使用RTOS来阻塞LVGL绘图线程并切换到其他任务或挂起CPU。

支持的绘图任务可以在"src/draw/nxp/pxp/lv_draw_vglite.c"中找到：

.. code:: c

    switch(t->type) {
        case LV_DRAW_TASK_TYPE_LABEL:
            lv_draw_vglite_label(draw_unit, t->draw_dsc, &t->area);
            break;
        case LV_DRAW_TASK_TYPE_FILL:
            lv_draw_vglite_fill(draw_unit, t->draw_dsc, &t->area);
            break;
        case LV_DRAW_TASK_TYPE_BORDER:
            lv_draw_vglite_border(draw_unit, t->draw_dsc, &t->area);
            break;
        case LV_DRAW_TASK_TYPE_IMAGE:
            lv_draw_vglite_img(draw_unit, t->draw_dsc, &t->area);
            break;
        case LV_DRAW_TASK_TYPE_ARC:
            lv_draw_vglite_arc(draw_unit, t->draw_dsc, &t->area);
            break;
        case LV_DRAW_TASK_TYPE_LINE:
            lv_draw_vglite_line(draw_unit, t->draw_dsc);
            break;
        case LV_DRAW_TASK_TYPE_LAYER:
            lv_draw_vglite_layer(draw_unit, t->draw_dsc, &t->area);
            break;
        case LV_DRAW_TASK_TYPE_TRIANGLE:
            lv_draw_vglite_triangle(draw_unit, t->draw_dsc);
            break;
        default:
            break;
    }

除此之外，还可以选择性地执行以下操作，并可选择不透明度：

- 用颜色填充区域（带有半径或渐变）。

- 将源图像（来自 `_vglite_src_cf_supported()` 的任何格式）叠加到目标图像（来自 `_vglite_dest_cf_supported()` 的任何格式）上。

- 对源图像重新着色。

- 缩放和旋转（任意小数度数）源图像。

- 图层混合（与混合相同支持的格式）。

- 绘制字母（位图字母 - 光栅字体）。

- 绘制完整边框（LV_BORDER_SIDE_FULL）。

- 绘制弧形（带有圆角边缘）。

- 绘制线条（带有虚线或圆角边缘）。

- 用颜色绘制三角形（带有渐变）。


Known limitations:（已知限制：）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

- Source image alignment: The byte alignment requirement for a pixel depends on
  the specific pixel format. Both buffer address and buffer stride must be
  aligned. As general rule, the alignment is set to 16 pixels. This makes the
  buffer address alignment to be 32 bytes for RGB565 and 64 bytes for ARGB8888.
- For pixel engine (PE) destination, the alignment should be 64 bytes for all
  tiled (4x4) buffer layouts. The pixel engine has no additional alignment
  requirement for linear buffer layouts (:c:macro:`VG_LITE_LINEAR`).

.. raw:: html

   </details>
   <br>


- 源图像对齐：每个像素的字节对齐要求取决于具体的像素格式。缓冲地址和缓冲行距都必须对齐。一般规则是将对齐设置为16个像素。这使得RGB565的缓冲地址对齐为32字节，ARGB8888的缓冲地址对齐为64字节。
- 对于像素引擎（PE）的目标地址，所有平铺（4x4）缓冲布局的对齐要求应为64字节。像素引擎对线性缓冲布局（:c:macro:`VG_LITE_LINEAR`）没有额外的对齐要求。


Project setup:（项目设置：）
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

- Add VGLite related source files (and corresponding headers if available) to
  project:

   - "src/draw/nxp/vglite/lv_draw_buf_vglite.c": draw buffer callbacks
   - "src/draw/nxp/vglite/lv_draw_vglite_arc.c": draw arc
   - "src/draw/nxp/vglite/lv_draw_vglite_border.c": draw border
   - "src/draw/nxp/vglite/lv_draw_vglite_fill.c": fill area
   - "src/draw/nxp/vglite/lv_draw_vglite_img.c": blit image (w/ optional
   recolor or transformation)
   - "src/draw/nxp/vglite/lv_draw_vglite_label.c": draw label
   - "src/draw/nxp/vglite/lv_draw_vglite_layer.c": layer blending
   - "src/draw/nxp/vglite/lv_draw_vglite_line.c": draw line
   - "src/draw/nxp/vglite/lv_draw_vglite_triangle.c": draw triangle
   - "src/draw/nxp/vglite/lv_draw_vglite.c": draw unit initialization
   - "src/draw/nxp/vglite/lv_vglite_buf.c": init/get vglite buffer
   - "src/draw/nxp/vglite/lv_vglite_matrix.c": set vglite matrix
   - "src/draw/nxp/vglite/lv_vglite_path.c": create vglite path data
   - "src/draw/nxp/vglite/lv_vglite_utils.c": function helpers

.. raw:: html

   </details>
   <br>


- 将VGLite相关的源文件（如果有的话，还附带对应的头文件）添加到项目中：

- "src/draw/nxp/vglite/lv_draw_buf_vglite.c": 绘制缓冲区回调
- "src/draw/nxp/vglite/lv_draw_vglite_arc.c": 绘制圆弧
- "src/draw/nxp/vglite/lv_draw_vglite_border.c": 绘制边框
- "src/draw/nxp/vglite/lv_draw_vglite_fill.c": 填充区域
- "src/draw/nxp/vglite/lv_draw_vglite_img.c": 拷贝图像（带有可选的着色或变换）
- "src/draw/nxp/vglite/lv_draw_vglite_label.c": 绘制标签
- "src/draw/nxp/vglite/lv_draw_vglite_layer.c": 图层混合
- "src/draw/nxp/vglite/lv_draw_vglite_line.c": 绘制线条
- "src/draw/nxp/vglite/lv_draw_vglite_triangle.c": 绘制三角形
- "src/draw/nxp/vglite/lv_draw_vglite.c": 绘制单元初始化
- "src/draw/nxp/vglite/lv_vglite_buf.c": 初始化/获取VGLite缓冲区
- "src/draw/nxp/vglite/lv_vglite_matrix.c": 设置VGLite矩阵
- "src/draw/nxp/vglite/lv_vglite_path.c": 创建VGLite路径数据
- "src/draw/nxp/vglite/lv_vglite_utils.c": 函数帮助程序

