PikaScript（皮卡脚本）
======================

What is PikaScript ?（什么是皮卡脚本？）
--------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>


`PikaScript <https://github.com/pikasTech/pikascript>`__ is a Python
interpreter designed specifically for microcontrollers, and it supports
a subset of the common Python3 syntax.

It's lighter, requiring only 32k of code space and 4k of RAM, which
means it can run on stm32f103c8 (blue-pill) or even stm32g030c8, on the
other hand, you can leave valuable space for more material or larger
buffer areas.

It is simpler, out of the box, runs with no porting and configuration at
all, does not depend on OS or file system, has good support for popular
IDEs for Windows platforms like Keil, IAR, RT-Thread-Studio, and of
course, supports linux-gcc development platforms.

It's smarter, with a unique C module mechanism that allows you to
generate bindings automatically by simply writing the API for the C
module in Python, and you don't need to deal with the headache of
writing any macros or global tables manually. On the other hand, all C
modules have sophisticated smart hints, even hinting at the types of
your arguments .

--------------

.. raw:: html

   </details>
   <br>


`PikaScript <https://github.com/pikasTech/pikascript>`__

是一个专为微控制器设计的 Python 解释器，它支持常见 Python3 语法的子集。

它更轻量，只需要 32k 的代码空间和 4k 的 RAM，这意味着它可以运行在 stm32f103c8（蓝色Pill）甚至是 stm32g030c8 上，另一方面，这也为更多材料或更大的缓冲区留下了宝贵的空间。

它更简单，无需任何移植和配置，即可直接运行，不依赖于操作系统或文件系统，对 Windows 平台上的流行 IDE（集成开发环境）如 Keil、IAR、RT-Thread-Studio 有良好的支持，当然，它也支持 Linux-gcc 开发平台。

它更智能，具有独特的 C 模块机制，它允许你仅通过用 Python 编写 C 模块的 API 就能自动生成绑定，无需处理手动编写任何宏或全局表的麻烦。另一方面，所有的 C 模块都拥有复杂智能的提示，甚至能提示你的参数类型。


Why PikaScript + LVGL ?（为什么选择 PikaScript + LVGL？）
---------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

PikaScript now supports the main features of LVGL8, and these APIs are
fully compatible with MicroPython!

This means that you can continue to use already written code from
MicroPython, and then use less code space and RAM.

Enjoy detailed code hints down to the parameter type for a better
programming experience

Use a more convenient IDE, such as vs-based simulation projects

.. raw:: html

   </details>
   <br>


PikaScript现在支持LVGL8的主要功能，并且这些API与MicroPython完全兼容！

这意味着您可以继续使用已经编写好的MicroPython代码，同时使用更少的代码空间和RAM。

享受详细的代码提示，甚至可以提供参数类型，以获得更好的编程体验。

使用更方便的IDE，比如基于vs的仿真项目。


So how does it look like?（那看起来怎么样呢？）
---------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Here are some examples of lvgl that PikaScript can already run, they are
mainly from the lvgl documentation examples

.. raw:: html

   </details>
   <br>


这里是一些PikaScript已经可以运行的lvgl示例，它们主要来自lvgl文档示例。


LV_ARC（弧）
~~~~~~~~~~~~

.. code:: python

   import pika_lvgl as lv
   import PikaStdLib
   mem = PikaStdLib.MemChecker()
   # Create an Arc
   arc = lv.arc(lv.screen_active())
   arc.set_end_angle(200)
   arc.set_size(150, 150)
   arc.center()
   print('mem used max: %0.2f kB' % (mem.getMax()))
   print('mem used now: %0.2f kB' % (mem.getNow()))


LV_BAR
~~~~~~

.. code:: python

   import pika_lvgl as lv
   import PikaStdLib
   mem = PikaStdLib.MemChecker()
   bar1 = lv.bar(lv.screen_active())
   bar1.set_size(200, 20)
   bar1.center()
   bar1.set_value(70, lv.ANIM.OFF)
   print('mem used max: %0.2f kB' % (mem.getMax()))
   print('mem used now: %0.2f kB' % (mem.getNow()))


LV_BTN（按键）
~~~~~~~~~~~~~~

.. code:: python

   import pika_lvgl as lv
   import PikaStdLib
   mem = PikaStdLib.MemChecker()
   def event_cb_1(evt):
       print('in evt1')
       print('mem used now: %0.2f kB' % (mem.getNow()))
   def event_cb_2(evt):
       print('in evt2')
       print('mem used now: %0.2f kB' % (mem.getNow()))
   btn1 = lv.btn(lv.screen_active())
   btn1.align(lv.ALIGN.TOP_MID, 0, 10)
   btn2 = lv.btn(lv.screen_active())
   btn2.align(lv.ALIGN.TOP_MID, 0, 50)
   btn1.add_event_cb(event_cb_1, lv.EVENT.CLICKED, 0)
   btn2.add_event_cb(event_cb_2, lv.EVENT.CLICKED, 0)
   print('mem used max: %0.2f kB' % (mem.getMax()))
   print('mem used now: %0.2f kB' % (mem.getNow()))


LV_CHECKBOX（复选框）
~~~~~~~~~~~~~~~~~~~~~

.. code:: python

   import pika_lvgl as lv
   import PikaStdLib
   mem = PikaStdLib.MemChecker()
   cb = lv.checkbox(lv.screen_active())
   cb.set_text("Apple")
   cb.align(lv.ALIGN.TOP_LEFT, 0 ,0)
   cb = lv.checkbox(lv.screen_active())
   cb.set_text("Banana")
   cb.add_state(lv.STATE.CHECKED)
   cb.align(lv.ALIGN.TOP_LEFT, 0 ,30)
   cb = lv.checkbox(lv.screen_active())
   cb.set_text("Lemon")
   cb.add_state(lv.STATE.DISABLED)
   cb.align(lv.ALIGN.TOP_LEFT, 0 ,60)
   cb = lv.checkbox(lv.screen_active())
   cb.add_state(lv.STATE.CHECKED | lv.STATE.DISABLED)
   cb.set_text("Melon")
   cb.align(lv.ALIGN.TOP_LEFT, 0 ,90)
   print('mem used max: %0.2f kB' % (mem.getMax()))
   print('mem used now: %0.2f kB' % (mem.getNow()))

--------------


How does it work?（它是如何工作的？）
-----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

PikaScript has a unique C module smart binding tool

Just write the Python interface in pika_lvgl.pyi (.pyi is the python
interface file)

.. code:: python

   # pika_lvgl.pyi
   class arc(lv_obj):
       def set_end_angle(self, angle: int): ...
       def set_bg_angles(self, start: int, end: int): ...
       def set_angles(self, start: int, end: int): ...

Then PikaScript's pre-compiler can automatically bind the following C
functions, simply by naming the functions in the module_class_method
format, without any additional work, and all binding and registration is
done automatically.

.. code:: c

   /* pika_lvgl_arc.c */
   void pika_lvgl_arc_set_end_angle(PikaObj* self, int angle) {
       lv_obj_t* lv_obj = obj_getPtr(self, "lv_obj");
       lv_arc_set_end_angle(lv_obj, angle);
   }
   void pika_lvgl_arc_set_bg_angles(PikaObj *self, int start, int end){
       lv_obj_t* lv_obj = obj_getPtr(self, "lv_obj");
       lv_arc_set_bg_angles(lv_obj, start, end);
   }
   void pika_lvgl_arc_set_angles(PikaObj *self, int start, int end){
       lv_obj_t* lv_obj = obj_getPtr(self, "lv_obj");
       lv_arc_set_angles(lv_obj, start, end);
   }

To use the module, just ``import pika_lvgl`` and the precompiler will
automatically scan main.py and bind the ``pika_lvgl`` module

::

   $ ./rust-msc-latest-win10.exe
   (pikascript) packages installed:
       pikascript-core==v1.10.0
       PikaStdLib==v1.10.0
       PikaStdDevice==v1.10.0
   (pikascript) pika compiler:
     scanning main.py...
       binding pika_lvgl.pyi...

The precompiler is written in Rust, runs on windows and linux, and is
completely open source.

In addition to binding C modules, the precompiler compiles Python
scripts to bytecode in the PC, reducing the size of the script and
increasing its speed.

--------------

.. raw:: html

   </details>
   <br>


PikaScript具有独特的C模块智能绑定工具。

只需在pika_lvgl.pyi（.pyi是Python接口文件）中编写Python接口。

.. code:: python

   # pika_lvgl.pyi
   class arc(lv_obj):
       def set_end_angle(self, angle: int): ...
       def set_bg_angles(self, start: int, end: int): ...
       def set_angles(self, start: int, end: int): ...

然后，PikaScript的预编译器可以通过以module_class_method格式命名函数来自动绑定以下C函数，而无需任何额外工作，所有绑定和注册都会自动完成。

.. code:: c

   /* pika_lvgl_arc.c */
   void pika_lvgl_arc_set_end_angle(PikaObj* self, int angle) {
       lv_obj_t* lv_obj = obj_getPtr(self, "lv_obj");
       lv_arc_set_end_angle(lv_obj, angle);
   }
   void pika_lvgl_arc_set_bg_angles(PikaObj *self, int start, int end){
       lv_obj_t* lv_obj = obj_getPtr(self, "lv_obj");
       lv_arc_set_bg_angles(lv_obj, start, end);
   }
   void pika_lvgl_arc_set_angles(PikaObj *self, int start, int end){
       lv_obj_t* lv_obj = obj_getPtr(self, "lv_obj");
       lv_arc_set_angles(lv_obj, start, end);
   }

要使用该模块，只需 ``import pika_lvgl``，预编译器将自动扫描main.py并绑定 ``pika_lvgl`` 模块。

::

   $ ./rust-msc-latest-win10.exe
   (pikascript) 已安装的包:
       pikascript-core==v1.10.0
       PikaStdLib==v1.10.0
       PikaStdDevice==v1.10.0
   (pikascript) pika编译器:
     正在扫描main.py...
       绑定pika_lvgl.pyi...

预编译器采用Rust编写，可在Windows和Linux上运行，并且完全开源。

除了绑定C模块外，预编译器还将Python脚本编译成PC上的字节码，减少了脚本的大小并增加了其速度。

--------------


How can I use it?（如何使用它？）
--------------------------------

The simulation repo on vs is available on
https://github.com/pikasTech/lv_pikascript
