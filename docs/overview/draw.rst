.. _drawing:

==============
Drawing（绘画）
==============

.. raw:: html

   <details>
     <summary>显示原文</summary>

With LVGL, you don't need to draw anything manually. Just create objects
(like buttons, labels, arc, etc.), move and change them, and LVGL will
refresh and redraw what is required.

However, it can be useful to have a basic understanding of how drawing
happens in LVGL to add customization, make it easier to find bugs or
just out of curiosity.

The basic concept is to not draw directly onto the display but rather to
first draw on an internal draw buffer. When a drawing (rendering) is
ready that buffer is copied to the display.

The draw buffer can be smaller than a display's size. LVGL will simply
render in "tiles" that fit into the given draw buffer.

This approach has two main advantages compared to directly drawing to
the display:

1. It avoids flickering while the layers of the UI are
   drawn. For example, if LVGL drew directly onto the display, when drawing
   a *background + button + text*, each "stage" would be visible for a short time.
2. It's faster to modify a buffer in internal RAM and
   finally write one pixel only once than reading/writing the display
   directly on each pixel access. (e.g. via a display controller with SPI interface).

Note that this concept is different from "traditional" double buffering
where there are two display sized frame buffers: one holds the current
image to show on the display, and rendering happens to the other
(inactive) frame buffer, and they are swapped when the rendering is
finished. The main difference is that with LVGL you don't have to store
two frame buffers (which usually requires external RAM) but only smaller
draw buffer(s) that can easily fit into internal RAM.

.. raw:: html

   </details>
   <br>


使用LVGL，您不需要手动绘制任何内容。只需创建对象（如按钮、标签、弧线等），移动和改变它们，LVGL将自动刷新和重绘所需内容。

然而，了解LVGL中绘图的基本概念可能会很有用，以便进行自定义、更容易发现错误或仅出于好奇。

基本概念是不直接在显示器上绘制，而是先在一个内部绘图缓冲区上绘制。当绘图（渲染）完成后，将该缓冲区复制到显示器上。

绘图缓冲区可以比显示器的尺寸小。LVGL将在给定的绘图缓冲区内按“瓷砖”形式进行渲染。

与直接在显示器上绘制相比，这种方法有两个主要优势：

1. 在绘制UI的各个层时，避免了闪烁。例如，如果LVGL直接在显示器上绘制，在绘制"背景+按钮+文本"时，每个“阶段”都会短暂可见。
2. 在内部RAM中修改缓冲区并一次只写入一个像素要比在每次像素访问时直接读/写显示器更快。（例如，通过带有SPI接口的显示控制器）。

请注意，这个概念与“传统”的双缓冲概念不同，传统的双缓冲中有两个与显示器尺寸相同的帧缓冲区：
一个保存当前要显示在显示器上的图像，另一个（非活动的）帧缓冲区用于渲染，当渲染完成后它们会进行交换。
主要区别在于，使用LVGL时您不需要存储两个帧缓冲区（通常需要外部RAM），而只需要较小的绘图缓冲区也可以轻松装入内部RAM。


.. _drawing_screen_refresh:

Mechanism of screen refreshing（屏幕刷新机制）
*********************************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Be sure to get familiar with the `Buffering modes of LVGL </porting/display>`__ first.

LVGL refreshes the screen in the following steps:

1. Something happens
in the UI which requires redrawing. For example, a button is pressed, a
chart is changed, an animation happened, etc.

2. LVGL saves the changed object's old and new area into a buffer, called an *Invalid area
   buffer*. For optimization, in some cases, objects are not added to the buffer:

  - Hidden objects are not added.
  - Objects completely out of their parent are not added.
  - Areas partially out of the parent are cropped to the parent's area.
  - Objects on other screens are not added.

3. In every :c:macro:`LV_DEF_REFR_PERIOD` (set in ``lv_conf.h``) the
   following happens:

  - LVGL checks the invalid areas and joins those that are adjacent or intersecting.
  - Takes the first joined area, if it's smaller than the *draw buffer*, then simply renders the area's content
    into the *draw buffer*. If the area doesn't fit into the buffer, draw as many lines as possible to the *draw buffer*.
  - When the area is rendered, call ``flush_cb`` from the display driver to refresh the display.
  - If the area was larger than the buffer, render the remaining parts too.
  - Repeat the same with remaining joined areas.

When an area is redrawn the library searches the top-most object which
covers that area and starts drawing from that object. For example, if a
button's label has changed, the library will see that it's enough to
draw the button under the text and it's not necessary to redraw the
display under the rest of the button too.

The difference between buffering modes regarding the drawing mechanism
is the following:

1. **One buffer** - LVGL needs to wait for :cpp:func:`lv_display_flush_ready` (called from ``flush_cb``) before starting to redraw the next part.
2. **Two buffers** - LVGL can immediately draw to the second buffer when the first is sent to ``flush_cb`` because the
   flushing should be done by DMA (or similar hardware) in the background.
3. **Double buffering** - ``flush_cb`` should only swap the addresses of the frame buffers.

.. raw:: html

   </details>
   <br>


请确保先熟悉LVGL的 `Buffering modes </porting/display>`__。

LVGL刷新屏幕的步骤如下：

1. UI中发生了一些需要重绘的事件。例如，按下一个按钮，图表发生变化，动画发生等。

2. LVGL将变化后的对象的旧区域和新区域保存到一个缓冲区中，称为“无效区域缓冲区”。为了优化，在某些情况下，对象不会添加到缓冲区中：

   - 隐藏的对象不会添加。
   - 完全超出其父对象的对象不会添加。
   - 部分超出父对象的区域会被裁剪到父对象的区域。
   - 在其他屏幕上的对象不会添加。

3. 每隔一段时间（在 ``lv_conf.h`` 中设置的 :c:macro:`LV_DEF_REFR_PERIOD`）进行以下操作：

   - LVGL检查无效区域，并将相邻或相交的区域合并。
   - 如果第一个合并的区域小于“绘制缓冲区”，则将该区域的内容简单地呈现到“绘制缓冲区”中。如果该区域无法容纳到缓冲区中，则尽可能多地绘制到“绘制缓冲区”中。
   - 渲染完区域后，从显示驱动程序调用 ``flush_cb`` 来刷新显示。
   - 如果区域超过了缓冲区的大小，则继续渲染剩余部分。
   - 对于剩余的合并区域，重复相同的过程。

当重新绘制区域时，库会查找覆盖该区域的最顶层对象，并从该对象开始绘制。例如，如果按钮的标签发生了变化，库将看到只需在文本下方绘制按钮，而不需要重新绘制按钮其余部分下方的内容。

关于绘制机制，缓冲区模式之间的区别如下：

1. **单缓冲区** - LVGL在开始重绘下一部分之前需要等待 :cpp:func:`lv_display_flush_ready` （从 ``flush_cb`` 中调用）。
2. **双缓冲区** - LVGL可以在第一个缓冲区被发送给 ``flush_cb`` 后立即绘制到第二个缓冲区，因为刷新应该由DMA（或类似的硬件）在后台进行。
3. **双缓冲技术** - ``flush_cb`` 应该仅交换帧缓冲区的地址。


.. _drawing_masking:

Masking（蒙版）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

*Masking* is the basic concept of LVGL's draw engine. To use LVGL it's
not required to know about the mechanisms described here but you might
find interesting to know how drawing works under hood. Knowing about
masking comes in handy if you want to customize drawing.

To learn about masking let's see the steps of drawing first. LVGL
performs the following steps to render any shape, image or text. It can
be considered as a drawing pipeline.

1. **Prepare the draw descriptors** Create a draw descriptor from an
   object's styles (e.g. :cpp:struct:`lv_draw_rect_dsc_t`). This gives us the
   parameters for drawing, for example colors, widths, opacity, fonts,
   radius, etc.
2. **Call the draw function** Call the draw function with the draw
   descriptor and some other parameters (e.g. :cpp:func:`lv_draw_rect`). It
   will render the primitive shape to the current draw buffer.
3. **Create masks** If the shape is very simple and doesn't require
   masks, go to #5. Otherwise, create the required masks in the draw
   function. (e.g. a rounded rectangle mask)
4. **Calculate all the added mask** It composites opacity values into a
   *mask buffer* with the "shape" of the created masks. E.g. in case of
   a "line mask" according to the parameters of the mask, keep one side
   of the buffer as it is (255 by default) and set the rest to 0 to
   indicate that this side should be removed.
5. **Blend a color or image** During blending, masking (make some pixels
   transparent or opaque), blending modes (additive, subtractive, etc.)
   and color/image opacity are handled.

LVGL has the following built-in mask types which can be calculated and
applied real-time:

- :cpp:enumerator:`LV_DRAW_MASK_TYPE_LINE`: Removes a side from a
  line (top, bottom, left or right). :cpp:func:`lv_draw_line` uses four instances
  of it. Essentially, every (skew) line is bounded with four line masks
  forming a rectangle.
- :cpp:enumerator:`LV_DRAW_MASK_TYPE_RADIUS`: Removes the inner or
  outer corners of a rectangle with a radiused transition. It's also used
  to create circles by setting the radius to large value
  (:c:macro:`LV_RADIUS_CIRCLE`)
- :cpp:enumerator:`LV_DRAW_MASK_TYPE_ANGLE`: Removes a circular
  sector. It is used by :cpp:func:`lv_draw_arc` to remove the "empty" sector.
- :cpp:enumerator:`LV_DRAW_MASK_TYPE_FADE`: Create a vertical fade (change opacity)
- :cpp:enumerator:`LV_DRAW_MASK_TYPE_MAP`: The mask is stored in a bitmap array and the
  necessary parts are applied

Masks are used to create almost every basic primitive:

- **letters**: Create a mask from the letter and draw a rectangle with the letter's color using the mask.
- **line**: Created from four "line masks" to mask out the left, right, top and bottom part of the line to get a perfectly perpendicular perimeter.
- **rounded rectangle**: A mask is created real-time to add a radius to the corners.
- **clip corner**: To clip overflowing content (usually children) on rounded corners, a rounded rectangle mask is also applied.
- **rectangle border**: Same as a rounded rectangle but the inner part is masked out too.
- **arc drawing**: A circular border is drawn but an arc mask is applied too.
- **ARGB images**: The alpha channel is separated into a mask and the image is drawn as a normal RGB image.

.. raw:: html

   </details>
   <br>


*遮罩* 是LVGL绘图引擎的基本概念。使用LVGL时不需要了解这里描述的机制，但如果您想自定义绘图，了解绘图工作原理可能会很有趣。了解遮罩对于自定义绘图非常有用。

为了学习遮罩，我们首先来看一下绘图的步骤。LVGL执行以下步骤来渲染任何形状、图像或文本。它可以被视为一个绘图管道。

1. **准备绘图描述符**：从对象的样式（例如 :cpp:struct:`lv_draw_rect_dsc_t`）创建绘图描述符。这给我们提供了绘图的参数，例如颜色、宽度、不透明度、字体、半径等。
2. **调用绘图函数**：使用绘图描述符和其他一些参数（例如 :cpp:func:`lv_draw_rect`）调用绘图函数。它将把基本形状渲染到当前的绘图缓冲区。
3. **创建遮罩**：如果形状非常简单，不需要遮罩，就转到步骤#5。否则，在绘图函数中创建所需的遮罩（例如圆角矩形遮罩）。
4. **计算所有添加的遮罩**：它将不透明度值与创建的遮罩的“形状”合成到 *遮罩缓冲区* 中。例如，对于“线遮罩”，根据遮罩的参数，保持缓冲区的一侧不变（默认为255），将其余部分设置为0，表示应该移除该侧。
5. **混合颜色或图像**：在混合过程中，处理遮罩（使某些像素透明或不透明）、混合模式（添加、减去等）和颜色/图像的不透明度。

LVGL具有以下内置的遮罩类型，可以实时计算和应用：

- :cpp:enumerator:`LV_DRAW_MASK_TYPE_LINE`： 从线条中删除一侧（上、下、左或右）。:cpp:func:`lv_draw_line` 使用了它的四个实例。基本上，每个（倾斜）线条都由四个线遮罩组成，形成一个矩形。
- :cpp:enumerator:`LV_DRAW_MASK_TYPE_RADIUS`： 根据半径将矩形的内部或外部的角删除，从而创建出圆角过渡效果。将半径设置为较大的值（:c:macro:`LV_RADIUS_CIRCLE`），也可用于创建圆。
- :cpp:enumerator:`LV_DRAW_MASK_TYPE_ANGLE`： 删除一个圆形扇区。:cpp:func:`lv_draw_arc` 使用它来删除“空”扇区。
- :cpp:enumerator:`LV_DRAW_MASK_TYPE_FADE`：创建一个垂直渐变（改变不透明度）。
- :cpp:enumerator:`LV_DRAW_MASK_TYPE_MAP`：遮罩存储在位图数组中，并应用必要的部分。

遮罩用于创建几乎所有基本的图形元素：

- **字母**：从字母创建一个遮罩，并使用遮罩以字母颜色绘制矩形。
- **线条**：由四个“线遮罩”创建，用于遮掩线条的左、右、上、下部分，以得到完全垂直的周长。
- **圆角矩形**：实时创建一个遮罩，为角添加了半径。
- **剪切角**：为了在圆角上裁剪溢出的内容（通常是子元素），也会应用一个圆角矩形遮罩。
- **矩形边框**：与圆角矩形相同，但内部部分也被遮罩掉。
- **弧绘制**：绘制一个圆形边框，但也应用了一个弧形遮罩。
- **ARGB图像**：将Alpha通道分离为遮罩，并将图像绘制为普通的RGB图像。


Using masks（使用遮罩）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Every mask type has a related parameter structure to describe the mask's
data. The following parameter types exist:

- :cpp:type:`lv_draw_mask_line_param_t`
- :cpp:type:`lv_draw_mask_radius_param_t`
- :cpp:type:`lv_draw_mask_angle_param_t`
- :cpp:type:`lv_draw_mask_fade_param_t`
- :cpp:type:`lv_draw_mask_map_param_t`

1. Initialize a mask parameter with ``lv_draw_mask_<type>_init``. See
   ``lv_draw_mask.h`` for the whole API.
2. Add the mask parameter to the draw engine with
   ``int16_t mask_id =`` :cpp:expr:`lv_draw_mask_add(&param, ptr)`. ``ptr`` can be
   any pointer to identify the mask, (``NULL`` if unused).
3. Call the draw functions
4. Remove the mask from the draw engine with
   :cpp:expr:`lv_draw_mask_remove_id(mask_id)` or
   :cpp:expr:`lv_draw_mask_remove_custom(ptr)`.
5. Free the parameter with :cpp:expr:`lv_draw_mask_free_param(&param)`.

A parameter can be added and removed any number of times, but it needs
to be freed when not required anymore.

:cpp:func:`lv_draw_mask_add` saves only the pointer of the mask so the parameter
needs to be valid while in use.

.. raw:: html

   </details>
   <br>


每种遮罩类型都有一个相关的参数结构来描述遮罩的数据。以下是存在的参数类型：

- :cpp:type:`lv_draw_mask_line_param_t`
- :cpp:type:`lv_draw_mask_radius_param_t`
- :cpp:type:`lv_draw_mask_angle_param_t`
- :cpp:type:`lv_draw_mask_fade_param_t`
- :cpp:type:`lv_draw_mask_map_param_t`

1. 使用 ``lv_draw_mask_<type>_init`` 初始化遮罩参数。查看 ``lv_draw_mask.h`` 获取整体API。
2. 用 ``int16_t mask_id =`` :cpp:expr:`lv_draw_mask_add(&param, ptr)` 将遮罩参数添加到绘图引擎。 ``ptr`` 可以是任何用来标识遮罩的指针（如果未使用则为 ``NULL``）。
3. 调用绘图函数
4. 用 :cpp:expr:`lv_draw_mask_remove_id(mask_id)` 或 :cpp:expr:`lv_draw_mask_remove_custom(ptr)` 从绘图引擎中移除遮罩。
5. 用 :cpp:expr:`lv_draw_mask_free_param(&param)` 释放参数。

一个参数可以被添加和移除任意次数，但当不再需要时需要释放。

:cpp:func:`lv_draw_mask_add` 只保存了遮罩的指针，因此参数在使用时需要有效。


.. _drawing_hooks:

Hook drawing（挂钩绘图）
************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Although widgets can be easily customized by styles there might be cases
when something more custom is required. To ensure a great level of
flexibility LVGL sends a lot of events during drawing with parameters
that tell what LVGL is about to draw. Some fields of these parameters
can be modified to draw something else or any custom drawing operations
can be added manually.

A good use case for this is the :ref:`Button matrix <lv_buttonmatrix>`
widget. By default, its buttons can be styled in different states, but
you can't style the buttons one by one. However, an event is sent for
every button and you can, for example, tell LVGL to use different colors
on a specific button or to manually draw an image on some buttons.

Each of these events is described in detail below.

.. raw:: html

   </details>
   <br>


尽管控件可以通过样式轻松自定义，但在某些情况下可能需要更多的自定义内容。
为了确保高度的灵活性，LVGL在绘制过程中发送了大量事件，其中包含参数，告诉LVGL即将要绘制什么。
这些参数的一些字段可以被修改以绘制其他内容，或者可以手动添加任何自定义的绘图操作。

对于这一点的一个很好的应用案例是 :ref:`Button matrix <lv_buttonmatrix>` 控件。
默认情况下，它的按钮可以在不同状态下进行样式设置，但无法逐个设置按钮的样式。
然而，对于每个按钮都会发送一个事件，例如，您可以告诉LVGL在特定按钮上使用不同的颜色，或者在某些按钮上手动绘制图像。

下面将详细描述每一个事件。

.. _drawing_hooks_main:

Main drawing（主图）
--------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

These events are related to the actual drawing of an object. E.g. the
drawing of buttons, texts, etc. happens here.

:cpp:expr:`lv_event_get_draw_ctx(event)` can be used to get the current draw ctx
and in that structure is the clip area. The clip area is required in draw functions to make them draw only
on a limited area.

.. raw:: html

   </details>
   <br>


这些事件与对象的实际绘制有关。 例如，按钮、文本等的绘制在这里发生。

:cpp:expr:`lv_event_get_draw_ctx(event)` 可用于获取当前的绘图上下文，并且在该结构中有裁剪区域。
裁剪区域在绘制函数中是必需的，以使它们仅在有限的区域内绘制。


LV_EVENT_DRAW_MAIN_BEGIN
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Sent before starting to draw an object. This is a good place to add
masks manually. E.g. add a line mask that "removes" the right side of an
object.

.. raw:: html

   </details>
   <br>


在开始绘制一个对象之前发送。这是一个手动添加遮罩的好地方。例如，可以添加一个线条遮罩来“移除”对象的右侧。


LV_EVENT_DRAW_MAIN
^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>
   
The actual drawing of an object happens in this event. E.g. a rectangle
for a button is drawn here. First, the widgets' internal events are
called to perform drawing and after that you can draw anything on top of
them. For example you can add a custom text or an image.

.. raw:: html

   </details>
   <br>


这个事件发生时，实际上是绘制了一个对象。比如，一个按钮的矩形在这里被绘制。
首先，控件的内部事件被调用来执行绘制，之后你可以在它们上面绘制任何东西。
例如，你可以添加自定义文本或图像。


LV_EVENT_DRAW_MAIN_END
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Called when the main drawing is finished. You can draw anything here as
well and it's also a good place to remove any masks created in
:cpp:enumerator:`LV_EVENT_DRAW_MAIN_BEGIN`.

.. raw:: html

   </details>
   <br>


当主要绘制完成时调用。您可以在这里绘制任何内容，同时这也是在 :cpp:enumerator:`LV_EVENT_DRAW_MAIN_BEGIN` 中创建的任何遮罩进行移除的好地方。

.. _drawing_hooks_post:

Post drawing（后绘制）
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Post drawing events are called when all the children of an object are
drawn. For example LVGL use the post drawing phase to draw scrollbars
because they should be above all of the children.

:cpp:expr:`lv_event_get_draw_ctx(event)` can be used to get the current draw ctx
and in that structure is the clip area. The clip area is required in draw functions to make them draw only
on a limited area.

.. raw:: html

   </details>
   <br>


后绘制事件在对象的所有子对象绘制完成后被调用。例如，LVGL使用后绘制阶段来绘制滚动条，因为它们应该位于所有子对象之上。

可以使用 :cpp:expr:`lv_event_get_draw_ctx(event)` 来获取当前的绘制上下文，在该结构中包含了裁剪区域。绘制函数需要使用裁剪区域限制绘制的区域。


LV_EVENT_DRAW_POST_BEGIN
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Sent before starting the post draw phase. Masks can be added here too to
mask out the post drawn content.

.. raw:: html

   </details>
   <br>


在开始后绘制阶段之前发送。在这里也可以添加遮罩来屏蔽后绘制的内容。


LV_EVENT_DRAW_POST
^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

The actual drawing should happen here.

.. raw:: html

   </details>
   <br>


实际的绘制应该在这里进行。


LV_EVENT_DRAW_POST_END
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Called when post drawing has finished. If masks were not removed in
:cpp:enumerator:`LV_EVENT_DRAW_MAIN_END` they should be removed here.

.. raw:: html

   </details>
   <br>


在绘制完成后调用。如果在 :cpp:enumerator:`LV_EVENT_DRAW_MAIN_END` 事件中没有移除遮罩，则应在此处移除。


.. _drawing_hooks_parts:

Part drawing（零件绘图）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

When LVGL draws a part of an object (e.g. a slider's indicator, a
table's cell or a button matrix's button) it sends events before and
after drawing that part with some context of the drawing. This allows
changing the parts on a very low level with masks, extra drawing, or
changing the parameters that LVGL is planning to use for drawing.

In these events an :cpp:struct:`lv_obj_draw_part_dsc_t` structure is used to describe
the context of the drawing. Not all fields are set for every part and
widget. To see which fields are set for a widget refer to the widget's
documentation.

:cpp:struct:`lv_obj_draw_part_dsc_t` has the following fields:

.. code:: c

    typedef struct {
        lv_draw_ctx_t * draw_ctx;           /**< Draw context*/
        const lv_obj_class_t * class_p;     /**< The class that sent the event */
        uint32_t type;                      /**< The type if part being draw. Element of `lv_<name>_draw_part_type_t` */
        lv_area_t * draw_area;              /**< The area of the part being drawn*/
        lv_draw_rect_dsc_t *
        rect_dsc;      /**< A draw descriptor that can be modified to changed what LVGL will draw. Set only for rectangle-like parts*/
        lv_draw_label_dsc_t *
        label_dsc;    /**< A draw descriptor that can be modified to changed what LVGL will draw. Set only for text-like parts*/
        lv_draw_line_dsc_t *
        line_dsc;      /**< A draw descriptor that can be modified to changed what LVGL will draw. Set only for line-like parts*/
        lv_draw_img_dsc_t  *
        img_dsc;       /**< A draw descriptor that can be modified to changed what LVGL will draw. Set only for image-like parts*/
        lv_draw_arc_dsc_t  *
        arc_dsc;       /**< A draw descriptor that can be modified to changed what LVGL will draw. Set only for arc-like parts*/
        const lv_point_t *
        p1;              /**< A point calculated during drawing. E.g. a point of chart or the center of an arc.*/
        const lv_point_t * p2;        /**< A point calculated during drawing. E.g. a point of chart.*/
        char * text;                  /**< A text calculated during drawing. Can be modified. E.g. tick labels on a chart axis.*/
        uint32_t text_length;         /**< Size of the text buffer containing null-terminated text string calculated during drawing.*/
        uint32_t part;                /**< The current part for which the event is sent*/
        uint32_t id;                  /**< The index of the part. E.g. a button's index on button matrix or table cell index.*/
        int32_t radius;            /**< E.g. the radius of an arc (not the corner radius).*/
        int32_t value;                /**< A value calculated during drawing. E.g. Chart's tick line value.*/
        const void * sub_part_ptr;    /**< A pointer the identifies something in the part. E.g. chart series. */
    } lv_obj_draw_part_dsc_t;

:cpp:expr:`lv_event_get_draw_part_dsc(event)` can be used to get a pointer to
:cpp:struct:`lv_obj_draw_part_dsc_t`.

.. raw:: html

   </details>
   <br>


当LVGL绘制对象的一部分时（例如滑块的指示器，表格的单元格或按钮矩阵的按钮），它在绘制该部分之前和之后发送事件，并携带一些绘制的上下文信息。这样可以通过遮罩、额外绘制或更改LVGL计划用于绘制的参数，在非常低的级别上更改这些部分。

在这些事件中，使用 :cpp:struct:`lv_obj_draw_part_dsc_t` 结构来描述绘制的上下文。并非所有的部分和控件都设置了所有字段。要查看哪些字段为控件设置了，请参考控件的文档。

:cpp:struct:`lv_obj_draw_part_dsc_t` 有以下字段：

.. code:: c

    typedef struct {
        lv_draw_ctx_t * draw_ctx;           /**< 绘制上下文 */
        const lv_obj_class_t * class_p;     /**< 发送事件的类 */
        uint32_t type;                      /**< 要绘制的部分的类型，属于`lv_<name>_draw_part_type_t`的元素 */
        lv_area_t * draw_area;              /**< 正在绘制的部分的区域 */
        lv_draw_rect_dsc_t *
        rect_dsc;      /**< 绘制描述符，可用于修改LVGL将要绘制的内容。仅适用于类似矩形的部分 */
        lv_draw_label_dsc_t *
        label_dsc;    /**< 绘制描述符，可用于修改LVGL将要绘制的内容。仅适用于类似文本的部分 */
        lv_draw_line_dsc_t *
        line_dsc;      /**< 绘制描述符，可用于修改LVGL将要绘制的内容。仅适用于类似线条的部分 */
        lv_draw_img_dsc_t  *
        img_dsc;       /**< 绘制描述符，可用于修改LVGL将要绘制的内容。仅适用于类似图像的部分 */
        lv_draw_arc_dsc_t  *
        arc_dsc;       /**< 绘制描述符，可用于修改LVGL将要绘制的内容。仅适用于类似弧线的部分 */
        const lv_point_t *
        p1;              /**< 在绘制过程中计算的点。例如图表的一个点或弧线的中心 */
        const lv_point_t * p2;        /**< 在绘制过程中计算的点。例如图表的一个点 */
        char * text;                  /**< 在绘制过程中计算的文本。可修改。例如图表轴上的刻度标签 */
        uint32_t text_length;         /**< 在绘制过程中计算的包含以空字符结尾的文本字符串的文本缓冲区的大小 */
        uint32_t part;                /**< 当前发送事件的部分 */
        uint32_t id;                  /**< 部分的索引。例如按钮矩阵上的按钮索引或表格单元格索引 */
        int32_t radius;            /**< 弧线的半径（而不是圆角半径） */
        int32_t value;                /**< 在绘制过程中计算的值。例如图表的刻度线值 */
        const void * sub_part_ptr;    /**< 指向部分中某个内容的指针。例如图表系列 */
    } lv_obj_draw_part_dsc_t;

可以使用 :cpp:expr:`lv_event_get_draw_part_dsc(event)` 来获取指向 :cpp:struct:`lv_obj_draw_part_dsc_t` 的指针。


LV_EVENT_DRAW_PART_BEGIN
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Start the drawing of a part. This is a good place to modify the draw
descriptors (e.g.  ``rect_dsc``), or add masks.

.. raw:: html

   </details>
   <br>


开始绘制一个部分。这是修改绘图描述符（例如 ``rect_dsc``）或添加遮罩的好地方。


LV_EVENT_DRAW_PART_END
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Finish the drawing of a part. This is a good place to draw extra content
on the part or remove masks added in :cpp:enumerator:`LV_EVENT_DRAW_PART_BEGIN`.

.. raw:: html

   </details>
   <br>


完成一个部分的绘制。这是在零件上绘制额外内容或移除在 :cpp:enumerator:`LV_EVENT_DRAW_PART_BEGIN` 中添加的遮罩的好地方。


.. _drawing_hooks_others:

Others（其他）
--------------

LV_EVENT_COVER_CHECK
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

This event is used to check whether an object fully covers an area or
not.

:cpp:expr:`lv_event_get_cover_area(event)` returns a pointer to an area to check
and :cpp:expr:`lv_event_set_cover_res(event, res)` can be used to set one of
these results:

- :cpp:enumerator:`LV_COVER_RES_COVER`: the area is fully covered by the object
- :cpp:enumerator:`LV_COVER_RES_NOT_COVER`: the area is not covered by the object
- :cpp:enumerator:`LV_COVER_RES_MASKED`: there is a mask on the object, so it does not fully cover the area

Here are some reasons why an object would be unable to fully cover an
area:

- It's simply not fully in area
- It has a radius
- It doesn't have 100% background opacity
- It's an ARGB or chroma keyed image
- It does not have normal blending mode. In this case LVGL needs to know the
  colors under the object to apply blending properly
- It's a text, etc

In short if for any reason the area below an object is visible than the
object doesn't cover that area.

Before sending this event LVGL checks if at least the widget's
coordinates fully cover the area or not. If not the event is not called.

You need to check only the drawing you have added. The existing
properties known by a widget are handled in its internal events. E.g. if
a widget has > 0 radius it might not cover an area, but you need to
handle ``radius`` only if you will modify it and the widget won't know
about it.

.. raw:: html

   </details>
   <br>


这个事件用于检查一个对象是否完全覆盖了一个区域。

:cpp:expr:`lv_event_get_cover_area(event)` 返回一个指针，指向要检查的区域，而 :cpp:expr:`lv_event_set_cover_res(event, res)` 可以用来设置这些结果中的一个：

- :cpp:enumerator:`LV_COVER_RES_COVER`：该区域被对象完全覆盖
- :cpp:enumerator:`LV_COVER_RES_NOT_COVER`：该区域未被对象覆盖
- :cpp:enumerator:`LV_COVER_RES_MASKED`：对象上有一个遮罩，所以它并未完全覆盖该区域

以下是一些导致对象无法完全覆盖一个区域的原因：

- 它没有完全位于该区域内
- 它具有一定的半径
- 它的背景透明度没有达到100%
- 它是一个ARGB或色度键控图像
- 它没有正常的混合模式。在这种情况下，LVGL需要知道对象下方的颜色以正确应用混合
- 它是一段文本等等

简而言之，如果由于任何原因对象下方的区域可见，则该对象并未覆盖该区域。

在发送此事件之前，LVGL会检查控件的坐标是否完全覆盖了该区域。如果不是，则不会调用该事件。

您只需要检查您添加的绘图。控件已知的现有属性在其内部事件中处理。例如，如果控件的半径大于0，则可能无法覆盖一个区域，但只有在您需要修改它并且控件不知道时才需处理 ``radius``。


LV_EVENT_REFR_EXT_DRAW_SIZE
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

If you need to draw outside a widget, LVGL needs to know about it to
provide extra space for drawing. Let's say you create an event which
writes the current value of a slider above its knob. In this case LVGL
needs to know that the slider's draw area should be larger with the size
required for the text.

You can simply set the required draw area with
:cpp:expr:`lv_event_set_ext_draw_size(e, size)`.

.. raw:: html

   </details>
   <br>


如果您需要在控件的外部绘制，请告诉LVGL以便提供额外的绘制空间。假设您创建了一个事件，在滑块的旋钮上方写入当前值。在这种情况下，LVGL需要知道滑块的绘制区域应该更大，以适应文本所需的大小。

您可以使用 :cpp:expr:`lv_event_set_ext_draw_size(e, size)` 来简单设置所需的绘制区域。


.. _drawing_api:

API
***
