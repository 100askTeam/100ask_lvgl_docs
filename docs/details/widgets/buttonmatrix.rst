.. _lv_buttonmatrix:

==========================================
Button matrix（矩阵按钮） (lv_buttonmatrix)
==========================================

Overview（概述）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Button Matrix Widget is a lightweight way to display multiple
Buttons in rows and columns --- lightweight because the buttons are not
actually created but just virtually drawn on the fly.  With Button Matrix,
each button uses only eight extra bytes of memory instead of the ~100-150
bytes a normal :ref:`Button <lv_button>` Widget plus the 100 or so bytes
for the :ref:`Label <lv_label>` Widget.

New Button Matrix Widgets are added to the default group (if one is set).
Additionally, Button Matrix is an editable Widget:  it allows selecting and clicking
the buttons with encoder and keyboard navigation as well.

.. raw:: html

   </details> 
   <br>

按钮矩阵部件是一种以行列形式展示多个按钮的轻量级方式 —— 之所以说它轻量级，是因为这些按钮实际上并未被创建，而只是在运行时虚拟绘制出来的。使用按钮矩阵时，每个按钮仅额外占用 8 字节内存，相比之下，一个普通的:ref:`Button <lv_button>`部件大约要占用100 - 150字节，再加上:ref:`Label <lv_label>`部件所需的约 100 字节左右。

新的按钮矩阵部件会被添加到默认组中（如果设置了默认组的话）。此外，按钮矩阵是一个可编辑部件：它也允许通过编码器和键盘导航来选择和点击按钮。

.. _lv_buttonmatrix_parts_and_styles:

Parts and Styles（部分和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` The background of the Button Matrix, uses the
   typical background style properties. ``pad_row`` and ``pad_column``
   sets the space between the buttons.
-  :cpp:enumerator:`LV_PART_ITEMS` The buttons all use the text and typical background
   style properties except translations and transformations.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_PART_MAIN` 矩阵按钮的背景，使用所有控件默认都有的典型的背景样式属性。可通过 ``pad_row`` 和 ``pad_column`` 设置按钮之间的空间。
-  :cpp:enumerator:`LV_PART_ITEMS` 除了转变之外，按钮都使用文本和典型的背景样式属性。


.. _lv_buttonmatrix_usage:

Usage（用法）
*************

Button map（按钮映射）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The number of buttons, their positions and text are controlled by a descriptor string
array, called a *map*, passed to
:cpp:expr:`lv_buttonmatrix_set_map(btn_matrix, my_map)`. The declaration of a map should
look like ``const char * map[] = {"button1", "button2", "button3", NULL}``. Note
that the last element must be either ``NULL`` or an empty string
(``""``)!

Use ``"\n"`` in the map to insert a **line break**. E.g.
``{"button1", "button2", "\n", "button3", ""}``. Each line's buttons have their
width calculated automatically. So in the example the first row will
have 2 buttons each with 50% width and a second row with 1 button having
100% width.

.. note::
    The number of buttons neither includes the newline elements nor the terminating
    element of the array.

.. raw:: html

   </details> 
   <br>


按钮的数量、它们的位置以及文本是由一个描述符字符串数组来控制的，这个数组被称作 “映射”（map），并传递给:cpp:expr:`lv_buttonmatrix_set_map(btn_matrix, my_map)`函数。一个映射的声明应该形如 ``const char * map[] = {"button1", "button2", "button3", NULL}``。需要注意的是，最后一个元素必须是 ``NULL``或者空字符串(``""``)！

在映射中使用 ``"\n"``来插入一个 **line break**。例如， ``{"button1", "button2", "\n", "button3", ""}``。每一行的按钮宽度会自动计算。所以在这个例子中，第一行将会有 2 个按钮，每个按钮宽度占 50%，第二行有 1 个按钮，其宽度占 100%。

.. note::
    按钮的数量既不包括换行元素，也不包括数组的终止元素。


Button widths（按钮宽度）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The buttons' width can be set in proportion to the width of other buttons in the same
row with :cpp:expr:`lv_buttonmatrix_set_button_width(btn_matrix, button_id, width)` E.g. in a
line with two buttons: *buttonA, width = 1* and *buttonB, width = 2*, *buttonA*
will have 33 % width and *buttonB* will have 66 % width.  This is similar to how the
`"flex-grow" <https://developer.mozilla.org/en-US/docs/Web/CSS/flex-grow>`__
property works in CSS. The width must be in the range [1..15] with the default being 1.

.. raw:: html

   </details> 
   <br>

可以使用:cpp:expr:`lv_buttonmatrix_set_button_width(btn_matrix, button_id, width)`函数按照与同一行中其他按钮宽度的比例来设置按钮的宽度。例如，在一行中有两个按钮：*buttonA，width = 1* 和 *buttonB，width = 2*，那么*buttonA*的宽度将占33%，*buttonB*的宽度将占66%。这与CSS中的 `"flex-grow" <https://developer.mozilla.org/en-US/docs/Web/CSS/flex-grow>`__属性的工作原理类似。宽度必须在[1..15]这个范围内，默认值为1。

Button behavior（按钮行为）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Each button's behavior can be customized with the following control flags:

- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_HIDDEN`: Hides button; it continues to hold its space in layout.
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_NO_REPEAT`: Do not emit :cpp:enumerator:`LV_EVENT_LONG_PRESSED_REPEAT` events while button is long-pressed.
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_DISABLED`: Disables button like :cpp:enumerator:`LV_STATE_DISABLED` on normal Widgets.
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_CHECKABLE`: Enable toggling of :cpp:enumerator:`LV_STATE_CHECKED` when clicked.
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_CHECKED`: Make the button checked. It will use the :cpp:enumerator:`LV_STATE_CHECHKED` styles.
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_CLICK_TRIG`: 1: Enables sending :cpp:enumerator:`LV_EVENT_VALUE_CHANGE` on ``CLICK``, 0: sends :cpp:enumerator:`LV_EVENT_VALUE_CHANGE` on ``PRESS``.
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_POPOVER`: Show button text in a pop-over while being pressed.
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_RECOLOR`: Enable text recoloring with ``#color``
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_CUSTOM_1`: Custom free-to-use flag
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_CUSTOM_2`: Custom free-to-use flag

By default, these flags are disabled.

To set and clear a button's control flags, use

- :cpp:expr:`lv_buttonmatrix_set_button_ctrl(btn_matrix, button_id, LV_BUTTONMATRIX_CTRL_...)` and
- :cpp:expr:`lv_buttonmatrix_clear_button_ctrl(btn_matrix, button_id, LV_BUTTONMATRIX_CTRL_...)`

respectively.  ``button_id`` is a zero-based button index (0 = first button).
``LV_BUTTONMATRIX_CTRL_...`` values can be bit-wise OR-ed together when passed to
these functions.

To set and clear the same control attribute for all buttons in a Button Matrix, use

- :cpp:expr:`lv_buttonmatrix_set_button_ctrl_all(btn_matrix, LV_BUTTONMATRIX_CTRL_...)` and
- :cpp:expr:`lv_buttonmatrix_clear_button_ctrl_all(btn_matrix, LV_BUTTONMATRIX_CTRL_...)`

respectively.

To set a control map for a Button Matrix (similar to `Button map`_), use

- :cpp:expr:`lv_buttonmatrix_set_ctrl_map(btn_matrix, ctrl_map)`.

An element of ``ctrl_map`` should look like
:cpp:expr:`ctrl_map[0] = width | LV_BUTTONMATRIX_CTRL_NO_REPEAT |  LV_BUTTONMATRIX_CTRL_CHECHKABLE`.
The number of elements must be equal to the number of buttons.

.. raw:: html

   </details> 
   <br>


每个按钮的行为都可以通过以下控制标志进行定制：

- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_HIDDEN`: 隐藏按钮；它在布局中仍会保留其所占空间。
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_NO_REPEAT`: 在长按按钮时，不发出:cpp:enumerator:`LV_EVENT_LONG_PRESSED_REPEAT`事件。
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_DISABLED`: 禁用按钮，就如同普通部件上的:cpp:enumerator:`LV_STATE_DISABLED`状态一样。
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_CHECKABLE`: 点击时启用:cpp:enumerator:`LV_STATE_CHECKED`状态的切换。
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_CHECKED`: 使按钮处于选中状态。它将应用:cpp:enumerator:`LV_STATE_CHECHKED`样式。
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_CLICK_TRIG`: 值为1时：在 ``CLICK``操作时发送:cpp:enumerator:`LV_EVENT_VALUE_CHANGE`事件；值为 0 时：在 ``PRESS`` 操作时发送:cpp:enumerator:`LV_EVENT_VALUE_CHANGE` 事件。
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_POPOVER`: 在按下按钮时，在弹出框中显示按钮文本。
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_RECOLOR`: 启用通过 ``#color`` 对文本重新上色的功能。
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_CUSTOM_1`: 可自定义使用的标志
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_CUSTOM_2`: 可自定义使用的标志

默认情况下，所有标志都被禁用。

要设置和清除一个按钮的控制标志，可分别使用以下函数：

- :cpp:expr:`lv_buttonmatrix_set_button_ctrl_all(btn_matrix, LV_BUTTONMATRIX_CTRL_...)` 和
- :cpp:expr:`lv_buttonmatrix_clear_button_ctrl_all(btn_matrix, LV_BUTTONMATRIX_CTRL_...)`

其中， ``button_id`` 是以 0 为起始的按钮索引（0 表示第一个按钮）。将 ``LV_BUTTONMATRIX_CTRL_...`` 的值传递给这些函数时，可以进行按位或运算。

要为按钮矩阵中的所有按钮设置和清除相同的控制属性，可分别使用以下函数：

- :cpp:expr:`lv_buttonmatrix_set_button_ctrl_all(btn_matrix, LV_BUTTONMATRIX_CTRL_...)` 和
- :cpp:expr:`lv_buttonmatrix_clear_button_ctrl_all(btn_matrix, LV_BUTTONMATRIX_CTRL_...)`

要为按钮矩阵设置一个控制映射（类似于 `Button map`_），可使用以下函数：

- :cpp:expr:`lv_buttonmatrix_set_ctrl_map(btn_matrix, ctrl_map)`.

``ctrl_map`` 的一个元素应形如:cpp:expr:`ctrl_map[0] = width | LV_BUTTONMATRIX_CTRL_NO_REPEAT |  LV_BUTTONMATRIX_CTRL_CHECHKABLE`。元素的数量必须与按钮的数量相等。

One check（一次检查）
--------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The "One-checked" feature can be enabled with
:cpp:expr:`lv_buttonmatrix_set_one_checked(btn_matrix, true)` to allow only one button to
be checked at a time.

.. raw:: html

   </details> 
   <br>


可以使用:cpp:expr:`lv_buttonmatrix_set_one_checked(btn_matrix, true)`启用“单选”功能，以便一次只允许一个按钮处于选中状态。


.. _lv_buttonmatrix_events:

Events（事件）
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED`: Sent when a button is pressed/released or
   repeated after long press. The event parameter is set to the ID of
   the pressed/released button.

:cpp:expr:`lv_buttonmatrix_get_selected_button(btn_matrix)` returns the index of the button
most recently released (the button with focus) or :cpp:enumerator:`LV_BUTTONMATRIX_BUTTON_NONE`
if no such button was found.

:cpp:expr:`lv_buttonmatrix_get_button_text(btn_matrix, button_id)` returns a pointer
to the text of the button specified by zero-based index ``button_id``.

.. admonition::  Further Reading

    Learn more about :ref:`lv_obj_events` emitted by all Widgets.

    Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED`: 当按钮被按下/松开，或者在长按后重复触发动作时发送该事件。事件参数被设置为被按下/松开按钮的ID。

:cpp:expr:`lv_buttonmatrix_get_selected_button(btn_matrix)`会返回最近松开的按钮（即获得焦点的按钮）的索引，如果未找到这样的按钮，则返回:cpp:enumerator:`LV_BUTTONMATRIX_BUTTON_NONE`

:cpp:expr:`lv_buttonmatrix_get_button_text(btn_matrix, button_id)` 会返回一个指针，指向由以零为起始的索引 ``button_id``所指定的按钮的文本。

了解更多关于所有部件发出的:ref:`lv_obj_events`的信息。

了解更多关于:ref:`events`的信息。


.. _lv_buttonmatrix_keys:

Keys（按键）
***********

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  ``LV_KEY_RIGHT/UP/LEFT/RIGHT`` To navigate among the buttons to
   select one
-  :cpp:enumerator:`LV_KEY_ENTER` To press/release the selected button

Note that long pressing the Button Matrix with an encoder can mean to
enter/leave edit mode and simply long pressing a button to make it
repeat as well. To avoid this contradiction, add
:cpp:expr:`lv_buttonmatrix_set_button_ctrl_all(btn_matrix, LV_BUTTONMATRIX_CTRL_CLICK_TRIG | LV_BUTTONMATRIX_CTRL_NO_REPEAT)`
to the Button Matrix if used with an encoder.  This disables the repeat feature so
the button will not be activated upon leaving edit mode.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


-  ``LV_KEY_RIGHT/UP/LEFT/RIGHT`` 在矩阵按钮的按钮之间导航来选中不同的按钮。
-  :cpp:enumerator:`LV_KEY_ENTER` 按下/释放所选按钮。

请注意，使用编码器长按按钮矩阵可能意味着进入 / 退出编辑模式，同时也可能仅仅是长按一个按钮使其重复触发动作。为了避免这种矛盾，如果按钮矩阵与编码器一起使用，可向其添加:cpp:expr:`lv_buttonmatrix_set_button_ctrl_all(btn_matrix, LV_BUTTONMATRIX_CTRL_CLICK_TRIG | LV_BUTTONMATRIX_CTRL_NO_REPEAT)`。这样就禁用了重复触发功能，所以在退出编辑模式时按钮不会被激活。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_buttonmatrix_example:

Example
*******

.. include:: ../examples/widgets/buttonmatrix/index.rst

.. _lv_buttonmatrix_api:

API
***
