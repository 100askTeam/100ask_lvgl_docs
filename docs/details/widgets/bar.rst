.. _lv_bar:

======================
Bar （进度条）(lv_bar)
======================

Overview（概述）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The bar Widget has a background and an indicator. The length of the
indicator against the background indicates the bar's current value.

Vertical bars can be created if the width of the Widget is smaller than
its height.

Both the start and end values of the bar can be set.  Changing the start value to a
value other than the minimum value in its range changes the start position of the indicator.


.. raw:: html

   </details> 
   <br>


进度条部件有一个背景和一个指示器。指示器相对于背景的长度显示了进度条的当前值。

如果部件的宽度小于其高度，就可以创建垂直的进度条。

进度条的起始值和终止值都可以设置。将起始值更改为其取值范围内除最小值之外的其他值，会改变指示器的起始位置。


.. _lv_bar_parts_and_styles:

Parts and Styles（零件和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` The bar's background.  It uses the typical
   background style properties. Adding padding makes the indicator
   smaller or larger. The ``anim_time`` style property sets the
   animation time if the values set with :cpp:enumerator:`LV_ANIM_ON`.
-  :cpp:enumerator:`LV_PART_INDICATOR` The bar's indicator; also uses all the typical
   background properties.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_PART_MAIN`：进度条的背景。它使用典型的背景样式属性。添加内边距会使指示器变小或变大。如果通过 :cpp:enumerator:LV_ANIM_ON 设置了相关值，那么 anim_time 样式属性会设置动画时间。
-  :cpp:enumerator:`LV_PART_INDICATOR`：进度条的指示器；同样也使用所有典型的背景属性。


.. _lv_bar_usage:

Usage（用法）
************

Orientation and size（方向与尺寸）
----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

- for orientation, width and height, simply set width and height style properties;
- :cpp:expr:`lv_bar_set_orientation(slider, orientation)` to override orientation
  caused by ``width`` and ``height``.  Valid values for ``orientation`` are:

  - LV_BAR_ORIENTATION_AUTO,
  - LV_BAR_ORIENTATION_HORIZONTAL,
  - LV_BAR_ORIENTATION_VERTICAL.

.. raw:: html

   </details> 
   <br>

对于方向、宽度和高度，只需设置宽度和高度样式属性即可；

可使用 :cpp:expr:`lv_bar_set_orientation(slider, orientation)` 来覆盖由 “宽度” 和 “高度” 所决定的方向。``orientation``（方向）的有效值如下：

  - LV_BAR_ORIENTATION_AUTO 自动方向

  - LV_BAR_ORIENTATION_HORIZONTAL 水平方向

  - LV_BAR_ORIENTATION_VERTICAL 垂直方向

Value and range（值和范围）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

A new value can be set with
:cpp:expr:`lv_bar_set_value(bar, new_value, LV_ANIM_ON/OFF)`. The value is
interpreted in a range (minimum and maximum values) which can be
modified with :cpp:expr:`lv_bar_set_range(bar, min, max)`. The default range is
0..100, and the default drawing direction is from left to right in horizontal mode and
bottom to top in vertical mode. If the minimum value is greater than the maximum value, like
100..0, the drawing direction is reversed.

The new value in :cpp:func:`lv_bar_set_value` can be set with or without an
animation depending on the last parameter (``LV_ANIM_ON/OFF``).

.. raw:: html

   </details> 
   <br>


可以使用 :cpp:expr:`lv_bar_set_value(bar, new_value, LV_ANIM_ON/OFF)` 来设置一个新值。该值是在一个取值范围（最小值和最大值）内进行解读的，这个取值范围可以通过 :cpp:expr:`lv_bar_set_range(bar, min, max)` 来修改。默认的取值范围是 0 到 100，并且默认的绘制方向在水平模式下是从左到右，在垂直模式下是从下到上。如果最小值大于最大值，比如 100 到 0，那么绘制方向就会反转。
在函数 :cpp:func:`lv_bar_set_value` 中设置新值时，可以根据最后一个参数（LV_ANIM_ON/OFF）来决定是否带有动画效果。

Modes（模式）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The bar can be one of the following modes:

- :cpp:enumerator:`LV_BAR_MODE_NORMAL` A normal bar as described above
- :cpp:enumerator:`LV_BAR_MODE_SYMMETRICAL` Draws indicator from zero value to current value. Requires a negative
  minimum value and positive maximum value, e.g. [-100..100].
- :cpp:enumerator:`LV_BAR_MODE_RANGE` Allows setting the start value as well with
  :cpp:expr:`lv_bar_set_start_value(bar, new_value, LV_ANIM_ON/OFF)`. The start
  value must be smaller than the end value.

.. raw:: html

   </details> 
   <br>


该进度条可以是以下模式之一：

- :cpp:enumerator:`LV_BAR_MODE_NORMAL` 常规模式 如上文所述的常规进度条。
- :cpp:enumerator:`LV_BAR_MODE_SYMMETRICAL` 对称模式 从零值绘制指示器到当前值。需要一个负的最小值和正的最大值，例如 [-100..100]。
- :cpp:enumerator:`LV_BAR_MODE_RANGE` 范围模式 允许使用 :cpp:expr:`lv_bar_set_start_value(bar, new_value, LV_ANIM_ON/OFF)` 来设置起始值。起始值必须小于终止值。


.. _lv_bar_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No special events are sent by Bar Widgets.

.. admonition::  Further Reading

    Learn more about :ref:`lv_obj_events` emitted by all Widgets.

    Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>

进度条部件不会发送任何特殊事件。

了解更多关于所有部件发出的 :ref:`lv_obj_events`的信息。

了解更多关于 :ref:`events` 的内容。


.. _lv_bar_keys:

Keys（按键）
***********

.. raw:: html

   <details>
     <summary>显示原文</summary>

No *Keys* are processed by Bar Widgets.

.. admonition::  Further Reading

    Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


进度条部件不处理任何 “按键” 操作。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_bar_example:

Example
*******

.. include:: ../examples/widgets/bar/index.rst

.. _lv_bar_api:

API
***
