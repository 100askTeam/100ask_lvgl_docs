.. _layers:

==============
Layers（图层）
==============

.. raw:: html

   <details>
     <summary>显示原文</summary>

In LVGL "layers" can be interpreted in various ways:

1. The order of widget creation naturally creates a layering of widgets
2. Permanent screen-sized layers can be also used
3. For some draw operations LVGL renders a widget and all its children into a buffer (a.k.a. layer) first


在LVGL中，“层”可以有各种不同的解释：

1. 控件创建的顺序自然地创建了控件的层次结构
2. 也可以使用永久的屏幕大小的层
3. 对于一些绘制操作，LVGL首先将一个控件及其所有子控件渲染到一个缓冲区（也称为层）中


.. raw:: html

   </details>
   <br>



.. _layers_creation:

Order of creation（图层顺序）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

By default, LVGL draws new objects on top of old objects.

For example, assume we add a button to a parent object named button1 and
then another button named button2. Then button1 (along with its child
object(s)) will be in the background and can be covered by button2 and
its children.

.. image:: /misc/layers.png

.. code:: c

   /*Create a screen*/
   lv_obj_t * scr = lv_obj_create(NULL, NULL);
   lv_screen_load(scr);          /*Load the screen*/

   /*Create 2 buttons*/
   lv_obj_t * btn1 = lv_button_create(scr, NULL);     /*Create a button on the screen*/
   lv_button_set_fit(btn1, true, true);               /*Enable automatically setting the size according to content*/
   lv_obj_set_pos(btn1, 60, 40);                      /*Set the position of the button*/

   lv_obj_t * btn2 = lv_button_create(scr, btn1);     /*Copy the first button*/
   lv_obj_set_pos(btn2, 180, 80);                     /*Set the position of the button*/

   /*Add labels to the buttons*/
   lv_obj_t * label1 = lv_label_create(btn1, NULL);   /*Create a label on the first button*/
   lv_label_set_text(label1, "Button 1");             /*Set the text of the label*/

   lv_obj_t * label2 = lv_label_create(btn2, NULL);   /*Create a label on the second button*/
   lv_label_set_text(label2, "Button 2");             /*Set the text of the label*/

   /*Delete the second label*/
   lv_obj_delete(label2);

.. raw:: html

   </details>
   <br>


默认情况下，LVGL会在旧对象的顶部绘制新对象。

例如，假设我们将一个按钮添加到名为button1的父对象上，然后再添加另一个名为button2的按钮。那么button1（以及它的子对象）将位于背景中，并且可以被button2及其子对象覆盖。

.. image:: /misc/layers.png

.. code:: c

  创建一个屏幕
  lv_obj_t * scr = lv_obj_create (NULL，NULL);
  lv_screen_load (scr); /*加载屏幕*/

  创建2个按钮
  lv_obj_t * btn1 = lv_button_create (scr, NULL); /*在屏幕上创建一个按钮*/
  lv_button_set_fit (btn1，true，true); /*启用根据内容自动设置大小的功能*/
  lv_obj_set_pos (btn1，60,40); /*设置按钮的位置*/

  lv_obj_t * btn2 = lv_button_create (scr，btn1); /*复制第一个按钮*/
  lv_obj_set_pos (btn2，180,80); /*设置按钮的位置*/

  向按钮添加标签
  lv_obj_t * label1 = lv_label_create (btn1，NULL); /*在第一个按钮上创建一个标签*/
  lv_label_set_text (label1,“Button 1”); /*设置标签的文本*/

  lv_obj_t * label2 = lv_label_create (btn2，NULL); /*在第二个按钮上创建一个标签*/
  lv_label_set_text (label2,“Button 2”); /*设置标签的文本*/

  /*删除第二个标签*/
  lv_obj_delete (label2);


.. _layers_order:

Change order（改变顺序）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

There are four explicit ways to bring an object to the foreground:

- Use :cpp:expr:`lv_obj_move_foreground(obj)` to bring an object to the foreground.
  Similarly, use :cpp:expr:`lv_obj_move_background(obj)` to move it to the background.
- Use :cpp:expr:`lv_obj_move_to_index(obj, idx)` to move an object to a given index in the order of children.

  - ``0``: background
  - ``child_num - 1``: foreground
  - ``< 0``: count from the top, to move forward (up): :cpp:expr:`lv_obj_move_to_index(obj, lv_obj_get_index(obj) - 1)`

- Use :cpp:expr:`lv_obj_swap(obj1, obj2)` to swap the relative layer position of two objects.
- When :cpp:expr:`lv_obj_set_parent(obj, new_parent)` is used, ``obj`` will be on the foreground of the ``new_parent``.

.. raw:: html

   </details>
   <br>


有四种明确的方式将对象置于前景：

- 使用 :cpp:expr:`lv_obj_move_foreground(obj)` 将一个对象置于前景。
  同样，使用 :cpp:expr:`lv_obj_move_background(obj)` 将其移动到背景。
- 使用 :cpp:expr:`lv_obj_move_to_index(obj, idx)` 将一个对象移动到子对象顺序中的给定索引。

  - ``0``: 背景
  - ``child_num - 1``: 前景
  - ``< 0``: 从顶部开始计数，向前移动（向上）: :cpp:expr:`lv_obj_move_to_index(obj, lv_obj_get_index(obj) - 1)`

- 使用 :cpp:expr:`lv_obj_swap(obj1, obj2)` 交换两个对象的相对图层位置。
- 当使用 :cpp:expr:`lv_obj_set_parent(obj, new_parent)` 时， ``obj`` 将置于 ``new_parent`` 的前景。


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


LVGL使用两个特殊的图层，分别是 ``layer_top`` 和 ``layer_sys``。这两个图层在显示器的所有屏幕上是可见且共享的。但是，它们不会在多个物理显示器之间共享。 ``layer_top``始终位于默认屏幕(:cpp:func:`lv_screen_active`)的顶部， ``layer_sys``位于 ``layer_top``的顶部。

要获取这些图层，请使用:cpp:func:`lv_layer_top`和:cpp:func:`lv_layer_sys`。

这些图层和其他任何小部件一样工作，即可以设置样式、滚动，并且可以在上面创建任何类型的小部件。

用户可以使用``layer_top``创建一些在各个地方都可见的内容。例如，菜单栏、弹出窗口等。如果启用了 ``click``属性，则 ``layer_top``将吸收所有用户点击事件，并作为模态框工作。

.. code:: c

   lv_obj_add_flag(lv_layer_top(), LV_OBJ_FLAG_CLICKABLE);

``layer_sys``在LVGL中也用于类似的目的。例如，它将鼠标指针放在所有图层之上，以确保其始终可见。


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


底层与顶层和系统层类似，也具有屏幕大小，但位于活动屏幕的下方。只有当活动屏幕的背景不透明度小于 255 时才可见。

要获取底层，请使用 :cpp:func:`lv_layer_bottom`。


Draw layers（绘制图层）
***********************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Some style properties make LVGL to allocate a buffer and render a widget and its children there first. Later that layer will be merged to the screen or its parent layer after applying some transformations or other modifications.

.. raw:: html

   </details>
   <br>


一些样式属性会让 LVGL 分配一个缓冲区，并首先在那里渲染一个部件及其子部件。
稍后，该层将在应用一些转换或其他修改后，合并到屏幕或其父层。


Simple layer（简单层）
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The following style properties trigger the creation of a "Simple layer":

- ``opa_layered``
- ``bitmap_mask_src``
- ``blend_mode``


In this case widget will be sliced into ``LV_DRAW_SW_LAYER_SIMPLE_BUF_SIZE`` sized chunks.

If there is no memory for a new chunk, LVGL will try allocating layer when an other chunk is rendered and freed.

.. raw:: html

   </details>
   <br>


以下样式属性会触发创建“简单层”：
- ``opa_layered``
- ``bitmap_mask_src``
- ``blend_mode``

在这种情况下，小部件将被切割成大小为 ``LV_DRAW_SW_LAYER_SIMPLE_BUF_SIZE``的块。

如果没有足够的内存来创建一个新的块，LVGL 将尝试在另一个块被渲染并释放时分配图层。


Transformed layer（转换图层）
-----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

When the widget is transformed a larger part of the widget needs to rendered to provide enough data for transformation. LVGL tries to render as small area of the widget as possible, but due to the nature of transformations no slicing is possible in this case.


The following style properties trigger the creation of a "Transform layer":

- ``transform_scale_x``
- ``transform_scale_y``
- ``transform_skew_x``
- ``transform_skew_y``
- ``transform_rotate``

.. raw:: html

   </details>
   <br>


当小部件进行变换时，需要渲染更大部分的小部件以提供足够的变换数据。LVGL尽可能渲染尽可能小的区域，但由于变换的性质，在这种情况下无法进行切片。

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

The ``clip_corner`` style property also makes LVGL to create a 2 layers with radius height for the top and bottom part of the widget.

.. raw:: html

   </details>
   <br>


``clip_corner`` 样式属性还使LVGL创建具有顶部和底部部件的半径高度的2层。


.. _layers_api:

API
***
