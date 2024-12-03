.. _styles:

========================
Style Details（风格样式）
========================

.. raw:: html

   <details>
     <summary>显示原文</summary>

Styles are used to set the appearance of Widgets.  Styles in lvgl are
heavily inspired by CSS. The concept in a nutshell is that a
style is an :cpp:type:`lv_style_t` variable which can hold properties like
border width, font, text color and so on. It's similar to a ``class`` in CSS.

- Styles can be assigned to Widgets to change their appearance. Upon
  assignment, the target part (pseudo-element_ in CSS) and target state
  (pseudo-class_ in CSS) can be specified. For example one can add
  ``style_blue`` to the knob of a slider when it's in pressed state.
- The same style can be used by any number of Widgets.
- Styles can be cascaded which means multiple styles may be assigned to a Widget and
  each style can have different properties. Therefore, not all properties
  have to be specified in a style. LVGL will search for a property until a
  style defines it or use a default value if it's not specified by any of the
  styles. For example ``style_btn`` can result in a default gray button
  and ``style_btn_red`` can add only a ``background-color=red`` to
  overwrite the background color.
- The most recently added style has higher precedence. This means if a property
  is specified in two styles the newest style in the Widget will be used.
- Some properties (e.g. text color) can be inherited from a parent(s) if it's not specified in a Widget.
- Widgets can also have local styles with higher precedence than "normal" styles.
- Unlike CSS (where pseudo-classes_ describe different states, e.g. ``:focus``),
  in LVGL a property is assigned to a given state.
- Transitions can be applied when the Widget changes state.

.. raw:: html

   </details>
   <br>


"Styles" 用于设置对象的外观。lvgl中的样式在很大程度上受到CSS的启发。简而言之，其概念如下：

- 样式是一个 :cpp:type:`lv_style_t` 类型的变量，它可以保存诸如边框宽度、文字颜色等属性。类似于CSS中的 ``class``。

- 样式可以分配给对象以改变它们的外观。在分配时，可以指定目标部分（CSS中的伪元素）和目标状态（伪类）。例如，当滑块处于按下状态时，可以将 ``style_blue``样式添加到滑块的旋钮上。

- 同样的样式可以被任意数量的对象使用。

- 样式可以进行层叠，这意味着可以将多个样式分配给一个对象，每个样式可以具有不同的属性。因此，并非所有的属性都必须在一个样式中指定。
  LVGL将在样式中搜索属性，直到找到定义该属性的样式，或者如果没有任何样式指定，则使用默认值。
  例如， ``style_btn`` 可以生成默认的灰色按钮，而 ``style_btn_red`` 可以仅添加 ``background-color=red`` 覆盖背景颜色。

- 最近添加的样式具有更高的优先级。这意味着，如果一个属性在两个样式中都指定了，对象中最新的样式将被使用。

- 一些属性（例如文本颜色）如果在对象中未指定，则可以从父对象继承。

- 对象也可以具有局部样式，其优先级高于 “普通” 样式。

- 与CSS不同（在CSS中，伪类描述不同的状态，例如 ``:focus`` ），在LVGL中，属性分配给了给定的状态。

- 当对象更改状态时，可以应用过渡效果。


.. _styles_states:

States（状态）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Widgets can be in the combination of the following states:

- :cpp:enumerator:`LV_STATE_DEFAULT`: (0x0000) Normal, released state
- :cpp:enumerator:`LV_STATE_CHECKED`: (0x0001) Toggled or checked state
- :cpp:enumerator:`LV_STATE_FOCUSED`: (0x0002) Focused via keypad or encoder or clicked via touchpad/mouse
- :cpp:enumerator:`LV_STATE_FOCUS_KEY`: (0x0004) Focused via keypad or encoder but not via touchpad/mouse
- :cpp:enumerator:`LV_STATE_EDITED`: (0x0008) Edit by an encoder
- :cpp:enumerator:`LV_STATE_HOVERED`: (0x0010) Hovered by mouse
- :cpp:enumerator:`LV_STATE_PRESSED`: (0x0020) Being pressed
- :cpp:enumerator:`LV_STATE_SCROLLED`: (0x0040) Being scrolled
- :cpp:enumerator:`LV_STATE_DISABLED`: (0x0080) Disabled state
- :cpp:enumerator:`LV_STATE_USER_1`: (0x1000) Custom state
- :cpp:enumerator:`LV_STATE_USER_2`: (0x2000) Custom state
- :cpp:enumerator:`LV_STATE_USER_3`: (0x4000) Custom state
- :cpp:enumerator:`LV_STATE_USER_4`: (0x8000) Custom state

A Widget can be in a combination of states such as being focused and
pressed at the same time. This is represented as :cpp:expr:`LV_STATE_FOCUSED | LV_STATE_PRESSED`.

A style can be added to any state or state combination. For example,
setting a different background color for the default and pressed states.
If a property is not defined in a state the best matching state's
property will be used. Typically this means the property with
:cpp:enumerator:`LV_STATE_DEFAULT` is used.˛ If the property is not set even for the
default state the default value will be used. (See later)

What does the "best matching state's property" mean?
----------------------------------------------------
States have a precedence which is shown by their value (see in the above list).
A higher value means higher precedence. To determine which state's
property to use let's take an example. Imagine the background color is
defined like this:

- :cpp:enumerator:`LV_STATE_DEFAULT`: white
- :cpp:enumerator:`LV_STATE_PRESSED`: gray
- :cpp:enumerator:`LV_STATE_FOCUSED`: red

1. Initially the Widget is in the default state, so it's a simple case:
   the property is perfectly defined in the Widget's current state as
   white.
2. When the Widget is pressed there are 2 related properties: default
   with white (default is related to every state) and pressed with gray.
   The pressed state has 0x0020 precedence which is higher than the
   default state's 0x0000 precedence, so gray color will be used.
3. When the Widget has focus the same thing happens as in pressed state
   and red color will be used. (Focused state has higher precedence than
   default state).
4. When the Widget has focus and pressed both gray and red would work,
   but the pressed state has higher precedence than focused so gray
   color will be used.
5. It's possible to set e.g. rose color for :cpp:expr:`LV_STATE_PRESSED | LV_STATE_FOCUSED`.
   In this case, this combined state has 0x0020 + 0x0002 = 0x0022 precedence, which is higher than
   the pressed state's precedence so rose color would be used.
6. When the Widget is in the checked state there is no property to set
   the background color for this state. So for lack of a better option,
   the Widget remains white from the default state's property.

Some practical notes:

- The precedence (value) of states is quite intuitive, and it's something the
  user would expect naturally. Example:  if a Widget has focus the user will still
  want to see if it's pressed, therefore the pressed state has a higher
  precedence. If the focused state had a higher precedence it would overwrite
  the pressed color.
- If you want to set a property for all states (e.g. red background color)
  just set it for the default state. If the Widget can't find a property
  for its current state it will fall back to the default state's property.
- Use ORed states to describe the properties for complex cases (e.g.
  pressed + checked + focused).
- It might be a good idea to use different
  style elements for different states. For example, finding background
  colors for released, pressed, checked + pressed, focused, focused +
  pressed, focused + pressed + checked, etc. states is quite difficult.
  Instead, for example, use the background color for pressed and checked
  states and indicate the focused state with a different border color.

.. raw:: html

   </details>
   <br>


对象可以处于以下状态的组合中：

- :cpp:enumerator:`LV_STATE_DEFAULT`：(0x0000) 正常、释放的状态
- :cpp:enumerator:`LV_STATE_CHECKED`：(0x0001) 切换或选中的状态
- :cpp:enumerator:`LV_STATE_FOCUSED`：(0x0002) 通过键盘或编码器聚焦，或通过触摸板/鼠标点击
- :cpp:enumerator:`LV_STATE_FOCUS_KEY`：(0x0004) 仅通过键盘或编码器聚焦，而非通过触摸板/鼠标
- :cpp:enumerator:`LV_STATE_EDITED`：(0x0008) 由编码器编辑
- :cpp:enumerator:`LV_STATE_HOVERED`：(0x0010) 鼠标悬停
- :cpp:enumerator:`LV_STATE_PRESSED`：(0x0020) 被按下的状态
- :cpp:enumerator:`LV_STATE_SCROLLED`：(0x0040) 正在滚动的状态
- :cpp:enumerator:`LV_STATE_DISABLED`：(0x0080) 禁用的状态
- :cpp:enumerator:`LV_STATE_USER_1`：(0x1000) 自定义状态
- :cpp:enumerator:`LV_STATE_USER_2`：(0x2000) 自定义状态
- :cpp:enumerator:`LV_STATE_USER_3`：(0x4000) 自定义状态
- :cpp:enumerator:`LV_STATE_USER_4`：(0x8000) 自定义状态

对象可以处于多个状态的组合中，例如同时处于聚焦和按下状态。这被表示为 :cpp:expr:`LV_STATE_FOCUSED | LV_STATE_PRESSED`。

样式可以应用于任何状态或状态组合。例如，为默认和按下状态设置不同的背景颜色。
如果某个状态中未定义属性，则会使用与之最匹配的状态的属性。通常情况下，这意味着将使用带有 :cpp:enumerator:`LV_STATE_DEFAULT` 的属性。
如果即使对于默认状态，某个属性也未设置，则将使用默认值。（稍后会详细说明）

但是，“与之最匹配的状态的属性”到底是什么意思呢？状态有一个优先级，由它们的值表示（请参见上面的列表）。值越高，优先级越高。
为了确定使用哪个状态的属性，我们来看一个例子。假设背景颜色定义如下：

- :cpp:enumerator:`LV_STATE_DEFAULT`：白色
- :cpp:enumerator:`LV_STATE_PRESSED`：灰色
- :cpp:enumerator:`LV_STATE_FOCUSED`：红色

1. 初始情况下，对象处于默认状态，所以情况很简单：属性在对象当前状态中完全定义为白色。
2. 当对象被按下时，有两个相关属性：白色的默认属性（默认与每个状态相关）和灰色的按下属性。按下状态的优先级为0x0020，高于默认状态的优先级0x0000，因此会使用灰色。
3. 当对象处于聚焦状态时，与按下状态发生的情况相同，将使用红色。（聚焦状态的优先级高于默认状态）
4. 当对象处于聚焦和按下状态时，灰色和红色都可以。但是按下状态的优先级高于聚焦状态，因此会使用灰色。
5. 可以为 :cpp:expr:`LV_STATE_PRESSED | LV_STATE_FOCUSED` 设置玫瑰色，此组合状态的优先级为0x0020 + 0x0002 = 0x0022，高于按下状态的优先级，因此将使用玫瑰色。
6. 当对象处于选中状态时，没有属性来设置此状态的背景颜色。由于缺乏更好的选择，对象仍然保持默认状态的白色属性。

一些实用的注意事项：

- 状态的优先级（值）非常直观，这是用户自然期望的结果。例如，如果对象处于聚焦状态，用户仍然希望看到它是否被按下，因此按下状态具有更高的优先级。如果聚焦状态具有更高的优先级，它将覆盖按下的颜色。
- 如果要为所有状态（例如红色背景颜色）设置属性，只需为默认状态设置即可。如果对象在其当前状态下找不到属性，它将退回到默认状态的属性。
- 使用 OR 运算符来描述复杂情况下的属性（例如，按下 + 选中 + 聚焦）。
- 对于不同的状态，使用不同的样式元素可能是个好主意。例如，为释放、按下、选中 + 按下、聚焦、聚焦 + 按下、聚焦 + 按下 + 选中等状态找到背景颜色是相当困难的。相反，例如，使用按下和选中状态的背景颜色，并使用不同的边框颜色指示聚焦状态。


.. _styles_cascading:

Cascading styles（层叠样式）
****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

It's not required to set all the properties in one style. It's possible
to add more styles to a Widget and have the latter added style modify
or extend appearance. For example, create a general gray button style
and create a new one for red buttons where only the new background color
is set.

This is much like in CSS when used classes are listed like
``<div class=".btn .btn-red">``.

Styles added later have precedence over ones set earlier. So in the
gray/red button example above, the normal button style should be added
first and the red style second. However, the precedence of the states
are still taken into account. So let's examine the following case:

- the basic button style defines dark-gray color for the default state and
  light-gray color for the pressed state
- the red button style defines the background color as red only in the default state

In this case, when the button is released (it's in default state) it
will be red because a perfect match is found in the most recently added
style (red). When the button is pressed the light-gray color is a better
match because it describes the current state perfectly, so the button
will be light-gray.

.. raw:: html

   </details>
   <br>


在一个样式中并不需要设置所有的属性。可以给一个对象添加更多的样式，并且后添加的样式可以修改或扩展外观。例如，创建一个通用的灰色按钮样式，然后为红色按钮创建一个新样式，在新样式中只设置新的背景颜色。

这就像在CSS中使用类列表一样，比如 ``<div class=".btn .btn-red">``。

后添加的样式具有优先权，优先于先前设置的样式。因此，在上述灰色/红色按钮的例子中，应该先添加普通按钮样式，然后再添加红色样式。但是，状态的优先级仍然会被考虑。因此，让我们来看一个例子：

- 基本按钮样式为默认状态设置了暗灰色的颜色，为按下状态设置了浅灰色的颜色
- 红色按钮样式只在默认状态下将背景颜色设置为红色

在这种情况下，当按钮释放（处于默认状态）时，它将是红色的，因为最近添加的样式（红色样式）完全匹配。当按钮被按下时，浅灰色的颜色更匹配，因为它完美描述了当前的状态，所以按钮会是浅灰色的。


.. _styles_inheritance:

Inheritance（继承）
*******************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Some properties (typically those related to text) can be inherited from
the parent Widget's styles. Inheritance is applied only if the given
property is not set in the Widget's styles (even in default state). In
this case, if the property is inheritable, the property's value will be
searched up the parent hierarchy until a Widget specifies a value for the
property. The parents will use their own state to determine the value.
So if a button is pressed, and the text color comes from a parent, the
pressed text color will be used.

.. raw:: html

   </details>
   <br>


一些属性（通常与文本相关的属性）可以从父对象的样式中继承。
只有在对象的样式中没有设置给定属性时（即使是默认状态下也是如此），继承才会应用。
在这种情况下，如果属性是可继承的，属性值将在父对象中搜索，直到某个对象为属性指定一个值。
父对象将使用自己的状态来确定值。因此，如果按钮被按下，并且文本颜色来自于这里，那么按下时文本颜色将会被使用。


.. _styles_parts:

Parts（部分）
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Widgets can be composed of *parts* which may each have their own styles.

The following predefined parts exist in LVGL:

- :cpp:enumerator:`LV_PART_MAIN`: A background like rectangle
- :cpp:enumerator:`LV_PART_SCROLLBAR`: The scrollbar(s)
- :cpp:enumerator:`LV_PART_INDICATOR`: Indicator, e.g. for slider, bar, switch, or the tick box of the checkbox
- :cpp:enumerator:`LV_PART_KNOB`: Like a handle to grab to adjust a value
- :cpp:enumerator:`LV_PART_SELECTED`: Indicate the currently selected option or section
- :cpp:enumerator:`LV_PART_ITEMS`: Used if the widget has multiple similar elements (e.g. table cells)
- :cpp:enumerator:`LV_PART_CURSOR`: Mark a specific place e.g. Text Area's or chart's cursor
- :cpp:enumerator:`LV_PART_CUSTOM_FIRST`: Custom part identifiers can be added starting from here.

For example a :ref:`Slider <lv_slider>` has three parts:

- Main (background)
- Indicator
- Knob

This means all three parts of the slider can have their own styles. See
later how to add styles to Widgets and parts.

.. raw:: html

   </details>
   <br>


物体可以由具有自己样式的“部分”组成。

在LVGL中，存在以下预定义部分：

- :cpp:enumerator:`LV_PART_MAIN`：像矩形一样的背景
- :cpp:enumerator:`LV_PART_SCROLLBAR`：滚动条（们）
- :cpp:enumerator:`LV_PART_INDICATOR`：指示器，例如用于滑块、条形图、开关或复选框的勾选框
- :cpp:enumerator:`LV_PART_KNOB`：像把手一样用来调节值
- :cpp:enumerator:`LV_PART_SELECTED`：表示当前选择的选项或部分
- :cpp:enumerator:`LV_PART_ITEMS`：如果控件具有多个类似元素（例如表格单元格）时使用
- :cpp:enumerator:`LV_PART_CURSOR`：标记特定位置，例如文本区域或图表的光标
- :cpp:enumerator:`LV_PART_CUSTOM_FIRST`：可以从这里开始添加自定义部分标识符。

例如，一个 :ref:`滑动条 <lv_slider>` 具有三个部分：

- 背景
- 指示器
- 把手

这意味着滑动条的这三个部分都可以有自己的样式。稍后我们将看到如何向对象和部分添加样式。


.. _styles_initialize:

Initialize styles and set/get properties（初始化样式和设置/获取属性）
******************************************************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Styles are stored in :cpp:type:`lv_style_t` variables. Style variables should be
``static``, global or dynamically allocated. In other words they cannot
be local variables in functions which are destroyed when the function
exits. Before using a style it should be initialized with
:cpp:expr:`lv_style_init(&my_style)`. After initializing a style, properties can
be added or changed.

Property set functions looks like this:
``lv_style_set_<property_name>(&style, <value>);`` For example:

.. code-block:: c

   static lv_style_t style_btn;
   lv_style_init(&style_btn);
   lv_style_set_bg_color(&style_btn, lv_color_hex(0x115588));
   lv_style_set_bg_opa(&style_btn, LV_OPA_50);
   lv_style_set_border_width(&style_btn, 2);
   lv_style_set_border_color(&style_btn, lv_color_black());

   static lv_style_t style_btn_red;
   lv_style_init(&style_btn_red);
   lv_style_set_bg_color(&style_btn_red, lv_palette_main(LV_PALETTE_RED));
   lv_style_set_bg_opa(&style_btn_red, LV_OPA_COVER);

To remove a property use:

.. code-block:: c

   lv_style_remove_prop(&style, LV_STYLE_BG_COLOR);

To get a property's value from a style:

.. code-block:: c

   lv_style_value_t v;
   lv_result_t res = lv_style_get_prop(&style, LV_STYLE_BG_COLOR, &v);
   if(res == LV_RESULT_OK) {  /* Found */
       do_something(v.color);
   }

:cpp:union:`lv_style_value_t` has 3 fields, only one of which will apply, depending
on the type of property it is applied to:

- :cpp:member:`num`: for integer, boolean and opacity properties
- :cpp:member:`color`: for color properties
- :cpp:member:`ptr`: for pointer properties

To reset a style (free all its data) use:

.. code-block:: c

   lv_style_reset(&style);

Styles can be built as ``const`` as well to save RAM:

.. code-block:: c

   const lv_style_const_prop_t style1_props[] = {
      LV_STYLE_CONST_WIDTH(50),
      LV_STYLE_CONST_HEIGHT(50),
      LV_STYLE_CONST_PROPS_END
   };

   LV_STYLE_CONST_INIT(style1, style1_props);

Later ``const`` style can be used like any other style but (obviously)
new properties cannot be added.

.. raw:: html

   </details>
   <br>


样式存储在 `lv_style_t` 类型的变量中。样式变量应该是静态的、全局的或者动态分配的。
换句话说，它们不能是函数内部的局部变量，在函数结束时会被销毁。
在使用样式之前，应该使用 `lv_style_init(&my_style)` 进行初始化。样式初始化后，可以添加或更改属性。

属性设置函数的格式如下：
`lv_style_set_<property_name>(&style, <value>)`。例如：

.. code:: c

   static lv_style_t style_btn;
   lv_style_init(&style_btn);
   lv_style_set_bg_color(&style_btn, lv_color_hex(0x115588));
   lv_style_set_bg_opa(&style_btn, LV_OPA_50);
   lv_style_set_border_width(&style_btn, 2);
   lv_style_set_border_color(&style_btn, lv_color_black());

   static lv_style_t style_btn_red;
   lv_style_init(&style_btn_red);
   lv_style_set_bg_color(&style_btn_red, lv_palette_main (LV_PALETTE_RED));
   lv_style_set_bg_opa(&style_btn_red, LV_OPA_COVER);

要删除一个属性，可以使用：

.. code:: c

   lv_style_remove_prop(&style, LV_STYLE_BG_COLOR);

从样式中获取属性的值：

.. code:: c

   lv_style_value_t v;
   lv_res_t res = lv_style_get_prop(&style, LV_STYLE_BG_COLOR, &v);
   if(res == LV_RES_OK) {  /*找到了*/
       do_something(v.color);
   }

`lv_style_value_t` 包含 3 个字段：

- `num`：用于整数、布尔值和不透明度属性
- `color`：用于颜色属性
- `ptr`：用于指针属性

要重置一个样式（释放其所有数据），可以使用：

.. code:: c

   lv_style_reset(&style);

样式也可以定义为 `const`，以节省 RAM：

.. code:: c

   const lv_style_const_prop_t style1_props[] = {
      LV_STYLE_CONST_WIDTH(50),
      LV_STYLE_CONST_HEIGHT(50),
      LV_STYLE_CONST_PROPS_END
   };

   LV_STYLE_CONST_INIT(style1, style1_props);

以后可以像其他样式一样使用 `const` 样式，但显然不能添加新属性。


.. _styles_add_remove:

Add and remove styles to a widget（向控件添加和删除样式）
********************************************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

A style on its own has no effect until it is added (assigned) to a Widget.


.. raw:: html

   </details>
   <br>


一个单独的样式并不是特别有用，必须将其分配给一个对象才能生效。


Add styles（添加样式）
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To add a style to a Widget use
``lv_obj_add_style(widget, &style, <selector>)``. ``<selector>`` is an
OR-ed value of parts and state to which the style should be added. Some
examples:

- :cpp:expr:`LV_PART_MAIN | LV_STATE_DEFAULT`
- :cpp:enumerator:`LV_STATE_PRESSED`: The main part in pressed state. :cpp:enumerator:`LV_PART_MAIN` can be omitted
- :cpp:enumerator:`LV_PART_SCROLLBAR`: The scrollbar part in the default state. :cpp:enumerator:`LV_STATE_DEFAULT` can be omitted.
- :cpp:expr:`LV_PART_SCROLLBAR | LV_STATE_SCROLLED`: The scrollbar part when the Widget is being scrolled
- :cpp:expr:`LV_PART_INDICATOR | LV_STATE_PRESSED | LV_STATE_CHECKED` The indicator part when the Widget is pressed and checked at the same time.

Using :cpp:func:`lv_obj_add_style`:

.. code-block:: c

   lv_obj_add_style(btn, &style_btn, 0);                     /* Default button style */
   lv_obj_add_style(btn, &btn_red, LV_STATE_PRESSED);       /*Overwrite only some colors to red when pressed*/

.. raw:: html

   </details>
   <br>


为了给对象添加样式，请使用 ``lv_obj_add_style(obj, &style, <selector>)``。 ``<selector>`` 是一个按位或运算的值，用于指定要添加样式的部分和状态。下面是一些示例：

- :cpp:expr:`LV_PART_MAIN | LV_STATE_DEFAULT`
- :cpp:enumerator:`LV_STATE_PRESSED` ：按下状态下的主要部分。可以省略 :cpp:enumerator:`LV_PART_MAIN`。
- :cpp:enumerator:`LV_PART_SCROLLBAR` ：默认状态下的滚动条部分。可以省略 :cpp:enumerator:`LV_STATE_DEFAULT`。
- :cpp:expr:`LV_PART_SCROLLBAR | LV_STATE_SCROLLED`：当对象被滚动时的滚动条部分。
- :cpp:expr:`LV_PART_INDICATOR | LV_STATE_PRESSED | LV_STATE_CHECKED`：对象被按下和选中时的指示器部分。

使用 :cpp:func:`lv_obj_add_style`：

.. code:: c

   lv_obj_add_style(btn, &style_btn, 0);                     /*默认按钮样式*/
   lv_obj_add_style(btn, &btn_red, LV_STATE_PRESSED);        /*仅在按下时将部分颜色更改为红色*/


Replace styles（替换样式）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To replace a specific style of a Widget use
:cpp:expr:`lv_obj_replace_style(widget, old_style, new_style, selector)`. This
function will only replace ``old_style`` with ``new_style`` if the
``selector`` matches the ``selector`` used in ``lv_obj_add_style``. Both
``old_style`` and ``new_style`` must not be ``NULL``.  Separate functions exist for
adding and removing styles.  If the combination of
``old_style`` and ``selector`` exists multiple times in ``obj``\ 's
styles, all occurrences will be replaced. The return value of the
function indicates whether at least one successful replacement took
place.

Using :cpp:func:`lv_obj_replace_style`:

.. code-block:: c

   lv_obj_add_style(btn, &style_btn, 0);                      /* Add a button style */
   lv_obj_replace_style(btn, &style_btn, &new_style_btn, 0);  /* Replace the button style with a different one */

.. raw:: html

   </details>
   <br>


使用下列语句来替换对象的特定样式：:cpp:expr:`lv_obj_replace_style(obj, old_style, new_style, selector)`。
此函数仅在 ``selector`` 匹配 ``lv_obj_add_style`` 中使用的 ``selector`` 时，才会将 ``old_style`` 替换为 ``new_style``。
两种样式，即 ``old_style`` 和 ``new_style`` 都不能为 ``NULL`` （添加和删除分别存在不同的函数）。 如果 ``obj`` 的样式中存在多个 ``old_style`` 和 ``selector`` 的组合，所有出现的情况都将被替换。函数的返回值指示是否至少进行了一次成功替换。

使用 :cpp:func:`lv_obj_replace_style`：

.. code:: c

   lv_obj_add_style(btn, &style_btn, 0);                      /* 添加按钮样式 */
   lv_obj_replace_style(btn, &style_btn, &new_style_btn, 0);  /* 用不同的样式替换按钮样式 */


Remove styles（删除样式）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To remove all styles from a Widget use :cpp:expr:`lv_obj_remove_style_all(widget)`.

To remove specific styles use
:cpp:expr:`lv_obj_remove_style(widget, style, selector)`. This function will remove
``style`` only if the ``selector`` matches with the ``selector`` used in
:cpp:func:`lv_obj_add_style`. ``style`` can be ``NULL`` to check only the
``selector`` and remove all matching styles. The ``selector`` can use
the :cpp:enumerator:`LV_STATE_ANY` and :cpp:enumerator:`LV_PART_ANY` values to remove the style from
any state or part.

.. raw:: html

   </details>
   <br>

 
从对象中删除所有样式，请使用 :cpp:expr:`lv_obj_remove_style_all(obj)`。

要删除特定的样式，请使用 :cpp:expr:`lv_obj_remove_style(obj, style, selector)`。
此函数将仅在 ``selector`` 与 :cpp:func:`lv_obj_add_style` 中使用的 ``selector`` 匹配时删除 ``style``。
``style`` 可以是 ``NULL``，以仅检查 ``selector`` 并删除所有匹配的样式。
``selector`` 可以使用 :cpp:enumerator:`LV_STATE_ANY` 和 :cpp:enumerator:`LV_PART_ANY` 值，从任何状态或部件中删除样式。


Report style changes（通知样式更改）
-----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If a style which is already assigned to a Widget changes (i.e. a
property is added or changed), the Widgets using that style should be
notified. There are 3 options to do this:

1. If you know that the changed properties can be applied by a simple redraw
   (e.g. color or opacity changes) just call :cpp:expr:`lv_obj_invalidate(widget)`
   or :cpp:expr:`lv_obj_invalidate(lv_screen_active())`.
2. If more complex style properties were changed or added, and you know which
   Widget(s) are affected by that style call :cpp:expr:`lv_obj_refresh_style(widget, part, property)`.
   To refresh all parts and properties use :cpp:expr:`lv_obj_refresh_style(widget, LV_PART_ANY, LV_STYLE_PROP_ANY)`.
3. To make LVGL check all Widgets to see if they use a style and refresh them
   when needed, call :cpp:expr:`lv_obj_report_style_change(&style)`. If ``style``
   is ``NULL`` all Widgets will be notified about a style change.

.. raw:: html

   </details>
   <br>


如果已经分配给一个对象的样式发生改变（例如添加或更改属性），那么使用该样式的对象应该收到通知。有三种选项可以做到这一点：

1. 如果你知道改变的属性可以通过简单的重绘来应用（例如颜色或不透明度的变化），只需调用： `lv_obj_invalidate(obj)` 或者 `lv_obj_invalidate(lv_screen_active())`。
2. 如果更改或添加了更复杂的样式属性，并且你知道哪些对象受到该样式的影响，请调用： `lv_obj_refresh_style(obj, part, property)`。要刷新所有部件和属性，请使用： `lv_obj_refresh_style(obj, LV_PART_ANY, LV_STYLE_PROP_ANY)`。
3. 要让LVGL检查所有对象以查看它们是否使用了样式，并在需要时刷新它们，请调用： `lv_obj_report_style_change(&style)`。如果 `style` 是 `NULL`，则所有对象将收到有关样式更改的通知。


Get a property's value on an object（获取对象的属性值）
------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To get the final value of a style's property considering

- cascading,
- inheritance,
- local styles and transitions (see below)

property "get" functions like this can be used: ``lv_obj_get_style_<property_name>(widget, <part>)``.
These functions use the Widget's current state and if no better candidate exists they return the default value.
For example:

.. code-block:: c

    lv_color_t color = lv_obj_get_style_bg_color(btn, LV_PART_MAIN);

.. raw:: html

   </details>
   <br>


获取物体的最终属性值

- 考虑层叠、继承、本地样式和过渡效果（见下文）
- 可以使用此类属性获取函数： ``lv_obj_get_style_<property_name>(obj, <part>)``。
  这些函数使用物体的当前状态，如果没有更好的候选项，则返回默认值。
  例如：

.. code:: c

   lv_color_t color = lv_obj_get_style_bg_color(btn, LV_PART_MAIN);


.. _styles_local:

Local Styles（本地样式）
***********************

.. raw:: html

   <details>
     <summary>显示原文</summary>

In addition to "normal" styles, Widgets can also store local styles.
This concept is similar to inline styles in CSS
(e.g. ``<div style="color:red">``) with some modification.

Local styles are like normal styles, but they can't be shared among
other Widgets. If used, local styles are allocated automatically, and
freed when the Widget is deleted. They are useful to add local
customization to a Widget.

Unlike in CSS, LVGL local styles can be assigned to states
(pseudo-classes_) and parts (pseudo-elements_).

To set a local property use functions like
``lv_obj_set_style_<property_name>(widget, <value>, <selector>);``   For example:

.. code-block:: c

    lv_obj_set_style_bg_color(slider, lv_color_red(), LV_PART_INDICATOR | LV_STATE_FOCUSED);

.. raw:: html

   </details>
   <br>


除了“普通”样式外，对象还可以存储本地样式。
这个概念类似于CSS中的内联样式（例如 ``<div style="color:red">``），但有一些修改。

本地样式与普通样式类似，但不能在其他对象之间共享。如果使用，本地样式会自动分配，并且在对象被删除时释放。它们很适合为对象添加本地定制。

与CSS不同，LVGL中的本地样式可以分配给状态（ *伪类*）和部分（ *伪元素*）。

要设置本地属性，请使用如下函数： ``lv_obj_set_style_<property_name>(obj, <value>, <selector>);`` 例如：

.. code:: c

   lv_obj_set_style_bg_color(slider, lv_color_red(), LV_PART_INDICATOR | LV_STATE_FOCUSED);


.. _style_properties_overview:

Style Properties Overview
*************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

For the full list of style properties click :ref:`here <style_properties>`.

.. raw:: html

   </details>
   <br>


点击这里获取完整的样式属性列表 :ref:`here <style_properties>`。

.. _typical bg props:

Typical background properties（典型的背景属性）
----------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

In documentation of widgets you will see sentences like "The
_____ Widget uses the typical background style properties".  These "typical
background properties" are the properties being referred to:

- Background
- Border
- Outline
- Shadow
- Padding
- Width and height transformation
- X and Y translation

See :ref:`boxing_model` for the meanings of these terms.

.. raw:: html

   </details>
   <br>


在控件的文档中，您会看到类似于“该控件使用典型的背景属性”的句子。这些“典型的背景属性”包括：

- 背景
- 边框
- 轮廓
- 阴影
- 填充
- 宽度和高度转换
- X 和 Y 的平移


.. _style_transitions:

Transitions（过渡特效）
***********************

.. raw:: html

   <details>
     <summary>显示原文</summary>

By default, when a Widget changes state (e.g. it's pressed) the new
properties from the new state are set immediately. However, with
transitions it's possible to play an animation on state change. For
example, on pressing a button its background color can be animated to
the pressed color over 300 ms.

The parameters of the transitions are stored in the styles. It's
possible to set

- the time of the transition
- the delay before starting the transition
- the animation path (also known as the timing or easing function)
- the properties to animate

The transition properties can be defined for each state. For example,
setting a 500 ms transition time in the default state means that when
the Widget goes to the default state a 500 ms transition time is
applied. Setting a 100 ms transition time in the pressed state causes a
100 ms transition when going to the pressed state. This example
configuration results in going to the pressed state quickly and then
going back to default slowly.

To describe a transition an :cpp:struct:`lv_transition_dsc_t` variable needs to be
initialized and added to a style:

.. code-block:: c

   /* Only its pointer is saved so must static, global or dynamically allocated */
   static const lv_style_prop_t trans_props[] = {
                                               LV_STYLE_BG_OPA, LV_STYLE_BG_COLOR,
                                               0, /* End marker */
   };

   static lv_style_transition_dsc_t trans1;
   lv_style_transition_dsc_init(&trans1, trans_props, lv_anim_path_ease_out, duration_ms, delay_ms);

   lv_style_set_transition(&style1, &trans1);

.. raw:: html

   </details>
   <br>


默认情况下，当对象改变状态（例如，被按下）时，新状态的新属性立即设置。然而，使用过渡效果可以在状态改变时播放动画。
例如，按下按钮时，它的背景颜色可以在 300 毫秒内动画过渡到按下状态的颜色。

过渡效果的参数存储在样式中。可以设置：

- 过渡时间
- 开始过渡前的延迟
- 动画路径（也称为定时或缓动函数）
- 要进行动画处理的属性

过渡属性可以为每个状态定义。例如，在默认状态下设置500毫秒的过渡时间意味着当对象进入默认状态时，将应用500毫秒的过渡时间。
在按下状态下设置100毫秒的过渡时间，则在进入按下状态时会有100毫秒的过渡。这个例子的配置意味着迅速进入按下状态，然后慢慢返回默认状态。

为了描述一个过渡，需要初始化一个 :cpp:struct:`lv_transition_dsc_t` 变量，并将其添加到一个样式中：

.. code:: c

   /*Only its pointer is saved so must static, global or dynamically allocated */
   static const lv_style_prop_t trans_props[] = {
                                               LV_STYLE_BG_OPA, LV_STYLE_BG_COLOR,
                                               0, /*End marker*/
   };

   static lv_style_transition_dsc_t trans1;
   lv_style_transition_dsc_init(&trans1, trans_props, lv_anim_path_ease_out, duration_ms, delay_ms);

   lv_style_set_transition(&style1, &trans1);


.. _style_opacity_blend_modes_transformations:

Opacity, Blend modes and Transformations（不透明度，混合模式和变换）
******************************************************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

If the ``opa``, ``blend_mode``, ``transform_angle``, or
``transform_zoom`` properties are set to a non-default value LVGL
creates a snapshot of the widget and its children in order to
blend the whole widget with the set opacity, blend mode and
transformation properties.

These properties have this effect only on the ``MAIN`` part of the
widget.

The created snapshot is called "intermediate layer" or simply "layer".
If only ``opa`` and/or ``blend_mode`` is set to a non-default value LVGL
can build the layer from smaller chunks. The size of these chunks can be
configured by the following properties in ``lv_conf.h``:

- :cpp:enumerator:`LV_LAYER_SIMPLE_BUF_SIZE`: [bytes] the optimal target buffer size. LVGL will try to allocate this size of memory.
- :cpp:enumerator:`LV_LAYER_SIMPLE_FALLBACK_BUF_SIZE`: [bytes] used if :cpp:enumerator:`LV_LAYER_SIMPLE_BUF_SIZE` couldn't be allocated.

If transformation properties were also used the layer cannot be
rendered in chunks, but one larger memory block needs to be allocated. The
required memory depends on the angle, zoom and pivot parameters, and the
size of the area to redraw, but it's never larger than the size of the
widget (including the extra draw size used for shadow, outline, etc).

If the widget can fully cover the area to redraw, LVGL creates an RGB
layer (which is faster to render and uses less memory). If the opposite
case ARGB rendering needs to be used, a widget might not cover its area
if it has radius, ``bg_opa < 255``, has shadow, outline, etc.

The click area of the widget is also transformed accordingly.

.. raw:: html

   </details>
   <br>


如果 ``opa``、 ``blend_mode``、 ``transform_angle`` 或 ``transform_zoom`` 属性被设置为它们的非默认值，LVGL将为控件及其所有子级创建一个快照，以便将整个控件与设置的不透明度、混合模式和变换属性混合在一起。

这些属性仅在控件的 ``MAIN`` 部分上产生作用。

创建的快照称为“中间层”或简称为“层”。如果只有 ``opa`` 和/或 ``blend_mode`` 设置为非默认值，LVGL可以从较小的块构建图层。这些块的大小可以通过 ``lv_conf.h`` 中的以下属性配置：

- :cpp:enumerator:`LV_LAYER_SIMPLE_BUF_SIZE`: [字节] 的理想目标缓冲区大小。LVGL将尝试分配此内存大小。
- :cpp:enumerator:`LV_LAYER_SIMPLE_FALLBACK_BUF_SIZE`: [字节] 如果无法分配 :cpp:enumerator:`LV_LAYER_SIMPLE_BUF_SIZE`，则使用该大小。

如果还使用了变换属性，则图层无法以块的形式渲染，而需要分配更大的内存。所需的内存取决于角度、缩放和枢轴参数以及要重绘的区域大小，但永远不会大于控件的大小（包括用于阴影、轮廓等的额外绘制大小）。

如果控件可以完全覆盖要重绘的区域，LVGL将创建一个RGB图层（渲染速度更快，占用的内存更少）。如果相反情况需要使用ARGB渲染。如果控件具有半径、 ``bg_opa != 255``、有阴影、轮廓等，则控件可能无法覆盖其区域。

控件的点击区域也会相应地进行变换。


.. _style_color_filter:

Color Filter（色彩过滤）
***********************

TODO

.. _style_themes:

Themes（主题）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Themes are a collection of styles. If there is an active theme LVGL
applies it to every newly-created widget. This will give a default appearance
to the UI which can then be modified by adding further styles.

Every display can have a different theme. For example, you could have a
colorful theme on a TFT and monochrome theme on a secondary monochrome
display.

To set a theme for a display, two steps are required:

1. Initialize a theme
2. Assign the initialized theme to a display.

Theme initialization functions can have different prototypes. This
example shows how to set the "default" theme:

.. code-block:: c

   lv_theme_t * th = lv_theme_default_init(display,                 /* Use DPI, size, etc. from this display */
                                           LV_COLOR_PALETTE_BLUE,   /* Primary and secondary palette */
                                           LV_COLOR_PALETTE_CYAN,
                                           false,                   /* Dark theme?  False = light theme. */
                                           &lv_font_montserrat_10,  /* Small, normal, large fonts */
                                           &lv_font_montserrat_14,
                                           &lv_font_montserrat_18);

   lv_display_set_theme(display, th); /* Assign theme to display */

The included themes are enabled in ``lv_conf.h``. If the default theme
is enabled by :c:macro:`LV_USE_THEME_DEFAULT` LVGL automatically initializes
and sets it when a display is created.

.. raw:: html

   </details>
   <br>


主题是一系列的样式。如果有一个活动主题，LVGL会应用它到每个创建控件上。这将为UI提供一个默认的外观，可以通过添加更多样式来进行修改。

每个显示器可以有不同的主题。例如，你可以在TFT上有一个多彩的主题，在第二个单色显示器上有一个单色的主题。

要为显示器设置一个主题，需要两个步骤：

1. 初始化一个主题
2. 将初始化的主题分配给一个显示器。

主题初始化函数可以有不同的原型。下面的例子显示了如何设置“默认”主题：

.. code:: c

    lv_theme_t * th = lv_theme_default_init(display,  /*使用该显示器的DPI、大小等*/
                                            LV_COLOR_PALETTE_BLUE, LV_COLOR_PALETTE_CYAN,   /*主色和辅助色板*/
                                            false,    /*亮或暗模式*/
                                            &lv_font_montserrat_10, &lv_font_montserrat_14, &lv_font_montserrat_18); /*小、正常、大字体*/

    lv_display_set_theme(display, th); /*将主题分配给显示器*/

包含的主题在 ``lv_conf.h`` 中已启用。如果默认主题由 :c:macro:`LV_USE_THEME_DEFAULT` 启用，LVGL在创建显示器时会自动初始化和设置它。

Extending themes（扩展主题）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Built-in themes can be extended. If a custom theme is created, a parent
theme can be selected. The parent theme's styles will be added before
the custom theme's styles. Any number of themes can be chained this way.
E.g. default theme -> custom theme -> dark theme.

:cpp:expr:`lv_theme_set_parent(new_theme, base_theme)` extends the
``base_theme`` with the ``new_theme``.

There is an example of this below.

.. raw:: html

   </details>
   <br>


内置主题可以进行扩展。如果创建了自定义主题，则可以选择父主题。父主题的样式将在自定义主题的样式之前添加。可以通过这种方式链接任意数量的主题。例如，默认主题 -> 自定义主题 -> 深色主题。

:cpp:expr:`lv_theme_set_parent(new_theme, base_theme)` 用 ``new_theme`` 扩展了 ``base_theme``。

下面有一个示例。


.. _styles_example:

Examples
********

.. include:: ../../../examples/styles/index.rst



..  Hyperlinks

.. _pseudo-elements:
.. _pseudo-element:   https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Selectors#pseudo-classes_and_pseudo-elements
.. _pseudo-classes:
.. _pseudo-class:     https://developer.mozilla.org/en-US/docs/Glossary/Pseudo-class




.. _styles_api:

API
***