.. _lv_span:

======================
Span（跨度） (lv_span)
======================

Overview（概述）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

A spangroup is the object that is used to display rich text. Different
from the label object, ``spangroup`` can render text styled with
different fonts, colors, and sizes into the spangroup object.

.. raw:: html

   </details> 
   <br>

spangroup 是用于显示富文本的对象。不同 从Label对象中，可以呈现样式为 ``spangroup``， 将不同的字体、颜色和大小添加到 SpanGroup 对象中。


.. _lv_span_parts_and_styles:

Parts and Styles（零件和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` The spangroup has only one part.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_PART_MAIN` spangroup只有一个部分。


.. _lv_span_usage:

Usage（用法）
*************

Set text and style（设置文本和样式）
-----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The spangroup object uses span to describe text and text style. so,
first we need to create ``span`` descriptor using ``lv_span_t * span = lv_spangroup_new_span(spangroup)``.
Then use :cpp:expr:`lv_span_set_text(span, "text")` to set text. The style of the span is
configured as with a normal style object by using its ``style`` member,
eg::cpp:expr:`lv_style_set_text_color(&span->style, lv_palette_main(LV_PALETTE_RED))`.

If spangroup object ``mode != LV_SPAN_MODE_FIXED`` you must call
:cpp:func:`lv_spangroup_refr_mode` after you have modified ``span``
style(eg:set text, changed the font size, del span).

.. raw:: html

   </details> 
   <br>


spangroup 对象使用 span 来描述文本和文本样式。所以 首先，我们需要使用 . 然后使用 ``lv_span_t * span = lv_spangroup_new_span(spangroup)`` 创建 `span` 描述符。跨度的样式是使用 ``style`` 其成员配置为使用普通样式对象， 例如：:cpp:expr:`lv_style_set_text_color(&span->style, lv_palette_main(LV_PALETTE_RED))`。


Retrieving a span child（检索 span 子项）
---------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Spangroups store their children differently from normal objects, so
normal functions for getting children won't work.

:cpp:expr:`lv_spangroup_get_child(spangroup, id)` will return a pointer to the
child span at index ``id``. In addition, ``id`` can be negative to index
from the end of the spangroup where ``-1`` is the youngest child, ``-2``
is second youngest, etc.

E.g. ``lv_span_t* span = lv_spangroup_get_child(spangroup, 0)`` will
return the first child of the spangroup.
``lv_span_t* span = lv_spangroup_get_child(spangroup, -1)`` will return
the last (or most recent) child.

.. raw:: html

   </details> 
   <br>


Spangroups 存储其子对象的方式与普通对象不同，因此子项的正常功能将不起作用。

:cpp:expr:`lv_spangroup_get_child(spangroup, id)` 将返回指向 ``id`` 索引处的子跨度。此外， ``id`` 可以对指数负数从跨组的末尾开始， ``-1`` 最小的孩子在哪里， ``-2`` 是第二年轻的孩子，等等。

例如 ``lv_span_t* span = lv_spangroup_get_child(spangroup, 0)`` 将 ``lv_span_t* span = lv_spangroup_get_child(spangroup, -1)`` 返回 spangroup 的第一个子项。 ``lv_span_t* span = lv_spangroup_get_child(spangroup, -1)`` 将返回最后一个（或最近）的孩子。


Child Count（子项计数）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Use the function :cpp:expr:`lv_spangroup_get_span_count(spangroup)` to get back
the number of spans the group is maintaining.

E.g. ``uint32_t size = lv_spangroup_get_span_count(spangroup)``

.. raw:: html

   </details> 
   <br>


使用函数 :cpp:expr:`lv_spangroup_get_span_count(spangroup)` 返回组正在维护的跨度数。

例如 ``uint32_t size = lv_spangroup_get_span_count(spangroup)``

Text align（文本对齐）
---------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Like label object, the spangroup can be set to one the following modes:

- :cpp:enumerator:`LV_TEXT_ALIGN_LEFT` Align to left.
- :cpp:enumerator:`LV_TEXT_ALIGN_CENTER` Align to center.
- :cpp:enumerator:`LV_TEXT_ALIGN_RIGHT` Align to right.
- :cpp:enumerator:`LV_TEXT_ALIGN_AUTO` Align auto.

Use function :cpp:expr:`lv_spangroup_set_align(spangroup, LV_TEXT_ALIGN_CENTER)`
to set text align.

.. raw:: html

   </details> 
   <br>


与标签对象一样，spangroup 可以设置为以下模式之一：

- :cpp:enumerator:`LV_TEXT_ALIGN_LEFT` 向左对齐。
- :cpp:enumerator:`LV_TEXT_ALIGN_CENTER` 居中对齐。
- :cpp:enumerator:`LV_TEXT_ALIGN_RIGHT` 向右对齐。
- :cpp:enumerator:`LV_TEXT_ALIGN_AUTO` 自动对齐。

使用函数 :cpp:expr:`lv_spangroup_set_align(spangroup, LV_TEXT_ALIGN_CENTER)` 设置文本对齐。


Modes（模式）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The spangroup can be set to one the following modes:

- :cpp:enumerator:`LV_SPAN_MODE_FIXED` Fixes the object size.
- :cpp:enumerator:`LV_SPAN_MODE_EXPAND` Expand the object size to the text size but stay on a single line.
- :cpp:enumerator:`LV_SPAN_MODE_BREAK` Keep width, break the too long lines and auto expand height.

Use the function :cpp:expr:`lv_spangroup_set_mode(spangroup, LV_SPAN_MODE_BREAK)` to set
object mode.

.. raw:: html

   </details> 
   <br>


spangroup 可以设置为以下模式之一：

- :cpp:enumerator:`LV_SPAN_MODE_FIXED` F固定对象大小。
- :cpp:enumerator:`LV_SPAN_MODE_EXPAND` 将对象大小扩展到文本大小，但保留在一行上。
- :cpp:enumerator:`LV_SPAN_MODE_BREAK` 保持宽度，打破太长的线条并自动扩展高度。

使用函数 :cpp:expr:`lv_spangroup_set_mode(spangroup, LV_SPAN_MODE_BREAK)` 设置为对象模式。


Overflow（溢出）
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The spangroup can be set to one the following modes:

- :cpp:enumerator:`LV_SPAN_OVERFLOW_CLIP` truncates the text at the limit of the area.
- :cpp:enumerator:`LV_SPAN_OVERFLOW_ELLIPSIS` will display an ellipsis (``...``) when text overflows the area.

Use function :cpp:expr:`lv_spangroup_set_overflow(spangroup, LV_SPAN_OVERFLOW_CLIP)` to set object overflow mode.

.. raw:: html

   </details> 
   <br>


spangroup 可以设置为以下模式之一：

- :cpp:enumerator:`LV_SPAN_OVERFLOW_CLIP` 在区域的边界处截断文本。
- :cpp:enumerator:`LV_SPAN_OVERFLOW_ELLIPSIS` 当文本溢出该区域时将显示省略号 (``...``)。

使用函数 :cpp:expr:`lv_spangroup_set_overflow(spangroup, LV_SPAN_OVERFLOW_CLIP)` 设置对象溢出模式。


First line indent（首行缩进）
-----------------------------

.. raw:: html

   <details>  
     <summary>显示原文</summary>

Use function :cpp:expr:`lv_spangroup_set_indent(spangroup, 20)` to set the indent of the
first line. all modes support pixel units, in addition to :cpp:enumerator:`LV_SPAN_MODE_FIXED`
and :cpp:enumerator:`LV_SPAN_MODE_BREAK` mode supports percentage units
too.

.. raw:: html

   </details> 
   <br>


使用函数 :cpp:expr:`lv_spangroup_set_indent(spangroup, 20)` 设置第一行。所有模式都支持像素单位，此外， :cpp:enumerator:`LV_SPAN_MODE_FIXED` 和 :cpp:enumerator:`LV_SPAN_MODE_BREAK` 模式还支持百分比单位 。


Lines（行）
-----------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Use function :cpp:expr:`lv_spangroup_set_max_lines(spangroup, 10)` to set the maximum number
of lines to be displayed in :cpp:enumerator::`LV_SPAN_MODE_BREAK` mode, negative values
indicate no limit.

.. raw:: html

   </details> 
   <br>


使用函数 :cpp:expr:`lv_spangroup_set_max_lines(spangroup, 10)` 设置最大数量 在 :cpp:enumerator::`LV_SPAN_MODE_BREAK` 模式下显示的行数，负值表示没有限制。


.. _lv_span_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No special events are sent by this widget.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


此小组件不会发送任何特殊事件。

详细了解更多 :ref:`events`。


.. _lv_span_keys:

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

 
.. _lv_span_example:

Example
*******

.. include:: ../examples/widgets/span/index.rst

.. _lv_span_api:

API
***
