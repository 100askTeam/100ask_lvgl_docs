```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/widgets/checkbox.md
```
# Checkbox（复选框） (lv_checkbox)


## Overview（概述）

<details>
<summary>查看原文</summary>
<p>

The Checkbox object is created from a "tick box" and a label. When the Chackbox is clicked the tick box is toggled.

</p>
</details>

复选框 (Checkbox) 对象是从“勾选框”和标签创建的。当 Chackbox 被点击时，勾选框被切换。

## Parts and Styles（部件和样式）

<details>
<summary>查看原文</summary>
<p>

- `LV_PART_MAIN` The is the background of the Checkbox and it uses the text and all the typical backround style properties. 
`pad_column` adjusts the spacing between the tickbox and the label
- `LV_PART_INDICATOR` The "tick box" is a square that uses all the typical backround style properties. 
By default its size is equal to the height of the main part's font. Padding properties make the tick box larger in the respective directions.

The Checkbox is added to the default group (if it is set). 

</p>
</details>

- `LV_PART_MAIN` 这是复选框的背景，它使用文本和所有典型的背景样式属性。
`pad_column` 调整复选框和标签之间的间距
- `LV_PART_INDICATOR` “勾选框”是一个使用所有典型背景样式属性的正方形。
默认情况下，它的大小等于主要部分字体的高度。 填充属性使复选框在相应方向上变大。

复选框将添加到默认组（如果已设置）。

## Usage（用法）


### Text（）文本

<details>
<summary>查看原文</summary>
<p>

The text can be modified with the `lv_checkbox_set_text(cb, "New text")` function and will be dynamically allocated.

To set a static text, 
use `lv_checkbox_set_static_text(cb, txt)`. This way, only a pointer to `txt` will be stored. The text then shouldn't be deallocated while the checkbox exists.

</p>
</details>

文本可以使用 `lv_checkbox_set_text(cb, "New text")` 函数进行修改，并将被动态分配。

要设置静态文本，
使用`lv_checkbox_set_static_text(cb, txt)`。 这样，只会存储一个指向 `txt` 的指针。 当复选框存在时，不应取消分配文本。

### Check, uncheck, disable（选中，取消选中，禁用）

<details>
<summary>查看原文</summary>
<p>

You can manually check, un-check, and disable the Checkbox by using the common state add/clear function:

</p>
</details>

您可以使用通用状态添加/清除功能手动选中、取消选中和禁用复选框：

```c
lv_obj_add_state(cb, LV_STATE_CHECKED);   /*Make the chekbox checked*/
lv_obj_clear_state(cb, LV_STATE_CHECKED); /*MAke the checkbox unchecked*/
lv_obj_add_state(cb, LV_STATE_CHECKED | LV_STATE_DISABLED); /*Make the checkbox checked and disabled*/
```

## Events（事件）

<details>
<summary>查看原文</summary>
<p>

- `LV_EVENT_VALUE_CHANGED` Sent when the checkbox is toggled.
- `LV_EVENT_DRAW_PART_BEGIN` and `LV_EVENT_DRAW_PART_END` are sent for the following types:
    - `LV_CHECKBOX_DRAW_PART_BOX` The tickbox of the checkbox
        - `part`: `LV_PART_INDICATOR` 
        - `draw_area`: the area of the tickbox
        - `rect_dsc`

See the events of the [Base object](/widgets/obj) too.

Learn more about [Events](/overview/event).

</p>
</details>

- `LV_EVENT_VALUE_CHANGED` 当复选框被切换时发送。
- 为以下类型发送`LV_EVENT_DRAW_PART_BEGIN`和`LV_EVENT_DRAW_PART_END`：
     - `LV_CHECKBOX_DRAW_PART_BOX` 复选框的勾选框
         - `部分`：`LV_PART_INDICATOR`
         - `draw_area`：勾选框的区域
         -`rect_dsc`

参见 [Base object](/widgets/obj) 的事件。

详细了解 [事件](/overview/event)。

## Keys（按键）

<details>
<summary>查看原文</summary>
<p>

The following *Keys* are processed by the 'Buttons':
- `LV_KEY_RIGHT/UP` Go to toggled state if toggling is enabled
- `LV_KEY_LEFT/DOWN` Go to non-toggled state if toggling is  enabled
- `LV_KEY_ENTER` Clicks the checkbox and toggles it

Note that, as usual, the state of `LV_KEY_ENTER` is translated to `LV_EVENT_PRESSED/PRESSING/RELEASED` etc.

Learn more about [Keys](/overview/indev).

</p>
</details>

以下*键*由“按钮”处理：
- `LV_KEY_RIGHT/UP` 如果启用切换，则转到切换状态
- `LV_KEY_LEFT/DOWN` 如果启用切换，则转到非切换状态
- `LV_KEY_ENTER` 单击复选框并切换它

请注意，像往常一样，“LV_KEY_ENTER”的状态被转换为“LV_EVENT_PRESSED/PRESSING/RELEASED”等。

了解有关 [Keys](/overview/indev) 的更多信息。

## Example

```eval_rst

.. include:: ../../../examples/widgets/checkbox/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_checkbox.h
  :project: lvgl

```
