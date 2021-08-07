```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/widgets/core/label.md
```
# Label（标签） (lv_label)

## Overview（概述）

<details>
<summary>查看原文</summary>
<p>

A label is the basic object type that is used to display text. 

</p>
</details>

标签是用于显示文本的基本对象类型。

## Parts and Styles（部件和风格）

<details>
<summary>查看原文</summary>
<p>

- `LV_PART_MAIN`  Uses all the typical background properties and the text properties.  The padding values can be used to add space between the text and the background.
- `LV_PART_SCROLLBAR` The scrollbar that is shown when the text is larger than the widget's size.
- `LV_PART_SELECTED` Tells the style of the [selected text](#text-selection). Only `text_color` and `bg_color` style properties can be used. 

</p>
</details>

- `LV_PART_MAIN` 使用所有典型的背景属性和文本属性。 填充值可用于在文本和背景之间添加空间。
- `LV_PART_SCROLLBAR` 当文本大于小部件的大小时显示的滚动条。
- `LV_PART_SELECTED` 告诉[所选文本](#text-selection) 的样式。 只能使用 `text_color` 和 `bg_color` 样式属性。

## Usage（用法）

### Set text（设置文本）

<details>
<summary>查看原文</summary>
<p>

You can set the text on a label at runtime with `lv_label_set_text(label, "New text")`. 
This will allocate a buffer dynamically, and the provided string will be copied into that buffer. 
Therefore, you don't need to keep the text you pass to `lv_label_set_text` in scope after that function returns.

With `lv_label_set_text_fmt(label, "Value: %d", 15)` printf formatting can be used to set the text.

</p>
</details>

您可以在运行时使用 `lv_label_set_text(label, "New text")` 设置标签上的文本。
这将动态分配一个缓冲区，并且提供的字符串将被复制到该缓冲区中。
因此，在该函数返回后，您不需要将传递给 `lv_label_set_text` 的文本保留在作用域中。

使用 `lv_label_set_text_fmt(label, "Value: %d", 15)` printf 格式可用于设置文本。

<details>
<summary>查看原文</summary>
<p>

Labels are able to show text from a static character buffer.  To do so, use `lv_label_set_text_static(label, "Text")`. 
In this case, the text is not stored in the dynamic memory and the given buffer is used directly instead. 
This means that the array can't be a local variable which goes out of scope when the function exits. 
Constant strings are safe to use with `lv_label_set_text_static` (except when used with `LV_LABEL_LONG_DOT`, as it modifies the buffer in-place), as they are stored in ROM memory, which is always accessible.

</p>
</details>

标签能够显示来自静态字符缓冲区的文本。 为此，请使用`lv_label_set_text_static(label, "Text")`。
在这种情况下，文本不存储在动态内存中，而是直接使用给定的缓冲区。
这意味着数组不能是在函数退出时超出范围的局部变量。
常量字符串可以安全地与 `lv_label_set_text_static` 一起使用（除非与 `LV_LABEL_LONG_DOT` 一起使用，因为它会就地修改缓冲区），因为它们存储在 ROM 内存中，始终可以访问。

### Newline（新行）

<details>
<summary>查看原文</summary>
<p>

Newline characters are handled automatically by the label object. You can use `\n` to make a line break. For example: `"line1\nline2\n\nline4"`

</p>
</details>

换行符由标签对象自动处理。 您可以使用 `\n` 来换行。 例如：`"line1\nline2\n\nline4"`

### Long modes（长模式）

<details>
<summary>查看原文</summary>
<p>

By default, the width and height of the label is set to `LV_SIZE_CONTENT`. Therefore the size of the label is automatically expanded to the text size. 
Otherwise, if the width or height are explicitly set (useing  e.g.`lv_obj_set_width` or a layout), the lines wider than the label's width can be manipulated according to several long mode policies. 
Similary, the policies can be applied if the height of the text is greater than the height of the label.
- `LV_LABEL_LONG_WRAP` Wrap too long lines. If the height is `LV_SIZE_CONTENT` the label's height will be expanded, otherwise the text will be clipped. (Default)
- `LV_LABEL_LONG_DOT` Replaces the last 3 characters from bottom right corner of the label with dots (`.`) 
- `LV_LABEL_LONG_SCROLL` If the text is wider than the label scroll it horizontally back and forth. If it's higher, scroll vertically. Only one direction is scrolled and horizontal scrolling has higher precedence.
- `LV_LABEL_LONG_SCROLL_CIRCULAR` If the text is wider than the label scroll it horizontally continously. If it's higher, scroll vertically. Only one direction is scrolled and horizontal scrolling has higher precedence.
- `LV_LABEL_LONG_CLIP` Simply clip the parts of the text outside of the label.

</p>
</details>

默认情况下，标签的宽度和高度设置为 `LV_SIZE_CONTENT`。因此标签的大小会自动扩展到文本大小。
否则，如果显式设置宽度或高度（使用例如`lv_obj_set_width` 或布局），则可以根据几种长模式策略来操作比标签宽度更宽的行。
类似地，如果文本的高度大于标签的高度，则可以应用策略。
- `LV_LABEL_LONG_WRAP` 换行太长。如果高度为`LV_SIZE_CONTENT`，标签的高度将被扩展，否则文本将被剪裁。 （默认）
- `LV_LABEL_LONG_DOT` 将标签右下角的最后 3 个字符替换为点 (`.`)
- `LV_LABEL_LONG_SCROLL` 如果文本比标签宽，则水平来回滚动它。如果它更高，请垂直滚动。只滚动一个方向，水平滚动的优先级更高。
- `LV_LABEL_LONG_SCROLL_CIRCULAR` 如果文本比标签宽，则水平滚动它。如果它更高，请垂直滚动。只滚动一个方向，水平滚动的优先级更高。
- `LV_LABEL_LONG_CLIP` 只需剪掉标签外的文本部分。

<details>
<summary>查看原文</summary>
<p>

You can specify the long mode with `lv_label_set_long_mode(label, LV_LABEL_LONG_...)`

Note that `LV_LABEL_LONG_DOT` manipulates the text buffer in-place in order to add/remove the dots.  
When `lv_label_set_text` or `lv_label_set_array_text` are used, a separate buffer is allocated and this implementation detail is unnoticed. 
This is not the case with `lv_label_set_text_static`. The buffer you pass to `lv_label_set_text_static` must be writable if you plan to use `LV_LABEL_LONG_DOT`.

</p>
</details>

您可以使用 `lv_label_set_long_mode(label, LV_LABEL_LONG_...)` 指定长模式

请注意，`LV_LABEL_LONG_DOT` 就地操作文本缓冲区以添加/删除点。
当使用 `lv_label_set_text` 或 `lv_label_set_array_text` 时，会分配一个单独的缓冲区，并且不会注意到此实现细节。
`lv_label_set_text_static` 不是这种情况。 如果你打算使用 `LV_LABEL_LONG_DOT`，你传递给 `lv_label_set_text_static` 的缓冲区必须是可写的。

### Text recolor（文本重新着色）

<details>
<summary>查看原文</summary>
<p>

In the text, you can use commands to recolor parts of the text. For example: `"Write a #ff0000 red# word"`. 
This feature can be enabled individually for each label by `lv_label_set_recolor()` function. 

</p>
</details>

在文本中，您可以使用命令对文本的某些部分重新着色。 例如：`“写一个#ff0000 red# 字”`。
可以通过 `lv_label_set_recolor()` 函数为每个标签单独启用此功能。

### Text selection（文本选择）

<details>
<summary>查看原文</summary>
<p>

If enabled by `LV_LABEL_TEXT_SELECTION` part of the text can be selected. It's similar when on PC a you use your mouse to select a text. 
The whole mechanism (click and select the text as you drag your finger/mouse) is implemented in [Text area](/widgets/core/textarea) and the Label widget only allows manual text selection with
`lv_label_get_text_selection_start(label, start_char_index)` and `lv_label_get_text_selection_start(label, end_char_index)`.
 
</p>
</details>

如果通过`LV_LABEL_TEXT_SELECTION` 启用，可以选择部分文本。 这与在 PC 上使用鼠标选择文本时类似。
整个机制（在拖动手指/鼠标时单击并选择文本）在 [文本区域](/widgets/core/textarea) 中实现，而标签小部件仅允许手动选择文本
`lv_label_get_text_selection_start(label, start_char_index)` 和 `lv_label_get_text_selection_start(label, end_char_index)`。

### Very long texts（非常长的文本）

<details>
<summary>查看原文</summary>
<p>

LVGL can efficiently handle very long (e.g. > 40k characters) labels by saving some extra data (~12 bytes) to speed up drawing. To enable this feature, set `LV_LABEL_LONG_TXT_HINT   1` in `lv_conf.h`.

</p>
</details>

LVGL 可以通过保存一些额外的数据（~12 字节）来有效地处理很长（例如 > 40k 个字符）的标签以加快绘图速度。 要启用此功能，请在“lv_conf.h”中设置“LV_LABEL_LONG_TXT_HINT 1”。

### Symbols（符号）

<details>
<summary>查看原文</summary>
<p>

The labels can display symbols alongside letters (or on their own). Read the [Font](/overview/font) section to learn more about the symbols.

</p>
</details>

标签可以在字母旁边显示符号（或单独显示）。 阅读 [字体](/overview/font) 部分以了解有关符号的更多信息。

## Events（事件）

<details>
<summary>查看原文</summary>
<p>

No special events are sent by the Label.

See the events of the [Base object](/widgets/obj) too.

Learn more about [Events](/overview/event).

</p>
</details>

标签不发送特殊事件。

参见 [Base object](/widgets/obj) 的事件。

详细了解 [事件](/overview/event)。

## Keys（按键）

<details>
<summary>查看原文</summary>
<p>

No *Keys* are processed by the object type.

Learn more about [Keys](/overview/indev).

</p>
</details>

对象类型不处理 *Keys*。

了解有关 [键](/overview/indev) 的更多信息。

## Example

```eval_rst

.. include:: ../../../examples/widgets/label/index.rst

```

## API 

```eval_rst

.. doxygenfile:: lv_label.h
  :project: lvgl
        
```

