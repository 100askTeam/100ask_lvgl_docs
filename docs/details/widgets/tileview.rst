.. _lv_tileview:

====================================
Tile view（平铺视图） (lv_tileview)
====================================

Overview（概述）
******************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Tile view is a container Widget whose elements (called *tiles*) can
be arranged in grid form. A user can navigate between the tiles by
swiping. Any direction of swiping can be disabled on the tiles
individually to not allow moving from one tile to another.

If the Tile view is screen sized, the user interface resembles what you
may have seen on smartwatches.

.. raw:: html

   </details> 
   <br>


平铺视图(Tileview)是一个容器对象，其中的元素（ *tiles（瓷砖）* ）可以以网格形式排列。用户可以通过滑动在瓷砖之间导航。可以单独在瓷砖上禁用任意方向的滑动，以防止从一个瓷砖移动到另一个瓷砖。

如果平铺视图设置为屏幕大小，则用户界面类似于在智能手表上看到的界面。


.. _lv_tileview_parts_and_styles:

Parts and Styles（部分和样式）
*******************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Tile view is built from an :ref:`base_widget` container and
:ref:`base_widget` tiles.

The parts and styles work the same as for :ref:`base_widget`.

.. raw:: html

   </details> 
   <br>


平铺视图是由 :ref:`base_widget` 容器和 :ref:`base_widget` 平铺构建而成的。

部分和样式的工作方式与 :ref:`base_widget` 相同。


.. _lv_tileview_usage:

Usage（用法）
***************

Add a tile（添加瓷砖）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_tileview_add_tile(tileview, col_id, row_id, dir)` creates a new
tile on the ``col_id``\ th column  and ``row_id``\ th row. ``dir`` can be
``LV_DIR_LEFT/RIGHT/TOP/BOTTOM/HOR/VER/ALL`` or OR-ed values to enable
moving to the adjacent tiles into the given direction by swiping.

The returned value is an ``lv_obj_t *`` on which the content of the tab
can be created.

.. raw:: html

   </details> 
   <br>

:cpp:expr:`lv_tileview_add_tile(tileview, row_id, col_id, dir)` 函数在平铺视图 tileview 中的第 ``col_id`` 列和第 ``row_id`` 行创建了一个新的瓷砖。dir 参数可以是 ``LV_DIR_LEFT/RIGHT/TOP/BOTTOM/HOR/VER/ALL`` 中的一个或多个值，通过按位或（OR-ed）操作来组合，以允许通过滑动手势在给定方向上移动到相邻的瓷砖。

返回的值是 ``lv_obj_t *`` 可以在其（瓷砖）上填充内容。


Change tile（切换瓷砖显示）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Tile view can scroll to a tile with
:cpp:expr:`lv_tileview_set_tile(tileview, tile_obj, LV_ANIM_ON/OFF)` or
:cpp:expr:`lv_tileview_set_tile_by_index(tileview, col_id, row_id, LV_ANIM_ON/OFF)`

.. raw:: html

   </details> 
   <br>


平铺视图可以使用接口 :cpp:expr:`lv_tileview_set_tile(tileview, tile_obj, LV_ANIM_ON/OFF)` 或 :cpp:expr:`lv_tileview_set_tile_by_index(tileview, col_id, row_id, LV_ANIM_ON/OFF)` 切换到指定的瓷砖。


.. _lv_tileview_events:

Events（事件）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` Sent when a new tile loaded by scrolling.
   :cpp:expr:`lv_tileview_get_tile_active(tabview)` can be used to get current
   tile.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 当通过滚动加载新瓷砖时发送此事件，接口 :cpp:expr:`lv_tileview_get_tile_active(tabview)` 可用于获取当前所在的瓷砖。


.. _lv_tileview_keys:

Keys（按键）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No *Keys* are processed by Tileview Widgets.

.. admonition::  Further Reading

    Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


平铺视图不处理任何 *按键*。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_tileview_example:

Example
*******

.. include:: ../../examples/widgets/tileview/index.rst

.. _lv_tileview_api:

API
***
