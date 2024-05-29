.. _lv_buttonmatrix:

==========================================
Button matrix（矩阵按钮） (lv_buttonmatrix)
==========================================

Overview（概述）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Button Matrix object is a lightweight way to display multiple
buttons in rows and columns. Lightweight because the buttons are not
actually created but just virtually drawn on the fly. This way, one
button use only eight extra bytes of memory instead of the ~100-150
bytes a normal `Button </widgets/button>`__ object plus the 100 or so bytes
for the `Label </widgets/label>`__ object.

The Button matrix is added to the default group (if one is set). Besides
the Button matrix is an editable object to allow selecting and clicking
the buttons with encoder navigation too.

.. raw:: html

   </details> 
   <br>

矩阵按钮(lv_btnmatrix)控件是一种在行和列中显示多个按钮的轻量级实现方式。按钮不是实际创建出来的，而是实时绘制出来的，所以轻量级，因为这样一个按钮仅使用 8 个字节的内存，而不是普通 `Button </widgets/button>`__ 控件那样：~100-150 字节再加上 `Label </widgets/label>`__ 控件的内存占用。

矩阵按钮添加到默认组（如果之前已设置了组）。此外，矩阵按钮是一个可编辑的对象，可以通过编码器导航选择和单击按钮。


.. _lv_buttonmatrix_parts_and_styles:

Parts and Styles（部分和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` The background of the button matrix, uses the
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

Button's text（按钮的文字）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

There is a text on each button. To specify them a descriptor string
array, called *map*, needs to be used. The map can be set with
:cpp:expr:`lv_buttonmatrix_set_map(buttonm, my_map)`. The declaration of a map should
look like :cpp:expr:`const char * map[] = {"button1", "button2", "button3", NULL}`. Note
that the last element has to be either ``NULL`` or an empty string
(``""``)!

Use ``"\n"`` in the map to insert a **line break**. E.g.
``{"button1", "button2", "\n", "button3", ""}``. Each line's buttons have their
width calculated automatically. So in the example the first row will
have 2 buttons each with 50% width and a second row with 1 button having
100% width.

.. raw:: html

   </details> 
   <br>


每个按钮上都可以有文字。要指定按钮的文字，需要使用称为 *map* 的描述符按钮布局的字符串数组。 map 可以使用 :cpp:expr:`lv_buttonmatrix_set_map(buttonm, my_map)` 接口设置。 map 的格式： :cpp:expr:`const char * map[] = {"button1", "button2", "button3", NULL}`。 请注意，map 数组的最后一个元素必须是 ``NULL``  或空字符串(``""``)!

在 map 中使用 ``"\n"`` 插入 **换行符**。 例如。 ``{"button1", "button2", "\n", "button3", ""}``。 每行按钮的宽度都会自动计算平均分配(默认)。 因此，在上面的示例中，第一行将有 2 个按钮，每个按钮的宽度为 50%，第二行将有 1 个按钮的宽度为 100%。


Control buttons（控制按钮）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The buttons' width can be set relative to the other button in the same
row with :cpp:expr:`lv_buttonmatrix_set_button_width(buttonm, button_id, width)` E.g. in a
line with two buttons: *buttonA, width = 1* and *buttonB, width = 2*, *buttonA*
will have 33 % width and *buttonB* will have 66 % width. It's similar to
how the
`"flex-grow" <https://developer.mozilla.org/en-US/docs/Web/CSS/flex-grow>`__
property works in CSS. The width must be in the [1..15] range and the
default width is 1.

In addition to the width, each button can be customized with the
following parameters:

- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_HIDDEN`: Makes a button hidden (hidden buttons still take up space in the layout, they are just not visible or clickable)
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_NO_REPEAT`: Disable repeating when the button is long pressed
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_DISABLED`: Makes a button disabled Like :cpp:enumerator:`LV_STATE_DISABLED` on normal objects
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_CHECKABLE`: Enable toggling of a button. I.e. :cpp:enumerator:`LV_STATE_CHECKED` will be added/removed as the button is clicked
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_CHECKED`: Make the button checked. It will use the :cpp:enumerator:`LV_STATE_CHECHKED` styles.
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_CLICK_TRIG`: Enabled: send LV_EVENT_VALUE_CHANGE on CLICK, Disabled: send :cpp:enumerator:`LV_EVENT_VALUE_CHANGE` on PRESS
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_POPOVER`: Show the button label in a popover when pressing this key
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_CUSTOM_1`: Custom free to use flag
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_CUSTOM_2`: Custom free to use flag

By default, all flags are disabled.

To set or clear a button's control attribute, use
:cpp:expr:`lv_buttonmatrix_set_button_ctrl(buttonm, button_id, LV_BUTTONMATRIX_CTRL_...)` and
:cpp:expr:`lv_buttonmatrix_clear_button_ctrl(buttonm, button_id, LV_BUTTONMATRIX_CTRL_...)`
respectively. More ``LV_BUTTONMATRIX_CTRL_...`` values can be OR-ed

To set/clear the same control attribute for all buttons of a button
matrix, use :cpp:expr:`lv_buttonmatrix_set_button_ctrl_all(buttonm, LV_BUTTONMATRIX_CTRL_...)`
and :cpp:expr:`lv_buttonmatrix_clear_button_ctrl_all(buttonm, LV_BUTTONMATRIX_CTRL_...)`.

The set a control map for a button matrix (similarly to the map for the
text), use :cpp:expr:`lv_buttonmatrix_set_ctrl_map(buttonm, ctrl_map)`. An element of
``ctrl_map`` should look like
:cpp:expr:`ctrl_map[0] = width | LV_BUTTONMATRIX_CTRL_NO_REPEAT |  LV_BUTTONMATRIX_CTRL_CHECHKABLE`.
The number of elements should be equal to the number of buttons
(excluding newlines characters).

.. raw:: html

   </details> 
   <br>


可以使用 :cpp:expr:`lv_buttonmatrix_set_button_width(buttonm, button_id, width)` 接口设置相对于同一行中的另一个按钮的宽度。 例如。在一行中有两个按钮这样设置：btnA, width = 1 和 btnB, width = 2，这样btnA 将有 33% 的宽度，btnB 将有 66% 的宽度。 它类似于 `"flex-grow" <https://developer.mozilla.org/en-US/docs/Web/CSS/flex-grow>`__ 属性在 CSS 中的工作方式。 宽度必须在 [1..15] 范围内，默认宽度为 1。

除了宽度之外，每个按钮还可以使用以下参数进行自定义：

- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_HIDDEN`: 隐藏按钮（隐藏的按钮仍然占用布局中的空间，它们只是不可见或不可点击）
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_NO_REPEAT`: 长按按钮时禁用重复
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_DISABLED`: 使按钮被禁用，就像普通对象上的 LV_STATE_DISABLED
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_CHECKABLE`: 启用按钮切换。也就是 LV_STATE_CHECHED 将在按钮被点击时添加/删除
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_CHECKED`: 检查按钮。它将使用 LV_STATE_CHECHKED 的样式。
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_CLICK_TRIG`: 启用：在点击时发送 LV_EVENT_VALUE_CHANGE ；禁用：在按下时发送 LV_EVENT_VALUE_CHANGE
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_POPOVER`: 按下此键时在弹出框中显示按钮标签
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_CUSTOM_1`: 可自定义使用的标志
- :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_CUSTOM_2`: 可自定义使用的标志

默认情况下，所有标志都被禁用。

要设置或清除按钮的控制属性，请使用 :cpp:expr:`lv_buttonmatrix_set_button_ctrl(buttonm, button_id, LV_BUTTONMATRIX_CTRL_...)` 和 :cpp:expr:`lv_buttonmatrix_clear_button_ctrl(buttonm, button_id, LV_BUTTONMATRIX_CTRL_...)` 分别。 更多  ``LV_BUTTONMATRIX_CTRL_...`` 值可以被 OR-ed

要为矩阵按钮的所有按钮设置/清除相同的控制属性，请使用 :cpp:expr:`lv_buttonmatrix_set_button_ctrl_all(buttonm, LV_BUTTONMATRIX_CTRL_...)` 和 :cpp:expr:`lv_buttonmatrix_clear_button_ctrl_all(buttonm, LV_BUTTONMATRIX_CTRL_...)`。

我们可以写一个数组来一次单独设置多个或者所有的按钮，这有点像一个控制表，这里称其为 ``ctrl_map`` ，我们可以使用 :cpp:expr:`lv_buttonmatrix_set_ctrl_map(buttonm, ctrl_map)` 将控制表添加到矩阵按钮中。 ``ctrl_map`` 中的元素的格式 :cpp:expr:`ctrl_map[0] = width | LV_BUTTONMATRIX_CTRL_NO_REPEAT |  LV_BUTTONMATRIX_CTRL_CHECHKABLE`，也就是我们可以添加多个属性。 元素的数量应该等于(可以小于，但是不应该超出)按钮的数量(不包括换行符)。


One check（一次检查）
--------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The "One check" feature can be enabled with
:cpp:expr:`lv_buttonmatrix_set_one_checked(buttonm, true)` to allow only one button to
be checked at a time.

.. raw:: html

   </details> 
   <br>


可以使用 :cpp:expr:`lv_buttonmatrix_set_one_checked(buttonm, true)` 启用 “一次检查” 功能，这样一次只能检查一个按钮(我们就能知道最后点击的是哪个按钮)。


.. _lv_buttonmatrix_events:

Events（事件）
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED`: Sent when a button is pressed/released or
   repeated after long press. The event parameter is set to the ID of
   the pressed/released button.

See the events of the :ref:`Base object <lv_obj>` too.

:cpp:expr:`lv_buttonmatrix_get_selected_button(buttonm)` returns the index of the most
recently released or focused button or :cpp:enumerator:`LV_BUTTONMATRIX_BUTTON_NONE` if no
such button.

:cpp:expr:`lv_buttonmatrix_get_button_text(buttonm, button_id)` returns a pointer to the
text of ``button_id``\ th button.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED`: 按下/释放按钮或长按时发送。事件参数设置为按下/释放按钮的ID。

另请参阅 :ref:`基本对象 <lv_obj>` 的事件。

:cpp:expr:`lv_buttonmatrix_get_selected_button(buttonm)` 返回最近被释放或聚焦按钮的索引。如果没有这样的按钮，则 :cpp:enumerator:`LV_BUTTONMATRIX_BUTTON_NONE` 返回最近被释放或聚焦按钮的索引。
按钮。

:cpp:expr:`lv_buttonmatrix_get_button_text(buttonm, button_id)` 返回指向文本 ``button_id``\ 的按钮。

详细了解更多 :ref:`events`。


.. _lv_buttonmatrix_keys:

Keys（按键）
***********

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  ``LV_KEY_RIGHT/UP/LEFT/RIGHT`` To navigate among the buttons to
   select one
-  :cpp:enumerator:`LV_KEY_ENTER` To press/release the selected button

Note that long pressing the button matrix with an encoder can mean to
enter/leave edit mode and simply long pressing a button to make it
repeat as well. To avoid this contradiction it's suggested to add
:cpp:expr:`lv_buttonmatrix_set_button_ctrl_all(buttonm, LV_BUTTONMATRIX_CTRL_CLICK_TRIG | LV_BUTTONMATRIX_CTRL_NO_REPEAT)`
to the button matrix if used with encoder. This way, the pressed button
repeat feature is disabled and on leaving edit mode the selected button
won't be activated.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


-  ``LV_KEY_RIGHT/UP/LEFT/RIGHT`` 在矩阵按钮的按钮之间导航来选中不同的按钮。
-  :cpp:enumerator:`LV_KEY_ENTER` 按下/释放所选按钮。

请注意，长按编码器的矩阵按钮可能意味着进入/退出编辑模式，只需长按一个按钮即可以重复。为了避免这种矛盾，建议添加 :cpp:expr:`lv_buttonmatrix_set_button_ctrl_all(buttonm, LV_BUTTONMATRIX_CTRL_CLICK_TRIG | LV_BUTTONMATRIX_CTRL_NO_REPEAT)` 到矩阵按钮（如果与编码器一起使用）。这样，按下的按钮重复功能被禁用，并且在离开编辑模式时，选择按钮不会被激活。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_buttonmatrix_example:

Example
*******

.. include:: ../examples/widgets/buttonmatrix/index.rst

.. _lv_buttonmatrix_api:

API
***
