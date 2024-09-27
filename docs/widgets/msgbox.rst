.. _lv_msgbox:

=================================
Message box（消息框） (lv_msgbox)
=================================

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Message boxes act as pop-ups. They are built from a content area
with a helper to add text, an optional header (which can have
a title, a close button, and other buttons), and an optional footer
with buttons.

The text will be broken into multiple lines and the height
will be set automatically. If the height
is set manually, the content will become scrollable.

The message box can be modal (blocking clicks on the rest of the screen)
or not modal.

.. raw:: html

   </details> 
   <br>


消息框充当弹出窗口。它们由一个内容区域构建而成，该区域有一个辅助工具用于添加文本，一个可选的头部（可以包含标题、关闭按钮和其他按钮），以及一个可选的底部配有按钮。

文本将被自动折行为多行，并且高度将被自动设置。如果手动设置了高度，内容将变为可滚动的。

消息框可以是模态的（阻止对屏幕其余部分的单击） 或者不是模态的。


.. _lv_msgbox_parts_and_styles:

Parts and Styles（部分和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The message box is built from other widgets, so you can check these
widgets' documentation for details.

- Content, header, and footer: :ref:`lv_obj`
- Buttons: :ref:`lv_button`
- Title and content text: :ref:`lv_label`

.. raw:: html

   </details> 
   <br>


消息框是由多种控件组成的，下面是各个控件（组成）对应的文档：

- 内容区域、头部和底部: :ref:`lv_obj`
- 按钮: :ref:`lv_button`
- 标题和内容文本: :ref:`lv_label`


.. _lv_msgbox_usage:

Usage（用法）
*************

Create a message box（创建消息框）
---------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_msgbox_create(parent)` creates a message box.
If ``parent`` is ``NULL`` the message box will be modal.

.. raw:: html

   </details> 
   <br>


:cpp:expr:`lv_msgbox_create(parent)` 用于创建一个消息框。
如果 ``parent`` 是 ``NULL``，则消息框将变为模态的。

Get the parts（获取各个组成部分）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The building blocks of the message box can be obtained using the
following functions:

.. code:: c

   lv_obj_t * lv_msgbox_get_content(lv_obj_t * obj);
   lv_obj_t * lv_msgbox_get_title(lv_obj_t * obj);
   lv_obj_t * lv_msgbox_get_header(lv_obj_t * obj);
   lv_obj_t * lv_msgbox_get_footer(lv_obj_t * obj);

   Functions that add something to the message box return the newly added object:

.. code:: c
   lv_obj_t * lv_msgbox_add_text(lv_obj_t * obj, const char * text);
   lv_obj_t * lv_msgbox_add_title(lv_obj_t * obj, const char * title);
   lv_obj_t * lv_msgbox_add_close_button(lv_obj_t * obj);
   lv_obj_t * lv_msgbox_add_header_button(lv_obj_t * obj, const void * icon);
   lv_obj_t * lv_msgbox_add_footer_button(lv_obj_t * obj, const char * text);

.. raw:: html

   </details> 
   <br>


消息框的各个组成部分（控件）可以通过以下接口获取：

.. code:: c

   lv_obj_t * lv_msgbox_get_content(lv_obj_t * obj);
   lv_obj_t * lv_msgbox_get_title(lv_obj_t * obj);
   lv_obj_t * lv_msgbox_get_header(lv_obj_t * obj);
   lv_obj_t * lv_msgbox_get_footer(lv_obj_t * obj);

   向消息框添加内容的函数会返回新添加的对象：

.. code:: c
   lv_obj_t * lv_msgbox_add_text(lv_obj_t * obj, const char * text);
   lv_obj_t * lv_msgbox_add_title(lv_obj_t * obj, const char * title);
   lv_obj_t * lv_msgbox_add_close_button(lv_obj_t * obj);
   lv_obj_t * lv_msgbox_add_header_button(lv_obj_t * obj, const void * icon);
   lv_obj_t * lv_msgbox_add_footer_button(lv_obj_t * obj, const char * text);


Close the message box（关闭消息框）
----------------------------------

如果你要删除消息框，不建议直接调用 :cpp:expr:`lv_obj_delete` 函数进行操作，而是使用 :cpp:expr:`lv_msgbox_close` 函数

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_msgbox_close(msgbox)` closes (deletes) the message box.

:cpp:expr:`lv_msgbox_close_async(msgbox)` closes (deletes) the message box
asynchronously. This is useful if you want the message box to close the on
the next call to ``lv_timer_handler`` instead of immediately.

.. raw:: html

   </details> 
   <br>


:cpp:expr:`lv_msgbox_close(msgbox)` 关闭（删除）消息框。

:cpp:expr:`lv_msgbox_close_async(msgbox)` 异步关闭（删除）消息框。这在如果你想要在下一次调用 ``lv_timer_handler`` 时而不是立即关闭消息框时非常有用。

.. _lv_msgbox_events:

Events（事件）
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No special events are sent by this widget.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


这个控件不会发送特殊事件。

详细了解更多 :ref:`events`。


.. _lv_msgbox_keys:

Keys（按键）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No *Keys* are processed by the object type.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


对象类型不处理任何按键。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_msgbox_example:

Example
*******

.. include:: ../examples/widgets/msgbox/index.rst

.. _lv_msgbox_api:

API
***
