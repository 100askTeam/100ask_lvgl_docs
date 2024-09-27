===
QNX
===

What is QNX?（QNX是什么？）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

QNX is a commercial operating system first released in 1980. The operating
system is based on a micro-kernel design, with the file system(s), network
stack, and various other drivers each running in its own process with a separate
address space.

See www.qnx.com for more details.

.. raw:: html

   </details>
   <br>


QNX 是一个商业操作系统，最早于1980年发布。该操作系统基于微内核设计，文件系统、网络栈以及各种其他驱动程序各自在独立的进程中运行，拥有自己的地址空间。

有关更多详细信息，请访问 www.qnx.com。


Highlight of QNX（QNX 的亮点）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

- 64-bit only, runs on x86_64 and ARMv8
- Requires an MMU as the design mandates separation among processes
- Support for thousands of processes and millions of threads
- Up to 64 cores, up to 16TB of RAM
- Virtualization support (as host and guest)
- Full POSIX compatibility
- Safety certification to various automotive, industrial and medical standards

.. raw:: html

   </details>
   <br>


- 仅支持64位，运行在x86_64和ARMv8架构上
- 需要内存管理单元（MMU），因为设计要求进程之间进行分离
- 支持数千个进程和数百万条线程
- 支持多达64个核心，高达16TB的RAM
- 支持虚拟化（作为宿主和客户）
- 完全兼容POSIX
- 符合各种汽车、工业和医疗安全标准认证


How to run LVGL on QNX?（如何在 QNX 上运行 LVGL？）
--------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

There are two ways to use LVGL in your QNX project. The first is similar to how
LVGL is used on other systems. The second is to build LVGL as either a shared or
a static library.

.. raw:: html

   </details>
   <br>


在 QNX 项目中使用 LVGL 有两种方式。第一种方式与在其他系统上使用 LVGL 类似。第二种是将 LVGL 构建为共享库或静态库。


Include LVGL in Your Project（将 LVGL 包含到您的项目中）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Follow the generic instructions for getting started with LVGL. After copying
`lv_conf_template.h` to  `lv_conf.h` make the following changes to the latter:

1. Enable QNX support:
.. code::
    #define LV_USE_QNX 1

2. Set colour depth to 32:
.. code::
    #define LV_COLOR_DEPTH 32

3. (Optional) Enable double-buffering:
.. code::
    #define LV_QNX_BUF_COUNT 2

.. raw:: html

   </details>
   <br>


按照通用的 LVGL 开始指南进行操作。在将 `lv_conf_template.h` 复制到 `lv_conf.h` 后，对后者进行以下更改：

1. 启用 QNX 支持：
.. code::
    #define LV_USE_QNX 1

2. 将颜色深度设置为 32 位：
.. code::
    #define LV_COLOR_DEPTH 32

3. （可选）启用双缓冲：
.. code::
    #define LV_QNX_BUF_COUNT 2


Build LVGL as a Library（将 LVGL 构建为库）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

**Note that this method is an alternative to including LVGL in your project. If
you choose to build a library then you do not need to follow the instructions in
the previous section.**

The top-level `qnx` directory includes a recursive make file for building LVGL,
both as a shared library and as a static library for the supported
architectures. To build all libraries, simply invoke `make` in this directory:

.. code:: shell

    # cd $(LVGL_ROOT)/env_support/qnx
    # make

If you prefer to build for a specific architecture and variant, go to the
appropriate directory and run `make` there. For example, to build a shared
library for ARMv8:

.. code:: shell

    # cd $(LVGL_ROOT)/env_support/qnx/aarch64/so.le
    # make

As a general rule, if you only want to have one LVGL application in your system
then it is better to use a static library. If you have more than one, and
especially if they run concurrently, it is better to use the shared library.

Before building the library, you may wish to edit
`$(LVGL_ROOT)/env_support/qnx/lv_conf.h`, e.g. to add fonts or disable
double-buffering.

.. raw:: html

   </details>
   <br>


**注意，这种方法是将 LVGL 包含到您的项目的替代方案。如果您选择构建库，那么您不需要遵循前一节中的说明。**

顶级的 `qnx` 目录包含了一个递归的 make 文件，用于为支持的架构构建 LVGL，既可以作为共享库也可以作为静态库。要构建所有库，只需在该目录下简单地调用 `make`：

.. code:: shell

    # cd $(LVGL_ROOT)/env_support/qnx
    # make

如果您希望为特定的架构和变体构建，转到相应的目录并在那运行 `make`。例如，要为 ARMv8 构建一个共享库：

.. code:: shell

    # cd $(LVGL_ROOT)/env_support/qnx/aarch64/so.le
    # make

通常，如果您的系统中只有一个 LVGL 应用程序，那么使用静态库更好。如果您有多个应用程序，特别是如果它们同时运行，使用共享库更好。

在构建库之前，您可能希望编辑 `$(LVGL_ROOT)/env_support/qnx/lv_conf.h`，例如添加字体或禁用双缓冲。


Writing a LVGL Application （编写一个 LVGL 应用程序）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

To create a LVGL application for QNX, follow these steps in your code:

1. Initialize the library.
2. Create a window.
3. Add the input devices.
4. Create the UI.
5. Run the event loop.

Steps 2, 3 and 5 use QNX-specific calls, but the rest of the code should be
identical to that of a LVGL application written for any other platform.

The following code shows how to create a "Hello World" application:

.. code:: c

    #include <lvgl.h>

    int
    main(int argc, char **argv)
    {
        /* Initialize the library. */
        lv_init();

        /* Create a 800x480 window. */
        lv_display_t *disp = lv_qnx_window_create(800, 480);
        lv_qnx_window_set_title(disp, "LVGL Example");

        /* Add keyboard and mouse devices. */
        lv_qnx_add_keyboard_device(disp);
        lv_qnx_add_pointer_device(disp);

        /* Generate the UI. */
        lv_obj_set_style_bg_color(lv_screen_active(), lv_color_hex(0x003a57), LV_PART_MAIN);

        lv_obj_t * label = lv_label_create(lv_screen_active());
        lv_label_set_text(label, "Hello world");
        lv_obj_set_style_text_color(lv_screen_active(), lv_color_hex(0xffffff), LV_PART_MAIN);
        lv_obj_align(label, LV_ALIGN_CENTER, 0, 0);

        /* Run the event loop until it exits. */
        return lv_qnx_event_loop(disp);
    }

.. raw:: html

   </details>
   <br>


要为 QNX 创建一个 LVGL 应用程序，请在您的代码中遵循以下步骤：

1. 初始化库。
2. 创建一个窗口。
3. 添加输入设备。
4. 创建用户界面。
5. 运行事件循环。

步骤 2、3 和 5 使用特定于 QNX 的调用，但其余代码应与为任何其他平台编写的 LVGL 应用程序相同。

以下代码展示了如何创建一个 “Hello World” 应用程序：

.. code:: c

    #include <lvgl.h>

    int
    main(int argc, char **argv)
    {
        /* 初始化库。 */
        lv_init();

        /* 创建一个 800x480 像素的窗口。 */
        lv_display_t *disp = lv_qnx_window_create(800, 480);
        lv_qnx_window_set_title(disp, "LVGL 示例");

        /* 添加键盘和鼠标设备。 */
        lv_qnx_add_keyboard_device(disp);
        lv_qnx_add_pointer_device(disp);

        /* 生成用户界面。 */
        lv_obj_set_style_bg_color(lv_screen_active(), lv_color_hex(0x003a57), LV_PART_MAIN);

        lv_obj_t *label = lv_label_create(lv_screen_active());
        lv_label_set_text(label, "Hello world");
        lv_obj_set_style_text_color(label, lv_color_hex(0xffffff), LV_PART_MAIN);
        lv_obj_align(label, LV_ALIGN_CENTER, 0, 0);

        /* 运行事件循环，直到退出。 */
        return lv_qnx_event_loop(disp);
    }


Build the Application（构建应用程序）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Building the application consists of compiling the source with the LVGL headers,
and then linking against the library. This can be done in many ways, using
different build systems. The following is a simple make file for the example
above, which builds for ARMv8 with the shared library:

.. code:: makefile

    CC=qcc -Vgcc_ntoaarch64le

    LVGL_ROOT=$(HOME)/src/lvgl
    CCFLAGS=-I$(LVGL_ROOT)/env_support/qnx -I$(LVGL_ROOT)
    LDFLAGS=-lscreen -llvgl -L$(LVGL_ROOT)/env_support/qnx/aarch64/so.le

    lvgl_example: lvgl_example.c
    	$(CC) $(CCFLAGS) -Wall -o $@ $< $(LDFLAGS)

    clean:
    	rm -f *.o *~ lvgl_example

.. raw:: html

   </details>
   <br>


构建应用程序包括使用 LVGL 头文件编译源代码，然后与库进行链接。这可以通过多种方式完成，使用不同的构建系统。以下是一个简单的 makefile 文件，用于构建上述示例，它使用共享库为 ARMv8 构建：

.. code:: makefile

    CC=qcc -Vgcc_ntoaarch64le

    LVGL_ROOT=$(HOME)/src/lvgl
    CCFLAGS=-I$(LVGL_ROOT)/env_support/qnx -I$(LVGL_ROOT)
    LDFLAGS=-lscreen -llvgl -L$(LVGL_ROOT)/env_support/qnx/aarch64/so.le

    lvgl_example: lvgl_example.c
    	$(CC) $(CCFLAGS) -Wall -o $@ $< $(LDFLAGS)

    clean:
    	rm -f *.o *~ lvgl_example

        