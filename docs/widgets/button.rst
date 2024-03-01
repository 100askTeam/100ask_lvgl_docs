.. _lv_button:

==========================
Button（按钮） (lv_button)
==========================

Overview（概述）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Buttons have no new features compared to the :ref:`Base object <lv_obj>`. They are useful for semantic purposes and have
slightly different default settings.

Buttons, by default, differ from Base object in the following ways: -
Not scrollable - Added to the default group - Default height and width
set to :cpp:enumerator:`LV_SIZE_CONTENT`

.. raw:: html

   </details> 
   <br>


与 :ref:`Base object <lv_obj>` 相比，按钮没有新功能。 它们可用于语义目的，并且默认设置略有不同。

默认情况下，按钮在以下方面与基础对象不同：

- 不可滚动
- 添加到默认组
- 默认高度和宽度设置为 :cpp:enumerator:`LV_SIZE_CONTENT`


.. _lv_button_parts_and_styles:

Parts and Styles（零件和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` The background of the button. Uses the typical
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

There are no new features compared to :ref:`Base object <lv_obj>`.

.. raw:: html

   </details> 
   <br>

与 :ref:`Base object <lv_obj>` 相比，没有新功能。


.. _lv_button_events:

Events（事件）
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` when the :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` flag is
   enabled and the object is clicked. The event happens on transition
   to/from the checked state.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


- 如果打开了  :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE`  ，当对象被点击时有选中切换(Toggle)状态的效果，并且可以在 :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 事件类型中处理事件。

详细了解更多 :ref:`events`。


.. _lv_button_keys:

Keys（按键）
***********

.. raw:: html

   <details>
     <summary>显示原文</summary>

Note that the state of :cpp:enumerator:`LV_KEY_ENTER` is translated to
:cpp:enumerator:`LV_EVENT_PRESSED`, :cpp:enumerator:`LV_EVENT_PRESSING`
and :cpp:enumerator:`LV_EVENT_RELEASED` etc.

See the events of the :ref:`Base object <lv_obj>` too.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


请注意， :cpp:enumerator:`LV_KEY_ENTER` 的状态被转换为 :cpp:enumerator:`LV_EVENT_PRESSED`, :cpp:enumerator:`LV_EVENT_PRESSING` 和 :cpp:enumerator:`LV_EVENT_RELEASED` 等。

参见 :ref:`Base object <lv_obj>` 的事件。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_button_example:

Example
*******

.. include:: ../examples/widgets/button/index.rst

.. _lv_button_api:

API
***
