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

开关看起来像一个小滑块，可用于打开和关闭某些东西。

## Parts and Styles（部件和样式）

<details>
<summary>查看原文</summary>
<p>

- `LV_PART_MAIN` The background of the switch uses all the typical background style properties. `padding` makes the indicator smaller in the respective direction.
- `LV_PART_INDICATOR` The indicator that shows the current state of the switch. Also uses all the typical background style properties.
- `LV_PART_KNOB` A rectangle (or circle) drawn at left or right side of the indicator. Also uses all the typical background properties to describe the knob(s). By default the knob is square (with a optional corner radius) with side length equal to the smaller side of the slider. The knob can be made larger with the `padding` values. Padding values can be asymmetric too. 

</p>
</details>

- `LV_PART_MAIN` 开关的背景使用所有典型的背景样式属性。 `padding` 使指标在相应方向上变小。
- `LV_PART_INDICATOR` 显示开关当前状态的指示器。 还使用所有典型的背景样式属性。
- `LV_PART_KNOB` 在指标左侧或右侧绘制的矩形（或圆形）。 还使用所有典型的背景属性来描述旋钮。 默认情况下，旋钮是方形的（带有可选的圆角半径），边长等于滑块的较小边。 可以使用“padding”值使旋钮变大。 填充值也可以是不对称的。


## Usage（用法）

### Change state（改变状态）

<details>
<summary>查看原文</summary>
<p>

When the switch is turned on it goes to `LV_STATE_CHECKED`. To get the current satte of the switch use `lv_obj_has_state(switch, LV_STATE_CHECKED)`. 
To manually turn the switch on/off call `lvobj_add/clear_state(switch, LV_STATE_CHECKED)`.

</p>
</details>

当开关打开时，它会进入“LV_STATE_CHECKED”。 要获取开关的当前状态，请使用 `lv_obj_has_state(switch, LV_STATE_CHECKED)`。
要手动打开/关闭开关，请调用 `lvobj_add/clear_state(switch, LV_STATE_CHECKED)`。

## Events（事件）

<details>
<summary>查看原文</summary>
<p>

- `LV_EVENT_VALUE_CHANGED` Sent when the switch changes state.

See the events of the [Base object](/widgets/obj) too.

Learn more about [Events](/overview/event).

</p>
</details>

- `LV_EVENT_VALUE_CHANGED` 当开关改变状态时发送。

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

- `LV_KEY_UP/RIGHT` 打开滑块
- `LV_KEY_DOWN/LEFT` 关闭滑块
- `LV_KEY_ENTER` 切换开关

了解有关 [键](/overview/indev) 的更多信息。

## Example

```eval_rst

.. include:: ../../../examples/widgets/switch/index.rst

```

## API 

```eval_rst

.. doxygenfile:: lv_switch.h
  :project: lvgl
        
```
