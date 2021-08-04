```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/widgets/btnmatrix.md
```
# Button matrix（按钮矩阵） (lv_btnmatrix)

## Overview（概述）

<details>
<summary>查看原文</summary>
<p>

The Button Matrix object is a lightweight way to display multiple buttons in rows and columns. Lightweight because the buttons are not actually created but just virtually drawn on the fly. This way, one button use only eight extra bytes of memory instead of the ~100-150 bytes a normal [Button](/widgets/core/btn) object plus the 100 or so bytes for the the [Label](/widgets/core/label) object.

The Button matrix is added to the default group (if one is set). Besides the Button matrix is an editable object to allow selecting and clicking the buttons with encoder navigation too.

</p>
</details>

Button Matrix 对象是一种在行和列中显示多个按钮的轻量级方法。 轻量级，因为按钮不是实际创建的，而是实时绘制的。 这样，一个按钮仅使用 8 个额外字节的内存，而不是普通 [Button](/widgets/core/btn) 对象的 ~100-150 字节加上 [Label](/widgets/ 核心/标签）对象。

按钮矩阵被添加到默认组（如果设置了）。 此外，按钮矩阵是一个可编辑对象，允许选择和单击带有编码器导航的按钮。

## Parts and Styles（零件和样式）

<details>
<summary>查看原文</summary>
<p>

- `LV_PART_MAIN` The background of the button matrix, uses the typical background style properties. `pad_row` and `pad_column` sets the space between the buttons.
- `LV_PART_ITEMS` The buttons all use the text and typical background style properties except translations and transformations. 

</p>
</details>

- `LV_PART_MAIN` 按钮矩阵的背景，使用典型的背景样式属性。 `pad_row` 和 `pad_column` 设置按钮之间的空间。
- `LV_PART_ITEMS` 除了翻译和转换之外，按钮都使用文本和典型的背景样式属性。

## Usage（用法）

### Button's text（按钮的文字）

<details>
<summary>查看原文</summary>
<p>

There is a text on each button. To specify them a descriptor string array, called *map*, needs to be used.
The map can be set with `lv_btnmatrix_set_map(btnm, my_map)`.
The declaration of a map should look like `const char * map[] = {"btn1", "btn2", "btn3", NULL}`.
Note that the last element has to be either `NULL` or an empty string (`""`)!

Use `"\n"` in the map to insert a **line break**. E.g. `{"btn1", "btn2", "\n", "btn3", ""}`. Each line's buttons have their width calculated automatically.
So in the example the first row will have 2 buttons each with 50% width and a second row with 1 button having 100% width.

</p>
</details>

每个按钮上都可以有文字。 要指定它们，需要使用称为 *map* 的描述符字符串数组。
地图可以用`lv_btnmatrix_set_map(btnm, my_map)`设置。
映射的声明应该类似于 `const char * map[] = {"btn1", "btn2", "btn3", NULL}`。
请注意，最后一个元素必须是 `NULL` 或空字符串 (`""`)！

在地图中使用`"\n"` 插入**换行符**。 例如。 `{"btn1", "btn2", "\n", "btn3", ""}`。 每行按钮的宽度都会自动计算。
因此，在示例中，第一行将有 2 个按钮，每个按钮的宽度为 50%，第二行将有 1 个按钮的宽度为 100%。

### Control buttons（控制按钮）

<details>
<summary>查看原文</summary>
<p>

The buttons' width can be set relative to the other button in the same row with `lv_btnmatrix_set_btn_width(btnm, btn_id, width)`
E.g. in a line with two buttons: *btnA, width = 1* and *btnB, width = 2*, *btnA* will have 33 % width and *btnB* will have 66 % width. 
It's similar to how the [`flex-grow`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-grow) property works in CSS.
The width must be in the \[1..7\] range and the default width is 1.

In addition to the width, each button can be customized with the following parameters:
- `LV_BTNMATRIX_CTRL_HIDDEN` Makes a button hidden (hidden buttons still take up space in the layout, they are just not visible or clickable)
- `LV_BTNMATRIX_CTRL_NO_REPEAT` Disable repeating when the button is long pressed
- `LV_BTNMATRIX_CTRL_DISABLED` Makes a button disabled Like `LV_STATE_DISABLED` on normal objects
- `LV_BTNMATRIX_CTRL_CHECKABLE` Enable toggling of a button. I.e. `LV_STATE_CHECHED` will be added/removed as the button is clicked
- `LV_BTNMATRIX_CTRL_CHECKED` MAke the button checked. It will use the `LV_STATE_CHECHKED` styles.
- `LV_BTNMATRIX_CTRL_CLICK_TRIG` Enabled: send LV_EVENT_VALUE_CHANGE on CLICK, Disabled: send LV_EVENT_VALUE_CHANGE on PRESS*/
- `LV_BTNMATRIX_CTRL_RECOLOR` Enable recoloring of button texts with `#`. E.g. `"It's #ff0000 red#"`
- `LV_BTNMATRIX_CTRL_CUSTOM_1` Custom free to use flag
- `LV_BTNMATRIX_CTRL_CUSTOM_2` Custom free to use flag

By default all flags are disabled.

</p>
</details>

可以使用 `lv_btnmatrix_set_btn_width(btnm, btn_id, width)` 相对于同一行中的另一个按钮设置按钮的宽度
例如。在一行中有两个按钮：*btnA, width = 1* 和 *btnB, width = 2*，*btnA* 将有 33% 的宽度，*btnB* 将有 66% 的宽度。
它类似于 [`flex-grow`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-grow) 属性在 CSS 中的工作方式。
宽度必须在 \[1..7\] 范围内，默认宽度为 1。

除了宽度之外，每个按钮还可以使用以下参数进行自定义：
- `LV_BTNMATRIX_CTRL_HIDDEN` 隐藏按钮（隐藏的按钮仍然占用布局中的空间，它们只是不可见或不可点击）
- `LV_BTNMATRIX_CTRL_NO_REPEAT` 长按按钮时禁用重复
- `LV_BTNMATRIX_CTRL_DISABLED` 使按钮被禁用，就像普通对象上的 `LV_STATE_DISABLED`
- `LV_BTNMATRIX_CTRL_CHECKABLE` 启用按钮切换。 IE。 `LV_STATE_CHECHED` 将在按钮被点击时添加/删除
- `LV_BTNMATRIX_CTRL_CHECKED` 检查按钮。它将使用`LV_STATE_CHECHKED` 样式。
- `LV_BTNMATRIX_CTRL_CLICK_TRIG` 启用：在点击时发送 LV_EVENT_VALUE_CHANGE，禁用：在按下时发送 LV_EVENT_VALUE_CHANGE*/
- `LV_BTNMATRIX_CTRL_RECOLOR` 使用 `#` 启用按钮文本的重新着色。例如。 `“它是#ff0000 红色#”`
- `LV_BTNMATRIX_CTRL_CUSTOM_1` 自定义免费使用标志
- `LV_BTNMATRIX_CTRL_CUSTOM_2` 自定义免费使用标志

默认情况下，所有标志都被禁用。


<details>
<summary>查看原文</summary>
<p>

To set or clear a button's control attribute, use `lv_btnmatrix_set_btn_ctrl(btnm, btn_id, LV_BTNM_CTRL_...)` and 
`lv_btnmatrix_clear_btn_ctrl(btnm, btn_id, LV_BTNMATRIX_CTRL_...)` respectively. More `LV_BTNM_CTRL_...` values can be OR-ed

To set/clear the same control attribute for all buttons of a button matrix, use `lv_btnmatrix_set_btn_ctrl_all(btnm, btn_id, LV_BTNM_CTRL_...)` and 
`lv_btnmatrix_clear_btn_ctrl_all(btnm, btn_id, LV_BTNMATRIX_CTRL_...)`.

The set a control map for a button matrix (similarly to the map for the text), use `lv_btnmatrix_set_ctrl_map(btnm, ctrl_map)`.
An element of `ctrl_map` should look like `ctrl_map[0] = width | LV_BTNM_CTRL_NO_REPEAT |  LV_BTNM_CTRL_CHECHKABLE`. 
The number of elements should be equal to the number of buttons (excluding newlines characters).

</p>
</details>

要设置或清除按钮的控件属性，请使用 `lv_btnmatrix_set_btn_ctrl(btnm, btn_id, LV_BTNM_CTRL_...)` 和
`lv_btnmatrix_clear_btn_ctrl(btnm, btn_id, LV_BTNMATRIX_CTRL_...)` 分别。 更多 `LV_BTNM_CTRL_...` 值可以被 OR-ed

要为按钮矩阵的所有按钮设置/清除相同的控件属性，请使用 `lv_btnmatrix_set_btn_ctrl_all(btnm, btn_id, LV_BTNM_CTRL_...)` 和
`lv_btnmatrix_clear_btn_ctrl_all(btnm, btn_id, LV_BTNMATRIX_CTRL_...)`。

设置按钮矩阵的控制图（类似于文本的图），使用`lv_btnmatrix_set_ctrl_map(btnm, ctrl_map)`。
`ctrl_map` 的元素应该看起来像 `ctrl_map[0] = width | LV_BTNM_CTRL_NO_REPEAT | LV_BTNM_CTRL_CHECHKABLE`。
元素的数量应该等于按钮的数量（不包括换行符）。

### One check（一次检查）

<details>
<summary>查看原文</summary>
<p>

The "One check" feature can be enabled with `lv_btnmatrix_set_one_check(btnm, true)` to allow only one button to be checked at a time.

</p>
</details>

可以使用 `lv_btnmatrix_set_one_check(btnm, true)` 启用“一次检查”功能，以允许一次只检查一个按钮。

## Events（事件）

<details>
<summary>查看原文</summary>
<p>

- `LV_EVENT_VALUE_CHANGED` Sent when a button is pressed/released or repeated after long press. The event parameter is set to the ID of the pressed/released button.
- `LV_EVENT_DRAW_PART_BEGIN` and `LV_EVENT_DRAW_PART_END` are sent for the following types:
    - `LV_BTNMATRIX_DRAW_PART_BTN` The individual buttons.
        - `part`: `LV_PART_ITEMS`
        - `id`:index of the button being drawn 
        - `draw_area`: the area of teh button
        - `rect_dsc`

</p>
</details>

- `LV_EVENT_VALUE_CHANGED` 按下/释放按钮或长按后重复时发送。 事件参数设置为按下/释放按钮的 ID。
- 为以下类型发送`LV_EVENT_DRAW_PART_BEGIN`和`LV_EVENT_DRAW_PART_END`：
     - `LV_BTNMATRIX_DRAW_PART_BTN` 单个按钮。
         - `部分`：`LV_PART_ITEMS`
         - `id`：正在绘制的按钮的索引
         - `draw_area`：按钮的区域
         - `rect_dsc`

<details>
<summary>查看原文</summary>
<p>

See the events of the [Base object](/widgets/obj) too.


`lv_btnmatrix_get_selected_btn(btnm)` returns the index of the most recently released or focused button or `LV_BTNMATRIX_BTN_NONE` if no such button.

`lv_btnmatrix_get_btn_text(btnm, btn_id)` returns a pointer to the text of `btn_id`th button.

Learn more about [Events](/overview/event).

</p>
</details>

参见 [Base object](/widgets/obj) 的事件。


`lv_btnmatrix_get_selected_btn(btnm)` 返回最近释放或聚焦的按钮的索引，如果没有这样的按钮，则返回 `LV_BTNMATRIX_BTN_NONE`。

`lv_btnmatrix_get_btn_text(btnm, btn_id)` 返回指向 `btn_id`th 按钮文本的指针。

详细了解 [事件](/overview/event)。

## Keys（按键）

<details>
<summary>查看原文</summary>
<p>

- `LV_KEY_RIGHT/UP/LEFT/RIGHT` To navigate among the buttons to select one
- `LV_KEY_ENTER` To press/release the selected button

Learn more about [Keys](/overview/indev).

</p>
</details>

- `LV_KEY_RIGHT/UP/LEFT/RIGHT` 在按钮之间导航以选择一个
- `LV_KEY_ENTER` 按下/释放所选按钮

了解有关 [Keys](/overview/indev) 的更多信息。

## Example

```eval_rst

.. include:: ../../../examples/widgets/btnmatrix/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_btnmatrix.h
  :project: lvgl

```
