```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/layouts/grid.md
```

# Grid（网格布局）

## Overview（概述）

<details>
<summary>查看原文</summary>
<p>

The Grid layout is a subset of [CSS Flexbox](https://css-tricks.com/snippets/css/complete-guide-grid/).

It can arrange items into 2D "table" that has rows or columns (tracks). The item can span through multiple columns or rows.
The track's size can be set in pixel, to the largest item (`LV_GRID_CONTENT`) or in "Free unit" (FR) to distribute the free space proportionally.

To make an object a grid container call `lv_obj_set_layout(obj, LV_LAYOUT_GRID)`.

Note that the grid layout feature of LVGL needs to be globally enabled with `LV_USE_GRID` in `lv_conf.h`. 

</p>
</details>

网格布局是 [CSS Flexbox](https://css-tricks.com/snippets/css/complete-guide-grid/) 的一个子集。

它可以将项目排列成具有行或列（轨道）的二维“表格”。 该项目可以跨越多个列或行。
轨道的大小可以设置为像素、最大项目（`LV_GRID_CONTENT`）或“空闲单元”（FR）以按比例分配空闲空间。

要使对象成为网格容器，请调用 `lv_obj_set_layout(obj, LV_LAYOUT_GRID)`。

请注意，LVGL 的网格布局功能需要通过 `lv_conf.h` 中的 `LV_USE_GRID` 全局启用。

## Terms（约定）

<details>
<summary>查看原文</summary>
<p>

- tracks: the rows or columns
- free unit (FR): if set on track's size is set in `FR` it will grow to fill the remaining space on the parent. 
- gap: the space between the rows and columns or the items on a track

</p>
</details>

- 轨道：行或列
- 空闲单元（FR）：如果在`FR`中设置了轨道的大小，它将增长以填充父级上的剩余空间。
- 间隙：行和列或轨道上的项目之间的空间


## Simple interface（简单的接口）

<details>
<summary>查看原文</summary>
<p>

With the following functions you can easily set a Grid layout on any parent.

</p>
</details>

使用以下功能，您可以轻松地在任何父级上设置网格布局。

### Grid descriptors

<details>
<summary>查看原文</summary>
<p>

First you need to describe the size of rows and columns. It can be done by declaring 2 arrays and the track sizes in them. The last element must be `LV_GRID_TEMPLATE_LAST`.

For example:

</p>
</details>

首先，您需要描述行和列的大小。 可以通过声明 2 个数组和其中的轨道大小来完成。 最后一个元素必须是`LV_GRID_TEMPLATE_LAST`。

例如：

```
static lv_coord_t column_dsc[] = {100, 400, LV_GRID_TEMPLATE_LAST};   /*2 columns with 100 and 400 ps width*/
static lv_coord_t row_dsc[] = {100, 100, 100, LV_GRID_TEMPLATE_LAST}; /*3 100 px tall rows*/
```

<details>
<summary>查看原文</summary>
<p>

To set the descriptors on a parent use `lv_obj_set_grid_dsc_array(obj, col_dsc, row_dsc)`.

Besides simple settings the size in pixel you can use two special values:
- `LV_GRID_CONTENT` set the width to the largest children on this track
- `LV_GRID_FR(X)` tell what portion of the remaining space should be used by this track. Larger value means larger space.

</p>
</details>

要在父级上设置描述符，请使用 `lv_obj_set_grid_dsc_array(obj, col_dsc, row_dsc)`。

除了简单的设置像素大小之外，您还可以使用两个特殊值：
- `LV_GRID_CONTENT` 将宽度设置为这条轨道上最大的孩子
- `LV_GRID_FR(X)` 告诉这个轨道应该使用剩余空间的哪一部分。 更大的值意味着更大的空间。

### Grid items（网格项）

<details>
<summary>查看原文</summary>
<p>

By default the children are not added to the grid. They need to be added manually to a cell. 

To do this call `lv_obj_set_grid_cell(child, column_align, column_pos, column_span, row_align, row_pos, row_span)`.

`column_align` and `row_align` determine how to align the children in its cell. The possible values are:
- `LV_GRID_ALIGN_START` means left on a horizontally and top vertically. (default)
- `LV_GRID_ALIGN_END` means right on a horizontally and bottom vertically
- `LV_GRID_ALIGN_CENTER` simply center

`colum_pos` and `row_pos` means the zero based index of the cell into the item should be placed. 

`colum_span` and `row_span` means how many tracks should the item involve from the start cell. Must be &gt; 1. 

</p>
</details>

默认情况下，子项不会添加到网格中。 它们需要手动添加到单元格中。

为此调用`lv_obj_set_grid_cell(child, column_align, column_pos, column_span, row_align, row_pos, row_span)`。

`column_align` 和 `row_align` 确定如何在其单元格中对齐子项。 可能的值为：
- `LV_GRID_ALIGN_START` 表示在水平方向和垂直方向的顶部左侧。 （默认）
- `LV_GRID_ALIGN_END` 表示水平和底部垂直
- `LV_GRID_ALIGN_CENTER` 只是居中

`colum_pos` 和 `row_pos` 表示应该放置项目中单元格的从零开始的索引。

`colum_span` 和 `row_span` 表示该项目应该从起始单元格开始包含多少个轨道。 必须 &gt; 1.

### Grid align（网格对齐）

<details>
<summary>查看原文</summary>
<p>

If there are some empty space the track can be aligned several ways:
- `LV_GRID_ALIGN_START` means left on a horizontally and top vertically. (default)
- `LV_GRID_ALIGN_END` means right on a horizontally and bottom vertically
- `LV_GRID_ALIGN_CENTER` simply center
- `LV_GRID_ALIGN_SPACE_EVENLY` items are distributed so that the spacing between any two items (and the space to the edges) is equal. Not applies to `track_cross_place`.
- `LV_GRID_ALIGN_SPACE_AROUND` items are evenly distributed in the track with equal space around them. 
Note that visually the spaces aren’t equal, since all the items have equal space on both sides. 
The first item will have one unit of space against the container edge, but two units of space between the next item because that next item has its own spacing that applies. Not applies to `track_cross_place`.
- `LV_GRID_ALIGN_SPACE_BETWEEN` items are evenly distributed in the track: first item is on the start line, last item on the end line. Not applies to `track_cross_place`.

To set the track's alignment use `lv_obj_set_grid_align(obj, column_align, row_align)`.

</p>
</details>

如果有一些空白空间，轨道可以通过几种方式对齐：
- `LV_GRID_ALIGN_START` 表示在水平方向和垂直方向的顶部左侧。 （默认）
- `LV_GRID_ALIGN_END` 表示水平和底部垂直
- `LV_GRID_ALIGN_CENTER` 只是居中
- `LV_GRID_ALIGN_SPACE_EVENLY` 项目是分布的，因此任意两个项目之间的间距（以及到边缘的空间）是相等的。不适用于`track_cross_place`。
- `LV_GRID_ALIGN_SPACE_AROUND` 项目均匀分布在轨道中，它们周围的空间相等。
请注意，视觉上的空间并不相等，因为所有项目的两侧都有相等的空间。
第一个项目将与容器边缘有一个单位的空间，但下一个项目之间有两个单位的空间，因为下一个项目有自己的适用间距。不适用于`track_cross_place`。
- `LV_GRID_ALIGN_SPACE_BETWEEN` 项目均匀分布在轨道中：第一个项目在开始线上，最后一个项目在结束线上。不适用于`track_cross_place`。

要设置轨道的对齐方式，请使用 `lv_obj_set_grid_align(obj, column_align, row_align)`。

## Style interface（样式接口）

<details>
<summary>查看原文</summary>
<p>

All the Grid related values are style properties under the hood and you can use them similarly to any other style properties. The following Grid related style properties exist:

- `GRID_COLUMN_DSC_ARRAY`
- `GRID_ROW_DSC_ARRAY`
- `GRID_COLUMN_ALIGN`
- `GRID_ROW_ALIGN`
- `GRID_CELL_X_ALIGN`
- `GRID_CELL_COLUMN_POS`
- `GRID_CELL_COLUMN_SPAN`
- `GRID_CELL_Y_ALIGN`
- `GRID_CELL_ROW_POS`
- `GRID_CELL_ROW_SPAN`

</p>
</details>

所有与 Grid 相关的值都是底层的样式属性，您可以像使用任何其他样式属性一样使用它们。 存在以下与网格相关的样式属性：

- `GRID_COLUMN_DSC_ARRAY`
- `GRID_ROW_DSC_ARRAY`
- `GRID_COLUMN_ALIGN`
- `GRID_ROW_ALIGN`
- `GRID_CELL_X_ALIGN`
- `GRID_CELL_COLUMN_POS`
- `GRID_CELL_COLUMN_SPAN`
- `GRID_CELL_Y_ALIGN`
- `GRID_CELL_ROW_POS`
- `GRID_CELL_ROW_SPAN`

## Other features （其它功能）

### RTL

<details>
<summary>查看原文</summary>
<p>

If the base direction of the container is set to `LV_BASE_DIR_RTL`, the meaning of `LV_GRID_ALIGN_START` and `LV_GRID_ALIGN_END` is swapped. I.e. `START` will mean right-most.

The columns will be placed from right to left.

</p>
</details>

如果容器的基本方向设置为`LV_BASE_DIR_RTL`，则`LV_GRID_ALIGN_START`和`LV_GRID_ALIGN_END`的含义互换。 IE。 `START` 表示最右边。

列将从右到左放置。

## Example

```eval_rst

.. include:: ../../examples/layouts/grid/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_grid.h
  :project: lvgl

```
