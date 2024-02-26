.. _lv_arc:

=====================
Arc（圆弧 ） (lv_arc)
=====================

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Arc consists of a background and a foreground arc. The foreground
(indicator) can be touch-adjusted.

.. raw:: html

   </details> 
   <br>


弧线由背景弧线和前景弧线组成。前景 （指示灯）可以触摸调节。

.. _lv_arc_parts_and_styles:

Parts and Styles（零件和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` Draws a background using the typical background
   style properties and an arc using the arc style properties. The arc's
   size and position will respect the *padding* style properties.
-  :cpp:enumerator:`LV_PART_INDICATOR` Draws another arc using the *arc* style
   properties. Its padding values are interpreted relative to the
   background arc.
-  :cpp:enumerator:`LV_PART_KNOB` Draws a handle on the end of the indicator using all
   background properties and padding values. With zero padding the knob
   size is the same as the indicator's width. Larger padding makes it
   larger, smaller padding makes it smaller.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_PART_MAIN` 使用典型背景绘制背景 样式属性和使用圆弧样式属性的弧。圆弧的大小和位置将遵循填充样式属性。
-  :cpp:enumerator:`LV_PART_INDICATOR` 使用圆弧样式绘制另一个圆弧性能。它的填充值是相对于背景弧。
-  :cpp:enumerator:`LV_PART_KNOB` 在指标的末尾绘制一个手柄，使用所有背景属性和填充值。如果使用零填充，旋钮大小与指示器的宽度相同。较大的填充使其更大，较小的填充使其更小。


.. _lv_arc_usage:

Usage（用法）
************

Value and range（值和范围）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

A new value can be set using :cpp:expr:`lv_arc_set_value(arc, new_value)`. The
value is interpreted in a range (minimum and maximum values) which can
be modified with :cpp:expr:`lv_arc_set_range(arc, min, max)`. The default range
is 0..100.

The indicator arc is drawn on the main part's arc. This if the value is
set to maximum the indicator arc will cover the entire "background" arc.
To set the start and end angle of the background arc use the
:cpp:expr:`lv_arc_set_bg_angles(arc, start_angle, end_angle)` functions or
``lv_arc_set_bg_start/end_angle(arc, angle)``.

Zero degrees is at the middle right (3 o'clock) of the object and the
degrees are increasing in clockwise direction. The angles should be in
the [0;360] range.

.. raw:: html

   </details> 
   <br>


可以使用 :cpp:expr:`lv_arc_set_value(arc, new_value)`设置新值。设置的值被解释为一个范围（最小值和最大值），可以使用 :cpp:expr:`lv_arc_set_range(arc, min, max)` 修改。默认范围为 0...100。

指示器弧线绘制在主部件的弧线上。如果将值设置为最大值时，指示器弧将覆盖整个 "背景 "弧。要设置背景弧的起始角度和终止角度，请使用:cpp:expr:`lv_arc_set_bg_angles(arc, start_angle, end_angle)` 函数或 ``lv_arc_set_bg_start/end_angle(arc, angle)`` 函数。

零度位于对象的右侧（3 点钟方向），度数按顺时针方向递增。角度应在[0;360] 范围内。


Rotation（旋转）
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

An offset to the 0 degree position can be added with
:cpp:expr:`lv_arc_set_rotation(arc, deg)`.

.. raw:: html

   </details> 
   <br>


可以用:cpp:expr:`lv_arc_set_rotation(arc, deg)` 添加到 0 度位置的偏移量。


Mode（模式）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The arc can be one of the following modes:

- :cpp:enumerator:`LV_ARC_MODE_NORMAL` The indicator arc is drawn from the minimum value to the current.
- :cpp:enumerator:`LV_ARC_MODE_REVERSE` The indicator arc is drawn counter-clockwise
  from the maximum value to the current.
- :cpp:enumerator:`LV_ARC_MODE_SYMMETRICAL` The indicator arc is drawn from the middle point to the current value.

The mode can be set by :cpp:expr:`lv_arc_set_mode(arc, LV_ARC_MODE_...)` and
used only if the angle is set by :cpp:func:`lv_arc_set_value` or the arc is
adjusted by finger.

.. raw:: html

   </details> 
   <br>


弧线可以是以下模式之一：

- :cpp:enumerator:`LV_ARC_MODE_NORMAL` 普通模式。指示器从最小值绘制到当前值。

- :cpp:enumerator:`LV_ARC_MODE_REVERSE` 反向模式。指示器从最大值到当前值逆时针绘制。

- :cpp:enumerator:`LV_ARC_MODE_SYMMETRICAL` 对称模式。指示器从中间点绘制到当前值。

模式可通过 :cpp:expr:`lv_arc_set_mode(arc, LV_ARC_MODE_...)` 设置，并且在角度由 :cpp:func:`lv_arc_set_value` 设置或弧度用手指调整时使用。


Change rate（变化率）
--------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If the arc is pressed the current value will set with a limited speed
according to the set *change rate*. The change rate is defined in
degree/second unit and can be set with
:cpp:expr:`lv_arc_set_change_rage(arc, rate)`

.. raw:: html

   </details> 
   <br>


如果按下弧形键，当前值将以有限的速度设置 *变化率*。变化率以度/秒为单位，可以用:cpp:expr:`lv_arc_set_change_rage(arc, rate)`设置。

Knob offset（旋钮控件）
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Changing the knob offset allows the location of the knob to be moved
relative to the end of the arc The knob offset can be set by
:cpp:expr:`lv_arc_set_knob_offset(arc, offset_angle)`, will only be visible if
:cpp:enumerator:`LV_PART_KNOB` is visible

.. raw:: html

   </details> 
   <br>


更改旋钮控件允许移动旋钮的位置相对于弧线末端旋钮偏移可以通过:cpp:expr:`lv_arc_set_knob_offset(arc, offset_angle)` 设置，只有在:cpp:enumerator:`LV_PART_KNOB` 时才可见。


Setting the indicator manually（手动设置指示灯）
-----------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

It's also possible to set the angles of the indicator arc directly with
:cpp:expr:`lv_arc_set_angles(arc, start_angle, end_angle)` function or
``lv_arc_set_start/end_angle(arc, start_angle)``. In this case the set
"value" and "mode" are ignored.

In other words, the angle and value settings are independent. You should
exclusively use one or the other. Mixing the two might result in
unintended behavior.

To make the arc non-adjustable, remove the style of the knob and make
the object non-clickable:

.. raw:: html

   </details> 
   <br>


也可以使用 :cpp:expr:`lv_arc_set_angles(arc, start_angle, end_angle)` 函数或 ``lv_arc_set_start/end_angle(arc, start_angle)``直接设置指示器的角度(零度位于对象的中间右侧（3 点钟方向），并且度数沿顺时针方向增加。)。 在这种情况下，设置的 “值” 和 “模式” 将被忽略。

换言之，角度和值设置是独立的。你应该只使用其中之一。将两者混合可能会导致意外行为。

要使弧度不可调，请移除旋钮的样式并使对象不可点击：


.. code:: c

   lv_obj_remove_style(arc, NULL, LV_PART_KNOB);
   lv_obj_remove_flag(arc, LV_OBJ_FLAG_CLICKABLE);

Advanced hit test（高级触摸测试）
--------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If the :cpp:enumerator:`LV_OBJ_FLAG_ADV_HITTEST` flag is enabled the arc can be
clicked through in the middle. Clicks are recognized only on the ring of
the background arc. :cpp:func:`lv_obj_set_ext_click_size` makes the sensitive
area larger inside and outside with the given number of pixels.

.. raw:: html

   </details> 
   <br>


如果启用了:cpp:enumerator:`LV_OBJ_FLAG_ADV_HITTEST` 标志，则弧可以在中间点击。只有在环上才能识别点击背景弧。 :cpp:func:`lv_obj_set_ext_click_size` 使敏感在给定的像素数下，内部和外部区域更大。


Place another object to the knob（将另一个对象放在旋钮上）
--------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Another object can be positioned according to the current position of
the arc in order to follow the arc's current value (angle). To do this
use :cpp:expr:`lv_arc_align_obj_to_angle(arc, obj_to_align, radius_offset)`.

Similarly
:cpp:expr:`lv_arc_rotate_obj_to_angle(arc, obj_to_rotate, radius_offset)` can be
used to rotate the object to the current value of the arc.

It's a typical use case to call these functions in the ``VALUE_CHANGED``
event of the arc.

.. raw:: html

   </details> 
   <br>


另一个对象可以根据当前位置定位弧，以便遵循弧的当前值（角度）。为此，执行此操作请使用 :cpp:expr:`lv_arc_align_obj_to_angle(arc, obj_to_align, radius_offset)`。

类似地，:cpp:expr:`lv_arc_rotate_obj_to_angle(arc, obj_to_rotate, radius_offset)` 可以是用于将对象旋转到弧的当前值。

在 ``VALUE_CHANGED``发生弧形时调用这些函数是一个典型的用例。


.. _lv_arc_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` sent when the arc is pressed/dragged to
   set a new value.
-  :cpp:enumerator:`LV_EVENT_DRAW_PART_BEGIN` and :cpp:enumerator:`LV_EVENT_DRAW_PART_END` are sent
   with the following types:

   -  :cpp:enumerator:`LV_ARC_DRAW_PART_BACKGROUND` The background arc.

      -  ``part``: :cpp:enumerator:`LV_PART_MAIN`
      -  ``p1``: center of the arc
      -  ``radius``: radius of the arc
      -  ``arc_dsc``

   -  :cpp:enumerator:`LV_ARC_DRAW_PART_FOREGROUND` The foreground arc.

      -  ``part``: :cpp:enumerator:`LV_PART_INDICATOR`
      -  ``p1``: center of the arc
      -  ``radius``: radius of the arc
      -  ``arc_dsc``

   -  LV_ARC_DRAW_PART_KNOB The knob

      -  ``part``: :cpp:enumerator:`LV_PART_KNOB`
      -  ``draw_area``: the area of the knob
      -  ``rect_dsc``:

See the events of the :ref:`Base object <lv_obj>` too.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 当弧线被按下/拖动到设置一个新值。

-  :cpp:enumerator:`LV_EVENT_DRAW_PART_BEGIN`和 :cpp:enumerator:`LV_EVENT_DRAW_PART_END` 被发送具有以下类型：

   -  :cpp:enumerator:`LV_ARC_DRAW_PART_BACKGROUND` 背景弧线。
      -  ``part``: :cpp:enumerator:`LV_PART_MAIN`
      -  ``p1``: 弧形中心
      -  ``radius``: 弧的半径
      -  ``arc_dsc``

   -  :cpp:enumerator:`LV_ARC_DRAW_PART_FOREGROUND` 前景弧线。

      -  ``part``: :cpp:enumerator:`LV_PART_INDICATOR`
      -  ``p1``: 弧形中心
      -  ``radius``: 弧的半径
      -  ``arc_dsc``

   -  LV_ARC_DRAW_PART_KNOB 旋钮

      -  ``part``: :cpp:enumerator:`LV_PART_KNOB`
      -  ``draw_area``: 旋钮的面积
      -  ``rect_dsc``:


.. _lv_arc_keys:

Keys（按键）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  ``LV_KEY_RIGHT/UP`` Increases the value by one.
-  ``LV_KEY_LEFT/DOWN`` Decreases the value by one.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


-  ``LV_KEY_RIGHT/UP`` 将值增加 1。
-  ``LV_KEY_LEFT/DOWN`` 将该值减小 1。

了解有关 :ref:`indev_按键`的更多信息。


.. _lv_arc_example:

Example
*******

.. include:: ../examples/widgets/arc/index.rst

.. _lv_arc_api:

API
***
