.. _scroll:

================
Scrolling（滚动）
================

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

In LVGL scrolling works very intuitively: if a Widget is outside its
parent content area (the size without padding), the parent becomes
scrollable and scrollbar(s) will appear. That's it.

Any Widget can be scrollable including :ref:`base_widget`, ``lv_image``,
``lv_button``, ``lv_meter``, etc

The Widget can either be scrolled horizontally or vertically in one
stroke; diagonal scrolling is not possible.

.. raw:: html

   </details>
   <br>


在LVGL中，滚动的工作方式非常直观：如果一个Widget超出了其父对象的内容区域（即去除内边距后的大小），其父对象就会变得可滚动，并且滚动条会出现。就是这样简单。

任何Widget都可以是可滚动的，包括:ref:`base_widget`、``lv_image``、``lv_button``、``lv_meter``等。

Widget可以在一次滑动中水平或垂直滚动；但不支持对角线方向的滚动。


Scrollbar（滚动条）
------------------

Mode（模式）
^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Scrollbars are displayed according to the configured ``scrollbar-mode``.  The
following modes are available:

- :cpp:enumerator:`LV_SCROLLBAR_MODE_OFF`: Never show the scrollbars
- :cpp:enumerator:`LV_SCROLLBAR_MODE_ON`: Always show the scrollbars
- :cpp:enumerator:`LV_SCROLLBAR_MODE_ACTIVE`: Show scroll bars while a Widget is being scrolled
- :cpp:enumerator:`LV_SCROLLBAR_MODE_AUTO`: Show scroll bars when the content is large enough to be scrolled

:cpp:expr:`lv_obj_set_scrollbar_mode(widget, LV_SCROLLBAR_MODE_...)` sets the scrollbar mode on a Widget.

.. raw:: html

   </details>
   <br>


滚动条的显示取决于配置的``scrollbar-mode``。可用的模式如下：

- :cpp:enumerator:`LV_SCROLLBAR_MODE_OFF`: 从不显示滚动条
- :cpp:enumerator:`LV_SCROLLBAR_MODE_ON`: 始终显示滚动条
- :cpp:enumerator:`LV_SCROLLBAR_MODE_ACTIVE`: 当Widget正在被滚动时显示滚动条
- :cpp:enumerator:`LV_SCROLLBAR_MODE_AUTO`: 当内容足够大以至于可以滚动时显示滚动条

使用:cpp:expr:`lv_obj_set_scrollbar_mode(widget, LV_SCROLLBAR_MODE_...)`可以为Widget设置滚动条模式。

Styling（样式）
^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

A Scrollbar is a dedicated part of a Widget, called
:cpp:enumerator:`LV_PART_SCROLLBAR`.  For example, a scrollbar can turn to red like
this:

.. code-block:: c

   static lv_style_t style_red;
   lv_style_init(&style_red);
   lv_style_set_bg_color(&style_red, lv_color_red());

   ...

   lv_obj_add_style(widget, &style_red, LV_PART_SCROLLBAR);

A Widget goes to the :cpp:enumerator:`LV_STATE_SCROLLED` state while it's being
scrolled.  This allows adding different styles to the Widget that will be effective
while it is being scrolled.  For example, this code makes the scrollbar blue while
the Widget is being scrolled:

.. code-block:: c

   static lv_style_t style_blue;
   lv_style_init(&style_blue);
   lv_style_set_bg_color(&style_blue, lv_color_blue());

   ...

   lv_obj_add_style(widget, &style_blue, LV_STATE_SCROLLED | LV_PART_SCROLLBAR);

If the base direction of the :cpp:enumerator:`LV_PART_SCROLLBAR` is RTL
(:c:macro:`LV_BASE_DIR_RTL`) the vertical scrollbar will be placed on the left.
Note that, the ``base_dir`` style property is inherited. Therefore, it
can be set directly on the :cpp:enumerator:`LV_PART_SCROLLBAR` part of a Widget, or
on the Widget's LV_PART_MAIN part, or that of any of its parents, to make a scrollbar
inherit the base direction.

``pad_left/right/top/bottom`` sets the spacing around the scrollbars and
``width`` sets the scrollbar's width.


.. raw:: html

   </details>
   <br>


滚动条是Widget的一个专用部分，称为:cpp:enumerator:`LV_PART_SCROLLBAR`。例如，可以通过以下代码将滚动条设置为红色：

.. code-block:: c

   static lv_style_t style_red;
   lv_style_init(&style_red);
   lv_style_set_bg_color(&style_red, lv_color_red());

   ...

   lv_obj_add_style(widget, &style_red, LV_PART_SCROLLBAR);

当Widget正在被滚动时，它会进入:cpp:enumerator:`LV_STATE_SCROLLED`状态。这允许为Widget添加在滚动期间有效的不同样式。例如，以下代码会在Widget滚动时将滚动条设置为蓝色：

.. code-block:: c

   static lv_style_t style_blue;
   lv_style_init(&style_blue);
   lv_style_set_bg_color(&style_blue, lv_color_blue());

   ...

   lv_obj_add_style(widget, &style_blue, LV_STATE_SCROLLED | LV_PART_SCROLLBAR);

如果:cpp:enumerator:`LV_PART_SCROLLBAR`的基础方向是RTL (:c:macro:`LV_BASE_DIR_RTL`)，垂直滚动条将会被放置在左侧。请注意，``base_dir``样式属性是继承的。因此，可以直接在Widget的:cpp:enumerator:`LV_PART_SCROLLBAR`部分上设置，也可以在Widget的LV_PART_MAIN部分或其任意父对象上设置，从而让滚动条继承基础方向。

``pad_left/right/top/bottom``属性设置滚动条周围的间距，``width``属性设置滚动条的宽度。


.. _scroll_events:

Scrolling Events(事件)
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The following events are emitted as part of scrolling:

- :cpp:enumerator:`LV_EVENT_SCROLL_BEGIN`: Signals that scrolling has begun. The
  event parameter is ``NULL`` or an ``lv_anim_t *`` with a scroll animation
  descriptor that can be modified if required.
- :cpp:enumerator:`LV_EVENT_SCROLL_END`: Signals that scrolling has ended.
- :cpp:enumerator:`LV_EVENT_SCROLL`: Signals that the scrolling position changed;
  triggered on every position change.

.. raw:: html

   </details>
   <br>


以下事件与滚动相关：

- :cpp:enumerator:`LV_EVENT_SCROLL_BEGIN`: 滚动开始。事件参数为 ``NULL`` 或包含滚动动画描述符的 ``lv_anim_t *``，如果需要，可以对其进行修改。
- :cpp:enumerator:`LV_EVENT_SCROLL_END`: 滚动结束。
- :cpp:enumerator:`LV_EVENT_SCROLL`: 发生滚动。在每次位置变化时触发。滚动事件。


Basic example（基本示例）
*************************

TODO

Features of scrolling（滚动的特点）
**********************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Besides, managing "normal" scrolling there are many interesting and
useful additional features.

.. raw:: html

   </details>
   <br>

此外，除了管理“正常”滚动外，还有许多有趣和实用的额外功能。
  
Scrollable（滚动效果）
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

It is possible to make a Widget non-scrollable with
:cpp:expr:`lv_obj_remove_flag(widget, LV_OBJ_FLAG_SCROLLABLE)`.

Non-scrollable Widgets can still propagate the scrolling (chain) to
their parents.

The direction in which scrolling happens can be controlled by
:cpp:expr:`lv_obj_set_scroll_dir(widget, LV_DIR_...)`.

The following values can be used for the direction:

- :cpp:enumerator:`LV_DIR_TOP`: only scroll up
- :cpp:enumerator:`LV_DIR_LEFT`: only scroll left
- :cpp:enumerator:`LV_DIR_BOTTOM`: only scroll down
- :cpp:enumerator:`LV_DIR_RIGHT`: only scroll right
- :cpp:enumerator:`LV_DIR_HOR`: only scroll horizontally
- :cpp:enumerator:`LV_DIR_VER`: only scroll vertically
- :cpp:enumerator:`LV_DIR_ALL`: scroll any directions

OR-ed values are also possible. E.g. :cpp:expr:`LV_DIR_TOP | LV_DIR_LEFT`.

.. raw:: html

   </details>
   <br>


可以使用:cpp:expr:`lv_obj_remove_flag(widget, LV_OBJ_FLAG_SCROLLABLE)`使Widget不可滚动。

即使Widget不可滚动，它仍然可以将滚动事件（链式）传播给其父对象。

滚动发生的方向可以通过:cpp:expr:`lv_obj_set_scroll_dir(widget, LV_DIR_...)`进行控制。

以下是可用的方向值：

- :cpp:enumerator:`LV_DIR_TOP`: 仅向上滚动
- :cpp:enumerator:`LV_DIR_LEFT`: 仅向左滚动
- :cpp:enumerator:`LV_DIR_BOTTOM`: 仅向下滚动
- :cpp:enumerator:`LV_DIR_RIGHT`: 仅向右滚动
- :cpp:enumerator:`LV_DIR_HOR`: 仅水平滚动
- :cpp:enumerator:`LV_DIR_VER`: 仅垂直滚动
- :cpp:enumerator:`LV_DIR_ALL`: 任意方向滚动

还可以使用按位或的值。例如:cpp:expr:`LV_DIR_TOP | LV_DIR_LEFT`。


Scroll chaining（滚动条）
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If a Widget can't be scrolled further (e.g. its content has reached the
bottom-most position), additional scrolling is propagated to its parent.
If the parent can be scrolled in that direction than it will be scrolled
instead. It continues propagating up the Widget's parent hierarchy up to
the :ref:`Screen <screens>`.

The propagation on scrolling is called "scroll chaining" and it can be
enabled/disabled with ``LV_OBJ_FLAG_SCROLL_CHAIN_HOR/VER`` flag. If
chaining is disabled the propagation stops on the Widget and the
parent(s) won't be scrolled.

.. raw:: html

   </details>
   <br>


如果一个对象无法进一步滚动（例如，其内容已经到达最底部位置），额外的滚动将传递给其父对象。如果在该方向上可以滚动父对象，则父对象将被滚动。它会继续传递给祖父和曾祖父对象。

滚动传播被称为“滚动链”，可以使用 ``LV_OBJ_FLAG_SCROLL_CHAIN_HOR/VER`` 标志来启用/禁用它。如果禁用了链式滚动，传播将在该对象处停止，并且父对象（们）将不会滚动。


Scroll momentum（滚动惯性效果）
------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

When the user scrolls a Widget and releases it, LVGL can emulate
inertial momentum for the scrolling. It's like the Widget was "thrown"
and scrolling slows down smoothly.

Scroll momentum can be enabled/disabled with the
:cpp:enumerator:`LV_OBJ_FLAG_SCROLL_MOMENTUM` flag.

.. raw:: html

   </details>
   <br>


当用户滚动一个Widget并释放时，LVGL可以模拟滚动的惯性动量。就像Widget被“抛出”一样，滚动会平滑地减速。

可以通过:cpp:enumerator:`LV_OBJ_FLAG_SCROLL_MOMENTUM`标志启用或禁用滚动动量。


Elastic scroll（弹性卷轴效果）
-----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Normally a Widget can't be scrolled past the extremities of its
content.  That is, the top side of the content can't be below the top side
of the Widget, and vice versa for the bottom side.

However, with :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_ELASTIC` a fancy effect is added
when the user "over-scrolls" the content. The scrolling slows down, and
the content can be scrolled inside the Widget. When the Widget is
released the content scrolled in it is animated back to the closest valid
position.

.. raw:: html

   </details>
   <br>


通常情况下，对象不能滚动超出其内容的极限。也就是说，内容的顶部不能低于对象的顶部。

然而，使用 :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_ELASTIC` 会在用户“过度滚动”内容时添加一种花哨的效果。
滚动会减速，并且内容可以在对象内滚动。当释放对象时，其中滚动的内容将被动画回到有效位置。


Snapping（捕捉）
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The children of a Widget can be snapped according to specific rules
when scrolling ends. Children can be made snappable individually with
the :cpp:enumerator:`LV_OBJ_FLAG_SNAPPABLE` flag.

A Widget can align snapped children in four ways:

- :cpp:enumerator:`LV_SCROLL_SNAP_NONE`: Snapping is disabled. (default)
- :cpp:enumerator:`LV_SCROLL_SNAP_START`: Align the children to the left/top side of a scrolled Widget
- :cpp:enumerator:`LV_SCROLL_SNAP_END`: Align the children to the right/bottom side of a scrolled Widget
- :cpp:enumerator:`LV_SCROLL_SNAP_CENTER`: Align the children to the center of a scrolled Widget

Snap alignment is set with
:cpp:expr:`lv_obj_set_scroll_snap_x(widget, LV_SCROLL_SNAP_...)` and
:cpp:expr:`lv_obj_set_scroll_snap_y(widget, LV_SCROLL_SNAP_...)`.

This is what happens under the hood:

1. user scrolls and releases a Widget;
2. LVGL calculates where the scroll would end considering scroll momentum;
3. LVGL finds the nearest scroll point;
4. LVGL scrolls to the snap point with an animation.

.. raw:: html

   </details>
   <br>


当滚动结束时，Widget的子对象可以根据特定规则对齐（snap）。子对象可以通过设置:cpp:enumerator:`LV_OBJ_FLAG_SNAPPABLE`标志单独启用snap功能。

Widget可以以以下四种方式对齐其子对象：

- :cpp:enumerator:`LV_SCROLL_SNAP_NONE`: 禁用对齐功能。（默认）
- :cpp:enumerator:`LV_SCROLL_SNAP_START`: 将子对象对齐到滚动Widget的左侧/顶部。
- :cpp:enumerator:`LV_SCROLL_SNAP_END`: 将子对象对齐到滚动Widget的右侧/底部。
- :cpp:enumerator:`LV_SCROLL_SNAP_CENTER`: 将子对象对齐到滚动Widget的中心。

可以通过以下方法设置snap对齐方式：
- :cpp:expr:`lv_obj_set_scroll_snap_x(widget, LV_SCROLL_SNAP_...)`：设置水平方向的snap。
- :cpp:expr:`lv_obj_set_scroll_snap_y(widget, LV_SCROLL_SNAP_...)`：设置垂直方向的snap。

以下是内部处理流程：

1. 用户滚动并释放Widget；
2. LVGL根据滚动动量计算滚动结束的位置；
3. LVGL找到最近的snap点；
4. LVGL通过动画滚动到snap点。


Scroll one(只滚动一个)
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The "scroll one" feature tells LVGL to allow scrolling only one
snappable child at a time. This requires making the children snappable
and setting scroll snap alignment to something other than
:cpp:enumerator:`LV_SCROLL_SNAP_NONE`.

This feature can be enabled by the :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_ONE` flag.

.. raw:: html

   </details>
   <br>


“滚动一个”功能告诉LVGL一次仅允许滚动一个可对齐的子对象。这需要将子对象设置为可对齐，并设置一个与 :cpp:enumerator:`LV_SCROLL_SNAP_NONE` 不同的滚动对齐方式。

可以通过设置 :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_ONE` 标志来启用此功能。


Scroll on focus（滚动焦点）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Imagine that there are a lot of Widgets in a group that are on a scrollable
Widget. Pressing the "Tab" button moves focus to the next Widget but it might
be outside the visible area of the scrollable Widget. If the "scroll on
focus" feature is enabled LVGL will automatically scroll Widgets to
bring the child Widget with focus into view.  The scrolling happens recursively
therefore even nested scrollable Widgets are handled properly. The
Widget will be scrolled into view even if it is on a different page of a
tabview.

.. raw:: html

   </details>
   <br>


想象一下，有很多物体在一个可滚动的对象上。按下“Tab”按钮会将焦点转移到下一个物体，但它可能超出了可滚动对象的可见区域。
如果启用了“焦点时滚动”功能，LVGL会自动滚动物体以使它们的子对象出现在视图中。滚动是递归进行的，因此即使是嵌套的可滚动对象也会被正确处理。
即使对象在选项卡视图的不同页面上，它也会被滚动到视图中。


Scrolling Programmatically
**************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The following API functions allow programmatic scrolling of Widgets:

- ``lv_obj_scroll_by(widget, x, y, LV_ANIM_ON/OFF)`` scroll by ``x`` and ``y`` values
- ``lv_obj_scroll_to(widget, x, y, LV_ANIM_ON/OFF)`` scroll to bring the given coordinate to the top left corner
- ``lv_obj_scroll_to_x(widget, x, LV_ANIM_ON/OFF)`` scroll to bring the given coordinate to the left side
- ``lv_obj_scroll_to_y(widget, y, LV_ANIM_ON/OFF)`` scroll to bring the given coordinate to the top side

From time to time you may need to retrieve the *scroll position* of a
scrollable Widget, either to restore it later, or to dynamically display some
elements according to its current scroll position. Here is an example to illustrate
how to combine scroll event and store the scroll-top position.

.. code-block:: c

   static int scroll_value = 0;

   static void store_scroll_top_value_event_cb(lv_event_t* e) {
     lv_obj_t * scr = lv_event_get_target(e);
     scroll_value = lv_obj_get_scroll_top(scr);
     printf("%d pixels are scrolled above top edge of display.\n", scroll_value);
   }

   lv_obj_t * scr = lv_obj_create(NULL);
   lv_obj_add_event_cb(scr, store_scroll_top_value_event_cb, LV_EVENT_SCROLL, NULL);

Scroll coordinates can be retrieved from different axes with these functions:

- :cpp:expr:`lv_obj_get_scroll_x(widget)`      Pixels scrolled past left edge of Widget's view window.
- :cpp:expr:`lv_obj_get_scroll_y(widget)`      Pixels scrolled past top of Widget's view window.
- :cpp:expr:`lv_obj_get_scroll_top(widget)`    Identical to :cpp:expr:`lv_obj_get_scroll_y(widget)`
- :cpp:expr:`lv_obj_get_scroll_bottom(widget)` Pixels scrolled past bottom of Widget's view window.
- :cpp:expr:`lv_obj_get_scroll_left(widget)`   Identical to :cpp:expr:`lv_obj_get_scroll_x(widget)`.
- :cpp:expr:`lv_obj_get_scroll_right(widget)`  Pixels scrolled past right edge of Widget's view window.

Setting scroll position can be done with these functions:

- :cpp:expr:`lv_obj_scroll_by(widget, dx, dy, anim_enable)`               Scroll by given amount of pixels.
- :cpp:expr:`lv_obj_scroll_by_bounded(widget, dx, dy, animation_enable)`  Scroll by given amount of pixels.
- :cpp:expr:`lv_obj_scroll_to(widget, x, y, animation_enable)`            Scroll to given coordinate on Widget.
- :cpp:expr:`lv_obj_scroll_to_x(widget, x, animation_enable)`             Scroll to X coordinate on Widget.
- :cpp:expr:`lv_obj_scroll_to_y(widget, y, animation_enable)`             Scroll to Y coordinate on Widget.
- :cpp:expr:`lv_obj_scroll_to_view(widget, animation_enable)`             Scroll ``obj``'s parent Widget until ``obj`` becomes visible.
- :cpp:expr:`lv_obj_scroll_to_view_recursive(widget, animation_enable)`   Scroll ``obj``'s parent Widgets recursively until ``obj`` becomes visible.

.. raw:: html

   </details>
   <br>


以下API函数可以用于以编程方式滚动Widgets：

- ``lv_obj_scroll_by(widget, x, y, LV_ANIM_ON/OFF)`` 根据``x``和``y``的值进行滚动。
- ``lv_obj_scroll_to(widget, x, y, LV_ANIM_ON/OFF)`` 滚动以将指定坐标移动到左上角。
- ``lv_obj_scroll_to_x(widget, x, LV_ANIM_ON/OFF)`` 滚动以将指定坐标移动到左侧。
- ``lv_obj_scroll_to_y(widget, y, LV_ANIM_ON/OFF)`` 滚动以将指定坐标移动到顶部。

有时，您可能需要获取可滚动Widget的*滚动位置*，以便稍后恢复，或者根据当前的滚动位置动态显示一些元素。以下示例说明了如何结合滚动事件存储滚动顶部的位置：

.. code-block:: c

   static int scroll_value = 0;

   static void store_scroll_top_value_event_cb(lv_event_t* e) {
     lv_obj_t * scr = lv_event_get_target(e);
     scroll_value = lv_obj_get_scroll_top(scr);
     printf("%d pixels are scrolled above top edge of display.\n", scroll_value);
   }

   lv_obj_t * scr = lv_obj_create(NULL);
   lv_obj_add_event_cb(scr, store_scroll_top_value_event_cb, LV_EVENT_SCROLL, NULL);

可以通过以下函数从不同的轴获取滚动坐标：

- :cpp:expr:`lv_obj_get_scroll_x(widget)`      滚动超过Widget视窗左侧的像素。
- :cpp:expr:`lv_obj_get_scroll_y(widget)`      滚动超过Widget视窗顶部的像素。
- :cpp:expr:`lv_obj_get_scroll_top(widget)`    等同于:cpp:expr:`lv_obj_get_scroll_y(widget)`。
- :cpp:expr:`lv_obj_get_scroll_bottom(widget)` 滚动超过Widget视窗底部的像素。
- :cpp:expr:`lv_obj_get_scroll_left(widget)`   等同于:cpp:expr:`lv_obj_get_scroll_x(widget)`。
- :cpp:expr:`lv_obj_get_scroll_right(widget)`  滚动超过Widget视窗右侧的像素。

可以通过以下函数设置滚动位置：

- :cpp:expr:`lv_obj_scroll_by(widget, dx, dy, anim_enable)`               按指定像素量滚动。
- :cpp:expr:`lv_obj_scroll_by_bounded(widget, dx, dy, animation_enable)`  按指定像素量滚动。
- :cpp:expr:`lv_obj_scroll_to(widget, x, y, animation_enable)`            滚动到Widget上的指定坐标。
- :cpp:expr:`lv_obj_scroll_to_x(widget, x, animation_enable)`             滚动到Widget上的X坐标。
- :cpp:expr:`lv_obj_scroll_to_y(widget, y, animation_enable)`             滚动到Widget上的Y坐标。
- :cpp:expr:`lv_obj_scroll_to_view(widget, animation_enable)`             滚动父Widget直到``obj``变得可见。
- :cpp:expr:`lv_obj_scroll_to_view_recursive(widget, animation_enable)`   递归滚动父Widget直到``obj``变得可见。


Self Size（自身尺寸）
*********************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Self size is a property of a Widget. Normally, the user shouldn't use
this parameter but if a custom widget is created it might be useful.

In short, self size establishes the size of a Widget's content. To
understand it better take the example of a table. Let's say it has 10
rows each with 50 px height. So the total height of the content is 500
px. In other words the "self height" is 500 px. If the user sets only
200 px height for the table LVGL will see that the self size is larger
and make the table scrollable.

This means not only the children can make a Widget scrollable but a
larger self size will as well.

LVGL uses the :cpp:enumerator:`LV_EVENT_GET_SELF_SIZE` event to get the self size of
a Widget. Here is an example to see how to handle the event:

.. code-block:: c

    if(event_code == LV_EVENT_GET_SELF_SIZE) {
        lv_point_t * p = lv_event_get_param(e);

        /* If x or y < 0 then it doesn't need to be calculated now. */
        if(p->x >= 0) {
            p->x = 200; /* Set or calculate self width. */
        }

        if(p->y >= 0) {
            p->y = 50;  /* Set or calculate self height. */
        }
    }

.. raw:: html

   </details>
   <br>


自尺寸（Self size）是Widget的一个属性。通常，用户不需要直接使用这个参数，但在创建自定义Widget时可能会很有用。

简而言之，自尺寸确定了Widget内容的大小。为了更好地理解这一点，可以看一个表格的例子。假设表格有10行，每行50像素高。那么内容的总高度是500像素。换句话说，“自高度”是500像素。如果用户仅为表格设置了200像素的高度，LVGL会看到自尺寸更大，从而使表格变为可滚动。

这意味着，不仅子对象的大小可以使Widget变为可滚动，一个较大的自尺寸同样也会让Widget变得可滚动。

LVGL使用:cpp:enumerator:`LV_EVENT_GET_SELF_SIZE`事件来获取Widget的自尺寸。以下是一个处理该事件的示例：

.. code-block:: c

    if(event_code == LV_EVENT_GET_SELF_SIZE) {
        lv_point_t * p = lv_event_get_param(e);

        /* 如果x或y < 0，则不需要立即计算 */
        if(p->x >= 0) {
            p->x = 200; /* 设置或计算自宽度 */
        }

        if(p->y >= 0) {
            p->y = 50;  /* 设置或计算自高度 */
        }
    }

.. _scroll_example:

Examples
********

.. include:: ../../examples/scroll/index.rst

.. _scroll_api:

API
***
