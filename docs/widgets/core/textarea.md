```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/widgets/textarea.md
```
# Text area（文本框） (lv_textarea)

## Overview（概述）

<details>
<summary>查看原文</summary>
<p>

The Text Area is a [Base object](widgets/obj) with a [Label](/widgets/core/label) and a cursor on it. 
Texts or characters can be added to it. 
Long lines are wrapped and when the text becomes long enough the Text area can be scrolled.

One line mode and password modes are supported.

</p>
</details>

文本框是一个 [Base object](widgets/obj)，上面有一个 [Label](/widgets/core/label) 和一个光标。
可以向其中添加文本或字符。
长行被换行，当文本变得足够长时，可以滚动文本框。

支持单行模式和密码模式。

## Parts and Styles（部件和样式）

<details>
<summary>查看原文</summary>
<p>

- `LV_PART_MAIN` The background of the text area. Uses all the typical backgrond style properties and the text related style properties including `text_align` to align the text to the left, right or center.
- `LV_PART_SCROLLBAR` The scrollbar that is shown when the text is too long.
- `LV_PART_SELECTED` Detemines the style of the [selected text](/widgets/core/label.html#text-selection). Only `text_color` and `bg_color` style properties can be used. `bg_color` should be set directly on the label of the text area.
- `LV_PART_CURSOR` Marks the position where the characters are inserted. The cursor's area is always the bounding box of the current character. 
A block cursor can be created by adding a background color and background opacity to `LV_PART_CURSOR`'s style. The create line cursor leave the cursor transparent and set a left border. 
The `anim_time` style property sets the cursor's blink time. 
- `LV_PART_TEXTAREA_PLACEHOLDER` Unique to Text Area, allows styling the placeholder text.

</p>
</details>

- `LV_PART_MAIN` 文本框的背景。使用所有典型的背景样式属性和与文本相关的样式属性（包括“text_align”）将文本向左、向右或居中对齐。
- `LV_PART_SCROLLBAR` 文本过长时显示的滚动条。
- `LV_PART_SELECTED` 确定[选定文本](/widgets/core/label.html#text-selection) 的样式。只能使用 `text_color` 和 `bg_color` 样式属性。 `bg_color` 应该直接设置在文本框的标签上。
- `LV_PART_CURSOR` 标记字符插入的位置。光标的区域始终是当前字符的边界框。
可以通过向“LV_PART_CURSOR”的样式添加背景颜色和背景不透明度来创建块光标。创建行光标使光标保持透明并设置左边框。
`anim_time` 样式属性设置光标的闪烁时间。
- `LV_PART_TEXTAREA_PLACEHOLDER` 文本框独有，允许设置占位符文本的样式。
- 
## Usage（用法）

### Add text（添加文本）

<details>
<summary>查看原文</summary>
<p>

You can insert text or characters to the current cursor's position with:

- `lv_textarea_add_char(textarea, 'c')`
- `lv_textarea_add_text(textarea, "insert this text")`

To add wide characters like `'á'`, `'ß'` or CJK characters use `lv_textarea_add_text(ta, "á")`.

`lv_textarea_set_text(ta, "New text")` changes the whole text.

</p>
</details>

您可以使用以下命令在当前光标位置插入文本或字符：

- `lv_textarea_add_char(textarea, 'c')`
- `lv_textarea_add_text(textarea, "插入此文本")`

要添加宽字符，如 `'á'`、`'ß'` 或 CJK 字符，请使用 `lv_textarea_add_text(ta, "á")`。

`lv_textarea_set_text(ta, "New text")` 改变整个文本。

### Placeholder（占位符）

<details>
<summary>查看原文</summary>
<p>

A placeholder text can be specified - which is displayed when the Text area is empty - with `lv_textarea_set_placeholder_text(ta, "Placeholder text")`

</p>
</details>

可以指定占位符文本 - 当文本框为空时显示 - 使用`lv_textarea_set_placeholder_text(ta, "Placeholder text")`

### Delete character（删除字符）

<details>
<summary>查看原文</summary>
<p>

To delete a character from the left of the current cursor position use `lv_textarea_del_char(textarea)`. 
To delete from the right use `lv_textarea_del_char_forward(textarea)`

</p>
</details>

要删除当前光标位置左侧的字符，请使用'lv_textarea_del_char（textarea）`。
要从右侧删除，请使用'lv\u textarea\u del\u char\u forward（textarea）`

### Move the cursor（移动光标）

<details>
<summary>查看原文</summary>
<p>

The cursor position can be modified directly like `lv_textarea_set_cursor_pos(textarea, 10)`. 
The `0` position means "before the first characters", 
`LV_TA_CURSOR_LAST` means "after the last character"

You can step the cursor with
- `lv_textarea_cursor_right(textarea)`
- `lv_textarea_cursor_left(textarea)`
- `lv_textarea_cursor_up(textarea)`
- `lv_textarea_cursor_down(textarea)`

If `lv_textarea_set_cursor_click_pos(textarea, true)` is applied the cursor will jump to the position where the Text area was clicked.

</p>
</details>

光标位置可以像`lv_textarea_set_cursor_pos(textarea, 10)`一样直接修改。
`0` 位置表示“在第一个字符之前”，
`LV_TA_CURSOR_LAST` 表示“在最后一个字符之后”

您可以使用
- `lv_textarea_cursor_right(textarea)`
- `lv_textarea_cursor_left(textarea)`
- `lv_textarea_cursor_up(textarea)`
- `lv_textarea_cursor_down(textarea)`

如果应用`lv_textarea_set_cursor_click_pos(textarea, true)`，则光标将跳转到单击文本框的位置。

### Hide the cursor（隐藏光标）

<details>
<summary>查看原文</summary>
<p>

The cursor is always visible, however it can be a good idea to style it to be visible only in `LV_STATE_FOCUSED` state. 

</p>
</details>

一般情况下光标始终可见，但最好将其样式设置为仅在“LV_STATE_FOCUSED”状态下可见。

### One line mode（单行模式）

<details>
<summary>查看原文</summary>
<p>

The Text area can be configured to be on a single line with `lv_textarea_set_one_line(textarea, true)`. 
In this mode the height is set automatically to show only one line, line break characters are ignored, and word wrap is disabled. 

</p>
</details>

可以使用 `lv_textarea_set_one_line(textarea, true)` 将文本框配置为单行。
在此模式下，高度自动设置为仅显示一行，忽略换行符，并禁用自动换行。

### Password mode（密码模式）

<details>
<summary>查看原文</summary>
<p>

The text area supports password mode which can be enabled with `lv_textarea_set_password_mode(textarea, true)`. 

If the `•` ([Bullet, U+2022](http://www.fileformat.info/info/unicode/char/2022/index.htm)) character exists in the font, the entered characters are converted to it after some time or when a new character is entered. 
If `•` not exists, `*` will be used.

In password mode `lv_textarea_get_text(textarea)` returns the actual text entered, not the bullet characters.

The visibility time can be adjusted with `LV_TEXTAREA_DEF_PWD_SHOW_TIME)` in `lv_conf.h`.

</p>
</details>

文本框支持密码模式，可以通过 `lv_textarea_set_password_mode(textarea, true)` 启用。

如果字体中存在 `•` ([Bullet, U+2022](http://www.fileformat.info/info/unicode/char/2022/index.htm)) 字符，则将输入的字符转换为该字符 一段时间后或输入新字符时。
如果 `•` 不存在，`*` 将被使用。

在密码模式下`lv_textarea_get_text(textarea)` 返回输入的实际文本，而不是项目符号字符。

可见时间可以通过 `lv_conf.h` 中的 `LV_TEXTAREA_DEF_PWD_SHOW_TIME)` 进行调整。

### Accepted characters（字符白名单）

<details>
<summary>查看原文</summary>
<p>

You can set a list of accepted characters with `lv_textarae_set_accepted_chars(textarea, "0123456789.+-")`. 
Other characters will be ignored. 

</p>
</details>

您可以使用 `lv_textarae_set_accepted_chars(textarea, "0123456789.+-")` 设置接受字符列表。其他字符将被忽略。

### Max text length（设置文本长度）

<details>
<summary>查看原文</summary>
<p>

The maximum number of characters can be limited with `lv_textarea_set_max_length(textarea, max_char_num)`

</p>
</details>

可以使用`lv_textarea_set_max_length(textarea, max_char_num)` 限制最大字符数

### Very long texts（超长文本）

<details>
<summary>查看原文</summary>
<p>

If there is a very long text in the Text area (e. g. > 20k characters), scrolling and drawing might be slow. 
However, by enabling `LV_LABEL_LONG_TXT_HINT   1` in `lv_conf.h` the performance can be hugely improved. 
This will save some additional information about the label to speed up its drawing. 
Using `LV_LABEL_LONG_TXT_HINT` the scrolling and drawing will as fast as with "normal" short texts.

</p>
</details>

如果文本框中有很长的文本（例如 > 20k 个字符），滚动和绘制可能会很慢。
但是，通过在`lv_conf.h` 中启用`LV_LABEL_LONG_TXT_HINT 1`，性能可以得到极大的提高。
这将保存有关标签的一些附加信息以加快其绘制速度。
使用 `LV_LABEL_LONG_TXT_HINT` 滚动和绘图将与“普通”短文本一样快。

### Select text（选择文本）

<details>
<summary>查看原文</summary>
<p>

Any part of the text can be selected if enabled with `lv_textarea_set_text_selection(textarea, true)`. 
This works much like when you select text on your PC with your mouse. 

</p>
</details>

如果启用了`lv_textarea_set_text_selection(textarea, true)`，则可以选择文本的任何部分。这与您使用鼠标在 PC 上选择文本非常相似。

## Events（事件）

<details>
<summary>查看原文</summary>
<p>

- `LV_EVENT_INSERT` Sent right before a character or text is inserted. 
The event paramter is the text about to be inserted. `lv_textarea_set_insert_replace(textarea, "New text")` replaces the text to insert. 
The new text cannot be in a local variable which is destroyed when the event callback exists. `""` means do not insert anything.
- `LV_EVENT_VALUE_CHANGED` Sent when the content of the text area has been changed. 
- `LV_EVENT_APPLY` Sent when `LV_KEY_ENTER` is pressed (or(sent) to a one line text area.

See the events of the [Base object](/widgets/obj) too.

Learn more about [Events](/overview/event).

</p>
</details>

- `LV_EVENT_INSERT` 在插入字符或文本之前发送。
事件参数是即将插入的文本。 `lv_textarea_set_insert_replace(textarea, "New text")` 替换要插入的文本。
新文本不能位于当事件回调存在时被销毁的局部变量中。 `""` 表示不插入任何内容。
- `LV_EVENT_VALUE_CHANGED` 当文本框的内容改变时发送。
- `LV_EVENT_APPLY` 在按下 `LV_KEY_ENTER` 时发送（或（发送）到一行文本框。

参见 [Base object](/widgets/obj) 的事件。

详细了解 [事件](/overview/event)。

## Keys（按键）

<details>
<summary>查看原文</summary>
<p>

- `LV_KEY_UP/DOWN/LEFT/RIGHT` Move the cursor
- `Any character` Add the character to the current cursor position

Learn more about [Keys](/overview/indev).

</p>
</details>

- `LV_KEY_UP/DOWN/LEFT/RIGHT` 移动光标
- `任意字符` 将字符添加到当前光标位置

了解有关 [键](/overview/indev) 的更多信息。

## Example

```eval_rst

.. include:: ../../../examples/widgets/textarea/index.rst

```

## API 

```eval_rst

.. doxygenfile:: lv_textarea.h
  :project: lvgl
        
```
