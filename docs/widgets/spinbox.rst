.. _lv_spinbox:

==============================
Spinbox （旋转框）(lv_spinbox)
==============================

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Spinbox contains a number as text which can be increased or
decreased by *Keys* or API functions. Under the hood the Spinbox is a
modified :ref:`Text area <lv_textarea>`.

.. raw:: html

   </details> 
   <br>


旋转框包含一个数字作为文本，可以增加或 减少 *Keys* 或 API 函数。在引擎盖下，Spinbox 是一个 修改了 :ref:`文本区域 <lv_textarea>`。


.. _lv_spinbox_parts_and_styles:

Parts and Styles（零件和样式）
******************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The parts of the Spinbox are identical to the :ref:`Text area <lv_textarea>`.

.. raw:: html

   </details> 
   <br>


旋转框的各个部分与 :ref:`文本区域 <lv_textarea>` 相同。


Value, range and step（值、范围和步长）
--------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

- :cpp:expr:`lv_spinbox_set_value(spinbox, 1234)` sets a new value on the Spinbox.
- :cpp:expr:`lv_spinbox_increment(spinbox)` and
increments/decrements the value of the Spinbox according to the currently selected digit.
- :cpp:expr:`lv_spinbox_set_range(spinbox, -1000, 2500)` sets a range. If the
value is changed by :cpp:func:`lv_spinbox_set_value`, by
*Keys*,\ ``lv_spinbox_increment/decrement`` this range will be respected.
- :cpp:expr:`lv_spinbox_set_step(spinbox, 100)` sets which digits to change on
increment/decrement. Only multiples of ten can be set, and not for example 3.
- :cpp:expr:`lv_spinbox_set_cursor_pos(spinbox, 1)` sets the cursor to a specific
digit to change on increment/decrement. For example position '0' sets the cursor to the least significant digit.

If an encoder is used as input device, the selected digit is shifted to
the right by default whenever the encoder button is clicked. To change this behaviour to shifting
to the left, the :cpp:expr:`lv_spinbox_set_digit_step_direction(spinbox, LV_DIR_LEFT)` can be used

.. raw:: html

   </details> 
   <br>


- :cpp:expr:`lv_spinbox_set_value(spinbox, 1234)` 在 Spinbox 上设置一个新值。
- :cpp:expr:`lv_spinbox_increment(spinbox)` 和  :cpp:expr:`lv_spinbox_decrement(spinbox)` 根据当前选择的数字递增/递减 Spinbox 的值。
- :cpp:expr:`lv_spinbox_set_range(spinbox, -1000, 2500)` 设置范围。如果值由 :cpp:func:`lv_spinbox_set_value`， *Keys*,\ ``lv_spinbox_increment/decrement`` 键更改，则将遵循此范围。 
- :cpp:expr:`lv_spinbox_set_step(spinbox, 100)` 设置要更改的数字 递增/递减。只能设置 10 的倍数，而不能设置例如 3。 
- :cpp:expr:`lv_spinbox_set_cursor_pos(spinbox, 1)` 将光标设置为特定的数字在increment/decrement递增/递减时更改。例如，位置“0”将光标设置为最低有效数字。

如果将编码器用作输入设备，则所选数字将移至默认情况下，每当单击编码器按钮时，该键都是右键。将此行为更改为转移 在左侧，可以使用 :cpp:expr:`lv_spinbox_set_digit_step_direction(spinbox, LV_DIR_LEFT)` 


Format（格式）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_spinbox_set_digit_format(spinbox, digit_count, separator_position)`
sets the number format. ``digit_count`` is the number of digits
excluding the decimal separator and the sign. is
the number of digits before the decimal point. If 0, no decimal point is displayed.

.. raw:: html

   </details> 
   <br>


:cpp:expr:`lv_spinbox_set_digit_format(spinbox, digit_count, separator_position)` 设置数字格式。 ``digit_count`` 是位不包括小数点分隔符和符号。  ``separator_position`` 是小数点前的位数。如果为 0，则不显示小数点。


Rollover（翻转）
-----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_spinbox_set_rollover(spinbox, true/false)` enables/disabled
rollover mode. If either the minimum or maximum value is reached with
rollover enabled, the value will change to the other limit. If rollover
is disabled the value will remain at the minimum or maximum value.

.. raw:: html

   </details> 
   <br>


:cpp:expr:`lv_spinbox_set_rollover(spinbox, true/false)` 启用/禁用 翻转模式。如果达到最小值或最大值启用展期时，该值将更改为其他限制。如果展期禁用时，该值将保持在最小值或最大值。


.. _lv_spinbox_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` Sent when the value has changed.

See the events of the :ref:`Text area <lv_textarea>` too.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 在值更改时发送。

另请参阅 :ref:`文本区域 <lv_textarea>` 的事件。

详细了解更多 :ref:`events`。


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
-  :cpp:enumerator:`LV_KEY_ENTER` With *Encoder* got the net digit. Jump to the first
   after the last.

.. raw:: html

   </details> 
   <br>


-  ``LV_KEY_LEFT/RIGHT`` 使用 *键盘* 向左/向右移动光标。使用编码器递减/递增所选数字。
-  ``LV_KEY_UP/DOWN`` 带 *键盘* 和 *编码器* 递增/递减值。
-  :cpp:enumerator:`LV_KEY_ENTER` 用 *编码器* 得到净数字。跳转到第一个之后在最后一个。


.. _lv_spinbox_example:

Example
*******

.. include:: ../examples/widgets/spinbox/index.rst

.. _lv_spinbox_api:

API
***
