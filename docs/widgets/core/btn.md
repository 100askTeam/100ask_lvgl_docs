```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/widgets/btn.md
```
# Button（按钮） (lv_btn)

## Overview

<details>
<summary>查看原文</summary>
<p>

Buttons have no new features compared to the [Base object](/widgets/obj). They are usuful for semantic purposes and have slightly different default settings.

Buttons, by default, differ from Base object in the following ways:
- Not scrollable
- Added to the default group
- Default height and width set to `LV_SIZE_CONTENT`

</p>
</details>

与 [Base object](/widgets/obj) 相比，按钮没有新功能。 它们可用于语义目的，并且默认设置略有不同。

默认情况下，按钮在以下方面与 Base 对象不同：
- 不可滚动
- 添加到默认组
- 默认高度和宽度设置为`LV_SIZE_CONTENT`

## Parts and Styles（零件和样式）

<details>
<summary>查看原文</summary>
<p>

- `LV_PART_MAIN` The background of the button. Uses the typical background style properties.

</p>
</details>

-`LV_PART_MAIN`按钮的背景。使用典型的背景样式属性。

## Usage（用法）

<details>
<summary>查看原文</summary>
<p>

There are no new features compared to [Base object](/widgets/obj).

</p>
</details>

与 [基本对象](/widgets/obj) 相比，没有新功能。

## Events（事件）

<details>
<summary>查看原文</summary>
<p>

- `LV_EVENT_VALUE_CHANGED` when the `LV_OBJ_FLAG_CHECKABLE` flag is enabled and the object is clicked. The event happens on transition to/from the checked state.


Learn more about [Events](/overview/event).

</p>
</details>

- 启用“LV_OBJ_FLAG_CHECKABLE”标志并单击对象时的“LV_EVENT_VALUE_CHANGED”。 该事件发生在转换到/从检查状态的转换。


详细了解 [事件](/overview/event)。

## Keys（按键）

<details>
<summary>查看原文</summary>
<p>

Note that the state of `LV_KEY_ENTER` is translated to `LV_EVENT_PRESSED/PRESSING/RELEASED` etc.

See the events of the [Base object](/widgets/obj) too.

Learn more about [Keys](/overview/indev).

</p>
</details>

请注意，“LV_KEY_ENTER”的状态被转换为“LV_EVENT_PRESSED/PRESSING/RELEASED”等。

参见 [Base object](/widgets/obj) 的事件。

了解有关 [Keys](/overview/indev) 的更多信息。

## Example
```eval_rst

.. include:: ../../../examples/widgets/btn/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_btn.h
  :project: lvgl

```
