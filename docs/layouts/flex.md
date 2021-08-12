```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/layouts/flex.md
```

# Flex（弹性布局）

## Overview（概述）

<details>
<summary>查看原文</summary>
<p>

The Flexbox (or Flex for short) is a subset of [CSS Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/).

It can arrange items into rows or columns (tracks), handle wrapping, adjust the spacing between the items and tracks, handle *grow* to make the item(s) fill the remaining space with respect to min/max width and height.

To make an object flex container call `lv_obj_set_layout(obj, LV_LAYOUT_FLEX)`.

Note that the flex layout feature of LVGL needs to be globally enabled with `LV_USE_FLEX` in `lv_conf.h`. 

</p>
</details>

Flexbox（或简称 Flex）是 [CSS Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/) 的一个子集。

它可以将项目排列成行或列（轨道），处理环绕，调整项目和轨道之间的间距，处理 *grow* 以使项目填充剩余空间的最小/最大宽度和高度。

要使对象 flex 容器调用 `lv_obj_set_layout(obj, LV_LAYOUT_FLEX)`。

请注意，LVGL 的 flex 布局功能需要通过 `lv_conf.h` 中的 `LV_USE_FLEX` 全局启用。

## Terms（约定）

<details>
<summary>查看原文</summary>
<p>

- tracks: the rows or columns
- main direction: row or column, the direction in which the items are placed
- cross direction: perpendicular to the main direction
- wrap: if there there is no more space in the track a new track is started
- grow: if set on an item it will grow to fill the remaining space on the track. 
The available space will be distributed among items respective to the their grow value (larger value means more space)
- gap: the space between the rows and columns or the items on a track

</p>
</details>

- (tracks)轨道：行或列
- (main direction)主要方向：行或列，物品放置的方向
- (cross direction)横向：垂直于主方向
- (wrap)环绕：如果曲目中没有更多空间，则开始新曲目
- (grow)增长：如果设置在一个项目上，它将增长以填充轨道上的剩余空间。
可用空间将根据其增长值分配给各个项目（值越大意味着空间越大）
- (gap)间隙：行和列或轨道上的项目之间的空间


## Simple interface（简单接口）

<details>
<summary>查看原文</summary>
<p>

With the following functions you can set a Flex layout on any parent.

</p>
</details>

使用以下功能，您可以在任何父级上设置 Flex 布局。

### Flex flow

<details>
<summary>查看原文</summary>
<p>

`lv_obj_set_flex_flow(obj, flex_flow)`

The possible values for `flex_flow` are:
- `LV_FLEX_FLOW_ROW` Place the children in a row without wrapping
- `LV_FLEX_FLOW_COLUMN` Place the children in a column without wrapping
- `LV_FLEX_FLOW_ROW_WRAP` Place the children in a row with wrapping
- `LV_FLEX_FLOW_COLUMN_WRAP` Place the children in a column with wrapping
- `LV_FLEX_FLOW_ROW_REVERSE` Place the children in a row without wrapping but in reversed order
- `LV_FLEX_FLOW_COLUMN_REVERSE` Place the children in a column without wrapping but in reversed order
- `LV_FLEX_FLOW_ROW_WRAP_REVERSE` Place the children in a row without wrapping but in reversed order
- `LV_FLEX_FLOW_COLUMN_WRAP_REVERSE` Place the children in a column without wrapping but in reversed order

</p>
</details>

`lv_obj_set_flex_flow(obj, flex_flow)`

`flex_flow` 的可能值是：
- `LV_FLEX_FLOW_ROW` 将子元素排成一排而不包裹
- `LV_FLEX_FLOW_COLUMN` 将子项放在一列中而不换行
- `LV_FLEX_FLOW_ROW_WRAP` 将孩子排成一排并包裹起来
- `LV_FLEX_FLOW_COLUMN_WRAP` 将子元素放置在带有环绕的列中
- `LV_FLEX_FLOW_ROW_REVERSE` 将子元素排成一行而不换行，但顺序相反
- `LV_FLEX_FLOW_COLUMN_REVERSE` 将子项放在一列中，不换行，但顺序相反
- `LV_FLEX_FLOW_ROW_WRAP_REVERSE` 将子元素排成一行而不换行，但顺序相反
- `LV_FLEX_FLOW_COLUMN_WRAP_REVERSE` 将子项放在一列中，不换行，但顺序相反

### Flex align

<details>
<summary>查看原文</summary>
<p>

To manage the placement of the children use `lv_obj_set_flex_align(obj,  main_place, cross_place, track_cross_place)`

- `main_place` determines how to distribute the items in their track on the main axis. E.g. flush the items to the right on `LV_FLEX_FLOW_ROW_WRAP`.  (It's called `justify-content` in CSS)
- `cross_place` determines how to distribute the items in their track on the cross axis. E.g. if the items have different height place them to the bottom of the track.  (It's called `align-items` in CSS)
- `track_cross_place` determines how to distribute the tracks (It's called `align-content` in CSS)

</p>
</details>

要管理孩子的位置，请使用 `lv_obj_set_flex_align(obj, main_place, cross_place, track_cross_place)`

- `main_place` 确定如何在主轴上的轨道中分布项目。 例如。 将“LV_FLEX_FLOW_ROW_WRAP”上的项目向右刷新。 （它在 CSS 中称为 `justify-content`）
- `cross_place` 确定如何在横轴上的轨道中分布项目。 例如。 如果项目具有不同的高度，则将它们放置在轨道的底部。 （在 CSS 中称为 `align-items`）
- `track_cross_place` 确定如何分配轨道（在 CSS 中称为 `align-content`）

<details>
<summary>查看原文</summary>
<p>

The possible values are:
- `LV_FLEX_ALIGN_START` means left on a horizontally and top vertically. (default)
- `LV_FLEX_ALIGN_END` means right on a horizontally and bottom vertically
- `LV_FLEX_ALIGN_CENTER` simply center
- `LV_FLEX_ALIGN_SPACE_EVENLY` items are distributed so that the spacing between any two items (and the space to the edges) is equal. Does not apply to `track_cross_place`.
- `LV_FLEX_ALIGN_SPACE_AROUND` items are evenly distributed in the track with equal space around them. 
Note that visually the spaces aren’t equal, since all the items have equal space on both sides. 
The first item will have one unit of space against the container edge, but two units of space between the next item because that next item has its own spacing that applies. Not applies to `track_cross_place`.
- `LV_FLEX_ALIGN_SPACE_BETWEEN` items are evenly distributed in the track: first item is on the start line, last item on the end line. Not applies to `track_cross_place`.

</p>
</details>

可能的值为：
- `LV_FLEX_ALIGN_START` 表示在水平方向和垂直方向的顶部左侧。 （默认）
- `LV_FLEX_ALIGN_END` 表示水平和底部垂直
- `LV_FLEX_ALIGN_CENTER` 只是居中
- `LV_FLEX_ALIGN_SPACE_EVENLY` 项目是分布的，因此任意两个项目之间的间距（以及到边缘的空间）是相等的。 不适用于`track_cross_place`。
- `LV_FLEX_ALIGN_SPACE_AROUND` 项目均匀分布在轨道中，它们周围的空间相等。
请注意，视觉上的空间并不相等，因为所有项目的两侧都有相等的空间。
第一个项目将与容器边缘有一个单位的空间，但下一个项目之间有两个单位的空间，因为下一个项目有自己的适用间距。 不适用于`track_cross_place`。
- `LV_FLEX_ALIGN_SPACE_BETWEEN` 项目均匀分布在轨道中：第一个项目在开始线上，最后一个项目在结束线上。 不适用于`track_cross_place`。

### Flex grow

<details>
<summary>查看原文</summary>
<p>

Flex grow can be used to make one or more children fill the available space on the track. If more children has grow the available space will be distributed proportionally to the grow values.
For example let's there is 400 px remaining space and 4 object with grow:
- `A` with grow = 1
- `B` with grow = 1
- `C` with grow = 2

`A` and `B` will have 100 px size, and `C` will have 200 px size.

Flex grow can be set on a child with `lv_obj_set_flex_flow(child, value)`. `value` needs to be &gt; 1 or 0 to disable grow on the child.

</p>
</details>

Flex Growth 可用于让一个或多个孩子填充轨道上的可用空间。 如果有更多的孩子成长，可用空间将与成长值成比例地分配。
例如，让我们有 400 像素的剩余空间和 4 个增长的对象：
- `A` 增长 = 1
- `B` 增长 = 1
- `C` 增长 = 2

`A` 和 `B` 的大小为 100 px，而 `C` 的大小为 200 px。

可以使用 `lv_obj_set_flex_flow(child, value)` 在子节点上设置 Flex 增长。 `value` 需要 &gt; 1 或 0 禁用在孩子身上生长。

## Style interface（样式接口）

<details>
<summary>查看原文</summary>
<p>

All the Flex-related values are style properties under the hood and you can use them similarly to any other style property. The following flex related style properties exist:

- `FLEX_FLOW`
- `FLEX_MAIN_PLACE`
- `FLEX_CROSS_PLACE`
- `FLEX_TRACK_PLACE`
- `FLEX_GROW`

</p>
</details>

所有与 Flex 相关的值都是底层的样式属性，您可以像使用任何其他样式属性一样使用它们。 存在以下与 flex 相关的样式属性：

- `FLEX_FLOW`
- `FLEX_MAIN_PLACE`
- `FLEX_CROSS_PLACE`
- `FLEX_TRACK_PLACE`
- `FLEX_GROW`

## Other features（其它功能）

### RTL

<details>
<summary>查看原文</summary>
<p>

If the base direction of the container is set the `LV_BASE_DIR_RTL` the meaning of `LV_FLEX_ALIGN_START` and `LV_FLEX_ALIGN_END` is swapped on `ROW` layouts. I.e. `START` will mean right.

The items on `ROW` layouts, and tracks of `COLUMN` layouts will be placed from right to left.

</p>
</details>

如果容器的基本方向设置为 `LV_BASE_DIR_RTL`，`LV_FLEX_ALIGN_START` 和 `LV_FLEX_ALIGN_END` 的含义在 `ROW` 布局上交换。 IE。 `START` 表示正确。

`ROW` 布局上的项目和 `COLUMN` 布局的轨道将从右到左放置。

### New track（新轨道）

<details>
<summary>查看原文</summary>
<p>

You can force Flex to put an item into a new line with `lv_obj_add_flag(child, LV_OBJ_FLAG_FLEX_IN_NEW_TRACK)`.

</p>
</details>

您可以使用 `lv_obj_add_flag(child, LV_OBJ_FLAG_FLEX_IN_NEW_TRACK)` 强制 Flex 将项目放入新行。

## Example

```eval_rst

.. include:: ../../examples/layouts/flex/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_flex.h
  :project: lvgl

```
