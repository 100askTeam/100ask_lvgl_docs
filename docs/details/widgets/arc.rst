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


圆弧由背景弧和前景弧组成。前景（指示器）部分可以通过触摸进行调节。

.. _lv_arc_parts_and_styles:

Parts and Styles（部分和样式）
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


-  :cpp:enumerator:`LV_PART_MAIN` 使用典型背景样式属性绘制背景，并使用圆弧样式属性绘制圆弧。圆弧的大小和位置遵循填充（padding）样式属性。
-  :cpp:enumerator:`LV_PART_INDICATOR` 使用圆弧（arc）样式属性绘制出来的另一条圆弧。它的填充值是相对于背景弧来解释的。
-  :cpp:enumerator:`LV_PART_KNOB` 使用所有背景属性和填充值在指示器的末端绘制一个旋钮。当填充值为零时，旋钮大小与指示器的宽度相同。填充值越大，旋钮越大；填充值越小，旋钮越小。


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
To set the start and end angle of the background arc use any of these functions:

- :cpp:expr:`lv_arc_set_bg_start_angle(arc, angle)`
- :cpp:expr:`lv_arc_set_bg_end_angle(arc, angle)`
- :cpp:expr:`lv_arc_set_bg_angles(arc, start_angle, end_angle)`

Zero degrees is at the middle right (3 o'clock) of the object and the
degrees are increasing in clockwise direction. The angles should be in
the [0;360] range.

.. raw:: html

   </details> 
   <br>


可以使用 :cpp:expr:`lv_arc_set_value(arc, new_value)` 设置新值。设置的值在一个范围（最小值和最大值）内解读，这个范围可以使用 :cpp:expr:`lv_arc_set_range(arc, min, max)` 修改。默认范围为 0...100。

指示弧绘制在主体部分的弧线上。也就是说，如果将值设置为最大值，指示弧将会覆盖整个 “背景” 弧线。要设置背景弧的起始角和终止角，可以使用以下任意函数：

- :cpp:expr:`lv_arc_set_bg_start_angle(arc, angle)`
- :cpp:expr:`lv_arc_set_bg_end_angle(arc, angle)`
- :cpp:expr:`lv_arc_set_bg_angles(arc, start_angle, end_angle)`

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


可以用 :cpp:expr:`lv_arc_set_rotation(arc, deg)` 从零度位置开始设置角度。


Mode（模式）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The arc can be one of the following modes:

- :cpp:enumerator:`LV_ARC_MODE_NORMAL` Indicator arc is drawn clockwise from minimum to current value.
- :cpp:enumerator:`LV_ARC_MODE_REVERSE` Indicator arc is drawn counter-clockwise
  from maximum to current value.
- :cpp:enumerator:`LV_ARC_MODE_SYMMETRICAL` Indicator arc is drawn from middle point to current value.

The mode can be set by :cpp:expr:`lv_arc_set_mode(arc, LV_ARC_MODE_...)` and
has no effect until angle is set by :cpp:func:`lv_arc_set_value` or value of the arc
is changed by pointer input (finger, mouse, etc.).

.. raw:: html

   </details> 
   <br>


弧线可以是以下模式之一：

- :cpp:enumerator:`LV_ARC_MODE_NORMAL` 普通模式。指示弧从最小值开始按顺时针方向绘制到当前值。

- :cpp:enumerator:`LV_ARC_MODE_REVERSE` 反向模式。指示弧从最大值开始按逆时针方向绘制到当前值。

- :cpp:enumerator:`LV_ARC_MODE_SYMMETRICAL` 对称模式。指示弧从中间点绘制到当前值。

可以通过 :cpp:expr:lv_arc_set_mode(arc, LV_ARC_MODE_...) 来设置模式，并且在通过 :cpp:func:lv_arc_set_value 设置角度或者通过指针输入（手指、鼠标等）改变弧线的值之前，设置模式是不起作用的。


Change rate（变化率）
--------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

When the arc's value is changed by pointer input (finger, mouse, etc.), the rate of
its change is limited according to its *change rate*.  Change rate is defined in
degrees/second units and can be set with
:cpp:expr:`lv_arc_set_change_rage(arc, rate)`

.. raw:: html

   </details> 
   <br>


当通过指针输入（手指、鼠标等）改变弧线的值时，其变化速率会根据它的 “变化率” 受到限制。变化率是以度 / 秒为单位来定义的，并且可以通过以下方式进行设置: :cpp:expr:`lv_arc_set_change_rage(arc, rate)` 设置。（简单的理解就是arc的前景弧到达某个值所需要的时间，时间单位是 度/秒）

Knob offset（旋钮偏移）
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Changing the knob offset allows the location of the knob to be moved
relative to the end of the arc.  The knob offset can be set by
:cpp:expr:`lv_arc_set_knob_offset(arc, offset_angle)`, and will only be visible if
:cpp:enumerator:`LV_PART_KNOB` is visible.

.. raw:: html

   </details> 
   <br>


改变旋钮偏移量可以使旋钮的位置相对于弧线末端进行移动。旋钮偏移量可以通过 :cpp:expr:lv_arc_set_knob_offset(arc, offset_angle) 来设置，并且只有在 :cpp:enumerator:LV_PART_KNOB（旋钮部件）可见的情况下才会显示出来。


Setting indicator programmatically（以编程方式设置指示器）
---------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

It is possible to set indicator angle directly with any of these functions:

- :cpp:expr:`lv_arc_set_start_angle(arc, start_angle)`
- :cpp:expr:`lv_arc_set_end_angle(arc, end_angle)`
- :cpp:expr:`lv_arc_set_angles(arc, start_angle, end_angle)`

When used, "value" and "mode" are ignored.

In other words, the angle and value settings are independent.  You should
exclusively use one or the other of the two methods.  Mixing the two could
result in unintended behavior.

To make the arc non-adjustable by external input, remove the style of the knob and
make the Widget non-clickable:

.. raw:: html

   </details> 
   <br>


可以使用以下任意函数直接设置指示器角度：

- :cpp:expr:`lv_arc_set_start_angle(arc, start_angle)` 设置弧的起始角度
- :cpp:expr:`lv_arc_set_end_angle(arc, end_angle)` 设置弧的终止角度
- :cpp:expr:`lv_arc_set_angles(arc, start_angle, end_angle)` 同时设置弧的起始角度和终止角度

使用这些函数时，“值” 和 “模式” 会被忽略。

换句话说，角度设置和值设置是相互独立的。你应该只选用这两种方法中的一种。将两者混用可能会导致意想不到的行为。

要使弧不能通过外部输入进行调整，可以移除旋钮的样式并使该部件不可点击：


.. code:: c

   lv_obj_remove_style(arc, NULL, LV_PART_KNOB);
   lv_obj_remove_flag(arc, LV_OBJ_FLAG_CLICKABLE);

Interactive area（交互区域）
--------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

By default :cpp:enumerator:`LV_OBJ_FLAG_ADV_HITTEST` is disabled which
means the arc's whole area is interactive.
As usual :cpp:func:`lv_obj_set_ext_click_area` can be used to increase
the area that will respond to pointer input (touch, mouse, etc.) outside the arc by a
specified number of pixels.

If :cpp:enumerator:`LV_OBJ_FLAG_ADV_HITTEST` is enabled the arc will be sensitive only
in the range between start and end background angles and on the arc itself (not inside the arc).
In this case ``ext_click_area`` makes the sensitive area ticker both inward and outward.
Additionally, a tolerance of :cpp:expr:`lv_dpx(50)` pixels is applied to each angle, extending the
hit-test range along the arc's length.

.. raw:: html

   </details> 
   <br>


默认情况下，:cpp:enumerator:`LV_OBJ_FLAG_ADV_HITTEST`（高级命中测试对象标志）是禁用的，这意味着弧线的整个区域都是可交互的。

通常，可以使用 :cpp:func:`lv_obj_set_ext_click_area`（设置扩展点击区域函数）来将弧线外部能响应指针输入（触摸、鼠标等）的区域增加指定的像素数。

如果启用了 :cpp:enumerator:`LV_OBJ_FLAG_ADV_HITTEST`，那么弧线将仅在起始和终止背景角度之间的范围以及弧线本身（而不是弧线内部）上具有交互敏感性。在这种情况下，``ext_click_area``（扩展点击区域）会使敏感区域向内和向外扩展。

此外，会对每个角度应用 :cpp:expr:`lv_dpx(50)` 像素的公差，从而沿着弧线的长度扩展命中测试范围。


Place another Widget on the knob（将另一个部件放置在旋钮上）
-----------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Another Widget can be positioned according to the current position of
the arc in order to follow the arc's current value (angle). To do this
use :cpp:expr:`lv_arc_align_obj_to_angle(arc, obj_to_align, radius_offset)`.

Similarly
:cpp:expr:`lv_arc_rotate_obj_to_angle(arc, obj_to_rotate, radius_offset)` can be
used to rotate the object to the current value of the arc.

A typical use case is to call these functions in the ``VALUE_CHANGED``
event of the arc.

.. raw:: html

   </details> 
   <br>


可以根据圆弧的当前位置来放置另一个部件，以便使其跟随圆弧的当前值（角度）。为此，执行此操作请使用 :cpp:expr:`lv_arc_align_obj_to_angle(arc, obj_to_align, radius_offset)`。

类似地，:cpp:expr:`lv_arc_rotate_obj_to_angle(arc, obj_to_rotate, radius_offset)` 可以是用于将对象根据旋钮的角度旋转之后再对齐到arc的旋钮的位置上。

一个典型的用例是在弧线的 ``VALUE_CHANGED``（值已改变）事件中调用这些函数。


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

.. admonition::  Further Reading

    Learn more about :ref:`lv_obj_events` emitted by all Widgets.

    Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 当弧线被按下/拖动到设置一个新值。

-  :cpp:enumerator:`LV_EVENT_DRAW_PART_BEGIN` 和 :cpp:enumerator:`LV_EVENT_DRAW_PART_END` 被发送具有以下类型：

   -  :cpp:enumerator:`LV_ARC_DRAW_PART_BACKGROUND` 背景弧。
   
      -  ``part``: :cpp:enumerator:`LV_PART_MAIN`
      -  ``p1``: 弧形中心
      -  ``radius``: 弧的半径
      -  ``arc_dsc``

   -  :cpp:enumerator:`LV_ARC_DRAW_PART_FOREGROUND` 前景弧。

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

了解更多关于所有部件发出的 :ref:`lv_obj_events`（对象事件）的内容。

了解有关 :ref:`indev_按键`的更多信息。


.. _lv_arc_example:

Example
*******

.. include:: ../../examples/widgets/arc/index.rst

.. _lv_arc_api:

API
***
