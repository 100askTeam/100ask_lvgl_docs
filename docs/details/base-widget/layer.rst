.. _layers:

==============
Layers（图层）
==============

.. raw:: html

   <details>
     <summary>显示原文</summary>

When the term "layer" is used in LVGL documentation, it may refer to one of several
things:

1.  for Widgets, the :ref:`layers_creation` creates a natural layering of Widgets;
2.  in the context of pixel rendering (drawing), there are :ref:`draw_layers`;
3.  permanent :ref:`screen_layers` are part of each :ref:`display` object, and
    are covered :ref:`here <screen_layers>`

#1 and #2 are covered below.

.. raw:: html

   </details>
   <br>


当术语“layer”在LVGL文档中使用时，它可能指以下几种情况：

1. 对于Widgets，:ref:`layers_creation` 创建了一种Widgets的自然分层；
2. 在像素渲染（绘图）的上下文中，有:ref:`draw_layers`；
3. 永久的:ref:`screen_layers` 是每个:ref:`display` 对象的一部分，并且在:ref:`here <screen_layers>` 中有所介绍。

#1 和 #2 在下文中涵盖。


.. _layers_creation:

Order of Creation（图层顺序）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

By default, LVGL draws new Widgets on top of old Widgets.

For example, assume we add a button to a parent Widget named button1 and
then another button named button2. Then button1 (along with its child
Widget(s)) will be in the background and can be covered by button2 and
its children.

.. image:: /misc/layers.png

.. code-block:: c

   /* Create a screen */
   lv_obj_t * scr = lv_obj_create(NULL, NULL);
   lv_screen_load(scr);          /* Load the screen */

   /* Create 2 buttons */
   lv_obj_t * btn1 = lv_button_create(scr, NULL);     /* Create a button on the screen */
   lv_button_set_fit(btn1, true, true);               /* Enable automatically setting the size according to content */
   lv_obj_set_pos(btn1, 60, 40);                      /* Set the position of the button */

   lv_obj_t * btn2 = lv_button_create(scr, btn1);     /* Copy the first button */
   lv_obj_set_pos(btn2, 180, 80);                     /* Set the position of the button */

   /* Add labels to the buttons */
   lv_obj_t * label1 = lv_label_create(btn1, NULL);   /* Create a label on the first button */
   lv_label_set_text(label1, "Button 1");             /* Set the text of the label */

   lv_obj_t * label2 = lv_label_create(btn2, NULL);   /* Create a label on the second button */
   lv_label_set_text(label2, "Button 2");             /* Set the text of the label */

   /* Delete the second label */
   lv_obj_delete(label2);

.. raw:: html

   </details>
   <br>


默认情况下，LVGL会将新的Widgets绘制在旧的Widgets之上。

例如，假设我们在名为button1的父Widget上添加一个按钮，然后再添加另一个名为button2的按钮。那么，button1（及其子Widget）将处于背景中，并可能被button2及其子Widget覆盖。

.. image:: /misc/layers.png

.. code-block:: c

   /* 创建一个屏幕 */
   lv_obj_t * scr = lv_obj_create(NULL, NULL);
   lv_screen_load(scr);          /* 加载屏幕 */

   /* 创建两个按钮 */
   lv_obj_t * btn1 = lv_button_create(scr, NULL);     /* 在屏幕上创建一个按钮 */
   lv_button_set_fit(btn1, true, true);               /* 启用根据内容自动设置大小 */
   lv_obj_set_pos(btn1, 60, 40);                      /* 设置按钮的位置 */

   lv_obj_t * btn2 = lv_button_create(scr, btn1);     /* 复制第一个按钮 */
   lv_obj_set_pos(btn2, 180, 80);                     /* 设置按钮的位置 */

   /* 为按钮添加标签 */
   lv_obj_t * label1 = lv_label_create(btn1, NULL);   /* 在第一个按钮上创建一个标签 */
   lv_label_set_text(label1, "Button 1");             /* 设置标签的文本 */

   lv_obj_t * label2 = lv_label_create(btn2, NULL);   /* 在第二个按钮上创建一个标签 */
   lv_label_set_text(label2, "Button 2");             /* 设置标签的文本 */

   /* 删除第二个标签 */
   lv_obj_delete(label2);


.. _layers_order:

Changing Order（改变顺序）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

There are four explicit ways to bring a Widget to the foreground:

- Use :cpp:expr:`lv_obj_move_foreground(widget)` to bring a Widget to the foreground.
  Similarly, use :cpp:expr:`lv_obj_move_background(widget)` to move it to the background.
- Use :cpp:expr:`lv_obj_move_to_index(widget, idx)` to move a Widget to a given index in the order of children.

  - ``0``: background
  - ``child_num - 1``: foreground
  - ``< 0``: count from the top, to move forward (up): :cpp:expr:`lv_obj_move_to_index(widget, lv_obj_get_index(widget) - 1)`

- Use :cpp:expr:`lv_obj_swap(widget1, widget2)` to swap the relative layer position of two Widgets.
- When :cpp:expr:`lv_obj_set_parent(widget, new_parent)` is used, ``widget`` will be on the foreground of ``new_parent``.

.. raw:: html

   </details>
   <br>


有四种明确的方法可以将Widget置于前景：

- 使用:cpp:expr:`lv_obj_move_foreground(widget)`将Widget移至前景。
  类似地，使用:cpp:expr:`lv_obj_move_background(widget)`将其移至背景。
- 使用:cpp:expr:`lv_obj_move_to_index(widget, idx)`将Widget移动到子节点顺序中的指定索引位置。

  - ``0``: 背景
  - ``child_num - 1``: 前景
  - ``< 0``: 从顶部开始计数，向前（上）移动，例如:cpp:expr:`lv_obj_move_to_index(widget, lv_obj_get_index(widget) - 1)`

- 使用:cpp:expr:`lv_obj_swap(widget1, widget2)`交换两个Widgets的相对层次位置。
- 当使用:cpp:expr:`lv_obj_set_parent(widget, new_parent)`时，``widget``将在``new_parent``的前景中。


Screen-like layers（屏幕状的层次）
**********************************
.. _layers_top_and_sys:

Top and sys layers（顶层和系统层）
---------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL uses two special layers named ``layer_top`` and ``layer_sys``. Both
are visible and common on all screens of a display. **They are not,
however, shared among multiple physical displays.** The ``layer_top`` is
always on top of the default screen (:cpp:func:`lv_screen_active`), and
``layer_sys`` is on top of ``layer_top``.

The get these layers use :cpp:func:`lv_layer_top` and :cpp:func:`lv_layer_sys`.

These layers work like any other widget, meaning the can be styles, scrolled,
and any kind of widgets can be created on them.

The ``layer_top`` can be used by the user to create some content visible
everywhere. For example, a menu bar, a pop-up, etc. If the ``click``
attribute is enabled, then ``layer_top`` will absorb all user clicks and
acts as a modal.

.. code:: c

   lv_obj_add_flag(lv_layer_top(), LV_OBJ_FLAG_CLICKABLE);

The ``layer_sys`` is also used for similar purposes in LVGL. For
example, it places the mouse cursor above all layers to be sure it's
always visible.

.. raw:: html

   </details>
   <br>


LVGL使用了两个特殊的层，分别是``layer_top``和``layer_sys``。这两个层在显示器的所有屏幕上都是可见且通用的。**但它们并不会在多个物理显示器之间共享。** ``layer_top``始终位于默认屏幕(:cpp:func:`lv_screen_active`)之上，而``layer_sys``则位于``layer_top``之上。

可以使用:cpp:func:`lv_layer_top`和:cpp:func:`lv_layer_sys`获取这些层。

这些层的工作方式与其他Widget类似，这意味着它们可以设置样式、滚动，并且可以在其上创建任何类型的Widget。

``layer_top``可供用户创建一些在所有地方都可见的内容。例如，一个菜单栏、弹出窗口等。如果启用了``click``属性，那么``layer_top``将吸收所有用户点击，并作为一个模态窗口。

.. code:: c

   lv_obj_add_flag(lv_layer_top(), LV_OBJ_FLAG_CLICKABLE);

``layer_sys``在LVGL中也被用作类似用途。例如，它将鼠标光标置于所有层之上，以确保它始终可见。


.. _layers_bottom:

Bottom layers（底层）
---------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Similarly top and sys. layer bottom layer is also screen size but
it's located below the active screen. It's visible only if the active screen's
background opacity is < 255.

The get the bottom layer use :cpp:func:`lv_layer_bottom`.

.. raw:: html

   </details>
   <br>


与顶层和系统层类似，底层也具有屏幕大小，但位于活动屏幕的下方。只有当活动屏幕的背景不透明度小于 255 时才可见。

要获取底层，请使用 :cpp:func:`lv_layer_bottom`。

.. _draw_layers:

Draw Layers（绘制图层）
***********************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Some style properties cause LVGL to allocate a buffer and render a Widget and its
children there first.  Later that layer will be merged to the screen or its parent
layer after applying some transformations or other modifications.

.. raw:: html

   </details>
   <br>


一些样式属性会让 LVGL 分配一个缓冲区，并首先在那里渲染一个控件及其子部件。
之后，该层将在应用一些转换或其他修改后，被合并到屏幕或其父层。


Simple Layer（简单层）
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The following style properties trigger the creation of a "Simple Layer":

- ``opa_layered``
- ``bitmap_mask_src``
- ``blend_mode``

In this case the Widget will be sliced into ``LV_DRAW_SW_LAYER_SIMPLE_BUF_SIZE``
sized chunks.

If there is no memory for a new chunk, LVGL will try allocating the layer after
another chunk is rendered and freed.

.. raw:: html

   </details>
   <br>


以下样式属性会触发创建“简单层”：

- ``opa_layered``
- ``bitmap_mask_src``
- ``blend_mode``

在这种情况下，控件将被切割成大小为 ``LV_DRAW_SW_LAYER_SIMPLE_BUF_SIZE`` 的块。

如果没有足够的内存来创建一个新的块，LVGL 将尝试在另一个块被渲染并释放时分配图层。


Transformed Layer（转换图层）
-----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

When the widget is transformed a larger part of the Widget needs to rendered to
provide enough data for transformation.  LVGL tries to render as small area of the
widget as possible, but due to the nature of transformations no slicing is possible
in this case.

The following style properties trigger the creation of a "Transform Layer":

- ``transform_scale_x``
- ``transform_scale_y``
- ``transform_skew_x``
- ``transform_skew_y``
- ``transform_rotate``

.. raw:: html

   </details>
   <br>


当控件进行变换时，需要渲染更大部分的控件以提供足够的数据用于变换。LVGL会尝试尽可能小地渲染控件的区域，但由于变换的性质，在这种情况下无法进行切片。

以下样式属性会触发创建“变换层”：

- ``transform_scale_x``
- ``transform_scale_y``
- ``transform_skew_x``
- ``transform_skew_y``
- ``transform_rotate``


Clip corner（夹角）
-------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The ``clip_corner`` style property also causes LVGL to create a 2 layers with radius
height for the top and bottom parts of the Widget.

.. raw:: html

   </details>
   <br>


``clip_corner`` 样式属性也会使 LVGL 为控件的顶部和底部创建具有半径高度的两层。
。


.. _layers_api:

API
***
