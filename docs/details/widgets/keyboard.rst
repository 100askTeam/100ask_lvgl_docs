.. _lv_keyboard:

==============================
Keyboard（键盘） (lv_keyboard)
==============================

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>


The Keyboard Widget is a special :ref:`lv_buttonmatrix`
with predefined keymaps and other features to provide an on-screen virtual keyboard
to write text into a :ref:`lv_textarea`.

.. raw:: html

   </details> 
   <br>


键盘部件是一种特殊的 :ref:`lv_buttonmatrix`，它带有预定义的键映射以及其他功能，旨在为向 :ref:`lv_textarea`中输入文本提供一个屏幕上的虚拟键盘。

.. _lv_keyboard_parts_and_styles:

Parts and Styles（部分与样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>


Similarly to Button matrices Keyboards consist of 2 part:

- :cpp:enumerator:`LV_PART_MAIN` The main part. Uses all the typical background properties
- :cpp:enumerator:`LV_PART_ITEMS` The buttons. Also uses all typical background properties as well as the *text* properties.

.. raw:: html

   </details> 
   <br>


与按钮矩阵类似，键盘由 2 部分组成：

- :cpp:enumerator:`LV_PART_MAIN` 主要部分(自身背景部分)，使用所有组件默认都有的典型的背景样式属性。
- :cpp:enumerator:`LV_PART_ITEMS` 键盘中的按钮。使用所有典型的背景属性以及 *text* 属性。


.. _lv_keyboard_usage:

Usage（用法）
************

Modes（模式）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>


The Keyboards have the following modes:

- :cpp:enumerator:`LV_KEYBOARD_MODE_TEXT_LOWER` Display lower case letters
- :cpp:enumerator:`LV_KEYBOARD_MODE_TEXT_UPPER` Display upper case letters
- :cpp:enumerator:`LV_KEYBOARD_MODE_TEXT_SPECIAL` Display special characters
- :cpp:enumerator:`LV_KEYBOARD_MODE_NUMBER` Display numbers, +/- sign, and decimal dot
- :cpp:enumerator:`LV_KEYBOARD_MODE_USER_1` through :cpp:enumerator:`LV_KEYBOARD_MODE_USER_4` User-defined modes.

The layouts of the ``TEXT`` modes contain "keys" to change mode.

To set the mode manually, use :cpp:expr:`lv_keyboard_set_mode(kb, mode)`. The
default mode is :cpp:enumerator:`LV_KEYBOARD_MODE_TEXT_UPPER`.

.. raw:: html

   </details> 
   <br>


键盘可以切换为下面这几种输入模式：

- :cpp:enumerator:`LV_KEYBOARD_MODE_TEXT_LOWER` 26键英文小写键盘模式
- :cpp:enumerator:`LV_KEYBOARD_MODE_TEXT_UPPER` 26键英文大写键盘模式
- :cpp:enumerator:`LV_KEYBOARD_MODE_TEXT_SPECIAL` 特殊字符输入模式
- :cpp:enumerator:`LV_KEYBOARD_MODE_NUMBER` 数字键盘模式。可以输入数字、+/- 符号和小数点
- :cpp:enumerator:`LV_KEYBOARD_MODE_USER_1` 到 :cpp:enumerator:`LV_KEYBOARD_MODE_USER_4` 用户可自定义拓展的模式lvgl

``TEXT``模式的布局包含用于切换模式的 “按键”。

您可以通过 :cpp:expr:`lv_keyboard_set_mode(kb, mode)` 函数手动设置模式。默认的模式是 :cpp:enumerator:`LV_KEYBOARD_MODE_TEXT_UPPER`。


Assign Text area（指定文本框）
-----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>


You can assign a :ref:`Text Area <lv_textarea>` Widget to the Keyboard to
automatically put the clicked characters there. To assign the Text Area,
use :cpp:expr:`lv_keyboard_set_textarea(kb, text_area)`.

.. raw:: html

   </details> 
   <br>


你可以将一个 :ref:`Text Area <lv_textarea>` 部件分配给键盘，以便自动将点击的字符输入到该文本区域中。要分配文本区域，可使用 :cpp:expr:`lv_keyboard_set_textarea(kb, text_area)`。

Key Popovers（按键弹出提示）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>


To enable key pop-overs on press, like on common Android and iOS
keyboards, use :cpp:expr:`lv_keyboard_set_popovers(kb, true)`. Default
control maps are preconfigured to only show the pop-overs on keys that
produce a symbol (i.e. not on space). If you use a custom keymap (see below), set
the :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_POPOVER` flag for each key for which
a pop-over should be shown.

Note that pop-overs for keys in the top row will draw outside the Widget
boundaries. To account for this, reserve extra free space on top of the
Keyboard or ensure that the Keyboard is added *after* any Widgets
adjacent to its top boundary (placing it "above" those Widgets) so that pop-overs
will be drawn over them.

Pop-overs currently are merely a visual effect and don't allow
selecting additional characters such as accented characters yet.

.. raw:: html

   </details> 
   <br>


若要像常见的安卓和 iOS 键盘那样，在按键被按下时启用按键弹出提示框，可使用 :cpp:expr:`lv_keyboard_set_popovers(kb, true)`。默认的控制映射已预先配置为仅在能产生符号的按键（也就是非空格键）上显示弹出提示框。如果使用自定义键映射（详见下文），则需要为每个应显示弹出提示框的按键设置 :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_POPOVER`标志。

需要注意的是，顶行按键的弹出提示框会绘制在部件边界之外。为应对这一情况，可以在键盘顶部预留额外的空闲空间，或者确保键盘是在与其顶部边界相邻的所有部件之后添加（即将其置于这些部件的 “上方”），这样弹出提示框就能绘制在这些部件之上了。

目前，弹出提示框仅仅是一种视觉效果，尚不支持选择诸如带重音符号之类的额外字符。


New Keymap（自定义键盘布局）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>


You can specify a new map (layout) for the Keyboard with
:cpp:expr:`lv_keyboard_set_map(kb, LV_KEYBOARD_MODE_..., kb_map, kb_ctrl)`. See
Button Matrix's :ref:`button map` section for more information about
creating new maps.

Keep in mind that using following keywords will have the same effect as
with the original map:

- :c:macro:`LV_SYMBOL_OK` Send :cpp:enumerator:`LV_EVENT_READY` to the assigned Text area.
- :c:macro:`LV_SYMBOL_CLOSE` or :c:macro:`LV_SYMBOL_KEYBOARD` Send :cpp:enumerator:`LV_EVENT_CANCEL` to the assigned Text area.
- :c:macro:`LV_SYMBOL_BACKSPACE` Delete on the left.
- :c:macro:`LV_SYMBOL_LEFT` Move the cursor left.
- :c:macro:`LV_SYMBOL_RIGHT` Move the cursor right.
- :c:macro:`LV_SYMBOL_NEW_LINE` New line.
- ``"ABC"`` Load the upper case map.
- ``"abc"`` Load the lower case map.
- ``"1#"`` Load number map.

.. raw:: html

   </details> 
   <br>


你可以使用 :cpp:expr:`lv_keyboard_set_map(kb, LV_KEYBOARD_MODE_..., kb_map, kb_ctrl)`为键盘指定一个新的映射（布局）。有关创建新映射的更多信息，请参阅按钮矩阵的 :ref:`button map` 部分内容。

看 :ref:`按钮矩阵 <lv_buttonmatrix>` ，了解详细信息创建新的map（布局）和Ctrl。

请记住，使用以下关键字可以得到与内置map(布局)相同的效果：

- :c:macro:`LV_SYMBOL_OK` 将 :cpp:enumerator:`LV_EVENT_READY` 事件触发到指定的文本区域。
- :c:macro:`LV_SYMBOL_CLOSE` 或 :c:macro:`LV_SYMBOL_KEYBOARD` 将 :cpp:enumerator:`LV_EVENT_CANCEL` 事件触发到指定的文本区域。
- :c:macro:`LV_SYMBOL_BACKSPACE` 删除光标左侧的字符。
- :c:macro:`LV_SYMBOL_LEFT` 向左移动光标。
- :c:macro:`LV_SYMBOL_RIGHT` 向右移动光标。
- :c:macro:`LV_SYMBOL_NEW_LINE` 换行。
- ``"ABC"`` 加载大写字母映射。
- ``"abc"`` 加载小写字母映射。
- ``"1#"`` 加载数字映射。


.. _lv_keyboard_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` Sent when the button is pressed/released
   or repeated after long press. The event data is set to the ID of the
   pressed/released button.
-  :cpp:enumerator:`LV_EVENT_READY`: The *Ok* button is clicked.
-  :cpp:enumerator:`LV_EVENT_CANCEL`: The *Close* button is clicked.

The Keyboard has a **default event handler** callback called
:cpp:func:`lv_keyboard_def_event_cb`, which handles the button pressing, map
changing, sending events to the assigned text area, etc. You can remove it and replace it
with a custom event handler if you wish, or add an additional call-back of your own.


:note: In 8.0 and newer, adding an event handler to the keyboard does not remove the default event handler.
       This behavior differs from v7, where adding an event handler would always replace the previous one.

.. admonition::  Further Reading

    Learn more about :ref:`lv_obj_events` emitted by all Widgets.

    Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 按下/松开按钮时发送或长按后重复。事件数据设置为按下/松开按钮。
-  :cpp:enumerator:`LV_EVENT_READY`: 单击 *确定* 按钮。
-  :cpp:enumerator:`LV_EVENT_CANCEL`: 单击 *关闭* 按钮。

键盘有一个名为:cpp:func:`lv_keyboard_def_event_cb`的 **default event handler**程序回调函数，它负责处理按键按下、映射更改、向已分配的文本区域发送事件等操作。如果你愿意，可以移除它并用自定义的事件处理程序来替换，或者添加一个你自己的额外回调函数。

:注意: 在 8.0 及更高版本中，向键盘添加事件处理程序不会删除默认事件处理程序。 此行为与 v7 不同，在 v7 中，添加事件处理程序将始终替换前一个事件处理程序。

了解更多关于所有部件都会发出的 :ref:`lv_obj_events` 的相关内容。

了解更多关于 :ref:`events` 的相关内容。


.. _lv_keyboard_keys:

Keys（按键）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>


-  ``LV_KEY_RIGHT/UP/LEFT/RIGHT`` To navigate among the buttons,
   selecting the one navigated to.
-  :cpp:enumerator:`LV_KEY_ENTER` To press/release the selected button.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


-  ``LV_KEY_RIGHT/UP/LEFT/RIGHT`` 用于在各个按键之间进行导航，并选中所导航到的那个按键。
-  :cpp:enumerator:`LV_KEY_ENTER` 按下/松开所选按钮。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_keyboard_example:

Example
*******

.. include:: ../examples/widgets/keyboard/index.rst

.. _lv_keyboard_api:

API
***
