.. _lv_canvas:

==========================
Canvas（画布）(lv_canvas)
==========================

Overview（概述）
*****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

A Canvas inherits from :ref:`Image <lv_image>` where the user can draw
anything. Rectangles, texts, images, lines, arcs can be drawn here using
lvgl's drawing engine.

.. raw:: html

   </details> 
   <br>


Canvas（画布） 继承自 :ref:`Image <lv_image>` ，用户可以在其中绘制任何内容：矩形、文本、图像、线条、圆弧可以在这里使用lvgl的绘图引擎绘制。


.. _lv_canvas_parts_and_styles:

Parts and Styles（部分和样式）
*******************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` Uses the typical rectangle style properties and image
style properties.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_PART_MAIN` 使用典型的矩形样式属性和图像样式属性。


.. _lv_canvas_usage:

Usage（用法）
**************

Buffer（缓冲区）
-----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Canvas needs a buffer in which it stores the drawn image. To assign a
buffer to a Canvas, use
:cpp:expr:`lv_canvas_set_buffer(canvas, buffer, width, height, LV_COLOR_FORMAT_...)`.
Where ``buffer`` is a static buffer (not just a local variable) to hold
the image of the canvas. For example for a 100x50 ARGB8888 buffer:
``static uint8_t buffer[100 * 50 * 4]``.

Or you can use
``static uint8_t buffer[LV_CANVAS_BUF_SIZE(width, height, bit_per_pixel, stride_in_bytes)]``.

The canvas supports all the color formats like
:cpp:enumerator:`LV_COLOR_FORMAT_ARGB8888` or :cpp:enumerator:`LV_COLOR_FORMAT_I2`. See the full
list in the :ref:`Color formats <overview_image_color_formats>` section.

.. raw:: html

   </details> 
   <br>


Canvas 需要一个缓冲区来存储绘制的图像。 要为 Canvas 分配缓冲区，请使用函数 :cpp:expr:`lv_canvas_set_buffer(canvas, buffer, width, height, LV_COLOR_FORMAT_...)` ， 其中参数 ``buffer``  是一个静态缓冲区（不能是局部变量）来保存画布的图像。例如，对于 100x50 的 ARGB888缓冲区，可以这样分配： 

- ``static uint8_t buffer[100 * 50 * 4]``
- ``static uint8_t buffer[LV_CANVAS_BUF_SIZE(width, height, bit_per_pixel, stride_in_bytes)]``

画布支持所有LVGL内置支持的颜色格式，如 :cpp:enumerator:`LV_COLOR_FORMAT_ARGB8888` 或 :cpp:enumerator:`LV_COLOR_FORMAT_I2` ，请阅读 :ref:`Color formats <overview_image_color_formats>` 了解完整的格式列表。


Indexed colors（颜色索引）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

For ``LV_COLOR_FORMAT_I1/2/4/8`` color formats a palette needs to be
initialized with :cpp:expr:`lv_canvas_set_palette(canvas, 3, lv_color_hex(0xff0000))`. It
sets pixels with *index=3* to red.

.. raw:: html

   </details> 
   <br>


对于 ``LV_COLOR_FORMAT_I1/2/4/8`` 颜色格式，调色板需要用 :cpp:expr:`lv_canvas_set_palette(canvas, 3, lv_color_hex(0xff0000))` 初始化。 它将 *index=3* 的像素设置为红色


Drawing（画画）
-----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To set a pixel's color on the canvas, use
:cpp:expr:`lv_canvas_set_px_color(canvas, x, y, color, opa)`. With
``LV_COLOR_FORMAT_I1/2/4/8`` the index of the color needs to be passed as
color like this ``lv_color_from_int(13);``. It passes index 13 as a color.


:cpp:expr:`lv_canvas_fill_bg(canvas, lv_color_hex(0x00ff00), LV_OPA_50)` fills the whole
canvas to blue with 50% opacity. Note that if the current color format
doesn't support colors (e.g. :cpp:enumerator:`LV_COLOR_FORMAT_A8`) the color will be
ignored. Similarly, if opacity is not supported
(e.g. :cpp:enumerator:`LV_COLOR_FORMAT_RGB565`) it will be ignored.

An array of pixels can be copied to the canvas with
:cpp:expr:`lv_canvas_copy_buf(canvas, buffer_to_copy, x, y, width, height)`. The
color format of the buffer and the canvas need to match.

To draw something to the canvas use LVGL's draw functions directly. See the examples for more details.

The draw function can draw to any color format to which LVGL can render. Typically it means
:cpp:enumerator:`LV_COLOR_FORMAT_RGB565`, :cpp:enumerator:`LV_COLOR_FORMAT_RGB888`,
:cpp:enumerator:`LV_COLOR_FORMAT_XRGB888`, and :cpp:enumerator:`LV_COLOR_FORMAT_ARGB8888`.

.. raw:: html

   </details> 
   <br>


要在画布上设置像素，请使用 :cpp:expr:`lv_canvas_set_px_color(canvas, x, y, color, opa)` 。 对于 ``LV_COLOR_FORMAT_I1/2/4/8`` 颜色索引需要像这样 ``lv_color_from_int(13);`` 传递，它将颜色索引 13 作为颜色传递。

:cpp:expr:`lv_canvas_fill_bg(canvas, lv_color_hex(0x00ff00), LV_OPA_50)` 将整个画布填充为蓝色，不透明度为 50%。 请注意，如果当前颜色格式不支持(例如 :cpp:enumerator:`LV_COLOR_FORMAT_A8`)，则该颜色将被忽略。同样，如果不支持不透明度(例如 :cpp:enumerator:`LV_COLOR_FORMAT_RGB565`)，不透明度将被忽略。

可以使用 :cpp:expr:`lv_canvas_copy_buf(canvas, buffer_to_copy, x, y, width, height)` 将像素数组复制到画布。缓冲区和画布的颜色格式需要一致。

要在画布上绘制内容，请直接使用 LVGL 的绘制函数。有关更多详细信息，请参阅后面的示例。

draw 函数可以绘制为 LVGL 可以渲染的任何颜色格式，通常是： :cpp:enumerator:`LV_COLOR_FORMAT_RGB565` 、 :cpp:enumerator:`LV_COLOR_FORMAT_RGB888` 、 :cpp:enumerator:`LV_COLOR_FORMAT_XRGB888` 、:cpp:enumerator:`LV_COLOR_FORMAT_ARGB8888`


.. _lv_canvas_events:

Events（事件）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No special events are sent by canvas objects. The same events are sent
as for the

See the events of the :ref:`lv_image` too.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


画布对象不会发送特殊事件。

也可以阅读 :ref:`lv_image` 的事件。

详细了解更多阅读 :ref:`events`。


.. _lv_canvas_keys:

Keys（按键）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No *Keys* are processed by the object type.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


对象类型不处理 *Keys*。

阅读了解有关 :ref:`indev_keys` 的更多信息


.. _lv_canvas_example:

Example
*********

.. include:: ../examples/widgets/canvas/index.rst

.. _lv_canvas_api:

API
***
