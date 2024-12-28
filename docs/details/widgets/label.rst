.. _lv_label:

========================
Label （标签）(lv_label)
========================

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

A Label is the Widget used to display text.

.. raw:: html

   </details> 
   <br>


标签是用来显示文本的部件。


.. _lv_label_parts_and_styles:

Parts and Styles（零件和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

- :cpp:enumerator:`LV_PART_MAIN` Uses all the typical background properties and the
  text properties. The padding values can be used to add space between
  the text and the background.
- :cpp:enumerator:`LV_PART_SCROLLBAR` The scrollbar that is shown when the text is
   larger than the widget's size.
- :cpp:enumerator:`LV_PART_SELECTED` Tells the style of the
  :ref:`selected text <lv_label_text_selection>`. Only ``text_color`` and ``bg_color`` style
  properties can be used.

.. raw:: html

   </details> 
   <br>


- :cpp:enumerator:`LV_PART_MAIN` 使用所有典型的背景属性和文本属性。 填充值可用于在文本和背景之间添加空间。
- :cpp:enumerator:`LV_PART_SCROLLBAR` 当文本大于组件的大小时显示的滚动条。
- :cpp:enumerator:`LV_PART_SELECTED` 告诉 :ref:`selected text <lv_label_text_selection>` 的样式。 只能使用 ``text_color`` 和 ``bg_color`` 样式属性。


.. _lv_label_usage:

Usage（用法）
************

Set text（设置文本）
-------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can set the text on a label at runtime with
:cpp:expr:`lv_label_set_text(label, "New text")`. This will allocate a buffer
dynamically, and the provided string will be copied into that buffer.
Therefore, you don't need to keep the text you pass to
:cpp:func:`lv_label_set_text` in scope after that function returns.

With :cpp:expr:`lv_label_set_text_fmt(label, fmt, ...)` printf formatting
can be used to set the text.  Example:  :cpp:expr:`lv_label_set_text_fmt(label, "Value: %d", 15)`.

Labels are able to show text from a static character buffer as well.  To do so, use
:cpp:expr:`lv_label_set_text_static(label, "Text")`.  In this case, the text is not
stored in dynamic memory and the given buffer is used directly instead.  This means
that the contents of the character buffer *must* remain valid for the life of the
label or until another buffer is set via one of the above functions.

``const`` strings are safe to use with :cpp:func:`lv_label_set_text_static` since
they are stored in ROM memory, which is always accessible.

.. warning::

    Do not use ``const`` strings with :cpp:func:`lv_label_set_text_static` when the
    Label is being used in :cpp:enumerator:`LV_LABEL_LONG_DOT` mode since the Label
    will attempt to do an in-place edit of the string.  This will cause an MCU
    exception by attempting to modify program memory (ROM).

.. _label_rapidly_updating_text:

.. caution::

    If your Label is updated with new strings rapidly (e.g. > 30X / second, such as
    RPM in a dashboard, or an ADC value), and the length of those strings changes
    frequently, it is advisable to:

    - allocate a static string buffer large enough contain the largest possible string,
    - update that buffer with the new strings only when they will make a visible
      difference for the end user, and
    - update the Label with :cpp:expr:`lv_label_set_text_static(label, buffer)` using that buffer.

    Reason:  if you use :cpp:expr:`lv_label_set_text(label, new_text)`, a memory
    realloc() will be forced every time the length of the string changes.  That
    MCU overhead can be avoided by doing the above.


.. raw:: html

   </details> 
   <br>


您可以在运行时使用 :cpp:expr:`lv_label_set_text(label, "New text")`. 设置标签上的文本。 这将动态分配一个缓冲区，并且提供的字符串将被复制到该缓冲区中。 因此，在该函数返回后，您不需要将传递给 :cpp:func:`lv_label_set_text` 的文本保留在作用域中。

通过 :cpp:expr:`lv_label_set_text_fmt(label, fmt, ...)` ，可以使用 printf 格式化的方式来设置文本。示例：:cpp:expr:`lv_label_set_text_fmt(label, "Value: %d", 15)` 。

标签（Labels）也能够显示来自静态字符缓冲区的文本。要实现这一点，可使用 :cpp:expr:`lv_label_set_text_static(label, "Text")` 。在这种情况下，文本不会存储在动态内存中，而是直接使用给定的缓冲区。这意味着字符缓冲区的内容在标签的整个生命周期内必须保持有效，或者直到通过上述函数之一设置了另一个缓冲区为止。

``const`` 字符串可以安全地与 :cpp:func:`lv_label_set_text_static` 一起使用，因为它们存储在只读存储器（ROM）中，始终是可访问的。

.. warning::

    当标签（Label）处于 :cpp:enumerator:`LV_LABEL_LONG_DOT` 模式下时，不要将 ``const`` 字符串与 :cpp:func:`lv_label_set_text_static` 一起使用，因为标签会尝试对字符串进行原地编辑。这样做会因试图修改程序内存（只读存储器，即 ROM）而导致微控制器（MCU）出现异常。

.. _label_rapidly_updating_text:

.. caution::

    如果你的标签（Label）需要快速更新新的字符串（例如，每秒更新次数大于 30 次，比如仪表盘上的每分钟转数（RPM）或者模数转换器（ADC）的值），并且这些字符串的长度频繁变化，那么建议采取以下做法：
    
    - 分配一个足够大的静态字符串缓冲区，使其能够容纳可能出现的最长字符串；
    - 仅当新字符串对最终用户来说会产生可见差异时，才用新字符串更新该缓冲区；
    - 使用那个缓冲区，通过 :cpp:expr:`lv_label_set_text_static(label, buffer)` 来更新标签。
    
    原因：如果你使用 :cpp:expr:`lv_label_set_text(label, new_text)` ，那么每当字符串长度发生变化时，就会强制进行内存重分配（realloc() ）操作。通过上述做法可以避免微控制器（MCU）出现此类开销。


.. _lv_label_newline:

Newline（新行）
---------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Newline characters are handled automatically by the label object. You
can use ``\n`` to make a line break. For example:
``"line1\nline2\n\nline4"``

.. raw:: html

   </details> 
   <br>


换行符由标签对象自动处理。 您可以使用 ``\n`` 来换行。 例如： ``"line1\nline2\n\nline4"``


.. _lv_label_long_modes:

Long modes（长模式）
--------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

By default, the width and height of the label is set to
:c:macro:`LV_SIZE_CONTENT`. Therefore, the size of the label is automatically
expanded to the text size. Otherwise, if the width or height are
explicitly set (using e.g.\ :cpp:func:`lv_obj_set_width` or a layout), the lines
wider than the label's width can be manipulated according to several
long mode policies. Similarly, the policies can be applied if the height
of the text is greater than the height of the label.

- :cpp:enumerator:`LV_LABEL_LONG_WRAP` Wrap too long lines. If the height is :c:macro:`LV_SIZE_CONTENT` the label's
  height will be expanded, otherwise the text will be clipped. (Default)
- :cpp:enumerator:`LV_LABEL_LONG_DOT` Replaces the last 3 characters from bottom right corner of the label with dots (``.``)
- :cpp:enumerator:`LV_LABEL_LONG_SCROLL` If the text is wider than the label scroll it horizontally back and forth. If it's
  higher, scroll vertically. Only one direction is scrolled and horizontal scrolling has higher precedence.
- :cpp:enumerator:`LV_LABEL_LONG_SCROLL_CIRCULAR` If the text is wider than the label scroll it horizontally continuously. If it's
  higher, scroll vertically. Only one direction is scrolled and horizontal scrolling has higher precedence.
- :cpp:enumerator:`LV_LABEL_LONG_CLIP` Simply clip the parts of the text outside the label.

You can specify the long mode with :cpp:expr:`lv_label_set_long_mode(label, LV_LABEL_LONG_...)`

Note that :cpp:enumerator:`LV_LABEL_LONG_DOT` manipulates the text buffer in-place in
order to add/remove the dots. When :cpp:func:`lv_label_set_text` or
:cpp:func:`lv_label_set_array_text` are used, a separate buffer is allocated and
this implementation detail is unnoticed. This is not the case with
:cpp:func:`lv_label_set_text_static`. The buffer you pass to
:cpp:func:`lv_label_set_text_static` must be writable if you plan to use
:cpp:enumerator:`LV_LABEL_LONG_DOT`.

.. raw:: html

   </details> 
   <br>


默认情况下，标签的宽度和高度设置为 :c:macro:`LV_SIZE_CONTENT`。因此标签的大小会自动扩展到文本大小。 否则，如果显式设置宽度或高度（使用例如:cpp:func:`lv_obj_set_width` 或布局），则可以根据几种长模式策略来操作比标签宽度更宽的行。 类似地，如果文本的高度大于标签的高度，则可以应用策略。

- :cpp:enumerator:`LV_LABEL_LONG_WRAP` 换行太长。如果高度为LV_SIZE_CONTENT，标签的高度将被扩展，否则文本将被剪裁。 (默认)
- :cpp:enumerator:`LV_LABEL_LONG_DOT` 将标签右下角的最后 3 个字符替换为点 (``.``)
- :cpp:enumerator:`LV_LABEL_LONG_SCROLL` 如果文本比标签宽，则水平来回滚动它。如果它更高，请垂直滚动。只滚动一个方向，水平滚动的优先级更高。
- :cpp:enumerator:`LV_LABEL_LONG_SCROLL_CIRCULAR` 如果文本比标签宽，则水平滚动它。如果它更高，请垂直滚动。只滚动一个方向，水平滚动的优先级更高。
- :cpp:enumerator:`LV_LABEL_LONG_CLIP` 只需剪掉标签外的文本部分。

您可以使用 :cpp:expr:`lv_label_set_long_mode(label, LV_LABEL_LONG_...)` 指定长模式

请注意， :cpp:enumerator:`LV_LABEL_LONG_DOT` 就地操作文本缓冲区以添加/删除点。 当使用 :cpp:func:`lv_label_set_text` 或 :cpp:func:`lv_label_set_array_text` 时，会分配一个单独的缓冲区，并且不会注意到此实现细节。 :cpp:func:`lv_label_set_text_static` 不是这种情况。 如果你打算使用 :cpp:enumerator:`LV_LABEL_LONG_DOT`，你传递给 :cpp:func:`lv_label_set_text_static` 的缓冲区必须是可写的。


.. _lv_label_text_selection:

Text selection（文本选择）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If enabled by :c:macro:`LV_LABEL_TEXT_SELECTION` part of the text can be
selected. It's similar to when you use your mouse on a PC to select a
text. The whole mechanism (click and select the text as you drag your
finger/mouse) is implemented in :ref:`Text area <lv_textarea>` and
the Label widget only allows manual text selection with
:cpp:expr:`lv_label_get_text_selection_start(label, start_char_index)` and
:cpp:expr:`lv_label_get_text_selection_start(label, end_char_index)`.

.. raw:: html

   </details> 
   <br>


如果通过 :c:macro:`LV_LABEL_TEXT_SELECTION` 启用，可以选择部分文本。 这与在 PC 上使用鼠标选择文本时类似。 整个机制（在拖动手指/鼠标时单击并选择文本）在 :ref:`文本区域 <lv_textarea>` 中实现，而标签组件仅允许手动选择文本 :cpp:expr:`lv_label_get_text_selection_start(label, start_char_index)` 和 :cpp:expr:`lv_label_get_text_selection_start(label, end_char_index)`。

.. _lv_label_text_alignment:

Text alignment（文本对齐方式）
-----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To horizontally align the lines of a Label the `text_align` style property can be used with
:cpp:func:`lv_obj_set_style_text_align` or :cpp:func:`lv_style_set_text_align`,
passing one of the ``LV_TEXT_ALIGN_...`` enumeration values.
Note that this has a visible effect only if:

- the label widget's width is larger than the width of the longest line of the text
- the text has multiple lines with non equal line length

.. raw:: html

   </details> 
   <br>


要对标签（Label）中的文本行进行水平对齐，可以将 `text_align` 样式属性与 :cpp:func:`lv_obj_set_style_text_align` 或 :cpp:func:`lv_style_set_text_align` 函数配合使用，并传入 ``LV_TEXT_ALIGN_...`` 枚举值中的某一个。
请注意，只有在以下情况下，这样做才会产生可见的效果：

- 标签小组件的宽度大于文本最长行的宽度
- 文本有多行行长度不相等


.. _lv_label_very_long_texts:

Very long texts（非常长的文本）
-----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL can efficiently handle very long (e.g. > 40k characters) labels by
saving some extra data (~12 bytes) to speed up drawing. To enable this
feature, set ``LV_LABEL_LONG_TXT_HINT   1`` in ``lv_conf.h``.

.. raw:: html

   </details> 
   <br>


LVGL 可以通过保存一些额外的数据（~12 字节）来有效地处理很长（例如 > 40k 个字符）的标签以加快绘图速度。 要启用此功能，请在 ``lv_conf.h`` 中设置 ``LV_LABEL_LONG_TXT_HINT   1`` 。


.. _lv_label_custom_scrolling_animations:

Custom scrolling animations（自定义滚动动画）
--------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Some aspects of the scrolling animations in long modes
:cpp:enumerator:`LV_LABEL_LONG_SCROLL` and :cpp:enumerator:`LV_LABEL_LONG_SCROLL_CIRCULAR` can be
customized by setting the animation property of a style, using
:cpp:func:`lv_style_set_anim`.
It will be treated as a template which will be used to create the scroll animations.

.. raw:: html

   </details> 
   <br>


滚动动画的某些方面在长模式下 :cpp:enumerator:`LV_LABEL_LONG_SCROLL` 和 :cpp:enumerator:`LV_LABEL_LONG_SCROLL_CIRCULAR` 可以是通过设置样式的 animation 属性进行自定义，使用 :cpp:func:`lv_style_set_anim`。

它将被视为一个模板，将用于创建滚动动画。


.. _lv_label_symbols:

Symbols（符号）
---------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The labels can display symbols alongside letters (or on their own). Read
the :ref:`fonts` section to learn more about the symbols.

.. raw:: html

   </details> 
   <br>


标签可以在字母旁边显示符号（或单独显示）。 阅读 :ref:`fonts` 部分以了解有关符号的更多信息。


.. _lv_label_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No special events are sent by Label Widgets.  By default, Label Widgets are created
without the LV_OBJ_FLAG_CLICKABLE flag, but you can add it to make a Label Widget
emit LV_EVENT_CLICKED events if desired.

.. admonition::  Further Reading

    Learn more about :ref:`lv_obj_events` emitted by all Widgets.

    Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


标签（Label）部件不会发送特殊事件。默认情况下，创建标签部件时不会带有 LV_OBJ_FLAG_CLICKABLE 标志，不过如果需要的话，你可以添加该标志，使标签部件能够发出 LV_EVENT_CLICKED 事件。

另请参阅 :ref:`lv_obj_events` 的事件。

详细了解更多 :ref:`events`。


.. _lv_label_keys:

Keys（按键）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No *Keys* are processed by Label Widgets.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


标签（Label）部件不处理任何 *按键*（Keys） 操作。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_label_example:

Example
*******

.. include:: ../../examples/widgets/label/index.rst

.. _lv_label_api:

API
***
