.. _lv_list:

==============
List（列表） (lv_list)
==============

Overview
********

.. raw:: html

   <details>
     <summary>显示原文</summary>

The List Widget is basically a rectangle with vertical layout to which Buttons
and Text can be added.

.. raw:: html

   </details> 
   <br>


列表部件基本上是一个采用垂直布局的矩形，可向其中添加按钮和文本。


.. _lv_list_parts_and_styles:

Parts and Styles（部分和样式）
*****************************

**Background** （背景）

.. raw:: html

   <details>
     <summary>显示原文</summary>

- :cpp:enumerator:`LV_PART_MAIN` The main part of the List that uses all the typical background properties
- :cpp:enumerator:`LV_PART_SCROLLBAR` The scrollbar. See :ref:`base_widget`
  documentation for details.

**Buttons and Texts** 

- See the :ref:`Button <lv_button>`'s and :ref:`Label <lv_label>`'s documentation.

.. raw:: html

   </details> 
   <br>


- :cpp:enumerator:`LV_PART_MAIN` 列表的主体部分，会用到所有常见的背景属性。
- :cpp:enumerator:`LV_PART_SCROLLBAR` 滚动条。详情请参阅 :ref:`base_widget` 文档。

**按钮和文本** 请参阅 :ref:`Button <lv_button>` 和 :ref:`Label <lv_label>` 的文档。


.. _lv_list_usage:

Usage（用法）
*************

Buttons（按钮）
--------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_list_add_button(list, icon, text)` adds a full-width button with an icon
(that can be an image or symbol) and text.  This function returns a pointer to the
button created, which you can use to, for example, add an event call-back.

The text is scrolled horizontally if it is longer than the button.

.. raw:: html

   </details> 
   <br>


:cpp:expr:`lv_list_add_button(list, icon, text)`会添加一个带有图标（图标可以是图像或符号）和文本的全宽按钮。该函数会返回一个指向所创建按钮的指针，你可以利用这个指针（例如）添加一个事件回调函数。

如果文本长度超过按钮宽度，文本将会水平滚动。


Texts（文本）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_list_add_text(list, text)` adds a text string.  This function returns a
pointer to the label created, which you can use to, for example, change its text
with one of the ``lv_label_set_text...()`` functions.

.. raw:: html

   </details> 
   <br>


:cpp:expr:`lv_list_add_text(list, text)`用于添加一个文本字符串。该函数会返回一个指向所创建标签的指针，你可以利用这个指针（例如）通过某个 ``lv_label_set_text...()``函数来更改其文本内容。


.. _lv_list_events:

Events（事件）
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No special events are sent by List Widgets, but events can be sent by Buttons as usual.

.. admonition::  Further Reading

    Learn more about :ref:`lv_obj_events` emitted by all Widgets.

    Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


列表部件不会发送特殊事件，但按钮通常可以发送事件。

进一步了解所有部件发出的 :ref:`lv_obj_events`。

进一步了解 :ref:`events`。


.. _lv_list_keys:

Keys（按键）
***********

.. raw:: html

   <details>
     <summary>显示原文</summary>

No *Keys* are processed by List Widgets.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


列表部件不处理任何 *按键*。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_list_example:

Example
*******

.. include:: ../examples/widgets/list/index.rst

.. _lv_list_api:

API
***
