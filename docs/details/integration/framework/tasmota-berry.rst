=====================================
Tasmota and berry（Tasmota 和 berry）
=====================================

What is Tasmota?（Tasmota是什么？）
----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

`Tasmota <https://github.com/arendst/Tasmota>`__ is a widely used
open-source firmware for ESP8266 and EPS32 based devices. It supports a
wide variety of devices, sensors and integrations to Home Automation and
Cloud services. Tasmota firmware is downloaded more than 200,000 times
each month, and has an active and growing community.

Tasmota provides access to hundreds of supported devices, full support
of MQTT, HTTP(S), integration with major Home Automation systems, myriad
of sensors, IR, RF, Zigbee, Bluetooth, AWS IoT, Azure IoT, Alexa and
many more.

.. raw:: html

   </details>
   <br>


`Tasmota <https://github.com/arendst/Tasmota>`__ 是一款广泛使用的开源固件，
适用于基于 ESP8266 和 EPS32 的设备。它支持各种设备、传感器和与智能家居和云服务的集成。
Tasmota 固件每月下载量超过 200,000 次，并拥有一个活跃且不断增长的用户社区。

Tasmota 可接入数百种受支持的设备，全面支持 MQTT、HTTP(S)，
可与主要的智能家居系统、众多传感器、IR、RF、Zigbee、蓝牙、AWS IoT、Azure IoT、Alexa 等进行集成。


What is Berry?（Berry是什么？）
---------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

`Berry <https://github.com/berry-lang/berry>`__ is a ultra-lightweight
dynamically typed embedded scripting language. It is designed for
lower-performance embedded devices. The interpreter of Berry include a
one-pass compiler and register-based VM, all the code is written in ANSI
C99. Berry offers a syntax very similar to Python, and is inspired from
LUA VM. It is fully integrated in Tasmota

.. raw:: html

   </details>
   <br>


`Berry <https://github.com/berry-lang/berry>`__ 是一种超轻量级的动态类型嵌入式脚本语言。
它专为性能较低的嵌入式设备设计。Berry 解释器包含一个一次通过编译器和基于寄存器的虚拟机，所有代码都使用 ANSI C99 编写。
Berry 提供的语法与 Python 非常相似，并受到 LUA VM 的启发。它已完全集成到 Tasmota 中。


Highlights of Berry（Berry 的亮点）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Berry has the following advantages:

- Lightweight: A well-optimized interpreter with very little resources. Ideal for use in microprocessors.
- Fast: optimized one-pass bytecode compiler and register-based virtual machine.
- Powerful: supports imperative programming, object-oriented programming, functional programming.
- Flexible: Berry is a dynamic type script, and it's intended for embedding in applications.
  It can provide good dynamic scalability for the host system.
- Simple: simple and natural syntax, support garbage collection, and easy to use FFI (foreign function interface).
- RAM saving: With compile-time object construction, most of the constant objects are stored
  in read-only code data segments, so the RAM usage of the interpreter is very low when it starts.

All features are detailed in the `Berry Reference Manual <https://github.com/berry-lang/berry/wiki/Reference>`__

.. raw:: html

   </details>
   <br>


Berry 具有以下优势：

- 轻量级：具有极少资源的优化良好的解释器，适用于微处理器。
- 快速：优化的一次通过字节码编译器和基于寄存器的虚拟机。
- 强大：支持命令式编程、面向对象编程、函数式编程。
- 灵活：Berry 是动态类型脚本，旨在嵌入到应用程序中。它可以为主机系统提供良好的动态可扩展性。
- 简单：语法简单自然，支持垃圾回收，并易于使用 FFI（外部函数接口）。
- 节省 RAM：通过编译时对象构建，大多数常量对象都存储在只读代码数据段中，因此解释器在启动时使用的 RAM 非常低。

有关所有功能的详细信息，请参阅 `Berry 参考手册 <https://github.com/berry-lang/berry/wiki/Reference>`__。


--------------

Why LVGL + Tasmota + Berry?（为什么选择 LVGL + Tasmota + Berry？）
-----------------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

In 2021, Tasmota added full support of LVGL for ESP32 based devices. It
also introduced the Berry scripting language, a small-footprint language
similar to Python and fully integrated in Tasmota.

A comprehensive mapping of LVGL in Berry language is now available,
similar to the mapping of MicroPython. It allows to use +98% of all LVGL
features. It is also possible to write custom widgets in Berry.

Versions supported: LVGL v8.0.2, LodePNG v20201017, Freetype 2.10.4

.. raw:: html

   </details>
   <br>


2021 年，Tasmota 为基于 ESP32 的设备增加了对 LVGL 的全面支持。
它还引入了与 Python 类似的轻量级脚本语言 Berry，该语言已完全集成到 Tasmota 中。

现在可以使用类似于 MicroPython 的映射在 Berry 语言中全面映射 LVGL，允许使用 LVGL 的 +98% 的功能。
还可以在 Berry 中编写自定义控件。

支持版本：LVGL v8.0.2，LodePNG v20201017，Freetype 2.10.4


Tasmota + Berry + LVGL could be used for:（Tasmota + Berry + LVGL 可用于：）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

- Fast prototyping GUI.
- Shortening the cycle of changing and fine-tuning the GUI.
- Modelling the GUI in a more abstract way by defining reusable composite Widgets, taking
  advantage of Berry's language features such as Inheritance, Closures, Exception Handling…
- Make LVGL accessible to a larger audience. No need to know C to create a nice GUI on an embedded system.

A higher level interface compatible with
`OpenHASP <https://github.com/HASwitchPlate/openHASP>`__
is also under development.

.. raw:: html

   </details>
   <br>


- 快速原型设计 GUI。
- 缩短更改和调整 GUI 的周期。
- 通过定义可重用的组合对象，以更抽象的方式建模 GUI，并利用 Berry 的语言特性，如继承、闭包、异常处理等。
- 使 LVGL 对更广泛的受众群体可用。无需了解 C 语言即可在嵌入式系统上创建美观的 GUI。

同时，也正在开发一个与 `OpenHASP <https://github.com/HASwitchPlate/openHASP>`__ 兼容的更高层次的接口。


--------------

So what does it look like?（那么它看起来像什么样子呢？）
----------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

TL;DR: Similar to MicroPython, it's very much like the C API, but Object-Oriented for LVGL components.

Let's dive right into an example!

.. raw:: html

   </details>
   <br>


TL;DR: 类似于 MicroPython，它与 C API 非常相似，但针对 LVGL 组件采用面向对象的方法。

让我们直接看一个示例吧！


A simple example（一个简单的例子）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: python

   lv.start()                 # start LVGL
   scr = lv.screen_active()         # get default screen
   btn = lv.btn(scr)          # create button
   btn.center()
   label = lv.label(btn)      # create a label in the button
   label.set_text("Button")   # set a label to the button

How can I use it?（我们怎么样使用它？）
--------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can start in less than 10 minutes on a M5Stack or equivalent device
in less than 10 minutes in this `short tutorial <https://tasmota.github.io/docs/LVGL_in_10_minutes/>`__

.. raw:: html

   </details>
   <br>


在这个 `简短教程 <https://tasmota.github.io/docs/LVGL_in_10_minutes/>`__ 中，
您可以在不到 10 分钟的时间内在 M5Stack 或等效设备上开始操作。


Where can I find more information?（我可以在哪里找到更多信息？）
------------------------------------------------------------

- `Tasmota Documentation <https://tasmota.github.io/docs/>`__
- `Berry Documentation <https://github.com/berry-lang/berry/wiki/Reference>`__
- `Tasmota LVGL Berry documentation <https://tasmota.github.io/docs/LVGL/>`__
