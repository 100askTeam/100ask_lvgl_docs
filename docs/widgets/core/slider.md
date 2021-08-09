```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/widgets/slider.md
```
# Slider（滑杆） (lv_slider)

## Overview（概述）

<details>
<summary>查看原文</summary>
<p>

The Slider object looks like a [Bar](/widgets/core/bar) supplemented with a knob. The knob can be dragged to set a value. Just like Bar, Slider can be vertical or horizontal.

</p>
</details>

Slider 对象看起来像一个 [Bar](/widgets/core/bar) 补充了一个旋钮。 可以拖动旋钮来设置一个值。 就像 Bar 一样，Slider 可以是垂直的或水平的。

## Parts and Styles（部件和样式）

<details>
<summary>查看原文</summary>
<p>

- `LV_PART_MAIN` The background of the slider. Uses all the typical background style properties. `padding` makes the indicator smaller in the respective direction.
- `LV_PART_INDICATOR` The indicator that shows the current state of the slider. Also uses all the typical background style properties.
- `LV_PART_KNOB` A rectangle (or circle) drawn at the current value. Also uses all the typical background properties to describe the knob(s). By default the knob is square (with a optional corner radius) with side length equal to the smaller side of the slider. The knob can be made larger with the `padding` values. Padding values can be asymmetric too. 

</p>
</details>

- `LV_PART_MAIN` 滑块的背景。 使用所有典型的背景样式属性。 `padding` 使指标在相应方向上变小。
- `LV_PART_INDICATOR` 显示滑块当前状态的指示器。 还使用所有典型的背景样式属性。
- `LV_PART_KNOB` 在当前值处绘制的矩形（或圆形）。 还使用所有典型的背景属性来描述旋钮。 默认情况下，旋钮是方形的（带有可选的圆角半径），边长等于滑块的较小边。 可以使用“padding”值使旋钮变大。 填充值也可以是不对称的。


## Usage（用法）

### Value and range（值和范围）

<details>
<summary>查看原文</summary>
<p>

To set an initial value use `lv_slider_set_value(slider, new_value, LV_ANIM_ON/OFF)`.  The animation time is set by the styles' `anim_time` property.

To specify the range (min, max values), `lv_slider_set_range(slider, min , max)` can be used.

</p>
</details>

要设置初始值，请使用 `lv_slider_set_value(slider, new_value, LV_ANIM_ON/OFF)`。 动画时间由样式的`anim_time` 属性设置。

要指定范围（最小值、最大值），可以使用 `lv_slider_set_range(slider, min , max)`。

### Modes（模式）

<details>
<summary>查看原文</summary>
<p>

The slider can be one the following modes:
- `LV_SLIDER_MODE_NORMAL` A normal slider as described above
- `LV_SLIDER_SYMMETRICAL` Draw the indicator form the zero value to current value. Requires negaitve minimum range and positive maximum range.
- `LV_SLIDER_RANGE` Allows setting the start value too by `lv_bar_set_start_value(bar, new_value, LV_ANIM_ON/OFF)`. The start value has to be always smaller than the end value.

The mode can be changed with `lv_slider_set_mode(slider, LV_SLIDER_MODE_...)`

</p>
</details>

滑块可以是以下模式之一：
- `LV_SLIDER_MODE_NORMAL` 如上所述的普通滑块
- `LV_SLIDER_SYMMETRICAL` 从零值到当前值绘制指标。 需要负最小范围和正最大范围。
- `LV_SLIDER_RANGE` 也允许通过 `lv_bar_set_start_value(bar, new_value, LV_ANIM_ON/OFF)` 设置起始值。 起始值必须始终小于结束值。

可以使用 `lv_slider_set_mode(slider, LV_SLIDER_MODE_...)` 更改模式

### Knob-only mode（仅旋钮模式）

<details>
<summary>查看原文</summary>
<p>

Normally, the slider can be adjusted either by dragging the knob, or by clicking on the slider bar. 
In the latter case the knob moves to the point clicked and slider value changes accordingly. In some cases it is desirable to set the slider to react on dragging the knob only. This feature is enabled by adding the `LV_OBJ_FLAG_ADV_HITTEST`: `lv_obj_add_flag(slider, LV_OBJ_FLAG_ADV_HITTEST)`.

</p>
</details>

通常，可以通过拖动旋钮或单击滑块条来调整滑块。
在后一种情况下，旋钮会移动到单击的点，滑块值会相应更改。 在某些情况下，需要将滑块设置为仅对拖动旋钮做出反应。 通过添加`LV_OBJ_FLAG_ADV_HITTEST`：`lv_obj_add_flag(slider, LV_OBJ_FLAG_ADV_HITTEST)`来启用此功能。

## Events（事件）

<details>
<summary>查看原文</summary>
<p>

- `LV_EVENT_VALUE_CHANGED` Sent while the slider is being dragged or changed with keys. 
The event is sent continuously while the slider is dragged and once when released. Use `lv_slider_is_dragged` to detemine whether the Slider is still being dragged or has just been released.
- `LV_EVENT_DRAW_PART_BEGIN` and `LV_EVENT_DRAW_PART_END` are sent for the following parts. 
    - `LV_SLIDER_DRAW_PART_KNOB` The main (right) knob of the slider
        - `part`: `LV_PART_KNOB` 
        - `draw_area`: area of the indicator
        - `rect_dsc`
        - `id`: 0
    - `LV_SLIDER_DRAW_PART_KNOB`  The left knob of the slider
        - `part`: `LV_PART_KNOB` 
        - `draw_area`: area of the indicator
        - `rect_dsc`
        - `id`: 1

See the events of the [Bar](/widgets/core/bar) too.

Learn more about [Events](/overview/event).

</p>
</details>

- `LV_EVENT_VALUE_CHANGED` 在滑块被拖动或使用键更改时发送。
拖动滑块时连续发送事件，释放时发送一次。 使用 `lv_slider_is_dragged` 来确定 Slider 是仍在被拖动还是刚刚被释放。
- `LV_EVENT_DRAW_PART_BEGIN` 和 `LV_EVENT_DRAW_PART_END` 被发送用于以下部分。
     - `LV_SLIDER_DRAW_PART_KNOB` 滑块的主（右）旋钮
         - `部分`：`LV_PART_KNOB`
         - `draw_area`：指标的区域
         -`rect_dsc`
         -`id`：0
     - `LV_SLIDER_DRAW_PART_KNOB`滑块的左侧旋钮
         - `部分`：`LV_PART_KNOB`
         - `draw_area`：指标的区域
         -`rect_dsc`
         -`id`：1

也可以查看 [Bar](/widgets/core/bar) 的事件。

详细了解 [事件](/overview/event)。

## Keys（按键）

<details>
<summary>查看原文</summary>
<p>

- `LV_KEY_UP/RIGHT` Increment the slider's value by 1
- `LV_KEY_DOWN/LEFT` Decrement the slider's value by 1

Learn more about [Keys](/overview/indev).

</p>
</details>

- `LV_KEY_UP/RIGHT` 将滑块的值增加 1
- `LV_KEY_DOWN/LEFT` 将滑块的值减 1

了解有关 [键](/overview/indev) 的更多信息。

## Example

```eval_rst

.. include:: ../../../examples/widgets/slider/index.rst

```

## API 

```eval_rst

.. doxygenfile:: lv_slider.h
  :project: lvgl
        
```
