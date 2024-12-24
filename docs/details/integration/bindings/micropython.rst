.. _micropython:

===========
MicroPython
===========

.. raw:: html

   <details>
     <summary>显示原文</summary>

What is MicroPython?
--------------------

`MicroPython <http://micropython.org/>`__ is Python for microcontrollers. Using MicroPython, you can write Python3
code and run it even on a bare metal architecture with limited resources.

.. raw:: html

   </details>
   <br>


什么是MicroPython？
--------------------

`MicroPython <http://micropython.org/>`__ 是适用于微控制器的Python语言。
使用MicroPython，您可以编写Python3代码并在资源有限的裸机架构上运行它。


Highlights of MicroPython（MicroPython的亮点）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

- **Compact**: Fits and runs within just 256k of code space and 16k of RAM. No OS is needed, although you
  can also run it with an OS, if you want.
- **Compatible**: Strives to be as compatible as possible with normal Python (known as CPython).
- **Versatile**: Supports many architectures (x86, x86-64, ARM, ARM Thumb, Xtensa).
- **Interactive**: No need for the compile-flash-boot cycle. With the REPL (interactive prompt) you can type
  commands and execute them immediately, run scripts, etc.
- **Popular**: Many platforms are supported. The user base is growing bigger. Notable forks:

  - `MicroPython <https://github.com/micropython/micropython>`__
  - `CircuitPython <https://github.com/adafruit/circuitpython>`__
  - `MicroPython_ESP32_psRAM_LoBo <https://github.com/loboris/MicroPython_ESP32_psRAM_LoBo>`__

- **Embedded Oriented**: Comes with modules specifically for embedded systems, such as the
  `machine module <https://docs.micropython.org/en/latest/library/machine.html#classes>`__
  for accessing low-level hardware (I/O pins, ADC, UART, SPI, I2C, RTC, Timers etc.)

--------------

.. raw:: html

   </details>
   <br>


- **紧凑**: 仅需要256k的代码空间和16k的RAM即可安装并运行。不需要操作系统，不过如果你愿意，也可以在有操作系统的情况下运行它。
- **兼容**: 力求尽可能与普通Python（称为CPython）兼容。
- **多功能**: 支持多种架构（x86、x86-64、ARM、ARM Thumb、Xtensa）。
- **互动**: 无需编译-烧录-启动的循环。通过REPL（交互式提示符），你可以输入命令并立即执行，运行脚本等。
- **受欢迎**: 支持许多平台。用户群体越来越庞大。值得一提的分支包括：

  - `MicroPython <https://github.com/micropython/micropython>`__
  - `CircuitPython <https://github.com/adafruit/circuitpython>`__
  - `MicroPython_ESP32_psRAM_LoBo <https://github.com/loboris/MicroPython_ESP32_psRAM_LoBo>`__

- **嵌入式定向**: 自带专为嵌入式系统设计的模块，比如用于访问底层硬件的 `machine module <https://docs.micropython.org/en/latest/library/machine.html#classes>`__ （I/O引脚、ADC、UART、SPI、I2C、RTC、定时器等）。


Why MicroPython + LVGL?（为什么选择MicroPython + LVGL？）
---------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

MicroPython `does not have a good native high-level GUI library <https://forum.micropython.org/viewtopic.php?f=18&t=5543>`__.
LVGL is an `Object-Oriented Component Based <https://blog.lvgl.io/2018-12-13/extend-lvgl-objects>`__
high-level GUI library, which seems to be a natural candidate to map into a higher level language, such as Python.
LVGL is implemented in C and its APIs are in C.

.. raw:: html

   </details>
   <br>


MicroPython `没有一个良好的原生高级GUI库 <https://forum.micropython.org/viewtopic.php?f=18&t=5543>`__。 LVGL是一个 `基于面向对象组件的 <https://blog.lvgl.io/2018-12-13/extend-lvgl-objects>`__ 高级GUI库，似乎是将其映射到高级语言（如Python）的自然选择。
LVGL是用C实现的，其API也是用C编写的。


Here are some advantages of using LVGL in MicroPython:（以下是在MicroPython中使用LVGL的一些优点：）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

- Develop GUI in Python, a very popular high level language. Use paradigms such as Object-Oriented Programming.
- Usually, GUI development requires multiple iterations to get things right. With C, each iteration consists of
  **``Change code`` > ``Build`` > ``Flash`` > ``Run``**. In MicroPython it's just
  **``Change code`` > ``Run``** ! You can even run commands interactively using the
  `REPL <https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop>`__ (the interactive prompt)

.. raw:: html

   </details>
   <br>


- 用Python开发图形用户界面(GUI)，这是一种非常流行的高级语言。可以使用面向对象编程等范式。
- 通常，GUI开发需要多次迭代才能达到理想效果。使用C语言，每次迭代包括 **``更改代码`` > ``构建`` > ``烧录`` > ``运行``**。
在MicroPython中，只需要 **``更改代码`` > ``运行``**！甚至可以使用REPL（交互式提示符）来交互地运行命令。


MicroPython + LVGL could be used for:（MicroPython + LVGL可以用于：）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

- Fast prototyping GUI.
- Shortening the cycle of changing and fine-tuning the GUI.
- Modelling the GUI in a more abstract way by defining reusable composite Widgets, taking advantage of Python's language features
  such as Inheritance, Closures, List Comprehension, Generators, Exception Handling, Arbitrary Precision Integers and others.
- Make LVGL accessible to a larger audience. No need to know C to create a nice GUI on an embedded system. This goes well with
  `CircuitPython vision <https://learn.adafruit.com/welcome-to-circuitpython/what-is-circuitpython>`__.
  CircuitPython was designed with education in mind, to make it easier for new or inexperienced users to get started with
  embedded development.
- Creating tools to work with LVGL at a higher level (e.g. drag-and-drop designer).

--------------

.. raw:: html

   </details>
   <br>


- 快速进行GUI的原型设计。
- 缩短GUI更改和微调的周期。
- 通过定义可复用的组合对象，以更抽象的方式对GUI进行建模，充分利用Python的语言特性，如继承，闭包，列表推导，生成器，异常处理，任意精度整数等。
- 让更多人能够使用LVGL。不需要了解C语言即可在嵌入式系统上创建漂亮的GUI。这与 `CircuitPython vision <https://learn.adafruit.com/welcome-to-circuitpython/what-is-circuitpython>`__ 非常契合。
  CircuitPython的设计考虑了教育用途，旨在让新用户或无经验用户更容易入门嵌入式开发。
- 创建在更高层次上与LVGL配合使用的工具（例如拖放式设计器）。

--------------


So what does it look like?（所以它看起来是什么样子？）
---------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

It's very much like the C API, but Object-Oriented for LVGL components.

Let's dive right into an example!

.. raw:: html

   </details>
   <br>


这很像C API，但为LVGL组件进行了面向对象的设计。

让我们直接进入一个例子！


A simple example（一个简单的例子）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: python

    # Initialize
    import display_driver
    import lvgl as lv

    # Create a button with a label
    scr = lv.obj()
    btn = lv.button(scr)
    btn.align(lv.ALIGN.CENTER, 0, 0)
    label = lv.label(btn)
    label.set_text('Hello World!')
    lv.screen_load(scr)

How can I use it?（如何使用它？）
--------------------------------

Online Simulator（在线模拟器）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

If you want to experiment with LVGL + MicroPython without downloading anything, you can use our online
simulator! It's a fully functional LVGL + MicroPython that runs entirely in the browser and allows you to
edit a python script and run it.

`Click here to experiment on the online simulator <https://sim.lvgl.io/>`__

Many :ref:`LVGL examples <examples>` are available also for MicroPython. Just click the link!

.. raw:: html

   </details>
   <br>


如果你想在不下载任何东西的情况下尝试LVGL + MicroPython，可以使用我们的在线模拟器！它是一个功能齐全的LVGL + MicroPython环境，完全在浏览器中运行，允许你编辑Python脚本并运行它。

`点击这里在在线模拟器上实验 <https://sim.lvgl.io/>`__

许多 :ref:`LVGL示例 <examples>` 也适用于MicroPython。只需点击链接！


PC Simulator（PC 模拟器）
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

MicroPython is ported to many platforms. One notable port is "unix", which allows you to build and run Micropython
(+LVGL) on a Linux machine. (On a Windows machine you might need Virtual Box or WSL or MinGW or Cygwin etc.)

`Click here to know more information about building and running the unix port <https://github.com/lvgl/lv_micropython>`__

.. raw:: html

   </details>
   <br>


MicroPython 已经被移植到许多平台。一个值得注意的移植版本是“unix”，它允许你在 Linux 机器上构建和运行 MicroPython（+LVGL）。 （在 Windows 机器上，你可能需要使用 Virtual Box、WSL、MinGW 或 Cygwin 等工具。）

点击此处了解有关构建和运行 unix 移植版本的更多信息：<https://github.com/lvgl/lv_micropython>


Embedded Platforms（嵌入式平台）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

In the end, the goal is to run it all on an embedded platform. Both MicroPython and LVGL can be used on many embedded
architectures. `lv_micropython <https://github.com/lvgl/lv_micropython>`__ is a fork of MicroPython+LVGL and currently
supports Linux, ESP32, STM32 and RP2. It can be ported to any other platform supported by MicroPython.

- You would also need display and input drivers. You can either use one of the existing drivers provided with lv_micropython,
  or you can create your own input/display drivers for your specific hardware.
- Drivers can be implemented either in C as a MicroPython module, or in pure Python!

lv_micropython already contains these drivers:

- Display drivers:

  - SDL on Linux
  - X11 on Linux
  - ESP32 specific:

    - ILI9341
    - ILI9488
    - GC9A01
    - ST7789
    - ST7735

  - Generic (pure Python):

    - ILI9341
    - ST7789
    - ST7735

- Input drivers:

  - SDL
  - X11
  - XPT2046
  - FT6X36
  - ESP32 ADC with resistive touch

.. raw:: html

   </details>
   <br>


最终目标是在嵌入式平台上运行所有内容。 MicroPython和LVGL都可以用于许多嵌入式架构。 `lv_micropython <https://github.com/lvgl/lv_micropython>`__ 是Micropython+LVGL的一个分支，目前支持Linux、ESP32、STM32和RP2。它可以移植到Micropython支持的任何其他平台。

- 您还需要显示和输入驱动程序。您可以使用lv_micropython提供的现有驱动程序之一，也可以为您的特定硬件创建自己的输入/显示驱动程序。
- 驱动程序可以在C中作为MicroPython模块实现，也可以使用纯Python实现！

lv_micropython已经包含了以下这些驱动程序：

- 显示驱动程序：

  - Linux上的SDL
  - Linux上的X11
  - ESP32特定：

    - ILI9341
    - ILI9488
    - GC9A01
    - ST7789
    - ST7735

  - 通用（纯Python）：

    - ILI9341
    - ST7789
    - ST7735

- 输入驱动程序：

  - SDL
  - X11
  - XPT2046
  - FT6X36
  - ESP32 ADC带有电阻式触摸


Where can I find more information?
----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

- ``lv_micropython`` `README <https://github.com/lvgl/lv_micropython>`__
- ``lv_binding_micropython`` `README <https://github.com/lvgl/lv_binding_micropython>`__
- The `LVGL micropython forum <https://forum.lvgl.io/c/micropython>`__ (Feel free to ask anything!)
- At MicroPython: `docs <http://docs.micropython.org/en/latest/>`__ and `forum <https://forum.micropython.org/>`__
- `Blog Post <https://blog.lvgl.io/2019-02-20/micropython-bindings>`__, a little outdated.

.. raw:: html

   </details>
   <br>


- ``lv_micropython`` `README <https://github.com/lvgl/lv_micropython>`__
- ``lv_binding_micropython`` `README <https://github.com/lvgl/lv_binding_micropython>`__
- 在 `LVGL micropython 论坛 <https://forum.lvgl.io/c/micropython>`__ 上（随意提问！）
- 在 MicroPython 上：`文档 <http://docs.micropython.org/en/latest/>`__ 和 `论坛 <https://forum.micropython.org/>`__
- `博客文章 <https://blog.lvgl.io/2019-02-20/micropython-bindings>`__，有点过时。


The MicroPython Binding is auto generated!（MicroPython绑定是自动生成的！）
------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

- LVGL is a git submodule inside `lv_micropython <https://github.com/lvgl/lv_micropython>`__
  (LVGL is a git submodule of `lv_binding_micropython <https://github.com/lvgl/lv_binding_micropython>`__
  which is itself a submodule of `lv_micropython <https://github.com/lvgl/lv_micropython>`__).
- When building lv_micropython, the public LVGL C API is scanned and MicroPython API is auto-generated. That means that
  lv_micropython provides LVGL API for **any** LVGL version, and generally does not require code changes as LVGL evolves.

.. raw:: html

   </details>
   <br>


LVGL是 `lv_micropython <https://github.com/lvgl/lv_micropython>`__内的一个git子模块
（LVGL是 `lv_binding_micropython <https://github.com/lvgl/lv_binding_micropython>`__的一个git子模块，
它本身是 `lv_micropython <https://github.com/lvgl/lv_micropython>`__的一个子模块）。
在构建lv_micropython时，会扫描公共LVGL C API并自动生成MicroPython API。这意味着lv_micropython为 **任何**LVGL版本提供LVGL API，并且通常不需要随着LVGL的演变而进行代码更改。


LVGL C API Coding Conventions（LVGL C API编码规范）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

For a summary of coding conventions to follow see the :ref:`coding-style`.

.. raw:: html

   </details>
   <br>


有关要遵循的编码约定的摘要，请参阅 :ref:`coding-style`。


.. _memory_management:

Memory Management（内存管理）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

| When LVGL runs in MicroPython, all dynamic memory allocations (:cpp:func:`lv_malloc`) are handled by MicroPython's memory
  manager which is `garbage-collected <https://en.wikipedia.org/wiki/Garbage_collection_(computer_science)>`__ (GC).
| To prevent GC from collecting memory prematurely, all dynamic allocated RAM must be reachable by GC.
| GC is aware of most allocations, except from pointers on the `Data Segment <https://en.wikipedia.org/wiki/Data_segment>`__:

    - Pointers which are global variables
    - Pointers which are static global variables
    - Pointers which are static local variables

Such pointers need to be defined in a special way to make them reachable by GC

.. raw:: html

   </details>
   <br>


当LVGL在MicroPython中运行时，所有动态内存分配（:cpp:func:`lv_malloc`）由MicroPython的内存管理器处理，该管理器进行垃圾回收（GC）。

为了防止GC过早回收内存，所有动态分配的RAM必须可被GC访问。

GC能意识到大部分分配，但不包括 `数据段 <https://en.wikipedia.org/wiki/Data_segment>`__上的指针：

- 作为全局变量的指针
- 作为静态全局变量的指针
- 作为静态局部变量的指针

这些指针需要以特殊方式定义，以便让它们能够被GC访问。


Identify The Problem（确定问题）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Problem happens when an allocated memory's pointer (return value of :cpp:func:`lv_malloc`) is stored only in either **global**,
**static global** or **static local** pointer variable and not as part of a previously allocated ``struct`` or other variable.

.. raw:: html

   </details>
   <br>


当一个分配的内存指针（即 :cpp:func:`lv_malloc` 的返回值）只被存储在 **全局**、 **静态全局** 或 **静态局部** 指针变量中，而不是作为先前分配的 ``struct`` 或其他变量的一部分时，就会出现问题。


Solve The Problem（解决问题）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

- Replace the global/static local var with :cpp:expr:`(LV_GLOBAL_DEFAULT()->_var)`
- Include ``lv_global.h`` on files that use ``LV_GLOBAL_DEFAULT``
- Add ``_var`` to ``lv_global_t`` on ``lv_global.h``

.. raw:: html

   </details>
   <br>


- 用 `(LV_GLOBAL_DEFAULT()->_var)` 替换全局/静态局部变量
- 在使用 `LV_GLOBAL_DEFAULT` 的文件中包含 `lv_global.h`
- 在 `lv_global.h` 中的 `lv_global_t` 中添加  `_var`


Example（例子）
^^^^^^^^^^^^^^^


More Information（更多信息）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

- `In the README <https://github.com/lvgl/lv_binding_micropython#memory-management>`__
- `In the Blog <https://blog.lvgl.io/2019-02-20/micropython-bindings#i-need-to-allocate-a-littlevgl-struct-such-as-style-color-etc-how-can-i-do-that-how-do-i-allocatedeallocate-memory-for-it>`__

.. raw:: html

   </details>
   <br>


- `在README中 <https://github.com/lvgl/lv_binding_micropython#memory-management> `__
- `在博客中 <https://blog.lvgl.io/2019-02-20/micropython-bindings#i-need-to-allocate-a-littlevgl-struct-such-as-style-color-etc-how-can-i-do-that-how-do-i-allocatedeallocate-memory-for-it>`__


.. _callbacks:

Callbacks（回调）
~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

In C a callback is just a function pointer. But in MicroPython we need to register a *MicroPython callable object* for each
callback. Therefore in the MicroPython binding we need to register both a function pointer and a MicroPython object for every callback.

Therefore we defined a **callback convention** for the LVGL C API that expects lvgl headers to be defined in a certain
way. Callbacks that are declared according to the convention would allow the binding to register a MicroPython object
next to the function pointer when registering a callback, and access that object when the callback is called.

- The basic idea is that we have ``void * user_data`` field that is used automatically by the MicroPython Binding
  to save the *MicroPython callable object* for a callback. This field must be provided when registering the function
  pointer, and provided to the callback function itself.
- Although called "user_data", the user is not expected to read/write that field. Instead, the MicroPython glue code uses
  ``user_data`` to automatically keep track of the MicroPython callable object. The glue code updates it when the callback
  is registered, and uses it when the callback is called in order to invoke a call to the original callable object.

There are a few options for defining a callback in LVGL C API:

- Option 1: ``user_data`` in a struct

  - There's a struct that contains a field called ``void * user_data``

    - A pointer to that struct is provided as the **first** argument of a callback registration function
    - A pointer to that struct is provided as the **first** argument of the callback itself

- Option 2: ``user_data`` as a function argument

  - A parameter called ``void * user_data`` is provided to the registration function as the **last** argument

    - The callback itself receives ``void *`` as the **last** argument

- Option 3: both callback and ``user_data`` are struct fields

  - The API exposes a struct with both function pointer member and ``user_data`` member

    - The function pointer member receives the same struct as its **first** argument

In practice it's also possible to mix these options, for example provide a struct pointer when registering a callback
(option 1) and provide ``user_data`` argument when calling the callback (options 2),
**as long as the same ``user_data`` that was registered is passed to the callback when it's called**.

.. raw:: html

   </details>
   <br>


在C语言中，回调只是一个函数指针。但在Micropython中，我们需要为每个回调注册一个 *Micropython可调用对象* 。因此，在Micropython绑定中，我们需要为每个回调同时注册一个函数指针和一个Micropython对象。

因此，我们为LVGL C API定义了一个 **回调规范**，该规范要求按照某种方式定义lvgl标头文件。根据该规范声明的回调函数将允许绑定在注册回调时在函数指针旁边注册一个Micropython对象，并在调用回调时访问该对象。

- 基本思想是我们有一个名为 ``void * user_data`` 的字段，Micropython绑定会自动使用它来保存回调的 *Micropython可调用对象*。在注册函数指针时必须提供此字段，并将其提供给回调函数本身。
- 尽管称为 ``user_data`` ，但用户不应该读/写该字段。相反，Micropython的粘合代码使用 ``user_data`` 自动跟踪Micropython可调用对象。在注册回调时，粘合代码会更新它，并在调用回调时使用它，以调用原始可调用对象。

在LVGL C API中定义回调的几个选项：

- 选项1：将 ``user_data`` 放入结构体中

  - 有一个包含名为 ``void * user_data`` 的字段的结构体

    - 将该结构体的指针作为回调注册函数的 **第一个** 参数提供
    - 将该结构体的指针作为回调本身的 **第一个** 参数提供

- 选项2：将 ``user_data`` 作为函数参数

  - 提供一个名为 ``void * user_data`` 的参数作为注册函数的 **最后** 一个参数

    - 回调本身将接收 ``void *`` 作为 **最后** 一个参数

- 选项3：回调和 ``user_data`` 都是结构体字段

  - API公开了一个具有函数指针成员和 ``user_data`` 成员的结构

    - 函数指针成员接收相同的结构作为其 **第一个** 参数

实际上，可以混合使用这些选项，例如在注册回调时提供一个结构体指针（选项1），并在调用回调时提供 ``user_data`` 参数（选项2），
**只要在调用回调时传递了注册时使用的相同 ``user_data`` 即可**。


Examples（例子）
^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

- :cpp:type:`lv_anim_t` contains ``user_data`` field. :cpp:func:`lv_anim_set_path_cb`
  registers `path_cb` callback. Both ``lv_anim_set_path_cb`` and :cpp:type:`lv_anim_path_cb_t`
  receive :cpp:type:`lv_anim_t` as their first argument
- ``path_cb`` field can also be assigned directly in the Python code because it's a member
  of :cpp:type:`lv_anim_t` which contains ``user_data`` field, and :cpp:type:`lv_anim_path_cb_t`
  receive :cpp:type:`lv_anim_t` as its first argument.
- :cpp:func:`lv_imgfont_create` registers ``path_cb`` and receives ``user_data`` as the last
  argument. The callback :cpp:type:`lv_imgfont_get_path_cb_t` also receives the ``user_data`` as the last argument.

.. raw:: html

   </details>
   <br>


- :cpp:type:`lv_anim_t` 包含了 ``user_data`` 字段。:cpp:func:`lv_anim_set_path_cb` 注册了 `path_cb` 回调函数。 ``lv_anim_set_path_cb`` 和 :cpp:type:`lv_anim_path_cb_t` 都将 :cpp:type:`lv_anim_t` 作为它们的第一个参数。  
- ``path_cb`` 字段也可以直接在Python代码中赋值，因为它是 :cpp:type:`lv_anim_t` 的成员，其中包含了 ``user_data`` 字段，而 :cpp:type:`lv_anim_path_cb_t` 也将 :cpp:type:`lv_anim_t` 作为其第一个参数。  
- :cpp:func:`lv_imgfont_create` 注册了 ``path_cb`` 并将 ``user_data`` 作为最后一个参数。回调函数 :cpp:type:`lv_imgfont_get_path_cb_t` 也将 ``user_data`` 作为最后一个参数。


.. _more-information-1:

More Information（更多消息）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

- In the `Blog <https://blog.lvgl.io/2019-08-05/micropython-pure-display-driver#using-callbacks>`__
  and in the `README <https://github.com/lvgl/lv_binding_micropython#callbacks>`__
- `[v6.0] Callback conventions  #1036 <https://github.com/lvgl/lvgl/issues/1036>`__
- Various discussions: `here <https://github.com/lvgl/lvgl/pull/3294#issuecomment-1184895335>`__
  and `here <https://github.com/lvgl/lvgl/issues/1763#issuecomment-762247629>`__
  and`here <https://github.com/lvgl/lvgl/issues/316#issuecomment-467221587>`__

.. raw:: html

   </details>
   <br>


- 在 `博客 <https://blog.lvgl.io/2019-08-05/micropython-pure-display-driver#using-callbacks>`__和 `README <https://github.com/lvgl/lv_binding_micropython#callbacks>`__
- `[v6.0] 回调规范  #1036 <https://github.com/lvgl/lvgl/issues/1036>`__
- 各种讨论： `这里 <https://github.com/lvgl/lvgl/pull/3294#issuecomment-1184895335>`__
  和 `这里 <https://github.com/lvgl/lvgl/issues/1763#issuecomment-762247629>`__和 `这里 <https://github.com/lvgl/lvgl/issues/316#issuecomment-467221587>`__


