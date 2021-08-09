```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/widgets/table.md
```
# Table（表） (lv_table)

## Overview

<details>
<summary>查看原文</summary>
<p>

Tables, as usual, are built from rows, columns, and cells containing texts.

The Table object is very lightweight because only the texts are stored. No real objects are created for cells but they are just drawn on the fly.

</p>
</details>

表格是由包含文本的行、列和单元格构建的。表格对象非常轻量级，因为仅存储文本。没有为细胞创建真实的对象，但它们只是即时绘制的。

## Parts and Styles（部件和样式）

<details>
<summary>查看原文</summary>
<p>

- `LV_PART_MAIN` The background of the table uses all the typical background style properties.
- `LV_PART_ITEMS` The cells of the table also use all the typical background style properties and the text properties.

</p>
</details>

- `LV_PART_MAIN` 表格的背景使用了所有典型的背景样式属性。
- `LV_PART_ITEMS` 表格的单元格也使用所有典型的背景样式属性和文本属性。

## Usage（用法）

### Set cell value（设置单元格的值）

<details>
<summary>查看原文</summary>
<p>

The cells can store only text so numbers need to be converted to text before displaying them in a table.

`lv_table_set_cell_value(table, row, col, "Content")`. The text is saved by the table so it can be even a local variable.

Line breaks can be used in the text like `"Value\n60.3"`.

New rows and columns are automatically added is required 

</p>
</details>

单元格只能存储文本，因此在将数字显示在表格中之前，需要将其转换为文本。

`lv_table_set_cell_value(table, row, col, "Content")`。 文本由表保存，因此它甚至可以是局部变量。

可以在文本中使用换行符，例如 `"Value\n60.3"`。

需要自动添加新的行和列

### Rows and Columns（行和列）

<details>
<summary>查看原文</summary>
<p>

To explicitly set number of rows and columns use `lv_table_set_row_cnt(table, row_cnt)` and `lv_table_set_col_cnt(table, col_cnt)`

</p>
</details>

要明确设置行数和列数，请使用 `lv_table_set_row_cnt(table, row_cnt)` 和 `lv_table_set_col_cnt(table, col_cnt)`

### Width and Height（宽度和高度）

<details>
<summary>查看原文</summary>
<p>

The width of the columns can be set with `lv_table_set_col_width(table, col_id, width)`. The overall width of the Table object will be set to the sum of columns widths.

The height is calculated automatically from the cell styles (font, padding etc) and the number of rows.

</p>
</details>

列的宽度可以通过 `lv_table_set_col_width(table, col_id, width)` 设置。 Table 对象的总宽度将设置为列宽的总和。

高度是根据单元格样式（字体、填充等）和行数自动计算的。

### Merge cells（合并单元格）

<details>
<summary>查看原文</summary>
<p>

Cells can be merged horizontally with `lv_table_set_cell_merge_right(table, col, row, true)`. To merge more adjacent cells call this function for each cell.

</p>
</details>

单元格可以使用 `lv_table_set_cell_merge_right(table, col, row, true)` 进行水平合并。 要合并更多相邻单元格，请为每个单元格调用此函数。

### Scroll（滚动）

<details>
<summary>查看原文</summary>
<p>

If the label's width or height is set to `LV_SIZE_CONTENT` that size will be used to show the whole table in the respective direction. 
E.g. `lv_obj_set_size(table, LV_SIZE_CONTENT, LV_SIZE_CONTENT)` automatically sets the table size to show all the columns and rows.

If the width or height is set to a smaller number than the "intrinsic" size then the table becomes scrollable.

</p>
</details>

如果标签的宽度或高度设置为“LV_SIZE_CONTENT”，则该尺寸将用于在相应方向上显示整个表格。
例如。 `lv_obj_set_size(table, LV_SIZE_CONTENT, LV_SIZE_CONTENT)` 自动设置表格大小以显示所有列和行。

如果宽度或高度设置为小于“固有”大小的数字，则表格变为可滚动的。

## Events（事件）

<details>
<summary>查看原文</summary>
<p>

- `LV_EVENT_DRAW_PART_BEGIN` and `LV_EVENT_DRAW_PART_END` are sent for the following types:
    - `LV_TABLE_DRAW_PART_CELL` The individual cells of the table
        - `part`: `LV_PART_ITEMS` 
        - `draw_area`: area of the indicator
        - `rect_dsc`
        - `label_dsc`
        - `id`: current row &times; col count + current column 

See the events of the [Base object](/widgets/obj) too.

Learn more about [Events](/overview/event).

</p>
</details>

- 为以下类型发送`LV_EVENT_DRAW_PART_BEGIN`和`LV_EVENT_DRAW_PART_END`：
     - `LV_TABLE_DRAW_PART_CELL` 表格的各个单元格
         - `部分`：`LV_PART_ITEMS`
         - `draw_area`：指标的区域
         -`rect_dsc`
         - `label_dsc`
         - `id`：当前行 &times; 列数 + 当前列

参见 [Base object](/widgets/obj) 的事件。

详细了解 [事件](/overview/event)。

## Keys（按键）

<details>
<summary>查看原文</summary>
<p>

No *Keys* are processed by the object type.

Learn more about [Keys](/overview/indev).

</p>
</details>

对象类型不处理 *Keys*。

了解有关 [键](/overview/indev) 的更多信息。

## Example

```eval_rst

.. include:: ../../../examples/widgets/table/index.rst

```

### MicroPython
No examples yet.

## API 

```eval_rst

.. doxygenfile:: lv_table.h
  :project: lvgl
        
```
