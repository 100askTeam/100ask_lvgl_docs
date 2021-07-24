```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/overview/object.md
```
# Objects（对象）

<details>
<summary>查看原文</summary>
<p>

In LVGL the **basic building blocks** of a user interface are the objects, also called *Widgets*.
For example a [Button](/widgets/core/btn), [Label](/widgets/core/label), [Image](/widgets/core/img), [List](/widgets/extra/list), [Chart](/widgets/extra/chart) or [Text area](/widgets/core/textarea).

You can see all the [Object types](/widgets/index) here.

All objects are referenced using an `lv_obj_t` pointer as a handle. This pointer can later be used to set or get the attributes of the object.

</p>
</details>

在 LVGL 中，用户界面的**基本构建块**是对象，也称为 *Widgets*。
例如 [Button](/widgets/core/btn)、[Label](/widgets/core/label)、[Image](/widgets/core/img)、[List](/widgets/extra/list) , [图表](/widgets/extra/chart) 或 [文本区域](/widgets/core/textarea)。

您可以在此处查看所有 [对象类型](/widgets/index)。

所有对象都使用 `lv_obj_t` 指针作为句柄进行引用。此指针稍后可用于设置或获取对象的属性。

## Attributes（属性）

### Basic attributes（基本属性）

<details>
<summary>查看原文</summary>
<p>

All object types share some basic attributes:
- Position
- Size
- Parent
- Styles
- Event handlers
- Etc

You can set/get these attributes with `lv_obj_set_...` and `lv_obj_get_...` functions. For example:

</p>
</details>

所有对象类型共享一些基本属性：
- 位置
- 尺寸
- 家长
- 样式
- 事件处理程序
- 等等

您可以使用 `lv_obj_set_...` 和 `lv_obj_get_...` 函数设置/获取这些属性。例如：

```c
/*Set basic object attributes*/
lv_obj_set_size(btn1, 100, 50);	  /*Set a button's size*/
lv_obj_set_pos(btn1, 20,30);      /*Set a button's position*/
```

<details>
<summary>查看原文</summary>
<p>

To see all the available functions visit the [Base object's documentation](/widgets/obj).

</p>
</details>

要查看所有可用函数，请访问 [Base object's documentation](/widgets/obj)。

### Specific attributes（特定属性）

<details>
<summary>查看原文</summary>
<p>

The object types have special attributes too. For example, a slider has
- Minimum and maximum values
- Current value

For these special attributes, every object type may have unique API functions. For example for a slider:

</p>
</details>

对象类型也有特殊的属性。例如，一个滑块有
- 最小值和最大值
- 当前值

对于这些特殊的属性，每个对象类型都可能有唯一的 API 函数。例如对于滑块：

```c
/*Set slider specific attributes*/
lv_slider_set_range(slider1, 0, 100);	   				/*Set the min. and max. values*/
lv_slider_set_value(slider1, 40, LV_ANIM_ON);		/*Set the current value (position)*/
```

<details>
<summary>查看原文</summary>
<p>

The API of the widgets is described in their [Documentation](/widgets/index) but you can also check the respective header files (e.g. *widgets/lv_slider.h*)

</p>
</details>

小部件的 API 在它们的 [文档](/widgets/index) 中有描述，但您也可以检查相应的头文件（例如 *widgets/lv_slider.h*）

## Working mechanisms（工作机制）

### Parent-child structure（父子结构）

<details>
<summary>查看原文</summary>
<p>

A parent object can be considered as the container of its children. Every object has exactly one parent object (except screens), but a parent can have any number of children.
There is no limitation for the type of the parent but, there are typical parent (e.g. button) and typical child (e.g. label) objects.

</p>
</details>

父对象可以被视为其子对象的容器。每个对象只有一个父对象（屏幕除外），但一个父对象可以有任意数量的子对象。
父对象的类型没有限制，但是有典型的父对象（例如按钮）和典型的子对象（例如标签）。

### Moving together（一起移动）

<details>
<summary>查看原文</summary>
<p>

If the position of the parent changes the children will move with the parent.
Therefore all positions are relative to the parent.

</p>
</details>

如果父节点的位置发生变化，子节点将与父节点一起移动。
因此，所有位置都相对于父级。

![](/misc/par_child1.png "Objects are moving together 1")

```c
lv_obj_t * parent = lv_obj_create(lv_scr_act());   /*Create a parent object on the current screen*/
lv_obj_set_size(parent, 100, 80);	                 /*Set the size of the parent*/

lv_obj_t * obj1 = lv_obj_create(parent);	         /*Create an object on the previously created parent object*/
lv_obj_set_pos(obj1, 10, 10);	                     /*Set the position of the new object*/
```

<details>
<summary>查看原文</summary>
<p>

Modify the position of the parent:

</p>
</details>

修改父级的位置：

![](/misc/par_child2.png "Graphical objects are moving together 2")  

```c
lv_obj_set_pos(parent, 50, 50);	/*Move the parent. The child will move with it.*/
```

<details>
<summary>查看原文</summary>
<p>

(For simplicity the adjusting of colors of the objects is not shown in the example.)

</p>
</details>

（为简单起见，示例中未显示对象颜色的调整。）

### Visibility only on the parent（仅在父对象上可见）

<details>
<summary>查看原文</summary>
<p>

If a child is partially or fully out of its parent then the parts outside will not be visible.

</p>
</details>

如果孩子部分或完全脱离其父对象，则外部部分将不可见。

![](/misc/par_child3.png "A graphical object is visible on its parent")  

```c
lv_obj_set_x(obj1, -30);	/*Move the child a little bit off the parent*/
```

### Create and delete objects（创建和删除对象）

<details>
<summary>查看原文</summary>
<p>

In LVGL objects can be created and deleted dynamically in run time. It means only the currently created (existing) objects consume RAM.

This allows for the creation of a screen just when a button is clicked to open it, and for deletion of screens when a new screen is loaded.

UIs can be created based on the current environment of the device. For example one can create meters, charts, bars and sliders based on the currently attached sensors.
 
Every widget has its own **create** function with a prototype like this:

</p>
</details>

在 LVGL 中，可以在运行时动态创建和删除对象。这意味着只有当前创建的（现有）对象消耗 RAM。

这允许仅在单击按钮打开屏幕时创建屏幕，并在加载新屏幕时删除屏幕。

可以根据设备的当前环境创建 UI。例如，可以根据当前连接的传感器创建仪表、图表、条形图和滑块。

每个小部件都有自己的 **create** 函数，原型如下：

```c
lv_obj_t * lv_<widget>_create(lv_obj_t * parent, <other paramaters if any>);
```

<details>
<summary>查看原文</summary>
<p>

In most of the cases the create functions have only a *parent* parameter that tells on which object create the new widget.

The return value is a pointer to the created object with `lv_obj_t *` type.


There is a common **delete** function for all object types. It deletes the object and all of its children.

</p>
</details>

在大多数情况下，create 函数只有一个 *parent* 参数，它告诉在哪个对象上创建新小部件。

返回值是一个指向创建对象的指针，类型为 `lv_obj_t *`。

所有对象类型都有一个通用的 **delete** 函数。它删除对象及其所有子对象。

```c
void lv_obj_del(lv_obj_t * obj);
```

<details>
<summary>查看原文</summary>
<p>

`lv_obj_del` will delete the object immediately.
If for any reason you can't delete the object immediately you can use `lv_obj_del_async(obj)` that will perform the deletion on the next call of `lv_timer_handler()`.
This is useful e.g. if you want to delete the parent of an object in the child's `LV_EVENT_DELETE` handler.

You can remove all the children of an object (but not the object itself) using `lv_obj_clean(obj)`.

You can use `lv_obj_del_delayed(obj, 1000)` to delete an object after some time. The delay is expressed in millliseconds. 

</p>
</details>

`lv_obj_del` 将立即删除对象。
如果由于任何原因你不能立即删除对象，你可以使用 `lv_obj_del_async(obj)` 它将在下一次调用 `lv_timer_handler()` 时执行删除。
这很有用，例如如果您想在子对象的 `LV_EVENT_DELETE` 处理程序中删除对象的父对象。
您可以使用 `lv_obj_clean(obj)` 删除对象的所有子项（但不是对象本身）。
一段时间后，您可以使用 `lv_obj_del_delayed(obj, 1000)` 来删除对象。延迟以毫秒表示。

## Screens（屏幕）

### Create screens（创建屏幕）

<details>
<summary>查看原文</summary>
<p>

The screens are special objects which have no parent object. So they can be created like:

</p>
</details>

屏幕是没有父对象的特殊对象。所以它们可以像这样创建：

```c
lv_obj_t * scr1 = lv_obj_create(NULL);
```

<details>
<summary>查看原文</summary>
<p>

Screens can be created with any object type. For example, a [Base object](/widgets/obj) or an image to make a wallpaper.

</p>
</details>

可以使用任何对象类型创建画面。例如，[基础对象](/widgets/obj) 或用于制作壁纸的图像。

### Get the active screen（获取活动屏幕）

<details>
<summary>查看原文</summary>
<p>

There is always an active screen on each display. By default, the library creates and loads a "Base object" as a screen for each display.

To get the currently active screen use the `lv_scr_act()` function. 

</p>
</details>

每个显示器上总是有一个活动屏幕。默认情况下，库创建并加载一个“基础对象”作为每个显示的屏幕。

要获取当前活动的屏幕，请使用 `lv_scr_act()` 函数。

### Load screens（加载屏幕）

<details>
<summary>查看原文</summary>
<p>

To load a new screen, use `lv_scr_load(scr1)`.

</p>
</details>

请使用 `lv_scr_load(scr1)` 加载你要加载的屏幕。

### Layers（层）

<details>
<summary>查看原文</summary>
<p>

There are two automatically generated layers:
- top layer
- system layer

They are independent of the screens and they will be shown on every screen. The *top layer* is above every object on the screen and the *system layer* is above the *top layer* too.
You can add any pop-up windows to the *top layer* freely. But, the *system layer* is restricted to system-level things (e.g. mouse cursor will be placed here in `lv_indev_set_cursor()`).

The `lv_layer_top()` and `lv_layer_sys()` functions return pointers to the top and system layers respectively.

Read the [Layer overview](/overview/layer) section to learn more about layers.

</p>
</details>

有两个自动生成的层：
- 顶层
- 系统层

它们独立于屏幕，将显示在每个屏幕上。 *顶层*位于屏幕上的每个对象之上，*系统层*也位于*顶层*之上。
您可以自由地将任何弹出窗口添加到*顶层*。但是，*系统层*仅限于系统级事物（例如，鼠标光标将放置在“lv_indev_set_cursor()”中）。

`lv_layer_top()` 和 `lv_layer_sys()` 函数分别返回指向顶层和系统层的指针。

阅读[图层概述](/overview/layer) 部分以了解有关图层的更多信息。

#### Load screen with animation（用动画加载屏幕）

<details>
<summary>查看原文</summary>
<p>

A new screen can be loaded with animation too using `lv_scr_load_anim(scr, transition_type, time, delay, auto_del)`. The following transition types exist:
- `LV_SCR_LOAD_ANIM_NONE`: switch immediately after `delay` milliseconds
- `LV_SCR_LOAD_ANIM_OVER_LEFT/RIGHT/TOP/BOTTOM` move the new screen over the current towards the given direction
- `LV_SCR_LOAD_ANIM_MOVE_LEFT/RIGHT/TOP/BOTTOM` move both the current and new screens towards the given direction
- `LV_SCR_LOAD_ANIM_FADE_ON` fade the new screen over the old screen

Setting `auto_del` to `true` will automatically delete the old screen when the animation is finished.

The new screen will become active (returned by `lv_scr_act()`) when the animations starts after `delay` time.

</p>
</details>

新屏幕也可以使用`lv_scr_load_anim(scr, transition_type, time, delay, auto_del)`加载动画。存在以下转换类型：
- `LV_SCR_LOAD_ANIM_NONE`：在 `delay` 毫秒后立即切换
- `LV_SCR_LOAD_ANIM_OVER_LEFT/RIGHT/TOP/BOTTOM` 将新屏幕移动到当前的指定方向
- `LV_SCR_LOAD_ANIM_MOVE_LEFT/RIGHT/TOP/BOTTOM` 将当前屏幕和新屏幕都向给定方向移动
- `LV_SCR_LOAD_ANIM_FADE_ON` 在旧屏幕上淡出新屏幕

将 `auto_del` 设置为 `true` 将在动画完成时自动删除旧屏幕。
当动画在 `delay` 时间后开始时，新屏幕将变为活动状态（由 `lv_scr_act()` 返回）。

### Handling multiple displays（处理多个显示器）

<details>
<summary>查看原文</summary>
<p>

Screens are created on the currently selected *default display*.
The *default display* is the last registered display with `lv_disp_drv_register` or you can explicitly select a new default display using `lv_disp_set_default(disp)`.

`lv_scr_act()`, `lv_scr_load()` and `lv_scr_load_anim()` operate on the default screen.

Visit [Multi-display support](/overview/display) to learn more.

</p>
</details>

屏幕是在当前选择的*默认显示*上创建的。
*default display* 是最后一个用`lv_disp_drv_register` 注册的显示，或者你可以使用`lv_disp_set_default(disp)` 明确地选择一个新的默认显示。

`lv_scr_act()`、`lv_scr_load()` 和 `lv_scr_load_anim()` 在默认屏幕上运行。

访问 [多显示器支持](/overview/display) 了解更多信息。

## Parts（部分）

<details>
<summary>查看原文</summary>
<p>

The widgets are built from multiple parts. For example a [Base object](/widgets/obj) uses the main and scrollbar parts but a [Slider](/widgets/core/slider) uses the main, the indicator and the knob parts. 
Parts are similar to *pseudo elements* in CSS.

The following predefined parts exist in LVGL:
- `LV_PART_MAIN` A background like rectangle*/``
- `LV_PART_SCROLLBAR`  The scrollbar(s)
- `LV_PART_INDICATOR` Indicator, e.g. for slider, bar, switch, or the tick box of the checkbox
- `LV_PART_KNOB` Like a handle to grab to adjust the value*/
- `LV_PART_SELECTED` Indicate the currently selected option or section
- `LV_PART_ITEMS` Used if the widget has multiple similar elements (e.g. tabel cells)*/
- `LV_PART_TICKS` Ticks on scales e.g. for a chart or meter
- `LV_PART_CURSOR` Mark a specific place e.g. text area's or chart's cursor
- `LV_PART_CUSTOM_FIRST` Custom parts can be added from here.

The main purpose of parts to allow styling the "components" of the widgets. 
Therefore the parts are described in more detail in the [Style overview](/overview/style) section.

</p>
</details>

小部件由多个部分构建而成。例如，[Base object](/widgets/obj) 使用主部件和滚动条部件，而 [Slider](/widgets/core/slider) 使用主部件、指示器和旋钮部件。
部分类似于 CSS 中的*伪元素*。

LVGL 中存在以下预定义部分：
- `LV_PART_MAIN` 类似矩形的背景*/``
- `LV_PART_SCROLLBAR` 滚动条
- `LV_PART_INDICATOR` 指标，例如用于滑块、条、开关或复选框的勾选框
- `LV_PART_KNOB` 像手柄一样可以抓取调整值*/
- `LV_PART_SELECTED` 表示当前选择的选项或部分
- `LV_PART_ITEMS` 如果小部件有多个相似的元素（例如表格单元格）*/
- `LV_PART_TICKS` 刻度上的刻度，例如对于图表或仪表
- `LV_PART_CURSOR` 标记一个特定的地方，例如文本区域或图表的光标
- `LV_PART_CUSTOM_FIRST` 可以从这里添加自定义部件。


部件的主要目的是允许为小部件的“组件”设置样式。
因此，在[样式概述](/overview/style) 部分更详细地描述了这些部分。

## States（状态）

<details>
<summary>查看原文</summary>
<p>

The object can be in a combination of the following states:
- `LV_STATE_DEFAULT` Normal, released state
- `LV_STATE_CHECKED` Toggled or checked state
- `LV_STATE_FOCUSED` Focused via keypad or encoder or clicked via touchpad/mouse 
- `LV_STATE_FOCUS_KEY` Focused via keypad or encoder but not via touchpad/mouse 
- `LV_STATE_EDITED` Edit by an encoder
- `LV_STATE_HOVERED` Hovered by mouse (not supported now)
- `LV_STATE_PRESSED` Being pressed
- `LV_STATE_SCROLLED` Being scrolled
- `LV_STATE_DISABLED` Disabled state
- `LV_STATE_USER_1` Custom state
- `LV_STATE_USER_2` Custom state
- `LV_STATE_USER_3` Custom state
- `LV_STATE_USER_4` Custom state

The states are usually automatically changed by the library as the user presses, releases, focuses etc an object. 
However, the states can be changed manually too. 
To set or clear given state (but leave the other states untouched) use `lv_obj_add/clear_state(obj, LV_STATE_...)`
In both cases ORed state values can be used as well. E.g. `lv_obj_add_state(obj, part, LV_STATE_PRESSED | LV_PRESSED_CHECKED)`.

To learn more about the states read the related section of the [Style overview](/overview/style).

</p>
</details>

对象可以处于以下状态的组合：
- `LV_STATE_DEFAULT` 正常，释放状态
- `LV_STATE_CHECKED` 切换或选中状态
- `LV_STATE_FOCUSED` 通过键盘或编码器聚焦或通过触摸板/鼠标点击
- `LV_STATE_FOCUS_KEY` 通过键盘或编码器聚焦，但不通过触摸板/鼠标聚焦
- `LV_STATE_EDITED` 由编码器编辑
- `LV_STATE_HOVERED` 鼠标悬停（现在不支持）
- `LV_STATE_PRESSED` 被按下
- `LV_STATE_SCROLLED` 正在滚动
- `LV_STATE_DISABLED` 禁用状态
- `LV_STATE_USER_1` 自定义状态
- `LV_STATE_USER_2` 自定义状态
- `LV_STATE_USER_3` 自定义状态
- `LV_STATE_USER_4` 自定义状态

当用户按下、释放、聚焦等对象时，库通常会自动更改状态。
但是，状态也可以手动更改。
要设置或清除给定状态（但保持其他状态不变），请使用 `lv_obj_add/clear_state(obj, LV_STATE_...)`
在这两种情况下，也可以使用 ORed 状态值。例如。 `lv_obj_add_state(obj, part, LV_STATE_PRESSED | LV_PRESSED_CHECKED)`。

要了解有关状态的更多信息，请阅读 [样式概述](/overview/style) 的相关部分。

## Snapshot（快照）

<details>
<summary>查看原文</summary>
<p>

A snapshot image could be generated for object together with its children. Check details in [Snapshot](/others/snapshot).

</p>
</details>

可以为对象及其子对象生成快照图像。在[快照](/others/snapshot)中查看详细信息。
