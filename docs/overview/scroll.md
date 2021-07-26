```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/overview/scroll.md
```
# Scroll（滚动）

## Overview（概述）

<details>
<summary>查看原文</summary>
<p>

In LVGL scrolling works very intuitively: if an object is out of its parent content area (the size without paddings), the parent becomes scrollable and scrollbar(s) will appear. That's it.

Any object can be scrollable including `lv_obj_t`, `lv_img`, `lv_btn`, `lv_meter`, etc

The object can either be scrolled either horizontally or vertically in one stroke; diagonal scrolling is not possible.

</p>
</details>

在 LVGL 中，滚动的工作非常直观：如果对象超出其父内容区域（没有填充的大小），则父对象的空间可滚动并且会出现滚动条。仅此而已。

任何对象都可以滚动，包括 `lv_obj_t`、`lv_img`、`lv_btn`、`lv_meter` 等

对象可以一次水平或垂直滚动​​；对角滚动是不可能的。

### Scrollbar（滚动条）
 
#### Mode（模式）

<details>
<summary>查看原文</summary>
<p>

The scrollbars are displayed according to the set `mode`. The following `mode`s exist:
- `LV_SCROLLBAR_MODE_OFF`  Never show the scrollbars
- `LV_SCROLLBAR_MODE_ON`  Always show the scrollbars
- `LV_SCROLLBAR_MODE_ACTIVE` Show scroll bars while object is being scrolled
- `LV_SCROLLBAR_MODE_AUTO`  Show scroll bars when the content is large enough to be scrolled

`lv_obj_set_scrollbar_mode(obj, LV_SCROLLBAR_MODE_...)` set the scrollbar mode on an object.

</p>
</details>

滚动条根据设置的 `模式` 显示。有下面这几种 `模式` 可以选择：
- `LV_SCROLLBAR_​​MODE_OFF` 从不显示滚动条
- `LV_SCROLLBAR_​​MODE_ON` 始终显示滚动条
- `LV_SCROLLBAR_​​MODE_ACTIVE` 在对象滚动时显示滚动条
- `LV_SCROLLBAR_​​MODE_AUTO` 当内容足够大可以滚动时显示滚动条


`lv_obj_set_scrollbar_mode(obj, LV_SCROLLBAR_​​MODE_...)` 在对象上设置滚动条模式。

#### Styling（样式）

<details>
<summary>查看原文</summary>
<p>

The scrollbars have their own dedicated part, called `LV_PART_SCROLLBAR`. For example a scrollbar can turned to red like this:

</p>
</details>

滚动条有自己的专用部分，称为 `LV_PART_SCROLLBAR` 。例如，滚动条可以像这样变成红色：

```c
static lv_style_t style_red;
lv_style_init(&style_red);
lv_style_set_bg_color(&style_red, lv_color_red());

...

lv_obj_add_style(obj, &style_red, LV_PART_SCROLLBAR);
```

<details>
<summary>查看原文</summary>
<p>

The object goes to `LV_STATE_SCROLLED` state while it's being scrolled. It allows adding different style to the scrollbar or the object itself when scrolled.
This code makes the scrollbar blue when the object is scrolled:

</p>
</details>

对象在滚动时进入 `LV_STATE_SCROLLED` 状态。它允许在滚动时向滚动条或对象本身添加不同的样式。
当对象滚动时，此代码使滚动条变为蓝色：

```c
static lv_style_t style_blue;
lv_style_init(&style_blue);
lv_style_set_bg_color(&style_red, lv_color_blue());

...

lv_obj_add_style(obj, &style_blue, LV_STATE_SCROLLED | LV_PART_SCROLLBAR);
```

### Events(事件)

<details>
<summary>查看原文</summary>
<p>

The following events are related to scrolling:
- `LV_EVENT_SCROLL_BEGIN` Scrolling begins
- `LV_EVENT_SCROLL_END` Scrolling ends
- `LV_EVENT_SCROLL` Scroll happened. Triggered on every position change.
Scroll events


</p>
</details>

以下事件与滚动相关：
- `LV_EVENT_SCROLL_BEGIN` 开始滚动
- `LV_EVENT_SCROLL_END` 滚动结束
- `LV_EVENT_SCROLL` 滚动发生。每次位置变化时触发。

滚动事件

## Basic example（基本示例）
TODO

## Features of scrolling（滚动的特点）

<details>
<summary>查看原文</summary>
<p>

Besides managing "normal" scrolling there are many interesting and useful additional features too.

</p>
</details>

除了管理 “正常” 滚动之外，还有许多有趣且有用的附加功能。

### Scrollable（滚动效果）

<details>
<summary>查看原文</summary>
<p>

It's possible to make an object non-scrollable with `lv_obj_clear_flag(obj, LV_OBJ_FLAG_SCROLLABLE)`.

Non-scrollable object can still propagate the scrolling (chain) to the parents.

The direction in which scrolling can happen can be controlled by `lv_obj_set_scroll_dir(obj, LV_DIR_...)`.
The following values are possible for the direction:
- `LV_DIR_TOP` only scroll up
- `LV_DIR_LEFT` only scroll left
- `LV_DIR_BOTTOM` only scroll down
- `LV_DIR_RIGHT` only scroll right
- `LV_DIR_HOR` only scroll horizontally
- `LV_DIR_TOP` only scroll vertically
- `LV_DIR_ALL` scroll any directions

OR-ed values are also possible. E.g. `LV_DIR_TOP | LV_DIR_LEFT`.

</p>
</details>

可以使用 `lv_obj_clear_flag(obj, LV_OBJ_FLAG_SCROLLABLE)` 使对象不可滚动。

不可滚动对象仍然可以将滚动（链）传播到父对象。

滚动发生的方向可以由`lv_obj_set_scroll_dir(obj, LV_DIR_...)`控制。
方向可能有以下值：
- `LV_DIR_TOP` 只向上滚动
- `LV_DIR_LEFT` 只向左滚动
- `LV_DIR_BOTTOM` 只向下滚动
- `LV_DIR_RIGHT` 只向右滚动
- `LV_DIR_HOR` 只能水平滚动
- `LV_DIR_TOP` 只能垂直滚动
- `LV_DIR_ALL` 滚动任何方向

可以用同时设置使用多个值（OR-ed）。例如。 `LV_DIR_TOP | LV_DIR_LEFT`。

### Scroll chain（滚动条）

<details>
<summary>查看原文</summary>
<p>

If an object can't be scrolled further (e.g. it's content has reached the bottom most position) the scrolling is propagated to it's parent. If the parent an be scrolled in that direction than it will be scrolled instead.
It propagets to the grandparent and grand-grandparents too.

The propagation on scrolling is called "scroll chaining" and it can be enabled/disabled with the `LV_OBJ_FLAG_SCROLL_CHAIN` flag. 
If chaining is disabled the propagation stops on the object and the parent(s) won't be scrolled.

</p>
</details>

如果对象无法进一步滚动（例如，它的内容已到达最底部的位置），则滚动将传播到其父级。如果父级在该方向上滚动，则它将改为滚动。
它也传播给祖父母和祖父母。

滚动传播称为 “滚动链接” ，可以使用 `LV_OBJ_FLAG_SCROLL_CHAIN` 标志启用/禁用。
如果禁用链接，则传播将停止在对象上，并且不会滚动父对象。

### Scroll momentum（滚动惯性效果）

<details>
<summary>查看原文</summary>
<p>

When the user scrolls an object and releases it, LVGL can emulate a momentum for the scrolling. It's like the object was thrown and scrolling slows down smoothly. 

The scroll momentum can be enabled/disabled with the `LV_OBJ_FLAG_SCROLL_MOMENTUM` flag. 

</p>
</details>

当用户滚动对象并释放它时，LVGL 可以模拟滚动的动量。就好像对象被抛出并且滚动平稳地减慢了速度。

可以使用 “LV_OBJ_FLAG_SCROLL_MOMENTUM” 标志启用/禁用滚动动量。

### Elastic scroll（弹性卷轴效果）

<details>
<summary>查看原文</summary>
<p>

Normally the content can't be scrolled inside the object. That is the top side of the content can't be below the top side of the object. 

However, with `LV_OBJ_FLAG_SCROLL_ELASTIC` a fancy effect can be added when the user "over-scrolls" the content. The scrolling slows down, and the content can be scrolled inside the object. 
When the object is released the content scrolled in it will be animated back to the valid position. 

</p>
</details>

通常内容不能在对象内滚动。即内容的顶部不能低于对象的顶部。

但是，使用`LV_OBJ_FLAG_SCROLL_ELASTIC` 可以在用户“滚动”内容时添加奇特的效果。滚动变慢，内容可以在对象内部滚动。
当对象被释放时，滚动到其中的内容将动画回到有效位置。

### Snapping（捕捉）

<details>
<summary>查看原文</summary>
<p>

The children of an object can be snapped according to specific rules when scrolling ends. Children can be made snappable individually with the `LV_OBJ_FLAG_SNAPPABLE` flag.

The object can align the snapped children in 4 ways: 
- `LV_SCROLL_SNAP_NONE` Snapping is disabled. (default)
- `LV_SCROLL_SNAP_START` Align the children to the left/top side of the scrolled object
- `LV_SCROLL_SNAP_END` Align the children to the right/bottom side of the scrolled object
- `LV_SCROLL_SNAP_CENTER` Align the children to the center of the scrolled object

</p>
</details>

滚动结束时，可以根据特定规则捕捉对象的子项。可以使用 `LV_OBJ_FLAG_SNAPPABLE` 标志将子对象单独设置为可捕捉。

该对象可以通过 4 种方式对齐对齐的子项：
- `LV_SCROLL_SNAP_NONE` 捕捉被禁用。 （默认）
- `LV_SCROLL_SNAP_START` 将子对象与滚动对象的左侧/顶部对齐
- `LV_SCROLL_SNAP_END` 将子对象与滚动对象的右侧/底部对齐
- `LV_SCROLL_SNAP_CENTER` 将子对象与滚动对象的中心对齐

<details>
<summary>查看原文</summary>
<p>

The alignment can be set with `lv_obj_set_scroll_snap_x/y(obj, LV_SCROLL_SNAP_...)`:
 
Under the hood the following happens:
1. User scrolls an object and releases the screen
2. LVGL calculates where the scroll would end considering scroll momentum
3. LVGL finds the nearest scroll point
4. LVGL scrolls to the snap point with an animation

</p>
</details>

对齐可以用`lv_obj_set_scroll_snap_x/y(obj, LV_SCROLL_SNAP_...)`设置：

底层代码会发生以下情况：
1. 用户滚动对象并释放屏幕
2. LVGL 考虑滚动动量计算滚动结束的位置
3. LVGL 寻找最近的滚动点
4. LVGL 滚动到带动画的捕捉点

### Scroll one(只滚动一个)

<details>
<summary>查看原文</summary>
<p>

The "scroll one" feature tells LVGL to allow scrolling only one snappable child at a time. 
So this requires to make the children snappable and set a scroll snap alignment different from `LV_SCROLL_SNAP_NONE`.

This feature can be enabled by the `LV_OBJ_FLAG_SCROLL_ONE` flag.

</p>
</details>

“只滚动一个(Scroll one)”功能告诉 LVGL 一次只允许滚动一个可捕捉的孩子。

因此，这需要使子项可捕捉并设置与 `LV_SCROLL_SNAP_NONE` 不同的滚动对齐对齐方式。
此功能可以通过 `LV_OBJ_FLAG_SCROLL_ONE` 标志启用。

### Scroll on focus（滚动焦点）

<details>
<summary>查看原文</summary>
<p>

Imagine that there a lot of objects in a group that are on scrollable object. Pressing the "Tab" button focuses the next object but it might be out of the visible area of the scrollable object. 
If the "scroll on focus" features is enabled LVGL will automatically scroll to the objects to bring the children into the view. 
The scrolling happens recursively therefore even nested scrollable object are handled properly. 
The object will be scrolled to the view even if it's on a different page of a tabview. 

</p>
</details>

想象一下，一个组中有很多对象位于可滚动对象上。按 “Tab” 按钮聚焦下一个对象，但它可能超出可滚动对象的可见区域。
如果启用了“焦点滚动”功能，LVGL 将自动滚动到对象以将子项带入视图。

滚动以递归方式发生，因此即使嵌套的可滚​​动对象也能得到正确处理。
即使对象位于 tabview 的不同页面上，它也会滚动到视图。

## Scroll manually

<details>
<summary>查看原文</summary>
<p>

The following API functions allow to manually scroll objects:
- `lv_obj_scroll_by(obj, x, y, LV_ANIM_ON/OFF)` scroll by `x` and `y` values
- `lv_obj_scroll_to(obj, x, y, LV_ANIM_ON/OFF)` scroll to bring the given coordinate to the top left corner
- `lv_obj_scroll_to_x(obj, x, LV_ANIM_ON/OFF)` scroll to bring the given coordinate to the left side
- `lv_obj_scroll_to_y(obj, y, LV_ANIM_ON/OFF)` scroll to bring the given coordinate to the left side

</p>
</details>

以下 API 函数允许手动滚动对象：
- `lv_obj_scroll_by(obj, x, y, LV_ANIM_ON/OFF)` 按 `x` 和 `y` 值滚动
- `lv_obj_scroll_to(obj, x, y, LV_ANIM_ON/OFF)` 滚动以将给定的坐标带到左上角
- `lv_obj_scroll_to_x(obj, x, LV_ANIM_ON/OFF)` 滚动以将给定的坐标带到左侧
- `lv_obj_scroll_to_y(obj, y, LV_ANIM_ON/OFF)` 滚动以将给定的坐标带到左侧

## Self size（自身尺寸）

<details>
<summary>查看原文</summary>
<p>

Self size is a property of an object. Normally, the user shouldn't use this parameter but if a custom widget is created it might be useful.

In short, self size tell the size of the content. To understand it better take the example of a table. 
Let's say it has 10 rows each with 50 px height. So the total height of the content is 500 px. In other words the "self height" is 500 px. 
If the user sets only 200 px height for the table LVGL will see that the self size is larger and make the table scrollable.

It means not only the children can make an object scrollable but a larger self size too.

LVGL uses the `LV_EVENT_GET_SELF_SIZE` event to get the self size of an object. Here is an example to see how to handle the event

</p>
</details>

自身大小是对象的属性。通常，用户不应使用此参数，但如果创建了自定义小、部件，它可能会很有用。

简而言之，自我大小告诉内容的大小。为了更好地理解它，举一个表格的例子。
假设它有 10 行，每行 50 像素高度。所以内容的总高度是 500 px。换句话说，“自身高度”是 500 像素。
如果用户只为表格设置 200 像素高度，LVGL 将看到自身尺寸更大并使表格可滚动。

这意味着不仅孩子们可以使对象可滚动，而且还可以使自身尺寸更大。

LVGL 使用 `LV_EVENT_GET_SELF_SIZE` 事件来获取对象的自身大小。下面是一个例子，看看如何处理事件

```c
if(event_code == LV_EVENT_GET_SELF_SIZE) {
	lv_point_t * p = lv_event_get_param(e);
  
  //If x or y < 0 then it doesn't neesd to be calculated now
  if(p->x >= 0) {
    p->x = 200;	//Set or calculate the self width
  }
  
  if(p->y >= 0) {
    p->y = 50;	//Set or calculate the self height
  }
}
```

## Examples

```eval_rst

.. include:: ../../examples/scroll/index.rst

```
