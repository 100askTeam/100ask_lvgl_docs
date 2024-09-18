.. _lv_lottie:

=======================
Lottie动画 (lv_lottie)
=======================

Overview（概览）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Lottie widget is capable of parsing, rasterizing, and playing `Lottie animations <https://lottiefiles.com>`__.

The Lottie animations are vector based animation. Think of it as the modern combination of SVG and GIF.

The animations can be downloaded from various sources, such as `https://lottiefiles.com/ <https://lottiefiles.com/>`__
or you can create your own animations using for example Adobe After Effects.

The Lottie widget is based on :ref:`lv_canvas` because in order to render the animation
the user needs to provide a buffer where the current frame is stored.

.. raw:: html

   </details> 
   <br>


Lottie 控件能够解析、光栅化以及播放 `Lottie 动画 <https://lottiefiles.com>`__。

Lottie 动画是基于矢量的动画。可以将其视为 SVG 和 GIF 的现代组合。

动画可以从多种来源下载，比如 `https://lottiefiles.com <https://lottiefiles.com>`__ ，或者你可以使用例如 Adobe After Effects 来创建自己的动画。

Lottie 控件基于 :ref:`lv_canvas` 所以为了能渲染动画，用户需要提供一个缓冲区来存储当前帧。


.. _lv_lottie_parts_and_styles:

Parts and Styles（部分和样式）
******************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` The background of the Lottie animation. The typical background style properties apply but usually it is left transparent.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_PART_MAIN` 动画的背景。通常背景样式属性适用，但默认保持透明。


.. _lv_lottie_usage:

Usage（用法）
*************

Dependencies（依赖）
--------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Lottie widget uses the `ThorVG <https://github.com/thorvg/thorvg>`__ library which is `integrated into LVGL <https://github.com/lvgl/lvgl/tree/master/src/libs/thorvg>`__.
In order to use Lottie animations ``LV_USE_THORVG_INTERNAL`` (to use the built-in ThorVG) or
``LV_USE_THORVG_EXTERNAL`` (to link it externally) needs to enabled. For vector graphics in general
``LV_USE_VECTOR_GRAPHIC`` also needs to be enabled.

As ThorVG is written in C++, when using ``LV_USE_THORVG_INTERNAL`` be sure that you
can compile the cpp files.

.. raw:: html

   </details> 
   <br>


Lottie 控件使用到了 `ThorVG <https://github.com/thorvg/thorvg>`__ 库，该库已经 `集成内置到 LVGL库  <https://github.com/lvgl/lvgl/tree/master/src/libs/thorvg>`__ 中。

为了使用 Lottie 动画，需要在 `lv_conf.h` 中启用 ``LV_USE_THORVG_INTERNAL`` （使用内置的 ThorVG 库）或者 ``LV_USE_THORVG_EXTERNAL`` （使用外部库或自定义的库）。对于矢量图形，通常还需要启用 ``LV_USE_VECTOR_GRAPHIC`` 。

由于 ThorVG 用 C++ 编写，当使用 ``LV_USE_THORVG_INTERNAL`` 时，请确保你的编译环境能编译 cpp 文件。


Set a buffer（设置缓冲区）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

In order to render the animation a buffer needs to assign to the Lottie widget.
The animations are rendered in ARGB8888 format, therefor the buffer's size should be equal to
``target_width x target_height x 4`` bytes.

To keep the buffer size and the animation size consistent,
the size of the widget (i.e. the size of the animation) is set to the dimensions of the buffer internally.

The buffer can be set with either :cpp:expr:`void lv_lottie_set_buffer(lottie, w, h, buf);`
or :cpp:expr:`lv_lottie_set_draw_buf(lottie, draw_buf)`.

When a draw buffer is used, it must be already initialized by the user with :cpp:expr:`LV_COLOR_FORMAT_ARGB8888` color format.

.. raw:: html

   </details> 
   <br>


为了渲染动画，需要给 Lottie 控件分配一个缓冲区。
动画以 ARGB8888 格式渲染，因此缓冲区的大小应该是 ``目标宽度 x 目标高度 x 4 字节``。

为了保持缓冲区大小和动画大小的一致性，
控件的大小（即动画的大小）在内部根据缓冲区大小自动调整。

可以使用以下任一方法设置缓冲区：

- :cpp:expr:`lv_lottie_set_buffer(lottie, w, h, buf)` 
- :cpp:expr:`lv_lottie_set_draw_buf(lottie, draw_buf)` 

当使用绘制缓冲区时，它必须已经被用户使用 :cpp:enumerator:`LV_COLOR_FORMAT_ARGB8888` 颜色格式初始化。


Set a source（设置源）
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

``lv_example_lottie_approve.c`` contains an example animation. Instead storing the JSON string, a hex array is stored for the
following reasons:
- avoid escaping ``"`` character in the JSON file
- some compilers don't support very long strings

``lvgl/scripts/filetohex.py`` can be used to convert a Lottie file a hex
array. E.g.:

.. code:: shell

   ./filetohex.py path/to/lottie.json > out.txt

To create an animation from data use
:cpp:enumerator:`lv_lottie_set_src_data(lottie, data, sizeof(data))`

Lottie animations can be opened from JSON files by using :cpp:enumerator:`lv_lottie_set_src_file(lottie, "path/to/file.json")`.
Note that the Lottie loader doesn't support LVGL's File System interface but a "normal path" should be used without a driver letter.

.. raw:: html

   </details> 
   <br>


``lv_example_lottie_approve.c`` 包含一个示例动画。为了存储 JSON 字符串，使用数组存储其十六进制格式的字符串数据，原因如下：

- 避免在 JSON 文件中转义 ``"`` 字符
- 一些编译器不支持非常长的字符串

可以使用 ``lvgl/scripts/filetohex.py`` 将 Lottie 文件转换为十六进制数组。
例如：

.. code:: shell

   ./filetohex.py path/to/lottie.json > out.txt

要从数据源创建 lottie 动画，使用 :cpp:expr:`lv_lottie_set_src_data(lottie, data, sizeof(data))` 

Lottie 动画可以通过使用 :cpp:expr:`lv_lottie_set_src_file(lottie, "path/to/file.json")` 从 JSON 文件打开。

注意，Lottie 加载器不支持 LVGL 的文件系统接口，但应该使用没有驱动器字母（盘符）的 “常规路径” 。


Get the animation（获取动画）
----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

``lv_anim_t * a = lv_lottie_get_anim(lottie)`` return the LVGL animation which controls the
Lottie animation. By default it is running infinitely at 60FPS however the LVGL animation
can be freely adjusted.

.. raw:: html

   </details> 
   <br>


``lv_anim_t * a = lv_lottie_get_anim(lottie)`` 返回控制 Lottie 动画的 LVGL 动画。默认情况下，它以60FPS的速度无限运行，但是 LVGL 的动画可以对其进行调整。


.. _lv_lottie_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No special events are sent by the Lottie widget.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


Lottie 控件没有发送特殊事件。

了解更多关于 :ref:`events`。

.. _lv_lottie_keys:

Keys（按键）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No keys are processed by the Lottie widget
Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


Lottie 控件不处理任何键。
了解更多关于 :ref:`indev_keys`。

.. _lv_lottie_example:

Example（示例）
***************

.. include:: ../examples/widgets/lottie/index.rst

.. _lv_lottie_api:

API
***
