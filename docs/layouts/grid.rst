.. _grid:

===============
Grid（网格布局）
===============

Overview（概述）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Grid layout is a subset of `CSS Grid <https://css-tricks.com/snippets/css/complete-guide-grid/>`__.

It can arrange items into a 2D "table" that has rows or columns
(tracks). The item can span through multiple columns or rows. The
track's size can be set in pixel, to the largest item
(:c:macro:`LV_GRID_CONTENT`) or in "Free unit" (FR) to distribute the free
space proportionally.

To make an object a grid container call :cpp:expr:`lv_obj_set_layout(obj, LV_LAYOUT_GRID)`.

Note that the grid layout feature of LVGL needs to be globally enabled
with :c:macro:`LV_USE_GRID` in ``lv_conf.h``.

.. raw:: html

   </details>
   <br>


网格布局是 `CSS Grid <https://css-tricks.com/snippets/css/complete-guide-grid/>`__ 的一个子集。

它可以将项目排列成具有行或列（轨道）的二维“表格”。 该项目可以跨越多个列或行。 轨道的大小可以设置为像素、最大项目（:c:macro:`LV_GRID_CONTENT`）或“空闲单元”（FR）以按比例分配空闲空间。

要使对象成为网格容器，请调用 :cpp:expr:`lv_obj_set_layout(obj, LV_LAYOUT_GRID)`。

请注意，LVGL 的网格布局功能需要通过 ``lv_conf.h`` 中的 :c:macro:`LV_USE_GRID` 全局启用。


Terms（约定）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  **tracks**: the rows or columns
-  **free unit (FR)**: if set on track's size is set in ``FR`` it will grow
   to fill the remaining space on the parent.
-  **gap**: the space between the rows and columns or the items on a track

.. raw:: html

   </details>
   <br>


- 轨道：行或列
- 空闲单元（FR）：如果在FR中设置了轨道的大小，它将增长以填充父级上的剩余空间。
- 间隙：行和列或轨道上的项目之间的空间


Simple interface（简单的接口）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

With the following functions you can easily set a Grid layout on any
parent.

.. raw:: html

   </details>
   <br>


使用以下功能，您可以轻松地在任何父级上设置网格布局。


.. _grid_descriptors:

Grid descriptors（网格描述符）
-----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

First you need to describe the size of rows and columns. It can be done
by declaring 2 arrays and the track sizes in them. The last element must
be :c:macro:`LV_GRID_TEMPLATE_LAST`.

For example:

.. code:: c

   static int32_t column_dsc[] = {100, 400, LV_GRID_TEMPLATE_LAST};   /*2 columns with 100 and 400 ps width*/
   static int32_t row_dsc[] = {100, 100, 100, LV_GRID_TEMPLATE_LAST}; /*3 100 px tall rows*/

To set the descriptors on a parent use
:cpp:expr:`lv_obj_set_grid_dsc_array(obj, col_dsc, row_dsc)`.

Besides simple settings the size in pixel you can use two special
values:

- :c:macro:`LV_GRID_CONTENT` set the size to fit the largest child on this track
- :cpp:expr:`LV_GRID_FR(X)` tell what portion of the remaining space
  should be used by this track. Larger value means larger space.

.. raw:: html

   </details>
   <br>


首先，您需要描述行和列的大小。 可以通过声明 2 个数组和其中的轨道大小来完成。 最后一个元素必须是LV_GRID_TEMPLATE_LAST。

例如：

.. code:: c

   static int32_t column_dsc[] = {100, 400, LV_GRID_TEMPLATE_LAST};   /*2 columns with 100 and 400 ps width*/
   static int32_t row_dsc[] = {100, 100, 100, LV_GRID_TEMPLATE_LAST}; /*3 100 px tall rows*/

要在父级上设置描述符，请使用:cpp:expr:`lv_obj_set_grid_dsc_array(obj, col_dsc, row_dsc)`。

除了简单的设置像素大小之外，您还可以使用两个特殊值：

- :c:macro:`LV_GRID_CONTENT` 将宽度设置为这条轨道上最大的孩子
- :cpp:expr:`LV_GRID_FR(X)` 告诉这个轨道应该使用剩余空间的哪一部分。 更大的值意味着更大的空间。


.. _grid_items:

Grid items（网格项）
-------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

By default, the children are not added to the grid. They need to be
added manually to a cell.

To do this call
:cpp:expr:`lv_obj_set_grid_cell(child, column_align, column_pos, column_span, row_align, row_pos, row_span)`.

``column_align`` and ``row_align`` determine how to align the children
in its cell. The possible values are:

- :cpp:enumerator:`LV_GRID_ALIGN_START`: means left on a horizontally and top vertically (default)
- :cpp:enumerator:`LV_GRID_ALIGN_END`: means right on a horizontally and bottom vertically
- :cpp:enumerator:`LV_GRID_ALIGN_CENTER`: simply center ``column_pos`` and ``row_pos``
  means the zero based index of the cell into the item should be placed.

``column_span`` and ``row_span`` means how many tracks should the item
involve from the start cell. Must be ``>= 1``.

.. raw:: html

   </details>
   <br>


默认情况下，子项不会添加到网格中。 它们需要手动添加到单元格中。

为此调用 :cpp:expr:`lv_obj_set_grid_cell(child, column_align, column_pos, column_span, row_align, row_pos, row_span)`。

``column_align`` 和 ``row_align`` 确定如何在其单元格中对齐子项。 可能的值为：

:cpp:enumerator:`LV_GRID_ALIGN_START`: 表示在水平方向和垂直方向的顶部左侧。 （默认）

:cpp:enumerator:`LV_GRID_ALIGN_END`: 表示水平和底部垂直

:cpp:enumerator:`LV_GRID_ALIGN_CENTER`: 只是居中

 ``column_pos`` 和 ``row_pos`` 表示应该放置项目中单元格的从零开始的索引。

``column_span`` 和 ``row_span`` 表示该项目应该从起始单元格开始包含多少个轨道。 必须 ``>= 1``。


.. _grid_align:

Grid align（网格对齐）
---------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If there are some empty space the track can be aligned several ways:

- :cpp:enumerator:`LV_GRID_ALIGN_START`: means left on a horizontally and top vertically. (default)
- :cpp:enumerator:`LV_GRID_ALIGN_END`: means right on a horizontally and bottom vertically
- :cpp:enumerator:`LV_GRID_ALIGN_CENTER`: simply center
- :cpp:enumerator:`LV_GRID_ALIGN_SPACE_EVENLY`: items are distributed so that the spacing
  between any two items (and the space to the edges) is equal. Not applies to ``track_cross_place``.
- :cpp:enumerator:`LV_GRID_ALIGN_SPACE_AROUND`: items are
  evenly distributed in the track with equal space around them. Note that
  visually the spaces aren't equal, since all the items have equal space
  on both sides. The first item will have one unit of space against the
  container edge, but two units of space between the next item because
  that next item has its own spacing that applies. Not applies to ``track_cross_place``.
- :cpp:enumerator:`LV_GRID_ALIGN_SPACE_BETWEEN`: items are
  evenly distributed in the track: first item is on the start line, last
  item on the end line. Not applies to ``track_cross_place``.

To set the track's alignment use
:cpp:expr:`lv_obj_set_grid_align(obj, column_align, row_align)`.

.. raw:: html

   </details>
   <br>


如果有一些空白空间，轨道可以通过几种方式对齐：

:cpp:enumerator:`LV_GRID_ALIGN_START`: 表示在水平方向和垂直方向的顶部左侧。 （默认）

:cpp:enumerator:`LV_GRID_ALIGN_END`: 表示水平和底部垂直

:cpp:enumerator:`LV_GRID_ALIGN_CENTER`: 只是居中

:cpp:enumerator:`LV_GRID_ALIGN_SPACE_EVENLY`: 项目是分布的，因此任意两个项目之间的间距（以及到边缘的空间）是相等的。不适用于 ``track_cross_place``。

:cpp:enumerator:`LV_GRID_ALIGN_SPACE_AROUND`: 项目均匀分布在轨道中，它们周围的空间相等。 请注意，视觉上的空间并不相等，因为所有项目的两侧都有相等的空间。 第一个项目将与容器边缘有一个单位的空间，但下一个项目之间有两个单位的空间，因为下一个项目有自己的适用间距。不适用于 ``track_cross_place``。

:cpp:enumerator:`LV_GRID_ALIGN_SPACE_BETWEEN`: 项目均匀分布在轨道中：第一个项目在开始线上，最后一个项目在结束线上。不适用于 ``track_cross_place``。

要设置轨道的对齐方式，请使用 :cpp:expr:`lv_obj_set_grid_align(obj, column_align, row_align)`。


.. _grid_subgrid:

Sub grid（子网格）
-----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If you set the column and/or row grid descriptors  of the parent,
the grid item will see 5 columns and 4 rows with the corresponding track size from the parent.

This way even if a wrapper item is used on the grid and can be made "transparent"  from the grid's point of view.

Limitations:

- The sub grid is resolved only in one level depth. That is a grid can have a sub grid children, but a sub grid can't have another sub grid.
- ``LV_GRID_CONTENT`` tracks on the are not handled in the sub grid, only in the its own grid.

The sub grid feature works the same as in CSS. For further reference see `this description <https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_grid_layout/Subgrid>`__.

.. raw:: html

   </details>
   <br>


如果设置父级的列和/或行网格描述符，网格项将看到来自父项的具有相应轨道大小的5列和4行。

这样，即使在网格上使用了包装项，也可以从网格的角度使其“透明”。

局限性：

- 子网格仅在一个级别深度中解析。也就是说，一个网格可以有一个子网格，但一个子网格中不能有其它子网格。
 
- 上的 ``LV_GRID_CONTENT`` 轨道不在子网格中处理，只在其自己的网格中处理。

子网格功能的工作原理与CSS中的相同。如需进一步参考请参阅 `本说明 <https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_grid_layout/Subgrid>`__.


.. _grid_style:

Style interface（样式接口）
**************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

All the Grid related values are style properties under the hood and you
can use them similarly to any other style properties.

The following Grid related style properties exist:

-  :cpp:enumerator:`GRID_COLUMN_DSC_ARRAY`
-  :cpp:enumerator:`GRID_ROW_DSC_ARRAY`
-  :cpp:enumerator:`GRID_COLUMN_ALIGN`
-  :cpp:enumerator:`GRID_ROW_ALIGN`
-  :cpp:enumerator:`GRID_CELL_X_ALIGN`
-  :cpp:enumerator:`GRID_CELL_COLUMN_POS`
-  :cpp:enumerator:`GRID_CELL_COLUMN_SPAN`
-  :cpp:enumerator:`GRID_CELL_Y_ALIGN`
-  :cpp:enumerator:`GRID_CELL_ROW_POS`
-  :cpp:enumerator:`GRID_CELL_ROW_SPAN`

.. raw:: html

   </details>
   <br>


所有与 Grid 相关的值都是底层的样式属性，您可以像使用任何其他样式属性一样使用它们。 

存在以下与网格相关的样式属性：

-  :cpp:enumerator:`GRID_COLUMN_DSC_ARRAY`
-  :cpp:enumerator:`GRID_ROW_DSC_ARRAY`
-  :cpp:enumerator:`GRID_COLUMN_ALIGN`
-  :cpp:enumerator:`GRID_ROW_ALIGN`
-  :cpp:enumerator:`GRID_CELL_X_ALIGN`
-  :cpp:enumerator:`GRID_CELL_COLUMN_POS`
-  :cpp:enumerator:`GRID_CELL_COLUMN_SPAN`
-  :cpp:enumerator:`GRID_CELL_Y_ALIGN`
-  :cpp:enumerator:`GRID_CELL_ROW_POS`
-  :cpp:enumerator:`GRID_CELL_ROW_SPAN`


.. _grid_padding:

Internal padding（内部填充）
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To modify the minimum space Grid inserts between objects, the following
properties can be set on the Grid container style:

-  ``pad_row`` Sets the padding between the rows.
-  ``pad_column`` Sets the padding between the columns.

.. raw:: html

   </details>
   <br>


要修改 Grid 在对象之间插入的最小空间，请执行以下操作 可以在 Grid 容器样式上设置属性：

- ``pad_row`` 设置行之间的内边距。
- ``pad_column`` 设置列之间的内边距。


.. _grid_other:

Other features（其它功能）
*************************

RTL
---

.. raw:: html

   <details>
     <summary>显示原文</summary>

If the base direction of the container is set to :cpp:enumerator:`LV_BASE_DIR_RTL`,
the meaning of :cpp:enumerator:`LV_GRID_ALIGN_START` and :cpp:enumerator:`LV_GRID_ALIGN_END` is
swapped. I.e. ``START`` will mean right-most.

The columns will be placed from right to left.

.. raw:: html

   </details>
   <br>


如果容器的基本方向设置为 :cpp:enumerator:`LV_BASE_DIR_RTL`，则 :cpp:enumerator:`LV_GRID_ALIGN_START` 和 :cpp:enumerator:`LV_GRID_ALIGN_END` 的含义互换。 IE。 ``START`` 表示最右边。

列将从右到左放置。


.. _grid_examples:

Example
*******

.. include:: ../examples/layouts/grid/index.rst

.. _grid_api:

API
***
