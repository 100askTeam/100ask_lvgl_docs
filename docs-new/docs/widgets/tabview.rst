.. _lv_tabview:

====================
Tabview (lv_tabview)
====================

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Tab view object can be used to organize content in tabs. The Tab
view is built from other widgets:

- Main container: :ref:`lv_obj`
- Tab buttons: an :ref:`lv_obj` with :ref:`lv_obj` 
- Container for the tabs: :ref:`lv_obj`
- Content of the tabs: :ref:`lv_obj`

The tab buttons can be positioned on the top, bottom, left and right
side of the Tab view.

A new tab can be selected either by clicking on a tab button or by
sliding horizontally on the content.

.. raw:: html

   </details> 
   <br>


选项卡视图对象可用于组织选项卡中的内容。选项卡 视图是从其他小部件构建的：

- 主容器：:ref:`lv_obj`
- 选项卡按钮：带有 :ref:`lv_obj` 的 :ref:`lv_obj` 
- 选项卡的容器 :ref:`lv_obj`
- 选项卡内容： :ref:`lv_obj`

选项卡按钮可以位于顶部、底部、左侧和右侧 选项卡视图的一侧。

可以通过单击选项卡按钮或通过以下方式选择新选项卡 在内容上水平滑动。


.. _lv_tabview_parts_and_styles:

Parts and Styles（零件和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

There are no special parts on the Tab view but the ``lv_obj`` and
``lv_button`` widgets are used to create the Tab view.

.. raw:: html

   </details> 
   <br>


选项卡视图上没有特殊部件，但 ``lv_obj`` 和 ``lv_button``  小部件用于创建选项卡视图。


.. _lv_tabview_usage:

Usage（用法）
*************

Create a Tab view（创建选项卡视图）
----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_tabview_create(parent)` creates a new empty Tab view.

.. raw:: html

   </details> 
   <br>


:cpp:expr:`lv_tabview_create(parent)` 创建一个新的空 Tab 视图。


Add tabs（添加选项卡）
---------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

New tabs can be added with :cpp:expr:`lv_tabview_add_tab(tabview, "Tab name")`.
This will return a pointer to an :ref:`lv_obj` object where
the tab's content can be created.

.. raw:: html

   </details> 
   <br>


可以使用 :cpp:expr:`lv_tabview_add_tab(tabview, "Tab name")`添加新选项卡。 这将返回指向 :ref:`lv_obj` 对象的指针，其可以创建选项卡的内容。


Rename tabs（重命名选项卡）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

A tab can be renamed with
:cpp:expr:`lv_tabview_rename_tab(tabview, tab_id, "New Name")`.

.. raw:: html

   </details> 
   <br>


可以使用 :cpp:expr:`lv_tabview_rename_tab(tabview, tab_id, "New Name")` 重命名选项卡。


Change tab（“更改”选项卡）
-------------------------

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


要选择新选项卡，您可以：

- 单击其选项卡按钮

- 水平滑动

- 使用 :cpp:expr:`lv_tabview_set_active(tabview, id, LV_ANIM_ON)` 函数


Set tab bar position（设置选项卡栏位置）
-------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Using the :cpp:expr:`lv_tabview_set_tab_bar_position(tabview, LV_DIR_LEFT/RIGHT/TOP/BOTTOM)`
the tab bar can be moved to any sides.

.. raw:: html

   </details> 
   <br>


使用 :cpp:expr:`lv_tabview_set_tab_bar_position(tabview, LV_DIR_LEFT/RIGHT/TOP/BOTTOM)` 选项卡栏可以移动到任何一侧。


Set tab bar size（设置选项卡栏大小）
-----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The size of the tab bar can be adjusted by :cpp:expr:`lv_tabview_set_tab_bar_size(tabview, size)`
In case of vertical arrangement is means the height of the tab bar, and in horizontal
arrangement it means the width.

.. raw:: html

   </details> 
   <br>


选项卡栏的大小可以通过 :cpp:expr:`lv_tabview_set_tab_bar_size(tabview, size)` 来调整，如果是垂直排列，则是指标签栏的高度，并且在水平排列它意味着宽度。


Get the parts（获取零件）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

- :cpp:expr:`lv_tabview_get_content(tabview)` returns the container for tabs content
- :cpp:expr:`lv_tabview_get_tab_bar(tabview)` returns the container for tabs buttons

.. raw:: html

   </details> 
   <br>


- :cpp:expr:`lv_tabview_get_content(tabview)` 返回选项卡内容的容器
- :cpp:expr:`lv_tabview_get_tab_bar(tabview)` 返回选项卡按钮的容器


.. _lv_tabview_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` Sent when a new tab is selected by sliding
   or clicking the tab button. :cpp:expr:`lv_tabview_get_tab_active(tabview)`
   returns the zero based index of the current tab.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 通过滑动选择新选项卡时发送或单击选项卡按钮。 :cpp:expr:`lv_tabview_get_tab_active(tabview)`返回当前选项卡从零开始的索引。

详细了解更多 :ref:`事件`。


.. _lv_tabview_keys:

Keys（按键）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Keys have effect only on the tab buttons.
Add manually to a group if required.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


按键仅对 Tab 键有效。 如果需要，请手动添加到组。

了解有关 :ref:`indev_按键` 的更多信息。


.. _lv_tabview_example:

Example
*******

.. include:: ../examples/widgets/tabview/index.rst

.. _lv_tabview_api:

API
***
