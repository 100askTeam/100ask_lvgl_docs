.. _lv_scale:

=========================
Scale （标尺）(lv_scale)
=========================

Overview（概述）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Scale allows you to have a linear scale with ranges and sections with custom styling.

.. raw:: html

   </details> 
   <br>


标尺控件允许使用自定义样式的范围和剖面进行线性缩放。


.. _lv_scale_parts_and_styles:

Parts and Styles（部分和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The scale widget is divided in the following three parts:

- :cpp:enumerator:`LV_PART_MAIN` Main line. See blue line in the example image.
- :cpp:enumerator:`LV_PART_ITEMS` Minor ticks. See red minor ticks in the example image.
- :cpp:enumerator:`LV_PART_INDICATOR` Major ticks and its labels (if enabled). 
  See pink labels and green major ticks in the example image.

.. raw:: html

   </details> 
   <br>


标尺控件分为以下三个部分：

- :cpp:enumerator:`LV_PART_MAIN` 主线。请参阅后面示例演示中的蓝线。
- :cpp:enumerator:`LV_PART_ITEMS` 每个主刻度之间的次刻度。请参阅后面示例演示中的红色次刻度。
- :cpp:enumerator:`LV_PART_INDICATOR` 主要刻度及其标签（如果启用）。 请参阅后面示例演示查看粉红色标签和绿色主刻度。


.. image:: /misc/scale.png

.. _lv_scale_usage:

Usage（用法）
************

Set ranges（设置范围）
---------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The minor and major range (values of each tick) are configured with :cpp:expr:`lv_scale_set_range(scale, minor_range, major_range)`.

.. raw:: html

   </details> 
   <br>


通过接口 :cpp:expr:`lv_scale_set_range(scale, minor_range, major_range)` 设置刻度上的最小值和最大值 。


Tick drawing order（刻度绘制顺序）
---------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can set the drawing of the ticks on top of the main line with :cpp:expr:`lv_scale_set_draw_ticks_on_top(scale, true)`. The default
drawing order is below the main line.

This is a scale with the ticks being drawn below of the main line (default):

.. image:: /misc/scale_ticks_below.png

This is an scale with the ticks being drawn at the top of the main line:

.. image:: /misc/scale_ticks_on_top.png

.. raw:: html

   </details> 
   <br>


可以通过调用 :cpp:expr:`lv_scale_set_draw_ticks_on_top(scale, true)` 将刻度的绘制设置在主线之上。默认的绘制顺序是在主线之下。

这是一个将刻度绘制在主线之下的标尺（默认情况）：

.. image:: /misc/scale_ticks_below.png

这是一个将刻度绘制在主线之上的标尺：

.. image:: /misc/scale_ticks_on_top.png



Configure ticks（配置刻度）
----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Set the number of total ticks with :cpp:expr:`lv_scale_set_total_tick_count(scale, total_tick_count)` 
and then configure the major tick being every Nth ticks with :cpp:expr:`lv_scale_set_major_tick_every(scale, nth_tick)`.

Labels on major ticks can be configured with :cpp:expr:`lv_scale_set_label_show(scale, show_label)`, 
set `show_label` to true if labels should be drawn, :cpp:expr:`false` to hide them. 
If instead of a numerical value in the major ticks a text is required they can be set 
with :cpp:expr:`lv_scale_set_text_src(scale, custom_labels)` using ``NULL`` as the last element, 
i.e. :cpp:expr:`static char * custom_labels[3] = {"One", "Two", NULL};`.

The length of the ticks can be configured with the length style property on the :cpp:enumerator:`LV_PART_INDICATOR` 
for major ticks and :cpp:enumerator:`LV_PART_ITEMS` for minor ticks, for example with local style: 
:cpp:expr:`lv_obj_set_style_length(scale, 5, LV_PART_INDICATOR);` for major ticks 
and :cpp:expr:`lv_obj_set_style_length(scale, 5, LV_PART_ITEMS);` for minor ticks.

.. raw:: html

   </details> 
   <br>


通过接口 :cpp:expr:`lv_scale_set_total_tick_count(scale, total_tick_count)` 设置总刻度数。然后使用接口 :cpp:expr:`lv_scale_set_major_tick_every(scale, nth_tick)` 设置主要刻度的分布：每 N 个刻度一个主刻度。

主要刻度上的标签可以通过函数 :cpp:expr:`lv_scale_set_label_show(scale, show_label)` 进行配置、 如果需要展示标签，则将 show_label 设置为 true，如果不想展示标签，则将 设置为 false 。 如果想修改主刻度标签的值，可以通过接口 :cpp:expr:`lv_scale_set_text_src(scale, custom_labels)` 设置， 参数 ``custom_labels`` 必须是静态数组，并且使用 ``NULL`` 作为最后一个元素，例如： :cpp:expr:`static char * custom_labels[3] = {"One", "Two", NULL};` 。

主刻度的长度可通过修改 :cpp:enumerator:`LV_PART_INDICATOR` 的 length 样式属性配置；次刻度的长度通过修改 :cpp:enumerator:`LV_PART_ITEMS` 的 length 样式属性配置。例如使用本地样式，修改主刻度线的长度： :cpp:expr:`lv_obj_set_style_length(scale, 5, LV_PART_INDICATOR);` ；修改次刻度线的长度： :cpp:expr:`lv_obj_set_style_length(scale, 5, LV_PART_ITEMS);` 。


Sections（剖面）
-----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

A section is the space between a minor and a major range. They can be created with :cpp:expr:`lv_scale_add_section(scale)` 
and it handles back an :cpp:type:`lv_scale_section_t` pointer.

The range of the section is configured with :cpp:expr:`lv_scale_section_set_range(section, minor_range, major_range)`. 
The style of each of the three parts of the scale section can be set with 
:cpp:expr:`lv_scale_section_set_style(section, PART, style_pointer)`, where `PART` can be 
:cpp:enumerator:`LV_PART_MAIN`, :cpp:enumerator:`LV_PART_ITEMS` or :cpp:enumerator:`LV_PART_INDICATOR`, 
:cpp:expr:`style_pointer` should point to a global or static :cpp:type:`lv_style_t` variable.

For labels the following properties can be configured:
:cpp:func:`lv_style_set_text_font`, :cpp:func:`lv_style_set_text_color`, 
:cpp:func:`lv_style_set_text_letter_space`, :cpp:func:`lv_style_set_text_opa`.

For lines (main line, major and minor ticks) the following properties can be configured:
:cpp:func:`lv_style_set_line_color`, :cpp:func:`lv_style_set_line_width`.

.. raw:: html

   </details> 
   <br>


剖面就是在标尺最大值和最小值之间选取一部分（一个或多个），单个可用于表示这些剖面是特别的或者是突出需要留意的，多个剖面且按照一定间距隔开时可表示这些是分层次的，类似剖面那样（比如土壤剖面尺）。它们可以使用接口 :cpp:expr:`lv_scale_add_section(scale)` 创建，它会返回 :cpp:type:`lv_scale_section_t` 指针，后续可通过 ``lv_scale_section_...`` 接口进行操作。

可通过接口 :cpp:expr:`lv_scale_section_set_range(section, minor_range, major_range)` 设置剖面的范围 。 与标尺一样，剖面也有一样的三个部分可以对其配置样式，但是需要使用特定的接口设置样式，例如： :cpp:expr:`lv_scale_section_set_style(section, PART, style_pointer)` 设置，其中 `PART` 可以是 :cpp:enumerator:`LV_PART_MAIN` , :cpp:enumerator:`LV_PART_ITEMS` 以及 :cpp:enumerator:`LV_PART_INDICATOR` ； :cpp:expr:`style_pointer` 是样式变量，必须是全局变量或静态变量。

对于标签，可以配置以下属性： :cpp:func:`lv_style_set_text_font` , :cpp:func:`lv_style_set_text_color` , :cpp:func:`lv_style_set_text_letter_space` , :cpp:func:`lv_style_set_text_opa` 。

对于线（主线、主和次刻度），可以配置以下属性：:cpp:func:`lv_style_set_line_color` , :cpp:func:`lv_style_set_line_width` 。

.. _lv_scale_events:

Events（事件）
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No events supported by this widget.

.. raw:: html

   </details> 
   <br>


此控件不支持任何事件。


.. _lv_scale_keys:

Keys
****

.. raw:: html

   <details>
     <summary>显示原文</summary>

No keys supported by this widget.

.. raw:: html

   </details> 
   <br>


此控件不支持任何按键。


.. _lv_scale_example:

Example
*******

.. include:: ../examples/widgets/scale/index.rst

.. _lv_scale_api:

API
***

:ref:`lv_scale`
