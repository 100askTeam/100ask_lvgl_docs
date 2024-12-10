.. _lv_spinbox:

==============================
Spinbox （微调框）(lv_spinbox)
==============================

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Spinbox contains an integer displayed as a decimal number with a possible fixed
decimal point position and a configurable number of digits.  The value can be
increased or decreased by *Keys* or API functions.  Under the hood Spinbox is a
:ref:`lv_textarea` with behaviors extended to enable a numeric value
to be viewed and modified with configurable constraints.

.. raw:: html

   </details> 
   <br>


微调框（Spinbox）包含一个以十进制数形式显示的整数，该整数可能具有固定的小数点位置以及可配置的数位数量。其数值可以通过 *按键* 或应用程序编程接口（API）函数来增加或减少。在底层，微调框是一个:ref:`lv_textarea`（文本输入框），其行为经过扩展，以便能够在可配置的约束条件下查看和修改数值。

.. _lv_spinbox_parts_and_styles:

Parts and Styles（部分和样式）
******************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Spinbox's parts are identical to those of :ref:`Text Area <lv_textarea_parts_and_styles>`.

.. raw:: html

   </details> 
   <br>


微调框（Spinbox）的部件与 :ref:`Text Area <lv_textarea_parts_and_styles>` 控件相同。


Value, range and step（值、范围和步长）
--------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

- :cpp:expr:`lv_spinbox_set_value(spinbox, 1234)` sets a new value on the Spinbox.
- :cpp:expr:`lv_spinbox_increment(spinbox)` and :cpp:expr:`lv_spinbox_decrement(spinbox)`
  increments/decrements the value of the Spinbox according to the currently-selected digit.
- :cpp:expr:`lv_spinbox_set_range(spinbox, -1000, 2500)` sets its range. If the
  value is changed by :cpp:expr:`lv_spinbox_set_value(spinbox)`, by *Keys*,
  by :cpp:expr:`lv_spinbox_increment(spinbox)` or :cpp:expr:`lv_spinbox_decrement(spinbox)`
  this range will be respected.
- :cpp:expr:`lv_spinbox_set_step(spinbox, 100)` sets which digit to change on
  increment/decrement. Only multiples of ten can be set.
- :cpp:expr:`lv_spinbox_set_cursor_pos(spinbox, 1)` sets the cursor to a specific
  digit to change on increment/decrement. Position '0' sets the cursor to
  the least significant digit.

If an encoder is used as input device, the selected digit is shifted to
the right by default whenever the encoder button is clicked. To change this behaviour to shifting
to the left, the :cpp:expr:`lv_spinbox_set_digit_step_direction(spinbox, LV_DIR_LEFT)` can be used

.. raw:: html

   </details> 
   <br>


- :cpp:expr:`lv_spinbox_set_value(spinbox, 1234)` 在 微调框 上设置一个新值。
- :cpp:expr:`lv_spinbox_increment(spinbox)` 和 :cpp:expr:`lv_spinbox_decrement(spinbox)`会根据当前所选数位来增加 / 减少微调框（Spinbox）的值。
- :cpp:expr:`lv_spinbox_set_range(spinbox, -1000, 2500)`用于设置其取值范围。如果通过 :cpp:expr:`lv_spinbox_set_value(spinbox)`、按键操作、:cpp:expr:`lv_spinbox_increment(spinbox)`或者 :cpp:expr:`lv_spinbox_decrement(spinbox)`来改变数值，将会遵循这个取值范围。
- :cpp:expr:`lv_spinbox_set_step(spinbox, 100)`用于设置在进行增加 / 减少操作时要改变的数位。只能设置为 10 的倍数。
- :cpp:expr:`lv_spinbox_set_cursor_pos(spinbox, 1)`可将光标设置到特定数位上，以便在进行增加 / 减少操作时改变该数位的值。位置 “0” 会将光标设置到最低有效数位上。

如果将编码器用作输入设备，则所选数字将移至默认情况下，每当单击编码器按钮时，该键都是右键。将此行为更改为转移 在左侧，可以使用函数 :cpp:expr:`lv_spinbox_set_digit_step_direction(spinbox, LV_DIR_LEFT)` 设置


Format（格式）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_spinbox_set_digit_format(spinbox, digit_count, separator_position)`
sets the number format. ``digit_count`` is the total number of digits to display.
``separator_position`` is the number of leading digits before the decimal point.
Pass 0 for ``separator_position`` to display no decimal point.

.. raw:: html

   </details> 
   <br>


:cpp:expr:`lv_spinbox_set_digit_format(spinbox, digit_count, separator_position)` 设置数字格式。 ``digit_count`` 指的是要显示的数字的总位数。 ``separator_position`` 是小数点前的前导数位的数量。若想不显示小数点，可将 ``separator_position`` 设为 0。


Rollover（翻转）
-----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_spinbox_set_rollover(spinbox, true/false)` enables/disabled
rollover mode. If either the minimum or maximum value is reached with
rollover enabled, and the user attempts to continue changing the value in
the same direction, the value will change to the other limit.  If rollover
is disabled the value will stop at the minimum or maximum value.

.. raw:: html

   </details> 
   <br>


:cpp:expr:`lv_spinbox_set_rollover(spinbox, true/false)`用于启用 / 禁用循环模式。如果启用了循环模式，当达到最小值或最大值时，用户仍试图继续沿相同方向更改数值，那么该数值将会变为另一个极限值（即从最大值变为最小值，或从最小值变为最大值）。如果禁用了循环模式，数值将会在达到最小值或最大值时停止变化。

.. _lv_spinbox_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` Sent when the value has changed.

.. admonition::  Further Reading

    :ref:`Textarea Events <lv_textarea_events>`.

    Learn more about :ref:`lv_obj_events` emitted by all Widgets.

    Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 在值更改时发送。

    :ref:`Textarea Events <lv_textarea_events>`。

    进一步了解所有部件发出的 :ref:`lv_obj_events`（对象事件）。

    深入学习有关 :ref:`events`的更多内容。


.. _lv_spinbox_keys:

Keys（按键）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  ``LV_KEY_LEFT/RIGHT`` With *Keypad* move the cursor left/right. With
   *Encoder* decrement/increment the selected digit.
-  ``LV_KEY_UP/DOWN`` With *Keypad* and *Encoder* increment/decrement
   the value.
- :cpp:enumerator:`LV_KEY_ENTER` With *Encoder*, move focus to next digit.  If focus
  is on last digit, focus moves to first digit.

.. admonition::  Further Reading

    Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


-  ``LV_KEY_LEFT/RIGHT`` 使用 *键盘* 向左/向右移动光标。使用编码器递减/递增所选数字。
-  ``LV_KEY_UP/DOWN`` 带 *键盘* 和 *编码器* 递增/递减值。
- :cpp:enumerator:`LV_KEY_ENTER`使用编码器时，将焦点移动到下一位数字。如果焦点位于最后一位数字上，则焦点会移动到第一位数字处。

    进一步了解有关 :ref:`indev_keys`（indev_keys）的更多内容。
    
.. _lv_spinbox_example:

Example
*******

.. include:: ../examples/widgets/spinbox/index.rst

.. _lv_spinbox_api:

API
***
