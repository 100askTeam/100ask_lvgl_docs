.. _grid:

=================
Grid（网格布局）
=================

Overview（概述）
*****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Grid layout is a subset of `CSS Grid`_ layout.

It can arrange items (child Widgets) into a 2D "table" that has rows and columns
(tracks).  An item can span multiple columns or rows. The
track's size can be set in pixels, to the largest item
(:c:macro:`LV_GRID_CONTENT`), or to a fraction of the available free space
(i.e. `Free [FR] Units <fr units_>`_) to distribute free space proportionally.

To make a Widget a Grid container call :cpp:expr:`lv_obj_set_layout(widget, LV_LAYOUT_GRID)`.

Note that the Grid layout feature of LVGL needs to be globally enabled
with :c:macro:`LV_USE_GRID` in ``lv_conf.h``.

.. raw:: html

   </details>
   <br>


Grid（网格布局）是 `CSS Grid <https://css-tricks.com/snippets/css/complete-guide-grid/>`__ 的一个子集。

它可以将元素排列成具有行或列（轨道）的二维 “表格” 中。该元素可以跨越多个列或行。轨道的大小可以设置为像素、最大元素（:c:macro:`LV_GRID_CONTENT`）或 “空闲单元” （FR） 以按比例分配自由空间。

要使对象成为网格容器，请调用函数 :cpp:expr:`lv_obj_set_layout(obj, LV_LAYOUT_GRID)` 设置。

请注意，LVGL 的 Grid（网格布局）功能需要打开 ``lv_conf.h`` 中的宏 :c:macro:`LV_USE_GRID` 启用。


Terms（约定）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  **tracks**: rows or columns
-  **free (FR) units**: if a track's size is set in ``FR units`` it will grow
   to fill the remaining space in the parent Widget (container), in proportion with
   other tracks that have non-zero FR-unit values.
-  **gap**: the space between rows and columns or the items on a track

.. raw:: html

   </details>
   <br>


- **tracks（轨道）**：行或列
- **空闲单元（FR）**：如果在FR中设置了轨道的大小，它将增长以填充父级上的剩余空间。
- **gap（间隙）**：行和列或轨道上的元素之间的空间


Simple Interface（简单的接口）
*******************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

With the following functions you can cause any parent Widget to have Grid-layout behaviors.

.. note::

    As with Flex containers, the parent Widget must be a Grid container for these
    styles to take effect.  The functions below cause the parent Widget to become a
    Grid container if it is not already.

.. raw:: html

   </details>
   <br>


使用以下功能，可以轻松地在任何父级上设置网格布局。


.. _grid_descriptors:

Grid descriptors（网格描述符）
-------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

First you need to describe the size of rows and columns. It can be done
by declaring 2 arrays and the track sizes in them. The last element must
be :c:macro:`LV_GRID_TEMPLATE_LAST`.

For example:

.. code-block:: c

   static int32_t column_dsc[] = {100, 400, LV_GRID_TEMPLATE_LAST};   /* 2 columns with 100- and 400-px width */
   static int32_t row_dsc[] = {100, 100, 100, LV_GRID_TEMPLATE_LAST}; /* 3 100-px tall rows */

To set the descriptors on a parent use
:cpp:expr:`lv_obj_set_grid_dsc_array(widget, col_dsc, row_dsc)`.

Besides settings the sizes in pixels, you can use two special
values:

- :c:macro:`LV_GRID_CONTENT` sets size to fit the largest child on this track
- :cpp:expr:`LV_GRID_FR(X)` determines what portion of the remaining space
  should be used by this track. Larger values means larger space.

.. raw:: html

   </details>
   <br>


首先，需要描述行和列的大小。这可以通过声明2个数组和其中的轨道大小来完成。最后一个元素必须是 :c:macro:`LV_GRID_TEMPLATE_LAST` 。

例如：

.. code:: c

   static int32_t column_dsc[] = {100, 400, LV_GRID_TEMPLATE_LAST};   /*2 columns with 100 and 400 ps width*/
   static int32_t row_dsc[] = {100, 100, 100, LV_GRID_TEMPLATE_LAST}; /*3 100 px tall rows*/

要在父级上设置描述符，请使用 :cpp:expr:`lv_obj_set_grid_dsc_array(obj, col_dsc, row_dsc)` 。

除了简单地设置像素大小之外，还可以使用两个特殊值：

- :c:macro:`LV_GRID_CONTENT` 将大小设置为容纳这条轨道上最大的孩子
- :cpp:expr:`LV_GRID_FR(X)` 告诉这个轨道应该使用剩余空间的哪一部分。值越大，空间越大。


.. _grid_items:

Grid items（网格项）
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

By default, a Widget's children are not added to the grid. They need to be
added manually to a cell.

To do this call
:cpp:expr:`lv_obj_set_grid_cell(child, column_align, column_pos, column_span, row_align, row_pos, row_span)`.

``column_align`` and ``row_align`` determine how to align the child Widget
in its cell.  Possible values are:

- :cpp:enumerator:`LV_GRID_ALIGN_START`: means left when direction is horizontal and top when vertical (default)
- :cpp:enumerator:`LV_GRID_ALIGN_END`: means right when direction is horizontal and bottom when vertical
- :cpp:enumerator:`LV_GRID_ALIGN_CENTER`: simply center ``column_pos`` and ``row_pos``
  means the zero-based index of the cell in which the item should be placed.

``column_span`` and ``row_span`` means how many tracks should be occupied
from the start cell. Must be ``>= 1``.

.. raw:: html

   </details>
   <br>


默认情况下，子项不会添加到网格中。 它们需要手动添加到网格的单元中。

为此需要调用接口 :cpp:expr:`lv_obj_set_grid_cell(child, column_align, column_pos, column_span, row_align, row_pos, row_span)` 添加。

``column_align`` 和 ``row_align`` 确定如何对齐其单元格中的子项，可能的值有：

- :cpp:enumerator:`LV_GRID_ALIGN_START`: 表示左侧水平，顶部垂直（默认）
- :cpp:enumerator:`LV_GRID_ALIGN_END`: 表示右侧水平，底部垂直
- :cpp:enumerator:`LV_GRID_ALIGN_CENTER`: 只需将 ``column_pos`` 和 ``row_pos`` 居中即可
   表示应放置项目的单元格的从零开始的索引。

``column_span`` 和 ``row_span`` 表示元素指定的网络索引开始应包含多少个轨道，必须 ``>= 1``。


.. _grid_align:

Grid align（对齐方式）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If there is some empty space, items (Widgets) in Grid tracks can be aligned in several ways:

- :cpp:enumerator:`LV_GRID_ALIGN_START`: means left when direction is horizontal and top when vertical. (default)
- :cpp:enumerator:`LV_GRID_ALIGN_END`: means right when direction is horizontal and bottom when vertical
- :cpp:enumerator:`LV_GRID_ALIGN_CENTER`: simply center
- :cpp:enumerator:`LV_GRID_ALIGN_SPACE_EVENLY`: items are distributed so that the spacing
  between any two items (and the space to the edges) is equal. Not applies to ``track_cross_place``.
- :cpp:enumerator:`LV_GRID_ALIGN_SPACE_AROUND`: items are
  evenly distributed in the track with equal space around them. Note that
  visually the spaces aren't equal, since all the items have equal space
  on both sides. This makes the space between items double the space
  between edge items and the container's edge. Does not apply to ``track_cross_place``.
- :cpp:enumerator:`LV_GRID_ALIGN_SPACE_BETWEEN`: items are
  evenly distributed in the track with first and last items next to container's edges.
  Does not apply to ``track_cross_place``.

To set the track's alignment use
:cpp:expr:`lv_obj_set_grid_align(widget, column_align, row_align)`.

.. raw:: html

   </details>
   <br>


如果空间足够大，则可以通过多种方式对齐轨道：

- :cpp:enumerator:`LV_GRID_ALIGN_START`: 表示左侧水平，顶部垂直（默认）
- :cpp:enumerator:`LV_GRID_ALIGN_END`: 表示右侧水平，底部垂直
- :cpp:enumerator:`LV_GRID_ALIGN_CENTER`: 居中摆放
- :cpp:enumerator:`LV_GRID_ALIGN_SPACE_EVENLY`: 元素的分布使得任意两个元素之间的间距（以及到边缘的间距）相等，包括首尾元素离容器边缘的距离。。
- :cpp:enumerator:`LV_GRID_ALIGN_SPACE_AROUND`: 元素在轨道上均匀分布，周围有相等的空间。请注意，从视觉上看，空间并不相等，因为所有元素的两侧都有相等的空间。第一个元素在容器边缘有一个单位的空间，但下一个元素之间有两个单位的间隔，因为下一个项有自己的适用间距。
- :cpp:enumerator:`LV_GRID_ALIGN_SPACE_BETWEEN`: 元素在轨道上彼此之间的间隔相等，首尾元素贴合容器边缘：第一个元素在开始行，最后一个元素在结束行。

要设置轨道的对齐方式，请使用接口 :cpp:expr:`lv_obj_set_grid_align(obj, column_align, row_align)` 设置。


.. _grid_subgrid:

Sub grid（子网格）
--------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If you set the column and/or row grid descriptors of a widget to ``NULL`` it will use
the grid descriptor(s) from it's parent.

For example if you create a grid item that spans columns 2..6 columns and rows 1..3
of the grid, the grid item will occupy 5 columns and 4 rows with the corresponding
track size from the parent Grid container.

This way even if a wrapper item is used in the grid, it can be made "transparent"
from the grid's point of view.

Limitations:

- The sub-grid is resolved only to a depth of 1 level. That is, a grid can have a
  sub-grid child, but that sub-grid cannot have another sub-grid.

- ``LV_GRID_CONTENT`` tracks on the grid are not handled in the sub-grid, only in its
  own grid.

The sub-grid feature works the same as in CSS.  For further information, see
`CSS Subgrid`_.

.. raw:: html

   </details>
   <br>


如果设置父级的列、行网格描述符，则网格项将看到比如5列4行，其中包含父级对应的轨道大小。

这样，即使在网格上使用了包裹项，也可以从网格的角度使其“透明”。


局限性：

- 子网格仅在一个级别深度中解析。也就是说，一个网格可以有一个子网格，但一个子网格中不能有其它子网格。
- ``LV_GRID_CONTENT`` 轨道不在子网格中处理，只在其自己的网格中处理。

子网格功能的工作原理与CSS中的相同。如需进一步参考请参阅 `这里的说明 <https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_grid_layout/Subgrid>`__.

.. _grid_style:

Style interface（样式接口）
****************************

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


所有与 Grid 相关的值都是底层的样式属性，可以像使用任何其他样式属性那样使用它们。 

下面是与网格相关的样式属性：

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
-------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To modify the minimum space Grid inserts between Widgets, the following
properties can be set on the Grid container style:

-  :cpp:func:`lv_style_set_pad_row` sets padding between rows.

-  :cpp:func:`lv_style_set_pad_column` sets padding between columns.


.. raw:: html

   </details>
   <br>


要修改网格布局中对象之间的间隔，可以在给网格布局的容器修改下面所示的样式属性：

- :cpp:func:`lv_style_set_pad_row` 设置行之间的填充。

- :cpp:func:`lv_style_set_pad_column` 设置列之间的填充。


.. _grid_other:

Other features（其它功能）
****************************

RTL
------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If the base direction of the container is set to :cpp:enumerator:`LV_BASE_DIR_RTL`,
the meaning of :cpp:enumerator:`LV_GRID_ALIGN_START` and :cpp:enumerator:`LV_GRID_ALIGN_END` is
swapped. I.e. ``START`` will mean right-most.

The columns will be placed from right to left.



.. admonition::  Further Reading

    - Learn more about `CSS Grid`_ layout.
    - Learn more about `CSS Subgrid`_ layout.

.. raw:: html

   </details>
   <br>


如果容器的基本方向设置为 :cpp:enumerator:`LV_BASE_DIR_RTL`，那么 :cpp:enumerator:`LV_GRID_ALIGN_START` 和 :cpp:enumerator:`LV_GRID_ALIGN_END` 的作用就会互换，``START`` 表示最右边。

列将从右到左放置。


.. _grid_examples:

Example
**********

.. include:: ../../../examples/layouts/grid/index.rst


..  Hyperlinks

.. _css grid:     https://css-tricks.com/snippets/css/complete-guide-grid/
.. _fr units:     https://css-tricks.com/introduction-fr-css-unit/
.. _css subgrid:  https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_grid_layout/Subgrid



.. _grid_api:

API
***
