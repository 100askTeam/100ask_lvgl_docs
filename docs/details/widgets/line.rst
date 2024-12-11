.. _lv_line:

======================
Line （线条）(lv_line)
======================

Overview（概述）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Line Widget is capable of drawing straight lines between a set of
points.

.. raw:: html

   </details> 
   <br>


线条(Line)控件能在给出的一组点之间绘制出相连的直线。


.. _lv_line_parts_and_styles:

Parts and Styles（部分和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` uses all the typical background properties and line style properties.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_PART_MAIN` 使用所有典型的背景属性和线条样式属性。


.. _lv_line_usage:

Usage（用法）
************

Set points（设置点）
-------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The points have to be stored in an :cpp:struct:`lv_point_precise_t` array and passed to
the Widget by the :cpp:expr:`lv_line_set_points(lines, point_array, point_cnt)`
function.

Their coordinates can either be specified as raw pixel coordinates
(e.g. ``{5, 10}``), or as a percentage of the Line's bounding box using
:cpp:expr:`lv_pct(x)`. In the latter case, the Line's width/height may need to
be set explicitly using :cpp:func:`lv_obj_set_width` and :cpp:func:`lv_obj_set_height`,
as percentage values do not automatically expand the bounding box.

.. raw:: html

   </details> 
   <br>


点必须存储在 :cpp:struct:`lv_point_precise_t` 类型的数组中，并通过 :cpp:expr:`lv_line_set_points(lines, point_array, point_cnt)` 函数将数组传递给line对象。

它们的坐标既可以指定为原始像素坐标（例如 ``{5, 10}``），也可以使用 :cpp:expr:`lv_pct(x)`指定为相对于线条边界框的百分比。在后一种情况下，可能需要使用 :cpp:func:`lv_obj_set_width`和 :cpp:func:`lv_obj_set_height`显式地设置线条的宽度 / 高度，因为百分比值不会自动扩展边界框。

Auto-size（自动调整大小）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

By default, the Line's width and height are set to :c:macro:`LV_SIZE_CONTENT`.
This means it will automatically set its size to fit all the points. If
the size is set explicitly, parts on the line may not be visible.

.. raw:: html

   </details> 
   <br>


默认情况下，线条的宽度和高度被设置为 :c:macro:`LV_SIZE_CONTENT`。也就是它会根据给出的点自动调整其大小来适应所有点的分布。如果你设置了宽、高，那么线条上的有些部分可能会不可见。


Invert y（反转 y轴）
-------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

By default, the *y == 0* point is in the top of the object. It might be
counter-intuitive in some cases so the y coordinates can be inverted
with :cpp:expr:`lv_line_set_y_invert(line, true)`. In this case, *y == 0* will
be the bottom of the object. *y invert* is disabled by default.

.. raw:: html

   </details> 
   <br>


默认情况下，*y == 0* 点是在line对象的顶部最左侧。这在某些情况下可能是不直观的(LCD坐标系)，这时候可以使用 :cpp:expr:`lv_line_set_y_invert(line, true)` 函数来反转y坐标 。在这种情况下， *y == 0* 将是物体的底部最左侧(直角坐标系)。

默认不反转 *y轴*。


.. _lv_line_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Only :ref:`generic events <events>` are sent by Line Widgets.

.. admonition::  Further Reading

    Learn more about :ref:`lv_obj_events` emitted by all Widgets.

    Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


线性部件仅发送 :ref:`generic events <events>`。

进一步了解所有部件发出的 :ref:`lv_obj_events`。

进一步了解 :ref:`events`。


.. _lv_line_keys:

Keys（按键）
***********

.. raw:: html

   <details>
     <summary>显示原文</summary>

No *Keys* are processed by Line Widgets.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


线性部件不处理任何*按键*。

了解有关 :ref:`indev_keys` 的更多信息。

.. _lv_line_example:

Example
*******

.. include:: ../examples/widgets/line/index.rst

.. _lv_line_api:

API
***
