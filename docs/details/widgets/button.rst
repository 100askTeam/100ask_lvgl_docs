.. _lv_button:

==========================
Button（按钮） (lv_button)
==========================

Overview（概述）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Buttons have no new features compared to the :ref:`base_widget`.
They are useful for semantic purposes and have slightly different default settings.

Buttons, by default, differ from Base Widget in the following ways:

- Not scrollable
- Added to the default group
- Default height and width set to :cpp:enumerator:`LV_SIZE_CONTENT`

.. raw:: html

   </details> 
   <br>


与:ref:`base_widget`相比，按钮没有新增功能。
它们在语义层面上有用处，且默认设置略有不同。

默认情况下，按钮与基础部件在以下方面存在差异：

不可滚动；
被添加到默认组；
默认高度和宽度设置为:cpp:enumerator:`LV_SIZE_CONTENT`


.. _lv_button_parts_and_styles:

Parts and Styles（零件和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` The background of the button; uses the typical
   background style properties.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_PART_MAIN` 按钮的背景。使用典型的背景样式属性。


.. _lv_button_usage:

Usage（用法）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

There are no new features compared to :ref:`Base Widget <base_widget>`.

.. raw:: html

   </details> 
   <br>

与 :ref:`Base Widget <base_widget>` 相比，没有新功能。


.. _lv_button_events:

Events（事件）
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` when the :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` flag is
   enabled and the Widget is clicked. The event happens on transition
   to/from the checked state.

.. admonition::  Further Reading

    Learn more about :ref:`lv_obj_events` emitted by all Widgets.

    Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


- 如果打开了  :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE`  ，当部件被点击时有选中切换(Toggle)状态的效果，并且可以在 :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 事件类型中处理事件。

了解更多关于所有部件发出的:ref:`lv_obj_events` 的信息。

了解更多关于:ref:`events`的信息。


.. _lv_button_keys:

Keys（按键）
***********

.. raw:: html

   <details>
     <summary>显示原文</summary>

Note that the state of :cpp:enumerator:`LV_KEY_ENTER` is translated to
:cpp:enumerator:`LV_EVENT_PRESSED`, :cpp:enumerator:`LV_EVENT_PRESSING`
and :cpp:enumerator:`LV_EVENT_RELEASED` etc.

.. admonition::  Further Reading

    Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


请注意， :cpp:enumerator:`LV_KEY_ENTER` 的状态被转换为 :cpp:enumerator:`LV_EVENT_PRESSED`, :cpp:enumerator:`LV_EVENT_PRESSING` 和 :cpp:enumerator:`LV_EVENT_RELEASED` 等。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_button_example:

Example
*******

.. include:: ../examples/widgets/button/index.rst

.. _lv_button_api:

API
***
