.. _lv_msgbox:

=================================
Message box（消息框） (lv_msgbox)
=================================

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Message boxes act as pop-ups. They are built from a background
container, a title, an optional close button, a text and optional
buttons.

The text will be broken into multiple lines automatically and the height
will be set automatically to include the text and the buttons.

The message box can be modal (blocking clicks on the rest of the screen)
or not modal.

.. raw:: html

   </details> 
   <br>


消息框是一个弹出窗口。其是由背景容器、标题、可选的关闭按钮、文本和可选按钮构建的 。

过长的文本会自动分解为多行，高度会自动适应文本和按钮。

消息框可以是模态的（阻止对屏幕其余部分的单击） 或者不是模态的。


.. _lv_msgbox_parts_and_styles:

Parts and Styles（部分和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The message box is built from other widgets, so you can check these
widgets' documentation for details.

- Background: :ref:`lv_obj`
- Close button: :ref:`lv_button`
- Title and text: :ref:`lv_label`
- Buttons: :ref:`lv_buttonmatrix`

.. raw:: html

   </details> 
   <br>


消息框是由多种控件组成的，下面是各个控件（组成）对应的文档：

- 背景： :ref:`lv_obj`
- 关闭按钮： :ref:`lv_button`
- 标题和文本：:ref:`lv_label`
- 按钮：:ref:`lv_buttonmatrix`


.. _lv_msgbox_usage:

Usage（用法）
*************

Create a message box（创建消息框）
---------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_msgbox_create(parent, title, txt, btn_txts[], add_close_btn)`
creates a message box.

If ``parent`` is ``NULL`` the message box will be modal. ``title`` and
``txt`` are strings for the title and the text. ``btn_txts[]`` is an
array with the buttons' text.

E.g. :cpp:expr:`const char * btn_txts[] = {"Ok", "Cancel", NULL}`. 
``add_close_btn`` can be ``true`` or ``false`` to add/don't add a close button.

.. raw:: html

   </details> 
   <br>


可以通过函数 :cpp:expr:`lv_msgbox_create(parent)` 创建一个消息框。

如果参数 ``parent`` 为 ``NULL`` ，那么创建出来的消息框是模态的，反之是非模态的。

通过函数 :cpp:expr:`lv_msgbox_add_title(lv_obj_t *obj, const char *title)` 添加标题。

通过函数 :cpp:expr:`lv_msgbox_add_text(lv_obj_t *obj, const char *title)` 添加中间的提示文本。

通过函数 :cpp:expr:`lv_msgbox_add_close_button(lv_obj_t *obj)` 添加位于右上角的关闭按钮。

通过函数 :cpp:expr:`lv_msgbox_add_footer_button(lv_obj_t *obj, const char *text)` 添加位于底部的用户按钮，可以多次调用，默认会自动按照添加的先后顺序从左到右排列这些按钮。


Get the parts（获取各个组成部分）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The building blocks of the message box can be obtained using the
following functions:

.. raw:: html

   </details> 
   <br>


消息框的各个组成部分（控件）可以通过以下接口获取：


.. code:: c

   lv_obj_t * lv_msgbox_get_title(lv_obj_t * mbox);              // 标题
   lv_obj_t * lv_msgbox_get_close_btn(lv_obj_t * mbox);          // 关闭按钮
   lv_obj_t * lv_msgbox_get_text(lv_obj_t * mbox);               // 提示文本
   lv_obj_t * lv_msgbox_add_footer_button(lv_obj_t * mbox);      // 存放用户按键的容器


Close the message box（关闭消息框）
----------------------------------

如果你要删除消息框，不建议直接调用 :cpp:expr:`lv_obj_delete` 函数进行操作，而是使用 :cpp:expr:`lv_msgbox_close` 函数

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_msgbox_close(msgbox)` closes (deletes) the message box.

.. raw:: html

   </details> 
   <br>


:cpp:expr:`lv_msgbox_close(msgbox)` 关闭（删除）消息框。


.. _lv_msgbox_events:

Events（事件）
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` is sent by the buttons if one of them is
   clicked. :cpp:enumerator:`LV_OBJ_FLAG_EVENT_BUBBLE` is enabled on the buttons so
   you can add events to the message box itself. In the event handler,
   :cpp:expr:`lv_event_get_target(e)` will return the button matrix and
   :cpp:expr:`lv_event_get_current_target(e)` will return the message box.
   :cpp:expr:`lv_msgbox_get_active_button(msgbox)` and
   :cpp:expr:`lv_msgbox_get_active_button_text(msgbox)` can be used to get the
   index and text of the clicked button.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


- 如果其中一个按钮被点击将会触发 :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 事件
- 按钮可以使能 :cpp:enumerator:`LV_OBJ_FLAG_EVENT_BUBBLE` 事件冒泡，之后您可以在消息框本身的事件处理程序中处理事件
- :cpp:expr:`lv_event_get_target(e)`  将返回按钮 ，:cpp:expr:`lv_event_get_current_target(e)` 将返回消息框
- :cpp:expr:`lv_msgbox_get_active_button(msgbox)` 和 :cpp:expr:`lv_msgbox_get_active_button_text(msgbox)`  可用于获取被点击的按钮的索引和文本。

详细了解更多 :ref:`events`。


.. _lv_msgbox_keys:

Keys（按键）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Keys have effect on the close button and button matrix. You can add them
manually to a group if required.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


按键对关闭按钮和用户按钮有影响。如果需要您可以手动添加到组中。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_msgbox_example:

Example
*******

.. include:: ../examples/widgets/msgbox/index.rst

.. _lv_msgbox_api:

API
***
