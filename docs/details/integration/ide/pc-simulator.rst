.. _simulator:

============================
Simulator on PC（PC端模拟器）
============================

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can try out LVGL **using only your PC** (i.e. without any
development boards). LVGL will run on a simulator environment on the PC
where anyone can write and experiment with real LVGL applications.

Using the simulator on a PC has the following advantages:

- Hardware independent: Write code, run it on the PC and see the result on a monitor.
- Cross-platform: Any Windows, Linux or macOS system can run the PC simulator.
- Portability: The written code is portable, which means you can simply copy it when migrating to embedded hardware.
- Easy Validation: The simulator is also very useful to report bugs because it provides a common platform for every user.
- Better developer experience: On PC Debuggers are usually faster and better, you can log to files,
  add a lot of ``printf`` s, do profiling, and so on.


.. raw:: html

   </details>
   <br>


**您可以使用仅您的个人电脑** （即没有任何开发板）来尝试 LVGL。
LVGL 将在个人电脑的模拟器环境中运行，任何人都可以编写和试验真正的 LVGL 应用程序。

使用个人电脑上的模拟器具有以下优点：

- 硬件无关：编写代码，在个人电脑上运行，并在监视器上查看结果。
- 跨平台：任何 Windows、Linux 或 macOS 系统都可以运行个人电脑模拟器。
- 可移植性：编写的代码是可移植的，这意味着在迁移到嵌入式硬件时，您可以简单地复制它。
- 易于验证：模拟器还非常有用，可用于报告错误，因为它为每位用户提供了一个通用平台。
- 更好的开发体验：在 PC 调试器中，它们通常更快更好，您可以记录到文件、添加许多 printf 语句、进行分析等等。


Select an IDE（选择一个IDE）
----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The simulator is ported to various IDEs (Integrated Development Environments).
Choose your favorite IDE, read its README on GitHub, download the project, and load it to the IDE.

- `Eclipse with SDL driver <https://github.com/lvgl/lv_sim_eclipse_sdl>`__: Recommended on Linux and Mac, supports CMake as well
- `VisualStudio <https://github.com/lvgl/lv_port_pc_visual_studio>`__: Recommended on Windows
- `VSCode with SDL driver <https://github.com/lvgl/lv_port_pc_vscode>`__: Recommended on Linux (SDL) and Mac (SDL)
- `CodeBlocks <https://github.com/lvgl/lv_sim_codeblocks_win>`__: Recommended on Windows
- `PlatformIO with SDL driver <https://github.com/lvgl/lv_platformio>`__: Recommended on Linux and Mac but has an STM32 environment as well
- `Generic Linux <https://github.com/lvgl/lv_port_linux>`__: CMake based project where you can easily switch between fbdev, DRM, and SDL.
- `MDK with FastModel <https://github.com/lvgl/lv_port_an547_cm55_sim>`__: For Windows

External project not maintained by the LVGL organization:

- `QT Creator <https://github.com/Varanda-Labs/lvgl-qt-sim>`__: Cross platform

.. raw:: html

   </details>
   <br>


模拟器已移植到各种集成开发环境（IDE）中。
选择您喜欢的 IDE，在 GitHub 上阅读其 README，下载项目，并将其加载到 IDE 中。

- `Eclipse with SDLdriver <https://github.com/lvgl/lv_sim_eclipse_sdl>`__: 推荐在 Linux 和 Mac 上使用，也支持 CMake
- `VisualStudio <https://github.com/lvgl/lv_port_pc_visual_studio>`__: 推荐在 Windows 上使用
- `VSCode with SDL driver <https://github.com/lvgl/lv_port_pc_vscode>`__: 推荐在 Linux (SDL) 和 Mac (SDL) 上使用
- `CodeBlocks <https://github.com/lvgl/lv_sim_codeblocks_win>`__: 推荐在 Windows 上使用
- `PlatformIO with SDL driver <https://github.com/lvgl/lv_platformio>`__: 推荐在 Linux 和 Mac 上使用，但也有 STM32 环境
- `Generic Linux <https://github.com/lvgl/lv_port_linux>`__: 基于 CMake 的项目，你可以在 fbdev、DRM 和 SDL 之间轻松切换。
- `MDK with FastModel <https://github.com/lvgl/lv_port_an547_cm55_sim>`__: 用于 Windows

非 LVGL 组织维护的外部项目：

- `QT Creator <https://github.com/Varanda-Labs/lvgl-qt-sim>`__: 跨平台


Built-in drivers（内置驱动）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL comes with several :ref:`built-in drivers <drivers>`.

Even if a simulator project comes with e.g. SDL, you can easily replace it by enabling
another driver in ``lv_conf.h`` and calling its ``create`` function.

For example to use the Linux frame buffer device instead of SDL just enable ``LV_USE_LINUX_FBDEV``
and call

.. code-block:: c

   lv_display_t *display = lv_linux_fbdev_create();
   lv_linux_fbdev_set_file(display, "/dev/fb0")

.. raw:: html

   </details>
   <br>

LVGL带有若干个 :ref:`built-in drivers <drivers>`.

即使模拟器项目附带了例如 SDL，你也能通过在 ``lv_conf.h`` 中启用另一个驱动并调用其 ``create`` 函数来轻松替换它。

例如，要使用 Linux 帧缓冲设备而不是 SDL，只需启用 ``LV_USE_LINUX_FBDEV`` 并调用相关函数即可。

.. code-block:: c

   lv_display_t *display = lv_linux_fbdev_create();
   lv_linux_fbdev_set_file(display, "/dev/fb0")
