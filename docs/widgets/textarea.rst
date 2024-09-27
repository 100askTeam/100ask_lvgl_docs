.. _lv_textarea:

=================================
Text area（文本框） (lv_textarea)
=================================

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Text Area is a `Base object </widgets/obj.html>`__ with a
`Label </widgets/label.html>`__ and a cursor on it. Texts or characters
can be added to it. Long lines are wrapped and when the text becomes
long enough the Text area can be scrolled.

One line mode and password modes are supported.

.. raw:: html

   </details> 
   <br>


文本框是一个 `基础对象 </widgets/obj.html>`__ ，其上面有一个 `标签(Label) </widgets/label.html>`__ 和一个光标(cursor)。 我们可以向文本框中添加文本或字符。 长行会被换行，当文本内容变得足够长时(文本框可视区域容纳不下时)，可以滚动文本框。

支持单行输入模式和密码输入模式。


.. _lv_textarea_parts_and_styles:

Parts and Styles（部分和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` The background of the text area. Uses all the
   typical background style properties and the text related style
   properties including ``text_align`` to align the text to the left,
   right or center.
-  :cpp:enumerator:`LV_PART_SCROLLBAR` The scrollbar that is shown when the text is
   too long.
-  :cpp:enumerator:`LV_PART_SELECTED` Determines the style of the :ref:`selected
   text <lv_label_text_selection>`. Only ``text_color`` and
   ``bg_color`` style properties can be used. ``bg_color`` should be set
   directly on the label of the text area.
-  :cpp:enumerator:`LV_PART_CURSOR` Marks the position where the characters are
   inserted. The cursor's area is always the bounding box of the current
   character. A block cursor can be created by adding a background color
   and background opacity to :cpp:enumerator:`LV_PART_CURSOR`\ 's style. The create
   line cursor leave the cursor transparent and set a left border. The
   ``anim_time`` style property sets the cursor's blink time.
-  :cpp:enumerator:`LV_PART_TEXTAREA_PLACEHOLDER` Unique to Text Area, allows styling
   the placeholder text.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_PART_MAIN` 文本框的背景。使用所有组件都有的典型的背景样式属性和与文本相关的样式属性（包括 ``text_align`` ）将文本向左、向右或居中对齐。

-  :cpp:enumerator:`LV_PART_SCROLLBAR` 文本内容过长时显示的滚动条。

-  :cpp:enumerator:`LV_PART_SELECTED` 确定 :ref:`选定文本 <lv_label_text_selection>` (label)的样式。只能使用 ``text_color`` 和 ``bg_color`` 样式属性。 ``bg_color`` 会直接应用在文本框的标签上。

-  :cpp:enumerator:`LV_PART_CURSOR` 字符插入位置的光标。光标的区域始终是当前字符的边界框。可以通过 ``anim_time`` 样式属性设置光标的闪烁时间。

-  :cpp:enumerator:`LV_PART_TEXTAREA_PLACEHOLDER` 文本占位符，文本框独有的部分。可以通过这部分设置文本占位符的样式。


.. _lv_textarea_usage:

Usage（用法）
*************

Add text（添加文本）
-------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can insert text or characters to the current cursor's position with:

-  :cpp:expr:`lv_textarea_add_char(textarea, 'c')`
-  :cpp:expr:`lv_textarea_add_text(textarea, "insert this text")`

To add wide characters like ``'á'``, ``'ß'`` or CJK characters use
:cpp:expr:`lv_textarea_add_text(ta, "á")`.

:cpp:expr:`lv_textarea_set_text(ta, "New text")` changes the whole text.

.. raw:: html

   </details> 
   <br>


您可以使用以下接口在光标的当前位置插入文本或字符：

-  :cpp:expr:`lv_textarea_add_char(textarea, 'c')`
-  :cpp:expr:`lv_textarea_add_text(textarea, "insert this text")`

要添加宽字符，如 ``'á'``, ``'ß'`` 或 CJK 字符，请使用接口 :cpp:expr:`lv_textarea_add_text(ta, "á")`。

:cpp:expr:`lv_textarea_set_text(ta, "New text")` 会改变(清空再覆盖)文本框中的所有内容。


Placeholder（占位符）
-----------

.. raw:: html

   <details>
     <summary>显示原文</summary>

A placeholder text can be specified

- which is displayed when the Text area is empty
- with :cpp:expr:`lv_textarea_set_placeholder_text(ta, "Placeholder text")`

.. raw:: html

   </details> 
   <br>


您可以通过接口 :cpp:expr:`lv_textarea_set_placeholder_text(ta, "Placeholder text")` 指定占位符文本，当文本框的内容为空时，所设置的占位符文本将会展示出来。


Delete character（删除字符）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To delete a character from the left of the current cursor position use
:cpp:expr:`lv_textarea_delete_char(textarea)`.

To delete from the right use :cpp:expr:`lv_textarea_delete_char_forward(textarea)`

.. raw:: html

   </details> 
   <br>


要删除光标左侧的字符，请使用 :cpp:expr:`lv_textarea_delete_char(textarea)`。 

要从光标右侧删除字符，请使用 :cpp:expr:`lv_textarea_delete_char_forward(textarea)`。


Move the cursor（移动光标）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The cursor position can be modified directly like
:cpp:expr:`lv_textarea_set_cursor_pos(textarea, 10)`. The ``0`` position means
"before the first characters", :cpp:enumerator:`LV_TA_CURSOR_LAST` means "after the
last character"

You can step the cursor with

- :cpp:expr:`lv_textarea_cursor_right(textarea)`
- :cpp:expr:`lv_textarea_cursor_left(textarea)`
- :cpp:expr:`lv_textarea_cursor_up(textarea)`
- :cpp:expr:`lv_textarea_cursor_down(textarea)`

If :cpp:expr:`lv_textarea_set_cursor_click_pos(textarea, true)` is applied the
cursor will jump to the position where the Text area was clicked.

.. raw:: html

   </details> 
   <br>


光标的位置可以使用函数 :cpp:expr:`lv_textarea_set_cursor_pos(textarea, 10)` 直接修改。 第二个参数为你要指定的光标的位置，要注意的是： ``0`` 表示将光标移动到 “第一个字符之前”，:cpp:enumerator:`LV_TEXTAREA_CURSOR_LAST` 表示将光标移动到 “最后一个字符之后”

您可以使用下面这些接口函数修改光标位置：

- :cpp:expr:`lv_textarea_cursor_right(textarea)` 上
- :cpp:expr:`lv_textarea_cursor_left(textarea)` 下
- :cpp:expr:`lv_textarea_cursor_up(textarea)` 左
- :cpp:expr:`lv_textarea_cursor_down(textarea)` 右

如果设置了 :cpp:expr:`lv_textarea_set_cursor_click_pos(textarea, true)` 那光标会跟随触摸跳转位置(在文本框范围内)


Hide the cursor（隐藏光标）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The cursor is always visible, however it can be a good idea to style it
to be visible only in :cpp:enumerator:`LV_STATE_FOCUSED` state.

.. raw:: html

   </details> 
   <br>


一般情况下光标始终可见，但最好将其样式设置为仅在 :cpp:enumerator:`LV_STATE_FOCUSED` 状态下(聚焦状态)可见。


One line mode（单行模式）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Text area can be configured to be on a single line with
:cpp:expr:`lv_textarea_set_one_line(textarea, true)`. In this mode the height is
set automatically to show only one line, line break characters are
ignored, and word wrap is disabled.

.. raw:: html

   </details> 
   <br>


可以使用 :cpp:expr:`lv_textarea_set_one_line(textarea, true)` 将文本框配置为单行输入模式。 在这个模式下，高度自动设置为仅显示一行，忽略换行符，并禁用自动换行。


Password mode（密码模式）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The text area supports password mode which can be enabled with
:cpp:expr:`lv_textarea_set_password_mode(textarea, true)`.

By default, if the ``•`` (`Bullet,
U+2022 <http://www.fileformat.info/info/unicode/char/2022/index.htm>`__)
character exists in the font, the entered characters are converted to it
after some time or when a new character is entered. If ``•`` does not
exist in the font, ``*`` will be used. You can override the default
character with :cpp:expr:`lv_textarea_set_password_bullet(textarea, "x")`.

In password mode :cpp:expr:`lv_textarea_get_text(textarea)` returns the actual
text entered, not the bullet characters.

The visibility time can be adjusted with :c:macro:`LV_TEXTAREA_DEF_PWD_SHOW_TIME` in ``lv_conf.h``.

.. raw:: html

   </details> 
   <br>


文本框支持密码模式，可以通过 :cpp:expr:`lv_textarea_set_password_mode(textarea, true)`.启用该模式。

如果字体中存在 ``•`` (`Bullet,U+2022 <http://www.fileformat.info/info/unicode/char/2022/index.htm>`__)字符，则将输入的字符会在一定时间后或者输入新字符时自动转换为该字符。 如果 ``•`` 不存在， ``*`` 将被使用。您可以覆盖字符带有 :cpp:expr:`lv_textarea_set_password_bullet（textarea，“x”）` 的默认值。

在密码模式下 :cpp:expr:`lv_textarea_get_text(textarea)` 返回的是输入的实际文本，而不是 ``•`` 字符。

密码模式下，实际输入文本的可见时间可以通过 ``lv_conf.h`` 中的 :c:macro:`LV_TEXTAREA_DEF_PWD_SHOW_TIME` 进行调整。


Accepted characters（字符白名单）
--------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can set a list of accepted characters with
:cpp:expr:`lv_textarea_set_accepted_chars(textarea, "0123456789.+-")`. Other
characters will be ignored.

.. raw:: html

   </details> 
   <br>


您可以使用 :cpp:expr:`lv_textarea_set_accepted_chars(textarea, "0123456789.+-")` 设置可接受字符列表(白名单)。输入其他字符将被忽略。


Max text length（设置文本长度）
------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The maximum number of characters can be limited with
:cpp:expr:`lv_textarea_set_max_length(textarea, max_char_num)`

.. raw:: html

   </details> 
   <br>


可以使用 :cpp:expr:`lv_textarea_set_max_length(textarea, max_char_num)` 设置文本框可容纳的最大字符数


Very long texts（超长文本）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If there is a very long text in the Text area (e.g. > 20k characters),
scrolling and drawing might be slow. However, by enabling
:c:macro:`LV_LABEL_LONG_TXT_HINT` in ``lv_conf.h`` the performance can be
hugely improved. This will save some additional information about the
label to speed up its drawing. Using :c:macro:`LV_LABEL_LONG_TXT_HINT` the
scrolling and drawing will as fast as with "normal" short texts.

.. raw:: html

   </details> 
   <br>


如果文本框中有很长的文本（例如 > 20k 个字符），可能会导致滚动和绘制速度很慢。 但是，如果在 ``lv_conf.h`` 中启用 :c:macro:`LV_LABEL_LONG_TXT_HINT` 那么这个问题可以得到很好的改善。 这将会保存有关标签(label)的一些附加信息以加快其绘制速度。 使用 :c:macro:`LV_LABEL_LONG_TXT_HINT` 后，其滚动和绘制速度将与 “普通” 的短文本一样快。


Select text（选择文本）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Any part of the text can be selected if enabled with
:cpp:expr:`lv_textarea_set_text_selection(textarea, true)`. This works much like
when you select text on your PC with your mouse.

.. raw:: html

   </details> 
   <br>


如果使用函数 :cpp:expr:`lv_textarea_set_text_selection(textarea, true)` 启用文本选择功能，则可以选择文本的任何部分。这和我们使用鼠标在电脑上选择文字非常相似。


.. _lv_textarea_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_INSERT` Sent right before a character or text is
   inserted. The event parameter is the text about to be inserted.
   :cpp:expr:`lv_textarea_set_insert_replace(textarea, "New text")` replaces the
   text to insert. The new text cannot be in a local variable which is
   destroyed when the event callback exists. ``""`` means do not insert
   anything.
-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` Sent when the content of the text area has
   been changed.
-  :cpp:enumerator:`LV_EVENT_READY` Sent when :cpp:enumerator:`LV_KEY_ENTER` is pressed (or sent) to
   a one line text area.

See the events of the :ref:`Base object <lv_obj>` too.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_INSERT` 在插入字符或文本之前发送该事件。 事件参数是即将插入的文本。可以通过接口 :cpp:expr:`lv_textarea_set_insert_replace(textarea, "New text")` 将要计划插入的文本替换为其他文本。 注意替换的新文本不能是局部变量，也就是不能在回调函数中直接创建局部变量保存新文本。 ``""`` 表示不插入任何内容。
-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 当文本框的内容被改变时发送该事件。
-  :cpp:enumerator:`LV_EVENT_READY` 在按下 :cpp:enumerator:`LV_KEY_ENTER` 按键时发送到单行文本框。

参见 :ref:`Base object <lv_obj>` 的事件。

详细了解更多 :ref:`events`。


.. _lv_textarea_keys:

Keys（按键）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  ``LV_KEY_UP/DOWN/LEFT/RIGHT`` Move the cursor
-  ``Any character`` Add the character to the current cursor position

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


-  ``LV_KEY_UP/DOWN/LEFT/RIGHT`` 移动光标
-  ``任意字符`` 将字符添加到当前光标位置

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_textarea_example:

Example
*******

.. include:: ../examples/widgets/textarea/index.rst

.. _lv_textarea_api:

API
***
