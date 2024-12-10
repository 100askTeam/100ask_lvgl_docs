.. _lv_chart:

========================
Chart（图表） (lv_chart)
========================

Overview（概述）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Charts Widget are used to visualize data.

Charts have:

- 0 or more background division lines (horizontal and vertical),
- 4 internal axes, any of which can be used to specify scale for a data series,
- a ``point_count`` (default 10) that applies to all data series added,
- 0 or more data series (you can add or remove them at any time),
- 0 or more cursors (you can add or remove them at any time),
- update mode (modifies behavior of :cpp:func:`lv_chart_set_next_value` if you use it).

Charts can:

- display flexible axes with ticks and text
- show precise locations of points or other locations on chart with cursors
- show or hide individual data series
- show or hide individual data points
- show or hide cursors
- scroll and zoom

.. raw:: html

   </details> 
   <br>


图表部件用于可视化数据。

图表具有以下特性：

- 0 条或多条背景分割线（水平和垂直方向的）；
- 4 条内部坐标轴，其中任意一条均可用于为一个数据序列指定刻度；
- 一个 ``point_count``（默认值为 10），该值适用于添加的所有数据序列；
- 0 个或多个数据序列（可随时添加或删除它们）；
- 0 个或多个游标（可随时添加或删除它们）；
- 更新模式（如果使用了 :cpp:func:`lv_chart_set_next_value` 函数，该模式会改变其行为）。

图表能够实现以下功能：

- 显示带有刻度和文本的灵活坐标轴；
- 通过游标显示图表上点的精确位置或其他位置；
- 显示或隐藏单个数据序列；
- 显示或隐藏单个数据点；
- 显示或隐藏游标；
- 滚动和缩放。

Chart Basics（图表基础）
************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Each chart has the following attributes (over and above attributes found in
:ref:`all Widgets <base_widget>`):

Type (governs how a chart's data series are drawn)
    - Can be LINE (default), BAR, SCATTER, or none.
    - You can change the chart's type at any point during it's life.

Horizontal and Vertical division lines
    - default 3 and 5 respectively
    - can be any non-negative value including 0

2 Y axes and 2 X axes (the latter are used with SCATTER charts)
    - All 4 axes come with each chart automatically (they do not have to be created).
    - Their default ranges are [0..100].  If you need a different range, set it before
      chart is drawn.
    - You "use" an axis by associating it with a data series, which happens when the
      data series is created (more on this below).  More than one data series can be
      associated with each axis.

Point count (number of data points in all data series added to the chart)
    - default 10
    - If you provide your own data-value arrays, each array so provided must contain
      at least this number of values.
    - For LINE- and BAR-charts, this is the number of points on the X axis.
    - LINE- and BAR-charts require only one data-value array to supply Y-values for each data point.
    - For SCATTER charts, this is the number of scatter-points in the data series.
    - SCATTER charts have separate data-value arrays for both X-values and Y-values.

Any number of data series
    - After a chart is created, it initially contains no data series.  You have to add them.
    - You can add and remove data series at any time during a chart's life.
    - When a data series is created, it comes with pre-allocated values array(s)
      based on its chart type and ``point_count``.  (All chart types use an array of
      Y-values.  SCATTER-type charts also use an array of X-values.).  All Y-values so
      allocated are set to :c:macro:`LV_CHART_POINT_NONE`, which causes that point to be hidden.
    - To get points to be drawn on the chart, you must set their Y-values to something
      other than :c:macro:`LV_CHART_POINT_NONE`.
    - You can hide a point by setting its Y-value to :c:macro:`LV_CHART_POINT_NONE`.
    - If desired, you can tell a data series to instead use a value array you
      provide.  If you do:

      - Pre-allocated value arrays are automatically freed.
      - That data series will continue to use *your* array from that time onward.
      - The values in your array must remain available through the life of that data series.
      - You must ensure each array provided contains at least ``point_count`` ``int32_t`` elements.
      - Management of the life any value arrays you provide is up to you.

Any number of cursors
    - After a chart is created, it initially contains no cursors.  You have to add them
      if you want to use them.
    - You can add, show, hide or remove cursors at any time during a chart's life.

Update mode
    - :ref:`See below <chart_update_modes>`  

.. raw:: html

   </details> 
   <br>


每个图表都具有以下属性（除了在 :ref:`all Widgets <base_widget>` 中能找到的属性之外）：

类型（决定图表的数据序列的绘制方式）
    - 可以是折线图（默认）、柱状图、散点图或无类型。
    - 在图表的整个生命周期内，你可以随时更改其类型。

水平和垂直分割线
    - 水平分割线默认值为 3 条，垂直分割线默认值为 5 条。
    - 可以是包括 0 在内的任何非负值。

2 条 Y 轴和 2 条 X 轴（后者用于散点图）
    - 每张图表都会自动带有全部 4 条坐标轴（无需另行创建）。
    - 它们的默认范围是 [0..100]。如果你需要不同的范围，需在绘制图表之前进行设置。
    - 通过将坐标轴与数据序列相关联来 “使用” 该坐标轴，这一关联操作在创建数据序列时进行（下文会详细说明）。每条坐标轴可与多个数据序列相关联。

点数（添加到图表中的所有数据序列中的数据点数量）
    - 默认值为 10。
    - 如果你提供自己的数据值数组，那么所提供的每个数组必须至少包含此数量的值。
    - 对于折线图和柱状图，这就是 X 轴上的点数。
    - 折线图和柱状图仅需一个数据值数组来为每个数据点提供 Y 值。
    - 对于散点图，这就是数据序列中的散点数量。
    - 散点图有分别用于 X 值和 Y 值的独立数据值数组。

任意数量的数据序列
    - 创建图表后，它最初不包含任何数据序列。你需要自行添加。
    - 在图表的整个生命周期内，你可以随时添加和删除数据序列。
    - 创建数据序列时，它会根据图表类型和 ``point_count`` 预先分配值数组。（所有图表类型都使用一个 Y 值数组。散点图类型还会使用一个 X 值数组。）所有预先分配的 Y 值都被设置为 :c:macro:`LV_CHART_POINT_NONE`，这会导致该点被隐藏。
    - 要使点在图表上绘制出来，你必须将它们的 Y 值设置为除 :c:macro:`LV_CHART_POINT_NONE` 之外的其他值。
    - 你可以通过将点的 Y 值设置为 :c:macro:`LV_CHART_POINT_NONE` 来隐藏该点。
    - 如果需要，你可以告知一个数据序列改为使用你提供的值数组。如果你这样做：

      - 预先分配的值数组会自动释放。
      - 从那时起，该数据序列将继续使用你的数组。
      - 在该数据序列的整个生命周期内，你数组中的值必须保持可用。
      - 你必须确保所提供的每个数组至少包含 “点数” 个 int32_t 元素。
      - 你所提供的任何值数组的生命周期管理由你自行负责。

任意数量的游标
    - 创建图表后，它最初不包含任何游标。如果你想使用游标，就需要自行添加。
    - 在图表的整个生命周期内，你可以随时添加、显示、隐藏或删除游标。

更新模式
    - :ref:`See below <chart_update_modes>` 

Chart layers（图表图层）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

When a chart is drawn, certain things appear on top of other things, in this
oder, from back to front:

- The chart's background (with optional division lines)
- Each data series:

  - Earliest data series added appears on top.
  - For a SCATTER chart, within each series, points later in the sequence will appear
    on top of points earlier in the sequence when there is overlap.

- Each cursor (if there are any):

  - The most recent cursor added appears on top.

.. raw:: html

   </details> 
   <br>

当绘制图表时，某些元素会按照从后到前的顺序依次覆盖在其他元素之上，顺序如下：

- 图表的背景（可带有可选的分割线）
- 每个数据序列：

  - 最先添加的数据序列会显示在最上层。
  - 对于散点图，在每个序列内部，当存在重叠情况时，序列中靠后的点会显示在靠前的点之上。

- 每个游标（如果有的话）：

  - 最新添加的游标会显示在最上层。

.. _lv_chart_parts_and_styles:

Parts and Styles（部分和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` The background of the chart. Uses all the typical
   background and *line* (for division lines) related style
   properties. *Padding* makes the series area smaller. For BAR
   charts ``pad_column`` sets the space between bars in the same data series.
-  :cpp:enumerator:`LV_PART_SCROLLBAR` A scrollbar used if the chart is zoomed. See
   :ref:`base_widget`'s documentation for details.
-  :cpp:enumerator:`LV_PART_ITEMS` Refers to the LINE or BAR data series.

   -  LINE chart: *line* properties are used by lines.
      ``width``, ``height``, ``bg_color`` and ``radius`` are used to set
      the appearance of points on the line.
   -  Bar chart: The typical background properties are used to style the
      bars. ``pad_column`` sets the space between columns in the same data series.

-  :cpp:enumerator:`LV_PART_INDICATOR` Refers to points on LINE- and SCATTER-charts
   (small circles or squares [with possibly-rounded corners]).
-  :cpp:enumerator:`LV_PART_CURSOR` *Line* properties are used to style cursors.
   ``width``, ``height``, ``bg_color`` and ``radius`` are used to set
   the appearance of the cursor's "point" showing its location.  If either ``width``
   or ``height`` are set to 0, only the cursor's lines are drawn.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_PART_MAIN`：图表的背景部分。会用到所有典型的与背景及（分割线的）*line* 相关的样式属性。 *Padding* 会使数据序列区域变小。对于柱状图， ``pad_column`` 用于设置同一数据序列中各柱状图之间的间隔。
-  :cpp:enumerator:`LV_PART_SCROLLBAR`：若图表进行了缩放操作就会用到的滚动条。详情可参阅 :ref:`base_widget`的文档。
-  :cpp:enumerator:`LV_PART_ITEMS`：指代折线图或柱状图的数据序列。

   -  折线图：*line* 属性用于线条本身。 ``width``, ``height``, ``bg_color`` 和 ``radius`` 用于设置折线上各点的外观。
   -  柱状图：典型的背景属性用于设置柱状图的样式。 ``pad_column`` 用于设置同一数据序列中各列之间的间隔。

-  :cpp:enumerator:`LV_PART_INDICATOR`：指代折线图和散点图上的点（可能是带有圆角的小圆或小方块）。
-  :cpp:enumerator:`LV_PART_CURSOR`：*line*属性用于设置游标样式。 ``width``, ``height``, ``bg_color``和 ``radius``用于设置显示游标位置的“点”的外观。如果 ``width``或 ``height``被设置为0，那么就只绘制游标的线条部分。

.. _lv_chart_usage:

Details（细节）
**************

Chart type（图表类型）
---------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

A chart can be one of the following types:

- :cpp:enumerator:`LV_CHART_TYPE_NONE`: Do not display any data. Can be used to hide chart's data.
- :cpp:enumerator:`LV_CHART_TYPE_LINE`: Draw lines between data points.  Data points
  can also be illustrated if their ``width``, ``height``, ``bg_color`` and ``radius``
  styles (for :cpp:enumerator:`LV_PART_ITEMS`) are set and both ``width`` and
  ``height`` have non-zero values.
- :cpp:enumerator:`LV_CHART_TYPE_BAR`: Draw bars.
- :cpp:enumerator:`LV_CHART_TYPE_SCATTER`: X/Y chart drawing point's and optionally
  lines between the points if line-width style values for
  :cpp:enumerator:`LV_PART_ITEMS` is a non-zero value, and the point's Y-value is
  something other than :c:macro:`LV_CHART_POINT_NONE`.  (Drawing of individual points on a
  SCATTER chart can be suppressed if their Y-values are set to :c:macro:`LV_CHART_POINT_NONE`.)

Charts start their life as LINE charts.  You can change a chart's type with
:cpp:expr:`lv_chart_set_type(chart, LV_CHART_TYPE_...)`.

.. raw:: html

   </details> 
   <br>


图表可以是以下类型之一：

- :cpp:enumerator:`LV_CHART_TYPE_NONE`：不显示任何数据。可用于隐藏图表的数据。
- :cpp:enumerator:`LV_CHART_TYPE_LINE`：在数据点之间绘制连线。如果设置了（针对 :cpp:enumerator:`LV_PART_ITEMS`的） ``width``, ``height``, ``bg_color`` 和 ``radius`` 样式，并且 ``width`` 和 ``height`` 均具有非零值，那么数据点也可以被显示出来。
- :cpp:enumerator:`LV_CHART_TYPE_BAR`：绘制柱状图。
- :cpp:enumerator:`LV_CHART_TYPE_SCATTER`：绘制X/Y坐标图中的点，如果针对 :cpp:enumerator:`LV_PART_ITEMS`的线宽样式值为非零值，并且点的 Y 值不是:c:macro:`LV_CHART_POINT_NONE`，那么还会在点之间选择性地绘制连线。（如果将散点图上单个点的Y值设置为 :c:macro:`LV_CHART_POINT_NONE`，则可以不显示这些点。）

图表在创建时默认是折线图类型。你可以使用:cpp:expr:`lv_chart_set_type(chart, LV_CHART_TYPE_...)`来更改图表的类型。

Data series（Series数据）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can add any number of data series to a chart by using

    :cpp:expr:`lv_chart_add_series(chart, color, axis)`.

This allocates (and returns a pointer to) an :cpp:expr:`lv_chart_series_t` structure
which remembers the ``color`` and ``axis`` you specified, and comes pre-allocated
with an array of ``chart->point_cnt`` ``int32_t`` Y-values, all set to
:c:macro:`LV_CHART_POINT_NONE`. (A SCATTER chart also comes with a pre-allocated array of
the same number of X-values.)

``axis`` specifies which axis is used to scale its values, and may be one of the following:

- :cpp:enumerator:`LV_CHART_AXIS_PRIMARY_Y`: Left axis
- :cpp:enumerator:`LV_CHART_AXIS_SECONDARY_Y`: Right axis
- :cpp:enumerator:`LV_CHART_AXIS_PRIMARY_X`: Bottom axis
- :cpp:enumerator:`LV_CHART_AXIS_SECONDARY_X`: Top axis

When adding a data series to a SCATTER chart, bit-wise OR your selected Y axis
(primary or secondary) with one of the X-axis values.

If you wish to have the chart use your own Y-value array instead of the one provided,
you can do so with

    :cpp:expr:`lv_chart_set_ext_y_array(chart, series, value_array)`.

You are responsible for ensuring the array you provide contains at least
``chart->point_cnt`` elements in it.

``value_array`` should look like this: ``int32_t * value_array[num_points]``.  Only
the array's pointer is saved in the series so its contents need to remain available
for the life of the series, i.e. the array needs to be global, static or dynamically
allocated.

.. note::
    Call :cpp:expr:`lv_chart_refresh(chart)` when a chart's data has changed to
    signal that the chart should be re-rendered next time a display refresh occurs.
    You do not need to do this if you are using the provided value array(s) and
    setting values with ``lv_chart_set_...value_...()`` functions.  See below
    for more information about these functions.

A pointer to the Y-value array of a series can be obtained with
:cpp:expr:`lv_chart_get_y_array(chart, series)`.  This is true whether you are using
the provided Y-value array or provided your own.

For SCATTER-type charts,

- :cpp:expr:`lv_chart_set_ext_x_array(chart, series, value_array)` and
- :cpp:expr:`lv_chart_get_x_array(chart, series)`

can be used as well.

.. raw:: html

   </details> 
   <br>


你可以通过以下方式向图表中添加任意数量的数据序列：

    :cpp:expr:`lv_chart_add_series(chart, color, axis)`.

此操作会分配（并返回一个指向）一个 :cpp:expr:`lv_chart_series_t`结构的指针，该结构会记住你指定的 ``color``和 ``axis``，并且会预先分配一个包含 ``chart->point_cnt`` ``int32_t``类型的Y值的数组，所有这些Y值都被设置为:c:macro:`LV_CHART_POINT_NONE`。（对于散点图，还会预先分配一个同样数量的 X 值数组。）

``axis`` 用于指定哪个坐标轴来为其值设置刻度，它可以是以下几种情况之一：
- :cpp:enumerator:`LV_CHART_AXIS_PRIMARY_Y`：左坐标轴
- :cpp:enumerator:`LV_CHART_AXIS_SECONDARY_Y`：右坐标轴
- :cpp:enumerator:`LV_CHART_AXIS_PRIMARY_X`：底部坐标轴
- :cpp:enumerator:`LV_CHART_AXIS_SECONDARY_X`：顶部坐标轴

当向散点图添加数据序列时，需将你所选的 Y 轴（主 Y 轴或次 Y 轴）与其中一个 X 轴值进行按位或运算。

如果你希望让图表使用你自己的 Y 值数组而非提供的那个数组，可以通过以下方式实现：

    :cpp:expr:`lv_chart_set_ext_y_array(chart, series, value_array)`.

你需要确保你所提供的数组至少包含 ``chart->point_cnt`` 个元素。

``value_array`` 应该是这样的形式： ``int32_t * value_array[num_points]``。只有数组的指针会被保存在数据序列中，所以其内容在数据序列的整个生命周期内都需要保持可用，也就是说，该数组需要是全局的、静态的或者动态分配的。

.. note::
    当图表的数据发生变化时，调用 :cpp:expr:`lv_chart_refresh(chart)` 来通知图表在下一次屏幕刷新时应该重新渲染。如果你正在使用提供的数值数组并且通过 ``lv_chart_set_...value_...()`` 函数来设置值，那么就不需要进行此操作。有关这些函数的更多信息，请见下文。

无论你是使用提供的 Y 值数组还是自己提供的数组，都可以通过 :cpp:expr:`lv_chart_get_y_array(chart, series)` 获取一个数据序列的 Y 值数组的指针。

对于散点图类型的图表，还可以使用以下操作：
- :cpp:expr:`lv_chart_set_ext_x_array(chart, series, value_array)`
- :cpp:expr:`lv_chart_get_x_array(chart, series)`

Modifying data（修改数据）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You have several options to set the Y-values for a data series:

1. Set the values programmatically in the array like ``ser1->points[3] = 7`` and refresh the
   chart with :cpp:enumerator:`lv_chart_refresh(chart)`.
2. Use :cpp:expr:`lv_chart_set_value_by_id(chart, series, id, value)` where ``id`` is
   the zero-based index of the point you wish to update.
3. Use :cpp:expr:`lv_chart_set_next_value(chart, series, value)`.
   (See `Update modes`_ below.)
4. Set all points to a single Y-value with :cpp:expr:`lv_chart_set_all_value(chart, series, value)`.

Use :c:macro:`LV_CHART_POINT_NONE` as value to make the library skip drawing
that point, column, or scatter-point.

For SCATTER-type charts,

- :cpp:expr:`lv_chart_set_value_by_id2(chart, series, id, x_value, y_value)` and
- :cpp:expr:`lv_chart_set_next_value2(chart, series, x_value, y_value)`

can be used as well.

.. raw:: html

   </details> 
   <br>


你有以下几种设置数据序列的 Y 值的方法：

1. 以编程方式在数组中设置值，比如 ``ser1->points[3] = 7``，然后使用 :cpp:enumerator:`lv_chart_refresh(chart)` 刷新图表。
2. 使用 :cpp:expr:`lv_chart_set_value_by_id(chart, series, id, value)`，其中 ``id`` 是你想要更新的点的从零开始的索引。
3. 使用 :cpp:expr:`lv_chart_set_next_value(chart, series, value)`。
（见下文的 `Update modes`_。）
4. 使用 :cpp:expr:`lv_chart_set_all_value(chart, series, value)` 将所有点设置为单个 Y 值。

使用 :c:macro:`LV_CHART_POINT_NONE` 作为值可让库跳过绘制该点、柱形（针对柱状图）或散点（针对散点图）。

对于散点图类型的图表，还可以使用以下方法：

- :cpp:expr:`lv_chart_set_value_by_id2(chart, series, id, x_value, y_value)`
- :cpp:expr:`lv_chart_set_next_value2(chart, series, x_value, y_value)`

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
Note: this affects the number of points processed when an external
value array is assigned to a series, so you also need to be sure any external
array so provided contains at least ``point_num`` elements.

.. raw:: html

   </details> 
   <br>


可以通过 :cpp:expr:`lv_chart_set_point_count(chart, point_num)` 来修改序列中的点数。默认值是 10。
注意：当将外部值数组分配给一个序列时，这会影响所处理的点数，因此你还需要确保所提供的任何外部数组至少包含 ``point_num`` 个元素。

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
would be drawn on top of the border and in this case it is not drawn so
as not to hide the chart border.

.. raw:: html

   </details> 
   <br>


水平和垂直分割线的数量可以通过 :cpp:expr:`lv_chart_set_div_line_count(chart, hdiv_num, vdiv_num)` 进行修改。默认设置是3条水平分割线和5条垂直分割线。如果某一侧有可见边框且该侧没有内边距，那么分割线会绘制在边框之上，在这种情况下就不会绘制分割线，以免遮挡图表边框。

Override default start point for series（覆盖series的默认起点）
-----------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If you want a plot to start from a point other than the default which is
``point[0]`` of the series, you can set an alternative index with the
function :cpp:expr:`lv_chart_set_x_start_point(chart, ser, id)` where ``id`` is
the new zero-based index position to start plotting from.

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

With the help of :ref:`Scale <lv_scale>`, vertical and horizontal scales can be added
in a very flexible way.  See the `examples 2 <#axis-ticks-and-labels-with-scrolling>`_
below to learn more.

.. raw:: html

   </details> 
   <br>


借助 :ref:`Scale <lv_scale>`，可以以非常灵活的方式添加垂直和水平方向的刻度。欲了解更多内容，请参阅下文的 示例 `examples 2 <#axis-ticks-and-labels-with-scrolling>`_。

Zoom（缩放）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To zoom the chart all you need to do is wrap it in a parent container and set the
chart's width and/or height to a larger value.  Doing this will cause the the chart
to be scrollable in its parent --- the parent container provides the scrollable "view
window".

.. raw:: html

   </details> 
   <br>


要对图表进行缩放，你只需将其放置在一个父容器中，并将图表的宽度和 / 或高度设置为更大的值即可。这样做会使图表在其父容器中可滚动 —— 父容器提供了可滚动的 “视图窗口”。

Cursor（光标）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

A new cursor is initially given position :c:macro:`LV_CHART_POINT_NONE` which causes
it to be hidden.  To show the cursor, its location must be set by you
programmatically using one of the functions below.

You can hide a cursor without removing it from the chart by using
:cpp:func:`lv_chart_set_cursor_point` by passing :c:macro:`LV_CHART_POINT_NONE` as
the point id.

A cursor can be added with ``lv_chart_cursor_t * c1 = lv_chart_add_cursor(chart, color, dir);``.
The possible values of ``dir`` are the enumeration values of :cpp:type:`lv_dir_t`:
``LV_DIR_NONE/RIGHT/UP/LEFT/DOWN/HOR/VER/ALL`` or their bit-wise OR-ed values to tell
the chart which direction(s) to draw its lines.

:cpp:expr:`lv_chart_set_cursor_pos(chart, cursor, &point)` sets the position of
the cursor to an arbitrary point on the chart. ``&point`` is a pointer to an
:cpp:struct:`lv_point_t` variable. E.g. ``lv_point_t point = {10, 20}``. If the chart
is scrolled, the cursor moves with it.

:cpp:expr:`lv_chart_get_point_pos_by_id(chart, series, id, &point_out)` gets the
coordinate of a given point on the chart.  This is useful to place the cursor on
that data point.

:cpp:expr:`lv_chart_set_cursor_point(chart, cursor, series, point_id)` places the
cursor on the specified data point on the chart.  If the point's position changes
(via a new value or via scrolling), the cursor moves with the point.
See an example of using this function `here <#show-cursor-on-the-clicked-point>`_.

.. raw:: html

   </details> 
   <br>


新创建的游标最初会被赋予 :c:macro:`LV_CHART_POINT_NONE` 这个位置值，这会导致它处于隐藏状态。要显示游标，你必须通过编程使用以下函数之一来设置它的位置。

你可以通过使用 :cpp:func:`lv_chart_set_cursor_point`函数并将 :c:macro:`LV_CHART_POINT_NONE` 作为点的标识传递给它，从而在不将游标从图表中移除的情况下隐藏游标。

可以使用以下方式添加一个游标： ``lv_chart_cursor_t * c1 = lv_chart_add_cursor(chart, color, dir);``;。其中， ``dir`` 的可能取值为 :cpp:type:`lv_dir_t` 的枚举值 ``LV_DIR_NONE/RIGHT/UP/LEFT/DOWN/HOR/VER/ALL`` 或者它们按位或运算后的值，用于告知图表应该在哪些方向绘制它的线条。

:cpp:expr:`lv_chart_set_cursor_pos(chart, cursor, &point)`函数可将游标位置设置为图表上的任意一点。 ``&point`` 是一个指向:cpp:struct:`lv_point_t` 变量的指针。例如， ``lv_point_t point = {10, 20}``。如果图表进行了滚动操作，游标会随之移动。

:cpp:expr:`lv_chart_get_point_pos_by_id(chart, series, id, &point_out)` 函数可获取图表上给定 点的坐标。这对于将游标放置在该数据点上很有用。

:cpp:expr:`lv_chart_set_cursor_point(chart, cursor, series, point_id)`函数可将游标放置在图表上指定的数据点上。如果该点的位置发生变化（通过新的值或者滚动操作），游标会随着该点一起移动。 有关使用此函数的示例，请参见此处 `here <#show-cursor-on-the-clicked-point>`_。

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

No *Keys* are processed by Chart Widgets.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


图表部件不处理任何 “按键” 操作。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_chart_example:

Example
*******

.. include:: ../examples/widgets/chart/index.rst

.. _lv_chart_api:

API
***
