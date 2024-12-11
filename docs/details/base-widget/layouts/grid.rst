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

-  **tracks**: 行或列  
-  **free (FR) units**: 如果一个轨道的大小设置为 ``FR units``，它会根据其他具有非零 FR-unit 值的轨道，按比例填充父级 Widget（容器）中的剩余空间。  
-  **gap**: 行与列之间的空间，或者轨道上项之间的间距


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


使用以下函数可以使任何父级 Widget 具有 Grid-layout 行为。

.. note::

    与 Flex 容器一样，父级 Widget 必须是 Grid 容器，才能使这些样式生效。
    下面的函数会使父级 Widget 成为 Grid 容器（如果它还不是的话）。


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


首先，你需要描述行和列的大小。这可以通过声明 2 个数组并在其中定义轨道大小来完成。
最后一个元素必须是 :c:macro:`LV_GRID_TEMPLATE_LAST`。

例如：

.. code-block:: c

   static int32_t column_dsc[] = {100, 400, LV_GRID_TEMPLATE_LAST};   /* 2 列，宽度分别为 100 像素和 400 像素 */
   static int32_t row_dsc[] = {100, 100, 100, LV_GRID_TEMPLATE_LAST}; /* 3 行，每行高度为 100 像素 */

要在父级上设置描述符，使用
:cpp:expr:`lv_obj_set_grid_dsc_array(widget, col_dsc, row_dsc)`。

除了设置像素大小外，你还可以使用两个特殊值：

- :c:macro:`LV_GRID_CONTENT` 设置大小以适应此轨道上最大的子项
- :cpp:expr:`LV_GRID_FR(X)` 确定此轨道应使用剩余空间的哪一部分。值越大，占用的空间越大。

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


默认情况下，小部件的子项不会添加到网格中。需要手动将它们添加到单元格中。

为此，调用：  
:cpp:expr:`lv_obj_set_grid_cell(child, column_align, column_pos, column_span, row_align, row_pos, row_span)`。

``column_align`` 和 ``row_align`` 决定了子小部件在其单元格中的对齐方式。可能的值有：

- :cpp:enumerator:`LV_GRID_ALIGN_START`：当方向为水平时，表示左对齐，当方向为垂直时，表示上对齐（默认值）
- :cpp:enumerator:`LV_GRID_ALIGN_END`：当方向为水平时，表示右对齐，当方向为垂直时，表示下对齐
- :cpp:enumerator:`LV_GRID_ALIGN_CENTER`：简单地将 ``column_pos`` 和 ``row_pos`` 居中，表示该项应放置的单元格的零基索引。

``column_span`` 和 ``row_span`` 表示从起始单元格开始应该占据多少轨道。必须是 ``>= 1``。

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


如果有一些空余空间，Grid 轨道中的项（Widgets）可以通过以下几种方式对齐：

- :cpp:enumerator:`LV_GRID_ALIGN_START`：当方向为水平方向时表示左对齐，当方向为垂直方向时表示上对齐。（默认）
- :cpp:enumerator:`LV_GRID_ALIGN_END`：当方向为水平方向时表示右对齐，当方向为垂直方向时表示下对齐
- :cpp:enumerator:`LV_GRID_ALIGN_CENTER`：简单的居中对齐
- :cpp:enumerator:`LV_GRID_ALIGN_SPACE_EVENLY`：项均匀分布，使得任意两个项之间的间距（以及与边缘的空间）相等。不适用于 ``track_cross_place``。
- :cpp:enumerator:`LV_GRID_ALIGN_SPACE_AROUND`：项在轨道中均匀分布，四周有相等的空间。请注意，视觉上空间不完全相等，因为所有项在两侧的空间相等。这使得项之间的空间是边缘项与容器边缘之间空间的两倍。不适用于 ``track_cross_place``。
- :cpp:enumerator:`LV_GRID_ALIGN_SPACE_BETWEEN`：项在轨道中均匀分布，首尾项紧邻容器的边缘。不适用于 ``track_cross_place``。

要设置轨道的对齐方式，请使用
:cpp:expr:`lv_obj_set_grid_align(widget, column_align, row_align)`。


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


如果您将小部件的列和/或行网格描述符设置为 ``NULL``，它将使用其父级的网格描述符。

例如，如果您创建一个跨越列 2..6 和行 1..3 的网格项，该网格项将占据 5 列和 4 行，并使用父级网格容器中相应的轨道大小。

通过这种方式，即使在网格中使用了包装项，它也可以从网格的角度来看是“透明的”。

限制：

- 子网格的解析深度仅为 1 层。也就是说，网格可以有一个子网格子项，但该子网格不能有另一个子网格。

- ``LV_GRID_CONTENT`` 网格上的轨道在子网格中不处理，只在其自身的网格中处理。

子网格功能与 CSS 中的工作方式相同。如需进一步参考请参阅 `这里的说明 <https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_grid_layout/Subgrid>`__.

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


如果容器的基础方向设置为:cpp:enumerator:`LV_BASE_DIR_RTL`，则:cpp:enumerator:`LV_GRID_ALIGN_START`和:cpp:enumerator:`LV_GRID_ALIGN_END`的含义将被交换。也就是说，``START``将表示最右侧。

列将从右到左排列。

.. admonition:: 进一步阅读

    - 了解更多关于 `CSS Grid`_ 布局。
    - 了解更多关于 `CSS Subgrid`_ 布局。


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
