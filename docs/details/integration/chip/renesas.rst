.. _renesas:

===============
Renesas（瑞萨）
===============

.. raw:: html

   <details>
     <summary>显示原文</summary>

`Renesas <https://renesas.com/>`__ is an official partner of LVGL. Therefore, LVGL contains built-in support for
`Dave2D <https://www.renesas.com/document/mas/tes-dave2d-driver-documentation>`__ (the GPU of Renesas) and we also maintain
ready-to-use Renesas projects.

.. raw:: html

   </details>
   <br>


`Renesas <https://renesas.com/>`__ 是 LVGL 的官方合作伙伴。因此，LVGL 内置了对 `Dave2D <https://www.renesas.com/document/mas/tes-dave2d-driver-documentation>`__（Renesas 的 GPU）的支持，同时我们也维护了可直接使用的 Renesas 项目。

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


As Dave2D works in the background, the CPU is free for other tasks. In practice, during rendering, Dave2D can reduce the CPU usage by
half or to one-third, depending on the application.

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

GLCDC is a multi-stage graphics output peripheral available in several Renesas MCUs. It is able to drive LCD panels via a highly
configurable RGB interface.

More info can be found at the :ref:`driver's page<renesas_glcdc>`.


.. raw:: html

   </details>
   <br>


GLCDC 是一种多阶段图形输出外设，适用于多款 Renesas MCU。它能够通过高度可配置的 RGB 接口驱动 LCD 面板。

更多信息请参考 :ref:`驱动页面 <renesas_glcdc>`。


Supported boards（认证板）
-------------------------

.. list-table::
   :widths: 10 30 30 30

   * - 
     - **EK-RA8D1**
     - **EK-RA6M3G**
     - **RX72N Envision Kit**
   * - CPU
     - 480MHz, Arm Cortex-M85 core
     - 120MHz, Arm Cortex-M4 core
     - 240MHz, Renesas RXv3 core
   * - Memory
     - 
         | 1MB internal, 64MB external SDRAM
         | 2MB internal, 64MB External Octo-SPI Flash
     - 
         | 640kB internal SRAM
         | 2MB internal, 32MB external QSPI Flash
     - 
         | 1MB internal SRAM
         | 4MB internal, 32MB external QSPI Flash
   * - Display
     - 
         | 4.5”
         | 480x854
         | 2-lane MIPI
     - 
         | 4.3”
         | 480x272
         | Parallel RGB565
     - 
         | 4.3”
         | 480x272
         | Parallel RGB565
   * - `Board <https://lvgl.io/boards>`__ video
     - .. raw:: html

           <iframe width="320" height="180" src="https://www.youtube.com/embed/WkJPB8wto_U" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

     - .. raw:: html

           <iframe width="320" height="180" src="https://www.youtube.com/embed/0kar4Ee3Qic" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

     - .. raw:: html

           <iframe width="320" height="180" src="https://www.youtube.com/embed/__56v8DsfH0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


   * - Links
     - `Demo repository for EK-RA8D1 <https://github.com/lvgl/lv_port_renesas_ek-ra8d1>`__
     - `Demo repository for EK-RA6M3G <https://github.com/lvgl/lv_port_renesas_ek-ra6m3g>`__
     - `Demo repository for RX72N Envision Kit <https://github.com/lvgl/lv_port_renesas_rx72n-envision-kit>`__

Get started with the Renesas ecosystem（开始使用瑞萨电子生态系统）
----------------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>


.. |img_debug_btn| image:: /misc/renesas/debug_btn.png
   :alt: Debug button

.. dropdown:: RA Family

    - The official IDE of Renesas is called e² studio. As it's Eclipse-based, it runs on Windows, Linux, and Mac as well.
      The RA family requires the latest version with FSP 5.3. It can be downloaded `here <https://www.renesas.com/us/en/software-tool/flexible-software-package-fsp>`__.
    - JLink is used for debugging, it can be downloaded `here <https://www.segger.com/downloads/jlink/>`__.
    - Clone the ready-to-use repository for your selected board:

        .. code-block:: shell

            git clone https://github.com/lvgl/lv_port_renesas_ek-ra8d1.git --recurse-submodules


        Downloading the `.zip` from GitHub doesn't work as it doesn't download the submodules.
    - Open e² studio, go to ``File`` -> ``Import project`` and select ``General`` / ``Existing projects into workspace``
    - Browse the cloned folder and press ``Finish``.
    - Double click on ``configuration.xml``. This will activate the `Configuration Window`.

      Renesas' Flexible Software Package (FSP) incudes BSP and HAL layer support extended with multiple RTOS variants and other middleware stacks.
      The components will be available via code generation, including the entry point of *"main.c"*.

      Press ``Generate Project Content`` in the top right corner.

      .. image:: /misc/renesas/generate.png
         :alt: Code generation with FSP

    - Build the project by pressing ``Ctrl`` + ``Alt`` + ``B``
    - Click the Debug button (|img_debug_btn|). If prompted with `Debug Configurations`, on the `Debugger` tab select the ``J-Link ARM`` as `Debug hardware` and the proper IC as `Target Device`:

      - ``R7FA8D1BH`` for EK-RA8D1

        .. image:: /misc/renesas/debug_ra8.png
           :alt: Debugger parameters for RA8

      - ``R7FA6M3AH`` for EK-RA6M3G

        .. image:: /misc/renesas/debug_ra6.png
            :alt: Debugger parameters for RA6

   .. note::
      On EK-RA8D1 boards, the ``SW1`` DIP switch (middle of the board) 7 should be ON, all others are OFF.

.. dropdown:: RX Family

    - The official IDE of Renesas is called e² studio. As it's Eclipse-based, it runs on Windows, Linux, and Mac as well.
      It can be downloaded `here <https://www.renesas.com/us/en/software-tool/e-studio>`__.
    - Download and install the required driver for the debugger

       - for Windows: `64 bit here <https://www.renesas.com/us/en/document/uid/usb-driver-renesas-mcu-tools-v27700-64-bit-version-windows-os?r=488806>`__
         and `32 bit here <https://www.renesas.com/us/en/document/uid/usb-driver-renesas-mcu-toolse2e2-liteie850ie850apg-fp5-v27700for-32-bit-version-windows-os?r=488806>`__
       - for Linux: `here <https://www.renesas.com/us/en/document/swo/e2-emulator-e2-emulator-lite-linux-driver?r=488806>`__

    - RX72 requires an external compiler for the RXv3 core. A free and open-source version is available
      `here <https://llvm-gcc-renesas.com/rx-download-toolchains/>`__ after a registration.

      The compiler must be activated in e² studio:

      - Go to go to ``Help`` -> ``Add Renesas Toolchains``
      - Press the ``Add...`` button
      - Browse the installation folder of the toolchain

      <br/>

      .. image:: /misc/renesas/toolchains.png
         :alt: Toolchains

    - Clone the ready-to-use `lv_port_renesas_rx72n-envision-kit <https://github.com/lvgl/lv_port_renesas_rx72n-envision-kit.git>`__ repository:

      .. code-block:: shell

          git clone https://github.com/lvgl/lv_port_renesas_rx72n-envision-kit.git --recurse-submodules


      Downloading the `.zip` from GitHub doesn't work as it doesn't download the submodules.

    - Open e² studio, go to ``File`` -> ``Import project`` and select ``General`` / ``Existing projects into workspace``
    - Select the cloned folder and press ``Finish``.
    - Double click on ``RX72N_EnVision_LVGL.scfg``. This will activate the `Configuration Window`.

      Renesas' Smart Configurator (SMC) incudes BSP and HAL layer support extended with multiple RTOS variants and other middleware stacks.
      The components will be available via code generation, including the entry point of the application.

      Press ``Generate Code`` in the top right corner.

      .. image:: /misc/renesas/generate_smc.png
         :alt: Code generation with SMC

    - Build the project by pressing ``Ctrl`` + ``Alt`` + ``B``
    - Click the Debug button (|img_debug_btn|). If prompted with `Debug Configurations`, on the `Debugger` tab select the ``E2 Lite``
      as `Debug hardware` and ``R5F572NN`` as `Target Device`:

      .. image:: /misc/renesas/debug_rx72.png
         :alt: Debugger parameters for RX72

    .. note::
       Make sure that both channels of ``SW1`` DIP switch (next to ``ECN1``) are OFF.


.. raw:: html

   </details>
   <br>


.. |img_debug_btn| image:: /misc/renesas/debug_btn.png  
   :alt: 调试按钮  

.. dropdown:: RA 家族  

    - Renesas 的官方集成开发环境 (IDE) 是 **e² studio**。它基于 Eclipse，可以运行在 Windows、Linux 和 Mac 系统上。  
      RA 家族需要最新版 FSP 5.3，可在 `这里下载 <https://www.renesas.com/us/en/software-tool/flexible-software-package-fsp>`__。  
    - 使用 **JLink** 进行调试，可以在 `这里下载 <https://www.segger.com/downloads/jlink/>`__。  
    - 克隆适用于所选开发板的可用仓库：  

        .. code-block:: shell  

            git clone https://github.com/lvgl/lv_port_renesas_ek-ra8d1.git --recurse-submodules  

        从 GitHub 下载 `.zip` 文件无效，因为不会下载子模块。  
    - 打开 e² studio，进入 ``File`` -> ``Import project``，选择 ``General`` / ``Existing projects into workspace``。  
    - 浏览克隆的文件夹，然后点击 ``Finish``。  
    - 双击 ``configuration.xml`` 激活 **Configuration Window**（配置窗口）。  

      Renesas 的 **Flexible Software Package (FSP)** 包括 BSP 和 HAL 层的支持，还扩展了多个 RTOS 选项和其他中间件栈。  
      这些组件将通过代码生成提供，包括程序的入口点 *"main.c"*。  

      点击右上角的 **Generate Project Content**。  

      .. image:: /misc/renesas/generate.png  
         :alt: 使用 FSP 进行代码生成  

    - 按下 ``Ctrl`` + ``Alt`` + ``B`` 编译项目。  
    - 点击调试按钮 (|img_debug_btn|)。若弹出 **Debug Configurations**（调试配置），在 **Debugger** 选项卡中选择 ``J-Link ARM`` 作为调试硬件，并选择正确的 IC 作为目标设备：  

      - **EK-RA8D1**：选择 ``R7FA8D1BH``  

        .. image:: /misc/renesas/debug_ra8.png  
           :alt: RA8 调试器参数  

      - **EK-RA6M3G**：选择 ``R7FA6M3AH``  

        .. image:: /misc/renesas/debug_ra6.png  
           :alt: RA6 调试器参数  

   .. note::  
      在 EK-RA8D1 开发板上，中间的 ``SW1`` DIP 开关的第 7 位应置为 ON，其余开关应置为 OFF。  

.. dropdown:: RX 家族  

    - Renesas 的官方 IDE 是 **e² studio**，基于 Eclipse，可以运行在 Windows、Linux 和 Mac 系统上。  
      可在 `这里下载 <https://www.renesas.com/us/en/software-tool/e-studio>`__。  
    - 下载并安装调试器所需的驱动程序：  

       - **Windows**：`64 位驱动 <https://www.renesas.com/us/en/document/uid/usb-driver-renesas-mcu-tools-v27700-64-bit-version-windows-os?r=488806>`__ 和  
         `32 位驱动 <https://www.renesas.com/us/en/document/uid/usb-driver-renesas-mcu-toolse2e2-liteie850ie850apg-fp5-v27700for-32-bit-version-windows-os?r=488806>`__  
       - **Linux**：`驱动下载 <https://www.renesas.com/us/en/document/swo/e2-emulator-e2-emulator-lite-linux-driver?r=488806>`__  

    - RX72 需要为 RXv3 核心安装外部编译器。一个免费的开源版本可以在注册后从 `这里下载 <https://llvm-gcc-renesas.com/rx-download-toolchains/>`__。  

      在 e² studio 中激活编译器：  

      - 进入 ``Help`` -> ``Add Renesas Toolchains``  
      - 点击 ``Add...`` 按钮  
      - 浏览编译器的安装文件夹  

      .. image:: /misc/renesas/toolchains.png  
         :alt: 工具链设置  

    - 克隆可用的 `lv_port_renesas_rx72n-envision-kit <https://github.com/lvgl/lv_port_renesas_rx72n-envision-kit.git>`__ 仓库：  

      .. code-block:: shell  

          git clone https://github.com/lvgl/lv_port_renesas_rx72n-envision-kit.git --recurse-submodules  

      从 GitHub 下载 `.zip` 文件无效，因为不会下载子模块。  
    - 打开 e² studio，进入 ``File`` -> ``Import project``，选择 ``General`` / ``Existing projects into workspace``。  
    - 选择克隆的文件夹，然后点击 ``Finish``。  
    - 双击 ``RX72N_EnVision_LVGL.scfg`` 激活 **Configuration Window**（配置窗口）。  

      Renesas 的 **Smart Configurator (SMC)** 包括 BSP 和 HAL 层的支持，还扩展了多个 RTOS 选项和其他中间件栈。  
      这些组件将通过代码生成提供，包括程序的入口点。  

      点击右上角的 **Generate Code**。  

      .. image:: /misc/renesas/generate_smc.png  
         :alt: 使用 SMC 进行代码生成  

    - 按下 ``Ctrl`` + ``Alt`` + ``B`` 编译项目。  
    - 点击调试按钮 (|img_debug_btn|)。若弹出 **Debug Configurations**（调试配置），在 **Debugger** 选项卡中选择 ``E2 Lite`` 作为调试硬件，并选择 ``R5F572NN`` 作为目标设备：  

      .. image:: /misc/renesas/debug_rx72.png  
         :alt: RX72 调试器参数  

    .. note::  
       请确保 ``SW1`` DIP 开关（位于 ``ECN1`` 附近）的两个通道均置为 OFF。  

Modify the project（修改项目）
-----------------------------

Open a demo（打开演示）
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

The entry point of the main task is contained in ``src/LVGL_thread_entry.c`` in all 3 projects.

You can disable the LVGL demos (or just comment them out) and call some ``lv_example_...()`` functions, or add your custom code.

.. raw:: html

   </details>
   <br>


所有3个项目中，主任务的入口点包含在 ``src/LVGL_thread_entry.c`` 文件中。

您可以禁用 LVGL 演示（或者只是注释掉它们），并调用一些 ``lv_example_...()`` 函数，或者添加您的自定义代码。


Configuration（配置）
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

``src/lv_conf.h`` contains the most important settings for LVGL. Namely:

- ``LV_COLOR_DEPTH`` to set LVGL's default color depth
- ``LV_MEM_SIZE to`` set the maximum RAM available for LVGL
- ``LV_USE_DAVE2D`` to enable the GPU

Hardware and software components can be modified in a visual way using the `Configuration Window`.


.. raw:: html

   </details>
   <br>


``src/lv_conf.h`` 包含 LVGL 最重要的设置。即：

- ``LV_COLOR_DEPTH`` 用于设置 LVGL 的默认颜色深度 
- ``LV_MEM_SIZE to`` 用于设置 LVGL 可用的最大 RAM 
- ``LV_USE_DAVE2D`` 用于启用 GPU 配置.
- 硬件和软件组件可以通过使用 `Configuration Window` 以可视化的方式进行修改。


Support（支持）
---------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

In case of any problems or questions open an issue in the corresponding repository.

.. raw:: html

   </details>
   <br>


如果遇到任何问题或疑问，请在相应的代码库中提出一个问题。

