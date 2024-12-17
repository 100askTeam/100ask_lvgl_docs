.. _wayland_driver:

========================================================
Wayland Display/Inputs driver（Wayland 显示/输入驱动程序）
========================================================

Overview（概览）
---------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

| The **Wayland** `driver <https://github.com/lvgl/lvgl/tree/master/src/drivers/wayland>`__ offers support for simulating the LVGL display and keyboard/mouse inputs in a desktop window.
| It is an alternative to **X11** or **SDL2**

The main purpose for this driver is for testing/debugging the LVGL application, it can also be used to run applications in 'kiosk mode'

.. raw:: html

   </details>
   <br>

| **Wayland** `驱动 <https://github.com/lvgl/lvgl/tree/master/src/drivers/wayland>`__ 提供在桌面窗口中模拟 LVGL 显示及键盘/鼠标输入的支持。  
| 它是 **X11** 或 **SDL2** 的替代方案。  

该驱动的主要用途是测试/调试 LVGL 应用程序，也可用于在“信息亭模式（kiosk mode）”下运行应用程序。  

Dependencies（依赖关系）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The wayland driver requires some dependencies.

On Ubuntu

.. code:: bash

   sudo apt-get install libwayland-dev libxkbcommon-dev libwayland-bin wayland-protocols

On Fedora

.. code:: bash

   sudo dnf install wayland-devel libxkbcommon-devel wayland-utils wayland-protocols-devel

.. raw:: html

   </details>
   <br>

Wayland 驱动需要一些依赖项。  

在 **Ubuntu** 上  

.. code:: bash  

   sudo apt-get install libwayland-dev libxkbcommon-dev libwayland-bin wayland-protocols  

在 **Fedora** 上  

.. code:: bash  

   sudo dnf install wayland-devel libxkbcommon-devel wayland-utils wayland-protocols-devel  

Configuring the wayland driver（配置 Wayland 驱动程序）
-----------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

1. Enable the wayland driver in ``lv_conf.h``

.. code:: c

   #define LV_USE_WAYLAND  1

2. Optional configuration options:

- Enable window decorations, only required on GNOME because out of all the available wayland compositors
  **only** Mutter/GNOME enforces the use of client side decorations

.. code:: c

   #define LV_WAYLAND_WINDOW_DECORATIONS 1

- Enable support for the deprecated 'wl_shell', Only useful when the BSP on the target has weston ``9.x``

.. code:: c

   #define LV_WAYLAND_WL_SHELL  1

.. raw:: html

   </details>
   <br>

1. 在 ``lv_conf.h`` 中启用 Wayland 驱动  

.. code:: c  

   #define LV_USE_WAYLAND  1  

2. 可选配置选项：  

- 启用窗口装饰，仅在 GNOME 上需要，因为在所有可用的 Wayland 合成器中，  
  **只有** Mutter/GNOME 强制使用客户端窗口装饰。  

.. code:: c  

   #define LV_WAYLAND_WINDOW_DECORATIONS 1  

- 启用对已弃用的 'wl_shell' 的支持，仅在目标板 BSP 使用 Weston ``9.x`` 时有用。  

.. code:: c  

   #define LV_WAYLAND_WL_SHELL  1  

Example（示例）
--------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

An example simulator is available in this `repo <https://github.com/lvgl/lv_port_linux/>`__

.. raw:: html

   </details>
   <br>

此 `repo <https://github.com/lvgl/lv_port_linux/>`__ 中提供了一个示例模拟器

Usage（用法）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

#. In ``main.c`` ``#incude "lv_drivers/wayland/wayland.h"``
#. Enable the Wayland driver in ``lv_conf.h`` with ``LV_USE_WAYLAND 1``

#. ``LV_COLOR_DEPTH`` should be set either to ``32`` or ``16`` in ``lv_conf.h``

#. Add a display using ``lv_wayland_window_create()``,
   possibly with a close callback to track the status of each display:

.. code:: c

    #define H_RES (800)
    #define V_RES (480)

    /* Create a display */
    lv_disp_t * disp = lv_wayland_create_window(H_RES, V_RES, "Window Title", close_cb);


As part of the above call, the Wayland driver will register four input devices
for each display:

* a KEYPAD connected to Wayland keyboard events
* a POINTER connected to Wayland touch events
* a POINTER connected to Wayland pointer events
* an ENCODER connected to Wayland pointer axis events

Handles for input devices of each display can be obtained using
``lv_wayland_get_indev_keyboard()``, ``lv_wayland_get_indev_touchscreen()``,
``lv_wayland_get_indev_pointer()`` and ``lv_wayland_get_indev_pointeraxis()`` respectively.

.. raw:: html

   </details>
   <br>

#. 在 ``main.c`` 中包含 Wayland 驱动头文件：  
   
   ```c  
   #include "lv_drivers/wayland/wayland.h"  
   ```  

#. 在 ``lv_conf.h`` 中启用 Wayland 驱动：  

   ```c  
   #define LV_USE_WAYLAND 1  
   ```  

#. 将 ``LV_COLOR_DEPTH`` 设置为 ``32`` 或 ``16``，同样在 ``lv_conf.h`` 中：  

   ```c  
   #define LV_COLOR_DEPTH 32  
   ```  

#. 使用 ``lv_wayland_window_create()`` 添加一个显示，  
   并可选择设置关闭回调函数来跟踪每个显示的状态：  

.. code:: c  

    #define H_RES (800)  
    #define V_RES (480)  

    /* 创建一个显示 */  
    lv_disp_t *disp = lv_wayland_create_window(H_RES, V_RES, "Window Title", close_cb);  

在上述调用过程中，Wayland 驱动会为每个显示注册四个输入设备：  

* 一个 **KEYPAD**，连接到 Wayland 键盘事件  
* 一个 **POINTER**，连接到 Wayland 触摸事件  
* 一个 **POINTER**，连接到 Wayland 指针事件  
* 一个 **ENCODER**，连接到 Wayland 指针轴事件  

每个显示的输入设备句柄可以分别通过以下函数获取：  

- ``lv_wayland_get_indev_keyboard()``  
- ``lv_wayland_get_indev_touchscreen()``  
- ``lv_wayland_get_indev_pointer()``  
- ``lv_wayland_get_indev_pointeraxis()``  

Fullscreen mode（全屏模式）
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

To programmatically fullscreen the window,
use the ``lv_wayland_window_set_fullscreen()`` function respectively with ``true``
or ``false`` for the ``fullscreen`` argument.

.. raw:: html

   </details>
   <br>

要以编程方式将窗口设置为全屏，  
使用 ``lv_wayland_window_set_fullscreen()`` 函数，并将 ``fullscreen`` 参数分别设置为 ``true`` 或 ``false``。  

Maximized mode（最大化模式）
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

To programmatically maximize the window,
use the ``lv_wayland_window_set_maximized()`` function respectively with ``true``
or ``false`` for the ``maximized`` argument.

.. raw:: html

   </details>
   <br>

要以编程方式将窗口最大化，  
使用 ``lv_wayland_window_set_maximized()`` 函数，并将 ``maximized`` 参数分别设置为 ``true`` 或 ``false``。  

Custom timer handler（自定义定时器处理程序）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Always call ``lv_wayland_timer_handler()`` in your timer loop instead of the regular ``lv_timer_handler()``.

**Note:** ``lv_wayland_timer_handler()`` internally calls ``lv_timer_handler()``

This allows the wayland client to work on well on weston, resizing shared memory buffers during
a commit does not work well on weston.

Wrapping the call to ``lv_timer_hander()`` is a necessity to have more control over
when the LVGL flush callback is called.

The custom timer handler returns ``false`` if the frame from previous cycle is not rendered.
When this happens, it usually means that the application is minimized or hidden behind another window.
Causing the driver to wait until the arrival of any message on the wayland socket, the process is in interruptible sleep.

.. raw:: html

   </details>
   <br>

始终在定时器循环中调用 ``lv_wayland_timer_handler()``，而不是常规的 ``lv_timer_handler()``。  

**注意：** ``lv_wayland_timer_handler()`` 在内部调用了 ``lv_timer_handler()``。  

这样可以确保 Wayland 客户端在 **weston** 上正常工作，因为在提交期间调整共享内存缓冲区大小在 **weston** 上表现不佳。  

对 ``lv_timer_handler()`` 的封装是必要的，以便更好地控制何时调用 LVGL 的刷新回调。  

自定义的定时器处理程序会返回 ``false``，如果前一个周期的帧尚未渲染完成。当出现这种情况时，通常表示应用程序已最小化或被其他窗口遮挡。  
此时驱动程序会等待 Wayland 套接字上任何消息的到来，进程进入可中断睡眠状态。  

Building the wayland driver（构建 Wayland 驱动程序）
--------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

An example simulator is available in this `repo <https://github.com/lvgl/lv_port_linux/>`__

If there is a need to use driver with another build system. The source and header files for the XDG shell
must be generated from the definitions for the XDG shell protocol.

In the example Cmake is used to perform the operation by invoking the ``wayland-scanner`` utility

To achieve this manually,

Make sure the dependencies listed at the start of the article are installed.

The wayland protocol is defined using XML files which are present in ``/usr/share/wayland-protocols``

To generate the required files run the following commands:

.. code-block:: sh

   wayland-scanner client-header </usr/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml > wayland_xdg_shell.h
   wayland-scanner private-code </usr/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml > wayland_xdg_shell.c

The resulting files can then be integrated into the project, it's better to re-run ``wayland-scanner`` on
each build to ensure that the correct versions are generated, they must match the version of the ``wayland-client``
dynamically linked library installed on the system.

.. raw:: html

   </details>
   <br>

一个示例模拟器可在此 `仓库 <https://github.com/lvgl/lv_port_linux/>`__ 中找到。  

如果需要将驱动与其他构建系统一起使用，必须从 XDG Shell 协议的定义中生成 XDG Shell 的源文件和头文件。  

在示例中，使用 CMake 通过调用 ``wayland-scanner`` 工具执行此操作。  

要手动实现此操作：  

确保本文开头列出的依赖项已安装。  

Wayland 协议是使用 XML 文件定义的，这些文件位于 ``/usr/share/wayland-protocols`` 目录中。  

要生成所需的文件，请运行以下命令：  

.. code-block:: sh  

   wayland-scanner client-header </usr/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml > wayland_xdg_shell.h  
   wayland-scanner private-code </usr/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml > wayland_xdg_shell.c  

生成的文件可以集成到项目中。最好在每次构建时重新运行 ``wayland-scanner``，以确保生成正确的版本。这些文件必须与系统上安装的 ``wayland-client`` 动态链接库的版本匹配。  

Current state and objectives（现状和目标）
----------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

* Add direct rendering mode
* Refactor the shell integrations to avoid excessive conditional compilation
* Technically, the wayland driver allows to create multiple windows - but this feature is experimental.
* Eventually add enhanced support for XDG shell to allow the creation of desktop apps on Unix-like platforms,
  similar to what the win32 driver does.
* Add a support for Mesa, currently wl_shm is used and it's not the most effective technique.

.. raw:: html

   </details>
   <br>

* 添加直接渲染模式  
* 重构 Shell 集成，避免过多的条件编译  
* 从技术上讲，Wayland 驱动允许创建多个窗口 —— 但此功能仍处于实验阶段  
* 最终增强对 XDG Shell 的支持，以便在类 Unix 平台上创建桌面应用程序，类似于 win32 驱动的功能  
* 添加对 Mesa 的支持，目前使用的是 ``wl_shm``，这并不是最有效的技术  

Bug reports（错误报告）
---------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The wayland driver is currently under construction, bug reports, contributions and feedback is always welcome.

It is however important to create detailed issues when a problem is encountered, logs and screenshots of the problem are of great help.

Please enable ``LV_USE_LOG`` and launch the simulator executable like so

.. code::

  WAYLAND_DEBUG=1 ./path/to/simulator_executable > /tmp/debug 2>&1

This will create a log file called ``debug`` in the ``/tmp`` directory, copy-paste the content of the file in the github issue.
The log file contains LVGL logs and the wayland messages.

Be sure to replicate the problem quickly otherwise the logs become too big

.. raw:: html

   </details>
   <br>

Wayland 驱动目前正在开发中，欢迎提交错误报告、贡献和反馈。  

在遇到问题时，请务必创建详细的 issue，提供日志和问题的截图将大有帮助。  

请启用 ``LV_USE_LOG``，然后按以下方式启动模拟器可执行文件：  

.. code::  

   WAYLAND_DEBUG=1 ./path/to/simulator_executable > /tmp/debug 2>&1  

这将在 ``/tmp`` 目录中创建一个名为 ``debug`` 的日志文件，请将该文件的内容复制粘贴到 GitHub issue 中。  
日志文件包含 LVGL 的日志和 Wayland 的消息。  

请确保尽快复现问题，否则日志文件会变得过大。  
