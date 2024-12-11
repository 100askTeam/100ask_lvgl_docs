.. _lv_tabview:

===============================
Tabview（选项卡） (lv_tabview)
===============================

Overview（概述）
******************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Tab view object can be used to organize content in tabs. The Tab
view is built from other widgets:

- Main container: :ref:`base_widget`
- Tab buttons: an :ref:`base_widget` with :ref:`lv_button`
- Container for the tabs: :ref:`base_widget`
- Content of the tabs: :ref:`base_widget`

The tab buttons can be positioned on the top, bottom, left and right
side of the Tab view.

A new tab can be selected either by clicking on a tab button or by
sliding horizontally on the content.

.. raw:: html

   </details> 
   <br>


Tabview（选项卡）对象可用于组织选项卡中的内容。选项卡对象是由其他控件组件而成的：

- 主容器：:ref:`base_widget`。
- 选项卡按钮：一个带有:ref:`lv_button`的:ref:`base_widget`。
- 选项卡的容器：:ref:`base_widget`。
- 选项卡的内容：:ref:`base_widget`。

选项卡栏可以位于选项卡控件的顶部、底部、左侧和右侧。

可以通过单击选项卡栏中的按钮或在选项卡标签上水平滑动来切换选项卡标签。


.. _lv_tabview_parts_and_styles:

Parts and Styles（部分和样式）
*******************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

There are no special parts on the Tab view but the :ref:`base_widget` and
:ref:`lv_button` widgets are used to create the Tab view.

.. raw:: html

   </details> 
   <br>


选项卡上没有特殊部分，但 :ref:`base_widget` 和 :ref:`lv_button` 控件用于创建选项卡。


.. _lv_tabview_usage:

Usage（用法）
***************

Create a Tab view（创建选项卡）
------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_tabview_create(parent)` creates a new empty Tab view.

.. raw:: html

   </details> 
   <br>


:cpp:expr:`lv_tabview_create(parent)` 创建一个新的空选项卡。


Add tabs（添加选项卡标签）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

New tabs can be added with :cpp:expr:`lv_tabview_add_tab(tabview, "Tab name")`.
This will return a pointer to a :ref:`base_widget` where
the tab's content can be created.

.. raw:: html

   </details> 
   <br>


可以使用函数 :cpp:expr:`lv_tabview_add_tab(tabview, "Tab name")` 添加一个新的选项卡标签。 这将返回一个指向:ref:`base_widget`的指针，可在该部件上创建选项卡的内容。


Rename tabs（重命名选项卡标签）
-------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

A tab can be renamed with
:cpp:expr:`lv_tabview_rename_tab(tabview, tab_id, "New Name")`.

.. raw:: html

   </details> 
   <br>


可以使用函数 :cpp:expr:`lv_tabview_rename_tab(tabview, tab_id, "New Name")` 重命名选项卡标签。


Change tab（切换选项卡标签）
-----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>


To select a new tab you can:

- Click on its tab button
- Slide horizontally
- Use :cpp:expr:`lv_tabview_set_active(tabview, id, LV_ANIM_ON)` function

.. raw:: html

   </details> 
   <br>


可以通过下面的方式切换到其他选项卡标签：

- 单击其选项卡栏中的按钮
- 在选项卡标签中水平滑动
- 使用 :cpp:expr:`lv_tabview_set_active(tabview, id, LV_ANIM_ON)` 函数


Set tab bar position（设置选项卡栏位置）
-----------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Using the :cpp:expr:`lv_tabview_set_tab_bar_position(tabview, LV_DIR_LEFT/RIGHT/TOP/BOTTOM)`
the tab bar can be moved to any sides.

.. raw:: html

   </details> 
   <br>


使用函数 :cpp:expr:`lv_tabview_set_tab_bar_position(tabview, LV_DIR_LEFT/RIGHT/TOP/BOTTOM)` 选项卡栏可以移动到任何一侧。


Set tab bar size（设置选项卡栏大小）
--------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The size of the tab bar can be adjusted by :cpp:expr:`lv_tabview_set_tab_bar_size(tabview, size)`
In case of vertical arrangement is means the height of the tab bar, and in horizontal
arrangement it means the width.

.. raw:: html

   </details> 
   <br>


选项卡栏的大小可以通过函数 :cpp:expr:`lv_tabview_set_tab_bar_size(tabview, size)` 来调整。对于参数 ``size`` ，如果选项卡栏是垂直摆放，则表示高度；如果选项卡栏是水平排列，则表示宽度。


Get the parts（获取部分）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

- :cpp:expr:`lv_tabview_get_content(tabview)` returns the container for tabs content
- :cpp:expr:`lv_tabview_get_tab_bar(tabview)` returns the container for tabs buttons

.. raw:: html

   </details> 
   <br>


- :cpp:expr:`lv_tabview_get_content(tabview)` 返回选项卡的主容器
- :cpp:expr:`lv_tabview_get_tab_bar(tabview)` 返回选项卡栏的容器


.. _lv_tabview_events:

Events（事件）
*****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` Sent when a new tab is selected by sliding
   or clicking the tab button. :cpp:expr:`lv_tabview_get_tab_active(tabview)`
   returns the zero based index of the current tab.

.. admonition::  Further Reading

    Learn more about :ref:`lv_obj_events` emitted by all Widgets.

    Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 通过滑动选项卡标签或单击选项栏按钮切换到新选项卡时发送。 :cpp:expr:`lv_tabview_get_tab_active(tabview)` 返回当前所在选项卡标签的索引（从零开始）。

了解更多关于所有部件发出的:ref:`lv_obj_events`（可参考对应引用内容）的相关内容。

了解更多关于:ref:`events`的相关内容。


.. _lv_tabview_keys:

Keys（按键）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Keys have effect only on the tab buttons.
Add manually to a group if required.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


按键仅对选项卡栏中的按钮有效。如果需要，请手动添加到组。

阅读了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_tabview_example:

Example
********

.. include:: ../examples/widgets/tabview/index.rst

.. _lv_tabview_api:


API
****
