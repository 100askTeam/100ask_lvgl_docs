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


消息框充当弹出窗口。它们是从背景容器、标题、可选的关闭按钮、文本和可选按钮构建的 。

文本将自动分解为多行，高度将自动设置为包含文本和按钮。

消息框可以是模态的（阻止对屏幕其余部分的单击） 或者不是模态。


.. _lv_msgbox_parts_and_styles:

Parts and Styles（零件和样式）
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


消息框是从其他小部件构建的，因此您可以选中这些小部件的文档了解详细信息。

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


:cpp:expr:`lv_msgbox_create(parent, title, txt, btn_txts[], add_close_btn)` 创建一个消息框。

如果 ``parent`` 是 ``NULL`` ，则消息框将是模态的。  ``title`` 和 ``txt`` 是标题和文本的字符串。 ``btn_txts[]`` 是一个数组替换为按钮的文本。

例如 :cpp:expr:`const char * btn_txts[] = {"Ok", "Cancel", NULL}`。 ``add_close_btn``  可以是 ``true`` 或 ``false`` 添加/不添加关闭按钮。


Get the parts（获取零件）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The building blocks of the message box can be obtained using the
following functions:

.. raw:: html

   </details> 
   <br>


消息框的构建块可以使用 以下功能：


.. code:: c

   lv_obj_t * lv_msgbox_get_title(lv_obj_t * mbox);
   lv_obj_t * lv_msgbox_get_close_btn(lv_obj_t * mbox);
   lv_obj_t * lv_msgbox_get_text(lv_obj_t * mbox);
   lv_obj_t * lv_msgbox_get_btns(lv_obj_t * mbox);

Close the message box（关闭消息框）
----------------------------------

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


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED`如果其中一个按钮是 点击。 :cpp:enumerator:`LV_OBJ_FLAG_EVENT_BUBBLE`在按钮上启用，因此您可以将事件添加到消息框本身。在事件处理程序中， :cpp:expr:`lv_event_get_target(e)`  将返回按钮矩阵 ，:cpp:expr:`lv_event_get_current_target(e)` 将返回消息框。:cpp:expr:`lv_msgbox_get_active_button(msgbox)` 和 :cpp:expr:`lv_msgbox_get_active_button_text(msgbox)`  可用于获取单击按钮的索引和文本。

详细了解更多 :ref:`事件`。


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


按键对关闭按钮和按钮矩阵有影响。您可以添加它们如果需要，手动添加到组中。。

了解有关 :ref:`indev_按键`的更多信息。


.. _lv_msgbox_example:

Example
*******

.. include:: ../examples/widgets/msgbox/index.rst

.. _lv_msgbox_api:

API
***
