```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/overview/style.md
```
# Styles（风格样式）

<details>
<summary>查看原文</summary>
<p>

*Styles* are used to set the appearance of objects. Styles in lvgl are heavily inspired by CSS. The concept in a nutshell is as follows:

- A style is an `lv_style_t` variable which can hold properties like border width, text color and so on. It's similar to a `class` in CSS. 
- Styles can be assigned to objects to change their appearance. Upon assignment, the target part (*pseudo-element* in CSS) and target state (*pseudo class*) can be specified.For example one can add `style_blue` to the knob of a slider when it's in pressed state.
- The same style can be used by any number of objects.
- Styles can be cascaded which means multiple styles may be assigned to an object and each style can have different properties. Therefore, not all properties have to be specified in a style. LVGL will search for a property until a style defines it or use a default if it's not specified by any of the styles.For example `style_btn` can result in a default gray button and `style_btn_red` can add only a `background-color=red` to overwrite the background color.
- The most recently added style has higher precedence. This means if a property is specified in two styles the newest style in the object will be used.
- Some properties (e.g. text color) can be inherited from a parent(s) if it's not specified in an object. 
- Objects can also have local styles with higher precedence than "normal" styles.
- Unlike CSS (where pseudo-classes describe different states, e.g. `:focus`), in LVGL a property is assigned to a given state. 
- Transitions can be applied when the object changes state.

</p>
</details>

*Styles* 用于设置对象的外观。 lvgl 中的样式很大程度上受到 CSS 的启发。简而言之，其概念如下：

- 样式是一个 `lv_style_t` 变量，它可以保存边框宽度、文本颜色等属性。它类似于 CSS 中的“类”。
- 可以将样式分配给对象以更改其外观。在赋值过程中，可以指定目标部分（CSS 中的*pseudo element*）和目标状态（*pseudo class*）。例如，当滑块处于按下状态时，可以将“style_blue”添加到滑块的旋钮。
- 任何数量的对象都可以使用相同的样式。
- 样式可以级联，这意味着可以将多个样式分配给一个对象，并且每个样式可以具有不同的属性。因此，并非所有属性都必须在样式中指定。 LVLG 将寻找一个属性，直到一个样式定义它，或者如果它没有被任何样式指定，则使用默认值。例如，`style_btn` 可以导致默认的灰色按钮，而`style_btn_red` 只能添加一个`background-color=red` 来覆盖背景颜色。
- 后来添加的样式具有更高的优先级。这意味着如果在两种样式中指定了一个属性，则将使用稍后添加的样式。
- 如果对象中未指定某些属性（例如文本颜色），则可以从父级继承。
- 对象可以具有比“正常”样式具有更高优先级的本地样式。
- 与 CSS（伪类描述不同的状态，例如`:focus`）不同，在 LVGL 中，属性被分配给给定的状态。
- 当对象改变状态时可以应用转换。


## States（状态）

<details>
<summary>查看原文</summary>
<p>

The objects can be in the combination of the following states:
- `LV_STATE_DEFAULT` (0x0000) Normal, released state
- `LV_STATE_CHECKED` (0x0001) Toggled or checked state
- `LV_STATE_FOCUSED` (0x0002) Focused via keypad or encoder or clicked via touchpad/mouse 
- `LV_STATE_FOCUS_KEY` (0x0004) Focused via keypad or encoder but not via touchpad/mouse 
- `LV_STATE_EDITED` (0x0008) Edit by an encoder
- `LV_STATE_HOVERED` (0x0010) Hovered by mouse (not supported now)
- `LV_STATE_PRESSED` (0x0020) Being pressed
- `LV_STATE_SCROLLED` (0x0040) Being scrolled
- `LV_STATE_DISABLED` (0x0080) Disabled state
- `LV_STATE_USER_1` (0x1000) Custom state
- `LV_STATE_USER_2` (0x2000) Custom state
- `LV_STATE_USER_3` (0x4000) Custom state
- `LV_STATE_USER_4` (0x8000) Custom state
  
The combination states the object can be focused and pressed at the same time. This is represented as `LV_STATE_FOCUSED | LV_STATE_PRESSED`. 

The style can be added to any state and state combination. 
For example, setting a different background color for default and pressed state. 
If a property is not defined in a state the best matching state's property will be used. Typically this means the property with `LV_STATE_DEFAULT` is used.˛
If the property is not set even for the default state the default value will be used. (See later)

</p>
</details>

对象可以处于以下状态的组合：
- `LV_STATE_DEFAULT` (0x0000) 正常，释放状态
- `LV_STATE_CHECKED` (0x0001) 切换或检查状态
- `LV_STATE_FOCUSED` (0x0002) 通过键盘或编码器聚焦或通过触摸板/鼠标点击
- `LV_STATE_FOCUS_KEY` (0x0004) 通过键盘或编码器聚焦，但不通过触摸板/鼠标聚焦
- `LV_STATE_EDITED` (0x0008) 由编码器编辑
- `LV_STATE_HOVERED` (0x0010) 鼠标悬停（现在不支持）
- `LV_STATE_PRESSED` (0x0020) 被按下
- `LV_STATE_SCROLLED` (0x0040) 正在滚动
- `LV_STATE_DISABLED` (0x0080) 禁用状态
- `LV_STATE_USER_1` (0x1000) 自定义状态
- `LV_STATE_USER_2` (0x2000) 自定义状态
- `LV_STATE_USER_3` (0x4000) 自定义状态
- `LV_STATE_USER_4` (0x8000) 自定义状态

该组合表示可以同时聚焦和按下对象。这表示为`LV_STATE_FOCUSED | LV_STATE_PRESSED`。

样式可以添加到任何状态和状态组合。
例如，为默认和按下状态设置不同的背景颜色。
如果属性未在状态中定义，则将使用 **最佳匹配状态的属性** 。通常这意味着使用带有 `LV_STATE_DEFAULT` 的属性。
如果是默认状态但是没有设置他的属性，那么将会使用默认值。 （见后）


<details>
<summary>查看原文</summary>
<p>

But what does the "best matching state's property" really mean? 
States have a precedence which is shown by their value (see in the above list). A higher value means higher precedence.
To determine which state's property to use let's take an example. Imagine the background color is defined like this:
- `LV_STATE_DEFAULT`: white
- `LV_STATE_PRESSED`: gray
- `LV_STATE_FOCUSED`: red

1. By the default the object is in default state, so it's a simple case: the property is perfectly defined in the object's current state as white.
2. When the object is pressed there are 2 related properties: default with white (default is related to every state) and pressed with gray. 
The pressed state has 0x0020 precedence which is higher than the default state's 0x0000 precedence, so gray color will be used.
3. When the object is focused the same thing happens as in pressed state and red color will be used. (Focused state has higher precedence than default state).
4. When the object is focused and pressed both gray and red would work, but the pressed state has higher precedence than focused so gray color will be used.
5. It's possible to set e.g rose color for AA`LV_STATE_PRESSED | LV_STATE_FOCUSED`. 
In this case, this combined state has 0x0020 + 0x0002 = 0x0022 precedence, which is higher than the pressed state's precedence so rose color would be used.
6. When the object is in checked state there is no property to set the background color for this state. So for lack of a better option, the object remains white from the default state's property.

</p>
</details>

但是 **“最佳匹配状态的属性”** 到底是什么意思呢？
状态具有优先级，由它们的值显示（参见上面的列表）。更高的值意味着更高的优先级。
为了确定使用哪个状态的属性，让我们举个例子。想象一下，背景颜色是这样定义的：
- `LV_STATE_DEFAULT`：白色
- `LV_STATE_PRESSED`：灰色
- `LV_STATE_FOCUSED`：红色

1. 默认情况下，对象处于默认状态，所以这是一个简单的情况：属性在对象当前状态下完美定义为白色。
2. 当对象被按下时有2个相关属性：默认为白色（默认与每个状态相关）和按下为灰色。
按下状态的优先级为 0x0020，高于默认状态的 0x0000 优先级，因此将使用灰色。
3. 当物体聚焦时，发生与按下状态相同的事情，将使用红色。 （焦点状态比默认状态具有更高的优先级）。
4. 当物体聚焦并按下时，灰色和红色都可以工作，但按下状态的优先级高于聚焦状态，因此将使用灰色。
5. 可以为 `LV_STATE_PRESSED | LV_STATE_FOCUSED` 设置例如玫瑰色。 。
在这种情况下，此组合状态的优先级为 0x0020 + 0x0002 = 0x0022，高于按下状态的优先级，因此将使用玫瑰色。
6. 当对象处于选中状态时，没有设置此状态的背景颜色的属性。因此，由于缺乏更好的选择，对象从默认状态的属性中保持白色。



<details>
<summary>查看原文</summary>
<p>

Some practical notes:
- The precedence (value) of states is quite intuitive and it's something the user would expect naturally. E.g. if an object is focused the user will still want to see if it's pressed, therefore pressed state has a higher precedence. 
If the focused state had a higher precedence it would overwrite the pressed color.
- If you want to set a property for all states (e.g. red background color) just set it for the default state. If the object can't find a property for its current state it will fall back to the default state's property.
- Use ORed states to describe the properties for complex cases. (E.g. pressed + checked + focused)
- It might be a good idea to use different style elements for different states. 
For example, finding background colors for released, pressed, checked + pressed, focused, focused + pressed, focused + pressed + checked, etc states is quite difficult. 
Instead, for example, use the background color for pressed and checked states and indicate the focused state with a different border color. 

</p>
</details>

一些实用的注意事项：
- 状态的优先级（值）非常直观，这是用户自然期望的。例如。如果一个对象被聚焦，用户仍然希望查看它是否被按下，因此按下状态具有更高的优先级。
如果聚焦状态具有更高的优先级，它将覆盖按下的颜色。
- 如果您想为所有状态设置一个属性（例如红色背景色），只需将其设置为默认状态即可。如果对象找不到当前状态的属性，它将回退到默认状态的属性。
- 使用 ORed 状态来描述复杂情况的属性。 （例如按下 + 选中 + 聚焦）
- 为不同的状态使用不同的样式元素可能是个好主意。
例如，为released、pressed、checked+pressed、focused、focused+pressed、focused+pressed+checked等状态寻找背景颜色是相当困难的。
相反，例如，对按下和选中状态使用背景颜色，并使用不同的边框颜色指示聚焦状态。

## Cascading styles（层叠样式）

<details>
<summary>查看原文</summary>
<p>

It's not required to set all the properties in one style. It's possible to add more styles to an object and let the later added style to modify or extend appearance.
For example, create a general gray button style and create a new for red buttons where only the new background color is set. 

This is much like in CSS when used classes are listed like `<div class=".btn .btn-red">`.

Styles added later have precedence over ones set earlier. So in the gray/red button example above, the normal button style should be added first and the red style second. 
However, the precedence coming from states are still taken into account. 
So let's examine the following case:
- the basic button style defines dark-gray color for default state and light-gray color pressed state
- the red button style defines the background color as red only in the default state

In this case, when the button is released (it's in default state) it will be red because a perfect match is found in the most recently added style (red). 
When the button is pressed the light-gray color is a better match because it describes the current state perfectly, so the button will be light-gray. 

</p>
</details>

不需要在一种样式中设置所有属性。可以向对象添加更多样式，并让稍后添加的样式修改或扩展外观。
例如，创建一个通用的灰色按钮样式并创建一个新的红色按钮，其中只设置了新的背景颜色。

这与CSS中使用的类类似，如“<div class=“.btn.btn red”>”。

后来添加的样式优先于之前设置的样式。所以在上面的灰色/红色按钮示例中，应该首先添加普通按钮样式，然后添加红色样式。
然而，还要考虑 “最佳匹配状态的属性“ （优先级）。
因此，让我们来研究以下情况：

- 基本按钮样式定义了默认状态的深灰色和浅灰色按下状态
- 红色按钮样式仅在默认状态下将背景颜色定义为红色

在这种情况下，当按钮被释放（处于默认状态）时，它将是红色的，因为在最近添加的样式（红色）中找到了最佳匹配。
当按下按钮时，浅灰色更适合，因为它完美地描述了当前状态，所以按钮将是浅灰色（改变了最佳匹配状态的属性）。

## Inheritance（继承）

<details>
<summary>查看原文</summary>
<p>

Some properties (typically that are related to texts) can be inherited from the parent object's styles. 
Inheritance is applied only if the given property is not set in the object's styles (even in default state). 
In this case, if the property is inheritable, the property's value will be searched in the parents too until an object specifies a value for the property. The parents will use their own state to detemine the value. 
So if a button is pressed, and the text color comes from here, the pressed text color will be used.


</p>
</details>

某些属性（通常与文本相关）可以从父对象的样式继承。
仅当未在对象的样式中设置给定属性时（即使在默认状态下），才应用继承。
在这种情况下，如果该属性是可继承的，则该属性的值也将在父项中搜索，直到一个对象为该属性指定了一个值。父母将使用自己的状态来确定该值。
因此，如果按下按钮，并且文本颜色来自此处，则将使用按下的文本颜色。

## Parts

<details>
<summary>查看原文</summary>
<p>

Objects can have *parts* which can have their own styles. 

The following predefined parts exist in LVGL:
- `LV_PART_MAIN` A background like rectangle*/
- `LV_PART_SCROLLBAR`  The scrollbar(s)
- `LV_PART_INDICATOR` Indicator, e.g. for slider, bar, switch, or the tick box of the checkbox
- `LV_PART_KNOB` Like a handle to grab to adjust the value*/
- `LV_PART_SELECTED` Indicate the currently selected option or section
- `LV_PART_ITEMS` Used if the widget has multiple similar elements (e.g. table cells)*/
- `LV_PART_TICKS` Ticks on scales e.g. for a chart or meter
- `LV_PART_CURSOR` Mark a specific place e.g. text area's or chart's cursor
- `LV_PART_CUSTOM_FIRST` Custom parts can be added from here.


For example a [Slider](/widgets/core/slider) has three parts:
- Background
- Indiactor
- Knob

It means the all three parts of the slider can have their own styles. See later how to add style styles to objects and parts.

</p>
</details>

对象可以有 *部分(parts)* ，它们可以有自己的样式。

LVGL 中存在以下预定义部分：

- `LV_PART_MAIN` 类似矩形的背景*/
- `LV_PART_SCROLLBAR` 滚动条
- `LV_PART_INDICATOR` 指标，例如用于滑块、条、开关或复选框的勾选框
- `LV_PART_KNOB` 像手柄一样可以抓取调整值*/
- `LV_PART_SELECTED` 表示当前选择的选项或部分
- `LV_PART_ITEMS` 如果小部件具有多个相似元素（例如表格单元格）*/
- `LV_PART_TICKS` 刻度上的刻度，例如对于图表或仪表
- `LV_PART_CURSOR` 标记一个特定的地方，例如文本区域或图表的光标
- `LV_PART_CUSTOM_FIRST` 可以从这里添加自定义部件。

例如一个 [Slider](/widgets/core/slider) 包含三个部分：

- 背景
- 指标
- 旋钮


这意味着滑块的所有三个部分都可以有自己的样式。稍后请参阅如何向对象和部件添加样式样式。


## Initialize styles and set/get properties（初始化样式和设置/获取属性）

<details>
<summary>查看原文</summary>
<p>

Styles are stored in `lv_style_t` variables. Style variables should be `static`, global or dynamically allocated. 
In other words they can not be local variables in functions which are destroyed when the function exists. 
Before using a style it should be initialized with `lv_style_init(&my_style)`. 
After initializing the style properties can be set or added to it.

Property set functions looks like this: `lv_style_set_<property_name>(&style, <value>);` For example: 

</p>
</details>

样式存储在 `lv_style_t` 变量中。样式变量应该是 `静态` 、全局或动态分配的。
换句话说，它们不能是函数中的局部变量，当函数结束时它们会被销毁。
在使用样式之前，它应该用 `lv_style_init(&my_style)` 进行初始化。
初始化后，可以设置或添加样式属性。

属性集函数看起来像这样：`lv_style_set_<property_name>(&style, <value>);` 例如：


```c
static lv_style_t style_btn;
lv_style_init(&style_btn);
lv_style_set_bg_color(&style_btn, lv_color_grey());
lv_style_set_bg_opa(&style_btn, LV_OPA_50);
lv_style_set_border_width(&style_btn, 2);
lv_style_set_border_color(&style_btn, lv_color_black());

static lv_style_t style_btn_red;
lv_style_init(&style_btn_red);
lv_style_set_bg_color(&style_btn_red, lv_color_red());
lv_style_set_bg_opa(&style_btn_red, LV_OPA_COVER);
```

<details>
<summary>查看原文</summary>
<p>

To remove a property use:

</p>
</details>

要删除属性，请使用：

```c
lv_style_remove_prop(&style, LV_STYLE_BG_COLOR);
```

<details>
<summary>查看原文</summary>
<p>

To get a property's value from a style:

</p>
</details>

从样式中获取属性的值：


```c
lv_style_value_t v;
lv_res_t res = lv_style_rget_prop(&style, LV_STYLE_BG_COLOR, &v);
if(res == LV_RES_OK) {	/*Found*/
	do_something(v.color);
}
```

<details>
<summary>查看原文</summary>
<p>

`lv_style_value_t` has 3 fields:
- `num` for integer, boolean and opacity properties
- `color` for color properties
- `ptr` for pointer properties

To reset a style (free all its data) use 

</p>
</details>

`lv_style_value_t` 有 3 个字段：

- `num` 用于整数、布尔值和不透明度属性
- `color` 颜色属性
- `ptr` 指针属性

要重置样式（释放其所有数据），请使用

```c
lv_style_reset(&style);
```

## Add and remove styles to a widget（向部件添加和删除样式）

<details>
<summary>查看原文</summary>
<p>

A style on its own is not that useful, it needs to be assigned to an object to take effect.

</p>
</details>

一个样式本身并没有那么有用，它需要分配给一个对象才能生效。

### Add styles（添加样式）

<details>
<summary>查看原文</summary>
<p>

To add a style to an object use `lv_obj_add_style(obj, &style, <selector>)`. `<selector>` is an OR-ed value of parts and state to which the style should be added. Some examples:
- `LV_PART_MAIN | LV_STATE_DEFAULT`
- `LV_STATE_PRESSED`: The main part in pressed state. `LV_PART_MAIN` can be omitted
- `LV_PART_SCROLLBAR`: The scrollbar part in the default state. `LV_STATE_DEFAULT` can be omitted.
- `LV_PART_SCROLLBAR | LV_STATE_SCROLLED`: The scrollbar part when the object is being scrolled
- `0` Same as `LV_PART_MAIN | LV_STATE_DEFAULT`. 
- `LV_PART_INDICATOR | LV_STATE_PRESSED | LV_STATE_CHECKED` The indicator part when the object is pressed and checked at the same time.

Using `lv_obj_add_style`: 

</p>
</details>

要向对象添加样式，请使用 `lv_obj_add_style(obj, &style, <selector>)`。 `<selector>` 是应添加样式的部分和状态的 OR-ed 值，例如：

- `LV_PART_MAIN | LV_STATE_DEFAULT`
- `LV_STATE_PRESSED`：按下状态的主要部分。 `LV_PART_MAIN` 可以省略
- `LV_PART_SCROLLBAR`：默认状态下的滚动条部分。 `LV_STATE_DEFAULT` 可以省略。
- `LV_PART_SCROLLBAR | LV_STATE_SCROLLED`：对象滚动时的滚动条部分
- `0` 与 `LV_PART_MAIN | 相同LV_STATE_DEFAULT`。
- `LV_PART_INDICATOR | LV_STATE_PRESSED | LV_STATE_CHECKED` 同时按下和检查对象时的指示器部分。
- 
使用 `lv_obj_add_style` 的示例：

```c
lv_obj_add_style(btn, &style_btn, 0);      				  /*Default button style*/
lv_obj_add_style(btn, &btn_red, LV_STATE_PRESSED);  /*Overwrite only a some colors to red when pressed*/
```

### Remove styles（删除样式）

<details>
<summary>查看原文</summary>
<p>

To remove all styles from an object use `lv_obj_remove_style_all(obj)`.

To remove specific styles use `lv_obj_remove_style(obj, style, selector)`. This function will remove `style` only if the `selector` matches with the `selector` used in `lv_obj_add_style`. 
`style` can be `NULL` to check only the `selector` and remove all matching styles. The `selector` can use the `LV_STATE_ANY` and `LV_PART_ANY` values to remove the style with any state or part.

</p>
</details>

要从对象中删除所有样式，请使用 `lv_obj_remove_style_all(obj)`。

要删除特定样式，请使用 `lv_obj_remove_style(obj, style, selector)`。

仅当 `selector` 与 `lv_obj_add_style` 中使用的 `selector` 匹配时，此函数才会删除 `style`。

`style` 可以是 `NULL` 只检查 `selector` 并删除所有匹配的样式。 `selector` 可以使用 `LV_STATE_ANY` 和 `LV_PART_ANY` 值来删除具有任何状态或部分的样式。


</p>
</details>

### Report style changes（通知样式更改）

<details>
<summary>查看原文</summary>
<p>

If a style which is already assigned to object changes (i.e. a property is added or changed) the objects using that style should be notified. There are 3 options to do this:
1. If you know that the changed properties can be applied by a simple redraw (e.g. color or opacity changes) just call `lv_obj_invalidate(obj)` or `lv_obj_invalideate(lv_scr_act())`. 
2. If more complex style properties were changed or added, and you know which object(s) are affected by that style call `lv_obj_refresh_style(obj, part, property)`. 
To refresh all parts and properties use `lv_obj_refresh_style(obj, LV_PART_ANY, LV_STYLE_PROP_ANY)`.
3. To make LVGL check all objects to see whether they use the style and refresh them when needed call `lv_obj_report_style_change(&style)`. If `style` is `NULL` all objects will be notified about the style change.

</p>
</details>

如果已分配给对象的样式发生更改（即添加或更改属性），则应通知使用该样式的对象。有 3 个选项可以执行此操作：

1. 如果您知道更改的属性可以通过简单的重绘（例如颜色或不透明度更改）应用，只需调用 `lv_obj_invalidate(obj)` 或 `lv_obj_invalidate(lv_scr_act())`。
2. 如果更改或添加了更复杂的样式属性，并且您知道哪些对象受该样式影响，则调用 `lv_obj_refresh_style(obj, part, property)`。
要刷新所有部件和属性，请使用 `lv_obj_refresh_style(obj, LV_PART_ANY, LV_STYLE_PROP_ANY)`。
3. 要让 LVGL 检查所有对象是否使用该样式并在需要时刷新它们，请调用 `lv_obj_report_style_change(&style)`。如果 `style` 为 `NULL`，所有对象都会收到有关样式更改的通知。


### Get a property's value on an object（获取对象的属性值）

<details>
<summary>查看原文</summary>
<p>

To get a final value of property - considering cascading, inheritance, local styles and transitions (see below) - get functions like this can be used: 
`lv_obj_get_style_<property_name>(obj, <part>)`. 
These functions uses the object's current state and if no better candidate returns a default value.  
For example:

</p>
</details>

要获取属性的最终值（考虑级联、继承、本地样式和转换（请参见下文），可以使用如下的 get 函数：

`lv_obj_get_style_<property_name>(obj, <part>)`。

这些函数使用对象的当前状态，如果没有更好的候选对象，则返回默认值。 
例如：

```c
lv_color_t color = lv_obj_get_style_bg_color(btn, LV_PART_MAIN);
```

## Local styles（本地样式）

<details>
<summary>查看原文</summary>
<p>

Besides "normal" styles, the objects can store local styles too. This concept is similar to inline styles in CSS (e.g. `<div style="color:red">`) with some modification. 

So local styles are like normal styles but they can't be shared among other objects. If used, local styles are allocated automatically, and freed when the object is deleted.
They are useful to add local customization to the object.

Unlike in CSS, in LVGL local styles can be assigned to states (*pseudo-classes*) and parts (*pseudo-elements*).

To set a local property use functions like `lv_obj_set_style_local_<property_name>(obj, <value>, <selector>);`  
For example:

</p>
</details>

除了“普通” 样式外，对象还可以存储 **本地样式** 。这个概念类似于CSS中的内联样式（例如，`<div style=“color:red”>`），LVGL只是做了一些修改。

因此，本地样式与普通样式类似，但不能在其他对象之间共享。如果使用本地样式，将自动分配局部样式，并在删除对象时释放。本地样式对于向对象添加本地自定义很有用。

与CSS不同，在LVGL中，可以将局部样式指定给状态（*pseudo-classes(伪类)*）和部分（*pseudo-elements(伪元素)*）。

要设置本地属性，请使用类似 `lv_obj_set_style_local_<property_name>(obj, <value>, <selector>) 的函数

例如：

```c
lv_obj_set_style_local_bg_color(slider, lv_color_red(), LV_PART_INDICATOR | LV_STATE_FOCUSED);
```
## Properties（属性）

<details>
<summary>查看原文</summary>
<p>

For the full list of style properties click [here](/overview/style-props).

</p>
</details>

有关样式属性的完整列表，请单击 [此处](/overview/style-props) 查看。

### Typical background properties（典型的背景属性）

<details>
<summary>查看原文</summary>
<p>

In the documentation of the widgets you will see sentences like "The widget use the typical background properties". The "typical background properties" are the ones related to:
- Background
- Border
- Outline
- Shadow
- Padding
- Width and height transformation
- X and Y translation


</p>
</details>

在小部件的文档中，您将看到“小部件使用典型的背景属性”这样的句子。“典型背景属性”与以下相关：

- 背景(Background)
- 边界(Border)
- 轮廓(Outline)
- 阴影(Shadow)
- 填充(Padding)
- 宽度和高度变换
- X和Y变换


## Transitions（过渡特效）

<details>
<summary>查看原文</summary>
<p>

By default, when an object changes state (e.g. it's pressed) the new properties from the new state are set immediately. However, with transitions it's possible to play an animation on state change.
For example, on pressing a button its background color can be animated to the pressed color over 300 ms.

The parameters of the transitions are stored in the styles. It's possible to set 
- the time of the transition
- the delay before starting the transition 
- the animation path (also known as timing or easing function)
- the properties to animate 

The transition properties can be defined for each state. For example, setting 500 ms transition time in default state will mean that when the object goes to the default state a 500 ms transition time will be applied. 
Setting 100 ms transition time in the pressed state will mean a 100 ms transition time when going to pressed state.
So this example configuration will result in going to pressed state quickly and then going back to default slowly. 

To describe a transition an `lv_transition_dsc_t` variable needs to initialized and added to a style:

</p>
</details>

默认情况下，当一个对象改变状态（例如它被按下）时，新状态的新属性会立即设置。但是，通过转换，可以在状态更改时播放动画。
例如，按下按钮时，其背景颜色可以在 300 毫秒内动画显示为按下的颜色。

过渡的参数存储在样式中。可以设置
- 过渡时期
- 开始过渡前的延迟
- 动画路径（也称为计时或缓动功能）
- 动画的属性

可以为每个状态定义转换属性。例如，在默认状态下设置 500 ms 转换时间意味着当对象进入默认状态时，将应用 500 ms 转换时间。
在按下状态设置 100 ms 转换时间将意味着在进入按下状态时有 100 ms 转换时间。
因此，此示例配置将导致快速进入按下状态，然后缓慢返回默认状态。

要描述转换，需要初始化 `lv_transition_dsc_t` 变量并将其添加到样式中：

```c
/*Only its pointer is saved so must static, global or dynamically allocated */
static const lv_style_prop_t trans_props[] = {
											LV_STYLE_BG_OPA, LV_STYLE_BG_COLOR,
											0, /*End marker*/
};

static lv_style_transition_dsc_t trans1;
lv_style_transition_dsc_init(&trans1, trans_props, lv_anim_path_ease_out, duration_ms, delay_ms);

lv_style_set_transition(&style1, &trans1);
```

## Color filter（色彩过滤）
TODO


## Themes（主题）

<details>
<summary>查看原文</summary>
<p>

Themes are a collection of styles. If there is an active theme LVGL applies it on every created widget.
This will give a default appearance to the UI which can then be modified by adding further styles.

Every display can have a different theme. For example you could have a colorful theme on a TFT and monochrome theme on a secondary monochrome display.

To set a theme for a display, 2 steps are required:
1. Initialize a theme
2. Assign the initialized theme to a display.

Theme initialization functions can have different prototype. This example shows how to set the "default" theme:

</p>
</details>

主题是风格的集合。如果存在活动主题，LVGL将其应用于每个创建的部件(对象)。
这将为UI提供一个默认外观，然后可以通过添加更多样式对其进行修改。

每个显示器都可以有不同的主题。例如，您可以在 TFT 上使用彩色主题，在辅助单色显示器上使用单色主题。

要为显示设置主题，需要 2 个步骤：
1. 初始化一个主题
2. 将初始化的主题分配给显示器。

主题初始化函数可以有不同的原型。此示例显示如何设置“默认”主题：

```c
lv_theme_t * th = lv_theme_default_init(display,  /*Use the DPI, size, etc from this display*/ 
                                        LV_COLOR_PALETTE_BLUE, LV_COLOR_PALETTE_CYAN,   /*Primary and secondary palette*/
                                        false,    /*Light or dark mode*/ 
                                        &lv_font_montserrat_10, &lv_font_montserrat_14, &lv_font_montserrat_18); /*Small, normal, large fonts*/
                                        
lv_disp_set_theme(display, th); /*Assign the theme to the display*/
```

<details>
<summary>查看原文</summary>
<p>

The themes can be enabled in `lv_conf.h`. If the default theme is enabled by `LV_USE_THEME_DEFAULT 1` LVGL automatically initializes and sets it when a display is created. 

</p>
</details>

可以在 `lv_conf.h` 中启用主题。如果默认主题由 `LV_USE_THEME_DEFAULT 1` 启用，LVGL 会在创建显示时自动初始化并设置它。

### Extending themes（扩展主题）

<details>
<summary>查看原文</summary>
<p>

Built-in themes can be extended. 
If a custom theme is created a parent theme can be selected. The parent theme's styles will be added before the custom theme's styles. 
Any number of themes can be chained this way. E.g. default theme -> custom theme -> dark theme.

`lv_theme_set_parent(new_theme, base_theme)` extends the `base_theme` with the `new_theme`.

There is an example for it below.

</p>
</details>

内置主题可以扩展。
如果创建了自定义主题，则可以选择父主题。父主题的样式将添加在自定义主题的样式之前。
可以通过这种方式链接任意数量的主题。例如。默认主题 -> 自定义主题 -> 深色主题。

`lv_theme_set_parent(new_theme, base_theme)` 使用 `new_theme` 扩展了 `base_theme`。

下面的是示例：

## Examples

```eval_rst

.. include:: ../../examples/styles/index.rst

```

## API
```eval_rst

.. doxygenfile:: lv_style.h
  :project: lvgl

.. doxygenfile:: lv_theme.h
  :project: lvgl

.. doxygenfile:: lv_obj_style_gen.h
  :project: lvgl
  
.. doxygenfile:: lv_style_gen.h
  :project: lvgl
  

```
