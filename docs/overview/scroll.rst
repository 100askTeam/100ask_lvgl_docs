.. _scroll:

==============
Scroll（滚动）
==============

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

In LVGL scrolling works very intuitively: if an object is outside its
parent content area (the size without padding), the parent becomes
scrollable and scrollbar(s) will appear. That's it.

Any object can be scrollable including ``lv_obj``, ``lv_image``,
``lv_button``, ``lv_meter``, etc

The object can either be scrolled horizontally or vertically in one
stroke; diagonal scrolling is not possible.

.. raw:: html

   </details>
   <br>


在LVGL中，滚动的工作方式非常直观：如果一个对象超出了其父对象内容区域（不包括内边距的大小），那么其父对象就会变成可滚动的，并且会出现滚动条。就是这样。

任何对象都可以是可滚动的，包括 ``lv_obj``, ``lv_image``, ``lv_button``, ``lv_meter`` 等。

对象可以在一个操作中水平或垂直滚动；无法进行对角线滚动。


Scrollbar（滚动条）
------------------

Mode（模式）
^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Scrollbars are displayed according to a configured ``mode``. The
following ``mode``\ (s) exist:

- :cpp:enumerator:`LV_SCROLLBAR_MODE_OFF`: Never show the scrollbars
- :cpp:enumerator:`LV_SCROLLBAR_MODE_ON`: Always show the scrollbars
- :cpp:enumerator:`LV_SCROLLBAR_MODE_ACTIVE`: Show scroll bars while an object is being scrolled
- :cpp:enumerator:`LV_SCROLLBAR_MODE_AUTO`: Show scroll bars when the content is large enough to be scrolled

``lv_obj_set_scrollbar_mode(obj, LV_SCROLLBAR_MODE_...)`` sets the scrollbar mode on an object.

.. raw:: html

   </details>
   <br>


滚动条的显示方式根据配置的 ``mode`` 来确定。存在以下几种 ``mode``：

- :cpp:enumerator:`LV_SCROLLBAR_MODE_OFF`：从不显示滚动条
- :cpp:enumerator:`LV_SCROLLBAR_MODE_ON`：始终显示滚动条
- :cpp:enumerator:`LV_SCROLLBAR_MODE_ACTIVE`：在对象滚动时显示滚动条
- :cpp:enumerator:`LV_SCROLLBAR_MODE_AUTO`：当内容足够大可以滚动时显示滚动条

通过 ``lv_obj_set_scrollbar_mode(obj, LV_SCROLLBAR_MODE_...)`` 可以设置对象上的滚动条模式。


Styling（样式）
^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

The scrollbars have their own dedicated part, called
:cpp:enumerator:`LV_PART_SCROLLBAR`. For example a scrollbar can turn to red like
this:

.. code:: c

   static lv_style_t style_red;
   lv_style_init(&style_red);
   lv_style_set_bg_color(&style_red, lv_color_red());

   ...

   lv_obj_add_style(obj, &style_red, LV_PART_SCROLLBAR);

An object goes to the :cpp:enumerator:`LV_STATE_SCROLLED` state while it's being
scrolled. This allows adding different styles to the scrollbar or the
object itself when scrolled. This code makes the scrollbar blue when the
object is scrolled:

.. code:: c

   static lv_style_t style_blue;
   lv_style_init(&style_blue);
   lv_style_set_bg_color(&style_blue, lv_color_blue());

   ...

   lv_obj_add_style(obj, &style_blue, LV_STATE_SCROLLED | LV_PART_SCROLLBAR);

If the base direction of the :cpp:enumerator:`LV_PART_SCROLLBAR` is RTL
(:c:macro:`LV_BASE_DIR_RTL`) the vertical scrollbar will be placed on the left.
Note that, the ``base_dir`` style property is inherited. Therefore, it
can be set directly on the :cpp:enumerator:`LV_PART_SCROLLBAR` part of an object or on
the object's or any parent's main part to make a scrollbar inherit the
base direction.

``pad_left/right/top/bottom`` sets the spacing around the scrollbars and
``width`` sets the scrollbar's width.


.. raw:: html

   </details>
   <br>


滚动条有其专用的部分，称为 :cpp:enumerator:`LV_PART_SCROLLBAR`。例如，滚动条可以像这样变成红色：

.. code:: c

   static lv_style_t style_red;
   lv_style_init(&style_red);
   lv_style_set_bg_color(&style_red, lv_color_red());

   ...

   lv_obj_add_style(obj, &style_red, LV_PART_SCROLLBAR);

当对象正在被滚动时，它会进入 :cpp:enumerator:`LV_STATE_SCROLLED` 状态。这允许当滚动时，向滚动条或对象本身添加不同的样式。此代码使对象被滚动时滚动条变蓝色：

.. code:: c

   static lv_style_t style_blue;
   lv_style_init(&style_blue);
   lv_style_set_bg_color(&style_blue, lv_color_blue());

   ...

   lv_obj_add_style(obj, &style_blue, LV_STATE_SCROLLED | LV_PART_SCROLLBAR);

如果 :cpp:enumerator:`LV_PART_SCROLLBAR` 的基本方向是RTL(:c:macro:`LV_BASE_DIR_RTL`) ，垂直滚动条将被放置在左侧。请注意， ``base_dir`` 样式属性是继承的。
因此，它可以直接在对象的 :cpp:enumerator:`LV_PART_SCROLLBAR` 部分上设置，或者在对象的或任何父级的主要部分上设置，以使滚动条继承基本方向。

``pad_left/right/top/bottom`` 设置滚动条周围的间距， ``width`` 设置滚动条的宽度。


.. _scroll_events:

Events(事件)
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The following events are related to scrolling:

- :cpp:enumerator:`LV_EVENT_SCROLL_BEGIN`: Scrolling begins. The event parameter is
  ``NULL`` or an ``lv_anim_t *`` with a scroll animation descriptor that can be modified if required.
- :cpp:enumerator:`LV_EVENT_SCROLL_END`: Scrolling ends.
- :cpp:enumerator:`LV_EVENT_SCROLL`: Scroll happened. Triggered on every position change. Scroll events

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


此外，除了管理“正常”滚动外，还有许多有趣和实用的额外功能。


.. raw:: html

   </details>
   <br>

  
Scrollable（滚动效果）
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

It's possible to make an object non-scrollable with
:cpp:expr:`lv_obj_remove_flag(obj, LV_OBJ_FLAG_SCROLLABLE)`.

Non-scrollable objects can still propagate the scrolling (chain) to
their parents.

The direction in which scrolling happens can be controlled by ``lv_obj_set_scroll_dir(obj, LV_DIR_...)``. 

The following values are possible for the direction:

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


可以使用 :cpp:expr:`lv_obj_remove_flag(obj, LV_OBJ_FLAG_SCROLLABLE)` 来使对象不可滚动。

不可滚动的对象仍然可以将滚动（链）传播到它们的父对象。

滚动的方向可以通过 ``lv_obj_set_scroll_dir(obj, LV_DIR_...)`` 来控制。

以下值可以用于指定方向：

- :cpp:enumerator:`LV_DIR_TOP`: 只向上滚动
- :cpp:enumerator:`LV_DIR_LEFT`: 只向左滚动
- :cpp:enumerator:`LV_DIR_BOTTOM`: 只向下滚动
- :cpp:enumerator:`LV_DIR_RIGHT`: 只向右滚动
- :cpp:enumerator:`LV_DIR_HOR`: 只水平滚动
- :cpp:enumerator:`LV_DIR_VER`: 只垂直滚动
- :cpp:enumerator:`LV_DIR_ALL`: 滚动任何方向

也可以组合多个方向。比如：:cpp:expr:`LV_DIR_TOP | LV_DIR_LEFT`。


Scroll chain（滚动条）
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If an object can't be scrolled further (e.g. its content has reached the
bottom-most position) additional scrolling is propagated to its parent.
If the parent can be scrolled in that direction than it will be scrolled
instead. It continues propagating to the grandparent and
grand-grandparents as well.

The propagation on scrolling is called "scroll chaining" and it can be
enabled/disabled with ``LV_OBJ_FLAG_SCROLL_CHAIN_HOR/VER`` flag. If
chaining is disabled the propagation stops on the object and the
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

When the user scrolls an object and releases it, LVGL can emulate
inertial momentum for the scrolling. It's like the object was thrown and
scrolling slows down smoothly.

The scroll momentum can be enabled/disabled with the :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_MOMENTUM` flag.

.. raw:: html

   </details>
   <br>


当用户滚动一个对象并释放时，LVGL可以模拟滚动的惯性动量。就像物体被扔出去一样，滚动平稳地减速。

滚动动量可以通过设置 :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_MOMENTUM` 标志来启用/禁用。


Elastic scroll（弹性卷轴效果）
-----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Normally an object can't be scrolled past the extremities of its
content. That is the top side of the content can't be below the top side
of the object.

However, with :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_ELASTIC` a fancy effect is added
when the user "over-scrolls" the content. The scrolling slows down, and
the content can be scrolled inside the object. When the object is
released the content scrolled in it will be animated back to the valid
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

The children of an object can be snapped according to specific rules
when scrolling ends. Children can be made snappable individually with
the :cpp:enumerator:`LV_OBJ_FLAG_SNAPPABLE` flag.

An object can align snapped children in four ways:

- :cpp:enumerator:`LV_SCROLL_SNAP_NONE`: Snapping is disabled. (default)
- :cpp:enumerator:`LV_SCROLL_SNAP_START`: Align the children to the left/top side of a scrolled object
- :cpp:enumerator:`LV_SCROLL_SNAP_END`: Align the children to the right/bottom side of a scrolled object
- :cpp:enumerator:`LV_SCROLL_SNAP_CENTER`: Align the children to the center of a scrolled object

Snap alignment is set with
``lv_obj_set_scroll_snap_x/y(obj, LV_SCROLL_SNAP_...)``:

Under the hood the following happens:

1. User scrolls an object and releases the screen
2. LVGL calculates where the scroll would end considering scroll momentum
3. LVGL finds the nearest scroll point
4. LVGL scrolls to the snap point with an animation

.. raw:: html

   </details>
   <br>


这个对象的子对象可以根据特定规则进行对齐。当滚动结束时，子对象可以通过设置 :cpp:enumerator:`LV_OBJ_FLAG_SNAPPABLE` 标志单独进行对齐。

一个对象可以以四种方式对齐被捕获的子项：

- :cpp:enumerator:`LV_SCROLL_SNAP_NONE`: 对齐被禁用。（默认设置）
- :cpp:enumerator:`LV_SCROLL_SNAP_START`: 将子项对齐到滚动对象的左/顶部
- :cpp:enumerator:`LV_SCROLL_SNAP_END`: 将子项对齐到滚动对象的右/底部
- :cpp:enumerator:`LV_SCROLL_SNAP_CENTER`: 将子项对齐到滚动对象的中心

通过 ``lv_obj_set_scroll_snap_x/y(obj, LV_SCROLL_SNAP_...)`` 设置对齐方式：

在底层，以下操作会发生：

1. 用户滚动对象并释放屏幕
2. LVGL根据滚动动量计算滚动结束的位置
3. LVGL找到最近的滚动点
4. LVGL以动画的方式滚动到对齐点


Scroll one(只滚动一个)
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The "scroll one" feature tells LVGL to allow scrolling only one
snappable child at a time. This requires making the children snappable
and setting a scroll snap alignment different from
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

Imagine that there a lot of objects in a group that are on a scrollable
object. Pressing the "Tab" button focuses the next object but it might
be outside the visible area of the scrollable object. If the "scroll on
focus" feature is enabled LVGL will automatically scroll objects to
bring their children into view. The scrolling happens recursively
therefore even nested scrollable objects are handled properly. The
object will be scrolled into view even if it's on a different page of a
tabview.

.. raw:: html

   </details>
   <br>


想象一下，有很多物体在一个可滚动的对象上。按下“Tab”按钮会将焦点转移到下一个物体，但它可能超出了可滚动对象的可见区域。
如果启用了“焦点时滚动”功能，LVGL会自动滚动物体以使它们的子对象出现在视图中。滚动是递归进行的，因此即使是嵌套的可滚动对象也会被正确处理。
即使对象在选项卡视图的不同页面上，它也会被滚动到视图中。


Scroll manually（手动滚动）
***************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The following API functions allow manual scrolling of objects:

- ``lv_obj_scroll_by(obj, x, y, LV_ANIM_ON/OFF)`` scroll by ``x`` and ``y`` values
- ``lv_obj_scroll_to(obj, x, y, LV_ANIM_ON/OFF)`` scroll to bring the given coordinate to the top left corner
- ``lv_obj_scroll_to_x(obj, x, LV_ANIM_ON/OFF)`` scroll to bring the given coordinate to the left side
- ``lv_obj_scroll_to_y(obj, y, LV_ANIM_ON/OFF)`` scroll to bring the given coordinate to the top side

From time to time you may need to retrieve the scroll position of an
element, either to restore it later, or to display dynamically some
elements according to the current scroll. Here is an example to see how
to combine scroll event and store the scroll top position.

.. code:: c

   static int scroll_value = 0;

   static void store_scroll_value_event_cb(lv_event_t* e) {
     lv_obj_t* screen = lv_event_get_target(e);
     scroll_value = lv_obj_get_scroll_top(screen);
     printf("%d pixels are scrolled out on the top\n", scroll_value);
   }

   lv_obj_t* container = lv_obj_create(NULL);
   lv_obj_add_event_cb(container, store_scroll_value_event_cb, LV_EVENT_SCROLL, NULL);

Scroll coordinates can be retrieved from different axes with these
functions:

- ``lv_obj_get_scroll_x(obj)`` Get the ``x`` coordinate of object
- ``lv_obj_get_scroll_y(obj)`` Get the ``y`` coordinate of object
- ``lv_obj_get_scroll_top(obj)`` Get the scroll coordinate from the top
- ``lv_obj_get_scroll_bottom(obj)`` Get the scroll coordinate from the bottom
- ``lv_obj_get_scroll_left(obj)`` Get the scroll coordinate from the left
- ``lv_obj_get_scroll_right(obj)`` Get the scroll coordinate from the right

.. raw:: html

   </details>
   <br>


以下API函数允许手动滚动对象：

- ``lv_obj_scroll_by(obj, x, y, LV_ANIM_ON/OFF)`` 按照给定的 ``x`` 和 ``y`` 值滚动
- ``lv_obj_scroll_to(obj, x, y, LV_ANIM_ON/OFF)`` 滚动以将给定坐标带到左上角
- ``lv_obj_scroll_to_x(obj, x, LV_ANIM_ON/OFF)`` 滚动以将给定坐标带到左侧
- ``lv_obj_scroll_to_y(obj, y, LV_ANIM_ON/OFF)`` 滚动以将给定坐标带到顶部

有时您可能需要检索元素的滚动位置，以便稍后恢复它，或者根据当前滚动动态显示一些元素。以下是一个示例，介绍如何结合滚动事件并存储滚动顶部位置。

.. code:: c

   static int scroll_value = 0;

   static void store_scroll_value_event_cb(lv_event_t* e) {
     lv_obj_t* screen = lv_event_get_target(e);
     scroll_value = lv_obj_get_scroll_top(screen);
     printf("向上滚动了%d像素\n", scroll_value);
   }

   lv_obj_t* container = lv_obj_create(NULL);
   lv_obj_add_event_cb(container, store_scroll_value_event_cb, LV_EVENT_SCROLL, NULL);

使用这些函数可以从不同轴检索滚动坐标：

- ``lv_obj_get_scroll_x(obj)`` 获取对象的 ``x`` 坐标
- ``lv_obj_get_scroll_y(obj)`` 获取对象的 ``y`` 坐标
- ``lv_obj_get_scroll_top(obj)`` 从顶部获取滚动坐标
- ``lv_obj_get_scroll_bottom(obj)`` 从底部获取滚动坐标
- ``lv_obj_get_scroll_left(obj)`` 从左侧获取滚动坐标
- ``lv_obj_get_scroll_right(obj)`` 从右侧获取滚动坐标


Self size（自身尺寸）
*********************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Self size is a property of an object. Normally, the user shouldn't use
this parameter but if a custom widget is created it might be useful.

In short, self size establishes the size of an object's content. To
understand it better take the example of a table. Let's say it has 10
rows each with 50 px height. So the total height of the content is 500
px. In other words the "self height" is 500 px. If the user sets only
200 px height for the table LVGL will see that the self size is larger
and make the table scrollable.

This means not only the children can make an object scrollable but a
larger self size will too.

LVGL uses the :cpp:enumerator:`LV_EVENT_GET_SELF_SIZE` event to get the self size of
an object. Here is an example to see how to handle the event:

.. code:: c

   if(event_code == LV_EVENT_GET_SELF_SIZE) {
       lv_point_t * p = lv_event_get_param(e);

     //If x or y < 0 then it doesn't need to be calculated now
     if(p->x >= 0) {
       p->x = 200; //Set or calculate the self width
     }

     if(p->y >= 0) {
       p->y = 50;  //Set or calculate the self height
     }
   }

.. raw:: html

   </details>
   <br>


自身大小是一个对象的属性。通常情况下，用户不应该使用这个参数，但如果创建了一个自定义控件，它可能会很有用。

简而言之，自身大小确定了对象内容的大小。为了更好地理解，以表格为例。假设它有10行，每行高度为50像素。
因此，内容的总高度是500像素。换句话说，“自身高度”为500像素。
如果用户为表格仅设置了200像素的高度，LVGL将会发现自身大小更大，并使表格可滚动。

这意味着不仅子对象可以使一个对象可滚动，而且更大的自身大小也可以。

LVGL使用 :cpp:enumerator:`LV_EVENT_GET_SELF_SIZE` 事件来获取一个对象的自身大小。下面是一个处理该事件的示例：

.. code:: c

   if(event_code == LV_EVENT_GET_SELF_SIZE) {
       lv_point_t * p = lv_event_get_param(e);

     //如果x或y < 0，则不需要立即计算
     if(p->x >= 0) {
       p->x = 200; //设置或计算自身宽度
     }

     if(p->y >= 0) {
       p->y = 50;  //设置或计算自身高度
     }
   }

.. _scroll_example:

Examples
********

.. include:: ../examples/scroll/index.rst

.. _scroll_api:

API
***
