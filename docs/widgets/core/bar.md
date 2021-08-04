```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/widgets/bar.md
```
# Bar（进度条） (lv_bar)

## Overview（概述）

<details>
<summary>查看原文</summary>
<p>

The bar object has a background and an indicator on it. The width of the indicator is set according to the current value of the bar. 

Vertical bars can be created if the width of the object is smaller than its height.

Not only the end, but also the start value of the bar can be set, which changes the start position of the indicator.
 
</p>
</details>

进度条对象有一个背景和一个指示器。 指标的宽度根据柱线的当前值设置。

如果对象的宽度小于其高度，则可以创建垂直条。

不仅可以设置结束，还可以设置柱线的起始值，从而改变指标的开始位置。

## Parts and Styles（零件和样式）

<details>
<summary>查看原文</summary>
<p>

- `LV_PART_MAIN` The background of the bar and it uses the typical background style properties. Adding padding makes the indicator smaller or larger. The `anim_time` style property sets the animation time if the values set with `LV_ANIM_ON`.
- `LV_PART_INDICATOR` The indicator itself; also also uses all the typical background properties.
 
</p>
</details>

- `LV_PART_MAIN` 进度条的背景，它使用典型的背景样式属性。 添加填充会使指示器变小或变大。 如果值设置为“LV_ANIM_ON”，则“anim_time”样式属性设置动画时间。
- `LV_PART_INDICATOR` 指标本身； 还使用所有典型的背景属性。

- `LV_PART_MAIN` 进度条的背景，它使用的是样式属性的背景。补充补充。如果可以变小或变大值设置为“LV_ANIM_ON”，则“anim_time”样式属性设置动画时间。
- `LV_PART_INDICATOR`指标本身；还使用所有典型的属性背景。


## Usage（用法）

### Value and range（值和范围）

<details>
<summary>查看原文</summary>
<p>

A new value can be set by `lv_bar_set_value(bar, new_value, LV_ANIM_ON/OFF)`.
The value is interpreted in a range (minimum and maximum values) which can be modified with `lv_bar_set_range(bar, min, max)`.
The default range is 1..100.

The new value in `lv_bar_set_value` can be set with or without an animation depending on the last parameter (`LV_ANIM_ON/OFF`).
 
</p>
</details>

可以通过`lv_bar_set_value(bar, new_value, LV_ANIM_ON/OFF)` 设置新值。
该值在可以用`lv_bar_set_range(bar, min, max)`修改的范围（最小值和最大值）中解释。
默认范围是 1..100。

`lv_bar_set_value` 中的新值可以根据最后一个参数 (`LV_ANIM_ON/OFF`) 设置有或没有动画。

### Modes（模式）

<details>
<summary>查看原文</summary>
<p>

The bar can be one the following modes:
- `LV_BAR_MODE_NORMAL` A normal bar as described above
- `LV_BAR_SYMMETRICAL` Draw the indicator from the zero value to current value. Requires a negative minimum range and positive maximum range.
- `LV_BAR_RANGE` Allows setting the start value too by `lv_bar_set_start_value(bar, new_value, LV_ANIM_ON/OFF)`. The start value always has to be smaller than the end value.
 
</p>
</details>

进度条可以是以下模式之一：
- `LV_BAR_MODE_NORMAL` 如上所述的普通条
- `LV_BAR_SYMMETRICAL` 从零值到当前值绘制指标。 需要负的最小范围和正的最大范围。
- `LV_BAR_RANGE` 也允许通过 `lv_bar_set_start_value(bar, new_value, LV_ANIM_ON/OFF)` 设置起始值。 起始值必须始终小于结束值。
- 
## Events（事件）

<details>
<summary>查看原文</summary>
<p>

- `LV_EVENT_DRAW_PART_BEGIN` and `LV_EVENT_DRAW_PART_END` are sent for the following parts:
    - `LV_BAR_DRAW_PART_INDICATOR` The indicator of the bar
        - `part`: `LV_PART_INDICATOR` 
        - `draw_area`: area of the indicator
        - `rect_dsc`
        
See the events of the [Base object](/widgets/obj) too.

Learn more about [Events](/overview/event).
 
</p>
</details>

- 为以下部分发送`LV_EVENT_DRAW_PART_BEGIN`和`LV_EVENT_DRAW_PART_END`：
     - `LV_BAR_DRAW_PART_INDICATOR` 柱线指标
         - `部分`：`LV_PART_INDICATOR`
         - `draw_area`：指标的区域
         -`rect_dsc`
        
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

了解有关 [Keys](/overview/indev) 的更多信息。

## Example

```eval_rst

.. include:: ../../../examples/widgets/bar/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_bar.h
  :project: lvgl

```
