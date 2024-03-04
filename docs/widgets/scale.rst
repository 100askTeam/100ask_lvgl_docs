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


标尺允许您拥有具有自定义样式的范围和部分的线性标尺。


.. _lv_scale_parts_and_styles:

Parts and Styles（零件和样式）
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

- :cpp:enumerator:`LV_PART_MAIN` 主线。请参阅示例图像中的蓝线。
- :cpp:enumerator:`LV_PART_ITEMS` 轻微的蜱虫。请参阅示例图像中的红色小刻度。
- :cpp:enumerator:`LV_PART_INDICATOR` 主要刻度及其标签（如果启用）。 在示例图像中查看粉红色标签和绿色主要刻度。


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


次要范围和主要范围（每个刻度的值）配置为 :cpp:expr:`lv_scale_set_range(scale, minor_range, major_range)`。


Configure ticks（配置刻度线）
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


使用 :cpp:expr:`lv_scale_set_total_tick_count(scale, total_tick_count)` 设置总刻度数。然后使用 :cpp:expr:`lv_scale_set_major_tick_every(scale, nth_tick)`，将主要刻度线配置为每 N 个刻度线。

主要刻度上的标签可以配置lv_scale_set_label_show（刻度、show_label）、 如果应绘制标签，则将 show_label 设置为 true，如果应绘制标签，则将 设置为 true，将标签设置为隐藏标签。 如果需要在主要刻度中不需要数值，则可以设置文本 以 lv_scale_set_text_src（scale， custom_labels） 作为最后一个元素， 即静态字符 * custom_labels[3] = {“One”， “Two”， NULL};。

可以使用 :cpp:expr:`lv_scale_set_label_show(scale, show_label)` 配置主要刻度线的标签、 如果要绘制标签，则设置 `show_label` 为 true，如果要隐藏标签，则设置 :cpp:expr:`false`。如果需要在主要刻度线中使用文本而不是数值，可以使用 :cpp:expr:`false` 设置。使用 :cpp:expr:`lv_scale_set_text_src(scale, custom_labels)`，将 ``NULL`` 作为最后一个元素、 即 :cpp:expr:`static char * custom_labels[3] = {"One", "Two", NULL};`。

刻度线的长度可通过 :cpp:enumerator:`LV_PART_INDICATOR` 上的 length 样式属性配置。和 :cpp:enumerator:`LV_PART_ITEMS` 上的长度样式属性配置主要刻度线和次要刻度线，例如使用本地样式： :cpp:expr:`lv_obj_set_style_length(scale, 5, LV_PART_INDICATOR);` 用于大刻度线 和 :cpp:expr:`lv_obj_set_style_length(scale, 5, LV_PART_ITEMS);` 用于小刻度线。

Sections（部分）
---------------

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


部分是小调和大调范围之间的空间。它们可以使用 :cpp:expr:`lv_scale_add_section(scale)` 创建，它会处理一个 :cpp:type:`lv_scale_section_t` 指针。

该部分的范围配置为 :cpp:expr:`lv_scale_section_set_range(section, minor_range, major_range)` 。 标尺截面的三个部分中每个部分的样式都可以用 :cpp:expr:`lv_scale_section_set_style(section, PART, style_pointer)`设置，其中 `PART` 可以是 ， 也可以是 :cpp:enumerator:`LV_PART_MAIN`, :cpp:enumerator:`LV_PART_ITEMS` 或 :cpp:enumerator:`LV_PART_INDICATOR`, :cpp:expr:`style_pointer`  ， :cpp:type:`lv_style_t` 应该指向全局变量或静态变量。

对于标签，可以配置以下属性：:cpp:func:`lv_style_set_text_font`, :cpp:func:`lv_style_set_text_color`, :cpp:func:`lv_style_set_text_letter_space`, :cpp:func:`lv_style_set_text_opa`。

对于线（主线、主要和次要报价），可以配置以下属性：:cpp:func:`lv_style_set_line_color`, :cpp:func:`lv_style_set_line_width`。

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
