=====================================================
Linux Framebuffer Driver（Linux framebuffer驱动程序）
=====================================================

Overview（概览）
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Linux framebuffer (fbdev) is a linux subsystem used to display graphics. It is a hardware-independent API that gives user space software
access to the framebuffer (the part of a computer's video memory containing a current video frame) using only the Linux kernel's own basic
facilities and its device file system interface, avoiding the need for libraries that implement video drivers in user space. 

.. raw:: html

   </details>
   <br>


Linux framebuffer（fbdev）是一个Linux子系统，用于显示图形。它是一个与硬件无关的API，可以让用户空间软件仅使用Linux内核自身的基本功能和设备文件系统接口，访问帧缓冲区（计算机视频内存中包含当前视频帧的部分），避免了在用户空间实现视频驱动程序的库的需求。


Prerequisites（先决条件）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Your system has a framebuffer device configured (usually under ``/dev/fb0``).

.. raw:: html

   </details>
   <br>


您的系统已配置了一个帧缓冲设备（通常位于 ``/dev/fb0`` 下）。


Configuring the driver（配置驱动程序）
-------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable the framebuffer driver support in lv_conf.h, by cmake compiler define or by KConfig. Additionally you may configure the rendering
mode.

.. code:: c

	#define LV_USE_LINUX_FBDEV           1
	#define LV_LINUX_FBDEV_RENDER_MODE   LV_DISPLAY_RENDER_MODE_PARTIAL

.. raw:: html

   </details>
   <br>


请在lv_conf.h中启用framebuffer驱动程序支持，可以通过CMake编译器定义或KConfig来实现。另外，您还可以配置渲染模式。

.. code:: c

	#define LV_USE_LINUX_FBDEV           1
	#define LV_LINUX_FBDEV_RENDER_MODE   LV_DISPLAY_RENDER_MODE_PARTIAL


Usage（用法）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To set up a framebuffer-based display, first create a display with ``lv_linux_fbdev_create``. Afterwards set the framebuffer device
node on the display (usually this is ``/dev/fb0``).

.. code:: c

	lv_display_t *disp = lv_linux_fbdev_create();
	lv_linux_fbdev_set_file(disp, "/dev/fb0");

If your screen stays black or only draws partially, you can try enabling direct rendering via ``LV_DISPLAY_RENDER_MODE_DIRECT``. Additionally,
you can activate a force refresh mode with ``lv_linux_fbdev_set_force_refresh(true)``. This usually has a performance impact though and shouldn't
be enabled unless really needed.

.. raw:: html

   </details>
   <br>


搭建基于帧缓冲显示的方法如下：首先使用 ``lv_linux_fbdev_create`` 创建一个显示器。然后在显示器上设置帧缓冲设备节点（通常为 ``/dev/fb0``）。

.. code:: c

	lv_display_t *disp = lv_linux_fbdev_create();
	lv_linux_fbdev_set_file(disp, "/dev/fb0");

如果你的屏幕保持黑屏或只绘制部分内容，可以尝试启用直接渲染模式（ ``LV_DISPLAY_RENDER_MODE_DIRECT``）。此外，你还可以使用 ``lv_linux_fbdev_set_force_refresh(true)`` 来激活强制刷新模式。然而，这通常会带来性能影响，除非确实需要，否则不应启用。


