```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/widgets/extra/keyboard.md
```


# Keyboard（键盘）(lv_keyboard)

## Overview（概述）

<details>
<summary>查看原文</summary>
<p>

The Keyboard object is a special [Button matrix](/widgets/core/btnmatrix) with predefined keymaps and other features to realize a virtual keyboard to write texts into a [Text area](/widgets/core/textarea).


</p>
</details>

键盘(lv_keyboard)对象是一个特殊的 [按钮矩阵(lv_btnmatrix)](/widgets/core/btnmatrix)，自身实现了按键(map)映射和其他功能，目的是用于实现一个虚拟键盘将文本写入[文本框(lv_textarea)](/widgets/core/textarea)。

## Parts and Styles（部分和样式）

<details>
<summary>查看原文</summary>
<p>

Similarly to Button matrices Keyboards consist of 2 part: 
- `LV_PART_MAIN` The main part. Uses all the typical background properties
- `LV_PART_ITEMS` The buttons. Also uses all typical background properties as well as the *text* properties.

</p>
</details>

与按钮矩阵类似，键盘由 2 部分组成：

- `LV_PART_MAIN` 主要部分(自身背景部分)，使用所有组件默认都有的典型的背景样式属性。
- `LV_PART_ITEMS` 键盘中的按钮。使用所有典型的背景属性以及 *text* 属性。

## Usage（用法）

### Modes（模式）

<details>
<summary>查看原文</summary>
<p>

The Keyboards have the following modes:
- `LV_KEYBOARD_MODE_TEXT_LOWER`  Display lower case letters
- `LV_KEYBOARD_MODE_TEXT_UPPER`  Display upper case letters
- `LV_KEYBOARD_MODE_TEXT_SPECIAL` Display special characters
- `LV_KEYBOARD_MODE_NUMBER` Display numbers, +/- sign, and decimal dot
- `LV_KEYBOARD_MODE_USER_1` through `LV_KEYBOARD_MODE_USER_4` User-defined modes.

The `TEXT` modes' layout contains buttons to change mode.

To set the mode manually, use `lv_keyboard_set_mode(kb, mode)`. The default mode is  `LV_KEYBOARD_MODE_TEXT_UPPER`.

</p>
</details>

键盘可以切换下面这几种输入模式：
- `LV_KEYBOARD_MODE_TEXT_LOWER`  26键英文小写键盘模式
- `LV_KEYBOARD_MODE_TEXT_UPPER`  26键英文大写键盘模式
- `LV_KEYBOARD_MODE_TEXT_SPECIAL` 特殊字符输入模式
- `LV_KEYBOARD_MODE_NUMBER` 数字键盘模式。可以输入数字、+/- 符号和小数点
- `LV_KEYBOARD_MODE_USER_1` 到 `LV_KEYBOARD_MODE_USER_4` 用户可自定义拓展的模式lvgl

更改模式会更改键盘的按钮的文字甚至布局。

您可以通过 `lv_keyboard_set_mode(kb, mode)` 函数手动设置模式。默认的模式是 `LV_KEYBOARD_MODE_TEXT_UPPER` 。


### Assign Text area（指定文本框）

<details>
<summary>查看原文</summary>
<p>

You can assign a [Text area](/widgets/core/textarea) to the Keyboard to automatically put the clicked characters there.
To assign the text area, use `lv_keyboard_set_textarea(kb, ta)`.

</p>
</details>

你可以将文本框分配给键盘绑定，之后点击键盘上的按钮就能更改文本框中的内容。可以通过 `lv_keyboard_set_textarea(kb, ta)` 函数将文本框分配给键盘绑定。

### Key Popovers（按键弹出提示）

<details>
<summary>查看原文</summary>
<p>

To enable key popovers on press, like on common Android and iOS keyboards, use `lv_keyboard_set_popovers(kb, true)`. The default control maps are preconfigured to only show the popovers on keys that produce a symbol and not on e.g. space. If you use a custom keymap, set the `LV_BTNMATRIX_CTRL_POPOVER` flag for all keys that you want to show a popover.

Note that popovers for keys in the top row will draw outside the widget boundaries. To account for this, reserve extra free space on top of the keyboard or ensure that the keyboard is added _after_ any widgets adjacent to its top boundary so that the popovers can draw over those.

The popovers currently are merely a visual effect and don't allow selecting additional characters such as accents yet.

</p>
</details>

这个效果就像常见的安卓和iOS键盘上的效果：按下按键时会有在相应的按键之上弹出该按键提示当前按下的按钮。调用函数 `lv_keyboard_set_popovers(kb, true)` 即可得到这样得效果。默认控制map默认的配置是只在有text的按键上显示弹出提示框，而不会在空格键(space)上显示。如果使用自定义的按键map，请为所有要显示弹出框的按键设置 `LV_BTNMATRIX_CTRL_POPOVER` 标志。

请注意，顶行中的按键的弹出窗口将被绘制在超过键盘的边界之外。因此，建议在键盘顶部保留额外的可用空间，或确保在其顶部边界附近的任何其他组件(对象)之后再添加或者创建键盘，来确保弹出窗口不被这些组件遮挡。


目前，弹出窗口仅仅是一种视觉效果，还不支持使用其他字符，例如重音符号等。

### New Keymap（自定义键盘布局）

<details>
<summary>查看原文</summary>
<p>

You can specify a new map (layout) for the keyboard with `lv_keyboard_set_map(kb, map)` and `lv_keyboard_set_ctrl_map(kb, ctrl_map)`.
Learn more about the [Button matrix](/widgets/core/btnmatrix) object.
Keep in mind that using following keywords will have the same effect as with the original map:  
- `LV_SYMBOL_OK` Apply.
- `LV_SYMBOL_CLOSE` or `LV_SYMBOL_KEYBOARD` Close.
- `LV_SYMBOL_BACKSPACE` Delete on the left.
- `LV_SYMBOL_LEFT` Move the cursor left.
- `LV_SYMBOL_RIGHT` Move the cursor right.
- `LV_SYMBOL_NEW_LINE` New line.
- *"ABC"* Load the uppercase map.
- *"abc"* Load the lower case map.
- *"1#"* Load the lower case map.

</p>
</details>


您可以使用 `lv_keyboard_set_map(kb, map)` 和 `lv_keyboard_set_ctrl_map(kb, ctrl_map)` 函数为键盘指定新的map（布局）。

了解有关 [按钮矩阵](/widgets/core/btnmatrix) 对象的更多信息。

请记住，使用以下关键字可以得到与内置map(布局)相同的效果：

- `LV_SYMBOL_OK` 应用
- `LV_SYMBOL_CLOSE` 或者 `LV_SYMBOL_KEYBOARD` 关闭。
- `LV_SYMBOL_BACKSPACE` 删除光标左侧的字符。
- `LV_SYMBOL_LEFT` 向左移动光标。
- `LV_SYMBOL_RIGHT` 向右移动光标。
- `LV_SYMBOL_NEW_LINE` 换行。
- *"ABC"* 切换为26键英文大写键盘布局。
- *"abc"* 切换为26键英文大写键盘布局。
- *"1#"* 切换为特殊字符键盘布局


## Events（事件）

<details>
<summary>查看原文</summary>
<p>

- `LV_EVENT_VALUE_CHANGED` Sent when the button is pressed/released or repeated after long press. The event data is set to the ID of the pressed/released button.
- `LV_EVENT_READY` - The *Ok* button is clicked.
- `LV_EVENT_CANCEL` - The *Close* button is clicked.

The keyboard has a **default event handler** callback called `lv_keyboard_def_event_cb`, which handles the button pressing, map changing, the assigned text area, etc. You can remove it and replace it with a custom event handler if you wish.


```eval_rst
.. note::
   In 8.0 and newer, adding an event handler to the keyboard does not remove the default event handler.
   This behavior differs from v7, where adding an event handler would always replace the previous one.
```


Learn more about [Events](/overview/event).

</p>
</details>

- `LV_EVENT_VALUE_CHANGED` 当按钮被按下/释放或允许长按后重复时发送。事件数据设置为按下/释放的按钮的 ID 。
- `LV_EVENT_READY` - *Ok* (LV_SYMBOL_OK)按钮被点击
- `LV_EVENT_CANCEL` - *Close* (`LV_SYMBOL_CLOSE`)按钮被点击

键盘有一个默认的事件处理回调函数： `lv_keyboard_def_event_cb` 。其用于处理按钮的按下、map(布局)的更改、绑定的文本框等。如果您愿意，可以将其删除并替换为自定义的事件处理回调函数。

```eval_rst
.. note::
   在 8.0 及更高版本中，向键盘添加事件处理回调函数不会删除默认(之前)的事件处理回调函数。此行为与 v7 不同，因为在 v7 中，新的事件处理回调函数会替换之前的。
```

了解有关 [事件](/overview/event) 的更多信息。

## Keys（按键）

<details>
<summary>查看原文</summary>
<p>

- `LV_KEY_RIGHT/UP/LEFT/RIGHT` To navigate among the buttons and select one.
- `LV_KEY_ENTER` To press/release the selected button.

Learn more about [Keys](/overview/indev).

</p>
</details>


- `LV_KEY_RIGHT/UP/LEFT/RIGHT` 通过导航模式选中按钮。
- `LV_KEY_ENTER` 按下/释放所选中按钮(模拟触摸点击的效果)。

了解关于 [按键](/overview/indev) 的更多信息。

## Examples（示例）


```eval_rst

.. include:: ../../../examples/widgets/keyboard/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_keyboard.h
  :project: lvgl

```
