```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/widgets/obj.md
```
# Base object（基础对象） (lv_obj)

## Overview

<details>
<summary>查看原文</summary>
<p>

The 'Base Object' implements the basic properties of widgets on a screen, such as:
- coordinates
- parent object
- children
- contains the styles
- attributes like *Clickable*, *Scrollable*, etc.

In object-oriented thinking, it is the base class from which all other objects in LVGL are inherited. 

The functions and functionalities of the Base object can be used with other widgets too. For example `lv_obj_set_width(slider, 100)`

The Base object can be directly used as a simple widget: it nothing else than a rectangle. In HTML terms, think of it as a `<div>`.
 
</p>
</details>

基础对象 "实现了屏幕上小部件的基本属性，例如。
- 坐标
- 父对象
- 子对象
- 包含样式
- 属性，如可点击、可滚动等。


在面向对象的思维中，它是基类，LVGL中的所有其他对象都是从它那里继承的。

Base 对象的功能和功能也可以与其他小部件一起使用。例如 lv_obj_set_width(slider, 100)

Base 对象可以直接用作一个简单的小部件：它只不过是一个矩形。在 HTML 术语中，将其视为 <div>。

### Coordinates（坐标）

<details>
<summary>查看原文</summary>
<p>

Only a small subset of coordinate settings is described here. To see all the features of LVGL (padding, coordinates in styles, layouts, etc) visit the [Coordinates](/overview/coords) page.
 
</p>
</details>

此处仅描述了一小部分坐标设置。要查看 LVGL 的所有功能（填充、样式中的坐标、布局等），请访问 [坐标](/overview/coords) 页面。

#### Size（大小）

<details>
<summary>查看原文</summary>
<p>

The object size can be modified on individual axes with `lv_obj_set_width(obj, new_width)` and `lv_obj_set_height(obj, new_height)`, or both axes can be modified at the same time with `lv_obj_set_size(obj, new_width, new_height)`.
 
</p>
</details>

可以使用`lv_obj_set_width(obj, new_width)` 和`lv_obj_set_height(obj, new_height)` 修改单个轴上的对象大小，或者可以同时修改两个轴，使用高度`lv_obj_set_width(obj,new_set_width)。

#### Position（位置）

<details>
<summary>查看原文</summary>
<p>

You can set the position relative to the parent with `lv_obj_set_x(obj, new_x)` and `lv_obj_set_y(obj, new_y)`, or both axes at the same time with `lv_obj_set_pos(obj, new_x, new_y)`.
 
</p>
</details>

您可以使用`lv_obj_set_x(obj, new_x)` 和`lv_obj_set_y(obj, new_y)` 设置相对于父级的位置，或者同时使用`lv_obj_set_pos(obj, new_x), _new 设置两个轴的位置。

#### Alignment（对齐）

<details>
<summary>查看原文</summary>
<p>

You can align the object on its parent with `lv_obj_set_align(obj, LV_ALIGN_...)`. After this every x and y setting will be ralitive to the set alignment mode. 
For example a this will shift the object by 10;20 px from the center of its parent.
 
</p>
</details>

您可以使用 `lv_obj_set_align(obj, LV_ALIGN_...)` 将对象与其父对象对齐。此后，每个 x 和 y 设置都将适用于设置对齐模式。例如，这会将对象从其父项的中心移动 10;20 像素。

```c
lv_obj_set_align(obj, LV_ALIGN_CENTER);
lv_obj_set_pos(obj, 10, 20);

//Or in one function
lv_obj_align(obj, LV_ALIGN_CENTER, 10, 20);
```


<details>
<summary>查看原文</summary>
<p>

To align one object to another use `lv_obj_align_to(obj_to_align, obj_referece, LV_ALIGN_..., x, y)`

For example, to align a text below an image: `lv_obj_align(text, image, LV_ALIGN_OUT_BOTTOM_MID, 0, 10)`.

The following align types exist:
 
</p>
</details>

要将一个对象与另一个对象对齐，请使用`lv_obj_align_to(obj_to_align, obj_referece, LV_ALIGN_..., x, y)`

例如，要对齐图片下方的文本：`lv_obj_align(text, image, LV_ALIGN_OUT_BOTTOM_MID, 0, 10)`。

存在以下对齐类型：

![](/misc/align.png "Alignment types in LVGL")


### Parents and children（父母和孩子）

<details>
<summary>查看原文</summary>
<p>

You can set a new parent for an object with `lv_obj_set_parent(obj, new_parent)`. To get the current parent, use `lv_obj_get_parent(obj)`.

To get a specific children of a parent use `lv_obj_get_child(parent, idx)`. Some examples for `idx`:
- `0` get the child created first child
- `1` get the child created second
- `-1` get the child created last

The children can be iterated lke this
 
</p>
</details>

您可以使用 `lv_obj_set_parent(obj, new_parent)` 为对象设置新的父级。要获取当前父级，请使用 `lv_obj_get_parent(obj)`。

要获取父母的特定孩子，请使用`lv_obj_get_child(parent, idx)`。 `idx` 的一些示例：

- `0` 获取创建的第一个子项
- `1` 获取创建的第二个子项
- `-1` 获取最后创建的子项

```c
uint32_t i;
for(i = 0; i < lv_obj_get_child_cnt(parent); i++) {
  lv_obj_t * child = lv_obj_get_child(paernt, i);
  /*Do something with child*/
}
```

<details>
<summary>查看原文</summary>
<p>

`lv_obj_get_child_id(obj)` returns the index of the object. That is how many younger children its parent has.

You can bring an object to the foreground or send it to the background with `lv_obj_move_foreground(obj)` and `lv_obj_move_background(obj)`.
 
</p>
</details>

`lv_obj_get_child_id(obj)` 返回对象的索引。那就是它的父母有多少个年幼的孩子。

您可以使用`lv_obj_move_foreground(obj)` 和`lv_obj_move_background(obj)` 将对象带到前台或将其发送到后台。

### Screens（屏幕）

<details>
<summary>查看原文</summary>
<p>

When you have created a screen like `lv_obj_t * screen = lv_obj_create(NULL)`, you can load it with `lv_scr_load(screen)`. The `lv_scr_act()` function gives you a pointer to the current screen.

If you have multiple displays then it's important to know that these functions operate on the most-recently created or on the explicitly selected (with `lv_disp_set_default`) display.

To get an object's screen use the `lv_obj_get_screen(obj)` function.
 
</p>
</details>

当你创建了一个像 `lv_obj_t * screen = lv_obj_create(NULL)` 这样的屏幕后，你可以使用 `lv_scr_load(screen)` 加载它。 `lv_scr_act()` 函数为您提供指向当前屏幕的指针。

如果您有多个显示器，那么重要的是要知道这些函数是在最近创建的还是在明确选择的（使用 `lv_disp_set_default`）显示器上运行的。

要获取对象的屏幕，请使用 `lv_obj_get_screen(obj)` 函数。

### Events（事件）

<details>
<summary>查看原文</summary>
<p>

To set an event callback for an object, use `lv_obj_add_event_cb(obj, event_cb, LV_EVENT_..., user_data)`,

To manually send an event to an object, use `lv_event_send(obj, LV_EVENT_..., param)`

Read the [Event overview](/overview/event) to learn more about the events.
 
</p>
</details>


要为对象设置事件回调，请使用`lv_obj_add_event_cb(obj, event_cb, LV_EVENT_..., user_data)`，

要手动向对象发送事件，请使用`lv_event_send(obj, LV_EVENT_..., param)`

阅读 [事件概述](/overview/event) 以了解有关事件的更多信息。

### Styles（样式）

<details>
<summary>查看原文</summary>
<p>

Be sure to read the [Style overview](/overview/style). Here only the most essential functions are described.

A new style can be added to an object with `lv_obj_add_style(obj, &new_style, selector)` function. 
`selector` is a combination of part and state(s). E.g. `LV_PART_SCROLLBAR | LV_STATE_PRESSED`.

The base objects use `LV_PART_MAIN` style properties and `LV_PART_SCROLLBAR` with the typical backgroud style properties. 
 
</p>
</details>

请务必阅读 [样式概述](/overview/style)。这里只描述了最重要的功能。

可以使用 `lv_obj_add_style(obj, &new_style, selector)` 函数向对象添加新样式。 
`选择器` 是部件和状态的组合。例如。 `LV_PART_SCROLLBAR | LV_STATE_PRESSED`。

### Flags（宏开关）

<details>
<summary>查看原文</summary>
<p>

There are some attributes which can be enabled/disabled by `lv_obj_add/clear_flag(obj, LV_OBJ_FLAG_...)`:

- `LV_OBJ_FLAG_HIDDEN`  Make the object hidden. (Like it wasn't there at all)
- `LV_OBJ_FLAG_CLICKABLE`  Make the object clickable by the input devices
- `LV_OBJ_FLAG_CLICK_FOCUSABLE`  Add focused state to the object when clicked
- `LV_OBJ_FLAG_CHECKABLE`  Toggle checked state when the object is clicked
- `LV_OBJ_FLAG_SCROLLABLE`  Make the object scrollable
- `LV_OBJ_FLAG_SCROLL_ELASTIC`  Allow scrolling inside but with slower speed
- `LV_OBJ_FLAG_SCROLL_MOMENTUM`  Make the object scroll further when "thrown"
- `LV_OBJ_FLAG_SCROLL_ONE` Allow scrolling only one snappable children
- `LV_OBJ_FLAG_SCROLL_CHAIN`  Allow propagating the scroll to a parent
- `LV_OBJ_FLAG_SCROLL_ON_FOCUS`  Automatically scroll object to make it visible when focused
- `LV_OBJ_FLAG_SNAPPABLE` If scroll snap is enabled on the parent it can snap to this object
- `LV_OBJ_FLAG_PRESS_LOCK` Keep the object pressed even if the press slid from the object
- `LV_OBJ_FLAG_EVENT_BUBBLE` Propagate the events to the parent too
- `LV_OBJ_FLAG_GESTURE_BUBBLE` Propagate the gestures to the parent
- `LV_OBJ_FLAG_ADV_HITTEST` Allow performing more accurate hit (click) test. E.g. consider rounded corners.
- `LV_OBJ_FLAG_IGNORE_LAYOUT` Make the object position-able by the layouts
- `LV_OBJ_FLAG_FLOATING` Do not scroll the object when the parent scrolls and ignore layout

- `LV_OBJ_FLAG_LAYOUT_1`  Custom flag, free to use by layouts
- `LV_OBJ_FLAG_LAYOUT_2`  Custom flag, free to use by layouts

- `LV_OBJ_FLAG_WIDGET_1`  Custom flag, free to use by widget
- `LV_OBJ_FLAG_WIDGET_2`  Custom flag, free to use by widget

- `LV_OBJ_FLAG_USER_1`  Custom flag, free to use by user
- `LV_OBJ_FLAG_USER_2`  Custom flag, free to use by user
- `LV_OBJ_FLAG_USER_3`  Custom flag, free to use by user
- `LV_OBJ_FLAG_USER_4`  Custom flag, free to use by usersection.

Some examples:
 
</p>
</details>

有一些属性可以通过`lv_obj_add/clear_flag(obj, LV_OBJ_FLAG_...)`启用/禁用：

- `LV_OBJ_FLAG_HIDDEN` 隐藏对象。 （就像它根本不存在一样）
- `LV_OBJ_FLAG_CLICKABLE` 使输入设备可点击对象
- `LV_OBJ_FLAG_CLICK_FOCUSABLE` 单击时将焦点状态添加到对象
- `LV_OBJ_FLAG_CHECKABLE` 对象被点击时切换选中状态
- `LV_OBJ_FLAG_SCROLLABLE` 使对象可滚动
- `LV_OBJ_FLAG_SCROLL_ELASTIC` 允许在内部滚动但速度较慢
- `LV_OBJ_FLAG_SCROLL_MOMENTUM` 在“抛出”时使对象滚动得更远
- `LV_OBJ_FLAG_SCROLL_ONE` 只允许滚动一个可捕捉的孩子
- `LV_OBJ_FLAG_SCROLL_CHAIN` 允许将滚动传播到父级
- `LV_OBJ_FLAG_SCROLL_ON_FOCUS` 自动滚动对象以使其在聚焦时可见
- `LV_OBJ_FLAG_SNAPPABLE` 如果在父对象上启用了滚动捕捉，它可以捕捉到这个对象
- `LV_OBJ_FLAG_PRESS_LOCK` 保持对象被按下，即使按下从对象上滑动
- `LV_OBJ_FLAG_EVENT_BUBBLE` 也将事件传播给父级
- `LV_OBJ_FLAG_GESTURE_BUBBLE` 将手势传播给父级
- `LV_OBJ_FLAG_ADV_HITTEST` 允许执行更准确的命中（点击）测试。例如。考虑圆角。
- `LV_OBJ_FLAG_IGNORE_LAYOUT` 使对象可以通过布局定位
- `LV_OBJ_FLAG_FLOATING` 父滚动时不滚动对象，忽略布局

- `LV_OBJ_FLAG_LAYOUT_1` 自定义标志，可供布局免费使用
- `LV_OBJ_FLAG_LAYOUT_2` 自定义标志，可供布局免费使用

- `LV_OBJ_FLAG_WIDGET_1` 自定义标志，小部件免费使用
- `LV_OBJ_FLAG_WIDGET_2` 自定义标志，小部件免费使用

- `LV_OBJ_FLAG_USER_1` 自定义标志，用户免费使用
- `LV_OBJ_FLAG_USER_2` 自定义标志，用户免费使用
- `LV_OBJ_FLAG_USER_3` 自定义标志，用户免费使用
- `LV_OBJ_FLAG_USER_4` 自定义标志，由用户部分免费使用。
一些例子：

```c
/*Hide on object*/
lv_obj_add_flag(obj, LV_OBJ_FLAG_HIDDEN);

/*Make an obejct non-clickable*/
lv_obj_clear_flag(obj, LV_OBJ_FLAG_CLICKABLE);
```

### Groups

<details>
<summary>查看原文</summary>
<p>

Read the [Input devices overview](/overview/indev) to learn more about the *Groups*.

Objects are added to a *group* with `lv_group_add_obj(group, obj)`, and you can use `lv_obj_get_group(obj)` to see which group an object belongs to.

`lv_obj_is_focused(obj)` returns if the object is currently focused on its group or not. If the object is not added to a group, `false` will be returned.

 
</p>
</details>

阅读 [输入设备概述](/overview/indev) 以了解有关 *Groups* 的更多信息。

使用`lv_group_add_obj(group, obj)`将对象添加到*组*，您可以使用`lv_obj_get_group(obj)`查看对象属于哪个组。

`lv_obj_is_focused(obj)` 返回对象当前是否聚焦在其组上。 如果对象未添加到组中，则将返回 `false`。

### Extended click area（拓展的点击区域）

<details>
<summary>查看原文</summary>
<p>

By default, the objects can be clicked only on their coordinates, however, this area can be extended with `lv_obj_set_ext_click_area(obj, size)`.
 
</p>
</details>

默认情况下，只能在对象的坐标上单击对象，但是，可以使用 `lv_obj_set_ext_click_area(obj, size)` 扩展该区域。

## Events（事件）

<details>
<summary>查看原文</summary>
<p>

- `LV_EVENT_VALUE_CHANGED` when the `LV_OBJ_FLAG_CHECKABLE` flag is enabled and the object clicked (on transition to/from the checked state)
- `LV_EVENT_DRAW_PART_BEGIN` and `LV_EVENT_DRAW_PART_END` is sent for the following types:
    - `LV_OBJ_DRAW_PART_RECTANGLE` The main rectangle
       - `part`: `LV_PART_MAIN`
       - `rect_dsc`
       - `draw_area`: the area of the rectangle
    - `LV_OBJ_DRAW_PART_BORDER_POST`  The border if the `border_post` style property is `true`
       - `part`: `LV_PART_MAIN`
       - `rect_dsc`
       - `draw_area`: the area of the rectangle
    - `LV_OBJ_DRAW_PART_SCROLLBAR` the scrollbars
       - `part`: `LV_PART_SCROLLBAR`
       - `rect_dsc`
       - `draw_area`: the area of the rectangle

Learn more about [Events](/overview/event).
 
</p>
</details>

- `LV_EVENT_VALUE_CHANGED` 当`LV_OBJ_FLAG_CHECKABLE` 标志被启用并且对象被点击时（转换到/从选中状态）
- 为以下类型发送`LV_EVENT_DRAW_PART_BEGIN`和`LV_EVENT_DRAW_PART_END`：
     - `LV_OBJ_DRAW_PART_RECTANGLE` 主矩形
        - `部分`：`LV_PART_MAIN`
        -`rect_dsc`
        - `draw_area`：矩形的面积
     - `LV_OBJ_DRAW_PART_BORDER_POST` 如果`border_post` 样式属性为`true` 的边框
        - `部分`：`LV_PART_MAIN`
        -`rect_dsc`
        - `draw_area`：矩形的面积
     - `LV_OBJ_DRAW_PART_SCROLLBAR` 滚动条
        - `部分`：`LV_PART_SCROLLBAR`
        -`rect_dsc`
        - `draw_area`：矩形的面积

详细了解[事件](/overview/event)。

## Keys

<details>
<summary>查看原文</summary>
<p>

If `LV_OBJ_FLAG_CHECKABLE` is enabled `LV_KEY_RIGHT` and `LV_KEY_UP` make the object checked, and `LV_KEY_LEFT` and `LV_KEY_DOWN` make it unchecked.


Learn more about [Keys](/overview/indev).
 
</p>
</details>

如果启用了`LV_OBJ_FLAG_CHECKABLE`，则`LV_KEY_RIGHT` 和`LV_KEY_UP` 使对象被选中，而`LV_KEY_LEFT` 和`LV_KEY_DOWN` 使其不选中。

了解有关 [Keys](/overview/indev) 的更多信息。

## Example

```eval_rst

.. include:: ../../examples/widgets/obj/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_obj.h
  :project: lvgl

```
