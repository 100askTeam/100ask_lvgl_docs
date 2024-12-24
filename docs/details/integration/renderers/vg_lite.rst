.. _vg_lite:

=====================================
VG-Lite General GPU（VG-Lite通用GPU）
=====================================

.. raw:: html

   <details>
     <summary>显示原文</summary>

This is a generic VG-Lite rendering backend implementation that is designed to utilize
`VeriSilicon <https://verisilicon.com/>`_'s generic API to operate GPU hardware as much as possible.

Even with different chip manufacturers, as long as they use the same version of VG-Lite API as the rendering backend,
LVGL rendering acceleration can be supported without the need for LVGL adaptation work.

.. raw:: html

   </details> 
   <br>


这是一个通用的 VG-Lite 渲染后端实现，旨在尽可能利用 `VeriSilicon <https://verisilicon.com/>`_ 的通用 API 来操作 GPU 硬件。

即使是不同的芯片制造商，只要它们使用与渲染后端相同版本的 VG-Lite API，就可以支持 LVGL 渲染加速，无需进行 LVGL 适配工作。

Configuration（配置）
*********************

.. raw:: html

   <details>
     <summary>显示原文</summary>

1. Set :c:macro:`LV_USE_DRAW_VG_LITE` to 1 in ``lv_conf.h`` to enabled the VG-Lite rendering backend.
   Make sure that your hardware has been adapted to the VG-Lite API and that the absolute path to ``vg_lite.h``, which can be directly referenced by lvgl, has been exposed.

2. Confirm the GPU initialization method, there are two ways:

   - The SDK calls the GPU initialization function on its own during system startup, and the GPU is available when LVGL starts; set :c:macro:`LV_VG_LITE_USE_GPU_INIT` to 0.
   - LVGL actively calls the GPU initialization function, and the SDK needs to implement the public function `gpu_init()`.
     LVGL will call it to complete the GPU hardware initialization during startup; set :c:macro:`LV_VG_LITE_USE_GPU_INIT` to 1.

3. Set the :c:macro:`LV_VG_LITE_USE_ASSERT` configuration to enable GPU call parameter checking.
   Due to the complexity of the parameters used in GPU calls, incorrect parameters can result in abnormal GPU hardware operation, such as forgetting to add an end symbol
   to the path or not meeting the alignment requirements for buffer stride.
   To quickly resolve such issues, strict parameter checking has been added before each VG-Lite call, including buffer stride validation and matrix invertibility check.
   When an error parameter is detected, an assertion will occur to print out the error parameter, allowing the user to promptly make corrections and reduce the time wasted on hardware simulation.
   Please note that enabling this check will decrease runtime performance. It is recommended to enable it in Debug mode and disable it in the Release version.

4. Set the :c:macro:`LV_VG_LITE_FLUSH_MAX_COUNT` configuration to specify the flush method.
   VG-Lite uses two sets of command buffer buffers to render instructions, and utilizing this mechanism well can greatly improve drawing efficiency.
   Currently, two buffering methods are supported:

   - Set :c:macro:`LV_VG_LITE_FLUSH_MAX_COUNT` to zero (recommended). The rendering backend will obtain the GPU's working status every time it writes rendering instructions to the command buffer.

   When the GPU is idle, it will immediately call ``vg_lite_flush`` to notify the GPU to start rendering and swap the command buffer. When the GPU is busy, it will continue to fill the command buffer cache with rendering instructions.
   The underlying driver will automatically determine if the command buffer has been filled. When it is about to be filled, it will forcibly wait for the unfinished drawing tasks to end and swap the command buffer.
   This method can effectively improve GPU utilization, especially in scenarios where rendering text, as the GPU's drawing time and the CPU's data preparation time are very close, allowing the CPU and GPU to run in parallel.

   - Set :c:macro:`LV_VG_LITE_FLUSH_MAX_COUNT` to a value greater than zero, such as 8. After writing 8 rendering instructions to the command buffer, the rendering backend

   will call ``vg_lite_flush`` to notify the GPU to start rendering and swap the command buffer.

5. Set the :c:macro:`LV_VG_LITE_USE_BOX_SHADOW` configuration to use GPU rendering for shadows.
   In fact, GPU hardware does not actually support shadow rendering. However, through experimentation, it has been found that a similar shadow effect
   can be achieved by using multiple layers of borders with different levels of transparency.
   It is recommended to enable this configuration in scenarios where the shadow quality requirements are not high, as it can significantly improve rendering efficiency.

6. Set the :c:macro:`LV_VG_LITE_GRAD_CACHE_CNT` configuration to specify the number of gradient cache entries.
   Gradient drawing includes linear gradients and radial gradients. Using a cache can effectively reduce the number of times the gradient image is created and improve drawing efficiency.
   Each individual gradient consumes around 4K of GPU memory pool. If there are many gradients used in the interface, you can try increasing the number of gradient cache entries.
   If the VG-Lite API returns the :c:macro:`VG_LITE_OUT_OF_RESOURCES` error, you can try increasing the size of the GPU memory pool or reducing the number of gradient cache entries.

7. Set the :c:macro:`LV_VG_LITE_STROKE_CACHE_CNT` configuration to specify the number of stroke path caches.
   When the stroke parameters do not change, the previously generated stroke parameters are automatically retrieved from the cache to improve rendering performance.
   The memory occupied by the stroke is strongly related to the path length. If the VG-Lite API returns the :c:macro:`VG_LITE_OUT_OF_RESOURCES` error,
   you can try increasing the size of the GPU memory pool or reducing the number of stroke cache entries.

NOTE: VG-Lite rendering backend does not support multi-threaded calls, please make sure :c:macro:`LV_USE_OS` is always configured as :c:macro:`LV_OS_NONE`.

.. raw:: html

   </details> 
   <br>

1. 在 ``lv_conf.h`` 中将宏 :c:macro:`LV_USE_DRAW_VG_LITE` 设置为 1，以启用 VG-Lite 渲染后端。确保您的硬件已适配 VG-Lite API，并且已暴露可以直接由 LVGL 引用的 ``vg_lite.h`` 的绝对路径。

2. 确认 GPU 初始化方法，有两种方式：

   - SDK 在系统启动时自行调用 GPU 初始化函数，并且 LVGL 启动时 GPU 已可用；将 :c:macro:`LV_VG_LITE_USE_GPU_INIT` 设置为 0。
   - LVGL 主动调用 GPU 初始化函数，SDK 需要实现公共函数 `gpu_init()`。  
     LVGL 会在启动时调用此函数来完成 GPU 硬件初始化；将 :c:macro:`LV_VG_LITE_USE_GPU_INIT` 设置为 1。

3. 设置 :c:macro:`LV_VG_LITE_USE_ASSERT` 配置以启用 GPU 调用参数检查。  
   由于 GPU 调用中使用的参数复杂，不正确的参数可能导致 GPU 硬件操作异常，例如忘记在路径中添加结束符号或未满足缓冲区步幅的对齐要求。  
   为了快速解决此类问题，在每次 VG-Lite 调用前已添加严格的参数检查，包括缓冲区步幅验证和矩阵可逆性检查。  
   当检测到错误参数时，会触发断言并打印错误参数，允许用户及时修正，减少硬件仿真过程中的时间浪费。  
   请注意，启用此检查会降低运行时性能。建议在调试模式下启用，在发布版本中禁用。

4. 设置 :c:macro:`LV_VG_LITE_FLUSH_MAX_COUNT` 配置以指定刷新方法。  
   VG-Lite 使用两组命令缓冲区来渲染指令，合理利用该机制可以大大提高绘制效率。  
   目前，支持两种缓冲方法：

   - 将 :c:macro:`LV_VG_LITE_FLUSH_MAX_COUNT` 设置为零（推荐）。每次渲染后端写入渲染指令到命令缓冲区时，渲染后端会获取 GPU 的工作状态。  
     当 GPU 空闲时，它将立即调用 ``vg_lite_flush`` 来通知 GPU 开始渲染并交换命令缓冲区。当 GPU 正忙时，继续向命令缓冲区缓存渲染指令。  
     底层驱动会自动判断命令缓冲区是否已满，当接近填满时，会强制等待未完成的绘制任务结束并交换命令缓冲区。  
     此方法可以有效提高 GPU 利用率，特别是在渲染文本时，因为 GPU 的绘制时间与 CPU 的数据准备时间非常接近，允许 CPU 和 GPU 并行运行。

   - 将 :c:macro:`LV_VG_LITE_FLUSH_MAX_COUNT` 设置为大于零的值，例如 8。写入 8 条渲染指令到命令缓冲区后，渲染后端将调用 ``vg_lite_flush`` 来通知 GPU 开始渲染并交换命令缓冲区。

5. 设置 :c:macro:`LV_VG_LITE_USE_BOX_SHADOW` 配置以使用 GPU 渲染阴影。  
   实际上，GPU 硬件并不真正支持阴影渲染。然而，通过实验发现，可以通过使用多个具有不同透明度的边框层来实现类似的阴影效果。  
   建议在阴影质量要求不高的场景中启用此配置，因为它可以显著提高渲染效率。

6. 设置 :c:macro:`LV_VG_LITE_GRAD_CACHE_CNT` 配置以指定渐变缓存条目的数量。  
   渐变绘制包括线性渐变和径向渐变。使用缓存可以有效减少每次创建渐变图像的次数，提高绘制效率。  
   每个单独的渐变大约消耗 4K 的 GPU 内存池。如果界面中使用了许多渐变，可以尝试增加渐变缓存条目的数量。  
   如果 VG-Lite API 返回 :c:macro:`VG_LITE_OUT_OF_RESOURCES` 错误，可以尝试增加 GPU 内存池的大小或减少渐变缓存条目的数量。

7. 设置 :c:macro:`LV_VG_LITE_STROKE_CACHE_CNT` 配置以指定笔画路径缓存的数量。  
   当笔画参数不变时，会自动从缓存中获取先前生成的笔画参数，从而提高渲染性能。  
   笔画占用的内存与路径长度密切相关。如果 VG-Lite API 返回 :c:macro:`VG_LITE_OUT_OF_RESOURCES` 错误，  
   可以尝试增加 GPU 内存池的大小或减少笔画缓存条目的数量。

NOTE: VG-Lite 渲染后端不支持多线程调用，请确保 :c:macro:`LV_USE_OS` 始终配置为 :c:macro:`LV_OS_NONE`。

VG-Lite Simulator（VG-Lite模拟器）
**********************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL integrates a VG-Lite simulator based on ThorVG.
Its purpose is to simplify the debugging of VG-Lite adaptation and reduce the time of debugging and locating problems on hardware devices.
For detailed instructions, see :ref:`vg_lite_tvg`.

.. raw:: html

   </details> 
   <br>


LVGL集成了一个基于ThorVG的VG-Lite模拟器。
它的目的是简化VG-Lite适配的调试，并减少在硬件设备上调试和定位问题的时间。
详细说明，请参见 :ref:`vg_lite_tvg`.
