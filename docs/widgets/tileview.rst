.. _lv_tileview:

===================================
Tile view（平铺视图） (lv_tileview)
===================================

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Tile view is a container object whose elements (called *tiles*) can
be arranged in grid form. A user can navigate between the tiles by
swiping. Any direction of swiping can be disabled on the tiles
individually to not allow moving from one tile to another.

If the Tile view is screen sized, the user interface resembles what you
may have seen on smartwatches.

.. raw:: html

   </details> 
   <br>


平铺视图(lv_tileview)平铺视图(Tileview)是一个容器对象，其中的元素（称为图块）可以以网格形式排列。通过滑动，用户可以在图块之间导航。可以单独在图块上禁用任何方向的滑动，以不允许从一个图块移动到另一个图块。

如果Tileview是屏幕尺寸的，它将提供可能已经在智能手表上看到的用户界面。


.. _lv_tileview_parts_and_styles:

Parts and Styles（零件和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Tile view is built from an :ref:`lv_obj` container and
:ref:`lv_obj` tiles.

The parts and styles work the same as for :ref:`lv_obj`.

.. raw:: html

   </details> 
   <br>


平铺视图是由 :ref:`lv_obj` 容器和 :ref:`lv_obj` 平铺构建的。

部件和样式的工作方式与 :ref:`lv_obj` 相同。


.. _lv_tileview_usage:

Usage（用法）
*************

Add a tile（添加平铺显示）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_tileview_add_tile(tileview, row_id, col_id, dir)` creates a new
tile on the ``row_id``\ th row and ``col_id``\ th column. ``dir`` can be
``LV_DIR_LEFT/RIGHT/TOP/BOTTOM/HOR/VER/ALL`` or OR-ed values to enable
moving to the adjacent tiles into the given direction by swiping.

The returned value is an ``lv_obj_t *`` on which the content of the tab
can be created.

.. raw:: html

   </details> 
   <br>

:cpp:expr:`lv_tileview_add_tile(tileview, row_id, col_id, dir)` 创建一个新的第 ``row_id``\ th 行和 ``col_id``\ th 列上的瓦片 ``目录`` 可以是 ``LV_DIR_LEFT/RIGHT/TOP/BOTTOM/HOR/VER/ALL`` 或 OR-ed 值以启用通过滑动向给定方向移动到相邻的图块。

返回的值是可以在其 ``lv_obj_t *`` 上创建选项卡内容的值。


Change tile（更改平铺显示）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Tile view can scroll to a tile with
:cpp:expr:`lv_tileview_set_tile(tileview, tile_obj, LV_ANIM_ON/OFF)` or
:cpp:expr:`lv_tileview_set_tile_by_index(tileview, col_id, row_id, LV_ANIM_ON/OFF)`

.. raw:: html

   </details> 
   <br>


Tile 视图可以使用 :cpp:expr:`lv_tileview_set_tile(tileview, tile_obj, LV_ANIM_ON/OFF)` 或 :cpp:expr:`lv_tileview_set_tile_by_index(tileview, col_id, row_id, LV_ANIM_ON/OFF)` 滚动到图块


.. _lv_tileview_events:

Events（事件）
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` Sent when a new tile loaded by scrolling.
   :cpp:expr:`lv_tileview_get_tile_active(tabview)` can be used to get current
   tile.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 当通过滚动加载新图块时发送。 :cpp:expr:`lv_tileview_get_tile_active(tabview)` 可用于获取当前图块。


.. _lv_tileview_keys:

Keys（按键）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

*Keys* are not handled by the Tile view.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


平铺视图不处理任何 *按键*。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_tileview_example:

Example
*******

.. include:: ../examples/widgets/tileview/index.rst

.. _lv_tileview_api:

API
***
