```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/widgets/arc.md
```
# Arc（圆弧） (lv_arc)

## Overview（概述）

<details>
<summary>查看原文</summary>
<p>

The Arc consists of a background and a foreground arc. The foregrond (indicator) can be touch-adjusted.
 
</p>
</details>

圆弧由背景和前景弧组成。前景（指示器）可以进行触摸调整。

## Parts and Styles

<details>
<summary>查看原文</summary>
<p>

- `LV_PART_MAIN`  Draws a background using the typical background style properties and an arc using the arc style properties. The arc's size and position will respect the *padding* style properties.
- `LV_PART_INDICATOR` Draws an other arc using the *arc* style properties. Its padding values are interpreted relative to the background arc. 
- `LV_PART_KNOB` Draws a handle on the end of the indicator using all background properties and padding values. With zero padding the knob size is the same as the indicator's width. 
Larger padding makes it larger, smaller padding makes it smaller. 
 
</p>
</details>

- `LV_PART_MAIN` 圆弧的背景部分。使用典型的背景样式属性绘制背景，使用圆弧样式属性绘制圆弧。 圆弧的大小和位置可以通过 *padding* 样式调整。
- `LV_PART_INDICATOR` 圆弧的指示器部分。使用 *arc* 样式属性绘制另一个圆弧。 它的填充值是相对于背景弧来设置的。
- `LV_PART_KNOB` 圆弧的旋钮部分。使用所有背景属性和填充值在指标的末尾绘制一个旋钮。如果使用零填充，旋钮大小与指示器的宽度相同。较大的填充使其更大，较小的填充使其更小。

## Usage（用法）

### Value and range（值和范围）

<details>
<summary>查看原文</summary>
<p>

A new value can be set using `lv_arc_set_value(arc, new_value)`. 
The value is interpreted in a range (minimum and maximum values) which can be modified with `lv_arc_set_range(arc, min, max)`.
The default range is 0..100.

The indicator arc is drawn on the main part's arc. This if the value is set to maximum the indicator arc will cover the entire "background" arc.
To set the start and end angle of the background arc use the `lv_arc_set_bg_angles(arc, start_angle, end_angle)` functions or `lv_arc_set_bg_start/end_angle(arc, angle)`. 

Zero degrees is at the middle right (3 o'clock) of the object and the degrees are increasing in clockwise direction.
The angles should be in the [0;360] range. 
 
</p>
</details>

可以通过 `lv_arc_set_value(arc, new_value)` 设置一个数值。

可以通过 `lv_arc_set_range(arc, min, max)` 指定数值的范围（最小值和最大值）。
如果没有指定数值范围，将使用默认范围 (0-100)。

指示器绘制在 LV_PART_MAIN 部分的弧上面。 如果指示器的值设置为最大值，则指示器弧将呈现一个闭合的狐(也就是圆形)。
要设置背景弧的开始和结束角度，请使用 `lv_arc_set_bg_angles(arc, start_angle, end_angle)` 函数或 `lv_arc_set_bg_start/end_angle(arc, angle)`。

零度位于对象的中间右侧（3 点钟方向），并且度数沿顺时针方向增加。
角度应在 [0;360] 范围内。

### Rotation（旋转）

<details>
<summary>查看原文</summary>
<p>

An offset to the 0 degree position can added with `lv_arc_set_rotation(arc, deg)`.
 
</p>
</details>

可以使用 `lv_arc_set_rotation(arc, deg)` 添加到 0 度位置的偏移量。

### Mode（模式）

<details>
<summary>查看原文</summary>
<p>

The arc can be one of the following modes:
- `LV_ARC_MODE_NORMAL` The indicator arc is drawn from the minimimum value to the current.
- `LV_ARC_MODE_REVERSE` The indicator arc is drawn counter-clockwise from the maximum value to the current.
- `LV_ARC_MODE_SYMMETRICAL` The indicator arc is drawn from the middle point to the current value.

The mode can be set by `lv_arc_set_mode(arc, LV_ARC_MODE_...)` and used only if the the angle is set by `lv_arc_set_value()` or the arc is adjusted by finger.
 
</p>
</details>

弧可以是以下模式之一：
- `LV_ARC_MODE_NORMAL` 普通模式。指示器从最小值绘制到当前值。
- `LV_ARC_MODE_REVERSE` 反向模式。指示器从最大值到当前值逆时针绘制。
- `LV_ARC_MODE_SYMMETRICAL` 对称模式。指示器从中间点绘制到当前值。

可以通过 `lv_arc_set_mode(arc, LV_ARC_MODE_...)` 设置模式，并且仅当角度由 `lv_arc_set_value()` 设置或通过手指调整弧度时使用。

### Change rate（变化率）

<details>
<summary>查看原文</summary>
<p>

If the arc is pressed the current value will set with a limited speed according to the set *change rate*. 
The change rate is defined in degree/second unit and can be set with `lv_arc_set_change_rage(arc, rate)`
 
</p>
</details>

如果弧被按下，当前值将根据设置的 *变化率* 以有限的速度设置。
变化率以 度/秒 为单位定义，可以用 `lv_arc_set_change_rage(arc, rate)` 设置

### Setting the indicator manually（手动设置指示器）

<details>
<summary>查看原文</summary>
<p>

It also possible to set the angles of the indicator arc directly with `lv_arc_set_angles(arc, start_angle, end_angle)` function or `lv_arc_set_start/end_angle(arc, start_angle)`.
In this case the set "value" and "mode" is ignored.

In other words, the angle and value settings are independent. You should exclusively use one or the other. Mixing the two might result in unintended behavior.

To make the arc non-adjustabe remove the style of the knob and make the object non-clickable:
 
</p>
</details>

也可以直接使用 `lv_arc_set_angles(arc, start_angle, end_angle)` 函数或 `lv_arc_set_start/end_angle(arc, start_angle)` 设置指示器的角度(零度位于对象的中间右侧（3 点钟方向），并且度数沿顺时针方向增加。)。
在这种情况下，设置的 “值” 和 “模式” 将被忽略。

换句话说，角度和值的设置是独立的。两者混合可能会导致意外行为。比如：

```c
static void arc_event_cb(lv_event_t * e)
{
    lv_obj_t * arc = lv_event_get_target(e);
    
	lv_arc_set_bg_angles(arc, 0, lv_arc_get_value(arc));
}

.....
lv_obj_add_event_cb(arc, arc_event_cb, LV_EVENT_VALUE_CHANGED, NULL);
.....
```


要使圆弧不可调整，请移除旋钮的样式并使对象不可点击：

```c
lv_obj_remove_style(arc, NULL, LV_PART_KNOB);
lv_obj_clear_flag(arc, LV_OBJ_FLAG_CLICKABLE);
```

## Events（事件）

<details>
<summary>查看原文</summary>
<p>

- `LV_EVENT_VALUE_CHANGED` sent when the arc is pressed/dragged to set a new value.
- `LV_EVENT_DRAW_PART_BEGIN` and `LV_EVENT_DRAW_PART_END` are sent with the following types:
    - `LV_ARC_DRAW_PART_BACKGROUND` The background arc. 
        - `part`: `LV_PART_MAIN`
        - `p1`: center of the arc
        - `radius`: radius of the arc
        - `arc_dsc`
    - `LV_ARC_DRAW_PART_FOREGROUND` The foreground arc.  
        - `part`: `LV_PART_INDICATOR`
        - `p1`: center of the arc
        - `radius`: radius of the arc
        - `arc_dsc`
    - LV_ARC_DRAW_PART_KNOB The knob
        - `part`: `LV_PART_KNOB`
        - `draw_area`: the arae of the knob
        - `rect_dsc`:
    
See the events of the [Base object](/widgets/obj) too.
    
Learn more about [Events](/overview/event).
 
</p>
</details>

- 按下或拖动圆弧设置新值时发送会 `LV_EVENT_VALUE_CHANGED`
- `LV_EVENT_DRAW_PART_BEGIN` 和 `LV_EVENT_DRAW_PART_END` 使用以下类型发送：
     - `LV_ARC_DRAW_PART_BACKGROUND` 背景弧。
         - `部分`：`LV_PART_MAIN`
         - `p1`：圆弧的中心
         - `radius`：弧的半径
         - `arc_dsc`
     - `LV_ARC_DRAW_PART_FOREGROUND` 前景弧。
         - `部分`：`LV_PART_INDICATOR`
         - `p1`：圆弧的中心
         - `radius`：弧的半径
         - `arc_dsc`
     - LV_ARC_DRAW_PART_KNOB 旋钮
         - `部分`：`LV_PART_KNOB`
         - `draw_area`：旋钮的面积
         -`rect_dsc`：
    
参见 [Base object](/widgets/obj) 的事件。
    
详细了解 [事件](/overview/event)。

## Keys（按键）

<details>
<summary>查看原文</summary>
<p>

- `LV_KEY_RIGHT/UP` Increases the value by one.
- `LV_KEY_LEFT/DOWN` Decreases the value by one.


Learn more about [Keys](/overview/indev).

 
</p>
</details>

- `LV_KEY_RIGHT/UP` 将值增加一。
- `LV_KEY_LEFT/DOWN` 将值减一。


了解有关 [Keys](/overview/indev) 的更多信息。

## Example

```eval_rst

.. include:: ../../../examples/widgets/arc/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_arc.h
  :project: lvgl

```
