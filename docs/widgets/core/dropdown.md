```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/widgets/dropdown.md
```
# Drop-down list（下拉列表） (lv_dropdown)


## Overview（概述）

<details>
<summary>查看原文</summary>
<p>

The drop-down list allows the user to select one value from a list. 

The drop-down list is closed by default and displays a single value or a predefined text. 
When activated (by click on the drop-down list), a list is created from which the user may select one option. 
When the user selects a new value, the list is deleted again.

The Drop-down list is added to the default group (if it is set). Besides the Drop-down list is an editable object to allow selecting an option with encoder navigation too.

</p>
</details>

下拉列表允许用户从列表中选择一个值。

下拉列表默认关闭并显示单个值或预定义文本。
激活后（通过单击下拉列表），将创建一个列表，用户可以从中选择一个选项。
当用户选择一个新值时，该列表将再次被删除。

下拉列表将添加到默认组（如果已设置）。 除了下拉列表是一个可编辑的对象，也允许选择带有编码器导航的选项。

## Parts and Styles（部件和样式）

<details>
<summary>查看原文</summary>
<p>

The Dropdown widget is built from the elements: "button" and "list" (both not related to the button and list widgets)

</p>
</details>

下拉小部件由以下元素构建：“按钮”和“列表”（均与按钮和列表小部件无关）

### Button（按钮）

<details>
<summary>查看原文</summary>
<p>

- `LV_PART_MAIN` The background of the button. Uses the typical background properties and text properties for the text on it.
- `LV_PART_INDICATOR` Typically an arrow symbol that can be an image or a text (`LV_SYMBOL`).

The button goes to `LV_STATE_CHECKED` when its opened.

</p>
</details>

- `LV_PART_MAIN` 按钮的背景。 对其上的文本使用典型的背景属性和文本属性。
- `LV_PART_INDICATOR` 通常是一个箭头符号，可以是图像或文本（`LV_SYMBOL`）。

按钮在打开时会转到“LV_STATE_CHECKED”。

### List（列表）

<details>
<summary>查看原文</summary>
<p>

- `LV_PART_MAIN` The list itself. Uses the typical background properties. `max_height` can be used to limit the height of the list. 
- `LV_PART_SCROLLBAR` The scrollbar background, border, shadow properties and width (for its own width) and right padding for the spacing on the right.
- `LV_PART_SELECTED` Refers to the currently pressed, checked or pressed+checked option. Also uses the typical background properties. 

As list does not exist when the drop-down list is closed it's not possible to simply add styles to it.
Instead the following should be done:
1. Ad an event handler to the button for `LV_EVENT_VALUE_CHANGED` (triggered when the list is opened/closed)
2. Use `lv_obj_t * list = lv_dropdown_get_list(dropdown)`
3. `if(list != NULL) {/*Add the styles to the list*/}`

Alternatively the theme can be extended with the new styles. 

</p>
</details>

- `LV_PART_MAIN` 列表本身。 使用典型的背景属性。 `max_height` 可用于限制列表的高度。
- `LV_PART_SCROLLBAR` 滚动条背景、边框、阴影属性和宽度（对于它自己的宽度）以及右侧间距的右侧填充。
- `LV_PART_SELECTED` 指的是当前按下、选中或按下+选中的选项。 还使用典型的背景属性。

由于下拉列表关闭时列表不存在，因此无法简单地向其添加样式。
相反，应执行以下操作：
1. 为`LV_EVENT_VALUE_CHANGED` 的按钮添加一个事件处理程序（在列表打开/关闭时触发）
2.使用`lv_obj_t * list = lv_dropdown_get_list(dropdown)`
3. `if(list != NULL) {/*将样式添加到列表中*/}`

或者，可以使用新样式扩展主题。

## Usage（用法）

## Overview（概述）

### Set options（设置选项）

<details>
<summary>查看原文</summary>
<p>

Options are passed to the drop-down list as a string with `lv_dropdown_set_options(dropdown, options)`. Options should be separated by `\n`. For example: `"First\nSecond\nThird"`. This string will be saved in the drop-down list, so it can in a local variable.

The `lv_dropdown_add_option(dropdown, "New option", pos)` function inserts a new option to `pos` index.

To save memory the options can set from a static(constant) string too with `lv_dropdown_set_static_options(dropdown, options)`. 
In this case the options string should be alive while the drop-down list exists and `lv_dropdown_add_option` can't be used

You can select an option manually with `lv_dropdown_set_selected(dropdown, id)`, where `id` is the index of an option.

</p>
</details>

选项作为带有`lv_dropdown_set_options(dropdown, options)`的字符串传递给下拉列表。 选项应该用 `\n` 分隔。 例如：`"First\nSecond\nThird"`。 该字符串将保存在下拉列表中，因此它可以保存在局部变量中。

`lv_dropdown_add_option(dropdown, "New option", pos)` 函数向 `pos` 索引插入一个新选项。

为了节省内存，选项也可以使用`lv_dropdown_set_static_options(dropdown, options)`从静态（常量）字符串中设置。
在这种情况下，当下拉列表存在且不能使用 `lv_dropdown_add_option` 时，选项字符串应该是活动的

您可以使用 `lv_dropdown_set_selected(dropdown, id)` 手动选择一个选项，其中 `id` 是一个选项的索引。

### Get selected option（获取选择的选项）

<details>
<summary>查看原文</summary>
<p>

The get the *index* of the selected option, use `lv_dropdown_get_selected(dropdown)`.

`lv_dropdown_get_selected_str(dropdown, buf, buf_size)` copies the *name* of the selected option to `buf`.

</p>
</details>

获取所选选项的*index*，使用`lv_dropdown_get_selected(dropdown)`。

`lv_dropdown_get_selected_str(dropdown, buf, buf_size)` 将所选选项的 *name* 复制到 `buf`。

### Direction（方向）

<details>
<summary>查看原文</summary>
<p>

The list can be created on any side. The default `LV_DIR_BOTTOM` can be modified by `lv_dropdown_set_dir(dropdown, LV_DIR_LEFT/RIGHT/UP/BOTTOM)` function.

If the list would be vertically out of the screen, it will be aligned to the edge.

</p>
</details>

列表可以在任何一侧创建。 默认的`LV_DIR_BOTTOM`可以通过`lv_dropdown_set_dir(dropdown, LV_DIR_LEFT/RIGHT/UP/BOTTOM)`函数进行修改。

如果列表垂直于屏幕之外，它将与边缘对齐。

### Symbol（符号）

<details>
<summary>查看原文</summary>
<p>

A symbol (typically an arrow) can be added to the drop down list with `lv_dropdown_set_symbol(dropdown, LV_SYMBOL_...)`

If the direction of the drop-down list is  `LV_DIR_LEFT` the symbol will be shown on the left, otherwise on the right.

</p>
</details>

可以使用 `lv_dropdown_set_symbol(dropdown, LV_SYMBOL_...)` 将符号（通常是箭头）添加到下拉列表中

如果下拉列表的方向是`LV_DIR_LEFT`，符号将显示在左侧，否则显示在右侧。

### Show selected（显示选中）

<details>
<summary>查看原文</summary>
<p>

The main part can either show the selected option or a static text. If a static is set with `lv_dropdown_set_text(dropdown, "Some text")` it will be shown regardless to th selected option.
If the text is `NULL` the selected option is displayed on the button.

</p>
</details>

主要部分可以显示所选选项或静态文本。 如果使用 `lv_dropdown_set_text(dropdown, "Some text")` 设置静态，无论选择哪个选项，它都会显示。
如果文本为“NULL”，则所选选项将显示在按钮上。

### Manually open/close（手动打开/关闭）

<details>
<summary>查看原文</summary>
<p>

To manually open or close the drop-down list the `lv_dropdown_open/close(dropdown)` function can be used.

</p>
</details>

要手动打开或关闭下拉列表，可以使用 `lv_dropdown_open/close(dropdown)` 函数。

## Events（事件）

<details>
<summary>查看原文</summary>
<p>

Apart from the [Generic events](../overview/event.html#generic-events), the following [Special events](../overview/event.html#special-events) are sent by the drop-down list:
- `LV_EVENT_VALUE_CHANGED` Sent when the new option is selected or the list is opened/closed.

See the events of the [Base object](/widgets/obj) too.

Learn more about [Events](/overview/event).

</p>
</details>

除了[通用事件](../overview/event.html#generic-events)，下拉列表发送以下[特殊事件](../overview/event.html#special-events) ：
- `LV_EVENT_VALUE_CHANGED` 在选择新选项或打开/关闭列表时发送。

参见 [Base object](/widgets/obj) 的事件。

详细了解 [事件](/overview/event)。

## Keys（按键）

<details>
<summary>查看原文</summary>
<p>

- `LV_KEY_RIGHT/DOWN` Select the next option.
- `LV_KEY_LEFT/UP` Select the previous option.
- `LY_KEY_ENTER` Apply the selected option (Sends `LV_EVENT_VALUE_CHANGED` event and closes the drop-down list).

Learn more about [Keys](/overview/indev).

</p>
</details>

- `LV_KEY_RIGHT/DOWN` 选择下一个选项。
- `LV_KEY_LEFT/UP` 选择上一个选项。
- `LY_KEY_ENTER` 应用选择的选项（发送`LV_EVENT_VALUE_CHANGED` 事件并关闭下拉列表）。

了解有关 [Keys](/overview/indev) 的更多信息。

## Example

```eval_rst

.. include:: ../../../examples/widgets/dropdown/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_dropdown.h
  :project: lvgl

```
