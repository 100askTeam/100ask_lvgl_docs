.. _introduction:

====================
Introduction（介绍）
====================
.. raw:: html

   <details>
     <summary>显示原文</summary>
LVGL (Light and Versatile Graphics Library) is a free and open-source graphics
library providing everything you need to create an embedded GUI with easy-to-use
graphical elements, beautiful visual effects, and a low memory footprint.
.. raw:: html

   </details> 
   <br>
LVGL（轻量且多功能的图形库）是一个免费且开源的图形库，提供了创建嵌入式 GUI 所需的一切，包括易于使用的图形元素、美丽的视觉效果和低内存占用。
Key features（主要特性）
-------------------------
.. raw:: html

   <details>
     <summary>显示原文</summary>
- Powerful building blocks such as :ref:`buttons, charts, lists, sliders, images <widgets>`, etc.
- Advanced graphics with animations, anti-aliasing, opacity, smooth scrolling
- Various input devices such as touchpad, mouse, keyboard, encoder, etc.
- Multi-language support with UTF-8 encoding
- Multi-display support, even with mixed color formats
- Fully customizable graphic elements with CSS-like styles
- Hardware independent:  use with any microcontroller or display
- Scalable: able to operate with little memory (64 kB Flash, 16 kB RAM)
- :ref:`OS <threading>`, external memory and :ref:`GPU <draw>` are supported but not required
- Single frame buffer operation even with advanced graphic effects
- Written in C for maximal compatibility (C++ compatible)
- :ref:`Simulator <simulator>` to start embedded GUI design on a PC without embedded hardware
- User code developed under simulator can be shared with firmware to make UI development more efficient.
- Binding to :ref:`MicroPython`
- Tutorials, examples, themes for rapid GUI design
- Documentation is available online
- Free and open-source under MIT license
.. raw:: html

   </details> 
   <br>
- 强大的构建模块，例如 :ref:`按钮、图表、列表、滑块、图像 <widgets>` 等。
- 具有动画、抗锯齿、不透明度、平滑滚动的高级图形
- 各种输入设备，如触摸板、鼠标、键盘、编码器等
- 支持多语言，采用 UTF-8 编码
- 支持多显示器，甚至支持混合颜色格式
- 完全可定制的图形元素，具有类似 CSS 的样式
- 硬件无关：可与任何微控制器或显示器一起使用
- 可扩展：能够在内存较少的情况下运行（64 kB Flash，16 kB RAM）
- 支持但不要求 :ref:`操作系统 <threading>`、外部内存和 :ref:`GPU <draw>`
- 即使使用高级图形效果也能进行单帧缓冲操作
- 用 C 语言编写，以实现最大兼容性（兼容 C++）
- :ref:`模拟器 <simulator>` 可在没有嵌入式硬件的 PC 上开始嵌入式 GUI 设计
- 在模拟器下开发的用户代码可以与固件共享，使 UI 开发更高效
- 绑定到 :ref:`MicroPython`
- 教程、示例、主题，用于快速 GUI 设计
- 文档可在线获取
- 在 MIT 许可证下免费开源
.. _requirements:

Requirements（要求）
--------------------
.. raw:: html

   <details>
     <summary>显示原文</summary>
Basically, every modern controller which is able to drive a display is suitable to run LVGL. The minimal requirements are:

* 16, 32 or 64 bit microcontroller or processor
* > 16 MHz clock speed is recommended
* Flash/ROM: > 64 kB for the very essential components (> 180 kB is recommended)
* RAM:
    * Static RAM usage: ~2 kB depending on the used features and Widget types
    * stack: > 2kB (> 8 kB recommended)
    * Dynamic data (heap): > 2 KB (> 48 kB is recommended if using many GUI Widgets).
        Set by :c:macro:`LV_MEM_SIZE` in ``lv_conf.h``.
    * Display buffer:  > *"Horizontal resolution"* pixels (> 10 X *"Horizontal resolution"* is recommended)
    * One frame buffer in the MCU or in an external display controller
* C99 or newer compiler
* Basic C (or C++) knowledge:
    * `pointers <https://www.tutorialspoint.com/cprogramming/c_pointers.htm>`__.
    * `structs <https://www.tutorialspoint.com/cprogramming/c_structures.htm>`__.
    * `callbacks <https://www.geeksforgeeks.org/callbacks-in-c/>`__.

.. note::
    *Memory usage may vary depending on architecture, compiler and build options.*
.. raw:: html

   </details> 
   <br>
基本上，任何能够驱动显示器的现代控制器都适合运行 LVGL。最低要求是：

* 16、32 或 64 位微控制器或处理器
* 推荐 > 16 MHz 时钟速度
* Flash/ROM：> 64 kB 用于非常基本的组件（推荐 > 180 kB）
* RAM：
    * 静态 RAM 使用量：~2 kB，具体取决于使用的功能和小部件类型
    * 栈：> 2 kB（推荐 > 8 kB）
    * 动态数据（堆）：> 2 kB（如果使用许多 GUI 小部件，推荐 > 48 kB）。
        通过 ``lv_conf.h`` 中的 :c:macro:`LV_MEM_SIZE` 设置。
    * 显示缓冲区：> *“水平分辨率”* 像素（推荐 > 10 倍 *“水平分辨率”*）
    * MCU 或外部显示控制器中的一个帧缓冲区
* C99 或更新的编译器
* 基本的 C（或 C++）知识：
    * `指针 <https://www.tutorialspoint.com/cprogramming/c_pointers.htm>`__。
    * `结构体 <https://www.tutorialspoint.com/cprogramming/c_structures.htm>`__。
    * `回调 <https://www.geeksforgeeks.org/callbacks-in-c/>`__。

.. note::
    *内存使用量可能因架构、编译器和构建选项而异。*
License（许可证）
----------------
.. raw:: html

   <details>
     <summary>显示原文</summary>
The LVGL project (including all repositories) is licensed under the `MIT license <https://github.com/lvgl/lvgl/blob/master/LICENCE.txt>`__.
This means you can use it even in commercial projects.

It is not mandatory, but we highly appreciate it if you write a few words about your project in the `My projects <https://forum.lvgl.io/c/my-projects/10>`__ category of the forum or a private message to `lvgl.io <https://lvgl.io/#contact>`__.

Although you can get LVGL for free there is a massive amount of work behind it. It's created by a group of volunteers who made it available for you in their free time.

To make the LVGL project sustainable, please consider :ref:`contributing` to the project.
You can choose from many different ways of contributing See :ref:`contributing` such as simply writing a tweet about you using LVGL, fixing bugs, translating the documentation, or even becoming a maintainer.
.. raw:: html

   </details> 
   <br>
LVGL 项目（包括所有代码库）是根据 `MIT 许可证 <https://github.com/lvgl/lvgl/blob/master/LICENCE.txt>`__ 授权的。
这意味着您甚至可以在商业项目中使用它。

这不是强制性的，但如果您能在论坛的 `我的项目 <https://forum.lvgl.io/c/my-projects/10>`__ 类别中写几句话介绍您的项目，或者发送私人消息给 `lvgl.io <https://lvgl.io/#contact>`__，我们将不胜感激。

虽然您可以免费获得 LVGL，但其背后有大量的工作。这是由一群志愿者在他们的空闲时间为您提供的。

为了使 LVGL 项目可持续发展，请考虑 :ref:`贡献` 给该项目。
您可以选择多种不同的方式进行贡献，参见 :ref:`贡献`，例如简单地发一条关于您使用 LVGL 的推文、修复错误、翻译文档，甚至成为维护者。
Repository layout（代码库布局）
---------------------------------
.. raw:: html

   <details>
     <summary>显示原文</summary>
All repositories of the LVGL project are hosted on `GitHub <https://github.com/lvgl>`_.

You will find these repositories there:

* `lvgl <https://github.com/lvgl/lvgl>`__: The library itself with many `examples <https://github.com/lvgl/lvgl/blob/master/examples/>`_ and `demos <https://github.com/lvgl/lvgl/blob/master/demos/>`__.
* `lv_drivers <https://github.com/lvgl/lv_drivers>`__: Display and input device drivers
* `blog <https://github.com/lvgl/blog>`__: Source of the `blog's site <https://blog.lvgl.io>`__
* `sim <https://github.com/lvgl/sim>`__: Source of the `online simulator's site <https://sim.lvgl.io>`__
* `lv_port_* <https://github.com/lvgl?q=lv_port&type=&language=>`__: LVGL ports to development boards or environments
* `lv_binding_* <https://github.com/lvgl?q=lv_binding&type=&language=l>`__: Bindings to other languages
.. raw:: html

   </details> 
   <br>
LVGL 项目的所有代码库都托管在 `GitHub <https://github.com/lvgl>`_ 上。

您可以在那里找到这些代码库：

* `lvgl <https://github.com/lvgl/lvgl>`__: 库本身，包含许多 `示例 <https://github.com/lvgl/lvgl/blob/master/examples/>`_ 和 `演示 <https://github.com/lvgl/lvgl/blob/master/demos/>`__。
* `lv_drivers <https://github.com/lvgl/lv_drivers>`__: 显示和输入设备驱动程序
* `blog <https://github.com/lvgl/blog>`__: `博客网站 <https://blog.lvgl.io>`__ 的源码
* `sim <https://github.com/lvgl/sim>`__: `在线模拟器网站 <https://sim.lvgl.io>`__ 的源码
* `lv_port_* <https://github.com/lvgl?q=lv_port&type=&language=>`__: LVGL 移植到开发板或环境
* `lv_binding_* <https://github.com/lvgl?q=lv_binding&type=&language=l>`__: 绑定到其他语言
Release policy（发布政策）
----------------------------
.. raw:: html

   <details>
     <summary>显示原文</summary>
The core repositories follow the rules of `Semantic Versioning <https://semver.org/>`__:

* Major version: incompatible API changes. E.g. v5.0.0, v6.0.0
* Minor version: new but backward-compatible functionalities. E.g. v6.1.0, v6.2.0
* Patch version: backward-compatible bug fixes. E.g. v6.1.1, v6.1.2

Tags like `vX.Y.Z` are created for every release.
.. raw:: html

   </details> 
   <br>
核心代码库遵循 `语义化版本控制 <https://semver.org/>`__ 的规则：

* 主版本：不兼容的 API 更改。例如 v5.0.0，v6.0.0
* 次版本：新的但向后兼容的功能。例如 v6.1.0，v6.2.0
* 补丁版本：向后兼容的错误修复。例如 v6.1.1，v6.1.2

每次发布都会创建类似 `vX.Y.Z` 的标签。
Release cycle（发布周期）
^^^^^^^^^^^^^^^^^^^^^^^^
.. raw:: html

   <details>
     <summary>显示原文</summary>
* Bug fixes: released on demand even weekly
* Minor releases: every 3-4 months
* Major releases: approximately yearly

.. raw:: html

   </details> 
   <br>
* 错误修复：根据需求发布，甚至每周发布
* 次版本发布：每 3-4 个月
* 主版本发布：大约每年一次
Branches（分支）
^^^^^^^^^^^^^^
.. raw:: html

   <details>
     <summary>显示原文</summary>
The core repositories have at least the following branches:

* `master`: latest version, patches are merged directly here
* `release/vX.Y`: stable versions of the minor releases
* `fix/some-description`: temporary branches for bug fixes
* `feat/some-description`: temporary branches for features
.. raw:: html

   </details> 
   <br>
核心代码库至少有以下分支：

* `master`：最新版本，补丁直接合并到这里
* `release/vX.Y`：次版本发布的稳定版本
* `fix/some-description`：用于错误修复的临时分支
* `feat/some-description`：用于新功能的临时分支
Change log（变更日志）
^^^^^^^^^^^^^^^^^^^^
.. raw:: html

   <details>
     <summary>显示原文</summary>
The changes are recorded in :ref:`changelog`.

.. raw:: html

   </details> 
   <br>
变更记录在 :ref:`changelog` 中。
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
|v8.4     | Mar 19, 2024 | Mar 20, 2025 | Yes    |
+---------+--------------+--------------+--------+
|v9.0     | Jan 22, 2024 | Jan 22, 2025 | Yes    |
+---------+--------------+--------------+--------+
|v9.1     | Mar 20, 2024 | Mar 20, 2025 | Yes    |
+---------+--------------+--------------+--------+
|v9.2     | Aug 26, 2024 | Aug 26, 2025 | Yes    |
+---------+--------------+--------------+--------+
.. raw:: html

   </details> 
   <br>
在 v8 之前，每个主要系列的最后一个次版本发布支持 1 年。
从 v8 开始，每个次版本发布支持 1 年。

+---------+--------------+--------------+--------+
| 版本    | 发布日期     | 支持结束     | 活跃   |
+=========+==============+==============+========+
|v5.3     | 2019年2月1日 | 2020年2月1日 | 否     |
+---------+--------------+--------------+--------+
|v6.1     | 2019年11月26日| 2020年11月26日| 否     |
+---------+--------------+--------------+--------+
|v7.11    | 2021年3月16日 | 2022年3月16日 | 否     |
+---------+--------------+--------------+--------+
|v8.0     | 2021年6月1日  | 2022年6月1日  | 否     |
+---------+--------------+--------------+--------+
|v8.1     | 2021年11月10日| 2022年11月10日| 否     |
+---------+--------------+--------------+--------+
|v8.2     | 2022年1月31日 | 2023年1月31日 | 否     |
+---------+--------------+--------------+--------+
|v8.3     | 2022年7月6日  | 2025年1月1日  | 是     |
+---------+--------------+--------------+--------+
|v8.4     | 2024年3月19日 | 2025年3月20日 | 是     |
+---------+--------------+--------------+--------+
|v9.0     | 2024年1月22日 | 2025年1月22日 | 是     |
+---------+--------------+--------------+--------+
|v9.1     | 2024年3月20日 | 2025年3月20日 | 是     |
+---------+--------------+--------------+--------+
|v9.2     | 2024年8月26日 | 2025年8月26日 | 是     |
+---------+--------------+--------------+--------+
FAQ（常见问题）
----------------

Where can I ask questions?（我在哪里提问？）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. raw:: html

   <details>
     <summary>显示原文</summary>
You can ask questions in the forum:  https://forum.lvgl.io/.

We use `GitHub issues <https://github.com/lvgl/lvgl/issues>`_ for development related discussion.
You should use them only if your question or issue is tightly related to the development of the library.

Before posting a question, please read this FAQ section since you might find the answer to your issue here as well.
.. raw:: html

   </details> 
   <br>
您可以在论坛提问：https://forum.lvgl.io/。

我们使用 `GitHub issues <https://github.com/lvgl/lvgl/issues>`_ 进行与开发相关的讨论。
只有当您的问题或问题与库的开发紧密相关时，才应使用它们。

在发布问题之前，请阅读此常见问题解答部分，因为您可能会在这里找到问题的答案。
Is my MCU/hardware supported?（我的 MCU/硬件受支持吗？）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
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
每个能够通过并行端口、SPI、RGB 接口或其他方式驱动显示器并满足 :ref:`要求` 的 MCU 都受 LVGL 支持。

这包括：

* “常见” MCU，如 STM32F、STM32H、NXP Kinetis、LPC、iMX、dsPIC33、PIC32、SWM341 等。
* 蓝牙、GSM、Wi-Fi 模块，如 Nordic NRF、Espressif ESP32 和 Raspberry Pi Pico W
* 带有帧缓冲设备（如 /dev/fb0）的 Linux。这包括像 Raspberry Pi 这样的单板计算机
* 任何其他具有足够强大 MCU 和驱动显示器的外设的设备
Is my display supported?（我的显示器受支持吗？）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
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

See the :ref:`display` section to learn more.
.. raw:: html

   </details> 
   <br>
LVGL 只需要一个简单的驱动函数将像素数组复制到显示器的给定区域。
如果您的显示器可以做到这一点，那么您就可以在 LVGL 中使用它。

一些受支持的显示器类型示例：

* 具有 16 位或 24 位色深的 TFT
* 带有 HDMI 端口的显示器
* 小型单色显示器
* 灰度显示器
* 甚至 LED 矩阵
* 或任何其他您可以控制像素颜色/状态的显示器

请参阅 :ref:`display` 部分以了解更多信息。
LVGL doesn't start, randomly crashes or nothing is drawn on the display. What can be the problem?（LVGL 不启动、随机崩溃或显示器上没有任何内容。可能的问题是什么？）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. raw:: html

   <details>
     <summary>显示原文</summary>
* Try increasing :c:macro:`LV_MEM_SIZE`.
* Be sure your display works without LVGL. E.g. paint it to red on start up.
* Enable :ref:`logging`.
* Enable assertions in ``lv_conf.h`` (``LV_USE_ASSERT_...``).
* If you use an RTOS:
   * Increase the stack size of the task that calls :cpp:func:`lv_timer_handler`.
   * Be sure you are using one of the methods for thread management as described in :ref:`threading`.
.. raw:: html

   </details> 
   <br>
* 尝试增加 :c:macro:`LV_MEM_SIZE`。
* 确保您的显示器在没有 LVGL 的情况下工作。例如，在启动时将其涂成红色。
* 启用 :ref:`日志记录`。
* 在 ``lv_conf.h`` 中启用断言（``LV_USE_ASSERT_...``）。
* 如果您使用 RTOS：
   * 增加调用 :cpp:func:`lv_timer_handler` 的任务的堆栈大小。
   * 确保您使用的是 :ref:`线程管理 <threading>` 中描述的方法之一。
My display driver is not called. What have I missed?（我的显示驱动程序没有被调用。我错过了什么？）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. raw:: html

   <details>
     <summary>显示原文</summary>
Be sure you are calling :cpp:expr:`lv_tick_inc(x)` as prescribed in
:ref:`tick_interface` and are calling :cpp:func:`lv_timer_handler` as prescribed in
:ref:`timer_handler`.

Learn more in the :ref:`tick_interface` and :ref:`timer_handler` sections.
.. raw:: html

   </details> 
   <br>
确保您按照 :ref:`tick_interface` 中的规定调用 :cpp:expr:`lv_tick_inc(x)`，并按照 :ref:`timer_handler` 中的规定调用 :cpp:func:`lv_timer_handler`。

在 :ref:`tick_interface` 和 :ref:`timer_handler` 部分了解更多信息。
Why is the display driver called only once? Only the upper part of the display is refreshed.（为什么显示驱动程序只被调用一次？只有显示器的上部分被刷新。）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. raw:: html

   <details>
     <summary>显示原文</summary>
Be sure you are calling :cpp:expr:`lv_display_flush_ready(drv)` at the end of your
"*display flush callback*" as per :ref:`flush_callback` section.
.. raw:: html

   </details> 
   <br>
确保您在 "*显示刷新回调*" 的末尾调用 :cpp:expr:`lv_display_flush_ready(drv)`，如 :ref:`flush_callback` 部分所述。
Why do I see only garbage on the screen?（为什么我只看到屏幕上的垃圾？）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. raw:: html

   <details>
     <summary>显示原文</summary>
There is probably a bug in your display driver. Try the following code without using LVGL. You should see a square with red-blue gradient.

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
.. raw:: html

   </details> 
   <br>
您的显示驱动程序可能有错误。尝试以下代码而不使用 LVGL。您应该会看到一个红蓝渐变的方块。

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
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. raw:: html

   <details>
     <summary>显示原文</summary>
The configured LVGL color format is probably not compatible with your display's color format. Check :c:macro:`LV_COLOR_DEPTH` in *lv_conf.h*.
.. raw:: html

   </details> 
   <br>
配置的 LVGL 颜色格式可能与您的显示器颜色格式不兼容。请检查 *lv_conf.h* 中的 :c:macro:`LV_COLOR_DEPTH`。
How do I speed up my UI?（如何加速我的 UI？）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. raw:: html

   <details>
     <summary>显示原文</summary>
- Turn on compiler optimization and enable instruction- and data-caching if your MCU has them.
- Increase the size of the display buffer.
- Use two display buffers and flush the buffer with DMA (or similar peripheral) in the background.
- Increase the clock speed of the SPI or parallel port if you use them to drive the display.
- If your display has an SPI port consider changing to a model with a parallel interface because it has much higher throughput.
- Keep the display buffer in internal RAM (not in external SRAM) because LVGL uses it a lot and it should have fast access time.
.. raw:: html

   </details> 
   <br>
- 打开编译器优化，并启用指令和数据缓存（如果您的 MCU 具有这些功能）。
- 增加显示缓冲区的大小。
- 使用两个显示缓冲区，并在后台使用 DMA（或类似外设）刷新缓冲区。
- 如果您使用 SPI 或并行端口驱动显示器，请提高其时钟速度。
- 如果您的显示器有 SPI 端口，考虑更换为具有并行接口的型号，因为它具有更高的吞吐量。
- 将显示缓冲区保存在内部 RAM 中（而不是外部 SRAM），因为 LVGL 经常使用它，并且它应该具有快速的访问时间。
How do I reduce flash/ROM usage?（如何减少 Flash/ROM 使用量？）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. raw:: html

   <details>
     <summary>显示原文</summary>
You can disable unused features (such as animations, file system, GPU etc.) and widget types in *lv_conf.h*.

If you are using GCC/CLANG you can add `-fdata-sections -ffunction-sections` compiler flags and `--gc-sections` linker flag to remove unused functions and variables from the final binary. If possible, add the `-flto` compiler flag to enable link-time-optimisation together with `-Os` for GCC or `-Oz` for CLANG.
.. raw:: html

   </details> 
   <br>
您可以在 *lv_conf.h* 中禁用未使用的功能（例如动画、文件系统、GPU 等）和小部件类型。

如果您使用的是 GCC/CLANG，可以添加 `-fdata-sections -ffunction-sections` 编译器标志和 `--gc-sections` 链接器标志，以从最终二进制文件中删除未使用的函数和变量。如果可能，添加 `-flto` 编译器标志以启用链接时优化，并结合 `-Os`（用于 GCC）或 `-Oz`（用于 CLANG）。
How do I reduce RAM usage?（如何减少 RAM 使用量？）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. raw:: html

   <details>
     <summary>显示原文</summary>
* Lower the size of the *Display buffer*.
* Reduce :c:macro:`LV_MEM_SIZE` in *lv_conf.h*. This memory is used when you create Widgets like buttons, labels, etc.
* To work with lower :c:macro:`LV_MEM_SIZE` you can create Widgets only when required and delete them when they are not needed anymore.
.. raw:: html

   </details> 
   <br>
* 降低 *显示缓冲区* 的大小。
* 减少 *lv_conf.h* 中的 :c:macro:`LV_MEM_SIZE`。这部分内存在创建按钮、标签等小部件时使用。
* 为了使用较低的 :c:macro:`LV_MEM_SIZE`，您可以在需要时创建小部件，并在不再需要时删除它们。
How do I use LVGL with an operating system?（如何在操作系统中使用 LVGL？）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. raw:: html

   <details>
     <summary>显示原文</summary>
To work with an operating system where tasks can interrupt each other (preemptively),
you must ensure that no LVGL function call be called while another LVGL call is in
progress.  There are several ways to do this.  See the :ref:`threading` section to
learn more.

.. raw:: html

   </details> 
   <br>
在任务可以相互中断（抢占式）的操作系统中工作时，必须确保在一个 LVGL 函数调用进行时不会调用另一个 LVGL 函数。有几种方法可以做到这一点。请参阅 :ref:`threading` 部分以了解更多信息。