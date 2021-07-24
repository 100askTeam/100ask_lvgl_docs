```eval_rst
.. include:: /header.rst
:github_url: |github_link_base|/get-started/nxp.md
```
# NXP

<details>
<summary>查看原文</summary>
<p>

NXP has integrated LVGL into the MCUXpresso SDK packages for several of their general
purpose and crossover microcontrollers, allowing easy evaluation and migration into your
product design. [Download an SDK for a supported board](https://www.nxp.com/design/software/embedded-software/littlevgl-open-source-graphics-library:LITTLEVGL-OPEN-SOURCE-GRAPHICS-LIBRARY?&tid=vanLITTLEVGL-OPEN-SOURCE-GRAPHICS-LIBRARY)
today and get started with your next GUI application.

</p>
</details>

恩智浦(NXP)已将 LVGL 集成到 MCUXpresso SDK 包中，用于其多个通用和跨界微控制器，从而可以轻松评估和迁移到您的产品设计中。 [立即下载支持的开发板的 SDK](https://www.nxp.com/design/software/embedded-software/littlevgl-open-source-graphics-library:LITTLEVGL-OPEN-SOURCE-GRAPHICS-LIBRARY?&tid=vanLITTLEVGL-OPEN-SOURCE-GRAPHICS-LIBRARY) ，并开始使用您的下一个 GUI 应用程序。

## Creating new project with LVGL（使用 LVGL 创建新项目）

<details>
<summary>查看原文</summary>
<p>

Downloading the MCU SDK example project is recommended as a starting point. It comes fully configured with LVGL (and with PXP support if module is present), no additional integration work is required.

</p>
</details>

建议首先下载 MCU SDK 示例项目。它完全配置了 LVGL（如果存在模块，还支持 PXP），不需要额外的集成工作。

## Adding HW acceleration for NXP iMX RT platforms using PXP (PiXel Pipeline) engine for existing projects

<details>
<summary>查看原文</summary>
<p>

Several drawing features in LVGL can be offloaded to PXP engine. In order to use CPU time while PXP is running, RTOS is required to block the LVGL drawing thread and switch to another task, or simply to idle task, where CPU could be suspended to save power.

</p>
</details>

LVGL 中的几个绘图功能可以卸载到 PXP 引擎。为了在 PXP 运行时使用 CPU 时间，RTOS 需要阻塞 LVGL 绘图线程并切换到另一个任务，或者简单地切换到空闲任务，在那里 CPU 可以暂停以节省电量。

#### Features supported:

<details>
<summary>查看原文</summary>
<p>

  - RGB565 color format
  - Area fill + optional transparency
  - BLIT (BLock Image Transfer) + optional transparency
  - Color keying + optional transparency
  - Recoloring (color tint) + optional transparency
  - RTOS integration layer
  - Default FreeRTOS and bare metal code provided

</p>
</details>

- RGB565 颜色格式
- 区域填充 + 可选透明度
- BLIT（块图像传输）+可选的透明度
- 颜色键控 + 可选透明度
- 重新着色（色调）+ 可选的透明度
- RTOS 集成层
- 提供默认的 FreeRTOS 和裸机代码


#### Basic configuration:

<details>
<summary>查看原文</summary>
<p>

  - Select NXP PXP engine in lv_conf.h: Set `LV_USE_GPU_NXP_PXP` to 1
  - Enable default implementation for interrupt handling, PXP start function and automatic initialization: Set `LV_USE_GPU_NXP_PXP_AUTO_INIT` to 1
  - If `FSL_RTOS_FREE_RTOS` symbol is defined, FreeRTOS implementation will be used, otherwise bare metal code will be included

</p>
</details>

- 在 lv_conf.h 中选择 NXP PXP 引擎：将 `LV_USE_GPU_NXP_PXP` 设置为 1
- 启用中断处理、PXP 启动功能和自动初始化的默认实现：将 `LV_USE_GPU_NXP_PXP_AUTO_INIT` 设置为 1
- 如果定义了 `FSL_RTOS_FREE_RTOS` 符号，将使用 FreeRTOS 实现，否则将包含裸机代码

#### Basic initialization:

<details>
<summary>查看原文</summary>
<p>

  - If `LV_USE_GPU_NXP_PXP_AUTO_INIT` is enabled, no user code is required; PXP is initialized automatically in `lv_init()`
  - For manual PXP initialization, default configuration structure for callbacks can be used. Initialize PXP before calling `lv_init()`

</p>
</details>

- 如果启用`LV_USE_GPU_NXP_PXP_AUTO_INIT`，则不需要用户代码； PXP 在 `lv_init()` 中自动初始化
- 对于手动 PXP 初始化，可以使用回调的默认配置结构。在调用 `lv_init()` 之前初始化 PXP


```c
      #if LV_USE_GPU_NXP_PXP
        #include "lv_gpu/lv_gpu_nxp_pxp.h"
        #include "lv_gpu/lv_gpu_nxp_pxp_osa.h"
      #endif
      . . .
      #if LV_USE_GPU_NXP_PXP
        if (lv_gpu_nxp_pxp_init(&pxp_default_cfg) != LV_RES_OK) {
            PRINTF("PXP init error. STOP.\n");
            for ( ; ; ) ;
        }
      #endif
```

#### Project setup:

<details>
<summary>查看原文</summary>
<p>

  - Add PXP related files to project:
    - lv_gpu/lv_gpu_nxp.c, lv_gpu/lv_gpu_nxp.h: low level drawing calls for LVGL
    - lv_gpu/lv_gpu_nxp_osa.c, lv_gpu/lv_gpu_osa.h: default implementation of OS-specific functions (bare metal and FreeRTOS only)
        - optional, required only if `LV_USE_GPU_NXP_PXP_AUTO_INIT` is set to 1
  - PXP related code depends on two drivers provided by MCU SDK. These drivers need to be added to project:
      - fsl_pxp.c, fsl_pxp.h: PXP driver
      - fsl_cache.c, fsl_cache.h: CPU cache handling functions

</p>
</details>

- 将 PXP 相关文件添加到项目中：
  - lv_gpu/lv_gpu_nxp.c, lv_gpu/lv_gpu_nxp.h: LVGL 的低级绘图调用
  - lv_gpu/lv_gpu_nxp_osa.c、lv_gpu/lv_gpu_osa.h：操作系统特定功能的默认实现（仅限裸机和 FreeRTOS）
    - 可选，仅当 `LV_USE_GPU_NXP_PXP_AUTO_INIT` 设置为 1 时才需要
  - PXP 相关代码依赖于 MCU SDK 提供的两个驱动程序。这些驱动程序需要添加到项目中：
    - fsl_pxp.c、fsl_pxp.h：PXP 驱动程序
    - fsl_cache.c、fsl_cache.h：CPU缓存处理函数

#### Advanced configuration:

<details>
<summary>查看原文</summary>
<p>

  - Implementation depends on multiple OS-specific functions. Structure lv_nxp_pxp_cfg_t` with callback pointers is used    as a parameter for `lv_gpu_nxp_pxp_init()` function. Default implementation for FreeRTOS and baremetal is provided in lv_gpu_nxp_osa.c
      - `pxp_interrupt_init()`: Initialize PXP interrupt (HW setup, OS setup)
      - `pxp_interrupt_deinit()`: Deinitialize PXP interrupt (HW setup, OS setup)
      - `pxp_run()`: Start PXP job. Use OS-specific mechanism to block drawing thread. PXP must finish drawing before leaving this function.

</p>
</details>

- 实现取决于多个特定于操作系统的功能。带有回调指针的结构 lv_nxp_pxp_cfg_t` 用作 `lv_gpu_nxp_pxp_init()` 函数的参数。 lv_gpu_nxp_osa.c 中提供了 FreeRTOS 和裸机的默认实现
  - `pxp_interrupt_init()`：初始化 PXP 中断（硬件设置，操作系统设置）
  - `pxp_interrupt_deinit()`：取消初始化 PXP 中断（硬件设置，操作系统设置）
  - `pxp_run()`: 启动 PXP 作业。使用特定于操作系统的机制来阻止绘图线程。 PXP 必须完成绘图才能离开此功能。

<details>
<summary>查看原文</summary>
<p>

  - There are configurable area thresholds which are used to decide whether the area will be processed by CPU, or by PXP. Areas smaller than defined value will be processed by CPU, areas bigger than the threshold will be processed by PXP. These thresholds may be defined as a preprocessor variables. Default values are defined lv_gpu/lv_gpu_nxp_pxp.h
      - `GPU_NXP_PXP_BLIT_SIZE_LIMIT`: size threshold for image BLIT, BLIT with color keying, and BLIT with recolor (OPA > LV_OPA_MAX)
      - `GPU_NXP_PXP_BLIT_OPA_SIZE_LIMIT`: size threshold for image BLIT and BLIT with color keying with transparency (OPA < LV_OPA_MAX)
      - `GPU_NXP_PXP_FILL_SIZE_LIMIT`: size threshold for fill operation (OPA > LV_OPA_MAX)
      - `GPU_NXP_PXP_FILL_OPA_SIZE_LIMIT`: size threshold for fill operation with transparency (OPA < LV_OPA_MAX)

</p>
</details>

- 有可配置的区域阈值，用于决定该区域是由 CPU 处理还是由 PXP 处理。小于定义值的区域将由 CPU 处理，大于阈值的区域将由 PXP 处理。这些阈值可以定义为预处理器变量。默认值定义在 lv_gpu/lv_gpu_nxp_pxp.h
  - `GPU_NXP_PXP_BLIT_SIZE_LIMIT`：图像 BLIT、带颜色键控的 BLIT 和带重新着色的 BLIT 的大小阈值（OPA > LV_OPA_MAX）
  - `GPU_NXP_PXP_BLIT_OPA_SIZE_LIMIT`：图像 BLIT 和 BLIT 的大小阈值，带有透明度的颜色键控 (OPA < LV_OPA_MAX)
  - `GPU_NXP_PXP_FILL_SIZE_LIMIT`：填充操作的大小阈值（OPA > LV_OPA_MAX）
  - `GPU_NXP_PXP_FILL_OPA_SIZE_LIMIT`：透明填充操作的尺寸阈值（OPA < LV_OPA_MAX）

