.. _lv_scale:

=========================
Scale （标尺）(lv_scale)
=========================

Overview（概述）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Scale Widgets show linear or circular scales with configurable ranges, tick counts,
placement, labeling, and sub-sections (:ref:`scale_sections`) with custom styling.

.. raw:: html

   </details> 
   <br>


量表部件（Scale Widgets）可显示线性或圆形量表，其具有可配置的范围、刻度数量、刻度位置、刻度标签以及带有自定义样式的子部分(:ref:`scale_sections`)。

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

Mode
----

.. raw:: html

   <details>
     <summary>显示原文</summary>

When a Scale Widget is created, it starts out in MODE
:cpp:enumerator:`LV_SCALE_MODE_HORIZONTAL_BOTTOM`.  This makes the scale horizontal
with tick marks below the line.  If you need it to have a different shape, orientation
or tick position, use :cpp:expr:`lv_scale_set_mode(scale, mode)`, where ``mode`` can
be any of these values:

- :cpp:enumerator:`LV_SCALE_MODE_HORIZONTAL_TOP`
- :cpp:enumerator:`LV_SCALE_MODE_HORIZONTAL_BOTTOM`
- :cpp:enumerator:`LV_SCALE_MODE_VERTICAL_LEFT`
- :cpp:enumerator:`LV_SCALE_MODE_VERTICAL_RIGHT`
- :cpp:enumerator:`LV_SCALE_MODE_ROUND_INNER`
- :cpp:enumerator:`LV_SCALE_MODE_ROUND_OUTER`

.. raw:: html

   </details> 
   <br>

当创建一个量表部件（Scale Widget）时，它最初处于 :cpp:enumerator:`LV_SCALE_MODE_HORIZONTAL_BOTTOM`模式下。这会使量表呈水平方向，且刻度标记位于线条下方。如果需要它具有不同的形状、方向或刻度位置，可使用 :cpp:expr:`lv_scale_set_mode(scale, mode)`，其中 ``mode`` 可以是以下任意值：

- :cpp:enumerator:`LV_SCALE_MODE_HORIZONTAL_TOP`
- :cpp:enumerator:`LV_SCALE_MODE_HORIZONTAL_BOTTOM`
- :cpp:enumerator:`LV_SCALE_MODE_VERTICAL_LEFT`
- :cpp:enumerator:`LV_SCALE_MODE_VERTICAL_RIGHT`
- :cpp:enumerator:`LV_SCALE_MODE_ROUND_INNER`
- :cpp:enumerator:`LV_SCALE_MODE_ROUND_OUTER`

Setting ranges（设置范围）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

A Scale starts its life with a default range of [0..100].  You can change this
range with :cpp:expr:`lv_scale_set_range(scale, min, max)`.

.. raw:: html

   </details> 
   <br>


量表在初始创建时默认的范围是 [0..100]。你可以使用 :cpp:expr:`lv_scale_set_range(scale, min, max)`来更改这个范围。

Tick drawing order（刻度绘制顺序）
---------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Normally ticks and their labels are drawn first and the main line is drawn next,
giving the ticks and their labels the appearance of being underneath the main line
when there is overlap.  You can reverse this sequence if you wish, making the ticks
and labels appear on top the main line, using
:cpp:expr:`lv_scale_set_draw_ticks_on_top(scale, true)`.  (This effect can be
reversed by passing ``false`` instead.)

Example with with ticks and labels drawn *under* the main line (default):

.. image:: /misc/scale_ticks_below.png

Example with ticks and labels drawn *on top of* the main line:

.. image:: /misc/scale_ticks_on_top.png

.. raw:: html

   </details> 
   <br>


通常情况下，刻度及其标签会先被绘制出来，然后再绘制主线，这样当存在重叠情况时，刻度及其标签看起来就像是在主线的下方。如果需要的话，你可以反转这个绘制顺序，使用 :cpp:expr:`lv_scale_set_draw_ticks_on_top(scale, true)`让刻度和标签显示在主线的上方（若传递 ``false`` 则可恢复原来的效果）。

刻度和标签绘制在主线下方（默认情况）的示例：

.. image:: /misc/scale_ticks_below.png

刻度和标签绘制在主线上方的示例：

.. image:: /misc/scale_ticks_on_top.png



Configure ticks（配置刻度）
----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You configure the major and minor ticks of a Scale by calling 2 functions:

- :cpp:expr:`lv_scale_set_total_tick_count(scale, total_tick_count)`, and
- :cpp:expr:`lv_scale_set_major_tick_every(scale, nth_tick)`.

If you want labels to be drawn with the major ticks, call
:cpp:expr:`lv_scale_set_label_show(scale, true)`.  (Pass ``false`` to hide them again.)

By default, the labels shown are the numeric values of the scale at the major tick
points.  Can you specify different label content by calling
:cpp:expr:`lv_scale_set_text_src(scale, custom_labels)` where ``custom_labels`` is an
array of string pointers.  Example:

.. code-block:: c

    static char * custom_labels[3] = {"One", "Two", NULL};

Note that a ``NULL`` pointer is used to terminate the list.

The content of the buffers pointed to need to remain valid for the life of the Scale.

For a Scale in one of the ``..._ROUND_...`` modes, you can optionally get it to
rotate the major-tick labels to match the rotation of the major ticks using
:cpp:expr:`lv_obj_set_style_transform_rotation(scale, LV_SCALE_LABEL_ROTATE_MATCH_TICKS, LV_PART_INDICATOR)`.

Alternately, labels can be rotated by a fixed amount (for any Scale mode).  This
example rotates labels by 20 degrees:
:cpp:expr:`lv_obj_set_style_transform_rotation(scale, 200, LV_PART_INDICATOR)`.

Or both of the above can be done at the same time:
:cpp:expr:`lv_obj_set_style_transform_rotation(scale, LV_SCALE_LABEL_ROTATE_MATCH_TICKS + 200, LV_PART_INDICATOR)`.

Some labels of the Scale might be drawn upside down (to match the tick) if the Scale includes a certain angle range.
If you don't want this, to automatically rotate the labels to keep them upright, an additional flag can be used.
Labels that would be upside down are then rotated 180
:cpp:expr:`lv_obj_set_style_transform_rotation(scale, LV_SCALE_LABEL_ROTATE_MATCH_TICKS | LV_SCALE_LABEL_ROTATE_KEEP_UPRIGHT, LV_PART_INDICATOR)`.
Labels can also be moved a fixed distance in X and Y pixels using
:cpp:expr:`lv_obj_set_style_translate_x(scale, 10, LV_PART_INDICATOR)`.

.. note::

    The major tick value is calculated with the :cpp:expr:`lv_map` API (when not
    setting custom labels), this calculation takes into consideration the total
    number of ticks and the Scale range, so the label drawn can present rounding
    errors when the calculated value is a floating-point value.

The length of the ticks can be configured with the length Style property on the
:cpp:enumerator:`LV_PART_INDICATOR` for major ticks and :cpp:enumerator:`LV_PART_ITEMS`
for minor ticks.  Example with local Style:
:cpp:expr:`lv_obj_set_style_length(scale, 5, LV_PART_INDICATOR)` for major ticks
and :cpp:expr:`lv_obj_set_style_length(scale, 5, LV_PART_ITEMS)` for minor ticks. The ticks can be
padded in either direction (outwards or inwards) for ``..._ROUND_...`` Scales only with:
:cpp:expr:`lv_obj_set_style_radial_offset(scale, 5, LV_PART_INDICATOR)` for major ticks and
:cpp:expr:`lv_obj_set_style_radial_offset(scale, 5, LV_PART_ITEMS)` for minor.
Using length and radial offset together allows total control of the tick position.

It is also possible to offset the labels from the major ticks (either positive or negative) using
:cpp:expr:`lv_obj_set_style_pad_radial(scale, 5, LV_PART_INDICATOR)`

.. raw:: html

   </details> 
   <br>


你可以通过调用以下两个函数来配置量表（Scale）的主刻度和次刻度：

- :cpp:expr:`lv_scale_set_total_tick_count(scale, total_tick_count)`, and
- :cpp:expr:`lv_scale_set_major_tick_every(scale, nth_tick)`.

如果你希望在主刻度处绘制标签，可调用 :cpp:expr:`lv_scale_set_label_show(scale, true)`（传递 ``false`` 可再次隐藏它们）。

默认情况下，显示的标签是量表在主刻度点处的数值。你可以通过调用 :cpp:expr:`lv_scale_set_text_src(scale, custom_labels)`来指定不同的标签内容，其中 ``custom_labels`` 是一个字符串指针数组。示例如下：

.. code-block:: c

    static char * custom_labels[3] = {"One", "Two", NULL};
   
请注意，使用 ``NULL`` 指针来终止列表。指向缓冲区的内容在量表的整个生命周期内都需要保持有效。

所指向的缓冲区的内容在量表的整个生命周期内都需要保持有效。

对于处于 ``..._ROUND_...`` 模式之一的量表，你可以选择让它旋转主刻度标签以使其与主刻度的旋转相匹配，使用 :cpp:expr:`lv_obj_set_style_transform_rotation(scale, LV_SCALE_LABEL_ROTATE_MATCH_TICKS, LV_PART_INDICATOR)`。

或者，标签也可以按固定角度旋转（适用于任何量表模式）。以下示例将标签旋转 20 度:cpp:expr:`lv_obj_set_style_transform_rotation(scale, 200, LV_PART_INDICATOR)`。

又或者上述两种操作可以同时进行:cpp:expr:`lv_obj_set_style_transform_rotation(scale, LV_SCALE_LABEL_ROTATE_MATCH_TICKS + 200, LV_PART_INDICATOR)`。

如果量表涵盖了特定的角度范围，部分量表的标签可能会上下颠倒绘制（为了与刻度匹配）。如果你不希望这样，想要自动旋转标签使其保持正向，可以使用一个额外的标志。原本会上下颠倒的标签将会旋转 180 度：:cpp:expr:`lv_obj_set_style_transform_rotation(scale, LV_SCALE_LABEL_ROTATE_MATCH_TICKS | LV_SCALE_LABEL_ROTATE_KEEP_UPRIGHT, LV_PART_INDICATOR)`。
也可以使用 :cpp:expr:`lv_obj_set_style_translate_x(scale, 10, LV_PART_INDICATOR)`将标签在 X 和 Y 像素方向上移动固定的距离。

.. note::

    主刻度的值在未设置自定义标签时是通过 :cpp:expr:`lv_map`来计算的，该计算会考虑刻度总数和量表范围，所以当计算出的值是浮点值时，绘制的标签可能会出现舍入误差。

刻度的长度可以通过在 :cpp:enumerator:`LV_PART_INDICATOR`上针对主刻度以及在 :cpp:enumerator:`LV_PART_ITEMS`上针对次刻度使用长度样式属性来配置。使用本地样式的示例如下：针对主刻度使用 :cpp:expr:`lv_obj_set_style_length(scale, 5, LV_PART_INDICATOR)` ，针对次刻度使用 :cpp:expr:`lv_obj_set_style_length(scale, 5, LV_PART_ITEMS)`。仅对于 ``..._ROUND_...`` 模式的量表，刻度可以在任意方向（向外或向内）进行填充，针对主刻度使用 :cpp:expr:`lv_obj_set_style_radial_offset(scale, 5, LV_PART_INDICATOR)`，针对次刻度使用 :cpp:expr:`lv_obj_set_style_radial_offset(scale, 5, LV_PART_ITEMS)`。将长度和径向偏移一起使用可以完全控制刻度的位置。

还可以使用:cpp:expr:`lv_obj_set_style_pad_radial(scale, 5, LV_PART_INDICATOR)`将标签相对于主刻度进行正向或负向的偏移。   

Sections（剖面）
-----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Sections make it possible for portions of a Scale to *convey meaning* by using
different Style properties to draw them (colors, line thicknesses, font, etc.).

A Section represents a sub-range of the Scale, whose Styles (like Cascading Style
Sheets) take precedence while drawing the PARTS (lines, arcs, ticks and labels) of
the Scale that are within the range of that Section.

If a PART of a Scale is within the range of 2 or more Sections (i.e. those Sections
overlap), the Style's properties belonging to the most recently added Section takes
precedence over the same style properties of other Section(s) that "involve" that
PART.

.. raw:: html

   </details> 
   <br>


通过使用不同的样式属性（颜色、线条粗细、字体等）来绘制，区段（Sections）能够使量表的某些部分传达出特定含义。

一个区段代表量表的一个子范围，在绘制处于该子范围之内的量表各部分（线条、弧线、刻度和标签）时，其样式（就如同层叠样式表那样）具有优先级。

如果量表的某个部分处于两个或更多区段的范围内（即这些区段相互重叠），那么属于最后添加的那个区段的样式属性，相较于涉及该部分的其他区段的相同样式属性而言，具有更高的优先级。

.. _scale_creating_sections:

Creating Sections(创建区段)
----------------------------
.. raw:: html

   <details>
     <summary>显示原文</summary>

A Section is created using :cpp:expr:`lv_scale_add_section(scale)`, which returns a
pointer to a :cpp:type:`lv_scale_section_t` object.  This creates a Section with
range [0..0] and no Styles added to it, which ensures that Section will not be drawn
yet:  it needs both a range inside the Scale's range and at least one :ref:`Style
<styles>` added to it before it will be used in drawing the Scale.

Next, set the range using :cpp:expr:`lv_scale_section_set_range(section, min, max)`
where ``min`` and ``max`` are the Section's boundary values that should normally be
within the Scale's value range.  (If they are only partially within the Scale's
range, the Scale will only use that portion of the Section that overlaps the Scale's
range.  If a Section's range is not within the Scale's range at all, it will not be
used in drawing.  That can be useful to temporarily "disable" a Section, e.g.
:cpp:expr:`lv_scale_section_set_range(section, 0, -1)`.)

.. raw:: html

   </details> 
   <br>

使用 :cpp:expr:`lv_scale_add_section(scale)`来创建一个区段（Section），该函数会返回一个指向 :cpp:type:`lv_scale_section_t`对象的指针。这样创建出来的区段其范围是 [0..0]，并且没有添加任何样式，这确保了该区段暂时不会被绘制出来：在它能够用于绘制量表之前，既需要有处于量表取值范围内的范围值，又需要至少添加一个:ref:`Style
<styles>`才行。

接下来，使用 :cpp:expr:`lv_scale_section_set_range(section, min, max)`来设置范围，其中 ``min`` 和 ``max`` 是该区段的边界值，通常它们应当处于量表的取值范围之内。（如果它们只是部分处于量表的取值范围之内，那么量表将只会使用该区段与量表取值范围相重叠的那部分。如果一个区段的范围完全不在量表的取值范围之内，那么它在绘制时将不会被使用。这对于临时 “禁用” 一个区段来说是很有用的，例如 :cpp:expr:`lv_scale_section_set_range(section, 0, -1)`.)


.. _scale_styling_sections:

Styling Sections(设置区段样式)
------------------------------
.. raw:: html

   <details>
     <summary>显示原文</summary>

You set a Section's Style properties by creating a :cpp:type:`lv_style_t` object
for each "section" you want to appear different than the parent Scale.  Add style
properties as is documented in :ref:`style_initialize`.

You attach each :cpp:type:`lv_style_t` object to each Section it will apply to using
:cpp:expr:`lv_scale_section_set_style(section, PART, style_pointer)`, where:

- ``style_pointer`` should point to the contents of a global or static variable (can
  be dynamically-allocated), since it needs to remain valid through the life of the
  Scale; and

- ``PART`` indicates which single :ref:`PART <lv_scale_parts_and_styles>` of the
  parent Scale it will apply to, namely :cpp:enumerator:`LV_PART_MAIN`,
  :cpp:enumerator:`LV_PART_ITEMS` or :cpp:enumerator:`LV_PART_INDICATOR`.

Unlike adding normal styles to Widgets, you cannot combine PARTs by bit-wise OR-ing
the PART values together to get the style to apply to more than one part.  However,
you can do something like this to accomplish the same thing:

.. code-block:: c

    static lv_style_t  tick_style;
    lv_style_init(&tick_style);
    lv_style_set_line_color(&tick_style, lv_palette_darken(LV_PALETTE_RED, 3));
    lv_scale_section_set_style(section, LV_PART_ITEMS, &tick_style);
    lv_scale_section_set_style(section, LV_PART_INDICATOR, &tick_style);

to get that one Style object to apply to both major and minor ticks.

:cpp:type:`lv_style_t` objects can be shared among Sections and among PARTs, but
unlike normal Styles added to a Widget, a Section can only have 1 style per PART.
Thus, doing this:

.. code-block:: c

    lv_scale_section_set_style(section, LV_PART_INDICATOR, &tick_style_1);
    lv_scale_section_set_style(section, LV_PART_INDICATOR, &tick_style_2);

replaces ``tick_style_1`` with ``tick_style_2`` for part
:cpp:enumerator:`LV_PART_INDICATOR` rather than adding to it.

.. raw:: html

   </details> 
   <br>

你可以通过为每个想要呈现出与父量表不同外观的 “区段” 创建一个 :cpp:type:`lv_style_t`对象来设置区段的样式属性。按照在 :ref:`style_initialize`中记录的方式添加样式属性。

你可以使用 :cpp:expr:`lv_scale_section_set_style(section, PART, style_pointer)`将每个 :cpp:type:`lv_style_t` 类型的对象附加到它要应用的每个区段上，其中：

- ``style_pointer`` 应当指向一个全局或静态变量（也可以是动态分配的）的内容，因为在量表的整个生命周期内它都需要保持有效；并且

- ``PART`` 指明了它将应用于父量表的哪个:ref:`PART <lv_scale_parts_and_styles>`部分，即 :cpp:enumerator:`LV_PART_MAIN`、:cpp:enumerator:`LV_PART_ITEMS`或 :cpp:enumerator:`LV_PART_INDICATOR`。

与向部件添加常规样式不同的是，你不能通过按位或（bit-wise OR-ing）这些部分的值来组合部分，以使样式应用于多个部分。不过，你可以像下面这样做来实现相同的效果：

.. code-block:: c

    static lv_style_t  tick_style;
    lv_style_init(&tick_style);
    lv_style_set_line_color(&tick_style, lv_palette_darken(LV_PALETTE_RED, 3));
    lv_scale_section_set_style(section, LV_PART_ITEMS, &tick_style);
    lv_scale_section_set_style(section, LV_PART_INDICATOR, &tick_style);

这样就能让这个样式对象同时应用于主刻度和次刻度了。

:cpp:type:`lv_style_t` 类型的对象可以在区段之间以及部分之间共享，但是与添加到部件的常规样式不同，一个区段对于每个部分只能有一个样式。因此，像下面这样做：

.. code-block:: c

    lv_scale_section_set_style(section, LV_PART_INDICATOR, &tick_style_1);
    lv_scale_section_set_style(section, LV_PART_INDICATOR, &tick_style_2);

会用 ``tick_style_2`` 替换掉针对 :cpp:enumerator:`LV_PART_INDICATOR` 部分的 ``tick_style_1``，而不是在其基础上添加。

Useful Style Properties for Sections(对于区段（Section）有用的样式属性)
----------------------------------------------------------------------
.. raw:: html

   <details>
     <summary>显示原文</summary>

The Style properties that are used during Scale drawing (and are thus useful) are:

- For main line *when it is a straight line* (:cpp:enumerator:`LV_PART_MAIN`):

  :LV_STYLE_LINE_WIDTH:         :cpp:func:`lv_style_set_line_width`
  :LV_STYLE_LINE_COLOR:         :cpp:func:`lv_style_set_line_color`
  :LV_STYLE_LINE_OPA:           :cpp:func:`lv_style_set_line_opa`

- For main line *when it is an arc* (:cpp:enumerator:`LV_PART_MAIN`):

  :LV_STYLE_ARC_WIDTH:          :cpp:func:`lv_style_set_arc_width`
  :LV_STYLE_ARC_COLOR:          :cpp:func:`lv_style_set_arc_color`
  :LV_STYLE_ARC_OPA:            :cpp:func:`lv_style_set_arc_opa`
  :LV_STYLE_ARC_ROUNDED:        :cpp:func:`lv_style_set_arc_rounded`
  :LV_STYLE_ARC_IMAGE_SRC:      :cpp:func:`lv_style_set_arc_image_src`

- For tick lines (:cpp:enumerator:`LV_PART_ITEMS` and :cpp:enumerator:`LV_PART_INDICATOR`):

  :LV_STYLE_LINE_WIDTH:         :cpp:func:`lv_style_set_line_width`
  :LV_STYLE_LINE_COLOR:         :cpp:func:`lv_style_set_line_color`
  :LV_STYLE_LINE_OPA:           :cpp:func:`lv_style_set_line_opa`

- For labels on major ticks (:cpp:enumerator:`LV_PART_INDICATOR`)

  :LV_STYLE_TEXT_COLOR:         :cpp:func:`lv_style_set_text_color`
  :LV_STYLE_TEXT_OPA:           :cpp:func:`lv_style_set_text_opa`
  :LV_STYLE_TEXT_LETTER_SPACE:  :cpp:func:`lv_style_set_text_letter_space`
  :LV_STYLE_TEXT_FONT:          :cpp:func:`lv_style_set_text_font`

.. raw:: html

   </details> 
   <br>

在量表绘制过程中会用到的样式属性（因而很有用）如下：

- 当主线为直线时（对应 (:cpp:enumerator:`LV_PART_MAIN`)）：

  :LV_STYLE_LINE_WIDTH:         :cpp:func:`lv_style_set_line_width`
  :LV_STYLE_LINE_COLOR:         :cpp:func:`lv_style_set_line_color`
  :LV_STYLE_LINE_OPA:           :cpp:func:`lv_style_set_line_opa`

- 当主线为弧线时（对应 (:cpp:enumerator:`LV_PART_MAIN`)）：

  :LV_STYLE_ARC_WIDTH:          :cpp:func:`lv_style_set_arc_width`
  :LV_STYLE_ARC_COLOR:          :cpp:func:`lv_style_set_arc_color`
  :LV_STYLE_ARC_OPA:            :cpp:func:`lv_style_set_arc_opa`
  :LV_STYLE_ARC_ROUNDED:        :cpp:func:`lv_style_set_arc_rounded`
  :LV_STYLE_ARC_IMAGE_SRC:      :cpp:func:`lv_style_set_arc_image_src`

- 对于刻度线（对应 (:cpp:enumerator:`LV_PART_ITEMS` and :cpp:enumerator:`LV_PART_INDICATOR`)）：

  :LV_STYLE_LINE_WIDTH:         :cpp:func:`lv_style_set_line_width`
  :LV_STYLE_LINE_COLOR:         :cpp:func:`lv_style_set_line_color`
  :LV_STYLE_LINE_OPA:           :cpp:func:`lv_style_set_line_opa`

- 对于主刻度上的标签（对应 (:cpp:enumerator:`LV_PART_INDICATOR`)）：

  :LV_STYLE_TEXT_COLOR:         :cpp:func:`lv_style_set_text_color`
  :LV_STYLE_TEXT_OPA:           :cpp:func:`lv_style_set_text_opa`
  :LV_STYLE_TEXT_LETTER_SPACE:  :cpp:func:`lv_style_set_text_letter_space`
  :LV_STYLE_TEXT_FONT:          :cpp:func:`lv_style_set_text_font`

.. _lv_scale_events:

Events（事件）
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No special events are sent by Scale Widgets.

.. admonition::  Further Reading

    Learn more about :ref:`lv_obj_events` emitted by all Widgets.

    Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


量表部件（Scale Widgets）不会发送特殊事件。

了解更多有关所有部件都会发出的 :ref:`lv_obj_events`的内容。

了解更多有关 :ref:`events`的内容。
.. _lv_scale_keys:

Keys
****

.. raw:: html

   <details>
     <summary>显示原文</summary>

No *Keys* are processed by Scale Widgets.

.. admonition::  Further Reading

    Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


量表部件（Scale Widgets）不处理 *按键*操作。

了解更多有关 :ref:`indev_keys`的内容。


.. _lv_scale_example:

Example
*******

.. include:: ../../examples/widgets/scale/index.rst

.. _lv_scale_api:

API
***

:ref:`lv_scale`
