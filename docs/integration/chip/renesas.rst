.. _renesas:

===============
Renesas（瑞萨）
===============

.. raw:: html

   <details>
     <summary>显示原文</summary>

`Renesas <https://renesas.com/>`__ is an official partner of LVGL.
Therefore, LVGL contains built-in support for `Dave2D <https://www.renesas.com/document/mas/tes-dave2d-driver-documentation>`__ (the GPU of Renesas)

.. raw:: html

   </details>
   <br>


`Renesas <https://renesas.com/>`__ 是 LVGL 的官方合作伙伴。因此，LVGL 包含对 `Dave2D <https://www.renesas.com/document/mas/tes-dave2d-driver-documentation>`__ 的内置支持( Renesas 的 GPU)和 LVGL 还托管即用型 Renesas 项目。


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

GLCDC
-----

.. raw:: html

   <details>
     <summary>显示原文</summary>

GLCDC is a multi-stage graphics output peripheral available in several Renesas MCUs.
It is able to drive LCD panles via a higly configurable RGB interface.

More info can be found at the :ref:`dirver's page<renesas_glcdc>`.


.. raw:: html

   </details>
   <br>


GLCDC 是一种多级图形输出外设，可用于多个瑞萨电子微控制器（MCU）中。
它能够通过一个高度可配置的 RGB 接口驱动 LCD 面板。

更多信息可以在 :ref:`驱动页面<renesas_glcdc>` 中找到。


Certified boards（认证板）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL has `certified <https://lvgl.io/certificate>`__ one Renesas board so far (more will come soon).

.. raw:: html

   </details>
   <br>


到目前为止，LVGL 已 `认证 <https://lvgl.io/certificate>`__ 一块瑞萨电子主板（很快就会有更多主板）。


.. raw:: html

  <iframe width="560" height="315" src="https://www.youtube.com/embed/LHPIqBV_MGA?si=mtW3g-av56bCdR4k" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Get started with the Renesas ecosystem（开始使用瑞萨电子生态系统）
----------------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The official IDE of Renesas is called `e² studio <https://www.renesas.com/us/en/software-tool/e-studio?gad_source=1&gclid=CjwKCAjw5ImwBhBtEiwAFHDZx2V3lumaenbyJnc5Ctrclr_lEQM3G22iZgB-4F92OVLCI7xmzp1YQRoCcRgQAvD_BwE>`__. As it's Eclipse-based, it runs on Windows, Linux, and Mac as well.

To get started, just download and install e² studio.

JLink is used for debugging, it can be downloaded [here](https://www.segger.com/downloads/jlink/)

.. raw:: html

   </details>
   <br>


Renesas 的官方 IDE 名为 `e² studio <https://www.renesas.com/us/en/software-tool/e-studio?gad_source=1&gclid=CjwKCAjw5ImwBhBtEiwAFHDZx2V3lumaenbyJnc5Ctrclr_lEQM3G22iZgB-4F92OVLCI7xmzp1YQRoCcRgQAvD_BwE>`__ 。由于它基于 Eclipse，因此也可以在 Windows、Linux 和 Mac 上运行。

首先，只需下载并安装 e²studio。

J-Link 用于调试，可以从 [这里](https://www.segger.com/downloads/jlink/) 下载。


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

**Setting up the project**

- First, clone the ready-to-use `lv_port_renesas_ek-ra8d1 <https://github.com/lvgl/lv_port_renesas_ek-ra8d1.git>`__ repository:

   .. code-block:: shell
      git clone https://github.com/lvgl/lv_port_renesas_ek-ra8d1.git --recurse-submodules
- Open e² studio, go to ``File`` -> ``Import project`` and select ``General`` / ``Exsisting projects into workspace``

   .. image:: /misc/renesas/import.png
      :alt: Importing the project


- Browse the cloned folder and press ``Finish``

- Double click on ``configuration.xml``. This will activate the configuration window.

  Renesas' Flexible Software Package (FSP) incudes BSP and HAL layer support extended with multiple RTOS variants and other middleware stacks.
  The components will be available via code generation, incuding the entry point of *"main.c"*.

  Press ``Generate Project Content`` in the top right corner.

   .. image:: /misc/renesas/generate.png
      :alt: Code generation with FSP

- Build the project by pressing ``Ctrl`` + ``Alt`` + ``B``

- Click the Debug button. When prompted select the `J-Link ARM` Debugger and the `R7FA8D1BH` MCU.

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

**设置项目**

首先，克隆现成的 `lv_port_renesas_ek-ra8d1 <https://github.com/lvgl/lv_port_renesas_ek-ra8d1.git>`__ 仓库：

   .. code-block:: shell
      git clone https://github.com/lvgl/lv_port_renesas_ek-ra8d1.git --recurse-submodules

打开 e² studio，前往 文件 -> 导入项目 并选择 通用 / 现有项目到工作空间

   .. image:: /misc/renesas/import.png
      :alt: 导入项目


浏览克隆的文件夹并按 ``Finish``

双击 ``configuration.xml``。这将激活配置窗口。

瑞萨的灵活软件包（FSP）包括了 BSP 和 HAL 层的支持，并扩展了多种 RTOS 变体和其他中间件堆栈。
组件将通过代码生成器提供，包括 "main.c" 的入口点。

点击右上角的  ``Generate Project Content`` 。

   .. image:: /misc/renesas/generate.png
      :alt: Code generation with FSP

- 通过按 Ctrl + Alt + B 构建项目。

- 点击调试按钮。当提示时选择 `J-Link ARM` 调试器和 `R7FA8D1BH` 微控制器。

请注意， ``SW1`` DIP 开关（板中间）7 应为 ON，所有其他开关均为 OFF。


Modify the project（修改项目）
-----------------------------

Open a demo（打开演示）
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

In `LVGL_thread_entry <https://github.com/lvgl/lv_port_renesas_ek-ra8d1/blob/master/src/LVGL_thread_entry.c>`__, the demos are automatically enabled based on the settings in `lv_conf.h <https://github.com/lvgl/lv_port_renesas_ek-ra8d1/blob/master/src/lv_conf.h>`__.

You can disable all demos (or just comment them out) and call some ``lv_example_...()`` functions, or add your custom code.

.. raw:: html

   </details>
   <br>


在 `LVGL_thread_entry <https://github.com/lvgl/lv_port_renesas_ek-ra8d1/blob/master/src/LVGL_thread_entry.c>`__ 中，示例程序会根据 `lv_conf.h <https://github.com/lvgl/lv_port_renesas_ek-ra8d1/blob/master/src/lv_conf.h>`__ 中的设置自动启用。

您可以禁用所有演示（或只是将其注释掉）并调用某些 ``lv_example_...()`` 函数，或添加自定义代码。


Configuration（配置）
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

- ``lv_conf.h`` contains the most important settings for LVGL. Namely:

- ``LV_COLOR_DEPTH`` to set LVGL's default color depth
- ``LV_MEM_SIZE to`` set the maximum RAM available for LVGL
- ``LV_USE_DAVE2D`` to enable the GPU

``configuration.xml`` contains the settings for the board and the MCU. By opening this file, all the hardware and software components can be customized in a visual way.


.. raw:: html

   </details>
   <br>


- ``lv_conf.h`` 包含 LVGL 最重要的设置。即：

- ``LV_COLOR_DEPTH`` 用于设置 LVGL 的默认颜色深度 
- ``LV_MEM_SIZE to`` 用于设置 LVGL 可用的最大 RAM 
- ``LV_USE_DAVE2D`` 用于启用 GPU 配置.
- ``configuration.xml`` 包含板和 MCU 的设置。通过打开该文件，可以以可视化方式自定义所有硬件和软件组件。


Support（支持）
---------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

In case of an problems or questions open an issue in the `lv_port_renesas_ek-ra8d1 <https://github.com/lvgl/lv_port_renesas_ek-ra8d1/issues>`__ repository.

.. raw:: html

   </details>
   <br>


如果出现问题或疑问，请在 `lv_port_renesas_ek-ra8d1 <https://github.com/lvgl/lv_port_renesas_ek-ra8d1/issues>`__ 存储库中提出问题。

