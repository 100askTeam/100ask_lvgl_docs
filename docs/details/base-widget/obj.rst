.. _widget_basics:

=============
Widget Basics
=============



What is a Widget?
*****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

A Widget is the **basic building block** of the LVGL user interface.

Examples of Widgets:  :ref:`Base Widget (and Screen) <base_widget>`,
:ref:`Button <lv_button>`, :ref:`Label <lv_label>`,
:ref:`Image <lv_image>`, :ref:`List <lv_list>`,
:ref:`Chart <lv_chart>` and :ref:`Text Area <lv_textarea>`.

See :ref:`widgets` to see all Widget types.

All Widgets are referenced using an :cpp:type:`lv_obj_t` pointer as a handle.
This pointer can later be used to read or change the Widget's attributes.

.. raw:: html

   </details>
   <br>

Widget 是 LVGL 用户界面的**基本构建块**。

Widget 的例子有：:ref:`Base Widget（和 Screen）<base_widget>`、
:ref:`Button <lv_button>`、:ref:`Label <lv_label>`、
:ref:`Image <lv_image>`、:ref:`List <lv_list>`、
:ref:`Chart <lv_chart>` 和 :ref:`Text Area <lv_textarea>`。

参见 :ref:`widgets` 以查看所有类型的 Widget。

所有 Widget 都使用一个 :cpp:type:`lv_obj_t` 指针作为句柄进行引用。
此指针稍后可用于读取或更改 Widget 的属性。


.. _base_widget:

Base Widget
***********

.. raw:: html

   <details>
     <summary>显示原文</summary>

The most fundamental of all Widgets is the Base Widget, on which all other widgets
are based.  From an Object-Oriented perspective, think of the Base Widget as the
Widget class from which all other Widgets inherit.

The functions and functionalities of the Base Widget can be used with
other widgets as well.  For example :cpp:expr:`lv_obj_set_width(slider, 100)`.

The Base Widget can be used directly as a simple widget.  While it is a simple
rectangle, it has a large number of features shared with all Widgets, detailed
below and in subsequent pages.  In HTML terms, think of it as a ``<div>``.

.. raw:: html

   </details>
   <br>

所有 Widgets 中最基本的是基础 Widget，所有其他 Widgets 都基于它构建。从面向对象的角度来看，可以将基础 Widget 视作所有其他 Widgets 继承的 Widget 类。

基础 Widget 的函数和功能也可以与其他 Widgets 一起使用。例如 :cpp:expr:`lv_obj_set_width(slider, 100)`。

基础 Widget 可以直接用作一个简单的 Widget。虽然它只是一个简单的矩形，但它具有与所有 Widgets 共享的大量特性，这些将在下文及后续页面中详细介绍。用 HTML 的术语来说，可以把它看作是一个 ``<div>``。


.. _widget_attributes:

Attributes
**********


Basic attributes
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

All Widget types share some basic attributes:

- Position
- Size
- Parent
- Styles
- Events it emits
- Flags like *Clickable*, *Scollable*, etc.
- Etc.

You can set/get these attributes with ``lv_obj_set_...`` and
``lv_obj_get_...`` functions. For example:

.. code-block:: c

   /* Set basic Widget attributes */
   lv_obj_set_size(btn1, 100, 50);   /* Set a button's size */
   lv_obj_set_pos(btn1, 20,30);      /* Set a button's position */

For complete details on position, size, coordinates and layouts, see :ref:`coord`.

.. raw:: html

   </details>
   <br>

所有 Widget 类型共享一些基本属性：

- 位置
- 尺寸
- 父级
- 样式
- 它发出的事件
- 标志，如 *Clickable*, *Scollable* 等
- 等等

您可以使用 ``lv_obj_set_...`` 和 ``lv_obj_get_...`` 函数来设置/获取这些属性。例如：

.. code-block:: c

   /* 设置基本 Widget 属性 */
   lv_obj_set_size(btn1, 100, 50);   /* 设置按钮的尺寸 */
   lv_obj_set_pos(btn1, 20, 30);     /* 设置按钮的位置 */

有关位置、尺寸、坐标和布局的完整详细信息，请参见 :ref:`coord`。

Widget-specific attributes
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Widget types have special attributes as well. For example, a slider has

- Minimum and maximum values
- Current value

For these special attributes, every Widget type may have unique API
functions. For example for a slider:

.. code-block:: c

   /* Set slider specific attributes */
   lv_slider_set_range(slider1, 0, 100);               /* Set the min. and max. values */
   lv_slider_set_value(slider1, 40, LV_ANIM_ON);       /* Set the current value (position) */

The API of the widgets is described in their
:ref:`Documentation <widgets>` but you can also check the respective
header files (e.g. *widgets/lv_slider.h*)

.. raw:: html

   </details>
   <br>

Widget 类型还具有特殊的属性。例如，滑块（slider）有

- 最小值和最大值
- 当前值

对于这些特殊属性，每种 Widget 类型可能都有独特的 API 函数。例如对于滑块（slider）：

.. code-block:: c

   /* 设置滑块特有的属性 */
   lv_slider_set_range(slider1, 0, 100);               /* 设置最小值和最大值 */
   lv_slider_set_value(slider1, 40, LV_ANIM_ON);       /* 设置当前值（位置），并开启动画 */

Widget 的 API 在其 :ref:`Documentation <widgets>` 中有描述，您也可以检查相应的头文件（例如 *widgets/lv_slider.h*）。


.. _lv_obj_parents_and_children:

Parents and children
--------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

A Widget's parent is set when the widget is created --- the parent is passed to the
creation function.

To get a Widget's current parent, use :cpp:expr:`lv_obj_get_parent(widget)`.

You can move the Widget to a new parent with :cpp:expr:`lv_obj_set_parent(widget, new_parent)`.

To get a specific child of a parent use :cpp:expr:`lv_obj_get_child(parent, idx)`.
Some examples for ``idx``:

- ``0`` get the child created first
- ``1`` get the child created second
- ``-1`` get the child created last

You can iterate through a parent Widget's children like this:

.. code-block:: c

    uint32_t i;
    for(i = 0; i < lv_obj_get_child_count(parent); i++) {
        lv_obj_t * child = lv_obj_get_child(parent, i);
        /* Do something with child. */
    }

:cpp:expr:`lv_obj_get_index(widget)` returns the index of the Widget in its parent.
It is equivalent to the number of older children in the parent.

You can bring a Widget to the foreground or send it to the background with
:cpp:expr:`lv_obj_move_foreground(widget)` and :cpp:expr:`lv_obj_move_background(widget)`.

You can change the index of a Widget in its parent using :cpp:expr:`lv_obj_move_to_index(widget, index)`.

You can swap the position of two Widgets with :cpp:expr:`lv_obj_swap(widget1, widget2)`.

To get a Widget's Screen (highest-level parent) use :cpp:expr:`lv_obj_get_screen(widget)`.

.. raw:: html

   </details>
   <br>

Widget 的父级是在创建 Widget 时设置的——父级被传递给创建函数。

要获取 Widget 的当前父级，使用 :cpp:expr:`lv_obj_get_parent(widget)`。

你可以使用 :cpp:expr:`lv_obj_set_parent(widget, new_parent)` 将 Widget 移动到一个新的父级。

要获取父级的特定子 Widget，使用 :cpp:expr:`lv_obj_get_child(parent, idx)`。
``idx`` 的一些例子如下：

- ``0`` 获取最先创建的子 Widget
- ``1`` 获取第二个创建的子 Widget
- ``-1`` 获取最后创建的子 Widget

你可以像这样迭代一个父级 Widget 的所有子 Widget：

.. code-block:: c

    uint32_t i;
    for(i = 0; i < lv_obj_get_child_count(parent); i++) {
        lv_obj_t * child = lv_obj_get_child(parent, i);
        /* 对子 Widget 执行某些操作。*/
    }

:cpp:expr:`lv_obj_get_index(widget)` 返回 Widget 在其父级中的索引。它相当于在父级中比它早创建的子 Widget 数量。

你可以使用 :cpp:expr:`lv_obj_move_foreground(widget)` 和 :cpp:expr:`lv_obj_move_background(widget)` 将 Widget 移动到前景或发送到背景。

你可以使用 :cpp:expr:`lv_obj_move_to_index(widget, index)` 改变 Widget 在其父级中的索引。

你可以使用 :cpp:expr:`lv_obj_swap(widget1, widget2)` 交换两个 Widget 的位置。

要获取 Widget 的 Screen（最高级别的父级），使用 :cpp:expr:`lv_obj_get_screen(widget)`。

.. _widget_working_mechanisms:

Working Mechanisms
******************

Parent-child structure
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

A parent Widget can be considered as the container of its children.  Every Widget has
exactly one parent Widget (except Screens), but a parent Widget can have any number
of children.  There is no limitation for the type of the parent but there are Widgets
which are typically a parent (e.g. button) or a child (e.g. label).

.. raw:: html

   </details>
   <br>

一个父级 Widget 可以被视为其子 Widget 的容器。每个 Widget 恰好有一个父级 Widget（除了 Screens 之外），
但是一个父级 Widget 可以拥有任意数量的子 Widget。
对于父级的类型没有限制，但有一些通常是作为父级的 Widgets（例如按钮 button）或作为子级的 Widgets（例如标签 label）。

Moving together
---------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If the position of a parent changes, the children will move along with
it. Therefore, all positions are relative to the parent.

.. image:: /misc/par_child1.png

.. code-block:: c

   lv_obj_t * parent = lv_obj_create(lv_screen_active());  /* Create a parent Widget on current screen */
   lv_obj_set_size(parent, 100, 80);                       /* Set size of parent */

   lv_obj_t * obj1 = lv_obj_create(parent);                /* Create a Widget on previously created parent Widget */
   lv_obj_set_pos(widget1, 10, 10);                        /* Set position of new Widget */

Modify the position of the parent:

.. image:: /misc/par_child2.png

.. code-block:: c

   lv_obj_set_pos(parent, 50, 50); /* Move the parent. The child will move with it. */

(For simplicity the adjusting of colors of the Widgets is not shown in
the example.)

.. raw:: html

   </details>
   <br>

如果父级的位置发生变化，子 Widget 将会随之移动。因此，所有位置都是相对于父级的。

.. image:: /misc/par_child1.png

.. code-block:: c

   lv_obj_t * parent = lv_obj_create(lv_screen_active());  /* 在当前屏幕上创建一个父级 Widget */
   lv_obj_set_size(parent, 100, 80);                       /* 设置父级的尺寸 */

   lv_obj_t * obj1 = lv_obj_create(parent);                /* 在先前创建的父级 Widget 上创建一个 Widget */
   lv_obj_set_pos(widget1, 10, 10);                        /* 设置新 Widget 的位置 */

修改父级的位置：

.. image:: /misc/par_child2.png

.. code-block:: c

   lv_obj_set_pos(parent, 50, 50); /* 移动父级。子级将随之移动。 */

（为了简化起见，本例中未显示调整 Widget 颜色的操作。）

Visibility only on the parent
-----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If a child is partially or fully outside its parent then the parts
outside will not be visible.

.. image:: /misc/par_child3.png

.. code-block:: c

   lv_obj_set_x(widget1, -30);    /* Move the child a little bit off the parent */

This behavior can be overwritten with
:cpp:expr:`lv_obj_add_flag(widget, LV_OBJ_FLAG_OVERFLOW_VISIBLE)` which allow the
children to be drawn out of the parent. In addition to this, you must register
the following event callback (this was not required in previous versions).

Note: ``ext_width`` should be the maximum absolute width the children will be
drawn within.

.. code-block:: c

    static void ext_draw_size_event_cb(lv_event_t * e)
    {
        lv_event_set_ext_draw_size(e, 30); /*Set 30px extra draw area around the widget*/
    }

.. raw:: html

   </details>
   <br>

如果子级部分或完全位于其父级之外，则外部的部分将不会被显示。

.. image:: /misc/par_child3.png

.. code-block:: c

   lv_obj_set_x(widget1, -30);    /* 将子级稍微移出父级 */

这种行为可以通过 :cpp:expr:`lv_obj_add_flag(widget, LV_OBJ_FLAG_OVERFLOW_VISIBLE)` 来覆盖，它允许子级在父级之外绘制。除此之外，你必须注册以下事件回调（这在之前的版本中是不需要的）。

注意： ``ext_width`` 应该是子级将被绘制在内的最大绝对宽度。

.. code-block:: c

    static void ext_draw_size_event_cb(lv_event_t * e)
    {
        lv_event_set_ext_draw_size(e, 30); /* 设置 widget 周围 30px 的额外绘制区域 */
    }


Create and delete Widgets
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

In LVGL, Widgets can be created and deleted dynamically at run time. It
means only the currently created (existing) Widgets consume RAM.

This allows for the creation of a screen just when a button is clicked
to open it, and for deletion of screens when a new screen is loaded.

UIs can be created based on the current environment of the device. For
example one can create meters, charts, bars and sliders based on the
currently attached sensors.

Every widget has its own **create** function with a prototype like this:

.. code-block:: c

   lv_obj_t * lv_<widget>_create(lv_obj_t * parent, <other parameters if any>);

Typically, the create functions only have a ``parent`` parameter telling
them on which Widget to create the new Widget.

The return value is a pointer to the created Widget with :cpp:type:`lv_obj_t` ``*``
type.

There is a common **delete** function for all Widget types. It deletes
the Widget and all of its children.

.. code-block:: c

   void lv_obj_delete(lv_obj_t * widget);

:cpp:func:`lv_obj_delete` will delete the Widget immediately. If for any reason you
can't delete the Widget immediately you can use
:cpp:expr:`lv_obj_delete_async(widget)` which will perform the deletion on the next
call of :cpp:func:`lv_timer_handler`. This is useful e.g. if you want to
delete the parent of a Widget in the child's :cpp:enumerator:`LV_EVENT_DELETE`
handler.

You can remove all the children of a Widget (but not the Widget itself)
using :cpp:expr:`lv_obj_clean(widget)`.

You can use :cpp:expr:`lv_obj_delete_delayed(widget, 1000)` to delete a Widget after
some time. The delay is expressed in milliseconds.

Sometimes you're not sure whether a Widget was deleted and you need some way to
check if it's still "alive". Anytime before the Widget is deleted, you can use
cpp:expr:`lv_obj_null_on_delete(&widget)` to cause your Widget pointer to be set to ``NULL``
when the Widget is deleted.

Make sure the pointer variable itself stays valid until the Widget is deleted. Here
is an example:

.. code:: c

   void some_timer_callback(lv_timer_t * t)
   {
      static lv_obj_t * my_label;
      if(my_label == NULL) {
         my_label = lv_label_create(lv_screen_active());
         lv_obj_delete_delayed(my_label, 1000);
         lv_obj_null_on_delete(&my_label);
      }
      else {
         lv_obj_set_x(my_label, lv_obj_get_x(my_label) + 1);
      }
   }

.. raw:: html

   </details>
   <br>

在 LVGL 中，Widgets 可以在运行时动态创建和删除。这意味着只有当前创建（存在的）Widgets 会消耗 RAM。

这允许在一个按钮被点击打开一个屏幕时创建该屏幕，并在加载新屏幕时删除旧屏幕。

用户界面可以根据设备的当前环境创建。例如，可以基于当前连接的传感器创建仪表、图表、条形图和滑块。

每个 widget 都有自己的 **create** 函数，其原型如下：

.. code-block:: c

   lv_obj_t * lv_<widget>_create(lv_obj_t * parent, <other parameters if any>);

通常，创建函数仅有一个 ``parent`` 参数，用于告知在哪个 Widget 上创建新的 Widget。

返回值是指向创建的 Widget 的指针，类型为 :cpp:type:`lv_obj_t` ``*``。

所有 Widget 类型都有一个通用的 **delete** 函数。它会删除 Widget 及其所有子级。

.. code-block:: c

   void lv_obj_delete(lv_obj_t * widget);

:cpp:func:`lv_obj_delete` 将立即删除 Widget。如果由于任何原因不能立即删除 Widget，你可以使用
:cpp:expr:`lv_obj_delete_async(widget)`，它将在下一次调用 :cpp:func:`lv_timer_handler` 时执行删除操作。这在你想要在子级的 :cpp:enumerator:`LV_EVENT_DELETE` 处理程序中删除父级 Widget 时非常有用。

你可以通过 :cpp:expr:`lv_obj_clean(widget)` 移除 Widget 的所有子级（但不包括 Widget 本身）。

你可以使用 :cpp:expr:`lv_obj_delete_delayed(widget, 1000)` 在一段时间后删除 Widget。延迟是以毫秒为单位表示的。

有时你不确定 Widget 是否已被删除，并且需要某种方法来检查它是否仍然“存活”。在 Widget 被删除之前任何时候，你可以使用 cpp:expr:`lv_obj_null_on_delete(&widget)`，以便在 Widget 被删除时将其指针设置为 ``NULL``。

确保指针变量本身保持有效直到 Widget 被删除。以下是一个示例：

.. code:: c

   void some_timer_callback(lv_timer_t * t)
   {
      static lv_obj_t * my_label;
      if(my_label == NULL) {
         my_label = lv_label_create(lv_screen_active());
         lv_obj_delete_delayed(my_label, 1000);
         lv_obj_null_on_delete(&my_label);
      }
      else {
         lv_obj_set_x(my_label, lv_obj_get_x(my_label) + 1);
      }
   }

.. _screens:

Screens
*******

What are Screens?
-----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Not to be confused with a :ref:`display`, Screens are simply any Widget created
without a parent (i.e. passing NULL for the ``parent`` argument during creation).  As
such, they form the "root" of a Widget Tree.

Normally the Base Widget is used for this purpose since it has all the features most
Screens need.  But an :ref:`lv_image` Widget can also be used to create a wallpaper
background for the Widget Tree.

All Screens:

- are automatically attached to the :ref:`default_display` current when the Screen
  was created;
- automatically occupy the full area of the associated display;
- cannot be moved, i.e. functions such as :cpp:func:`lv_obj_set_pos` and
  :cpp:func:`lv_obj_set_size` cannot be used on screens.

Each :ref:`display` object can have multiple screens associated with it, but not vice
versa.  Thus the relationship::

       Display
          |
         --- (one or more)
         /|\
    Screen Widgets  (root of a Widget Tree)
          |
          O  (zero or more)
         /|\
    Child Widgets

.. raw:: html

   </details>
   <br>

不要与 :ref:`display` 混淆，Screens 仅仅是创建时不带父级（即在创建时为 ``parent`` 参数传递 NULL）的任何 Widget。因此，它们构成了 Widget 树的“根”。

通常情况下，基础 Widget 用于此目的，因为它具备大多数 Screens 所需的所有特性。但是，也可以使用 :ref:`lv_image` Widget 来为 Widget 树创建壁纸背景。

所有 Screens：

- 在创建 Screen 时自动附加到 :ref:`default_display`；
- 自动占用关联显示的整个区域；
- 不能被移动，即不能在屏幕上使用诸如 :cpp:func:`lv_obj_set_pos` 和 :cpp:func:`lv_obj_set_size` 等函数。

每个 :ref:`display` 对象可以有多个与之关联的 Screens，但反之则不行。因此关系如下::

       Display
          |
         --- （一个或多个）
         /|\
    Screen Widgets  （Widget 树的根）
          |
          O  （零个或多个）
         /|\
    Child Widgets

Creating Screens
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Screens are created like this:

.. code-block:: c

   lv_obj_t * scr1 = lv_obj_create(NULL);

Screens can be deleted with :cpp:expr:`lv_obj_delete(scr)`, but be sure you do not
delete the :ref:`active_screen`.

.. raw:: html

   </details>
   <br>

Screens 是这样创建的：

.. code-block:: c

   lv_obj_t * scr1 = lv_obj_create(NULL);

可以使用 :cpp:expr:`lv_obj_delete(scr)` 删除 Screens，但请确保不要删除 :ref:`active_screen`。

.. _active_screen:

Active Screen
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

While each :ref:`display` object can have any number of Screens Widgets associated
with it, only one of those Screens is considered "Active" at any given time.  That
Screen is referred to as the Display's "Active Screen".  For this reason, only one
Screen and its child Widgets will ever be shown on a display at one time.

When each :ref:`display` object was created, a default screen was created with it and
set as its "Active Screen".

To get a pointer to the "Active Screen", call :cpp:func:`lv_screen_active`.

To set a Screen to be the "Active Screen", call :cpp:func:`lv_screen_load` or
:cpp:func:`lv_screen_load_anim`.

.. raw:: html

   </details>
   <br>

虽然每个 :ref:`display` 对象可以有关联的任意数量的 Screen Widgets，但在任何给定时间只考虑其中一个 Screen 是“Active”的。该 Screen 被称为 Display 的“Active Screen”。因此，一次只有一个 Screen 及其子 Widgets 会在一个显示上显示。

当每个 :ref:`display` 对象被创建时，会与之一起创建一个默认屏幕，并设置为其“Active Screen”。

要获取指向“Active Screen”的指针，请调用 :cpp:func:`lv_screen_active`。

要将一个 Screen 设置为“Active Screen”，请调用 :cpp:func:`lv_screen_load` 或 :cpp:func:`lv_screen_load_anim`。


.. _loading_screens:

Loading Screens
---------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To load a new screen, use :cpp:expr:`lv_screen_load(scr1)`.  This sets ``scr1`` as
the Active Screen.

.. raw:: html

   </details>
   <br>

要加载新屏幕，请使用：cpp:expr:`lv_screen_load（scr1）`。这将 ``scr1``设置为
活动屏幕。

Load Screen with Animation
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

A new screen can be loaded with animation by using
:cpp:expr:`lv_screen_load_anim(scr, transition_type, time, delay, auto_del)`. The
following transition types exist:

- :cpp:enumerator:`LV_SCR_LOAD_ANIM_NONE`: Switch immediately after ``delay`` milliseconds
- :cpp:enumerator:`LV_SCR_LOAD_ANIM_OVER_LEFT`, :cpp:enumerator:`LV_SCR_LOAD_ANIM_OVER_RIGHT`, :cpp:enumerator:`LV_SCR_LOAD_ANIM_OVER_TOP` and :cpp:enumerator:`LV_SCR_LOAD_ANIM_OVER_BOTTOM`: Move the new screen over the current towards the given direction
- :cpp:enumerator:`LV_SCR_LOAD_ANIM_OUT_LEFT`, :cpp:enumerator:`LV_SCR_LOAD_ANIM_OUT_RIGHT`, :cpp:enumerator:`LV_SCR_LOAD_ANIM_OUT_TOP` and :cpp:enumerator:`LV_SCR_LOAD_ANIM_OUT_BOTTOM`: Move out the old screen over the current towards the given direction
- :cpp:enumerator:`LV_SCR_LOAD_ANIM_MOVE_LEFT`, :cpp:enumerator:`LV_SCR_LOAD_ANIM_MOVE_RIGHT`, :cpp:enumerator:`LV_SCR_LOAD_ANIM_MOVE_TOP` and :cpp:enumerator:`LV_SCR_LOAD_ANIM_MOVE_BOTTOM`: Move both the current and new screens towards the given direction
- :cpp:enumerator:`LV_SCR_LOAD_ANIM_FADE_IN` and :cpp:enumerator:`LV_SCR_LOAD_ANIM_FADE_OUT`: Fade the new screen over the old screen, or vice versa

Setting ``auto_del`` to ``true`` will automatically delete the old
screen when the animation is finished.

The new screen will become active (returned by :cpp:func:`lv_screen_active`) when
the animation starts after ``delay`` time. All inputs are disabled
during the screen animation.

.. raw:: html

   </details>
   <br>

可以通过使用 :cpp:expr:`lv_screen_load_anim(scr, transition_type, time, delay, auto_del)` 带动画加载新的屏幕。存在以下过渡类型：

- :cpp:enumerator:`LV_SCR_LOAD_ANIM_NONE`：在 ``delay`` 毫秒后立即切换
- :cpp:enumerator:`LV_SCR_LOAD_ANIM_OVER_LEFT`，:cpp:enumerator:`LV_SCR_LOAD_ANIM_OVER_RIGHT`，:cpp:enumerator:`LV_SCR_LOAD_ANIM_OVER_TOP` 和 :cpp:enumerator:`LV_SCR_LOAD_ANIM_OVER_BOTTOM`：将新屏幕沿给定方向移动到当前屏幕上
- :cpp:enumerator:`LV_SCR_LOAD_ANIM_OUT_LEFT`，:cpp:enumerator:`LV_SCR_LOAD_ANIM_OUT_RIGHT`，:cpp:enumerator:`LV_SCR_LOAD_ANIM_OUT_TOP` 和 :cpp:enumerator:`LV_SCR_LOAD_ANIM_OUT_BOTTOM`：将旧屏幕沿给定方向移出当前屏幕
- :cpp:enumerator:`LV_SCR_LOAD_ANIM_MOVE_LEFT`，:cpp:enumerator:`LV_SCR_LOAD_ANIM_MOVE_RIGHT`，:cpp:enumerator:`LV_SCR_LOAD_ANIM_MOVE_TOP` 和 :cpp:enumerator:`LV_SCR_LOAD_ANIM_MOVE_BOTTOM`：将当前和新屏幕都沿给定方向移动
- :cpp:enumerator:`LV_SCR_LOAD_ANIM_FADE_IN` 和 :cpp:enumerator:`LV_SCR_LOAD_ANIM_FADE_OUT`：新屏幕覆盖旧屏幕或反之渐显

将 ``auto_del`` 设置为 ``true`` 会在动画结束后自动删除旧的屏幕。

新屏幕将在 ``delay`` 时间过后，当动画开始时变为活动状态（由 :cpp:func:`lv_screen_active` 返回）。在屏幕动画期间，所有输入都将被禁用。

.. _layers_overview:

Layers
------

.. raw:: html

   <details>
     <summary>显示原文</summary>

When an ``lv_display_t`` object is created, 4 Screens (layers) are created and
attached to it.

1.  Bottom Layer
2.  Active Screen
3.  Top Layer
4.  System Layer

1, 3 and 4 are independent of the :ref:`active_screen` and they will be shown (if
they contain anything that is visible) regardless of which screen is the Active
Screen.  See :ref:`screen_layers` for more information.

.. raw:: html

   </details>
   <br>

当创建一个 ``lv_display_t`` 对象时，会创建4个 Screens（层）并附着到它上面。

1. Bottom Layer
2. Active Screen
3. Top Layer
4. System Layer

1、3 和 4 层独立于 :ref:`active_screen`，如果它们包含任何可见的内容，则无论哪个屏幕是 Active Screen 都会显示。更多详情请参见 :ref:`screen_layers`。

.. _transparent_screens:

Transparent Screens
-------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Usually, the opacity of the Screen is :cpp:enumerator:`LV_OPA_COVER` to provide a
solid background for its children. If this is not the case (opacity <
100%) the display's ``bottom_layer`` will be visible.  If the bottom layer's
opacity is also not :cpp:enumerator:`LV_OPA_COVER` LVGL will have no solid background
to draw.

This configuration (transparent Screen) could be useful to create, for example,
on-screen display (OSD) menus where a video is played on a different hardware layer
of the display panel, and a menu is overlaid on a higher layer.

To properly render a UI on a transparent Screen the Display's color format needs to
be set to one with an alpha channel (for example LV_COLOR_FORMAT_ARGB8888).

In summary, to enable transparent screens and displays for OSD menu-like UIs:

- Set the screen's ``bg_opa`` to transparent:
  :cpp:expr:`lv_obj_set_style_bg_opa(lv_screen_active(), LV_OPA_TRANSP, LV_PART_MAIN)`
- Set the bottom layer's ``bg_opa`` to transparent:
  :cpp:expr:`lv_obj_set_style_bg_opa(lv_layer_bottom(), LV_OPA_TRANSP, LV_PART_MAIN)`
- Set a color format with alpha channel. E.g.
  :cpp:expr:`lv_display_set_color_format(disp, LV_COLOR_FORMAT_ARGB8888)`

.. raw:: html

   </details>
   <br>

通常，Screen 的不透明度为 :cpp:enumerator:`LV_OPA_COVER` 以为其子级提供一个实心背景。如果不是这种情况（不透明度 < 100%），则 display 的 ``bottom_layer`` 将会可见。如果 bottom layer 的不透明度也非 :cpp:enumerator:`LV_OPA_COVER`，LVGL 将没有实心背景来绘制。

这种配置（透明 Screen）对于创建例如屏幕显示（OSD）菜单非常有用，在这种情况下，视频在一个不同的硬件层播放，而菜单则覆盖在显示器面板的更高层上。

为了正确地在透明屏幕上渲染 UI，display 的颜色格式需要设置为带有 alpha 通道的一种（例如 LV_COLOR_FORMAT_ARGB8888）。

总而言之，要启用适用于类似 OSD 菜单 UI 的透明屏幕和显示：

- 将屏幕的 ``bg_opa`` 设置为透明：
  :cpp:expr:`lv_obj_set_style_bg_opa(lv_screen_active(), LV_OPA_TRANSP, LV_PART_MAIN)`
- 将 bottom layer 的 ``bg_opa`` 设置为透明：
  :cpp:expr:`lv_obj_set_style_bg_opa(lv_layer_bottom(), LV_OPA_TRANSP, LV_PART_MAIN)`
- 设置带有 alpha 通道的颜色格式。例如：
  :cpp:expr:`lv_display_set_color_format(disp, LV_COLOR_FORMAT_ARGB8888)`

.. _widget_parts:

Parts
*****

.. raw:: html

   <details>
     <summary>显示原文</summary>

The widgets are built from multiple parts. For example a
:ref:`Base Widget <base_widget>` uses the main and scrollbar parts but a
:ref:`Slider <lv_slider>` uses the main, indicator and knob parts.
Parts are similar to *pseudo-elements* in CSS.

The following predefined parts exist in LVGL:

- :cpp:enumerator:`LV_PART_MAIN`: A background like rectangle
- :cpp:enumerator:`LV_PART_SCROLLBAR`: The scrollbar(s)
- :cpp:enumerator:`LV_PART_INDICATOR`: Indicator, e.g. for slider, bar, switch, or the tick box of the checkbox
- :cpp:enumerator:`LV_PART_KNOB`: Like a handle to grab to adjust the value
- :cpp:enumerator:`LV_PART_SELECTED`: Indicate the currently selected option or section
- :cpp:enumerator:`LV_PART_ITEMS`: Used if the widget has multiple similar elements (e.g. table cells)
- :cpp:enumerator:`LV_PART_CURSOR`: Mark a specific place e.g. text area's or chart's cursor
- :cpp:enumerator:`LV_PART_CUSTOM_FIRST`: Custom parts can be added from here.

The main purpose of parts is to allow styling the "components" of the
widgets. They are described in more detail in the
:ref:`Style overview <styles>` section.

.. raw:: html

   </details>
   <br>

Widgets 是由多个部分构建而成的。例如，:ref:`Base Widget <base_widget>` 使用主部分和滚动条部分，而 :ref:`Slider <lv_slider>` 则使用主部分、指示器部分和旋钮部分。这些部分类似于 CSS 中的 *伪元素*。

LVGL 中存在以下预定义的部分：

- :cpp:enumerator:`LV_PART_MAIN`：类似背景的矩形
- :cpp:enumerator:`LV_PART_SCROLLBAR`：滚动条
- :cpp:enumerator:`LV_PART_INDICATOR`：指示器，例如用于滑块、进度条、开关或复选框的勾选框
- :cpp:enumerator:`LV_PART_KNOB`：如同一个可以抓取来调整值的手柄
- :cpp:enumerator:`LV_PART_SELECTED`：指示当前选定的选项或部分
- :cpp:enumerator:`LV_PART_ITEMS`：如果 Widget 包含多个相似元素时使用（例如表格单元格）
- :cpp:enumerator:`LV_PART_CURSOR`：标记特定位置，例如文本区域或图表的光标
- :cpp:enumerator:`LV_PART_CUSTOM_FIRST`：可以从这里添加自定义部分。

部分的主要目的是允许对 Widgets 的“组件”进行样式设置。它们在 :ref:`Style overview <styles>` 部分中有更详细的描述。


.. _widget_states:

States
******

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Widget can be in a combination of the following states:

- :cpp:enumerator:`LV_STATE_DEFAULT`: Normal, released state
- :cpp:enumerator:`LV_STATE_CHECKED`: Toggled or checked state
- :cpp:enumerator:`LV_STATE_FOCUSED`: Focused via keypad or encoder or clicked via touchpad/mouse
- :cpp:enumerator:`LV_STATE_FOCUS_KEY`: Focused via keypad or encoder but not via touchpad/mouse
- :cpp:enumerator:`LV_STATE_EDITED`: Edit by an encoder
- :cpp:enumerator:`LV_STATE_HOVERED`: Hovered by mouse (not supported now)
- :cpp:enumerator:`LV_STATE_PRESSED`: Being pressed
- :cpp:enumerator:`LV_STATE_SCROLLED`: Being scrolled
- :cpp:enumerator:`LV_STATE_DISABLED`: Disabled state
- :cpp:enumerator:`LV_STATE_USER_1`: Custom state
- :cpp:enumerator:`LV_STATE_USER_2`: Custom state
- :cpp:enumerator:`LV_STATE_USER_3`: Custom state
- :cpp:enumerator:`LV_STATE_USER_4`: Custom state

The states are usually automatically changed by the library as the user
interacts with a Widget (presses, releases, focuses, etc.). However,
the states can be changed manually as well. To set or clear given state (but
leave the other states untouched) use
:cpp:expr:`lv_obj_add_state(widget, LV_STATE_...)` and
:cpp:expr:`lv_obj_remove_state(widget, LV_STATE_...)`.  In both cases OR-ed state
values can be used as well. E.g.
:cpp:expr:`lv_obj_add_state(widget, part, LV_STATE_PRESSED | LV_PRESSED_CHECKED)`.

To learn more about the states read the related section of the
:ref:`Style overview <styles>`.

.. raw:: html

   </details>
   <br>

Widget 可以处于以下状态的组合中：

- :cpp:enumerator:`LV_STATE_DEFAULT`：正常、释放状态
- :cpp:enumerator:`LV_STATE_CHECKED`：切换或选中状态
- :cpp:enumerator:`LV_STATE_FOCUSED`：通过键盘或编码器聚焦，或者通过触摸板/鼠标点击聚焦
- :cpp:enumerator:`LV_STATE_FOCUS_KEY`：仅通过键盘或编码器聚焦，而不是通过触摸板/鼠标
- :cpp:enumerator:`LV_STATE_EDITED`：通过编码器编辑
- :cpp:enumerator:`LV_STATE_HOVERED`：通过鼠标悬停（目前不支持）
- :cpp:enumerator:`LV_STATE_PRESSED`：被按下
- :cpp:enumerator:`LV_STATE_SCROLLED`：正在滚动
- :cpp:enumerator:`LV_STATE_DISABLED`：禁用状态
- :cpp:enumerator:`LV_STATE_USER_1`：自定义状态
- :cpp:enumerator:`LV_STATE_USER_2`：自定义状态
- :cpp:enumerator:`LV_STATE_USER_3`：自定义状态
- :cpp:enumerator:`LV_STATE_USER_4`：自定义状态

这些状态通常由库根据用户与 Widget 的交互（按压、释放、聚焦等）自动更改。然而，也可以手动更改状态。要设置或清除给定状态（但保留其他状态不变），请使用
:cpp:expr:`lv_obj_add_state(widget, LV_STATE_...)` 和
:cpp:expr:`lv_obj_remove_state(widget, LV_STATE_...)`。在这两种情况下都可以使用 OR 连接的状态值。例如：
:cpp:expr:`lv_obj_add_state(widget, part, LV_STATE_PRESSED | LV_STATE_CHECKED)`。

要了解更多关于状态的信息，请阅读 :ref:`Style overview <styles>` 的相关部分。


.. _lv_obj_flags:

Flags
*****

.. raw:: html

   <details>
     <summary>显示原文</summary>

There are some Widget attributes which can be enabled/disabled by
:cpp:expr:`lv_obj_add_flag(widget, LV_OBJ_FLAG_...)` and
:cpp:expr:`lv_obj_remove_flag(widget, LV_OBJ_FLAG_...)`.

-  :cpp:enumerator:`LV_OBJ_FLAG_HIDDEN` Make the Widget hidden. (Like it wasn't there at all)
-  :cpp:enumerator:`LV_OBJ_FLAG_CLICKABLE` Make the Widget clickable by input devices
-  :cpp:enumerator:`LV_OBJ_FLAG_CLICK_FOCUSABLE` Add focused state to the Widget when clicked
-  :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` Toggle checked state when the Widget is clicked
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLLABLE` Make the Widget scrollable
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_ELASTIC` Allow scrolling inside but with slower speed
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_MOMENTUM` Make the Widget scroll further when "thrown"
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_ONE` Allow scrolling only one snappable children
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_CHAIN_HOR` Allow propagating the horizontal scroll to a parent
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_CHAIN_VER` Allow propagating the vertical scroll to a parent
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_CHAIN` Simple packaging for (:cpp:expr:`LV_OBJ_FLAG_SCROLL_CHAIN_HOR | LV_OBJ_FLAG_SCROLL_CHAIN_VER`)
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_ON_FOCUS` Automatically scroll Widget to make it visible when focused
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_WITH_ARROW` Allow scrolling the focused Widget with arrow keys
-  :cpp:enumerator:`LV_OBJ_FLAG_SNAPPABLE` If scroll snap is enabled on the parent it can snap to this Widget
-  :cpp:enumerator:`LV_OBJ_FLAG_PRESS_LOCK` Keep the Widget pressed even if the press slid from the Widget
-  :cpp:enumerator:`LV_OBJ_FLAG_EVENT_BUBBLE` Propagate the events to the parent as well
-  :cpp:enumerator:`LV_OBJ_FLAG_GESTURE_BUBBLE` Propagate the gestures to the parent
-  :cpp:enumerator:`LV_OBJ_FLAG_ADV_HITTEST` Allow performing more accurate hit (click) test. E.g. accounting for rounded corners
-  :cpp:enumerator:`LV_OBJ_FLAG_IGNORE_LAYOUT` Make the Widget not positioned by the layouts
-  :cpp:enumerator:`LV_OBJ_FLAG_FLOATING` Do not scroll the Widget when the parent scrolls and ignore layout
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

.. code-block:: c

    /* Hide on Widget */
    lv_obj_add_flag(widget, LV_OBJ_FLAG_HIDDEN);

    /* Make a Widget non-clickable */
    lv_obj_remove_flag(widget, LV_OBJ_FLAG_CLICKABLE);

.. raw:: html

   </details>
   <br>

有一些 Widget 属性可以通过
:cpp:expr:`lv_obj_add_flag(widget, LV_OBJ_FLAG_...)` 和
:cpp:expr:`lv_obj_remove_flag(widget, LV_OBJ_FLAG_...)` 来启用或禁用。

-  :cpp:enumerator:`LV_OBJ_FLAG_HIDDEN` 使 Widget 隐藏。（就像它完全不存在一样）
-  :cpp:enumerator:`LV_OBJ_FLAG_CLICKABLE` 使 Widget 可以通过输入设备点击
-  :cpp:enumerator:`LV_OBJ_FLAG_CLICK_FOCUSABLE` 点击时为 Widget 添加聚焦状态
-  :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` 当 Widget 被点击时切换选中状态
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLLABLE` 使 Widget 可滚动
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_ELASTIC` 允许内部滚动但速度较慢
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_MOMENTUM` 当“抛出”Widget 时使其滚动更远
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_ONE` 仅允许滚动一个可停靠的子元素
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_CHAIN_HOR` 允许将水平滚动传播给父级
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_CHAIN_VER` 允许将垂直滚动传播给父级
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_CHAIN` 简单包装 (:cpp:expr:`LV_OBJ_FLAG_SCROLL_CHAIN_HOR | LV_OBJ_FLAG_SCROLL_CHAIN_VER`)
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_ON_FOCUS` 聚焦时自动滚动 Widget 以使其可见
-  :cpp:enumerator:`LV_OBJ_FLAG_SCROLL_WITH_ARROW` 允许使用箭头键滚动聚焦的 Widget
-  :cpp:enumerator:`LV_OBJ_FLAG_SNAPPABLE` 如果父级启用了滚动停靠，则可以停靠到此 Widget
-  :cpp:enumerator:`LV_OBJ_FLAG_PRESS_LOCK` 即使按压滑出 Widget 也保持按压状态
-  :cpp:enumerator:`LV_OBJ_FLAG_EVENT_BUBBLE` 向父级传播事件
-  :cpp:enumerator:`LV_OBJ_FLAG_GESTURE_BUBBLE` 向父级传播手势
-  :cpp:enumerator:`LV_OBJ_FLAG_ADV_HITTEST` 允许执行更准确的点击测试。例如，考虑圆角
-  :cpp:enumerator:`LV_OBJ_FLAG_IGNORE_LAYOUT` 使 Widget 不受布局定位影响
-  :cpp:enumerator:`LV_OBJ_FLAG_FLOATING` 当父级滚动时不滚动该 Widget，并忽略布局
-  :cpp:enumerator:`LV_OBJ_FLAG_SEND_DRAW_TASK_EVENTS` 启用发送 ``LV_EVENT_DRAW_TASK_ADDED`` 事件
-  :cpp:enumerator:`LV_OBJ_FLAG_OVERFLOW_VISIBLE` 不裁剪子元素的内容至父级边界
-  :cpp:enumerator:`LV_OBJ_FLAG_FLEX_IN_NEW_TRACK` 在此项目上开始一个新的 flex 轨道
-  :cpp:enumerator:`LV_OBJ_FLAG_LAYOUT_1` 自定义标志，由布局自由使用
-  :cpp:enumerator:`LV_OBJ_FLAG_LAYOUT_2` 自定义标志，由布局自由使用
-  :cpp:enumerator:`LV_OBJ_FLAG_WIDGET_1` 自定义标志，由 widget 自由使用
-  :cpp:enumerator:`LV_OBJ_FLAG_WIDGET_2` 自定义标志，由 widget 自由使用
-  :cpp:enumerator:`LV_OBJ_FLAG_USER_1` 自定义标志，由用户自由使用
-  :cpp:enumerator:`LV_OBJ_FLAG_USER_2` 自定义标志，由用户自由使用
-  :cpp:enumerator:`LV_OBJ_FLAG_USER_3` 自定义标志，由用户自由使用
-  :cpp:enumerator:`LV_OBJ_FLAG_USER_4` 自定义标志，由用户自由使用

一些例子：

.. code-block:: c

    /* 隐藏 Widget */
    lv_obj_add_flag(widget, LV_OBJ_FLAG_HIDDEN);

    /* 使 Widget 不可点击 */
    lv_obj_remove_flag(widget, LV_OBJ_FLAG_CLICKABLE);


.. _lv_obj_events:

Base-Widget Events
******************

.. _widget_events:

Events from Input Devices
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_PRESSED`              Widget has been pressed.
-  :cpp:enumerator:`LV_EVENT_PRESSING`             Widget is being pressed (sent continuously while pressing).
-  :cpp:enumerator:`LV_EVENT_PRESS_LOST`           Widget is still being pressed but slid cursor/finger off Widget.
-  :cpp:enumerator:`LV_EVENT_SHORT_CLICKED`        Widget was pressed for a short period of time, then released. Not sent if scrolled.
-  :cpp:enumerator:`LV_EVENT_SINGLE_CLICKED`       Sent for first short click within a small distance and short time.
-  :cpp:enumerator:`LV_EVENT_DOUBLE_CLICKED`       Sent for second short click within small distance and short time.
-  :cpp:enumerator:`LV_EVENT_TRIPLE_CLICKED`       Sent for third short click within small distance and short time.
-  :cpp:enumerator:`LV_EVENT_LONG_PRESSED`         Object has been pressed for at least `long_press_time`.  Not sent if scrolled.
-  :cpp:enumerator:`LV_EVENT_LONG_PRESSED_REPEAT`  Sent after `long_press_time` in every `long_press_repeat_time` ms.  Not sent if scrolled.
-  :cpp:enumerator:`LV_EVENT_CLICKED`              Sent on release if not scrolled (regardless to long press).
-  :cpp:enumerator:`LV_EVENT_RELEASED`             Sent in every cases when Widget has been released.
-  :cpp:enumerator:`LV_EVENT_SCROLL_BEGIN`         Scrolling begins. The event parameter is a pointer to the animation of the scroll. Can be modified.
-  :cpp:enumerator:`LV_EVENT_SCROLL_THROW_BEGIN`   Received when scrolling begins.
-  :cpp:enumerator:`LV_EVENT_SCROLL_END`           Scrolling ended.
-  :cpp:enumerator:`LV_EVENT_SCROLL`               Scrolling
-  :cpp:enumerator:`LV_EVENT_GESTURE`              A gesture is detected. Get gesture with `lv_indev_get_gesture_dir(lv_indev_active());`
-  :cpp:enumerator:`LV_EVENT_KEY`                  A key is sent to Widget. Get key with `lv_indev_get_key(lv_indev_active());`
-  :cpp:enumerator:`LV_EVENT_FOCUSED`              Widget received focus,
-  :cpp:enumerator:`LV_EVENT_DEFOCUSED`            Widget's focus has been lost.
-  :cpp:enumerator:`LV_EVENT_LEAVE`                Widget's focus has been lost but is still selected.
-  :cpp:enumerator:`LV_EVENT_HIT_TEST`             Perform advanced hit-testing.

.. raw:: html

   </details>
   <br>

-  :cpp:enumerator:`LV_EVENT_PRESSED`              Widget 已被按下。
-  :cpp:enumerator:`LV_EVENT_PRESSING`             Widget 正在被按下（在按压期间持续发送）。
-  :cpp:enumerator:`LV_EVENT_PRESS_LOST`           Widget 仍然被按下，但滑动的光标/手指离开了 Widget。
-  :cpp:enumerator:`LV_EVENT_SHORT_CLICKED`        Widget 被短时间按下，然后释放。如果滚动则不发送。
-  :cpp:enumerator:`LV_EVENT_SINGLE_CLICKED`       在小距离和短时间内第一次短点击时发送。
-  :cpp:enumerator:`LV_EVENT_DOUBLE_CLICKED`       在小距离和短时间内第二次短点击时发送。
-  :cpp:enumerator:`LV_EVENT_TRIPLE_CLICKED`       在小距离和短时间内第三次短点击时发送。
-  :cpp:enumerator:`LV_EVENT_LONG_PRESSED`         对象已被按下至少 `long_press_time`。如果滚动则不发送。
-  :cpp:enumerator:`LV_EVENT_LONG_PRESSED_REPEAT`  在 `long_press_time` 后每 `long_press_repeat_time` 毫秒发送一次。如果滚动则不发送。
-  :cpp:enumerator:`LV_EVENT_CLICKED`              如果没有滚动（不论长按与否），在释放时发送。
-  :cpp:enumerator:`LV_EVENT_RELEASED`             在 Widget 被释放的所有情况下发送。
-  :cpp:enumerator:`LV_EVENT_SCROLL_BEGIN`         滚动开始。事件参数是指向滚动动画的指针。可以修改。
-  :cpp:enumerator:`LV_EVENT_SCROLL_THROW_BEGIN`   当滚动开始时接收。
-  :cpp:enumerator:`LV_EVENT_SCROLL_END`           滚动结束。
-  :cpp:enumerator:`LV_EVENT_SCROLL`               滚动中
-  :cpp:enumerator:`LV_EVENT_GESTURE`              检测到手势。通过 `lv_indev_get_gesture_dir(lv_indev_active());` 获取手势。
-  :cpp:enumerator:`LV_EVENT_KEY`                  键被发送到 Widget。通过 `lv_indev_get_key(lv_indev_active());` 获取键。
-  :cpp:enumerator:`LV_EVENT_FOCUSED`              Widget 收到焦点，
-  :cpp:enumerator:`LV_EVENT_DEFOCUSED`            Widget 失去了焦点。
-  :cpp:enumerator:`LV_EVENT_LEAVE`                Widget 失去了焦点但仍然被选中。
-  :cpp:enumerator:`LV_EVENT_HIT_TEST`             执行高级命中测试。

Special Events
--------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` when the :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` flag is
   enabled and the Widget was clicked (on transition to/from the checked state)

.. raw:: html

   </details>
   <br>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 当启用了 :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` 标志并且 Widget 被点击（在切换到/从选中状态过渡时）

Drawing Events
--------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_DRAW_MAIN`            Performing drawing of main part
-  :cpp:enumerator:`LV_EVENT_DRAW_MAIN_BEGIN`      Starting drawing of main part
-  :cpp:enumerator:`LV_EVENT_DRAW_MAIN_END`        Finishing drawing of main part
-  :cpp:enumerator:`LV_EVENT_DRAW_POST`            Perform the post draw phase (when all children are drawn)
-  :cpp:enumerator:`LV_EVENT_DRAW_POST_BEGIN`      Starting the post draw phase (when all children are drawn)
-  :cpp:enumerator:`LV_EVENT_DRAW_POST_END`        Finishing the post draw phase (when all children are drawn)

.. raw:: html

   </details>
   <br>

-  :cpp:enumerator:`LV_EVENT_DRAW_MAIN`            执行主部分的绘制
-  :cpp:enumerator:`LV_EVENT_DRAW_MAIN_BEGIN`      开始绘制主部分
-  :cpp:enumerator:`LV_EVENT_DRAW_MAIN_END`        完成绘制主部分
-  :cpp:enumerator:`LV_EVENT_DRAW_POST`            执行后绘制阶段（当所有子元素都被绘制后）
-  :cpp:enumerator:`LV_EVENT_DRAW_POST_BEGIN`      开始后绘制阶段（当所有子元素都被绘制后）
-  :cpp:enumerator:`LV_EVENT_DRAW_POST_END`        完成后绘制阶段（当所有子元素都被绘制后）

Other Events
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_DELETE`               Object is being deleted
-  :cpp:enumerator:`LV_EVENT_CHILD_CHANGED`        Child was removed, added, or its size, position were changed
-  :cpp:enumerator:`LV_EVENT_CHILD_CREATED`        Child was created, always bubbles up to all parents
-  :cpp:enumerator:`LV_EVENT_CHILD_DELETED`        Child was deleted, always bubbles up to all parents
-  :cpp:enumerator:`LV_EVENT_SIZE_CHANGED`         Object coordinates/size have changed
-  :cpp:enumerator:`LV_EVENT_STYLE_CHANGED`        Object's style has changed
-  :cpp:enumerator:`LV_EVENT_LAYOUT_CHANGED`       A child's position has changed due to a layout recalculation (when container has flex or grid layout style)
-  :cpp:enumerator:`LV_EVENT_GET_SELF_SIZE`        Get internal size of a widget

.. admonition::  Further Reading

    Learn more about :ref:`events`.

.. raw:: html

   </details>
   <br>

-  :cpp:enumerator:`LV_EVENT_DELETE`               对象正在被删除
-  :cpp:enumerator:`LV_EVENT_CHILD_CHANGED`        子元素被移除、添加，或者其大小、位置发生了变化
-  :cpp:enumerator:`LV_EVENT_CHILD_CREATED`        子元素被创建，总是会冒泡到所有父级
-  :cpp:enumerator:`LV_EVENT_CHILD_DELETED`        子元素被删除，总是会冒泡到所有父级
-  :cpp:enumerator:`LV_EVENT_SIZE_CHANGED`         对象坐标/大小已更改
-  :cpp:enumerator:`LV_EVENT_STYLE_CHANGED`        对象的样式已更改
-  :cpp:enumerator:`LV_EVENT_LAYOUT_CHANGED`       由于布局重新计算（当容器具有 flex 或 grid 布局样式时），子元素的位置发生了变化
-  :cpp:enumerator:`LV_EVENT_GET_SELF_SIZE`        获取 widget 的内部尺寸

.. admonition::  Further Reading

    Learn more about :ref:`events`.

.. _lv_obj_keys:

Keys
****

.. raw:: html

   <details>
     <summary>显示原文</summary>

If :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` is enabled, :cpp:enumerator:`LV_KEY_RIGHT` and
:cpp:enumerator:`LV_KEY_UP` make the Widget checked, and :cpp:enumerator:`LV_KEY_LEFT` and
:cpp:enumerator:`LV_KEY_DOWN` make it unchecked.

If :cpp:enumerator:`LV_OBJ_FLAG_SCROLLABLE` is enabled, but the Widget is not editable
(as declared by the widget class), the arrow keys (:cpp:enumerator:`LV_KEY_UP`,
:cpp:enumerator:`LV_KEY_DOWN`, :cpp:enumerator:`LV_KEY_LEFT`, :cpp:enumerator:`LV_KEY_RIGHT`) scroll the Widget.
If the Widget can only scroll vertically, :cpp:enumerator:`LV_KEY_LEFT` and
:cpp:enumerator:`LV_KEY_RIGHT` will scroll up/down instead, making it compatible with
an encoder input device. See :ref:`Input devices overview <indev>` for
more on encoder behaviors and the edit mode.

.. admonition::  Further Reading

    Learn more about :ref:`indev_keys`.


.. raw:: html

   </details>
   <br>

如果启用了 :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE`，:cpp:enumerator:`LV_KEY_RIGHT` 和
:cpp:enumerator:`LV_KEY_UP` 会使 Widget 处于选中状态，而 :cpp:enumerator:`LV_KEY_LEFT` 和
:cpp:enumerator:`LV_KEY_DOWN` 则使其取消选中。

如果启用了 :cpp:enumerator:`LV_OBJ_FLAG_SCROLLABLE`，但 Widget 不是可编辑的
（由 widget 类声明），那么箭头键 (:cpp:enumerator:`LV_KEY_UP`，
:cpp:enumerator:`LV_KEY_DOWN`，:cpp:enumerator:`LV_KEY_LEFT`，:cpp:enumerator:`LV_KEY_RIGHT`) 将滚动 Widget。
如果 Widget 仅能垂直滚动，则 :cpp:enumerator:`LV_KEY_LEFT` 和
:cpp:enumerator:`LV_KEY_RIGHT` 将改为上下滚动，使其与编码器输入设备兼容。关于编码器行为和编辑模式的更多信息，请参阅 :ref:`Input devices overview <indev>`。

.. admonition::  Further Reading

    了解更多关于 :ref:`indev_keys` 的信息。

.. _widget_snapshot:

Snapshot
********

.. raw:: html

   <details>
     <summary>显示原文</summary>

A snapshot image can be generated for a Widget together with its
children. Check details in :ref:`snapshot`.

.. raw:: html

   </details>
   <br>

可以为小部件生成快照图像及其
孩子们。查看详情 :ref:`snapshot`。

Example
*******

.. include:: ../../examples/widgets/obj/index.rst



.. _lv_obj_api:

API
***
