```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/widgets/switch.md
```

# Switch（开关） (lv_switch)

## Overview（概述）

<details>
<summary>查看原文</summary>
<p>

The Switch looks like a little slider and can be used to turn something on and off. 

</p>
</details>

开关看起来像一个小滑块，开关的功能类似于按钮，也可以用来打开和关闭某些东西。


## Parts and Styles（零件和样式）

<details>
<summary>查看原文</summary>
<p>

- `LV_PART_MAIN` The background of the switch uses all the typical background style properties. `padding` makes the indicator smaller in the respective direction.
- `LV_PART_INDICATOR` The indicator that shows the current state of the switch. Also uses all the typical background style properties.
- `LV_PART_KNOB` A rectangle (or circle) drawn at left or right side of the indicator. Also uses all the typical background properties to describe the knob(s). By default the knob is square (with a optional corner radius) with side length equal to the smaller side of the slider. The knob can be made larger with the `padding` values. Padding values can be asymmetric too. 

</p>
</details>

开关包括以下3个零件：

- `LV_PART_MAIN` 背景。 修改其 padding 会让下面的(指示器和旋钮)在相应方向上的大小发生变化。
- `LV_PART_INDICATOR` 显示开关状态的指示器。
- `LV_PART_KNOB` 在指标左侧或右侧的旋钮。 默认情况下，旋钮是圆形的，边长等于滑块的较小边。 可以修改 padding 值使旋钮变大，填充值可以是不对称的。

示例：

```c
// 修改开关背景部分的颜色
lv_obj_set_style_bg_color(sw, lv_color_hex(0xc43e1c), LV_PART_MAIN);

// 修改开关状态指示器部分，关闭状态时的背景颜色
lv_obj_set_style_bg_opa(sw, 100, LV_PART_INDICATOR);
lv_obj_set_style_bg_color(sw, lv_color_hex(0xc43e1c), LV_PART_INDICATOR);

// 修改开关状态指示器部分，打开状态时的背景颜色
lv_obj_set_style_bg_color(sw, lv_color_hex(0x7719aa), LV_PART_INDICATOR | LV_STATE_CHECKED);

// 修改开关旋钮部分的颜色
lv_obj_set_style_bg_color(sw, lv_color_hex(0xc43e1c), LV_PART_KNOB);
```


## Usage（用法）

### Change state（改变状态）

<details>
<summary>查看原文</summary>
<p>

When the switch is turned on it goes to `LV_STATE_CHECKED`. To get the current satte of the switch use `lv_obj_has_state(switch, LV_STATE_CHECKED)`. 
To manually turn the switch on/off call `lvobj_add/clear_state(switch, LV_STATE_CHECKED)`.

</p>
</details>

当开关被打开时，开关的状态会变为 LV_STATE_CHECKED 。我们可以通过下面这个接口获取开关当前的状态：

```c
lv_obj_has_state(switch, LV_STATE_CHECKED);   // 返回 bool 类型， 开-1 ； 关-2
```

一般我们通过触摸或按键控制让开关打开/关闭，其实我们还可以通过下面这个接口来主动 打开/关闭 开关：	 

```c
lv_obj_add_state(switch, LV_STATE_CHECKED);	// 开
lv_obj_clear_state(switch, LV_STATE_CHECKED);	// 关
```

我们可以通过下面的接口让按钮处于不可更改状态：

```c
lv_obj_add_state(sw, LV_STATE_DISABLED); 		                // 当前状态是关，并且不可更改
lv_obj_add_state(sw, LV_STATE_CHECKED | LV_STATE_DISABLED);  // 当前状态是开，并且不可更改
```

要让按钮恢复可以更改的状态，我们只要将 LV_STATE_DISABLED 清除即可：

```c
lv_obj_clear_state(switch, LV_STATE_ DISABLED);		          // 清除禁用状态，按钮可正常使用
```

## Events（事件）

<details>
<summary>查看原文</summary>
<p>

- `LV_EVENT_VALUE_CHANGED` Sent when the switch changes state.

See the events of the [Base object](/widgets/obj) too.

Learn more about [Events](/overview/event).

</p>
</details>

正常情况下，当开关被点击并且状态发生改变时，会触发 `LV_EVENT_VALUE_CHANGED` 事件类型。也就是说我们可以在 `LV_EVENT_VALUE_CHANGED` 事件类型中处理事件。

参见 [Base object](/widgets/obj) 的事件。

详细了解 [事件](/overview/event)。

## Keys（按键）

<details>
<summary>查看原文</summary>
<p>

- `LV_KEY_UP/RIGHT` Turns on the slider
- `LV_KEY_DOWN/LEFT` Turns off the slider
- `LV_KEY_ENTER` Toggles the switch 

Learn more about [Keys](/overview/indev).

</p>
</details>

- `LV_KEY_UP/RIGHT` 开
- `LV_KEY_DOWN/LEFT` 关
- `LV_KEY_ENTER` 切换开关

了解有关 [按键](/overview/indev) 的更多信息。

## Example

```eval_rst

.. include:: ../../../examples/widgets/switch/index.rst

```

## API 

```eval_rst

.. doxygenfile:: lv_switch.h
  :project: lvgl
        
```
