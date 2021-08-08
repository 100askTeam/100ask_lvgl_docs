```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/widgets/roller.md
```
# Roller（滚轮） (lv_roller)

## Overview（概述）

<details>
<summary>查看原文</summary>
<p>

Roller allows you to simply select one option from a list by scrolling. 

</p>
</details>

滚轮允许您通过滚动从列表中简单地选择一个选项。

## Parts and Styles（零件和样式）

<details>
<summary>查看原文</summary>
<p>

- `LV_PART_MAIN` The background of the roller uses all the typical background properties and text style properties. `style_text_line_space` adjusts the space between the options. 
When the Roller is scrolled and doesn't stop exactly on an option it will scroll to the nearest valid option automatically in `anim_time` milliseconds as specified in the style.
- `LV_PART_SELECTED` The selected option in the middle. Besides the typical background properties it uses the text style properties to change the appearance of the text in the selected area.

</p>
</details>

- `LV_PART_MAIN` 滚轮的背景使用了所有典型的背景属性和文本样式属性。 `style_text_line_space` 调整选项之间的空间。
当滚轮滚动并且没有完全停在一个选项上时，它将按照样式中指定的`anim_time` 毫秒自动滚动到最近的有效选项。
- `LV_PART_SELECTED` 中间选中的选项。 除了典型的背景属性之外，它还使用文本样式属性来更改所选区域中文本的外观。

## Usage（用法）

### Set options（设置点）

<details>
<summary>查看原文</summary>
<p>

Options are passed to the Roller as a string with `lv_roller_set_options(roller, options, LV_ROLLER_MODE_NORMAL/INFINITE)`. The options should be separated by `\n`. For example: `"First\nSecond\nThird"`.

`LV_ROLLER_MODE_INFINITE` makes the roller circular.

You can select an option manually with `lv_roller_set_selected(roller, id, LV_ANIM_ON/OFF)`, where *id* is the index of an option.

</p>
</details>

选项作为带有`lv_roller_set_options(roller, options, LV_ROLLER_MODE_NORMAL/INFINITE)`的字符串传递给Roller。 选项应该用 `\n` 分隔。 例如：`"First\nSecond\nThird"`。

`LV_ROLLER_MODE_INFINITE` 使滚轮呈圆形。

您可以使用 `lv_roller_set_selected(roller, id, LV_ANIM_ON/OFF)` 手动选择选项，其中 *id* 是选项的索引。

### Get selected option（获取选中的选项）

<details>
<summary>查看原文</summary>
<p>

The get the *index* of the currently selected option use `lv_roller_get_selected(roller)`.

`lv_roller_get_selected_str(roller, buf, buf_size)` will copy the name of the selected option to `buf`.

</p>
</details>

获取当前选定选项的 *index* 使用 `lv_roller_get_selected(roller)`。

`lv_roller_get_selected_str(roller, buf, buf_size)` 会将所选选项的名称复制到 `buf`。

### Visible rows（可见行）

<details>
<summary>查看原文</summary>
<p>

The number of visible rows can be adjusted with `lv_roller_set_visible_row_count(roller, num)`.

This function calculates the height with the current style. If the font, line space, border width, etc of the roller changes this function needs to be called again. 

</p>
</details>

可见行数可以通过 `lv_roller_set_visible_row_count(roller, num)` 进行调整。

此函数计算当前样式的高度。 如果滚轮的字体、行距、边框宽度等发生变化，则需要再次调用此函数。

## Events（事件）

<details>
<summary>查看原文</summary>
<p>

- `LV_EVENT_VALUE_CHANGED` Sent when a new option is selected.

See the events of the [Base object](/widgets/obj) too.

Learn more about [Events](/overview/event).

</p>
</details>

- `LV_EVENT_VALUE_CHANGED` 选择新选项时发送。

参见 [Base object](/widgets/obj) 的事件。

详细了解 [事件](/overview/event)。

## Keys（按键）

<details>
<summary>查看原文</summary>
<p>

- `LV_KEY_RIGHT/DOWN` Select the next option
- `LV_KEY_LEFT/UP` Select the previous option
- `LY_KEY_ENTER` Apply the selected option (Send `LV_EVENT_VALUE_CHANGED` event) 

</p>
</details>

- `LV_KEY_RIGHT/DOWN` 选择下一个选项
- `LV_KEY_LEFT/UP` 选择上一个选项
- `LY_KEY_ENTER` 应用选择的选项（发送 `LV_EVENT_VALUE_CHANGED` 事件）

## Example

```eval_rst

.. include:: ../../../examples/widgets/roller/index.rst

```

## API 

```eval_rst

.. doxygenfile:: lv_roller.h
  :project: lvgl
        
```
