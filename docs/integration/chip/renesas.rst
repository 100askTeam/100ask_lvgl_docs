===============
Renesas（瑞萨）
===============

.. raw:: html

   <details>
     <summary>显示原文</summary>

[Renesas](https://renesas.com/) is an official partner of LVGL.
Therefore, LVGL contains built-in support for [Dave2D](https://lpccs-docs.renesas.com/DA1470x/UM-B-157_DA1470x-GPU-API-Manual/files/doc/overview-txt.html) (the GPU of Renesas)
and LVGL also hosts ready-to-use Renesas projects.

.. raw:: html

   </details>
   <br>


[Renesas]( https://renesas.com/ ) 是 LVGL 的官方合作伙伴。因此，LVGL 包含对 [Dave2D]( https://lpccs-docs.renesas.com/DA1470x/UM-B-157_DA1470x-GPU-API-Manual/files/doc/overview-txt.html )的内置支持( Renesas 的 GPU）和 LVGL 还托管即用型 Renesas 项目。


Dave2D（Dave2D）
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Dave2D is capable of accelerating most of the drawing operations of LVGL:

- Rectangle drawing, even with gradients
- Image drawing, scaling, and rotation
- Letter drawing
- Triangle drawing
- Line drawing

As Dave2D works in the background, the CPU is free for other tasks. In practice, during rendering, Dave2D can reduce the CPU usage by half or to one-third, depending on the application.

.. raw:: html

   </details>
   <br>


Dave2D 能够加速 LVGL 的大部分绘图操作：

- 矩形绘制，即使有渐变
- 图像绘制、缩放和旋转
- 字母图画
- 三角形画法
- 画线

由于 Dave2D 在后台运行，因此 CPU 可用于其他任务。实际上，在渲染过程中，Dave2D 可以将 CPU 使用率减少一半或三分之一，具体取决于应用程序。


Certified boards（认证板）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL has [certified](https://lvgl.io/certificate) one Renesas board so far (more will come soon).

.. raw:: html

   </details>
   <br>


到目前为止，LVGL 已[认证]( https://lvgl.io/certificate ) 一块瑞萨电子主板（很快就会有更多主板）。


.. raw:: html

  <iframe width="560" height="315" src="https://www.youtube.com/embed/LHPIqBV_MGA?si=mtW3g-av56bCdR4k" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Get started with the Renesas ecosystem（开始使用瑞萨电子生态系统）
----------------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The official IDE of Renesas is called [e² studio](https://www.renesas.com/us/en/software-tool/e-studio?gad_source=1&gclid=CjwKCAjw5ImwBhBtEiwAFHDZx2V3lumaenbyJnc5Ctrclr_lEQM3G22iZgB-4F92OVLCI7xmzp1YQRoCcRgQAvD_BwE). As it's Eclipse-based, it runs on Windows, Linux, and Mac as well.

To get started, just download and install e² studio.

.. raw:: html

   </details>
   <br>


Renesas 的官方 IDE 名为 [e² studio](https://www.renesas.com/us/en/software-tool/e-studio?gad_source=1&gclid=CjwKCAjw5ImwBhBtEiwAFHDZx2V3lumaenbyJnc5Ctrclr_lEQM3G22iZgB-4F92OVLCI7xmzp1YQRoCcRgQAvD _BwE)。由于它基于 Eclipse，因此也可以在 Windows、Linux 和 Mac 上运行。

首先，只需下载并安装 e²studio。


Getting started with LVGL（LVGL 入门）
-------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL provides a ready-to-use project for the [EK-RA8D1](https://www.renesas.com/us/en/products/microcontrollers-microprocessors/ra-cortex-m-mcus/ek-ra8d1-evaluation-kit-ra8d1-mcu-group) development board. Its main features from the HMI's point of view are:

- 480MHz, Arm Cortex®-M85 core
- 2MB Code Flash, 1MB SRAM
- MIPI DSI & Parallel Graphics Expansion Ports
- 4.5 Inch backlit TFT display, 16.7M display colors
- 480x854 pixels resolution

To get a ready-to-use project, clone the [lv_renesas](https://github.com/lvgl/lv_renesas.git) repository:

..code:: shell
  git clone https://github.com/lvgl/lv_renesas.git --recurse-submodules

After that, *Import* ``lv_ek_ra8d1`` into e² studio, build the project, and flash it.

Note that on the ``SW1`` DIP switch (middle of the board) 7 should be ON, all others are OFF.

.. raw:: html

   </details>
   <br>


LVGL 为 [EK-RA8D1] 提供了一个即用型项目( https://www.renesas.com/us/en/products/microcontrollers-microprocessors/ra-cortex-m-mcus/ek-ra8d1-evaluation -kit-ra8d1-mcu-group ) 开发板。从HMI的角度来看，其主要特点是：

- 480MHz，Arm Cortex®-M85 内核
- 2MB 代码闪存、1MB SRAM
- MIPI DSI 和并行图形扩展端口
- 4.5 英寸背光 TFT 显示屏，1670 万种显示颜色
- 480x854 像素分辨率

要获得现成的项目，请克隆 [lv_renesas]( https://github.com/lvgl/lv_renesas.git ) 存储库：

..code:: shell
  git clone https://github.com/lvgl/lv_renesas.git --recurse-submodules

之后，将 ``lv_ek_ra8d1`` 导入到e²studio中，构建项目并刷新它。

请注意， ``SW1`` DIP 开关（板中间）7 应为 ON，所有其他开关均为 OFF。


Modify the project（修改项目）
-----------------------------

Open a demo（打开演示）
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

In `LVGL_thread_entry <https://github.com/lvgl/lv_renesas/blob/master/lv_ek_ra8d1/src/LVGL_thread_entry.c>`__, the demos are automatically enabled based on the settings in `lv_conf.h <https://github.com/lvgl/lv_renesas/blob/master/lv_ek_ra8d1/src/lv_conf.h>`__.

You can disable all demos (or just comment them out) and call some ``lv_example_...()`` functions, or add your custom code.

.. raw:: html

   </details>
   <br>


在 `LVGL_thread_entry <https://github.com/lvgl/lv_renesas/blob/master/lv_ek_ra8d1/src/LVGL_thread_entry.c>`__ 中，演示会根据 `lv_conf.h <https://github.com/lvgl/lv_renesas/blob/master/lv_ek_ra8d1/src/lv_conf.h>`__ 中的设置自动启用。

您可以禁用所有演示（或只是将其注释掉）并调用某些 ``lv_example_...()`` 函数，或添加自定义代码。


Configuration（配置）
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

lv_conf.h contains the most important settings for LVGL. Namely:

LV_COLOR_DEPTH to set LVGL's default color depth
LV_MEM_SIZE to set the maximum RAM available for LVGL
LV_USE_DAVE2D to enable the GPU
configuration.xml contains the settings for the board and the MCU. By opening this file, all the hardware and software components can be customized in a visual way.


.. raw:: html

   </details>
   <br>


v_conf.h 包含 LVGL 最重要的设置。即：

LV_COLOR_DEPTH 用于设置 LVGL 的默认颜色深度 LV_MEM_SIZE 用于设置 LVGL 可用的最大 RAM LV_USE_DAVE2D 用于启用 GPU 配置.xml 包含板和 MCU 的设置。通过打开该文件，可以以可视化方式自定义所有硬件和软件组件。


Support（支持）
---------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

In case of an problems or questions open an issue in the `lv_renesas <https://github.com/lvgl/lv_renesas/issues>`__ repository.

.. raw:: html

   </details>
   <br>


如果出现问题或疑问，请在 `lv_renesas <https://github.com/lvgl/lv_renesas/issues>`__ 存储库中提出问题。

