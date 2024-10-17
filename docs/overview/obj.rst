.. _objects:

===============
Objects（对象）
===============

.. raw:: html

   <details>
     <summary>显示原文</summary>

In LVGL the **basic building blocks** of a user interface are the
objects, also called *Widgets*. For example a
:ref:`Button <lv_button>`, :ref:`Label <lv_label>`,
:ref:`Image <lv_image>`, :ref:`List <lv_list>`,
:ref:`Chart <lv_chart>` or :ref:`Text area <lv_textarea>`.

You can see all the :ref:`Object types <widgets>` here.

All objects are referenced using an :cpp:type:`lv_obj_t` pointer as a handle.
This pointer can later be used to set or get the attributes of the
object.

.. raw:: html

   </details>
   <br>


在LVGL中，用户界面的 **基本组成部分** 是对象，也称为 *控件*。例如，一个 :ref:`按钮 <lv_button>`、:ref:`标签 <lv_label>`、:ref:`图像 <lv_image>`、:ref:`列表 <lv_list>`、:ref:`图表 <lv_chart>` 或者 :ref:`文本区域 <lv_textarea>`。

您可以在这里查看所有的 :ref:`对象类型 <widgets>`。

所有的对象都使用 :cpp:type:`lv_obj_t` 类型的指针作为句柄进行引用。之后可以使用该指针来设置或获取对象的属性。


.. _objects_attributes:

Attributes（属性）
******************

Basic attributes（基本属性）
----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

All object types share some basic attributes:

- Position
- Size
- Parent
- Styles
- Event handlers
- Etc

You can set/get these attributes with ``lv_obj_set_...`` and
``lv_obj_get_...`` functions. For example:

.. code:: c

   /*Set basic object attributes*/
   lv_obj_set_size(btn1, 100, 50);   /*Set a button's size*/
   lv_obj_set_pos(btn1, 20,30);      /*Set a button's position*/

To see all the available functions visit the :ref:`Base object's documentation <lv_obj>`.

.. raw:: html

   </details>
   <br>


所有的对象类型都有一些通用的基本属性：

- 位置
- 大小
- 父对象
- 样式
- 事件处理程序
- 等等

您可以使用 ``lv_obj_set_...`` 和 ``lv_obj_get_...`` 函数设置或者获取这些属性。例如：

.. code:: c

   /*设置基本对象属性*/
   lv_obj_set_size(btn1, 100, 50);   /*设置按钮的大小*/
   lv_obj_set_pos(btn1, 20,30);      /*设置按钮的位置*/

您可以在这里查看所有的函数接口：:ref:`基本对象的文档 <lv_obj>`。


Specific attributes（特殊属性）
-------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The object types have special attributes too. For example, a slider has

- Minimum and maximum values
- Current value

For these special attributes, every object type may have unique API
functions. For example for a slider:

.. code:: c

   /*Set slider specific attributes*/
   lv_slider_set_range(slider1, 0, 100);                   /*Set the min. and max. values*/
   lv_slider_set_value(slider1, 40, LV_ANIM_ON);       /*Set the current value (position)*/

The API of the widgets is described in their
:ref:`Documentation <widgets>` but you can also check the respective
header files (e.g. *widgets/lv_slider.h*)

.. raw:: html

   </details>
   <br>


对象类型也有特殊的属性。例如，滑块有：

- 最小值和最大值
- 当前值

针对这些特殊属性，每个对象类型可能有独特的API函数。例如，对于滑块：

.. code:: c

   /*设置滑块特定属性*/
   lv_slider_set_range(slider1, 0, 100);                   /*设置最小值和最大值*/
   lv_slider_set_value(slider1, 40, LV_ANIM_ON);       /*设置当前值（位置）*/

所有控件的API在它们各自的 :ref:`文档 <widgets>` 中有描述，但您也可以查看相应的头文件（例如， *widgets/lv_slider.h*）


.. _objects_working_mechanisms:

Working mechanisms（工作机制）
******************************

Parent-child structure（父子结构）
----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

A parent object can be considered as the container of its children.
Every object has exactly one parent object (except screens), but a
parent can have any number of children. There is no limitation for the
type of the parent but there are objects which are typically a parent
(e.g. button) or a child (e.g. label).

.. raw:: html

   </details>
   <br>


一个父对象可以被视为其子对象的容器。每个对象都都必须会有且仅有一个父对象（屏幕除外），但一个父对象可以有任意数量的子对象。
父对象的类型没有限制，但是有些对象一般是父对象（例如按钮）或者是子对象（例如标签）。


Moving together（一起移动）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If the position of a parent changes, the children will move along with
it. Therefore, all positions are relative to the parent.

.. image:: /misc/par_child1.png

.. code:: c

   lv_obj_t * parent = lv_obj_create(lv_screen_active());   /*Create a parent object on the current screen*/
   lv_obj_set_size(parent, 100, 80);                    /*Set the size of the parent*/

   lv_obj_t * obj1 = lv_obj_create(parent);             /*Create an object on the previously created parent object*/
   lv_obj_set_pos(obj1, 10, 10);                        /*Set the position of the new object*/

Modify the position of the parent:

.. image:: /misc/par_child2.png

.. code:: c

   lv_obj_set_pos(parent, 50, 50); /*Move the parent. The child will move with it.*/

(For simplicity the adjusting of colors of the objects is not shown in
the example.)

.. raw:: html

   </details>
   <br>


如果父对象的位置改变，子对象也会随之移动。因此，所有子对象的位置都是相对于父对象而言的。

.. image:: /misc/par_child1.png

.. code:: c

   lv_obj_t * parent = lv_obj_create(lv_screen_active());   /* 在当前屏幕上创建一个父对象 */
   lv_obj_set_size(parent, 100, 80);                    /* 设置父对象的大小 */

   lv_obj_t * obj1 = lv_obj_create(parent);             /* 在先前创建的父对象上创建一个对象 */
   lv_obj_set_pos(obj1, 10, 10);                        /* 设置新对象的位置 */


修改父对象的位置：

.. image:: /misc/par_child2.png

.. code:: c

   lv_obj_set_pos(parent, 50, 50); /* 移动父对象。子对象会随之移动。 */


（为简单起见，示例中未显示对象颜色调整的代码。）


Visibility only on the parent（仅在父对象上可见）
--------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If a child is partially or fully outside its parent then the parts
outside will not be visible.

.. image:: /misc/par_child3.png

.. code:: c

   lv_obj_set_x(obj1, -30);    /*Move the child a little bit off the parent*/

This behavior can be overwritten with
:cpp:expr:`lv_obj_add_flag(obj, LV_OBJ_FLAG_OVERFLOW_VISIBLE)` which allow the
children to be drawn out of the parent.

.. raw:: html

   </details>
   <br>


如果一个子对象部分或完全超出父对象，则超出部分将不可见。

.. image:: /misc/par_child3.png

.. code:: c

   lv_obj_set_x(obj1, -30);    /*将子对象移出父对象一点点*/

可以通过这个方法覆盖此行为
:cpp:expr:`lv_obj_add_flag(obj, LV_OBJ_FLAG_OVERFLOW_VISIBLE)`，这会允许子对象在父对象之外进行绘制。


Create and delete objects（创建和删除对象）
------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

In LVGL, objects can be created and deleted dynamically at run time. It
means only the currently created (existing) objects consume RAM.

This allows for the creation of a screen just when a button is clicked
to open it, and for deletion of screens when a new screen is loaded.

UIs can be created based on the current environment of the device. For
example one can create meters, charts, bars and sliders based on the
currently attached sensors.

Every widget has its own **create** function with a prototype like this:

.. code:: c

   lv_obj_t * lv_<widget>_create(lv_obj_t * parent, <other parameters if any>);

Typically, the create functions only have a *parent* parameter telling
them on which object to create the new widget.

The return value is a pointer to the created object with :cpp:type:`lv_obj_t` ``*``
type.

There is a common **delete** function for all object types. It deletes
the object and all of its children.

.. code:: c

   void lv_obj_delete(lv_obj_t * obj);

:cpp:func:`lv_obj_delete` will delete the object immediately. If for any reason you
can't delete the object immediately you can use
:cpp:expr:`lv_obj_delete_async(obj)` which will perform the deletion on the next
call of :cpp:func:`lv_timer_handler`. This is useful e.g. if you want to
delete the parent of an object in the child's :cpp:enumerator:`LV_EVENT_DELETE`
handler.

You can remove all the children of an object (but not the object itself)
using :cpp:expr:`lv_obj_clean(obj)`.

You can use :cpp:expr:`lv_obj_delete_delayed(obj, 1000)` to delete an object after
some time. The delay is expressed in milliseconds.

Sometimes you're not sure whether an object was deleted and you need some way to
check if it's still "alive". Anytime before the object is deleted, you can use
cpp:expr:`lv_obj_null_on_delete(&obj)` to cause your object pointer to be set to ``NULL``
when the object is deleted.

Make sure the pointer variable itself stays valid until the object is deleted. Here
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


在LVGL中，可以在运行时动态创建或删除对象。这也就是说，知道当对象被创建之后（存在）才会消耗内存资源。

这允许在点击按钮打开新界面(屏幕)时才创建一个新界面(屏幕)，并在加载新界面(屏幕)时删除旧界面(屏幕)。

UI可以根据设备的当前环境进行创建。例如，可以根据当前连接的传感器创建仪表、图表、条形图和滑块所需的UI再进行创建（比如之前需要图标，突然传感器去掉了，那么可以选择不创建该ui控件）。

每个控件都有自己的 **create** 函数，函数原型如下：

.. code:: c

   lv_obj_t * lv_<widget>_create(lv_obj_t * parent, <如果有其他参数>);

通常，创建函数只有一个 *parent* 参数，告诉它们在哪个对象上创建新的控件。

返回值是指向创建出来的控件的指针，类型为 :cpp:type:`lv_obj_t` ``*``。

有一个通用的 **delete** 函数适用于所有对象类型。它删除对象及其所有子对象。

.. code:: c

   void lv_obj_delete(lv_obj_t * obj);

:cpp:func:`lv_obj_del` 会立即删除对象。如果出于任何原因无法立即删除对象，可以使用
:cpp:expr:`lv_obj_delete_async(obj)` ，它会在下一次调用 :cpp:func:`lv_timer_handler` 时执行删除操作。
这在子对象的 :cpp:enumerator:`LV_EVENT_DELETE` 处理程序中删除父对象时很有用（现在不能马上删除父对象，下一次运行lv_timer_handler时再删除）。

可以使用 :cpp:expr:`lv_obj_clean(obj)` 删除对象的所有子对象（但不包括对象本身）。

可以使用 :cpp:expr:`lv_obj_delete_delayed(obj, 1000)` 在经过一定时间后再删除对象，以毫秒为单位。

有时候，您可能不确定一个对象是否已被删除，并且需要某种方法来检查它是否仍然“存活”。在对象被删除之前，您可以随时使用:expr:`lv_obj_null_on_delete(&obj)` 来设置，以便在对象被删除时，您的对象指针会被设置为 ``NULL``。

确保指针变量本身在对象被删除之前保持有效。以下是一个示例：

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



.. _objects_screens:

Screens（屏幕）
***************

Create screens（创建屏幕）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The screens are special objects which have no parent object. So they can
be created like:

.. code:: c

   lv_obj_t * scr1 = lv_obj_create(NULL);

Screens can be created with any object type. For example, a
:ref:`Base object <lv_obj>` or an image to make a wallpaper.

.. raw:: html

   </details>
   <br>


屏幕是一种特殊的对象，它们没有父对象。因此可以像这样创建屏幕：

.. code:: c

   lv_obj_t * scr1 = lv_obj_create(NULL);

屏幕可以使用任何对象类型创建。例如，可以使用 :ref:`Base object <lv_obj>` 或者图像控件来创建壁纸。


Get the active screen（获取活动屏幕）
-------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

There is always an active screen on each display. By default, the
library creates and loads a "Base object" as a screen for each display.

To get the currently active screen use the :cpp:func:`lv_screen_active` function.

.. raw:: html

   </details>
   <br>


每个显示器上都会始终存在一个活动屏幕。默认情况下，库会为每个显示器创建和加载一个“Base object”作为屏幕。

要获得当前活动的屏幕，请使用 :cpp:func:`lv_screen_active` 函数。


.. _objects_load_screens:

Load screens（加载屏幕）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To load a new screen, use :cpp:expr:`lv_screen_load(scr1)`.

.. raw:: html

   </details>
   <br>


使用 :cpp:expr:`lv_screen_load(scr1)` 来加载新的屏幕。


Layers（层）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Use:cpp:expr:`lv_screen_load(scr1)` to load the new screen.
There are two automatically generated layers:

- top layer
- system layer

They are independent of the screens and they will be shown on every
screen. The *top layer* is above every object on the screen and the
*system layer* is above the *top layer*. You can add any pop-up windows
to the *top layer* freely. But, the *system layer* is restricted to
system-level things (e.g. mouse cursor will be placed there with
:cpp:func:`lv_indev_set_cursor`).

The :cpp:func:`lv_layer_top` and :cpp:func:`lv_layer_sys` functions return pointers
to the top and system layers respectively.

Read the :ref:`Layer overview <layers>` section to learn more
about layers.

.. raw:: html

   </details>
   <br>


使用 :cpp:expr:`lv_screen_load(scr1)` 来加载新的屏幕。
自动生成两个图层：

- 顶层（top layer）
- 系统层（system layer）

它们独立于屏幕，将显示在每个屏幕上。 *顶层* 位于屏幕上每个对象之上， *系统层* 位于 *顶层* 之上。您可以自由地向 *顶层* 添加任何弹出窗口。但是， *系统层* 受到系统级别的限制（例如，鼠标光标将与 :cpp:func:`lv_indev_set_cursor` 一起放置在那里）。

层级： * 活动屏幕（screen_active） < 顶层（top layer） < 系统层（system layer） *

:cpp:func:`lv_layer_top` 和 :cpp:func:`lv_layer_sys` 函数返回指向顶层和系统层的指针。

阅读 :ref:`Layer overview <layers>` 章节内容，以了解更多关于图层的信息。


Load screen with animation（用动画加载屏幕）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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


可以使用 :cpp:expr:`lv_screen_load_anim(scr, transition_type, time, delay, auto_del)` 来加载一个带动画效果的新屏幕。可以设置以下动画过渡类型：

- :cpp:enumerator:`LV_SCR_LOAD_ANIM_NONE`: 在 ``delay`` 毫秒后立即切换
- :cpp:enumerator:`LV_SCR_LOAD_ANIM_OVER_LEFT`, :cpp:enumerator:`LV_SCR_LOAD_ANIM_OVER_RIGHT`, :cpp:enumerator:`LV_SCR_LOAD_ANIM_OVER_TOP` 和 :cpp:enumerator:`LV_SCR_LOAD_ANIM_OVER_BOTTOM`：将新屏幕沿着给定方向移动到当前屏幕上方
- :cpp:enumerator:`LV_SCR_LOAD_ANIM_OUT_LEFT`, :cpp:enumerator:`LV_SCR_LOAD_ANIM_OUT_RIGHT`, :cpp:enumerator:`LV_SCR_LOAD_ANIM_OUT_TOP` 和 :cpp:enumerator:`LV_SCR_LOAD_ANIM_OUT_BOTTOM`：将旧屏幕沿着给定方向移出到当前屏幕外
- :cpp:enumerator:`LV_SCR_LOAD_ANIM_MOVE_LEFT`, :cpp:enumerator:`LV_SCR_LOAD_ANIM_MOVE_RIGHT`, :cpp:enumerator:`LV_SCR_LOAD_ANIM_MOVE_TOP` 和 :cpp:enumerator:`LV_SCR_LOAD_ANIM_MOVE_BOTTOM`：将当前屏幕和新屏幕都沿着给定方向移动
- :cpp:enumerator:`LV_SCR_LOAD_ANIM_FADE_IN` 和 :cpp:enumerator:`LV_SCR_LOAD_ANIM_FADE_OUT`：将新屏幕渐变到旧屏幕上，或反之亦然

将 ``auto_del`` 设置为 ``true`` 将在动画完成后自动删除旧屏幕。

新屏幕将在 ``delay`` 时间后动画开始时变为活动状态（由 :cpp:func:`lv_screen_active` 返回）。在屏幕动画期间，所有输入都将被禁用。


Handling multiple displays（处理多个显示器）
-------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Screens are created on the currently selected *default display*. The
*default display* is the last registered display with
:cpp:func:`lv_display_create`. You can also explicitly select a new default
display using :cpp:expr:`lv_display_set_default(disp)`.

:cpp:func:`lv_screen_active`, :cpp:func:`lv_screen_load` and :cpp:func:`lv_screen_load_anim` operate
on the default display.

Visit :ref:`display_multi_display_support` to learn more.

.. raw:: html

   </details>
   <br>


屏幕是在当前选定的 *默认显示器* 上创建的。 *默认显示器* 是最后使用 :cpp:func:`lv_display_create` 注册的显示器。您还可以使用 :cpp:expr:`lv_display_set_default(disp)` 显式地选择新的默认显示器。

:cpp:func:`lv_screen_active` ，:cpp:func:`lv_screen_load` 和 :cpp:func:`lv_screen_load_anim` 操作默认显示器。

请阅读 :ref:`display_multi_display_support` 章节内容，以了解更多关于多个显示器的信息。


.. _objects_parts:

Parts（部分）
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The widgets are built from multiple parts. For example a
:ref:`Base object <lv_obj>` uses the main and scrollbar parts but a
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


部件嵌入式由多个控件组成。例如，一个 :ref:`Base object <lv_obj>` 使用主要部分和滚动条部分，而一个 :ref:`Slider <lv_slider>` 使用主要部分、指示器部分和旋钮部分。部件类似于CSS中的 *伪元素*。

LVGL中存在以下预定义的部分：

- :cpp:enumerator:`LV_PART_MAIN`：类似矩形的背景
- :cpp:enumerator:`LV_PART_SCROLLBAR`：滚动条(一个或多个)
- :cpp:enumerator:`LV_PART_INDICATOR`：指示器，例如滑块、条形图、开关或复选框的勾选框
- :cpp:enumerator:`LV_PART_KNOB`：类似于把手（旋钮），用于调整值
- :cpp:enumerator:`LV_PART_SELECTED`：指示当前选定的选项或部分
- :cpp:enumerator:`LV_PART_ITEMS`：如果部件有多个类似的元素（例如表格单元格）则可用
- :cpp:enumerator:`LV_PART_CURSOR`：标记特定位置，例如文本区域或图表的光标
- :cpp:enumerator:`LV_PART_CUSTOM_FIRST`：可以从这里添加自定义部分。

部件的主要目的是允许对控件的 "组件（组成部分）" 进行样式设置。在 :ref:`Style overview <styles>` 章节中有对它们进行了更详细的说明。


.. _objects_states:

States（状态）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The object can be in a combination of the following states:

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
interacts with an object (presses, releases, focuses, etc.). However,
the states can be changed manually too. To set or clear given state (but
leave the other states untouched) use
``lv_obj_add/remove_state(obj, LV_STATE_...)`` In both cases OR-ed state
values can be used as well. E.g.
:cpp:expr:`lv_obj_add_state(obj, part, LV_STATE_PRESSED | LV_PRESSED_CHECKED)`.

To learn more about the states read the related section of the
:ref:`Style overview <styles>`.

.. raw:: html

   </details>
   <br>


控件可以处于以下状态的组合：

- :cpp:enumerator:`LV_STATE_DEFAULT`：正常释放状态
- :cpp:enumerator:`LV_STATE_CHECKED`：切换或选中状态
- :cpp:enumerator:`LV_STATE_FOCUSED`：通过键盘或编码器聚焦或通过触摸板/鼠标点击
- :cpp:enumerator:`LV_STATE_FOCUS_KEY`：通过键盘或编码器聚焦但不通过触摸板/鼠标点击
- :cpp:enumerator:`LV_STATE_EDITED`：由编码器编辑
- :cpp:enumerator:`LV_STATE_HOVERED`：由鼠标悬停（目前不支持）
- :cpp:enumerator:`LV_STATE_PRESSED`：正在按下
- :cpp:enumerator:`LV_STATE_SCROLLED`：正在滚动
- :cpp:enumerator:`LV_STATE_DISABLED`：禁用状态
- :cpp:enumerator:`LV_STATE_USER_1`：自定义状态
- :cpp:enumerator:`LV_STATE_USER_2`：自定义状态
- :cpp:enumerator:`LV_STATE_USER_3`：自定义状态
- :cpp:enumerator:`LV_STATE_USER_4`：自定义状态

通常情况下，LVGL库会根据用户与对象的交互（按下、释放、聚焦等）自动更改状态。然而，状态也可以用户手动进行更改。
要设置或清除给定的状态（但保持其他状态不变），可以使用 ``lv_obj_add/remove_state(obj, LV_STATE_...)``。
在这两种情况下，也可以使用按位或运算符来组合状态值。例如： ``lv_obj_add_state(obj, part, LV_STATE_PRESSED | LV_PRESSED_CHECKED)``。

要了解更多关于状态的内容，请阅读 :ref:`Style overview <styles>` 章节中的相关内容。


.. _objects_snapshot:

Snapshot（快照）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

A snapshot image can be generated for an object together with its
children. Check details in :ref:`snapshot`.

.. raw:: html

   </details>
   <br>


一个对象和其子对象的快照图像可以一起生成。在 :ref:`snapshot` 中查看详情。


.. _objects_api:

API
***
