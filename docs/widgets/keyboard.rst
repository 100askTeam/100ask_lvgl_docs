.. _lv_keyboard:

==============================
Keyboard（键盘） (lv_keyboard)
==============================

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>


The Keyboard object is a special :ref:`Button matrix <lv_buttonmatrix>`
with predefined keymaps and other features to realize a virtual keyboard
to write texts into a :ref:`Text area <lv_textarea>`.

.. raw:: html

   </details> 
   <br>


键盘(lv_keyboard)对象是一个特殊的 :ref:`按钮矩阵 <lv_buttonmatrix>` ，自身实现了按键(map)映射和其他功能，目的是用于实现一个虚拟键盘将文本写入 :ref:`文本框 <lv_textarea>` 。


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

The ``TEXT`` modes' layout contains buttons to change mode.

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

更改模式会更改键盘的按钮的文字甚至布局。

您可以通过 :cpp:expr:`lv_keyboard_set_mode(kb, mode)` 函数手动设置模式。默认的模式是 :cpp:enumerator:`LV_KEYBOARD_MODE_TEXT_UPPER`。


Assign Text area（指定文本框）
-----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>


You can assign a :ref:`Text area <lv_textarea>` to the Keyboard to
automatically put the clicked characters there. To assign the text area,
use :cpp:expr:`lv_keyboard_set_textarea(kb, ta)`.

.. raw:: html

   </details> 
   <br>


你可以将 :ref:`Text area <lv_textarea>` 分配给键盘绑定，之后点击键盘上的按钮就能更改文本框中的内容。可以通过 :cpp:expr:`lv_keyboard_set_textarea(kb, ta)` 函数将文本框绑定到键盘上。


Key Popovers（按键弹出提示）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>


To enable key popovers on press, like on common Android and iOS
keyboards, use :cpp:expr:`lv_keyboard_set_popovers(kb, true)`. The default
control maps are preconfigured to only show the popovers on keys that
produce a symbol and not on e.g. space. If you use a custom keymap, set
the :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_POPOVER` flag for all keys that you want to
show a popover.

Note that popovers for keys in the top row will draw outside the widget
boundaries. To account for this, reserve extra free space on top of the
keyboard or ensure that the keyboard is added *after* any widgets
adjacent to its top boundary so that the popovers can draw over those.

The popovers currently are merely a visual effect and don't allow
selecting additional characters such as accents yet.

.. raw:: html

   </details> 
   <br>


这个效果就像常见的安卓和iOS键盘上的效果：按下按键时会有在相应的按键之上弹出该按键提示当前按下的按钮。调用函数 :cpp:expr:`lv_keyboard_set_popovers(kb, true)` 即可得到这样得效果。默认控制map默认的配置是只在有text的按键上显示弹出提示框，而不会在空格键(space)上显示。如果使用自定义的按键map，请为所有要显示弹出框的按键设置 :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_POPOVER` 标志。

请注意，顶行中的按键的弹出窗口将被绘制在超过键盘的边界之外。因此，建议在键盘顶部保留额外的可用空间，或确保在其顶部边界附近的任何其他控件(对象)之后再添加或者创建键盘，来确保弹出窗口不被这些控件遮挡。

目前，弹出窗口仅仅是一种视觉效果，还不支持使用其他字符，例如重音符号等。


New Keymap（自定义键盘布局）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>


You can specify a new map (layout) for the keyboard with
:cpp:expr:`lv_keyboard_set_map(kb, LV_KEYBOARD_MODE_..., kb_map, kb_ctrl)`. See
the :ref:`Button matrix <lv_buttonmatrix>` for more information about
creating new maps and ctrls.

Keep in mind that using following keywords will have the same effect as
with the original map:

- :c:macro:`LV_SYMBOL_OK` Send :cpp:enumerator:`LV_EVENT_READY` to the assigned Text area.
- :c:macro:`LV_SYMBOL_CLOSE` or :c:macro:`LV_SYMBOL_KEYBOARD` Send :cpp:enumerator:`LV_EVENT_CANCEL` to the assigned Text area.
- :c:macro:`LV_SYMBOL_BACKSPACE` Delete on the left.
- :c:macro:`LV_SYMBOL_LEFT` Move the cursor left.
- :c:macro:`LV_SYMBOL_RIGHT` Move the cursor right.
- :c:macro:`LV_SYMBOL_NEW_LINE` New line.
- ``"ABC"`` Load the uppercase map.
- ``"abc"`` Load the lower case map.
- ``"1#"`` Load the lower case map.

.. raw:: html

   </details> 
   <br>


您可以使用 :cpp:expr:`lv_keyboard_set_map(kb, LV_KEYBOARD_MODE_..., kb_map, kb_ctrl)` 函数为键盘指定新的map（布局）。

看 :ref:`按钮矩阵 <lv_buttonmatrix>` ，了解详细信息创建新的map（布局）和Ctrl。

请记住，使用以下关键字可以得到与内置map(布局)相同的效果：

- :c:macro:`LV_SYMBOL_OK` 将 :cpp:enumerator:`LV_EVENT_READY` 事件触发到指定的文本区域。
- :c:macro:`LV_SYMBOL_CLOSE` 或 :c:macro:`LV_SYMBOL_KEYBOARD` 将 :cpp:enumerator:`LV_EVENT_CANCEL` 事件触发到指定的文本区域。
- :c:macro:`LV_SYMBOL_BACKSPACE` 删除光标左侧的字符。
- :c:macro:`LV_SYMBOL_LEFT` 向左移动光标。
- :c:macro:`LV_SYMBOL_RIGHT` 向右移动光标。
- :c:macro:`LV_SYMBOL_NEW_LINE` 换行。
- ``"ABC"`` 切换为26键英文大写键盘布局。
- ``"abc"`` 切换为26键英文大写键盘布局。
- ``"1#"`` 切换为特殊字符键盘布局。


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

The keyboard has a **default event handler** callback called
:cpp:func:`lv_keyboard_def_event_cb`, which handles the button pressing, map
changing, the assigned text area, etc. You can remove it and replace it
with a custom event handler if you wish.


:note: In 8.0 and newer, adding an event handler to the keyboard does not remove the default event handler.
       This behavior differs from v7, where adding an event handler would always replace the previous one.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 按下/松开按钮时发送或长按后重复。事件数据设置为按下/松开按钮。
-  :cpp:enumerator:`LV_EVENT_READY`: 单击 *确定* 按钮。
-  :cpp:enumerator:`LV_EVENT_CANCEL`: 单击 *关闭* 按钮。

键盘有一个名为 **默认事件处理程序回调** 调用 :cpp:func:`lv_keyboard_def_event_cb`，用于处理按钮按下，映射更改、指定的文本区域等。如果您愿意，您可以删除并替换它，也可以使用自定义事件处理。

:注意: 在 8.0 及更高版本中，向键盘添加事件处理程序不会删除默认事件处理程序。 此行为与 v7 不同，在 v7 中，添加事件处理程序将始终替换前一个事件处理程序。

详细了解更多 :ref:`events`。


.. _lv_keyboard_keys:

Keys（按键）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>


-  ``LV_KEY_RIGHT/UP/LEFT/RIGHT`` To navigate among the buttons and
   select one.
-  :cpp:enumerator:`LV_KEY_ENTER` To press/release the selected button.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


-  ``LV_KEY_RIGHT/UP/LEFT/RIGHT`` 在按钮和导航之间选择一个。
-  :cpp:enumerator:`LV_KEY_ENTER` 按下/松开所选按钮。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_keyboard_example:

Example
*******

.. include:: ../examples/widgets/keyboard/index.rst

.. _lv_keyboard_api:

API
***
