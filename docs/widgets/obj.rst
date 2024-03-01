.. _lv_obj:

====================
Base object (lv_obj)
====================

Overview
********

.. raw:: html

   <details>
     <summary>显示原文</summary>

The 'Base Object' implements the basic properties of widgets on a
screen, such as:

- coordinates
- parent object
- children
- contains the styles
- attributes like *Clickable*, *Scrollable*, etc.

In object-oriented thinking, it is the base class from which all other
objects in LVGL are inherited.

The functions and functionalities of the Base object can be used with
other widgets too. For example :cpp:expr:`lv_obj_set_width(slider, 100)`

The Base object can be directly used as a simple widget: it's nothing
more than a rectangle. In HTML terms, think of it as a ``<div>``.

.. raw:: html

   </details> 
   <br>


基础对象 实现了屏幕上组件的基本属性，例如：

- 坐标
- 父对象
- 基于父对象的后代
- 包含样式
- 诸如 *Clickable、Scrollable* 等属性。

在面向对象的思想中，基础对象 是 LVGL 中所有其他对象都继承自的基类。

基础对象的功能可以与其他组件一起使用。 例如 :cpp:expr:`lv_obj_set_width(slider, 100)`

基础对象可以直接用作一个简单的组件：它只不过是一个矩形。 在 HTML 术语中，将其视为 ``<div>``。


.. _lv_obj_coordinates:

Coordinates（坐标）
-------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Only a small subset of coordinate settings is described here. To see all
the features of LVGL (padding, coordinates in styles, layouts, etc)
visit the :ref:`Coordinates <coord>` page.

.. raw:: html

   </details> 
   <br>


此处仅描述了一小部分坐标设置。要查看 LVGL 的所有功能（填充、样式中的坐标、布局等），请阅读 :ref:`坐标 <coord>` 页面了解。


.. _lv_obj_size:

Size（大小）
^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

The object size can be modified on individual axes with
:cpp:expr:`lv_obj_set_width(obj, new_width)` and
:cpp:expr:`lv_obj_set_height(obj, new_height)`, or both axes can be modified at
the same time with :cpp:expr:`lv_obj_set_size(obj, new_width, new_height)`.

.. raw:: html

   </details> 
   <br>


可以使用 :cpp:expr:`lv_obj_set_width(obj, new_width)`  和 :cpp:expr:`lv_obj_set_height(obj, new_height)` 设置或修改单个轴上的对象大小，或者可以同时修改两个轴，使用 :cpp:expr:`lv_obj_set_size(obj, new_width, new_height)` 设置或修改高度 。


.. _lv_obj_position:

Position（位置）
^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can set the position relative to the parent with
:cpp:expr:`lv_obj_set_x(obj, new_x)` and :cpp:expr:`lv_obj_set_y(obj, new_y)`, or both
axes at the same time with :cpp:expr:`lv_obj_set_pos(obj, new_x, new_y)`.

.. raw:: html

   </details> 
   <br>


您可以使用 :cpp:expr:`lv_obj_set_x(obj, new_x)` 和  :cpp:expr:`lv_obj_set_y(obj, new_y)` 设置相对于父级的位置，或者使用 :cpp:expr:`lv_obj_set_pos(obj, new_x, new_y)` 来同时设置两个轴的位置。


.. _lv_obj_alignment:

Alignment（对齐）
^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can align the object on its parent with
:cpp:expr:`lv_obj_set_align(obj, LV_ALIGN_...)`. After this every x and y
setting will be relative to the set alignment mode. For example, this
will shift the object by 10;20 px from the center of its parent:

.. code:: c

   lv_obj_set_align(obj, LV_ALIGN_CENTER);
   lv_obj_set_pos(obj, 10, 20);

   //Or in one function
   lv_obj_align(obj, LV_ALIGN_CENTER, 10, 20);

To align one object to another use:
:cpp:expr:`lv_obj_align_to(obj_to_align, obj_reference, LV_ALIGN_..., x, y)`

For example, to align a text below an image:
:cpp:expr:`lv_obj_align_to(text, image, LV_ALIGN_OUT_BOTTOM_MID, 0, 10)`.

The following align types exist: |image1|

.. raw:: html

   </details> 
   <br>


您可以使用 :cpp:expr:`lv_obj_set_align(obj, LV_ALIGN_...)` 将对象参照其父对象对齐。此后，每个 x 和 y 设置都将适用于设置对齐模式。例如，这会将对象从其父对象的中心移动 10(x)，20(y) 像素：

.. code:: c

   lv_obj_set_align(obj, LV_ALIGN_CENTER);
   lv_obj_set_pos(obj, 10, 20);

   //Or in one function
   lv_obj_align(obj, LV_ALIGN_CENTER, 10, 20);

要将一个对象参照另一个对象对齐，请使用 :cpp:expr:`lv_obj_align_to(obj_to_align, obj_reference, LV_ALIGN_..., x, y)`

例如，让图片下方的文本参照图片对齐：:cpp:expr:`lv_obj_align_to(text, image, LV_ALIGN_OUT_BOTTOM_MID, 0, 10)`。

存在以下对齐类型：|image1|


.. _lv_obj_parents_and_children:

Parents and children（父母和孩子）
---------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can set a new parent for an object with
:cpp:expr:`lv_obj_set_parent(obj, new_parent)`. To get the current parent, use
:cpp:expr:`lv_obj_get_parent(obj)`.

To get a specific child of a parent use :cpp:expr:`lv_obj_get_child(parent, idx)`. Some examples for ``idx``:

- ``0`` get the child created first
- ``1`` get the child created second
- ``-1`` get the child created last

The children can be iterated like this:

.. code:: c

   uint32_t i;
   for(i = 0; i < lv_obj_get_child_count(parent); i++) {
     lv_obj_t * child = lv_obj_get_child(parent, i);
     /*Do something with child*/
   }

:cpp:expr:`lv_obj_get_index(obj)` returns the index of the object in its parent.
It is equivalent to the number of younger children in the parent.

You can bring an object to the foreground or send it to the background
with :cpp:expr:`lv_obj_move_foreground(obj)` and
:cpp:expr:`lv_obj_move_background(obj)`.

You can change the index of an object in its parent using
:cpp:expr:`lv_obj_move_to_index(obj, index)`.

You can swap the position of two objects with
:cpp:expr:`lv_obj_swap(obj1, obj2)`.

.. raw:: html

   </details> 
   <br>


您可以使用 :cpp:expr:`lv_obj_set_parent(obj, new_parent)` 为对象设置新的父级。要获取当前父级，请使用 :cpp:expr:`lv_obj_get_parent(obj)`。

要获取父母的特定孩子，请使用 :cpp:expr:`lv_obj_get_child(parent, idx)`。 ``idx`` 的一些示例：
 
- ``0`` 获取创建的第一个子项
- ``1`` 获取创建的第二个子项
- ``-1`` 获取最后创建的子项

父级的孩子们可以这样迭代:

.. code:: c

   uint32_t i;
   for(i = 0; i < lv_obj_get_child_count(parent); i++) {
     lv_obj_t * child = lv_obj_get_child(parent, i);
     /*Do something with child*/
   }

:cpp:expr:`lv_obj_get_index(obj)` 返回对象在其父对象中的索引。 它相当于父对象拥有的孩子数量。

您可以使用 :cpp:expr:`lv_obj_move_foreground(obj)` 和 :cpp:expr:`lv_obj_move_background(obj)` 将对象带到前台或将其发移到后台。

您可以使用 :cpp:expr:`lv_obj_move_to_index(obj, index)` 更改对象在其父对象中的索引。

你可以用 :cpp:expr:`lv_obj_swap(obj1, obj2)`; 交换两个对象的位置(列表框中，它可用于对列表框项目进行排序。)。


.. _lv_obj_display_and_screens:

Display and Screens（显示和屏幕）
--------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

At the highest level of the LVGL object hierarchy is the *display* which
represents the driver for a display device (physical display or
simulator). A display can have one or more screens associated with it.
Each screen contains a hierarchy of objects for graphical widgets
representing a layout that covers the entire display.

When you have created a screen like
``lv_obj_t * screen = lv_obj_create(NULL)``, you can make it active with
:cpp:expr:`lv_screen_load(screen)`. The :cpp:func:`lv_screen_active` function gives you a
pointer to the active screen.

If you have multiple displays, it's important to know that the screen
functions operate on the most recently created display or the one
explicitly selected with :cpp:func:`lv_display_set_default`.

To get an object's screen use the :cpp:expr:`lv_obj_get_screen(obj)` function.

.. raw:: html

   </details> 
   <br>


在 LVGL 中，对象层次结构的最高级别是 display，它代表显示设备（物理显示器或模拟器）的驱动程序。 一个显示器可以有一个或多个与其相关联的屏幕。 每个屏幕都包含图形组件的对象层次结构，代表覆盖整个显示的布局。

当你创建了一个像 ``lv_obj_t * screen = lv_obj_create(NULL)`` 这样的屏幕时，你可以用 :cpp:expr:`lv_screen_load(screen)` 激活它。 :cpp:func:`lv_screen_active` 函数为您提供指向活动屏幕的指针。

如果您有多个显示器，重要的是要知道，最后创建的显示器时指定了屏幕，或者是用 :cpp:func:`lv_display_set_default` 明确切换的。

要获取对象的屏幕，请使用 :cpp:expr:`lv_obj_get_screen(obj)` 函数。


.. _lv_obj_overview_events:

Events（事件）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To set an event callback for an object, use
:cpp:expr:`lv_obj_add_event_cb(obj, event_cb, LV_EVENT_..., user_data)`,

To manually send an event to an object, use
:cpp:expr:`lv_event_send(obj, LV_EVENT_..., param)`

Read the :ref:`Event overview <events>` to learn more about
events.

.. raw:: html

   </details> 
   <br>


要为对象设置事件回调，请使用 :cpp:expr:`lv_obj_add_event_cb(obj, event_cb, LV_EVENT_..., user_data)` ，

要手动向对象发送事件，请使用 :cpp:expr:`lv_event_send(obj, LV_EVENT_..., param)`;

阅读 :ref:`事件概述 <events>` 页面，以了解有关事件的更多信息。


.. _lv_obj_styles:

Styles（样式）
--------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Be sure to read the :ref:`Style overview <styles>`. Here only the
most essential functions are described.

A new style can be added to an object with the
:cpp:expr:`lv_obj_add_style(obj, &new_style, selector)` function. ``selector``
is an ORed combination of part and state(s). E.g.
:cpp:expr:`LV_PART_SCROLLBAR | LV_STATE_PRESSED`.

The base objects use :cpp:enumerator:`LV_PART_MAIN` style properties and
:cpp:enumerator:`LV_PART_SCROLLBAR` with the typical background style properties.

.. raw:: html

   </details> 
   <br>


这里只介绍最基本的功能，请务必阅读 :ref:`样式概述 <styles>`。页面详细了解。

可以使用 :cpp:expr:`lv_obj_add_style(obj, &new_style, selector)` 函数向对象添加新样式。 ``selector`` 可以组合使用。 例如 :cpp:expr:`LV_PART_SCROLLBAR | LV_STATE_PRESSED`。

基本对象使用 :cpp:enumerator:`LV_PART_MAIN` 样式属性和带有典型背景样式属性的 :cpp:enumerator:`LV_PART_SCROLLBAR` 。


.. _lv_obj_flags:

Flags（宏开关）
--------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

There are some attributes which can be enabled/disabled by
``lv_obj_add/remove_flag(obj, LV_OBJ_FLAG_...)`` and ``lv_obj_set_flag(obj, LV_OBJ_FLAG_..., true/false)``

-  :cpp:enumerator:`LV_OBJ_FLAG_HIDDEN` Make the object hidden. (Like it wasn't there at all)
-  :cpp:enumerator:`LV_OBJ_FLAG_CLICKABLE` Make the object clickable by input devices
-  :cpp:enumerator:`LV_OBJ_FLAG_CLICK_FOCUSABLE` Add focused state to the object when clicked
-  :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` Toggle checked state when the object is clicked
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLLABLE` Make the object scrollable
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_ELASTIC` Allow scrolling inside but with slower speed
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_MOMENTUM` Make the object scroll further when "thrown"
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_ONE` Allow scrolling only one snappable children
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_CHAIN_HOR` Allow propagating the horizontal scroll to a parent
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_CHAIN_VER` Allow propagating the vertical scroll to a parent
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_CHAIN` Simple packaging for (:cpp:expr:`LV_OBJ_FLAG_SCROLL_CHAIN_HOR | LV_OBJ_FLAG_SCROLL_CHAIN_VER`)
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_ON_FOCUS` Automatically scroll object to make it visible when focused
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_WITH_ARROW` Allow scrolling the focused object with arrow keys
-  :cpp:enumerator:`LV_OBJ_FLAG_SNAPPABLE` If scroll snap is enabled on the parent it can snap to this object
-  :cpp:enumerator:`LV_OBJ_FLAG_PRESS_LOCK` Keep the object pressed even if the press slid from the object
-  :cpp:enumerator:`LV_OBJ_FLAG_EVENT_BUBBLE` Propagate the events to the parent too
-  :cpp:enumerator:`LV_OBJ_FLAG_GESTURE_BUBBLE` Propagate the gestures to the parent
-  :cpp:enumerator:`LV_OBJ_FLAG_ADV_HITTEST` Allow performing more accurate hit (click) test. E.g. accounting for rounded corners
-  :cpp:enumerator:`LV_OBJ_FLAG_IGNORE_LAYOUT` Make the object positionable by the layouts
-  :cpp:enumerator:`LV_OBJ_FLAG_FLOATING` Do not scroll the object when the parent scrolls and ignore layout
-  :cpp:enumerator:`LV_OBJ_FLAG_SEND_DRAW_TASK_EVENTS` Enable sending ``LV_EVENT_DRAW_TASK_ADDED`` events
-  :cpp:enumerator:`LV_OBJ_FLAG_OVERFLOW_VISIBLE` Do not clip the children's content to the parent's boundary
-  :cpp:enumerator:`LV_OBJ_FLAG_FLEX_IN_NEW_TRACK` Start a new flex track on this item
-  :cpp:enumerator:`LV_OBJ_FLAG_LAYOUT_1` Custom flag, free to use by layouts
-  :cpp:enumerator:`LV_OBJ_FLAG_LAYOUT_2` Custom flag, free to use by layouts
-  :cpp:enumerator:`LV_OBJ_FLAG_WIDGET_1` Custom flag, free to use by widget
-  :cpp:enumerator:`LV_OBJ_FLAG_WIDGET_2` Custom flag, free to use by widget
-  :cpp:enumerator:`LV_OBJ_FLAG_USER_1` Custom flag, free to use by user
-  :cpp:enumerator:`LV_OBJ_FLAG_USER_2` Custom flag, free to use by user
-  :cpp:enumerator:`LV_OBJ_FLAG_USER_3` Custom flag, free to use by user
-  :cpp:enumerator:`LV_OBJ_FLAG_USER_4` Custom flag, free to use by user

Some examples:

.. raw:: html

   </details> 
   <br>


有一些属性可以通过 ``lv_obj_add/remove_flag(obj, LV_OBJ_FLAG_...)`` 和 ``lv_obj_set_flag(obj, LV_OBJ_FLAG_..., true/false)``启用/禁用：

-  :cpp:enumerator:`LV_OBJ_FLAG_HIDDEN` 隐藏对象。 （就像它根本不存在一样）
-  :cpp:enumerator:`LV_OBJ_FLAG_CLICKABLE` 使输入设备可点击对象
-  :cpp:enumerator:`LV_OBJ_FLAG_CLICK_FOCUSABLE` 单击时将焦点状态添加到对象
-  :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` 对象被点击时切换选中状态
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLLABLE` 使对象可滚动
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_ELASTIC` 允许在内部滚动但速度较慢
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_MOMENTUM` 在“抛出”时使对象滚动得更远
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_ONE` 只允许滚动一个可捕捉的子项
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_CHAIN_HOR` 允许将水平滚动传播到父级
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_CHAIN_VER` 允许将垂直滚动传播到父级
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_CHAIN` 简单的包装 (:cpp:expr:`LV_OBJ_FLAG_SCROLL_CHAIN_HOR | LV_OBJ_FLAG_SCROLL_CHAIN_VER`)
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_ON_FOCUS` 自动滚动对象以使其在聚焦时可见
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_WITH_ARROW` 允许使用箭头键滚动聚焦对象
-  :cpp:enumerator:`LV_OBJ_FLAG_SNAPPABLE` 如果在父对象上启用了滚动捕捉，它可以捕捉到这个对象
-  :cpp:enumerator:`LV_OBJ_FLAG_PRESS_LOCK` 保持对象被按下，即使按下从对象上滑动
-  :cpp:enumerator:`LV_OBJ_FLAG_EVENT_BUBBLE` 也将事件传播给父级
-  :cpp:enumerator:`LV_OBJ_FLAG_GESTURE_BUBBLE` 将手势传播给父级
-  :cpp:enumerator:`LV_OBJ_FLAG_ADV_HITTEST` 允许执行更准确的命中（点击）测试。例如考虑圆角。
-  :cpp:enumerator:`LV_OBJ_FLAG_IGNORE_LAYOUT` 使对象可以通过布局定位
-  :cpp:enumerator:`LV_OBJ_FLAG_FLOATING` 当父级滚动时不要滚动对象并忽略布局
-  :cpp:enumerator:`LV_OBJ_FLAG_SEND_DRAW_TASK_EVENTS` 启用 ``LV_EVENT_DRAW_TASK_ADDED`` 发送事件
-  :cpp:enumerator:`LV_OBJ_FLAG_OVERFLOW_VISIBLE` 不要将子项的内容剪裁到父项的边界
-  :cpp:enumerator:`LV_OBJ_FLAG_FLEX_IN_NEW_TRACK` 在此项目上启动新的弹性轨道
-  :cpp:enumerator:`LV_OBJ_FLAG_LAYOUT_1` 自定义标志，可供布局免费使用
-  :cpp:enumerator:`LV_OBJ_FLAG_LAYOUT_2` 自定义标志，可供布局免费使用
-  :cpp:enumerator:`LV_OBJ_FLAG_WIDGET_1` 自定义标志，组件免费使用
-  :cpp:enumerator:`LV_OBJ_FLAG_WIDGET_2` 自定义标志，组件免费使用
-  :cpp:enumerator:`LV_OBJ_FLAG_USER_1` 自定义标志，用户免费使用
-  :cpp:enumerator:`LV_OBJ_FLAG_USER_2` 自定义标志，用户免费使用
-  :cpp:enumerator:`LV_OBJ_FLAG_USER_3` 自定义标志，用户免费使用
-  :cpp:enumerator:`LV_OBJ_FLAG_USER_4` 自定义标志，用户免费使用

示例：


.. code:: c

   /*Hide on object*/
   lv_obj_add_flag(obj, LV_OBJ_FLAG_HIDDEN);

   /*Make an object non-clickable*/
   lv_obj_remove_flag(obj, LV_OBJ_FLAG_CLICKABLE);

.. _lv_obj_groups:

Groups（组）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Read the :ref:`Input devices overview <indev>` to learn more
about *Groups*.

Objects are added to a *group* with :cpp:expr:`lv_group_add_obj(group, obj)`,
and you can use :cpp:expr:`lv_obj_get_group(obj)` to see which group an object
belongs to.

:cpp:expr:`lv_obj_is_focused(obj)` returns if the object is currently focused on
its group or not. If the object is not added to a group, ``false`` will
be returned.

.. raw:: html

   </details> 
   <br>


阅读 :ref:`输入设备概述 <indev>` 以了解有关 Groups 的更多信息。

使用 :cpp:expr:`lv_group_add_obj(group, obj)` 将对象添加到组，您可以使用 :cpp:expr:`lv_obj_get_group(obj)` 查看对象属于哪个组。

:cpp:expr:`lv_obj_is_focused(obj)` 返回对象当前是否聚焦在其组上。 如果对象未添加到组中，则将返回 ``false`` 。


.. _lv_obj_extended_click_area:

Extended click area（拓展的点击区域）
------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

By default, the objects can be clicked only within their bounding area.
However, this can be extended with
:cpp:expr:`lv_obj_set_ext_click_area(obj, size)`.

.. raw:: html

   </details> 
   <br>


默认情况下，只能在其边界区域内单击对象。 但是，这可以通过 :cpp:expr:`lv_obj_set_ext_click_area(obj, size)` 进行扩展。

.. _events-1:

.. _lv_obj_events:

Events（事件）
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` when the :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` flag is
   enabled and the object clicked (on transition to/from the checked state)

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 当标志是 :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` 启用并单击对象（在转换到/从选中状态转换时）

详细了解更多 :ref:`events`。


.. _lv_obj_keys:

Keys（按键）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

If :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` is enabled, :cpp:enumerator:`LV_KEY_RIGHT` and
:cpp:enumerator:`LV_KEY_UP` make the object checked, and :cpp:enumerator:`LV_KEY_LEFT` and
:cpp:enumerator:`LV_KEY_DOWN` make it unchecked.

If :cpp:enumerator:`LV_OBJ_FLAG_SCROLLABLE` is enabled, but the object is not editable
(as declared by the widget class), the arrow keys (:cpp:enumerator:`LV_KEY_UP`,
:cpp:enumerator:`LV_KEY_DOWN`, :cpp:enumerator:`LV_KEY_LEFT`, :cpp:enumerator:`LV_KEY_RIGHT`) scroll the object.
If the object can only scroll vertically, :cpp:enumerator:`LV_KEY_LEFT` and
:cpp:enumerator:`LV_KEY_RIGHT` will scroll up/down instead, making it compatible with
an encoder input device. See :ref:`Input devices overview <indev>` for
more on encoder behaviors and the edit mode.

Learn more about :ref:`indev_keys`.

.. |image1| image:: /misc/align.png

.. raw:: html

   </details> 
   <br>


如果启用了 :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` ，则 :cpp:enumerator:`LV_KEY_RIGHT` 和 :cpp:enumerator:`LV_KEY_UP` 使对象被选中，而 :cpp:enumerator:`LV_KEY_LEFT` 和 :cpp:enumerator:`LV_KEY_DOWN` 使其取消选中。

如果启用了 :cpp:enumerator:`LV_OBJ_FLAG_SCROLLABLE` ，但对象不可编辑（由组件类声明），则箭头键(:cpp:enumerator:`LV_KEY_UP`, :cpp:enumerator:`LV_KEY_DOWN`, :cpp:enumerator:`LV_KEY_LEFT`, :cpp:enumerator:`LV_KEY_RIGHT`) 滚动对象。 如果对象只能垂直滚动，:cpp:enumerator:`LV_KEY_RIGHT` 和 :cpp:enumerator:`LV_KEY_LEFT` 将改为向上/向下滚动，使其与编码器输入设备兼容。 有关编码器行为和编辑模式的更多信息，请参阅 :ref:`输入设备概述 <indev>` 。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_obj_example:

Example
*******

.. include:: ../examples/widgets/obj/index.rst

.. _lv_obj_api:

API
***
