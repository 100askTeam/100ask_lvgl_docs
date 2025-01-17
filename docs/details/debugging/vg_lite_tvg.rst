.. _vg_lite_tvg:

===================================
VG-Lite Simulator（VG-Lite模拟器）
===================================

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL integrates a VG-Lite simulator based on ThorVG.
Its purpose is to simplify the debugging of VG-Lite adaptation and reduce the time of debugging and locating problems on hardware devices.

It has been integrated into the CI automated compilation and testing process to ensure that the VG-Lite rendering backend can be fully tested after each PR modification.

.. raw:: html

   </details> 
   <br>


LVGL集成了一个基于ThorVG的VG-Lite模拟器。
它的目的是简化对VG-Lite适配的调试工作，并减少在硬件设备上调试和定位问题的时间。

它已经集成到CI自动化编译和测试流程中，以确保每次PR修改后VG-Lite渲染后端可以经过充分的测试。


How it works（工作原理）
***********************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Sort out the APIs in the ``vg_lite.h`` header file provided by the vendor, re-implement the APIs using `ThorVG <https://github.com/thorvg/thorvg>`_,
and simulate the same rendering images as the real hardware on the simulator.

.. raw:: html

   </details> 
   <br>


整理供应商提供的 ``vg_lite.h`` 头文件中的APIs，使用 `ThorVG <https://github.com/thorvg/thorvg>`_ 重新实现这些APIs，
并在模拟器上模拟与真实硬件相同的渲染图像。


Configuration（配置）
********************

.. raw:: html

   <details>
     <summary>显示原文</summary>

1. Enable VG-Lite rendering backend, see :ref:`vg_lite`.

2. Enable ThorVG and turn on the configuration :c:macro:`LV_USE_THORVG_INTERNAL` or :c:macro:`LV_USE_THORVG_EXTERNAL`.
   It is recommended to use the internal ThorVG library to ensure uniform rendering results.

3. Enable :c:macro:`LV_USE_VG_LITE_THORVG` and set :c:macro:`LV_DRAW_BUF_ALIGN` to 64. The rest of the options can remain default.
   Make sure :c:macro:`LV_VG_LITE_USE_GPU_INIT` is enabled, because the thorvg drawing context needs to be initialized before it can be used.

.. raw:: html

   </details> 
   <br>


1. 启用VG-Lite渲染后端，参见 :ref:`vg_lite`。

2. 启用ThorVG，并打开配置 :c:macro:`LV_USE_THORVG_INTERNAL` 或 :c:macro:`LV_USE_THORVG_EXTERNAL`。  
   推荐使用内部ThorVG库，以确保渲染结果的一致性。

3. 启用 :c:macro:`LV_USE_VG_LITE_THORVG` 并将 :c:macro:`LV_DRAW_BUF_ALIGN` 设置为64。其他选项可保持默认设置。  
   请确保 :c:macro:`LV_VG_LITE_USE_GPU_INIT` 已启用，因为ThorVG绘图上下文需要在使用之前初始化。