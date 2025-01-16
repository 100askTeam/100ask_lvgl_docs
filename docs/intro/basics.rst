.. _lvgl_basics:

========================
LVGL Basics（LVGL 基础）
========================

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL (Light and Versatile Graphics Library) is a free and open-source graphics
library providing everything you need to create an embedded GUI with easy-to-use
graphical elements, beautiful visual effects, and a low memory footprint.

How does it do this?

.. raw:: html

   </details> 
   <br>

LVGL（轻量且通用的图形库）是一个免费的开源图形库，它提供了创建嵌入式图形用户界面（GUI）所需的一切，包含易于使用的图形元素、出色的视觉效果，并且占用内存少。

它是如何做到这些的呢？

.. _basic_data_flow:

Overview of LVGL's Data Flow（LVGL 数据流概述）
**********************************************
.. raw:: html

   <details>
     <summary>显示原文</summary>
.. figure:: /misc/intro_data_flow.png
    :scale: 75 %
    :alt:  LVGL Data Flow
    :align:  center
    :figwidth:  image

    Overview of LVGL Data Flow


You create one :ref:`display` for each physical display panel, create
:ref:`basics_screen_widgets` on them, add :ref:`basics_widgets` onto those Screens.
To handle touch, mouse, keypad, etc., you :ref:`create an Input Device <indev_creation>`
for each.  The :ref:`tick_interface` tells LVGL what time is it.  :ref:`timer_handler`
drives LVGL's timers which, in turn, perform all of LVGL's time-related tasks:

- periodically refreshes displays,
- reads input devices,
- fires events,
- runs any animations, and
- runs user-created timers.

.. raw:: html

   </details> 
   <br>

.. 图:: /misc/intro_data_flow.png
    : 缩放: 75%
    : 替代文本: LVGL 数据流
    : 对齐:  居中
    : 图宽:  图像

    LVGL 数据流概述

您为每个物理显示面板创建一个 :ref:`display`，在它们上面创建 :ref:`basics_screen_widgets`，再将 :ref:`basics_widgets` 添加到这些屏幕上。为了处理触摸、鼠标、键盘等输入，您要为每种输入 :ref:`create an Input Device <indev_creation>`。:ref:`tick_interface` 会告知 LVGL 当前时间。:ref:`timer_handler` 驱动 LVGL 的定时器，这些定时器进而执行 LVGL 所有与时间相关的任务：

- 定期刷新显示内容；
- 读取输入设备；
- 触发事件；
- 运行动画；
- 运行用户创建的定时器。
.. _applications_job:

Application's Job（应用程序的任务）
----------------------------------
.. raw:: html

   <details>
     <summary>显示原文</summary>
After initialization, the application's job is merely to create Widget Trees when
they are needed, manage events those Widgets generate (by way of user interaction
and other things), and delete them when they are no longer needed.  LVGL takes care
of the rest.

.. raw:: html

   </details> 
   <br>

初始化之后，应用程序的任务仅仅是在需要时创建部件树，管理这些部件因用户交互及其他情况而生成的事件，并在不再需要时删除它们。其余的工作则由 LVGL 负责。
.. _basics_major_concepts:

Major Concepts（主要概念）
**************************


.. _display-vs-screen:

Display vs Screen（显示（Display）与屏幕（Screen））
---------------------------------------------------
.. raw:: html

   <details>
     <summary>显示原文</summary>
Before we get into any details about Widgets, let us first clarify the difference
between two terms that you will hereafter see frequently:

- A **Display** or **Display Panel** is the physical hardware displaying the pixels.
- A :ref:`display` object is an object in RAM that represents a **Display** meant
  to be used by LVGL.
- A **Screen** is the "root" Widget in the Widget Trees mentioned above, and are
  "attached to" a particular :ref:`display`.
.. raw:: html

   </details> 
   <br>

在深入探讨部件的任何细节之前，让我们首先厘清两个你之后会频繁看到的术语之间的区别：

- **显示设备** 或 **显示面板** 是用于显示像素的物理硬件。
- 一个 :ref:`display` 对象是内存中的一个对象，它代表一个供 LVGL 使用的 **显示设备**。
- **屏幕** 是上述部件树中的 “根” 部件，并且 “依附于” 特定的 :ref:`display` 对象。
Default Display（默认显示设备）
--------------------------------
.. raw:: html

   <details>
     <summary>显示原文</summary>
When the first :ref:`display` object is created, it becomes the Default Display.
Many functions related to Screen Widgets use the default display.
See :ref:`default_display` for more information.

.. raw:: html

   </details> 
   <br>

当第一个 :ref:`display` 对象被创建时，它成为默认显示器。
许多与屏幕小部件相关的功能使用默认显示器。
有关更多信息，请参见 :ref:`default_display`。
.. _basics_screen_widgets:

Screen Widgets（屏幕部件）
---------------------------
.. raw:: html

   <details>
     <summary>显示原文</summary>
In this documentation, the term "Screen Widget" is frequently shortened to just
"Screen".  But it is important to understand that a "Screen" is simply any
:ref:`Widget <widgets>` created without a parent --- the "root" of each Widget Tree.

See :ref:`screens` for more details.
.. raw:: html

   </details> 
   <br>

在本文档中，“屏幕小部件”一词经常缩写为“屏幕”。但重要的是要理解，“屏幕”只是任何没有父级的 :ref:`小部件 <widgets>` —— 每个小部件树的“根”。

有关更多详细信息，请参见 :ref:`screens`。
Active Screen（活动屏幕）
------------------------
.. raw:: html

   <details>
     <summary>显示原文</summary>
The Active Screen is the screen (and its child Widgets) currently being displayed.
See :ref:`active_screen` for more information.
.. raw:: html

   </details> 
   <br>

活动屏幕是当前显示的屏幕（及其子小部件）。
有关更多信息，请参见 :ref:`active_screen`。
.. _basics_widgets:

Widgets（小部件）
------------------
.. raw:: html

   <details>
     <summary>显示原文</summary>
After LVGL is initialized (see :ref:`initializing_lvgl`), to create an interactive
user interface, an application next creates a tree of Widgets that LVGL can render to
the associated display, and with which the user can interact.

Widgets are "intelligent" LVGL graphical elements such as :ref:`Base Widgets
<base_widget_overview>` (simple rectangles and :ref:`screens`), Buttons, Labels,
Checkboxes, Switches, Sliders, Charts, etc.  Go to :ref:`widgets` to see the full
list.

To build this Widget Tree, the application first acquires a pointer to a Screen Widget.
A system designer is free to use the default Screen created with the :ref:`display`
and/or create his own.  To create a new Screen Widget, simply create a Widget passing
NULL as the parent argument.  Technically, this can be any type of Widget, but in
most cases it is a :ref:`base_widget_overview`.  (An example of another type of
Widget being used as a Screen is an :ref:`lv_image` Widget to supply an image for the
background.)

The application then adds Widgets to this Screen as children in the tree.  Widgets
are automatically added as children to their parent Widgets at time of creation ---
the Widget's parent is passed as the first argument to the function that creates
the Widget.  After being so added, we say that the parent Widget "contains" the
child Widget.

Any Widget can contain other Widgets.  For example, if you want a Button to have
text, create a Label Widget and add it to the Button as a child.

Each child Widget becomes "part of" its parent Widget.  Because of this relationship:

- when the parent Widget moves, its children move with it;
- when the parent Widget is deleted, its children are deleted with it;
- a child Widget is only visible within its parent's boundaries; any part of a child
  outside its parent's boundaries is clipped (i.e. not rendered).

Screens (and their child Widgets) can be created and deleted at any time *except*
when the Screen is the :ref:`active_screen`.  If you want to delete the current Screen
as you load a new one, call :cpp:func:`lv_screen_load_anim` and pass ``true`` for the
``auto_del`` argument.  If you want to keep the current Screen in RAM when you load a
new Screen, pass ``false`` for the ``auto_del`` argument, or call
:cpp:func:`lv_screen_active` to load the new screen.

A system designer is free to keep any number of Screens (and their child Widgets) in
RAM (e.g. for quick re-display again later).  Doing so:

- requires more RAM, but
- can save the time of repeatedly creating the Screen and its child Widgets;
- can be handy when a Screen is complex and/or can be made the :ref:`active_screen` freqently.

If multiple Screens are maintained in RAM simultaneously, it is up to the system
designer as to how they are managed.
.. raw:: html

   </details> 
   <br>

在初始化 LVGL 之后（参见 :ref:`initializing_lvgl`），为了创建一个交互式用户界面，应用程序接下来会创建一个小部件树，LVGL 可以将其渲染到相关显示器上，并与用户进行交互。

小部件是“智能”的 LVGL 图形元素，例如 :ref:`基本小部件 <base_widget_overview>`（简单的矩形和 :ref:`屏幕`）、按钮、标签、复选框、开关、滑块、图表等。请参见 :ref:`widgets` 以查看完整列表。

为了构建这个小部件树，应用程序首先获取一个屏幕小部件的指针。系统设计人员可以自由使用与 :ref:`display` 一起创建的默认屏幕和/或创建自己的屏幕。要创建一个新的屏幕小部件，只需在创建小部件时将父级参数传递为 NULL。从技术上讲，这可以是任何类型的小部件，但在大多数情况下，它是一个 :ref:`基本小部件 <base_widget_overview>`。（另一种用作屏幕的小部件类型的示例是 :ref:`lv_image` 小部件，用于提供背景图像。）

然后，应用程序将小部件作为树中的子节点添加到这个屏幕中。小部件在创建时会自动作为子节点添加到其父小部件中——小部件的父级作为创建小部件的函数的第一个参数传递。添加后，我们说父小部件“包含”子小部件。

任何小部件都可以包含其他小部件。例如，如果您希望按钮具有文本，请创建一个标签小部件并将其作为子节点添加到按钮中。

每个子小部件都成为其父小部件的“一部分”。由于这种关系：

- 当父小部件移动时，其子小部件也会随之移动；
- 当父小部件被删除时，其子小部件也会随之删除；
- 子小部件仅在其父小部件的边界内可见；任何超出父小部件边界的子小部件部分都会被裁剪（即不渲染）。

屏幕（及其子小部件）可以在任何时候创建和删除 *除了* 当屏幕是 :ref:`活动屏幕 <active_screen>` 时。如果您想在加载新屏幕时删除当前屏幕，请调用 :cpp:func:`lv_screen_load_anim` 并为 ``auto_del`` 参数传递 ``true``。如果您想在加载新屏幕时将当前屏幕保留在 RAM 中，请为 ``auto_del`` 参数传递 ``false``，或调用 :cpp:func:`lv_screen_active` 以加载新屏幕。

系统设计人员可以自由地在 RAM 中保留任意数量的屏幕（及其子小部件）（例如，以便稍后快速重新显示）。这样做：

- 需要更多的 RAM，但
- 可以节省反复创建屏幕及其子小部件的时间；
- 当屏幕复杂且/或可以频繁成为 :ref:`活动屏幕 <active_screen>` 时，这会很方便。

如果多个屏幕同时保存在 RAM 中，系统设计人员可以自行决定如何管理它们。
.. _basics_creating_widgets:

Creating Widgets（创建小部件）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.. raw:: html

   <details>
     <summary>显示原文</summary>
Widgets are created by calling functions that look like this::

    lv_<type>_create(parent)

The call will return an :cpp:type:`lv_obj_t` ``*`` pointer that can be used later to
reference the Widget to set its attributes.

For example:

.. code-block:: c

    lv_obj_t * slider1 = lv_slider_create(lv_screen_active());
.. raw:: html

   </details> 
   <br>

小部件是通过调用如下函数创建的::

    lv_<type>_create(parent)

该调用将返回一个 :cpp:type:`lv_obj_t` ``*`` 指针，稍后可以使用该指针引用小部件以设置其属性。

例如：

.. code-block:: c

    lv_obj_t * slider1 = lv_slider_create(lv_screen_active());
.. _basics_modifying_widgets:

Modifying Widgets（修改小部件）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.. raw:: html

   <details>
     <summary>显示原文</summary>
Attributes common to all Widgets are set by functions that look like this::

    lv_obj_set_<attribute_name>(widget, <value>)

For example:

.. code-block:: c

    lv_obj_set_x(slider1, 30);
    lv_obj_set_y(slider1, 10);
    lv_obj_set_size(slider1, 200, 50);

Along with these attributes, widgets can have type-specific attributes which are
set by functions that look like this::

    lv_<type>_set_<attribute_name>(widget, <value>)

For example:

.. code-block:: c

    lv_slider_set_value(slider1, 70, LV_ANIM_ON);

To see the full API visit the documentation of the Widget in question under
:ref:`widgets` or study its related header file in the source code, e.g.

- lvgl/src/widgets/slider/lv_slider.h

or view it on GitHub, e.g.

- https://github.com/lvgl/lvgl/blob/master/src/widgets/slider/lv_slider.h .

.. raw:: html

   </details> 
   <br>

所有小部件的通用属性通过如下函数设置::

    lv_obj_set_<attribute_name>(widget, <value>)

例如：

.. code-block:: c

    lv_obj_set_x(slider1, 30);
    lv_obj_set_y(slider1, 10);
    lv_obj_set_size(slider1, 200, 50);

除了这些属性，小部件还可以有特定类型的属性，这些属性通过如下函数设置::

    lv_<type>_set_<attribute_name>(widget, <value>)

例如：

.. code-block:: c

    lv_slider_set_value(slider1, 70, LV_ANIM_ON);

要查看完整的 API，请访问相关小部件的文档，参见 :ref:`widgets` 或研究源代码中的相关头文件，例如：

- lvgl/src/widgets/slider/lv_slider.h

或在 GitHub 上查看，例如：

- https://github.com/lvgl/lvgl/blob/master/src/widgets/slider/lv_slider.h 。
.. _basics_deleting_widgets:

Deleting Widgets（删除小部件）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.. raw:: html

   <details>
     <summary>显示原文</summary>
To delete any widget and its children::

    lv_obj_delete(lv_obj_t * widget)

.. raw:: html

   </details> 
   <br>

要删除任何小部件及其子小部件::

    lv_obj_delete(lv_obj_t * widget)

.. _basics_events:

Events（事件）
--------------
.. raw:: html

   <details>
     <summary>显示原文</summary>

Events are used to inform the application that something has happened with a Widget.
You can assign one or more callbacks to a Widget which will be called when the
Widget is clicked, released, dragged, being deleted, etc.

A callback is assigned like this:

.. code-block:: c

   lv_obj_add_event_cb(btn, my_btn_event_cb, LV_EVENT_CLICKED, NULL);

   ...

   void my_btn_event_cb(lv_event_t * e)
   {
       printf("Clicked\n");
   }

:cpp:enumerator:`LV_EVENT_ALL` can be used instead of :cpp:enumerator:`LV_EVENT_CLICKED`
to invoke the callback for all events.  (Beware:  there are a LOT of events!  This can
be handy for debugging or learning what events occur for a given Widget, or indeed
if the application needs to process all events for some reason.)

Event callbacks receive the argument :cpp:expr:`lv_event_t * e` containing the
current event code and other event-related information.  The current event code can
be retrieved with:

.. code-block:: c

    lv_event_code_t code = lv_event_get_code(e);

The Widget that triggered the event can be retrieved with:

.. code-block:: c

    lv_obj_t * obj = lv_event_get_target(e);

To learn all features of the events go to the :ref:`events` section.
.. raw:: html

   </details> 
   <br>

事件用于通知应用程序某个小部件发生了某些事情。
您可以为小部件分配一个或多个回调，当小部件被点击、释放、拖动、删除等时，这些回调将被调用。

回调的分配方式如下：

.. code-block:: c

   lv_obj_add_event_cb(btn, my_btn_event_cb, LV_EVENT_CLICKED, NULL);

   ...

   void my_btn_event_cb(lv_event_t * e)
   {
       printf("Clicked\n");
   }

:cpp:enumerator:`LV_EVENT_ALL` 可以用来代替 :cpp:enumerator:`LV_EVENT_CLICKED` 以调用所有事件的回调。（注意：事件非常多！这对于调试或了解给定小部件发生了哪些事件很有用，或者如果应用程序由于某种原因需要处理所有事件，也很有用。）

事件回调接收参数 :cpp:expr:`lv_event_t * e`，其中包含当前事件代码和其他与事件相关的信息。可以使用以下代码检索当前事件代码：

.. code-block:: c

    lv_event_code_t code = lv_event_get_code(e);

可以使用以下代码检索触发事件的小部件：

.. code-block:: c

    lv_obj_t * obj = lv_event_get_target(e);

要了解事件的所有功能，请参见 :ref:`events` 部分。
.. _basics_parts:

Parts（部件）
-------------
.. raw:: html

   <details>
     <summary>显示原文</summary>
Widgets are built from one or more *parts*.  For example, a button
has only one part called :cpp:enumerator:`LV_PART_MAIN`. However, a
:ref:`lv_slider` has :cpp:enumerator:`LV_PART_MAIN`, :cpp:enumerator:`LV_PART_INDICATOR`
and :cpp:enumerator:`LV_PART_KNOB`.

By using parts you can apply different styles to sub-elements of a widget.  (See below.)

Read the Widget's documentation to learn which parts it uses.
.. raw:: html

   </details> 
   <br>

小部件由一个或多个*部件*构成。例如，一个按钮只有一个部件，称为 :cpp:enumerator:`LV_PART_MAIN`。然而，一个 :ref:`lv_slider` 有 :cpp:enumerator:`LV_PART_MAIN`、:cpp:enumerator:`LV_PART_INDICATOR` 和 :cpp:enumerator:`LV_PART_KNOB`。

通过使用部件，您可以将不同的样式应用于小部件的子元素。（见下文。）

阅读小部件的文档以了解它使用了哪些部件。
.. _basics_states:

States（状态）
---------------
.. raw:: html

   <details>
     <summary>显示原文</summary>
Widgets can be in a combination of the following states:

- :cpp:enumerator:`LV_STATE_DEFAULT`: Normal, released state
- :cpp:enumerator:`LV_STATE_CHECKED`: Toggled or checked state
- :cpp:enumerator:`LV_STATE_FOCUSED`: Focused via keypad or encoder or clicked via touchpad/mouse
- :cpp:enumerator:`LV_STATE_FOCUS_KEY`: Focused via keypad or encoder but not via touchpad/mouse
- :cpp:enumerator:`LV_STATE_EDITED`: Edit by an encoder
- :cpp:enumerator:`LV_STATE_HOVERED`: Hovered by mouse
- :cpp:enumerator:`LV_STATE_PRESSED`: Being pressed
- :cpp:enumerator:`LV_STATE_SCROLLED`: Being scrolled
- :cpp:enumerator:`LV_STATE_DISABLED`: Disabled

For example, if you press a Widget it will automatically go to the
:cpp:enumerator:`LV_STATE_FOCUSED` and :cpp:enumerator:`LV_STATE_PRESSED` states and when you
release it the :cpp:enumerator:`LV_STATE_PRESSED` state will be removed while the
:cpp:enumerator:`LV_STATE_FOCUSED` state remains active.

To check if a Widget is in a given state use
:cpp:expr:`lv_obj_has_state(widget, LV_STATE_...)`. It will return ``true`` if the
Widget is currently in that state.

To manually add or remove states use:

.. code-block:: c

   lv_obj_add_state(widget, LV_STATE_...);
   lv_obj_remove_state(widget, LV_STATE_...);
.. raw:: html

   </details> 
   <br>

小部件可以处于以下状态的组合中：

- :cpp:enumerator:`LV_STATE_DEFAULT`: 正常，释放状态
- :cpp:enumerator:`LV_STATE_CHECKED`: 切换或选中状态
- :cpp:enumerator:`LV_STATE_FOCUSED`: 通过键盘或编码器聚焦或通过触摸板/鼠标点击
- :cpp:enumerator:`LV_STATE_FOCUS_KEY`: 通过键盘或编码器聚焦，但不通过触摸板/鼠标
- :cpp:enumerator:`LV_STATE_EDITED`: 通过编码器编辑
- :cpp:enumerator:`LV_STATE_HOVERED`: 被鼠标悬停
- :cpp:enumerator:`LV_STATE_PRESSED`: 正在被按下
- :cpp:enumerator:`LV_STATE_SCROLLED`: 正在滚动
- :cpp:enumerator:`LV_STATE_DISABLED`: 禁用

例如，如果按下一个小部件，它将自动进入 :cpp:enumerator:`LV_STATE_FOCUSED` 和 :cpp:enumerator:`LV_STATE_PRESSED` 状态，当你释放它时，:cpp:enumerator:`LV_STATE_PRESSED` 状态将被移除，而 :cpp:enumerator:`LV_STATE_FOCUSED` 状态仍然保持活动。

要检查小部件是否处于给定状态，请使用 :cpp:expr:`lv_obj_has_state(widget, LV_STATE_...)`。如果小部件当前处于该状态，它将返回 ``true``。

要手动添加或移除状态，请使用：

.. code-block:: c

   lv_obj_add_state(widget, LV_STATE_...);
   lv_obj_remove_state(widget, LV_STATE_...);
.. _basics_styles:

Styles（样式）
--------------
.. raw:: html

   <details>
     <summary>显示原文</summary>
A style instance contains properties such as background color, border
width, font, etc. that describe the appearance of Widgets.

Styles are carried in :cpp:struct:`lv_style_t` objects.  Only their pointer is saved
in the Widgets so they need to be defined as static or global variables.  Before
using a style it needs to be initialized with :cpp:expr:`lv_style_init(&style1)`.
After that, properties can be added to configure the style.  For example:

.. code-block:: c

    static lv_style_t style1;
    lv_style_init(&style1);
    lv_style_set_bg_color(&style1, lv_color_hex(0xa03080))
    lv_style_set_border_width(&style1, 2))

See :ref:`style_properties_overview` for more details.

See :ref:`style_properties` to see the full list.

Styles are assigned using the OR-ed combination of a Widget's part and
state. For example to use this style on the slider's indicator when the
slider is pressed:

.. code-block:: c

    lv_obj_add_style(slider1, &style1, LV_PART_INDICATOR | LV_STATE_PRESSED);

If the *part* is :cpp:enumerator:`LV_PART_MAIN` it can be omitted:

.. code-block:: c

    lv_obj_add_style(btn1, &style1, LV_STATE_PRESSED); /* Equal to LV_PART_MAIN | LV_STATE_PRESSED */

Similarly, :cpp:enumerator:`LV_STATE_DEFAULT` can be omitted:

.. code-block:: c

   lv_obj_add_style(slider1, &style1, LV_PART_INDICATOR); /* Equal to LV_PART_INDICATOR | LV_STATE_DEFAULT */

For :cpp:enumerator:`LV_STATE_DEFAULT` | :cpp:enumerator:`LV_PART_MAIN` simply pass ``0``:

.. code-block:: c

   lv_obj_add_style(btn1, &style1, 0); /* Equal to LV_PART_MAIN | LV_STATE_DEFAULT */

Styles can be cascaded (similarly to CSS). This means you can add more
styles to a part of a Widget. For example ``style_btn`` can set a
default button appearance, and ``style_btn_red`` can overwrite the
background color to make the button red:

.. code-block:: c

   lv_obj_add_style(btn1, &style_btn, 0);
   lv_obj_add_style(btn1, &style1_btn_red, 0);

If a property is not set for the current state, the style with
:cpp:enumerator:`LV_STATE_DEFAULT` will be used. A default value is used if the
property is not defined in the default state.

Some properties (particularly the text-related ones) can be inherited. This
means if a property is not set in a Widget it will be searched for in
its parents. For example, you can set the font once in the screen's
style and all text on that screen will inherit it by default.

Local style properties also can be added to Widgets. This creates a
style which resides inside the Widget and is used only by that Widget:

.. code-block:: c

    lv_obj_set_style_bg_color(slider1, lv_color_hex(0x2080bb), LV_PART_INDICATOR | LV_STATE_PRESSED);

To learn all the features of styles see :ref:`styles`.
.. raw:: html

   </details> 
   <br>

样式实例包含描述小部件外观的属性，例如背景颜色、边框宽度、字体等。

样式保存在 :cpp:struct:`lv_style_t` 对象中。只有它们的指针保存在小部件中，因此需要将它们定义为静态或全局变量。在使用样式之前，需要使用 :cpp:expr:`lv_style_init(&style1)` 进行初始化。之后，可以添加属性来配置样式。例如：

.. code-block:: c

    static lv_style_t style1;
    lv_style_init(&style1);
    lv_style_set_bg_color(&style1, lv_color_hex(0xa03080))
    lv_style_set_border_width(&style1, 2))

有关更多详细信息，请参见 :ref:`style_properties_overview`。

要查看完整列表，请参见 :ref:`style_properties`。

样式是通过小部件的部件和状态的按位或组合来分配的。例如，要在滑块被按下时将此样式用于滑块的指示器：

.. code-block:: c

    lv_obj_add_style(slider1, &style1, LV_PART_INDICATOR | LV_STATE_PRESSED);

如果 *part* 是 :cpp:enumerator:`LV_PART_MAIN`，则可以省略：

.. code-block:: c

    lv_obj_add_style(btn1, &style1, LV_STATE_PRESSED); /* 等同于 LV_PART_MAIN | LV_STATE_PRESSED */

同样，:cpp:enumerator:`LV_STATE_DEFAULT` 也可以省略：

.. code-block:: c

   lv_obj_add_style(slider1, &style1, LV_PART_INDICATOR); /* 等同于 LV_PART_INDICATOR | LV_STATE_DEFAULT */

对于 :cpp:enumerator:`LV_STATE_DEFAULT` | :cpp:enumerator:`LV_PART_MAIN`，只需传递 ``0``：

.. code-block:: c

   lv_obj_add_style(btn1, &style1, 0); /* 等同于 LV_PART_MAIN | LV_STATE_DEFAULT */

样式可以级联（类似于 CSS）。这意味着您可以向小部件的某个部件添加更多样式。例如 ``style_btn`` 可以设置默认按钮外观，而 ``style_btn_red`` 可以覆盖背景颜色使按钮变红：

.. code-block:: c

   lv_obj_add_style(btn1, &style_btn, 0);
   lv_obj_add_style(btn1, &style1_btn_red, 0);

如果当前状态未设置某个属性，则将使用 :cpp:enumerator:`LV_STATE_DEFAULT` 的样式。如果在默认状态下未定义该属性，则使用默认值。

某些属性（特别是与文本相关的属性）可以继承。这意味着如果在小部件中未设置某个属性，它将在其父级中搜索。例如，您可以在屏幕的样式中设置一次字体，屏幕上的所有文本将默认继承它。

本地样式属性也可以添加到小部件中。这会创建一个驻留在小部件内部并且仅由该小部件使用的样式：

.. code-block:: c

    lv_obj_set_style_bg_color(slider1, lv_color_hex(0x2080bb), LV_PART_INDICATOR | LV_STATE_PRESSED);

要了解样式的所有功能，请参见 :ref:`styles`。
.. _basics_themes:

Themes（主题）
---------------
.. raw:: html

   <details>
     <summary>显示原文</summary>
Themes are the default styles for Widgets. Styles from a theme are
applied automatically when Widgets are created.

The theme for your application is a compile time configuration set in
``lv_conf.h``.
.. raw:: html

   </details> 
   <br>

主题是小部件的默认样式。主题中的样式在创建小部件时会自动应用。

应用程序的主题是在 ``lv_conf.h`` 中设置的编译时配置。
.. _basics_micropython:

MicroPython
-----------
.. raw:: html

   <details>
     <summary>显示原文</summary>
LVGL can even be used with :ref:`micropython`.

.. code-block:: python

    # Initialize
    import display_driver
    import lvgl as lv

    # Create a button with a label
    scr = lv.obj()
    btn = lv.button(scr)
    btn.align(lv.ALIGN.CENTER, 0, 0)
    label = lv.label(btn)
    label.set_text('Hello World!')
    lv.screen_load(scr)

.. raw:: html

   </details> 
   <br>

LVGL 甚至可以与 :ref:`micropython` 一起使用。

.. code-block:: python

    # 初始化
    import display_driver
    import lvgl as lv

    # 创建一个带标签的按钮
    scr = lv.obj()
    btn = lv.button(scr)
    btn.align(lv.ALIGN.CENTER, 0, 0)
    label = lv.label(btn)
    label.set_text('Hello World!')
    lv.screen_load(scr)
.. _going_deeper:

Going Deeper（深入了解）
************************
.. raw:: html

   <details>
     <summary>显示原文</summary>
There are several good ways ways to gain deeper knowledge of LVGL.  Here is one
recommended order of documents to read and things to play with while you are
advancing your knowledge:

1. If not already read, start with :ref:`introduction` page of
   the documentation.  (5 minutes)
2. Check out the `Online Demos`_ to see LVGL in action.  (3 minutes)
3. If not already done, read the :ref:`lvgl_basics` (above).  (15 minutes)
4. Set up an LVGL :ref:`simulator`.  (10 minutes)
5. Have a look at some :ref:`examples` and their code.
6. Add LVGL to your project.  See :ref:`add_lvgl_to_your_project` or check out
   the `ready-to-use Projects`_.
7. Read the :ref:`main_components` pages to get a better understanding of the library. (2-3 hours)
8. Skim the documentation of :ref:`widgets` to see what is available.
9. If you have questions go to the `Forum`_.
10. Read the :ref:`contributing` guide to see how you can help to improve LVGL. (15 minutes)


.. _online demos:           https://lvgl.io/demos
.. _ready-to-use projects:  https://github.com/lvgl?q=lv_port_&type=&language=
.. _forum:                  https://forum.lvgl.io/

.. raw:: html

   </details> 
   <br>

有几种很好的方法可以深入了解 LVGL。以下是推荐的阅读文档顺序和在您提高知识时可以尝试的内容：

1. 如果还没有阅读，请从文档的 :ref:`introduction` 页面开始。（5 分钟）
2. 查看 `在线演示`_ 以了解 LVGL 的实际应用。（3 分钟）
3. 如果还没有完成，请阅读 :ref:`lvgl_basics`（上文）。（15 分钟）
4. 设置一个 LVGL :ref:`simulator`。（10 分钟）
5. 看看一些 :ref:`examples` 及其代码。
6. 将 LVGL 添加到您的项目中。参见 :ref:`add_lvgl_to_your_project` 或查看 `现成的项目`_。
7. 阅读 :ref:`main_components` 页面以更好地理解该库。（2-3 小时）
8. 浏览 :ref:`widgets` 的文档以了解可用的内容。
9. 如果有问题，请访问 `论坛`_。
10. 阅读 :ref:`contributing` 指南，了解如何帮助改进 LVGL。（15 分钟）

.. _在线演示:    https://lvgl.io/demos
.. _现成的项目:  https://github.com/lvgl?q=lv_port_&type=&language=
.. _论坛:        https://forum.lvgl.io/
.. _basics_examples:

Basic Examples（基本示例）
**************************
.. raw:: html

   <details>
     <summary>显示原文</summary>
Below are several basic examples.  They include the application code that produces
the Widget Tree needed to make LVGL render the examples shown.  Each example assumes
a LVGL has undergone normal initialization, meaning that a ``lv_display_t`` object
was created and therefore has an :ref:`active_screen`.

.. raw:: html

   </details> 
   <br>

以下是几个基本示例。它们包含生成小部件树的应用程序代码，以使 LVGL 渲染所示示例。每个示例都假设 LVGL 已经进行了正常初始化，这意味着创建了一个 ``lv_display_t`` 对象，因此有一个 :ref:`active_screen`。

.. include:: ../examples/get_started/index.rst
