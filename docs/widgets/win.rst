.. _lv_win:

========================
Window （窗口）(lv_win)
========================

Overview
**********

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Window is container-like object built from a header with title and
buttons and a content area.

.. raw:: html

   </details> 
   <br>


Window（窗口）是一个类似容器的对象，由带有标题、按钮和内容区域的标题构建而成。


.. _lv_win_parts_and_styles:

Parts and Styles（部分和样式）
********************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Window is built from other widgets so you can check their
documentation for details:

- Background: :ref:`lv_obj`
- Header on the background: :ref:`lv_obj`
- Title on the header: :ref:`lv_label`
- Buttons on the header: :ref:`lv_button`
- Content area on the background: :ref:`lv_obj`

.. raw:: html

   </details> 
   <br>


该窗口是由其他控件构建的，因此可以查看它们的文档以获取详细信息：

- 背景：:ref:`lv_obj`
- 背景标题：:ref:`lv_obj`
- 标题上的标题：:ref:`lv_label`
- 标题上的按钮： :ref:`lv_button`
- 背景内容区：:ref:`lv_obj`


.. _lv_win_usage:

Usage（用法）
***************

Create a Window（创建一个窗口）
-------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_win_create(parent, header_height)` creates a Window with an empty
header.

.. raw:: html

   </details> 
   <br>


:cpp:expr:`lv_win_create(parent, header_height)` 创建一个标题为空的窗口。


Title and buttons（标题和按钮）
--------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Any number of texts (but typically only one) can be added to the header
with :cpp:expr:`lv_win_add_title(win, "The title")`.

Control buttons can be added to the window's header with
:cpp:expr:`lv_win_add_button(win, icon, button_width)`. ``icon`` can be any image
source, and ``button_width`` is the width of the button.

The title and the buttons will be added in the order the functions are
called. So adding a button, a text and two other buttons will result in
a button on the left, a title, and 2 buttons on the right. The width of
the title is set to take all the remaining space on the header. In other
words: it pushes to the right all the buttons that are added after the
title.

.. raw:: html

   </details> 
   <br>


可以使用 :cpp:expr:`lv_win_add_title(win, "The title")` 将任意数量的文本（但通常只有一个）添加到标题中。

可以使用 :cpp:expr:`lv_win_add_button(win, icon, button_width)` 将控制按钮添加到窗口的标题 。 ``icon`` 可以是任何图像源， ``button_width`` 是按钮的宽度。

标题和按钮将按照调用函数的顺序添加。因此，添加一个按钮、一个文本和另外两个按钮将在左侧产生一个按钮，在右侧产生一个标题和两个按钮。标题的宽度设置为占据标题上的所有剩余空间。换句话说： 它将标题后添加的所有按钮推到右侧。

.. _lv_win_get_parts:

Get the parts（获取部分）
**************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_win_get_header(win)` returns a pointer to the header,
:cpp:expr:`lv_win_get_content(win)` returns a pointer to the content container
to which the content of the window can be added.

.. raw:: html

   </details> 
   <br>


:cpp:expr:`lv_win_get_header(win)` 返回一个指向标题的指针，
:cpp:expr:`lv_win_get_content(win)` 返回一个指向可以在窗口添加内容的容器指针。


.. _lv_win_events:

Events（事件）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No special events are sent by the windows, however events can be added
manually to the return value of :cpp:func:`lv_win_add_button`.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


窗口不会发送特殊事件，但是可以手动将事件添加到 :cpp:func:`lv_win_add_button` 的返回值中。

了解有关 :ref:`events` 的更多信息。


.. _lv_win_keys:

Keys
******

.. raw:: html

   <details>
     <summary>显示原文</summary>

No *Keys* are handled by the window.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


窗口不处理任何 *按键* 。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_win_example:

Example
*********

.. include:: ../examples/widgets/win/index.rst

.. _lv_win_api:

API
*****
