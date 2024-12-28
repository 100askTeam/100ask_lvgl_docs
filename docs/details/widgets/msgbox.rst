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
If ``parent`` is ``NULL`` the message box will be modal, and will use the
:ref:`default_display`'s Top :ref:`Layer <screen_layers>` as a parent.

.. raw:: html

   </details> 
   <br>


:cpp:expr:`lv_msgbox_create(parent)`用于创建一个消息框。
如果 ``parent``为 ``NULL``，那么该消息框将是模态的，并会使用 :ref:`default_display` 的顶层 :ref:`Layer <screen_layers>` 作为父级对象。

Adding buttons
--------------
.. raw:: html

   <details>
     <summary>显示原文</summary>

If you want to add an [OK] or [Cancel] or other buttons for the
user to have a choice of responses, add each button using the
:cpp:expr:`lv_msgbox_add_footer_button(msgbox, btn_text)` function.  Calling this
function adds a footer (container) if one was not already present, and it returns a
pointer to the button created, which can be used to add ``LV_EVENT_CLICKED`` (or
other) events to detect and act on the user's response.

Footer buttons so added are evenly spaced and centered.

Buttons can also be added to the header if desired with
:cpp:expr:`lv_msgbox_add_header_button(msgbox, symbol)`.
Buttons so added are added to the right end of the header.

.. raw:: html

   </details> 
   <br>

如果你想添加一个 [确定]、[取消] 或其他按钮，以便用户能够进行响应选择，可以使用:cpp:expr:`lv_msgbox_add_footer_button(msgbox, btn_text)`函数来添加各个按钮。调用该函数时，如果之前不存在页脚（容器），则会添加一个，并且它会返回一个指向所创建按钮的指针，该指针可用于添加 ``LV_EVENT_CLICKED``（或其他）事件，以检测用户的响应并据此采取相应行动。

如此添加的页脚按钮会均匀分布且居中显示。

如果需要的话，也可以使用:cpp:expr:`lv_msgbox_add_header_button(msgbox, symbol)`将按钮添加到页眉处。这样添加的按钮会添加到页眉的右端。


Get the parts（获取各个组成部分）
--------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The building blocks of the message box can be obtained using the
following functions:

.. code:: c

   lv_obj_t * lv_msgbox_get_content(lv_obj_t * msgbox);
   lv_obj_t * lv_msgbox_get_title(lv_obj_t * msgbox);
   lv_obj_t * lv_msgbox_get_header(lv_obj_t * msgbox);
   lv_obj_t * lv_msgbox_get_footer(lv_obj_t * msgbox);

Functions that add something to the message box return a pointer to the newly added Widget:

.. code:: c
   lv_obj_t * lv_msgbox_add_text(lv_obj_t * msgbox, const char * text);
   lv_obj_t * lv_msgbox_add_title(lv_obj_t * msgbox, const char * title);
   lv_obj_t * lv_msgbox_add_close_button(lv_obj_t * msgbox);
   lv_obj_t * lv_msgbox_add_header_button(lv_obj_t * msgbox, const void * symbol);
   lv_obj_t * lv_msgbox_add_footer_button(lv_obj_t * msgbox, const char * text);

.. raw:: html

   </details> 
   <br>


消息框的各个组成部分（控件）可以通过以下接口获取：

.. code:: c

   lv_obj_t * lv_msgbox_get_content(lv_obj_t * msgbox);
   lv_obj_t * lv_msgbox_get_title(lv_obj_t * msgbox);
   lv_obj_t * lv_msgbox_get_header(lv_obj_t * msgbox);
   lv_obj_t * lv_msgbox_get_footer(lv_obj_t * msgbox);

那些向消息框中添加内容的函数会返回一个指向新添加部件的指针：

.. code:: c
   lv_obj_t * lv_msgbox_add_text(lv_obj_t * msgbox, const char * text);
   lv_obj_t * lv_msgbox_add_title(lv_obj_t * msgbox, const char * title);
   lv_obj_t * lv_msgbox_add_close_button(lv_obj_t * msgbox);
   lv_obj_t * lv_msgbox_add_header_button(lv_obj_t * msgbox, const void * symbol);
   lv_obj_t * lv_msgbox_add_footer_button(lv_obj_t * msgbox, const char * text);


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

No special events are sent by this Widget, though its parts can send events.
See their documentation for details:  :ref:`lv_button` and :ref:`lv_label`.

.. admonition::  Further Reading

    Learn more about :ref:`lv_obj_events` emitted by all Widgets.

    Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


该部件不会发送特殊事件，不过其各部分可以发送事件。详情请参阅它们的文档：:ref:`lv_button`（按钮相关文档）和 :ref:`lv_label`（标签相关文档）。

.. admonition::  延伸阅读

进一步了解所有部件发出的 :ref:`lv_obj_events`。

进一步了解 :ref:`events`。


.. _lv_msgbox_keys:

Keys（按键）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No *Keys* are processed by Msgbox Widgets.

.. admonition::  Further Reading

    Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>

消息框部件不处理任何 *按键*。

.. admonition::  延伸阅读

进一步了解 :ref:输入设备按键 :ref:`indev_keys`相关内容。


.. _lv_msgbox_example:

Example
*******

.. include:: ../../examples/widgets/msgbox/index.rst

.. _lv_msgbox_api:

API
***
