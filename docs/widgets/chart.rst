.. _lv_chart:

========================
Chart（图表） (lv_chart)
========================

Overview（概述）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Charts are a basic object to visualize data points. Currently *Line*
charts (connect points with lines and/or draw points on them) and *Bar*
charts are supported.

Charts can have: - division lines - 2 y axis - axis ticks and texts on
ticks - cursors - scrolling and zooming

.. raw:: html

   </details> 
   <br>


图表是可以将数据点可视化的基本对象。目前支持折线图（用折线连接点和/或在其上绘制点）和柱状图。

图表可以有：

- 分割线 
- 2 y轴
- 轴刻度和文本刻度
- 光标
- 滚动和缩放


.. _lv_chart_parts_and_styles:

Parts and Styles（部分和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` The background of the chart. Uses all the typical
   background and *line* (for the division lines) related style
   properties. *Padding* makes the series area smaller. For column
   charts ``pad_column`` sets the space between the columns of the
   adjacent indices.
-  :cpp:enumerator:`LV_PART_SCROLLBAR` The scrollbar used if the chart is zoomed. See
   the :ref:`Base object <lv_obj>`\ 's documentation for details.
-  :cpp:enumerator:`LV_PART_ITEMS` Refers to the line or bar series.

   -  Line chart: The *line* properties are used by the lines.
      ``width``, ``height``, ``bg_color`` and ``radius`` is used to set
      the appearance of points.
   -  Bar chart: The typical background properties are used to style the
      bars. ``pad_column`` sets the space between the columns on the
      same index.

-  :cpp:enumerator:`LV_PART_INDICATOR` Refers to the points on line and scatter chart
   (small circles or squares).
-  :cpp:enumerator:`LV_PART_CURSOR` *Line* properties are used to style the cursors.
   ``width``, ``height``, ``bg_color`` and ``radius`` are used to set
   the appearance of points.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_PART_MAIN` 图表的背景。使用所有典型的 背景和 *Line* （用于分割线）相关样式。 *Padding* 使series区域更小。可通过 ``pad_column`` 设置相邻索引之间的间隔。
-  :cpp:enumerator:`LV_PART_SCROLLBAR` 缩放图表时使用的滚动条。看有关详细信息，请参阅 :ref:`基本对象 <lv_obj>`\ 的文档。
-  :cpp:enumerator:`LV_PART_ITEMS` 指线或柱状条：

   -  折线图： *line* 属性由折线使用。 ``width``, ``height``, ``bg_color`` 和 ``radius`` 用于设置点的外观。
   -  柱状图：典型的背景属性用于设置进度条。 ``pad_column`` 设置相邻索引的间隔。

-  :cpp:enumerator:`LV_PART_INDICATOR` 指折线图和散点图上的点 （小圆圈或正方形）。
-  :cpp:enumerator:`LV_PART_CURSOR` *Line* 属性用于设置游标的样式。 ``width``, ``height``, ``bg_color`` and ``radius`` 用于设置点的外观。


.. _lv_chart_usage:

Usage（用法）
*************

Chart type（图表类型）
---------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The following data display types exist:

- :cpp:enumerator:`LV_CHART_TYPE_NONE`: Do not display any data. Can be used to hide the series.
- :cpp:enumerator:`LV_CHART_TYPE_LINE`: Draw lines between the data points and/or points (rectangles or circles) on the data points.
- :cpp:enumerator:`LV_CHART_TYPE_BAR`: Draw bars.
- :cpp:enumerator:`LV_CHART_TYPE_SCATTER`: X/Y chart drawing point's and lines between the points. .

You can specify the display type with
:cpp:expr:`lv_chart_set_type(chart, LV_CHART_TYPE_...)`.

.. raw:: html

   </details> 
   <br>


存在以下数据显示类型：

- :cpp:enumerator:`LV_CHART_TYPE_NONE`: 不显示任何数据。可用于隐藏 series。
- :cpp:enumerator:`LV_CHART_TYPE_LINE`: 根据数据点的数量和xy轴的大小，平均间隔绘制数据点（矩形或者圆形）并且在点与点之间绘制线条连接。
- :cpp:enumerator:`LV_CHART_TYPE_BAR`: 根据数据点的数量和xy轴的大小，平均间隔绘制柱状条。
- :cpp:enumerator:`LV_CHART_TYPE_SCATTER`:根据给定的x、y坐标绘制出其在xy轴上的点和线。

你可以使用 :cpp:expr:`lv_chart_set_type(chart, LV_CHART_TYPE_...)` 指定显示类型。


Data series（Series数据）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can add any number of series to the charts by
:cpp:expr:`lv_chart_add_series(chart, color, axis)`. This allocates an
:cpp:struct:`lv_chart_series_t` structure which contains the chosen ``color`` and
an array for the data points. can have the following values:

- :cpp:enumerator:`LV_CHART_AXIS_PRIMARY_Y`: Left axis
- :cpp:enumerator:`LV_CHART_AXIS_SECONDARY_Y`: Right axis
- :cpp:enumerator:`LV_CHART_AXIS_PRIMARY_X`: Bottom axis
- :cpp:enumerator:`LV_CHART_AXIS_SECONDARY_X`: Top axis

``axis`` tells which axis's range should be used to scale the values.

:cpp:expr:`lv_chart_set_ext_y_array(chart, ser, value_array)` makes the chart
use an external array for the given series. ``value_array`` should look
like this: ``int32_t * value_array[num_points]``. The array size
needs to be large enough to hold all the points of that series. The
array's pointer will be saved in the chart so it needs to be global,
static or dynamically allocated. Note: you should call
:cpp:expr:`lv_chart_refresh(chart)` after the external data source has been
updated to update the chart.

The value array of a series can be obtained with
:cpp:expr:`lv_chart_get_y_array(chart, ser)`, which can be used with
``ext_array`` or *normal array*\ s.

For :cpp:enumerator:`LV_CHART_TYPE_SCATTER` type
:cpp:expr:`lv_chart_set_ext_x_array(chart, ser, value_array)` and
:cpp:expr:`lv_chart_get_x_array(chart, ser)` can be used as well.

.. raw:: html

   </details> 
   <br>


你可以通过函数 :cpp:expr:`lv_chart_add_series(chart, color, axis)` 向图表添加任意数量的series。这将分配一个 :cpp:struct:`lv_chart_series_t` 结构，其中包含数据点的数组。 ``axis`` 可以具有以下值：

- :cpp:enumerator:`LV_CHART_AXIS_PRIMARY_Y`: 左轴
- :cpp:enumerator:`LV_CHART_AXIS_SECONDARY_Y`: 右轴
- :cpp:enumerator:`LV_CHART_AXIS_PRIMARY_X`: 下轴
- :cpp:enumerator:`LV_CHART_AXIS_SECONDARY_X`: 上轴

``axis`` 指示应使用哪个轴的范围来缩放值。

:cpp:expr:`lv_chart_set_ext_y_array(chart, ser, value_array)` 制作图表对给定series使用外部数组。 ``value_array`` 应该看起来像 ``int32_t * value_array[num_points]``。数组大小需要足够大以容纳该series的所有点。这 array 的指针将保存在图表中，因此它需要是全局的， 静态或动态分配。注意：你应该 :cpp:expr:`lv_chart_refresh(chart)` 在外部数据源已更新被以更新图表。

一个级数的值数组可以用 :cpp:expr:`lv_chart_get_y_array(chart, ser)` 获得，可以一起使用 ``ext_array`` 或 *普通数组*\ s。

对于 :cpp:enumerator:`LV_CHART_TYPE_SCATTER` 类型 :cpp:expr:`lv_chart_set_ext_x_array(chart, ser, value_array)` 和 :cpp:expr:`lv_chart_get_x_array(chart, ser)` 也可以使用。


Modify the data（修改数据）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You have several options to set the data of series:

1. Set the values manually in the array like ``ser1->points[3] = 7`` and refresh the chart with :cpp:enumerator:`lv_chart_refresh(chart)`.
2. Use :cpp:expr:`lv_chart_set_value_by_id(chart, ser, id, value)` where ``id`` is the index of the point you wish to update.
3. Use the :cpp:expr:`lv_chart_set_next_value(chart, ser, value)`.
4. Initialize all points to a given value with :cpp:expr:`lv_chart_set_all_value(chart, ser, value)`.

Use :cpp:enumerator:`LV_CHART_POINT_NONE` as value to make the library skip drawing
that point, column, or line segment.

For :cpp:enumerator:`LV_CHART_TYPE_SCATTER` type
:cpp:expr:`lv_chart_set_value_by_id2(chart, ser, id, value)` and
:cpp:expr:`lv_chart_set_next_value2(chart, ser, x_value, y_value)` can be used
as well.

.. raw:: html

   </details> 
   <br>


有几个选项可以设置series数据：

1. 在数组中手动设置值，例如 ``ser1->points[3] = 7`` ，并使用 :cpp:enumerator:`lv_chart_refresh(chart)` 刷新图表。
2. 使用 :cpp:expr:`lv_chart_set_value_by_id(chart, ser, id, value)` 其中id是要更新的点的索引。id
3. 使用 :cpp:expr:`lv_chart_set_next_value(chart, ser, value)`。
4. 使用 :cpp:expr:`lv_chart_set_all_value(chart, ser, value)` 将所有点初始化为给定值。

使用 :cpp:enumerator:`LV_CHART_POINT_NONE` 作为值可使库跳过该点，列或线段的绘制。

对于 :cpp:enumerator:`LV_CHART_TYPE_SCATTER` 类型 :cpp:expr:`lv_chart_set_value_by_id2(chart, ser, id, value)` 和 :cpp:expr:`lv_chart_set_next_value2(chart, ser, x_value, y_value)`  也可以使用。


Update modes（更新模式）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:func:`lv_chart_set_next_value` can behave in two ways depending on *update
mode*:

- :cpp:enumerator:`LV_CHART_UPDATE_MODE_SHIFT`: Shift old data to the left and add the new one to the right.
- :cpp:enumerator:`LV_CHART_UPDATE_MODE_CIRCULAR`: Add the new data in circular fashion, like an ECG diagram.

The update mode can be changed with
:cpp:expr:`lv_chart_set_update_mode(chart, LV_CHART_UPDATE_MODE_...)`.

.. raw:: html

   </details> 
   <br>


:cpp:func:`lv_chart_set_next_value` 可以以两种方式运行，具体取决于 *更新模式* ：

- :cpp:enumerator:`LV_CHART_UPDATE_MODE_SHIFT`: 将旧数据向左移动，将新数据添加到右侧。
- :cpp:enumerator:`LV_CHART_UPDATE_MODE_CIRCULAR`: 以循环方式添加新数据，如心电图。

更新模式可以通过 :cpp:expr:`lv_chart_set_update_mode(chart, LV_CHART_UPDATE_MODE_...)`。


Number of points（点数）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The number of points in the series can be modified by
:cpp:expr:`lv_chart_set_point_count(chart, point_num)`. The default value is 10.
Note: this also affects the number of points processed when an external
buffer is assigned to a series, so you need to be sure the external
array is large enough.

.. raw:: html

   </details> 
   <br>


series中的点数可以通过 :cpp:expr:`lv_chart_set_point_count(chart, point_num)` 进行修改。默认值为 10。注意：这也会影响外部处理的点数缓冲区被分配给一个series，所以你需要确保外部数组足够大。


Handling large number of points（处理很密集的点）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

On line charts, if the number of points is greater than the pixels
horizontally, the Chart will draw only vertical lines to make the
drawing of large amount of data effective. If there are, let's say, 10
points to a pixel, LVGL searches the smallest and the largest value and
draws a vertical lines between them to ensure no peaks are missed.

.. raw:: html

   </details> 
   <br>


在折线图上，如果点数大于水平方向上的像素范围，图表将只绘制垂直线来让大量数据的绘制有效。比如，每像素10个点，LVGL搜索最小值和最大值，并在它们之间画一条垂直线，以确保没有遗漏峰值。。


Vertical range（垂直范围）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can specify the minimum and maximum values in y-direction with
:cpp:expr:`lv_chart_set_range(chart, axis, min, max)`. ``axis`` can be
:cpp:enumerator:`LV_CHART_AXIS_PRIMARY` (left axis) or :cpp:enumerator:`LV_CHART_AXIS_SECONDARY`
(right axis).

The value of the points will be scaled proportionally. The default range
is: 0..100.

.. raw:: html

   </details> 
   <br>


你可以使用 :cpp:expr:`lv_chart_set_range(chart, axis, min, max)` 指定 y 方向的最小值和最大值。 ``axis`` 可以是（左轴）或（右轴）。:cpp:enumerator:`LV_CHART_AXIS_PRIMARY` (左轴) 或 :cpp:enumerator:`LV_CHART_AXIS_SECONDARY`
(右轴).

点的值将按比例缩放。默认范围是：0..100。


Division lines（分割线）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The number of horizontal and vertical division lines can be modified by
:cpp:expr:`lv_chart_set_div_line_count(chart, hdiv_num, vdiv_num)`. The default
settings are 3 horizontal and 5 vertical division lines. If there is a
visible border on a side and no padding on that side, the division line
would be drawn on top of the border and therefore it won't be drawn.

.. raw:: html

   </details> 
   <br>


水平和垂直分割线的数量可以通过 :cpp:expr:`lv_chart_set_div_line_count(chart, hdiv_num, vdiv_num)` 进行修改。默认设置为 3 条水平分割线和 5 条垂直分割线。如果一侧有可见的边框，并且该侧没有填充，则分割线将绘制在边框的顶部，因此不会绘制。


Override default start point for series（覆盖series的默认起点）
-----------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If you want a plot to start from a point other than the default which is
``point[0]`` of the series, you can set an alternative index with the
function :cpp:expr:`lv_chart_set_x_start_point(chart, ser, id)` where ``id`` is
the new index position to start plotting from.

Note that :cpp:enumerator:`LV_CHART_UPDATE_MODE_SHIFT` also changes the
``start_point``.

.. raw:: html

   </details> 
   <br>


如果希望绘图从series的默认点以外的点 ``point[0]`` 开始，则可以使用函数 :cpp:expr:`lv_chart_set_x_start_point(chart, ser, id)`  其中 ``id`` 是要从中开始绘图的新索引位置。

请注意， :cpp:enumerator:`LV_CHART_UPDATE_MODE_SHIFT` 也会更改 ``start_point``。


Tick marks and labels（刻度线和标签）
-----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

With the help of `Scale </widgets/scale>`__, vertical and horizontal scales can be added in a very flexible way.
See the example below to learn more.

.. raw:: html

   </details> 
   <br>


借助 `Scale </widgets/scale>`__控件，可以非常灵活地添加垂直和水平刻度。 请参阅后面的示例以了解更多信息。


Zoom（缩放）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To zoom the chart all you need to is wrapping it into a parent container and set the chart's width or height
to larger value. This way the chart will be scrollable on its parent.

.. raw:: html

   </details> 
   <br>


要缩放图表，你只需将其包装到父容器中，并将图表的宽度或高度设置为更大的值。这样，图表将在其父级上得到放大的效果并可滚动查看。


Cursor（光标）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

A cursor can be added with ``lv_chart_cursor_t * c1 = lv_chart_add_cursor(chart, color, dir);``.
The possible values of ``dir`` ``LV_DIR_NONE/RIGHT/UP/LEFT/DOWN/HOR/VER/ALL`` or their OR-ed values to
tell in which direction(s) should the cursor be drawn.

:cpp:expr:`lv_chart_set_cursor_pos(chart, cursor, &point)` sets the position of
the cursor. ``pos`` is a pointer to an :cpp:struct:`lv_point_t` variable. E.g.
``lv_point_t point = {10, 20}``. If the chart is scrolled the cursor
will remain in the same place.

:cpp:expr:`lv_chart_get_point_pos_by_id(chart, series, id, &point_out)` gets the
coordinate of a given point. It's useful to place the cursor at a given
point.

:cpp:expr:`lv_chart_set_cursor_point(chart, cursor, series, point_id)` sticks
the cursor at a point. If the point's position changes (new value or
scrolling) the cursor will move with the point.

.. raw:: html

   </details> 
   <br>


可以使用 ``lv_chart_cursor_t * c1 = lv_chart_add_cursor(chart, color, dir);`` 添加光标。 ``dir`` 的值可以是 ``LV_DIR_NONE/RIGHT/UP/LEFT/DOWN/HOR/VER/ALL`` 或它们的OR-ed 值，用于指示应在哪个方向上绘制光标。

:cpp:expr:`lv_chart_set_cursor_pos(chart, cursor, &point)` 设置光标的位置。``pos`` 是指向 :cpp:struct:`lv_point_t` 变量的指针。例如 ``lv_point_t point = {10, 20}``。如果滚动图表，光标将保持在同一位置。

:cpp:expr:`lv_chart_get_point_pos_by_id(chart, series, id, &point_out)` 获取给定点的坐标。将光标放在给定的位置很有用。

:cpp:expr:`lv_chart_set_cursor_point(chart, cursor, series, point_id)` 将光标粘在一个点上。如果点的位置发生变化（新值或滚动），光标将随点移动。


.. _lv_chart_events:

Events（事件）
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` Sent when a new point is clicked pressed.
   :cpp:expr:`lv_chart_get_pressed_point(chart)` returns the zero-based index of
   the pressed point.

See the events of the :ref:`Base object <lv_obj>` too.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 单击按下新点时发送。:cpp:expr:`lv_chart_get_pressed_point(chart)` 返回从零开始的索引按下的点。

另请参阅 :ref:`基本对象 <lv_obj>` 的事件。

详细了解更多 :ref:`events`。


.. _lv_chart_keys:

Keys（按键）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No *Keys* are processed by the object type.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


对象类型不处理任何 *按键*。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_chart_example:

Example
*******

.. include:: ../examples/widgets/chart/index.rst

.. _lv_chart_api:

API
***
