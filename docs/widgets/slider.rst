.. _lv_slider:

============================
Slider （滑动条）(lv_slider)
============================

Overview（概述）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Slider object looks like a `Bar </widgets/bar>`__ supplemented with
a knob. The knob can be dragged to set a value. Just like Bar, Slider
can be vertical or horizontal.

.. raw:: html

   </details> 
   <br>


滑动条对象看起来像是在 `进度条 </widgets/bar>`__  增加了一个可以调节的旋钮，使用时可以通过拖动旋钮来设置一个值。 就像进度条(bar)一样，Slider可以是垂直的或水平的(当设置进度条的宽度小于其高度，就可以创建出垂直摆放的滑动条)。


.. _lv_slider_parts_and_styles:

Parts and Styles（零件和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` The background of the slider. Uses all the typical
   background style properties. ``padding`` makes the indicator smaller
   in the respective direction.
-  :cpp:enumerator:`LV_PART_INDICATOR` The indicator that shows the current state of
   the slider. Also uses all the typical background style properties.
-  :cpp:enumerator:`LV_PART_KNOB` A rectangle (or circle) drawn at the current value.
   Also uses all the typical background properties to describe the
   knob(s). By default, the knob is square (with an optional corner
   radius) with side length equal to the smaller side of the slider. The
   knob can be made larger with the ``padding`` values. Padding values
   can be asymmetric too.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_PART_MAIN` 滑动条的背景。 使用所有典型的背景样式属性。 设置 ``padding`` 样式会使指标在相应方向上变小。
-  :cpp:enumerator:`LV_PART_INDICATOR` 显示滑动条当前状态的指示器。 也是使用所有典型的背景样式属性。
-  :cpp:enumerator:`LV_PART_KNOB` 旋钮(可以是原形或矩形)。 也是使用所有典型的背景属性。 默认情况下，旋钮是方形的（带有可选的圆角半径），边长等于滑动条的较小边。 可以通过设置 ``padding`` 样式调整旋钮的大小。 填充值也可以是不对称的。


.. _lv_slider_usage:

Usage（用法）
************

Value and range（值和范围）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To set an initial value use :cpp:expr:`lv_slider_set_value(slider, new_value, LV_ANIM_ON/OFF)`. The
animation time is set by the styles' ``anim_time`` property.

To specify the range (min, max values), :cpp:expr:`lv_slider_set_range(slider, min , max)` can be used.
The default range is 0..100, and the default drawing direction is from left to right in horizontal mode and
bottom to top in vertical mode. If the minimum value is greater than the maximum value, like
100..0, the drawing direction changes to the opposite direction.

.. raw:: html

   </details> 
   <br>


要设置滑动条的初始值，请使用 :cpp:expr:`lv_slider_set_value(slider, new_value, LV_ANIM_ON/OFF)`。 动画时间由样式的 ``anim_time`` 属性设置。

要指定滑动条的范围（最小值、最大值），可以使用 :cpp:expr:`lv_slider_set_range(slider, min , max)` 。默认范围为 0..100，在水平模式下默认绘制方向为从左到右，并且垂直模式下从下到上。如果最小值大于最大值，如100..0时，绘制方向变为相反的方向。


Modes（模式）
-----

.. raw:: html

   <details>
     <summary>显示原文</summary>

The slider can be one of the following modes:

- :cpp:enumerator:`LV_SLIDER_MODE_NORMAL` A normal slider as described above
- :cpp:enumerator:`LV_SLIDER_SYMMETRICAL` Draw the indicator form the zero value to
  current value. Requires negative minimum range and positive maximum range.
- :cpp:enumerator:`LV_SLIDER_RANGE` Allows setting the start value too by
  :cpp:expr:`lv_bar_set_start_value(bar, new_value, LV_ANIM_ON/OFF)`. The start
  value has to be always smaller than the end value.

The mode can be changed with :cpp:expr:`lv_slider_set_mode(slider, LV_SLIDER_MODE_...)`

.. raw:: html

   </details> 
   <br>


与bar类似，滑动条可以是以下模式之一：

- :cpp:enumerator:`LV_SLIDER_MODE_NORMAL` 像上面说的普通情况

- :cpp:enumerator:`LV_SLIDER_SYMMETRICAL` 这个模式下可以指定负的最小范围。但是只能从零值到当前值绘制指示器。

- :cpp:enumerator:`LV_SLIDER_RANGE` 在这个模式下也可以指定负的最小范围。这样滑动条的起始值可以不是0，使用 :cpp:expr:`lv_bar_set_start_value(bar, new_value, LV_ANIM_ON/OFF)` 设置起始值。要注意设置的起始值必须小于结束值。

可以使用 :cpp:expr:`lv_slider_set_mode(slider, LV_SLIDER_MODE_...)` 更改模式。


Knob-only mode（仅旋钮模式）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Normally, the slider can be adjusted either by dragging the knob, or by
clicking on the slider bar. In the latter case the knob moves to the
point clicked and slider value changes accordingly. In some cases it is
desirable to set the slider to react on dragging the knob only. This
feature is enabled by adding the :cpp:enumerator:`LV_OBJ_FLAG_ADV_HITTEST`:
:cpp:expr:`lv_obj_add_flag(slider, LV_OBJ_FLAG_ADV_HITTEST)`.

The extended click area (set by :cpp:expr:`lv_obj_set_ext_click_area(slider, value)`) increases to knob's click area.

.. raw:: html

   </details> 
   <br>


通常，可以通过拖动旋钮或单击滑动条来调整滑动条的值。 在后一种情况下，旋钮会移动到单击的点，指示器也会相应更改。在某些情况下，需要将滑动条设置为仅对拖动旋钮做出反应，可以通过添加 :cpp:enumerator:`LV_OBJ_FLAG_ADV_HITTEST` :cpp:expr:`lv_obj_add_flag(slider, LV_OBJ_FLAG_ADV_HITTEST)` 来启用此功能。

扩展的单击区域(由 :cpp:expr:`lv_obj_set_ext_click_area(slider, value)` 设置)增加到旋钮的单击区域。


.. _lv_slider_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` Sent while the slider is being dragged or
   changed with keys. The event is sent continuously while the slider is
   being dragged.
-  :cpp:enumerator:`LV_EVENT_RELEASED` Sent when the slider has just been released.

See the events of the `Bar </widgets/bar>`__ too.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 在拖动滑块或用键更改。当滑块处于被拖拽。

-  :cpp:enumerator:`LV_EVENT_RELEASED` 在刚刚释放滑块时发送。

也可以查看 `Bar </widgets/bar>`__ 的事件。

详细了解更多 :ref:`events`。


.. _lv_slider_keys:

Keys（按键）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  ``LV_KEY_UP/RIGHT`` Increment the slider's value by 1
-  ``LV_KEY_DOWN/LEFT`` Decrement the slider's value by 1

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


-  ``LV_KEY_UP/RIGHT`` 将滑动条的值增加 1
-  ``LV_KEY_DOWN/LEFT`` 将滑动条的值减 1

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_slider_example:

Example
*******

.. include:: ../examples/widgets/slider/index.rst

.. _lv_slider_api:

API
***
