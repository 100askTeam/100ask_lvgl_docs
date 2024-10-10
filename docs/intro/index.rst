.. _introduction:

====================
Introduction（介绍）
====================

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL (Light and Versatile Graphics Library) is a free and open-source graphics library providing everything you need to create an embedded GUI with easy-to-use graphical elements, beautiful visual effects and a low memory footprint.

.. raw:: html

   </details>
   <br>


LVGL(轻量级和通用图形库)是一个免费和开源的图形库，它提供了创建嵌入式GUI所需的一切，具有易于使用的图形元素，美丽的视觉效果和低内存占用。


Key features（主要特性）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

- Powerful building blocks such as buttons, charts, lists, sliders, images, etc.
- Advanced graphics with animations, anti-aliasing, opacity, smooth scrolling
- Various input devices such as touchpad, mouse, keyboard, encoder, etc.
- Multi-language support with UTF-8 encoding
- Multi-display support, i.e. use multiple TFT, monochrome displays simultaneously
- Fully customizable graphic elements with CSS-like styles
- Hardware independent: use with any microcontroller or display
- Scalable: able to operate with little memory (64 kB Flash, 16 kB RAM)
- OS, external memory and GPU are supported but not required
- Single frame buffer operation even with advanced graphic effects
- Written in C for maximal compatibility (C++ compatible)
- Simulator to start embedded GUI design on a PC without embedded hardware
- Binding to MicroPython
- Tutorials, examples, themes for rapid GUI design
- Documentation is available online and as PDF
- Free and open-source under MIT license

.. raw:: html

   </details>
   <br>


- 丰富且强大的模块化图形组件，例如按钮 (buttons)、图表 (charts)、列表 (lists)、滑动条 (sliders)、图片 (images) 等
- 高级的图形引擎：具有动画、抗锯齿、透明度、平滑滚动、图层混合等效果
- 支持多种输入设备：例如触摸屏、 键盘、编码器、按键等
- 支持多语言，采用 UTF-8 编码
- 多显示器支持，即可以同时使用多个 TFT、单色显示器
- 具有类似 CSS 样式的完全可定制图形元素
- 与硬件无关：可与任何微控制器或显示器配合使用
- 可扩展：能够在内存很小的情况下运行（64KB 闪存，16KB 内存）
- 支持操作系统、外部存储器和 GPU，但不是必需的
- 即使具有高级图形效果，也可进行单帧缓冲操作
- 用 C 语言编写以实现最大兼容性（与 C++ 兼容）
- 模拟器可在没有嵌入式硬件的情况下在 PC 上开始嵌入式图形用户界面设计
- 支持与 MicroPython 绑定
- 教程、示例、主题可用于快速图形用户界面设计
- 文档可在线获取以及以 PDF 形式提供
- 在 MIT 许可下免费和开源


.. _requirements:

Requirements（配置要求）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>


Basically, every modern controller which is able to drive a display is suitable to run LVGL. The minimal requirements are:

* 16, 32 or 64 bit microcontroller or processor
* > 16 MHz clock speed is recommended
* Flash/ROM: > 64 kB for the very essential components (> 180 kB is recommended)
* RAM:
    * Static RAM usage: ~2 kB depending on the used features and object types
    * stack: > 2kB (> 8 kB is recommended)
    * Dynamic data (heap): > 2 KB (> 48 kB is recommended if using several objects).
        Set by :c:macro:`LV_MEM_SIZE` in ``lv_conf.h``.
    * Display buffer:  > *"Horizontal resolution"* pixels (> 10 *"Horizontal resolution"* is recommended)
    * One frame buffer in the MCU or in an external display controller
* C99 or newer compiler
* Basic C (or C++) knowledge:
    * `pointers <https://www.tutorialspoint.com/cprogramming/c_pointers.htm>`_.
    * `structs <https://www.tutorialspoint.com/cprogramming/c_structures.htm>`_.
    * `callbacks <https://www.geeksforgeeks.org/callbacks-in-c/>`_.



:Note: *memory usage may vary depending on architecture, compiler and build options.*

.. raw:: html

   </details>
   <br>


基本上，每个能够驱动显示器的现代控制器都适合运行 LVGL。 最低要求是：

* 16、32 或 64 位微控制器或处理器
* 建议时钟速度大于 16MHz
* Flash/ROM： 对于非常基本的组件，需要大于 64KB (建议大于 180KB)
* RAM:
    * 静态 RAM 的使用量：根据使用的功能和对象类型，约为 2KB
    * 栈空间: 大于 2KB (建议大于 8KB)
    * 动态数据（堆）: 如果使用多个对象，大于 2KB (建议大于 48KB)。通过在 “lv_conf.h” 文件中的 :c:macro:LV_MEM_SIZE进行设置。
    * 显示缓冲区：大于 “水平分辨率” 像素（建议大于 10 倍 “水平分辨率”）
    * 在MCU或外部显示控制器中有一个帧缓冲区
* C99 或更新版本的编译器
* 具备基本的 C（或 C++）知识：
    * `pointers <https://www.tutorialspoint.com/cprogramming/c_pointers.htm>`_。
    * `structs <https://www.tutorialspoint.com/cprogramming/c_structures.htm>`_。
    * `callbacks <https://www.geeksforgeeks.org/callbacks-in-c/>`_。
:注意: *内存使用量可能因架构、编译器和构建选项而有所不同.*


License（许可证）
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The LVGL project (including all repositories) is licensed under `MIT license <https://github.com/lvgl/lvgl/blob/master/LICENCE.txt>`_.
This means you can use it even in commercial projects.

It's not mandatory, but we highly appreciate it if you write a few words about your project in the `My projects <https://forum.lvgl.io/c/my-projects/10>`_ category of the forum or a private message to `lvgl.io <https://lvgl.io/#contact>`_.

Although you can get LVGL for free there is a massive amount of work behind it. It's created by a group of volunteers who made it available for you in their free time.

To make the LVGL project sustainable, please consider :ref:`contributing` to the project.
You can choose from many different ways of contributing See :ref:`contributing` such as simply writing a tweet about you using LVGL, fixing bugs, translating the documentation, or even becoming a maintainer.

.. raw:: html

   </details>
   <br>


LVGL 项目（包括所有存储库）在 `MIT license <https://github.com/lvgl/lvgl/blob/master/LICENCE.txt>`_ 授权下获得许可。 这意味着您甚至可以在商业项目中使用它。

这不是强制性的，但如果您在论坛的 `My projects <https://forum.lvgl.io/c/my-projects/10>`_ 分类中写一些关于你的项目的文字，或者给 `lvgl.io <https://lvgl.io/#contact>`_ 发一封私信，我们将非常感激。

尽管您可以免费获得 LVGL，但它背后的工作量很大。它由一群志愿者创建，他们在空闲时间为您提供了这个库。

为了使 LVGL 项目可持续发展，请考虑为该项目做贡献。你可以从许多不同的贡献方式中进行选择，见 :ref:`contributing` 部分，例如简单地写一条关于您正在使用 LVGL 的推文、修复错误、翻译文档，甚至成为维护者。


Repository layout（仓库布局）
----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

All repositories of the LVGL project are hosted on `GitHub <https://github.com/lvgl>`_

.. raw:: html

   </details>
   <br>


LVGL 项目的所有代码仓库都托管在 `GitHub <https://github.com/lvgl>`_


.. raw:: html

   <details>
     <summary>显示原文</summary>

You will find these repositories there:

* `lvgl <https://github.com/lvgl/lvgl>`_: The library itself with many `examples <https://github.com/lvgl/lvgl/blob/master/examples/>`_ and `demos <https://github.com/lvgl/lvgl/blob/master/demos/>`_.
* `lv_drivers <https://github.com/lvgl/lv_drivers>`_: Display and input device drivers
* `blog <https://github.com/lvgl/blog>`_: Source of the `blog's site <https://blog.lvgl.io>`_
* `sim <https://github.com/lvgl/sim>`_: Source of the `online simulator's site <https://sim.lvgl.io>`_
* `lv_port_* <https://github.com/lvgl?q=lv_port&type=&language=>`_: LVGL ports to development boards or environments
* `lv_binding_* <https://github.com/lvgl?q=lv_binding&type=&language=l>`_: Bindings to other languages

.. raw:: html

   </details>
   <br>


您可以从下面的列表获取到lvgl所有相关的代码仓库：

- `lvgl <https://github.com/lvgl/lvgl>`_：库本身以及许多 `例子 <https://github.com/lvgl/lvgl/blob/master/examples/>`_ 和  `演示示例 <https://github.com/lvgl/lvgl/blob/master/demos/>`_。

- `lv_drivers <https://github.com/lvgl/lv_drivers>`_: 显示和输入设备驱动程序。

- `博客 <https://github.com/lvgl/blog>`_: `博客网站 <https://blog.lvgl.io>`_的源代码。

- `sim <https://github.com/lvgl/sim>`_:  `在线模拟器网站 <https://sim.lvgl.io>`_的源代码。

- `lv_port_* <https://github.com/lvgl?q=lv_port&type=&language=>`_: LVGL 针对开发板或环境的移植。

- `lv_binding_* <https://github.com/lvgl?q=lv_binding&type=&language=l>`_: 与其他语言的绑定。


Release policy（发布策略）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The core repositories follow the rules of `Semantic versioning <https://semver.org/>`_:

* Major version: incompatible API changes. E.g. v5.0.0, v6.0.0
* Minor version: new but backward-compatible functionalities. E.g. v6.1.0, v6.2.0
* Patch version: backward-compatible bug fixes. E.g. v6.1.1, v6.1.2

Tags like `vX.Y.Z` are created for every release.

.. raw:: html

   </details>
   <br>


LVGL库遵循 `语义化版本管理 <https://semver.org/>`_的规则:

* 主版本号：不兼容的 API 变更。例如 v5.0.0、v6.0.0
* 次版本号：新的但向后兼容的功能。例如 v6.1.0、v6.2.0
* 修订版本号：向后兼容的错误修复。例如 v6.1.1、v6.1.2

* 为每个版本创建像 `vX.Y.Z` 之类的标签。


Release cycle（发布周期）
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

* Bug fixes: Released on demand even weekly
* Minor releases: Every 3-4 months
* Major releases: Approximately yearly

.. raw:: html

   </details>
   <br>


* 错误修复：根据需求发布，甚至可能每周发布一次
* 次要版本：每 3-4 个月一次
* 主要版本：大约每年一次


Branches（分支）
^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

The core repositories have at least the following branches:

* `master`: latest version, patches are merged directly here.
* `release/vX.Y`: stable versions of the minor releases
* `fix/some-description`: temporary branches for bug fixes
* `feat/some-description`: temporary branches for features

.. raw:: html

   </details>
   <br>


核心存储库至少有以下分支：

* `master`: 最新版本，补丁直接合并到这里。
* `release/vX.Y`: 次要版本的稳定版本
* `fix/some-description`: 用于错误修复的临时分支
* `feat/some-description`: 用于新功能的临时分支


Changelog（变更日志）
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

The changes are recorded in :ref:`changelog`.

.. raw:: html

   </details>
   <br>


这些变更记录在 :ref:`changelog` 中。


Version support（版本支持）
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Before v8 the last minor release of each major series was supported for 1 year.
Starting from v8, every minor release is supported for 1 year.


+---------+--------------+--------------+--------+
| Version | Release date | Support end  | Active |
+=========+==============+==============+========+
|v5.3     | 1 Feb, 2019  | 1 Feb, 2020  | No     |
+---------+--------------+--------------+--------+
|v6.1     | 26 Nov, 2019 | 26 Nov, 2020 | No     |
+---------+--------------+--------------+--------+
|v7.11    | 16 Mar, 2021 | 16 Mar, 2022 | No     |
+---------+--------------+--------------+--------+
|v8.0     | 1 Jun, 2021  | 1 Jun, 2022  | No     |
+---------+--------------+--------------+--------+
|v8.1     | 10 Nov, 2021 | 10 Nov, 2022 | No     |
+---------+--------------+--------------+--------+
|v8.2     | 31 Jan, 2022 | 31 Jan, 2023 | No     |
+---------+--------------+--------------+--------+
|v8.3     | 6 July, 2022 | 1 Jan, 2025  | Yes    |
+---------+--------------+--------------+--------+
|v9.0     |In progress                           |
+---------+--------------------------------------+

.. raw:: html

   </details>
   <br>


在v8之前，每个主要版本的最后一个次要版本会被支持1年。从v8开始，每个次要版本都支持1年。


+---------+---------------------+--------------------+--------+
| 版本    | 发布日期             | 支持结束            | 活跃   |
+=========+=====================+====================+========+
|v5.3     | 2019 年 2 月 1 日   | 2020 年 2 月 1 日   | No     |
+---------+---------------------+--------------------+--------+
|v6.1     | 2019 年 11 月 26 日 | 2020 年 11 月 26 日 | No     |
+---------+---------------------+--------------------+--------+
|v7.11    | 2021 年 3 月 16 日  | 2022 年 3 月 16 日  | No     |
+---------+---------------------+--------------------+--------+
|v8.0     | 2021年6月1日        | 2022年6月1日        | No     |
+---------+---------------------+--------------------+--------+
|v8.1     | 2021 年 11 月 10 日 | 2022 年 11 月 10 日 | No     |
+---------+---------------------+--------------------+--------+
|v8.2     | 2022年1月31日       | 2023年1月31日       | No     |
+---------+---------------------+--------------------+--------+
|v8.3     | 2022年7月6日        | 2025年7月6日        | Yes    |
+---------+---------------------+--------------------+--------+
|v9.0     | 进行中                                            |
+---------+---------------------------------------------------+



FAQ（常见问题）
---------------

Where can I ask questions?（我可以在哪里提问？）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can ask questions in the forum: `https://forum.lvgl.io/ <https://forum.lvgl.io/>`_.

We use `GitHub issues <https://github.com/lvgl/lvgl/issues>`_ for development related discussion.
You should use them only if your question or issue is tightly related to the development of the library.

Before posting a question, please ready this FAQ section as you might find answer to your issue here too.

.. raw:: html

   </details>
   <br>


可以在论坛提问： `https://forum.lvgl.io/ <https://forum.lvgl.io/>`_。

我们使用 `GitHub issues <https://github.com/lvgl/lvgl/issues>`_ 进行与开发相关的讨论。 只有当您的问题或事项与库的开发密切相关时，才应使用它们。

在发布问题之前，请先阅读此常见问题解答部分，因为你可能在这里也能找到问题的答案。

Is my MCU/hardware supported?（LVGL是否支持我的 MCU/硬件？）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Every MCU which is capable of driving a display via parallel port, SPI, RGB interface or anything else and fulfills the :ref:`requirements` is supported by LVGL.

This includes:

* "Common" MCUs like STM32F, STM32H, NXP Kinetis, LPC, iMX, dsPIC33, PIC32, SWM341 etc.
* Bluetooth, GSM, Wi-Fi modules like Nordic NRF, Espressif ESP32 and Raspberry Pi Pico W
* Linux with frame buffer device such as /dev/fb0. This includes Single-board computers like the Raspberry Pi
* Anything else with a strong enough MCU and a peripheral to drive a display

.. raw:: html

   </details>
   <br>


LVGL 支持每个能够通过并行端口、SPI、RGB 接口或其他任何方式驱动显示器并满足 :ref:`要求` 的 MCU。

这包括：

* “通用” MCU，如 STM32F、STM32H、NXP Kinetis、LPC、IMX、dsPIC33、PIC32、SWM341 等。
*  蓝牙、GSM、Wi-Fi 模块，如Nordic NRF、Espressif ESP32和Raspberry Pi Pico W
* 带有帧缓冲设备（例如 /dev/fb0）的Linux。 这包括单板计算机，如 Raspberry Pi
* 任何具有足够强大的 MCU 和用于驱动显示器的外设的其他设备


Is my display supported?（我的显示器是否受支持？）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL needs just one simple driver function to copy an array of pixels into a given area of the display.
If you can do this with your display then you can use it with LVGL.

Some examples of the supported display types:

* TFTs with 16 or 24 bit color depth
* Monitors with an HDMI port
* Small monochrome displays
* Gray-scale displays
* even LED matrices
* or any other display where you can control the color/state of the pixels

See the :ref:`display_interface` section to learn more.

.. raw:: html

   </details>
   <br>


LVGL 只需要一个简单的驱动程序函数，即可将像素阵列复制到显示器的给定区域。 如果您可以在显示器上执行此操作，那么您就可以在 LVGL 中使用它。

些受支持的显示器类型示例：

* 具有 16 位或 24 位色深的 TFT 显示器
* 带有 HDMI 端口的显示器
* 小型单色显示器
* 灰度显示
* 甚至是 LED 矩阵
* 或任何其他可以控制像素颜色/状态的显示器

请参阅 :ref:`display_interface` 部分以了解更多信息。


LVGL doesn't start, randomly crashes or nothing is drawn on the display. What can be the problem?（LVGL未启动、随机崩溃或显示器上未绘制任何内容。可能是什么问题呢？）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

* Try increasing :c:macro:`LV_MEM_SIZE`.
* Be sure your display works without LVGL. E.g. paint it to red on start up.
* Enable :ref:`logging`
* Enable asserts in ``lv_conf.h`` (`LV_USE_ASSERT_...`)
* If you use an RTOS
   * increase the stack size of the task which calls :cpp:func:`lv_timer_handler`
   * Be sure you used a mutex as described here: :ref:`os_interrupt`

.. raw:: html

   </details>
   <br>


* 请尝试增加 :c:macro:`LV_MEM_SIZE`（LVGL 内存大小宏定义）。
* 确保您的显示器在没有LVGL的情况下工作。例如：启动时把它涂成红色。
* 启用 :ref:`logging`功能
* 在 ``lv_conf.h`` 文件中启用断言(`LV_USE_ASSERT_...`)
* 如果您使用RTOS
    * 增加调用 :cpp:func:`lv_timer_handler` 的任务的堆栈大小
    * 确保按照这里的描述使用了互斥锁： :ref:`os_interrupt`


My display driver is not called. What have I missed?（我的显示驱动程序没有被调用。我遗漏了什么？）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Be sure you are calling :cpp:expr:`lv_tick_inc(x)` in an interrupt and :cpp:func:`lv_timer_handler` in your main ``while(1)``.

Learn more in the :ref:`tick` and :ref:`timer` sections.

.. raw:: html

   </details>
   <br>


确保你在中断中调用了 :cpp:expr:`lv_tick_inc(x)` ，在你的主 ``while(1)`` 中调用了 :cpp:func:`lv_timer_handler` 。

在 :ref:`tick` 和 :ref:`timer` 部分可以了解更多信息。


Why is the display driver called only once? Only the upper part of the display is refreshed.（为什么显示驱动程序只调用一次？仅刷新显示的上部。）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Be sure you are calling :cpp:expr:`lv_display_flush_ready(drv)` at the end of your "*display flush callback*".

.. raw:: html

   </details>
   <br>


确保在你的"*显示刷新回调函数*"结束时调用 :cpp:expr:`lv_display_flush_ready(drv)` 。


Why do I see only garbage on the screen?（为什么我在屏幕上只看到乱码？）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Probably there a bug in your display driver. Try the following code without using LVGL. You should see a square with red-blue gradient.

.. raw:: html

   </details>
   <br>


很可能是你的显示驱动程序中有错误。在不使用 LVGL 的情况下尝试以下代码。你应该看到一个带有红蓝渐变色的正方形。


.. code-block:: c

    #define BUF_W 20
    #define BUF_H 10

    lv_color_t buf[BUF_W * BUF_H];
    lv_color_t * buf_p = buf;
    uint16_t x, y;
    for(y = 0; y < BUF_H; y++) {
        lv_color_t c = lv_color_mix(LV_COLOR_BLUE, LV_COLOR_RED, (y * 255) / BUF_H);
        for(x = 0; x < BUF_W; x++){
            (*buf_p) =  c;
            buf_p++;
        }
    }

    lv_area_t a;
    a.x1 = 10;
    a.y1 = 40;
    a.x2 = a.x1 + BUF_W - 1;
    a.y2 = a.y1 + BUF_H - 1;
    my_flush_cb(NULL, &a, buf);


Why do I see nonsense colors on the screen?（为什么我在屏幕上看到无意义的颜色？）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Probably LVGL's color format is not compatible with your display's color format. Check :c:macro:`LV_COLOR_DEPTH` in *lv_conf.h*.

.. raw:: html

   </details>
   <br>


可能 LVGL 的颜色格式与您的显示器的颜色格式不兼容。 检查 *lv_conf.h* 中的 :c:macro:`LV_COLOR_DEPTH` 。


How to speed up my UI?（如何加速我的用户界面？）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

- Turn on compiler optimization and enable cache if your MCU has it
- Increase the size of the display buffer
- Use two display buffers and flush the buffer with DMA (or similar peripheral) in the background
- Increase the clock speed of the SPI or parallel port if you use them to drive the display
- If your display has an SPI port consider changing to a model with a parallel interface because it has much higher throughput
- Keep the display buffer in internal RAM (not in external SRAM) because LVGL uses it a lot and it should have a fast access time

.. raw:: html

   </details>
   <br>


- 开启编译器优化，如果你的微控制器单元（MCU）有缓存则启用缓存
- 增加显示缓冲区的大小
- 使用 2 个显示缓冲区，并在后台使用直接存储器访问（DMA）或类似的外设刷新缓冲区
- 如果您使用 SPI 或并行端口来驱动显示器，请提高它们的时钟速度
- 如果您的显示器具有 SPI 端口，请考虑更改为并行模型，因为它具有更高的吞吐量
- 将显示缓冲区保持在内部 RAM（而不是外部 SRAM）中，因为 LVGL 经常使用它，并且它应该具有快速的访问时间


How to reduce flash/ROM usage?（如何减少闪存/ROM的使用？）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can disable all the unused features (such as animations, file system, GPU etc.) and object types in *lv_conf.h*.

If you are using GCC/CLANG you can add `-fdata-sections -ffunction-sections` compiler flags and `--gc-sections` linker flag to remove unused functions and variables from the final binary. If possible, add the `-flto` compiler flag to enable link-time-optimisation together with `-Os` for GCC or `-Oz` for CLANG.

.. raw:: html

   </details>
   <br>


您可以在 *lv_conf.h* 中禁用所有未使用的功能（如动画、文件系统、GPU等）和对象类型。

如果您正在使用GCC/CLANG，您可以添加 `-fdata-sections -ffunction-sections` 编译器标志和 `--gc-sections` 链接器标志，以从最终二进制文件中删除未使用的函数和变量。如果可能，请添加 `-flto` 编译器标志，以便与GCC的 `-Os` 或CLANG的 `-Oz` 一起启用链接时间优化。


How to reduce the RAM usage?（如何减少内存使用）
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

* Lower the size of the *Display buffer*
* Reduce :c:macro:`LV_MEM_SIZE` in *lv_conf.h*. This memory is used when you create objects like buttons, labels, etc.
* To work with lower :c:macro:`LV_MEM_SIZE` you can create objects only when required and delete them when they are not needed anymore

.. raw:: html

   </details>
   <br>


* 减小 *显示缓冲区* 的大小
* 减少 *lv_conf.h* 中的 :c:macro:`LV_MEM_SIZE` 。 当您创建如按钮、标签等对象时，会使用此内存。
* 为了在较小的 :c:macro:`LV_MEM_SIZE` 下工作，您可以仅在需要时创建对象并在不再需要时将其删除


How to work with an operating system?（如何使用操作系统？）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

To work with an operating system where tasks can interrupt each other (preemptively) you should protect LVGL related function calls with a mutex.
See the :ref:`os_interrupt` section to learn more.

.. raw:: html

   </details>
   <br>


在操作系统中，任务可能会相互中断（抢占式），因此你应该使用互斥锁来保护与 LVGL 相关的函数调用。 请参阅 :ref:`os_interrupt` 部分以了解更多信息。

