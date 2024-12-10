.. _lv_switch:

==========================
Switch （开关）(lv_switch)
==========================

Overview（概述）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Switch Widgets look like little sliders and are used to display, and optionally
modify, a value that can be "on" or "off".

By default, a Switch is oriented horizontally.  It's orientation will be vertical
if you set ``width`` < ``height``.

.. raw:: html

   </details> 
   <br>


开关部件（Switch Widgets）看上去就像小型滑块，用于显示（并且可选择性地修改）一个可为 “开” 或 “关” 的数值。

默认情况下，开关是水平放置的。如果你将其 ``width`` 设置得小于 ``height``，那么它将会呈垂直放置状态。

.. _lv_switch_parts_and_styles:

Parts and Styles（部分和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` Switch's background; uses the :ref:`typical
   background style properties <typical bg props>`. ``padding`` makes the indicator smaller
   in the respective direction.
-  :cpp:enumerator:`LV_PART_INDICATOR` The indicator that shows the current state of
   the Switch; also uses the :ref:`typical background style properties <typical bg props>`.
-  :cpp:enumerator:`LV_PART_KNOB` A rectangle (or circle) drawn at the left or right
   side of the indicator; also uses the :ref:`typical background style properties
   <typical bg props>` to modify the knob's appearance. By default, the knob is round
   (radius-style can modify this) with diameter slightly smaller than the smaller
   side of the slider.  The knob can be made larger with the ``padding`` values.
   Padding values can be asymmetric as well.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_PART_MAIN`：开关的背景部分；使用:ref:`typical
   background style properties <typical bg props>`。 ``padding`` 属性可使指示器在相应方向上变小。
-  :cpp:enumerator:`LV_PART_INDICATOR`：用于显示开关当前状态的指示器部分；同样使用 :ref:`typical background style properties <typical bg props>`。
-  :cpp:enumerator:`LV_PART_KNOB` ：在指示器左侧或右侧绘制的一个矩形（或圆形）；也使用:ref:`typical background style properties
   <typical bg props>`来改变旋钮的外观。默认情况下，旋钮是圆形的（“半径样式（radius-style）”可对此进行修改），其直径略小于滑块较短的边。通过 ``padding``值可以将旋钮设置得更大。内边距的值也可以是非对称的。

.. _lv_switch_usage:

Usage（用法）
************

Change state（改变状态）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The switch uses the standard :cpp:enumerator:`LV_STATE_CHECKED` state.

To get the current state of the switch (with ``true`` being on), use
:cpp:expr:`lv_obj_has_state(obj, LV_STATE_CHECKED)`.

Call :cpp:expr:`lv_obj_add_state(obj, LV_STATE_CHECKED)` to turn it on, or
:cpp:expr:`lv_obj_remove_state(obj, LV_STATE_CHECKED)` to turn it off 
programmatically.

.. raw:: html

   </details> 
   <br>


当开关被打开时，开关的状态会变为 :cpp:enumerator:`LV_STATE_CHECKED` 。

要获取开关的当前状态（ ``true`` 处于打开状态），请使用 :cpp:expr:`lv_obj_has_state（obj，lv_state_CHECKED）`

调用 :cpp:expr:`lv_obj_add_state（obj，lv_state_CHECKED）` 手动将其打开，或 :cpp:expr:`lv_obj_remove_state（obj，lv_state_CHECKED）` 手动将其关闭。


Change orientation
------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Swith a Switch is created, its default orientation is
:cpp:enumerator:`LV_SWITCH_ORIENTATION_AUTO`, which causes it to be oriented based
on ``width`` and ``height``.  You can change this behavior using
:cpp:expr:`lv_switch_set_orientation(widget, orientation)`.  Possible values for
``orientation`` are:

- :cpp:enumerator:`LV_SWITCH_ORIENTATION_AUTO`
- :cpp:enumerator:`LV_SWITCH_ORIENTATION_HORIZONTAL`
- :cpp:enumerator:`LV_SWITCH_ORIENTATION_VERTICAL`

.. raw:: html

   </details> 
   <br>

当创建一个开关（Switch）时，它默认的方向是:cpp:enumerator:`LV_SWITCH_ORIENTATION_AUTO`，这使得它会根据 ``width`` 和 ``height`` 来确定方向。你可以使用:cpp:expr:`lv_switch_set_orientation(widget, orientation)`来改变这种行为。 ``orientation``可能的值如下：

- :cpp:enumerator:`LV_SWITCH_ORIENTATION_AUTO`
- :cpp:enumerator:`LV_SWITCH_ORIENTATION_HORIZONTAL`
- :cpp:enumerator:`LV_SWITCH_ORIENTATION_VERTICAL`

.. _lv_switch_events:

Events（事件）
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` Sent when Switch changes state.

.. admonition::  Further Reading

    Learn more about :ref:`lv_obj_events` emitted by all Widgets.

    Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


- 正常情况下，当开关被点击并且状态发生改变时，会触发 :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 事件类型。也就是说我们可以在 LV_EVENT_VALUE_CHANGED 事件类型中处理事件。

    进一步了解所有部件发出的:ref:`lv_obj_events`（对象事件）。
    
    深入学习有关:ref:`events`的更多内容。


.. _lv_switch_keys:

Keys（按键）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  ``LV_KEY_UP/RIGHT`` Turns on the slider
-  ``LV_KEY_DOWN/LEFT`` Turns off the slider
-  :cpp:enumerator:`LV_KEY_ENTER` Toggles the switch

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


-  ``LV_KEY_UP/RIGHT`` 开
-  ``LV_KEY_DOWN/LEFT`` 关
-  :cpp:enumerator:`LV_KEY_ENTER` 切换开关

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_switch_example:

Example
*******

.. include:: ../examples/widgets/switch/index.rst

.. _lv_switch_api:

API
***
