.. _lv_table:

======================
Table（表格） (lv_table)
======================

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Tables are built from rows, columns, and cells containing text.

The Table Widget is very lightweight because only the text strings are stored.
No real Widgets are created for cells --- they are just drawn on the fly.

The Table is added to the default group (if one is set).
Table is an editable Widget, allow selecting a cell with encoder and keyboard
navigation as well.

.. raw:: html

   </details> 
   <br>


表格是由包含文本的行、列以及单元格构建而成的。

表格部件（Table Widget）非常轻巧，因为它只存储文本字符串。并不会为单元格创建真正的部件，它们只是即时绘制出来的。

表格会被添加到默认组（如果设置了默认组的话）。表格是一个可编辑的部件，允许使用编码器以及键盘导航来选择单元格。

.. _lv_table_parts_and_styles:

Parts and Styles（部分和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` The background of the Table; uses the :ref:`typical
   background style properties <typical bg props>`.
-  :cpp:enumerator:`LV_PART_ITEMS` The cells of the Table also use the
   :ref:`typical background style properties <typical bg props>` as well as text
   style properties.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_PART_MAIN`：表格的背景部分；使用:ref:`typical
   background style properties <typical bg props>`（典型的背景样式属性，可参考对应引用内容）。
-  :cpp:enumerator:`LV_PART_ITEMS`：表格的单元格部分，同样使用 :ref:`typical background style properties <typical bg props>`（典型的背景样式属性）以及文本样式属性。

.. _lv_table_usage:

Usage（用法）
*************

Set cell value（设置单元格的值）
-------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The cells can store only text so numbers need to be converted to text
before displaying them in a table.

:cpp:expr:`lv_table_set_cell_value(table, row, col, "Content")`. The text is
saved by the Table so the buffer containing the string can be a local variable.

Line breaks can be used in the text like ``"Value\n60.3"``.

New rows and columns are automatically added is required

.. raw:: html

   </details> 
   <br>


单元格只能存储文本，因此在将数字显示在表格中之前，需要将其转换为文本。

:cpp:expr:`lv_table_set_cell_value(table, row, col, "Content")`。 文本会由表格进行保存，所以包含该字符串的缓冲区可以是一个局部变量。

可以在文本中使用换行符，例如 ``"Value\n60.3"``。

Rows and Columns（行和列）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To explicitly set number of rows and columns use
:cpp:expr:`lv_table_set_row_count(table, row_cnt)` and
:cpp:expr:`lv_table_set_column_count(table, col_cnt)`

.. raw:: html

   </details> 
   <br>

要明确设置行数和列数，请使用 :cpp:expr:`lv_table_set_row_count(table, row_cnt)` 和 :cpp:expr:`lv_table_set_column_count(table, col_cnt)`

Width and Height（宽度和高度）
-----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The width of the columns can be set with
:cpp:expr:`lv_table_set_column_width(table, col_id, width)`. The overall width of
the Table Widget will be set to the sum of columns widths.

Height is calculated automatically from the cell styles (font,
padding etc) and the number of rows.

.. raw:: html

   </details> 
   <br>


列的宽度可以通过 :cpp:expr:`lv_table_set_column_width(table, col_id, width)` 设置。 Table 部件的总宽度将设置为列宽的总和。

高度会根据单元格样式（字体、内边距等）以及行数自动进行计算。


Merge cells（合并单元格）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Cells can be merged horizontally with
:cpp:expr:`lv_table_add_cell_ctrl(table, row, col, LV_TABLE_CELL_CTRL_MERGE_RIGHT)`.
To merge more adjacent cells call this function for each cell.

.. raw:: html

   </details> 
   <br>


单元格可以使用 :cpp:expr:`lv_table_add_cell_ctrl(table, row, col, LV_TABLE_CELL_CTRL_MERGE_RIGHT)` 进行水平合并。 要合并更多相邻单元格，请为每个单元格调用此函数。


Scrolling（滚动）
-----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If the label's width or height is set to :c:macro:`LV_SIZE_CONTENT` that size
will be used to show the whole table in the respective direction. E.g.
:cpp:expr:`lv_obj_set_size(table, LV_SIZE_CONTENT, LV_SIZE_CONTENT)`
automatically sets the table size to show all the columns and rows.

If the width or height is set to a smaller number than the "intrinsic"
size then the table becomes scrollable.

.. raw:: html

   </details> 
   <br>


如果标签的宽度或高度设置为 :c:macro:`LV_SIZE_CONTENT` 则该尺寸将用于在相应方向上显示整个表格。 例如。:cpp:expr:`lv_obj_set_size(table, LV_SIZE_CONTENT, LV_SIZE_CONTENT)` 自动设置表格大小以显示所有列和行。

如果宽度或高度设置为小于“固有”大小的数字，则表格变为可滚动的。


.. _lv_table_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` Sent when a new cell is selected with
   keys.

.. admonition::  Further Reading

    Learn more about :ref:`lv_obj_events` emitted by all Widgets.

    Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 用选择（通过触摸或按键点击）单元格时发送的事件。

了解更多关于所有部件都会发出的:ref:`lv_obj_events`（可参考对应引用内容）的相关信息。

了解更多关于:ref:`events`（可参考对应引用内容）的相关信息。


.. _lv_table_keys:

Keys（按键）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The following *Keys* are processed by Table Widgets:

- ``LV_KEY_RIGHT/LEFT/UP/DOWN/`` Select a cell.

Note that, as usual, the state of :cpp:enumerator:`LV_KEY_ENTER` is translated to
``LV_EVENT_PRESSED/PRESSING/RELEASED`` etc.

:cpp:expr:`lv_table_get_selected_cell(table, &row, &col)` can be used to get the
currently selected cell. Row and column will be set to
:c:macro:`LV_TABLE_CELL_NONE` no cell is selected.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


以下 *按键* 可由表格部件进行处理：

- ``LV_KEY_RIGHT/LEFT/UP/DOWN/`` 选中一个单元格。

请注意，与往常一样，:cpp:enumerator:`LV_KEY_ENTER` 的状态被转换为 ``LV_EVENT_PRESSED/PRESSING/RELEASED`` 等。

:cpp:expr:`lv_table_get_selected_cell(table, &row, &col)` 可用于获取当前选定的单元格。行和列将设置为 :c:macro:`LV_TABLE_CELL_NONE` 未选择任何单元格。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_table_example:

Example
*******

.. include:: ../examples/widgets/table/index.rst

MicroPython
-----------

No examples yet.

.. _lv_table_api:

API
***
