.. _lv_list:

==============
List (lv_list)
==============

Overview
********

.. raw:: html

   <details>
     <summary>显示原文</summary>

The List is basically a rectangle with vertical layout to which Buttons
and Texts can be added

.. raw:: html

   </details> 
   <br>


列表基本上是一个垂直布局的矩形，按钮指向该矩形和可以添加文本。


.. _lv_list_parts_and_styles:

Parts and Styles（零件和样式）
*****************************

**Background** （背景）

.. raw:: html

   <details>
     <summary>显示原文</summary>

- :cpp:enumerator:`LV_PART_MAIN` The main part of the list that uses all the typical background properties
- :cpp:enumerator:`LV_PART_SCROLLBAR` The scrollbar. See the :ref:`Base objects <lv_obj>` documentation for details.

**Buttons and Texts** See the :ref:`Button <lv_button>`\ 's and :ref:`Label <lv_label>`\ 's documentation.

.. raw:: html

   </details> 
   <br>


- :cpp:enumerator:`LV_PART_MAIN` 使用所有典型背景属性的列表的主要部分
- :cpp:enumerator:`LV_PART_SCROLLBAR` 滚动条。有关详细信息，请参阅 :ref:`基本对象 <lv_obj>` 文档。

**按钮和文本** 请参阅 :ref:`按钮 <lv_button>`\ 和 :ref:`标签 <lv_label>`\ 的文档。


.. _lv_list_usage:

Usage（用法）
*************

Buttons（按钮）
--------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_list_add_button(list, icon, text)` adds a full-width button with an icon

- that can be an image or symbol
- and a text.

The text starts to scroll horizontally if it's too long.

.. raw:: html

   </details> 
   <br>


:cpp:expr:`lv_list_add_button(list, icon, text)` 添加一个带有图标的全角按钮

- 可以是图像或符号
- 和文本。

如果文本太长，文本将开始水平滚动。


Texts（文本）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_list_add_text(list, text)` adds a text.

.. raw:: html

   </details> 
   <br>


:cpp:expr:`lv_list_add_text(list, text)` 添加文本。


.. _lv_list_events:

Events（事件）
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No special events are sent by the List, but sent by the Button as usual.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


列表不会发送任何特殊事件，但会像往常一样由按钮发送。

详细了解更多 :ref:`events`。


.. _lv_list_keys:

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


.. _lv_list_example:

Example
*******

.. include:: ../examples/widgets/list/index.rst

.. _lv_list_api:

API
***
