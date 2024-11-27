.. _arm:

===
Arm
===

.. raw:: html

   <details>
     <summary>显示原文</summary>

Arm is a leading semiconductor and software design company, renowned for creating the Cortex-M microcontroller (MCU) cores and Cortex-A/R (MPU) processor cores, which are integral to a wide range of devices. These cores are at the heart of many embedded systems, powering chips from industry giants such as STMicroelectronics, NXP, and Renesas. Arm's energy-efficient designs are used in billions of devices worldwide, from microcontrollers to smartphones and servers. By licensing their processor designs, Arm enables a broad ecosystem of partners to develop customized solutions optimized for performance, power, and size. Arm's architecture is highly compatible with various operating systems and software libraries, including LVGL, making it a versatile choice for developers creating efficient, high-performance graphical user interfaces.

.. raw:: html

   </details>
   <br>


Arm 是一家领先的半导体和软件设计公司，以创建 Cortex-M 微控制器（MCU）核心和 Cortex-A/R（MPU）处理器核心而闻名，这些核心是许多设备不可或缺的部分。这些核心是许多嵌入式系统的核心，为 STMicroelectronics、NXP 和 Renesas 等工业巨头的芯片提供动力。Arm 的节能设计在全球数十亿设备中得到应用，从微控制器到智能手机和服务器。通过授权其处理器设计，Arm 使广泛的合作伙伴生态系统能够开发出针对性能、功耗和尺寸优化的定制解决方案。Arm 的架构与各种操作系统和软件库高度兼容，包括 LVGL，这使得它成为开发者创建高效、高性能图形用户界面的多功能选择。


Compile LVGL for Arm（为 Arm 编译 LVGL）
---------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

No specific action is required. Any compiler that supports the target Arm architecture can be used to compile LVGL's source code, including GCC, LLVM, and AC6.

It is also possible to cross-compile LVGL for an MPU (instead of compiling it on the target hardware) or create a shared library. For more information, check out :ref:`build_cmake`.

.. raw:: html

   </details>
   <br>


不需要特定操作。任何支持目标 Arm 架构的编译器都可以用来编译 LVGL 的源代码，包括 GCC、LLVM 和 AC6。

也可以为 MPU 交叉编译 LVGL（而不是在目标硬件上编译）或创建共享库。更多信息，请查看 :ref:`build_cmake`。


Getting Started with AC6（开始使用 AC6）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Since AC6 is a proprietary toolchain, it contains many specific optimizations, so you can expect the best performance when using it.

AC6 is not free, but it offers a community license that can be activated as follows:

1. Download and install the AC6 compiler from `Arm's website <https://developer.arm.com/Tools%20and%20Software/Arm%20Compiler%20for%20Embedded>`__.
2. To register a community license, go to the ``bin`` folder of the compiler and, in a terminal, run ``armlm.exe activate -server https://mdk-preview.keil.arm.com -product KEMDK-COM0`` (On Linux, use ``./armlm``).

.. raw:: html

   </details>
   <br>


由于 AC6 是专有工具链，它包含许多特定优化，因此在使用时可以期待最佳性能。

AC6 不是免费的，但它提供了可以按如下方式激活的社区许可证：

1. 从 `Arm 官网 <https://developer.arm.com/Tools%20and%20Software/Arm%20Compiler%20for%20Embedded>`__ 下载并安装 AC6 编译器。
2. 要注册社区许可证，请转到编译器的 ``bin`` 文件夹，在终端中运行 ``armlm.exe activate -server https://mdk-preview.keil.arm.com  -product KEMDK-COM0``（在 Linux 上，使用 ``./armlm``）。


IDE Support（IDE 支持）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

There are no limitations on the supported IDEs. LVGL works in various vendors' IDEs, including Arm's Keil MDK, IAR, Renesas's e2 studio, NXP's MCUXpresso, ST's CubeIDE, as well as custom make or CMake projects.

.. raw:: html

   </details>
   <br>


支持的 IDE 没有限制。LVGL 在包括 Arm 的 Keil MDK、IAR、Renesas 的 e2 studio、NXP 的 MCUXpresso、ST 的 CubeIDE 以及自定义 make 或 CMake 项目在内的各种供应商的 IDE 中均能工作。


Arm2D and the Helium instruction set（Arm2D 和 Helium 指令集）
-----------------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Arm Cortex-M55 and Cortex-M85 have the `SIMD Helium <https://www.arm.com/technologies/helium>`__ instruction set.
Among many others, this can effectively speed up UI rendering. :ref:`Arm2D <arm2d>` is a library maintained by Arm that leverages the Helium instruction set.

Note that GCC has some known issues with Helium intrinsics. It is recommended to use AC6 or LLVM when dealing with Helium code.


To add Arm2D to your project, follow these steps:

1. To utilize its power, ensure that ``mcpu`` is set to ``cortex-m85``, ``cortex-m55``, or ``cortex-m52`` and add the ``-fvectorize`` flag. To test without SIMD, use e.g. ``cortex-m85+nomve``.
2. Arm2D can be downloaded from `https://github.com/ARM-software/Arm-2D <https://github.com/ARM-software/Arm-2D>`__. Consider using the ``developing`` branch, which contains the latest updates.
3. Add ``Arm-2D/Library/Include`` to the include paths.
4. Copy ``Arm-2D/Library/Include/template/arm_2d_cfg.h`` to any location you prefer to provide the default configuration for Arm2D. Ensure that the folder containing ``arm_2d_cfg.h`` is added to the include path.
5. The Arm2D repository contains several examples and templates; however, ensure that only ``Arm-2D/Library/Source`` is compiled.
6. The CMSIS DSP library also needs to be added to the project. You can use CMSIS-PACKS or add it manually.
7. For better performance, enable ``LTO`` (Link Time Optimization) and use ``-Omax`` or ``-Ofast``.
8. Arm2D tries to read/write multiple data with a single instruction. Therefore, it's important to use the fastest memory (e.g., ``BSS`` or ``TCM``) for LVGL's buffer to avoid memory bandwidth bottlenecks.
9. Enable ``LV_USE_DRAW_ARM2D_SYNC 1`` and ``LV_USE_DRAW_SW_ASM LV_DRAW_SW_ASM_HELIUM`` in ``lv_conf.h``.

.. raw:: html

   </details>
   <br>


Arm Cortex-M55 和 Cortex-M85 拥有 `SIMD Helium <https://www.arm.com/technologies/helium>`__ 指令集。
这可以有效地加速 UI 渲染。:ref:`Arm2D <arm2d>` 是 Arm 维护的库，它利用 Helium 指令集。

请注意，GCC 在处理 Helium 内联函数时存在一些已知问题。处理 Helium 代码时，建议使用 AC6 或 LLVM。

要将 Arm2D 添加到你的项目中，请按照以下步骤操作：

1. 为了利用其能力，请确保将 ``mcpu`` 设置为 ``cortex-m85``、``cortex-m55`` 或 ``cortex-m52`` 并添加 ``-fvectorize`` 标志。如果不使用 SIMD，可以使用例如 ``cortex-m85+nomve`` 进行测试。
2. Arm2D 可以从 `https://github.com/ARM-software/Arm-2D <https://github.com/ARM-software/Arm-2D>`__ 下载。考虑使用包含最新更新的 ``developing`` 分支。
3. 将 ``Arm-2D/Library/Include`` 添加到包含路径中。
4. 将 ``Arm-2D/Library/Include/template/arm_2d_cfg.h`` 复制到你选择的任何位置，为 Arm2D 提供默认配置。确保包含 ``arm_2d_cfg.h`` 的文件夹已添加到包含路径中。
5. Arm2D 仓库包含多个示例和模板；然而，确保只编译 ``Arm-2D/Library/Source``。
6. 项目还需要添加 CMSIS DSP 库。你可以使用 CMSIS-PACKS 或手动添加。
7. 为了更好的性能，启用 ``LTO``（链接时优化）并使用 ``-Omax`` 或 ``-Ofast``。
8. Arm2D 尝试用单条指令读取/写入多个数据。因此，使用最快的内存（例如，``BSS`` 或 ``TCM``）对 LVGL 的缓冲区很重要，以避免内存带宽瓶颈。
9. 在 ``lv_conf.h`` 中启用 ``LV_USE_DRAW_ARM2D_SYNC 1`` 和 ``LV_USE_DRAW_SW_ASM LV_DRAW_SW_ASM_HELIUM``。


Neon Acceleration（Neon 加速）
------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Several Cortex-A microprocessors support the `Neon SIMD <https://www.arm.com/technologies/neon>`__ instruction set. LVGL has built-in support to improve the performance of software rendering by utilizing Neon instructions. To enable Neon acceleration, set ``LV_USE_DRAW_SW_ASM`` to ``LV_DRAW_SW_ASM_NEON`` in ``lv_conf.h``.

.. raw:: html

   </details>
   <br>


一些 Cortex-A 微处理器支持 `Neon SIMD <https://www.arm.com/technologies/neon>`__ 指令集。LVGL 内置支持通过利用 Neon 指令来提高软件渲染的性能。要启用 Neon 加速，在 ``lv_conf.h`` 中将 ``LV_USE_DRAW_SW_ASM`` 设置为 ``LV_DRAW_SW_ASM_NEON``。





