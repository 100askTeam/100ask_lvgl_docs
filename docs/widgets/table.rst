.. _lv_table:

======================
Table（表格） (lv_table)
======================

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Tables, as usual, are built from rows, columns, and cells containing
texts.

The Table object is very lightweight because only the texts are stored.
No real objects are created for cells but they are just drawn on the
fly.

The Table is added to the default group (if it is set). Besides the
Table is an editable object to allow selecting a cell with encoder
navigation too.

.. raw:: html

   </details> 
   <br>


Table（表格）是由包含文本的行、列和单元格构建的。

表格对象非常轻量级，因为仅存储文本。没有为各个单元格创建真实的对象，因为它们只是即时绘制出来的。

表格对象默认已经在默认组中（如果已设置）。可以在导航模式下选中整张表，之后进入编辑模式可以在各个单元格之间进行移动选择。


.. _lv_table_parts_and_styles:

Parts and Styles（部分和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` The background of the table uses all the typical
   background style properties.
-  :cpp:enumerator:`LV_PART_ITEMS` The cells of the table also use all the typical
   background style properties and the text properties.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_PART_MAIN` 表格的背景使用了所有典型的背景样式属性。
-  :cpp:enumerator:`LV_PART_ITEMS` 表格的单元格也使用所有典型的背景样式属性和文本属性。


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
saved by the table so it can be even a local variable.

Line breaks can be used in the text like ``"Value\n60.3"``.

New rows and columns are automatically added is required

.. raw:: html

   </details> 
   <br>


单元格只能存储文本，因此在将数字显示在表格中之前，需要将其转换为文本。

:cpp:expr:`lv_table_set_cell_value(table, row, col, "Content")`。 传入的文本由表独立保存，因此它甚至可以是局部变量。这个接口会自动添加新的行和列。

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
the Table object will be set to the sum of columns widths.

The height is calculated automatically from the cell styles (font,
padding etc) and the number of rows.

.. raw:: html

   </details> 
   <br>


列的宽度可以通过 :cpp:expr:`lv_table_set_column_width(table, col_id, width)` 设置。 Table 对象的总宽度将设置为列宽的总和。

表格对象会根据单元的格样式（字体、填充等）和行数自动计算高度。


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


Scroll（滚动）
--------------

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

See the events of the :ref:`Base object <lv_obj>` too.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 用选择（通过触摸或按键点击）单元格时发送的事件。

参见 :ref:`Base object <lv_obj>` 的事件。

详细了解更多 :ref:`events`。


.. _lv_table_keys:

Keys（按键）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The following *Keys* are processed by the Tables: -
``LV_KEY_RIGHT/LEFT/UP/DOWN/`` Select a cell.

Note that, as usual, the state of :cpp:enumerator:`LV_KEY_ENTER` is translated to
``LV_EVENT_PRESSED/PRESSING/RELEASED`` etc.

:cpp:expr:`lv_table_get_selected_cell(table, &row, &col)` can be used to get the
currently selected cell. Row and column will be set to
:c:macro:`LV_TABLE_CELL_NONE` no cell is selected.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


以下 *按键* 由表处理：

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
