.. _lv_slider:

============================
Slider （滑动条）(lv_slider)
============================

Overview（概述）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Slider Widget looks like a :ref:`lv_bar` supplemented with
a knob. The knob can be dragged to set the Slider's value. Like Bar, a Slider
can be vertical or horizontal.

.. raw:: html

   </details> 
   <br>


滑块部件（Slider Widget）看起来就像是添加了一个旋钮的 :ref:`lv_bar`。可以拖动旋钮来设置滑块的值。和进度条（Bar）一样，滑块可以是垂直方向的，也可以是水平方向的。

.. _lv_slider_parts_and_styles:

Parts and Styles（零件和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` The background of the Slider. Uses the
   :ref:`typical background style properties <typical bg props>`. ``padding`` makes
   the indicator smaller in the respective direction.
-  :cpp:enumerator:`LV_PART_INDICATOR` The indicator that shows the current state of
   the Slider; also uses the :ref:`typical background style properties <typical bg props>`.
-  :cpp:enumerator:`LV_PART_KNOB` A rectangle (or circle) drawn at the current value;
   also uses the :ref:`typical background style properties <typical bg props>` to
   describe the knob(s).  By default, the knob is round (radius-style can modify this)
   with side length equal to the smaller dimension of the Slider.  The knob can be
   made larger with the ``padding`` values.  Padding values can be asymmetric as well.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_PART_MAIN` 滑块的背景。使用:ref:`typical background style properties <typical bg props>`典型的背景样式属性。 ``padding`` 属性会使指示器在相应方向上变小。
-  :cpp:enumerator:`LV_PART_INDICATOR` 用于显示滑块当前状态的指示器，同样使用:ref:`typical background style properties <typical bg props>`典型的背景样式属性。
-  :cpp:enumerator:`LV_PART_KNOB` 在当前值位置绘制的一个矩形（或圆形），也使用:ref:`typical background style properties <typical bg props>`典型的背景样式属性来描述旋钮。默认情况下，旋钮是圆形的（半径样式可对此进行修改），其边长等于滑块较小的那个尺寸。可以通过 ``padding`` 值使旋钮变大。内边距的值也可以是非对称的。


.. _lv_slider_usage:

Usage（用法）
************

Value, range and orientation(值、范围和方向）
--------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Once a Slider is created, it has:

- value == 0
- default range of [0..100],
- horizontal orientation, with
- default width of approximately 2 inches (according to configured value of :c:macro:`LV_DPI_DEF`),
- default hight of approximately 1/10 inch (according to configured value of :c:macro:`LV_DPI_DEF`).

To set a different value use:

- :cpp:expr:`lv_slider_set_value(slider, new_value, LV_ANIM_ON/OFF)` (animation time
  is set by the styles' ``anim_time`` property);
- :cpp:expr:`lv_slider_set_range(slider, min , max)`; and
- for orientation, width and height, simply set width and height style properties;
- :cpp:expr:`lv_bar_set_orientation(slider, orientation)` to override orientation
  caused by ``width`` and ``height``.  Valid values for ``orientation`` are:

  - LV_BAR_ORIENTATION_AUTO,
  - LV_BAR_ORIENTATION_HORIZONTAL,
  - LV_BAR_ORIENTATION_VERTICAL.

The default drawing direction is from left to right in horizontal orientation and
bottom to top in vertical orientation.  If the minimum value is set to be greater
than the maximum value (e.g. [100..0]), the drawing direction is reversed.

.. raw:: html

   </details> 
   <br>


一旦创建了一个滑块（Slider），它具有以下属性：

- 值（value）等于 0；
- 默认范围是 [0..100]；
- 水平方向，且
- 默认宽度大约为 2 英寸（依据 LV_DPI_DEF（C 语言宏）配置的值而定），
- 默认高度大约为 1/10 英寸（依据 LV_DPI_DEF（C 语言宏）配置的值而定）。

若要设置不同的值，可使用以下方法：

- :cpp:expr:`lv_slider_set_value(slider, new_value, LV_ANIM_ON/OFF)`（动画时间由样式的 ``anim_time`` 属性设置）；
- :cpp:expr:`lv_slider_set_range(slider, min , max)`；以及
对于方向、宽度和高度，只需设置宽度和高度样式属性即可；
- :cpp:expr:`lv_bar_set_orientation(slider, orientation)`可覆盖由 ``width`` 和 ``height`` 所决定的方向。 ``orientation`` 的有效值如下：
 
  - LV_BAR_ORIENTATION_AUTO,
  - LV_BAR_ORIENTATION_HORIZONTAL,
  - LV_BAR_ORIENTATION_VERTICAL.

默认的绘制方向在水平方向上是从左到右，在垂直方向上是从下到上。如果最小值被设置得大于最大值（例如 [100..0]），那么绘制方向将会反转。

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
