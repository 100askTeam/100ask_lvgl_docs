```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/widgets/line.md
```
# Line（线条） (lv_line)

## Overview（概述）

<details>
<summary>查看原文</summary>
<p>

The Line object is capable of drawing straight lines between a set of points.

</p>
</details>

线条(Line)组件能在给出的一组点之间绘制出相连的直线。

## Parts and Styles（零件和样式）

<details>
<summary>查看原文</summary>
<p>

- `LV_PART_MAIN` uses all the typical background properties and line style properties.

</p>
</details>

- `LV_PART_MAIN` 使用所有典型的背景属性和线条样式属性。

## Usage（用法）

### Set points(设置点)

<details>
<summary>查看原文</summary>
<p>

The points have to be stored in an `lv_point_t` array and passed to the object by the `lv_line_set_points(lines, point_array, point_cnt)` function. 

</p>
</details>

点必须存储在 `lv_point_t` 类型的数组中，并通过 `lv_line_set_points(lines, point_array, point_cnt)` 函数将数组传递给line对象。

### Auto-size（自动调整大小）

<details>
<summary>查看原文</summary>
<p>

By default the Line's width and height are set to `LV_SIZE_CONTENT`. This means it will automatically set its size to fit all the points. If the size is set explicitly, parts on the line may not be visible.

</p>
</details>

默认情况下，线条的宽度和高度被设置为 `LV_SIZE_CONTENT` 。也就是它会根据给出的点自动调整其大小来适应所有点的分布。如果你设置了宽、高，那么线条上的有些部分可能会不可见。

### Invert y(反转 y轴)

<details>
<summary>查看原文</summary>
<p>

By default, the *y == 0* point is in the top of the object. It might be conter-intuitive in some cases so the y coordinates can be inverted with `lv_line_set_y_invert(line, true)`. In this case,  *y == 0* will be the bottom of the object. 
*y invert* is disabled by default.

</p>
</details>

默认情况下，*y == 0* 点是在line对象的顶部最左侧。这在某些情况下可能是不直观的(LCD坐标系)，这时候可以使用 `lv_line_set_y_invert(line, true)` 函数来反转 y 坐标。在这种情况下，*y == 0* 将是物体的底部最左侧(直角坐标系)。

默认不反转y轴。

## Events（事件）

<details>
<summary>查看原文</summary>
<p>

Only the [Generic events](../overview/event.html#generic-events) are sent by the object type.

See the events of the [Base object](/widgets/obj) too.

Learn more about [Events](/overview/event).

</p>
</details>

线条对象仅发送 [通用事件](../overview/event.html#generic-events)。

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

线条对象不响应处理按键(以及触摸)。

了解有关 [键](/overview/indev) 的更多信息。

## Example

```eval_rst

.. include:: ../../../examples/widgets/line/index.rst

```

## API 

```eval_rst

.. doxygenfile:: lv_line.h
  :project: lvgl
        
```