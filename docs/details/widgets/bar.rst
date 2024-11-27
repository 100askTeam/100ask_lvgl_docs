.. _lv_bar:

============
Bar （进度条）(lv_bar)
============

Overview（概述）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The bar object has a background and an indicator on it. The width of the
indicator is set according to the current value of the bar.

Vertical bars can be created if the width of the object is smaller than
its height.

Not only the end, but also the start value of the bar can be set, which
changes the start position of the indicator.

.. raw:: html

   </details> 
   <br>


进度条对象有一个背景，并且上面有一个指示器。指示器的宽度根据进度条的当前值自动设置。

如果设置进度条的宽度小于其高度，就可以创建出垂直摆放的进度条。

不仅可以设置进度条的结束值，还可以设置进度条的起始值，从而改变指示器的起始位置。


.. _lv_bar_parts_and_styles:

Parts and Styles（零件和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` The background of the bar and it uses the typical
   background style properties. Adding padding makes the indicator
   smaller or larger. The ``anim_time`` style property sets the
   animation time if the values set with :cpp:enumerator:`LV_ANIM_ON`.
-  :cpp:enumerator:`LV_PART_INDICATOR` The indicator itself; also uses all the typical
   background properties.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_PART_MAIN` 进度条的背景，它使用典型的背景样式属性。增加内边距会使指示器更小或更大。如果值设置为  :cpp:enumerator:`LV_ANIM_ON`，则可以继续通过设置 ``anim_time`` 样式属性设置动画的时间。
-  :cpp:enumerator:`LV_PART_INDICATOR` 指示器本身;也使用了所有典型的背景属性。


.. _lv_bar_usage:

Usage（用法）
************

Value and range（值和范围）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

A new value can be set by
``lv_bar_set_value(bar, new_value, LV_ANIM_ON/OFF)``. The value is
interpreted in a range (minimum and maximum values) which can be
modified with :cpp:expr:`lv_bar_set_range(bar, min, max)`. The default range is
0..100, and the default drawing direction is from left to right in horizontal mode and
bottom to top in vertical mode. If the minimum value is greater than the maximum value, like
100..0, the drawing direction changes to the opposite direction.

The new value in :cpp:func:`lv_bar_set_value` can be set with or without an
animation depending on the last parameter (``LV_ANIM_ON/OFF``).

.. raw:: html

   </details> 
   <br>


可以通过 ``lv_bar_set_value(bar, new_value, LV_ANIM_ON/OFF)`` 设置新值。值在范围（最小值和最大值）中解读，该范围可以使用 :cpp:expr:`lv_bar_set_range(bar, min, max)` 修改。默认范围为 0..100，默认绘制方向为水平模式下从左到右和垂直模式下从下到上。如果最小值大于最大值，例如 100..0，绘图方向变为相反方向。

使用 :cpp:func:`lv_bar_set_value` 设置的新值可以通过其最后的一个参数 (LV_ANIM_ON/OFF) 来决定是否设置动画。

Modes（模式）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The bar can be one of the following modes:

- :cpp:enumerator:`LV_BAR_MODE_NORMAL` A normal bar as described above
- :cpp:enumerator:`LV_BAR_MODE_SYMMETRICAL` Draw the indicator from the zero value to current value. Requires a negative
  minimum range and positive maximum range.
- :cpp:enumerator:`LV_BAR_MODE_RANGE` Allows setting the start value too by
  ``lv_bar_set_start_value(bar, new_value, LV_ANIM_ON/OFF)``. The start
  value always has to be smaller than the end value.

.. raw:: html

   </details> 
   <br>


该进度条可以是以下模式之一：

- :cpp:enumerator:`LV_BAR_MODE_NORMAL` 如上所述的普通进度条(默认)
- :cpp:enumerator:`LV_BAR_MODE_SYMMETRICAL` 将指示器从零值绘制为当前值。需要一个负的最小范围和正的最大范围。
- :cpp:enumerator:`LV_BAR_MODE_RANGE` 这个模式下也可以指定负的最小范围。这样进度条的起始值可以不是0，而是你指定的数值(参考示例)，但是这样设置的起始值 ``lv_bar_set_start_value(bar, new_value, LV_ANIM_ON/OFF)`` 必须小于结束值。


.. _lv_bar_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

See the events of the :ref:`Base object <lv_obj>` too.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


另请参阅 :ref:`Base 对象 <lv_obj>` 的事件。

详细了解 :ref:`events`。


.. _lv_bar_keys:

Keys（按键）
***********

.. raw:: html

   <details>
     <summary>显示原文</summary>

No *Keys* are processed by the object type.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


对象类型不处理任何 *按键*。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_bar_example:

Example
*******

.. include:: ../examples/widgets/bar/index.rst

.. _lv_bar_api:

API
***
