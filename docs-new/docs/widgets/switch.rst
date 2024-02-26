.. _lv_switch:

==========================
Switch （开关）(lv_switch)
==========================

Overview（概述）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Switch looks like a little slider and can be used to turn something
on and off.

.. raw:: html

   </details> 
   <br>


开关看起来像一个小滑块，开关的功能类似于按钮，也可以用来打开和关闭某些东西。


.. _lv_switch_parts_and_styles:

Parts and Styles（零件和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` The background of the switch uses all the typical
   background style properties. ``padding`` makes the indicator smaller
   in the respective direction.
-  :cpp:enumerator:`LV_PART_INDICATOR` The indicator that shows the current state of
   the switch. Also uses all the typical background style properties.
-  :cpp:enumerator:`LV_PART_KNOB` A rectangle (or circle) drawn at left or right side
   of the indicator. Also uses all the typical background properties to
   describe the knob(s). By default, the knob is square (with an
   optional corner radius) with side length equal to the smaller side of
   the slider. The knob can be made larger with the ``padding`` values.
   Padding values can be asymmetric too.

.. raw:: html

   </details> 
   <br>


开关包括以下3个零件：
 
-  :cpp:enumerator:`LV_PART_MAIN` 背景。 修改其 ``padding``会让下面的(指示器和旋钮)在相应方向上的大小发生变化。

-  :cpp:enumerator:`LV_PART_INDICATOR` 显示开关状态的指示器。

-  :cpp:enumerator:`LV_PART_KNOB` 在指标左侧或右侧的旋钮。 默认情况下，旋钮是圆形的，边长等于滑块的较小边。 可以修改 ``padding`` 值使旋钮变大，填充值可以是不对称的。


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
:cpp:expr:`lv_obj_remove_state(obj, LV_STATE_CHECKED)` to turn it off.

.. raw:: html

   </details> 
   <br>


当开关被打开时，开关的状态会变为 :cpp:enumerator:`LV_STATE_CHECKED` 。

要获取开关的当前状态（ ``true`` 处于打开状态），请使用 :cpp:expr:`lv_obj_has_state（obj，lv_state_CHECKED）`

调用 :cpp:expr:`lv_obj_add_state（obj，lv_state_CHECKED）`将其打开，或 :cpp:expr:`lv_obj_remove_state（obj，lv_state_CHECKED）`以将其关闭。


.. _lv_switch_events:

Events（事件）
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` Sent when the switch changes state.

See the events of the :ref:`Base object <lv_obj>` too.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


- 正常情况下，当开关被点击并且状态发生改变时，会触发 :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 事件类型。也就是说我们可以在 LV_EVENT_VALUE_CHANGED 事件类型中处理事件。

参见 :ref:`Base object <lv_obj>` 的事件。

详细了解更多 :ref:`事件`。


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

了解有关 :ref:`indev_按键`的更多信息。


.. _lv_switch_example:

Example
*******

.. include:: ../examples/widgets/switch/index.rst

.. _lv_switch_api:

API
***
