.. _lv_label:

========================
Label （标签）(lv_label)
========================

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

A label is the basic object type that is used to display text.

.. raw:: html

   </details> 
   <br>


标签是用来显示文本的基本对象类型。


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

With :cpp:expr:`lv_label_set_text_fmt(label, "Value: %d", 15)` printf formatting
can be used to set the text.

Labels are able to show text from a static character buffer. To do so,
use :cpp:expr:`lv_label_set_text_static(label, "Text")`. In this case, the text
is not stored in the dynamic memory and the given buffer is used
directly instead. This means that the array can't be a local variable
which goes out of scope when the function exits. Constant strings are
safe to use with :cpp:func:`lv_label_set_text_static` (except when used with
:cpp:enumerator:`LV_LABEL_LONG_DOT`, as it modifies the buffer in-place), as they are
stored in ROM memory, which is always accessible.

.. raw:: html

   </details> 
   <br>


您可以在运行时使用 :cpp:expr:`lv_label_set_text(label, "New text")`. 设置标签上的文本。 这将动态分配一个缓冲区，并且提供的字符串将被复制到该缓冲区中。 因此，在该函数返回后，您不需要将传递给 :cpp:func:`lv_label_set_text` 的文本保留在作用域中。

使用 :cpp:expr:`lv_label_set_text_fmt(label, "Value: %d", 15)`  printf 格式可用于设置文本。

标签能够显示来自静态字符缓冲区的文本。 为此，请使用 :cpp:expr:`lv_label_set_text_static(label, "Text")`。 在这种情况下，文本不存储在动态内存中，而是直接使用给定的缓冲区。 这意味着数组不能是在函数退出时超出范围的局部变量。 常量字符串可以安全地与 :cpp:func:`lv_label_set_text_static` 一起使用（除非与 :cpp:enumerator:`LV_LABEL_LONG_DOT` 一起使用，因为它会就地修改缓冲区），因为它们存储在 ROM 内存中，始终可以访问。


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

To horizontally align the lines of a label the `text_align` style property can be used with
:cpp:func:`lv_obj_set_style_text_align` or :cpp:func:`lv_style_set_text_align`
Note that it has a visible effect only if

- the label widget's width is larger than the width of the longest line of the text
- the text has multiple lines with non equal line length

.. raw:: html

   </details> 
   <br>


若要水平对齐标签的行， `text_align` 样式属性可以使用 :cpp:func:`lv_obj_set_style_text_align` 或者 :cpp:func:`lv_style_set_text_align`，请注意，只有在以下情况下，它才具有可见效果。

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

No special events are sent by the Label.

See the events of the :ref:`Base object <lv_obj>` too.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


标签不发送特殊事件。

另请参阅 :ref:`基本对象 <lv_obj>` 的事件。

详细了解更多 :ref:`events`。


.. _lv_label_keys:

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


对象类型不处理 *按键* 。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_label_example:

Example
*******

.. include:: ../examples/widgets/label/index.rst

.. _lv_label_api:

API
***
