.. _lv_roller:

==========================
Roller （滚轮）(lv_roller)
==========================

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Roller allows you to simply select one option from a list by scrolling.

.. _lv_roller_parts_and_styles:

.. raw:: html

   </details> 
   <br>


滚轮类似下拉列表，和下拉列表不同的是，滚轮有直接可见的几个选项，我们可以通过滚动滚轮中的列表来浏览并选择选项。


Parts and Styles（部分和样式）
****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` The background of the roller uses all the typical
   background properties and text style properties.
   ``style_text_line_space`` adjusts the space between the options. When
   the Roller is scrolled and doesn't stop exactly on an option it will
   scroll to the nearest valid option automatically in ``anim_time``
   milliseconds as specified in the style.
-  :cpp:enumerator:`LV_PART_SELECTED` The selected option in the middle. Besides the
   typical background properties it uses the text style properties to
   change the appearance of the text in the selected area.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_PART_MAIN` 滚轮的背景使用了所有典型的背景属性和文本样式属性。 可以通过 ``style_text_line_space`` 调整选项之间的间隔。 当滚轮滚动并且没有完全停在一个选项上时，它将按照样式中指定的 ``anim_time`` 值(毫秒)自动滚动到前进方向最近的有效选项。
-  :cpp:enumerator:`LV_PART_SELECTED` 中间选中的选项。 除了典型的背景属性之外，它还使用文本样式属性来更改所选区域中文本的外观。


.. _lv_roller_usage:

Usage（用法）
************

Set options（设置选项）
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Options are passed to the Roller as a string with
:cpp:expr:`lv_roller_set_options(roller, options, LV_ROLLER_MODE_NORMAL)`.
The options should be separated by ``\n``. For example:
``"First\nSecond\nThird"``.

:cpp:enumerator:`LV_ROLLER_MODE_INFINITE` makes the roller circular.

You can select an option manually with
:cpp:expr:`lv_roller_set_selected(roller, id, LV_ANIM_ON)`,
where *id* is the index of an option.

.. raw:: html

   </details> 
   <br>


可以通过这个函数 :cpp:expr:`lv_roller_set_options(roller, options, LV_ROLLER_MODE_NORMAL)` 设置 Roller 中的选项。 选项之间要用 ``\n`` 分隔。 例如： ``"First\nSecond\nThird"``。

参数 :cpp:enumerator:`LV_ROLLER_MODE_NORMAL` 是设置为正常模式（滚轮在选项结束时结束）
参数 :cpp:enumerator:`LV_ROLLER_MODE_INFINITE` 是设置为无限模式（滚轮可以一直滚动）

可以使用 :cpp:expr:`lv_roller_set_selected(roller, id, LV_ANIM_ON)` 手动选中一个选项，其中 *id* 是选项的索引，选项从 0 开始索引。


Get selected option（获取选中的选项）
------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To get the *index* of the currently selected option use :cpp:expr:`lv_roller_get_selected(roller)`.

:cpp:expr:`lv_roller_get_selected_str(roller, buf, buf_size)` will copy the name of the selected option to ``buf``.

.. raw:: html

   </details> 
   <br>


要获取所选中的选项的索引(index) ，可以使用函数 :cpp:expr:`lv_roller_get_selected(roller)`。

函数 :cpp:expr:`lv_roller_get_selected_str(roller, buf, buf_size)` 会将所选选项的内容复制到 ``buf``


Visible rows（可见行）
---------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The number of visible rows can be adjusted with :cpp:expr:`lv_roller_set_visible_row_count(roller, num)`.

This function calculates the height with the current style. If the font,
line space, border width, etc. of the roller changes this function needs
to be called again.

.. raw:: html

   </details> 
   <br>


可见行数可以通过 :cpp:expr:`lv_roller_set_visible_row_count(roller, num)` 进行调整。

此函数会根据滚轮当前样式的高度（字体、行距、边框宽度等）进行调整。如果滚轮的字体、行距、边框宽度等发生变化，则需要再次调用此函数对齐重新进行调整。


.. _lv_roller_events:

Events（事件）
******

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` Sent when a new option is selected.

See the events of the :ref:`Base object <lv_obj>` too.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


- 在选中选项时会触发 :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 事件（按照逻辑来说只要你滚动了滚轮中的选项都会触发此事件类型）。

可以参考 :ref:`基本对象 <lv_obj>` 的事件。

详细了解更多 :ref:`events`。


.. _lv_roller_keys:

Keys（按键）
***********

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  ``LV_KEY_RIGHT/DOWN`` Select the next option
-  ``LV_KEY_LEFT/UP`` Select the previous option
-  :cpp:enumerator:`LY_KEY_ENTER` Apply the selected option (Send :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` event)

.. raw:: html

   </details> 
   <br>


-  ``LV_KEY_RIGHT/DOWN`` 选择下一个选项
-  ``LV_KEY_LEFT/UP`` 选择上一个选项
-  :cpp:enumerator:`LY_KEY_ENTER` 应用选择的选项（发送 :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 事件）

使用编码器控制时要注意有两种模式：导航模式和编辑模式

.. _lv_roller_example:

Example
*******

.. include:: ../examples/widgets/roller/index.rst

.. _lv_roller_api:

API
***
