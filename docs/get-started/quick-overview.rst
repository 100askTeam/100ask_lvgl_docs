.. _quick-overview:

=========================
Quick overview（快速概览）
=========================

.. raw:: html

   <details>
     <summary>显示原文</summary>

Here you can learn the most important things about LVGL. You should read
this first to get a general impression and read the detailed
:ref:`porting` and :ref:`overview` sections
after that.

.. raw:: html

   </details>
   <br>


在这里您可以了解有关 LVGL 的最重要的事情。 您应该先阅读这部分内容以获得大致印象，然后再阅读详细的 :ref:`porting（移植）` 和 :ref:`overview（概述）` 部分。


Get started in a simulator（从模拟器开始）
-----------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Instead of porting LVGL to embedded hardware straight away, it's highly
recommended to get started in a simulator first.

LVGL is ported to many IDEs to be sure you will find your favorite one.
Go to the :ref:`simulator` section to get ready-to-use projects that can be run
on your PC. This way you can save the time of porting for now and get some
experience with LVGL immediately.

.. raw:: html

   </details>
   <br>


强烈建议您先在lvgl模拟器上开始学习实验，而不是立即将 LVGL 移植到嵌入式硬件。

LVGL 被移植到许多 IDE 中，以确保您能找到自己最喜欢的那个。转到 :ref:`simulator（模拟器）` 部分以获取可以在您的 PC 上运行的现成项目。通过这种方式，您现在可以节省移植时间，并立即获得一些使用 LVGL 的经验。(这是非常有用的！)


Add LVGL into your project（将 LVGL 添加到您的项目中）
---------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If you would rather try LVGL on your own project follow these steps:

-  `Download <https://github.com/lvgl/lvgl/archive/master.zip>`__ or
   clone the library from GitHub with ``git clone https://github.com/lvgl/lvgl.git``.
-  Copy the ``lvgl`` folder into your project.
-  Copy ``lvgl/lv_conf_template.h`` as ``lv_conf.h`` next to the
   ``lvgl`` folder, change the first ``#if 0`` to ``1`` to enable the
   file's content and set the :c:macro:`LV_COLOR_DEPTH` defines.
-  Include ``lvgl/lvgl.h`` in files where you need to use LVGL related functions.
-  Call :cpp:func:`lv_init`
-  Call :cpp:expr:`lv_tick_inc(x)` every ``x`` milliseconds in a Timer or Task
   (``x`` should be between 1 and 10). It is required for the internal
   timing of LVGL. Alternatively, register a ``tick_get_cb`` with
   :cpp:func:`lv_tick_set_cb` so that LVGL can retrieve the current time directly.
-  Create a display.

.. raw:: html

   </details>
   <br>


如果您想在自己的项目中尝试 LVGL，请按照以下步骤操作：

- 从 GitHub `下载 <https://github.com/lvgl/lvgl/archive/master.zip>`__ 或使用git命令 ``git clone https://github.com/lvgl/lvgl.git`` 从GitHub克隆库。
- 将 ``lvgl`` 文件夹复制到您的项目中。
- 将 ``lvgl/lv_conf_template.h`` 复制为 ``lv_conf.h`` 并放在 ``lvgl`` 文件夹旁边，将其第一个的 ``#if 0`` 更改为 ``1`` 以启用该文件的内容并修改设置 :c:macro:`LV_COLOR_DEPTH` 定义。
- 在需要使用 LVGL 相关函数的文件中包含 ``lvgl/lvgl.h``。
- 调用 :cpp:func:`lv_init` (初始化lvgl库)
- 在定时器或任务中每 ``x`` 毫秒调用一次 :cpp:expr:`lv_tick_inc(x)` (``x``  应该在 1 到 10 之间)。 这是 LVGL 的内部计时所必需的。或者，使用 :cpp:func:`lv_tick_set_cb` 注册一个 ``tick_get_cb`` ，以便LVGL可以直接检索当前时间。
- 创建一个显示器。


.. code:: c

   lv_display_t *display = lv_display_create(MY_DISP_HOR_RES, MY_DISP_VER_RES);

.. raw:: html

   <details>
     <summary>显示原文</summary>

-   Create a draw buffer: LVGL supports multiple buffering methods. Here you
   can see how to set up partial buffering
   (that is render the screen and the changed areas in a smaller buffer).
   The buffer size can be set freely but 1/10 screen size is a good starting point.

.. raw:: html

   </details>
   <br>


- 创建一个绘制缓冲区：LVGL支持多种缓冲方法。在这里，你可以看到如何设置局部缓冲（即在一个较小的缓冲区中渲染屏幕和已更改的区域）。 缓冲区的大小可以自由设置，但以屏幕大小的 1/10 作为起点是一个不错的选择。


.. code:: c

   /*Declare a buffer for 1/10 screen size*/
   #define BYTE_PER_PIXEL (LV_COLOR_FORMAT_GET_SIZE(LV_COLOR_FORMAT_RGB565)) /*will be 2 for RGB565 */
   static uint8_t buf1[MY_DISP_HOR_RES * MY_DISP_VER_RES / 10 * BYTE_PER_PIXEL];
   lv_display_set_buffers(display, buf1, NULL, sizeof(buf1), LV_DISPLAY_RENDER_MODE_PARTIAL);  /*Initialize the display buffer.*/

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  Implement and register a function which can copy the rendered image
   to an area of your display:

.. raw:: html

   </details>
   <br>


- 实现并注册一个能够将渲染后的图像复制到你的显示器的某个区域的函数：


.. code:: c

   lv_display_set_flush_cb(display, my_disp_flush);

   void my_disp_flush(lv_display_t * disp, const lv_area_t * area, lv_color_t * color_p)
   {
       int32_t x, y;
       /*It's a very slow but simple implementation.
        *`set_pixel` needs to be written by you to a set pixel on the screen*/
       for(y = area->y1; y <= area->y2; y++) {
           for(x = area->x1; x <= area->x2; x++) {
               set_pixel(x, y, *color_p);
               color_p++;
           }
       }

       lv_display_flush_ready(disp);         /* Indicate you are ready with the flushing*/
   }

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  Implement and register a function which can read an input device.
   E.g. for a touchpad:

.. raw:: html

   </details>
   <br>


- 实现并注册一个可以读取输入设备的函数。例如。对于触摸板：


.. code:: c

   lv_indev_t * indev = lv_indev_create();           /*Create an input device*/
   lv_indev_set_type(indev, LV_INDEV_TYPE_POINTER);  /*Touch pad is a pointer-like device*/
   lv_ondev_set_read_cb(indev, my_touchpad_read);    /*Set your driver function*/

   void my_touchpad_read(lv_indev_drv_t * indev_drv, lv_indev_data_t * data)
   {
       /*`touchpad_is_pressed` and `touchpad_get_xy` needs to be implemented by you*/
       if(touchpad_is_pressed()) {
         data->state = LV_INDEV_STATE_PRESSED;
         touchpad_get_xy(&data->point.x, &data->point.y);
       } else {
         data->state = LV_INDEV_STATE_RELEASED;
       }

   }

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  Call :cpp:func:`lv_timer_handler` periodically every few milliseconds in
   the main ``while(1)`` loop or in an operating system task. It will
   redraw the screen if required, handle input devices, animation etc.

For a more detailed guide go to the :ref:`porting`
section.

.. raw:: html

   </details>
   <br>


在主函数 ``while(1)`` 循环中或操作系统任务中每隔几毫秒定期调用 :cpp:func:`lv_timer_handler` 。 如果需要，它将重绘屏幕，处理输入设备、动画等。

有关更详细的指南，请转到 :ref:`porting（移植）` 部分。


Learn the basics（学习基础知识）
-------------------------------

.. _quick-overview_widgets:

Widgets（控件）
~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

The graphical elements like Buttons, Labels, Sliders, Charts etc. are
called objects or widgets. Go to :ref:`widgets` to see the
full list of available widgets.

Every object has a parent object where it is created. For example, if a
label is created on a button, the button is the parent of label.

The child object moves with the parent and if the parent is deleted the
children will be deleted too.

Children can be visible only within their parent's bounding area. In
other words, the parts of the children outside the parent are clipped.

A Screen is the "root" parent. You can have any number of screens.

To get the current screen call :cpp:func:`lv_screen_active`, and to load a screen
use :cpp:expr:`lv_screen_load(scr1)`.

You can create a new object with ``lv_<type>_create(parent)``. It will
return an :cpp:type:`lv_obj_t` ``*`` variable that can be used as a reference to the
object to set its parameters.

For example:

.. code:: c

   lv_obj_t * slider1 = lv_slider_create(lv_screen_active());

To set some basic attributes ``lv_obj_set_<parameter_name>(obj, <value>)`` functions can be used. For
example:

.. code:: c

   lv_obj_set_x(btn1, 30);
   lv_obj_set_y(btn1, 10);
   lv_obj_set_size(btn1, 200, 50);

Along with the basic attributes, widgets can have type specific
parameters which are set by ``lv_<widget_type>_set_<parameter_name>(obj, <value>)`` functions. For
example:

.. code:: c

   lv_slider_set_value(slider1, 70, LV_ANIM_ON);

To see the full API visit the documentation of the widgets or the
related header file
(e.g. `lvgl/src/widgets/slider/lv_slider.h <https://github.com/lvgl/lvgl/blob/master/src/widgets/slider/lv_slider.h>`__).

.. raw:: html

   </details>
   <br>


按钮、标签、滑块、图表等图形元素称为对象或小部件。转到 :ref:`widgets（控件）` 以查看可用小部件的完整列表。

每个对象都有一个创建它的父对象。例如，如果一个标签创建在一个按钮上，那么这个按钮就是标签的父对象。

子对象与父对象一起移动，如果删除父对象，子对象也将被删除。

子对象只能在其父项上可见。换句话说，子对象在父对象外部的部分会被裁剪。

Screen 是“根”父级。您可以拥有任意数量的屏幕。

要获取当前屏幕，可以调用 :cpp:func:`lv_screen_active`，并使用 :cpp:expr:`lv_screen_load(scr1)` 加载屏幕。
 
您可以使用 ``lv_<type>_create(parent)`` 创建一个新对象。它将返回一个 :cpp:type:`lv_obj_t` ``*`` 类型的变量，这个变量可以作为对该对象的引用以设置其参数。

For example（例如）:

.. code:: c

   lv_obj_t * slider1 = lv_slider_create(lv_screen_active());

要设置一些基本属性，可以使用 ``lv_obj_set_<parameter_name>(obj, <value>)`` 函数。例如：

.. code:: c

   lv_obj_set_x(btn1, 30);
   lv_obj_set_y(btn1, 10);
   lv_obj_set_size(btn1, 200, 50);

除了基本属性外，小部件还可以具有特定类型的参数，这些参数通过 ``lv_<widget_type>_set_<parameter_name>(obj, <value>)`` 函数进行设置。例如：

.. code:: c

   lv_slider_set_value(slider1, 70, LV_ANIM_ON);

要查看完整的 API，请访问小部件的文档或相关的头文件（例如 `lvgl/src/widgets/slider/lv_slider.h <https://github.com/lvgl/lvgl/blob/master/src/widgets/slider/lv_slider.h>`__）。


.. _quick-overview_events:

Events（事件）
~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Events are used to inform the user that something has happened with an
object. You can assign one or more callbacks to an object which will be
called if the object is clicked, released, dragged, being deleted, etc.

A callback is assigned like this:

.. code:: c

   lv_obj_add_event_cb(btn, btn_event_cb, LV_EVENT_CLICKED, NULL); /*Assign a callback to the button*/

   ...

   void btn_event_cb(lv_event_t * e)
   {
       printf("Clicked\n");
   }

:cpp:enumerator:`LV_EVENT_ALL` can be used instead of :cpp:enumerator:`LV_EVENT_CLICKED` to invoke
the callback for any event.

From :cpp:expr:`lv_event_t * e` the current event code can be retrieved with:

.. code:: c

   lv_event_code_t code = lv_event_get_code(e);

The object that triggered the event can be retrieved with:

.. code:: c

   lv_obj_t * obj = lv_event_get_target(e);

To learn all features of the events go to the :ref:`events` section.

.. raw:: html

   </details>
   <br>


事件用于通知用户某个对象发生了某些事情。 您可以为一个对象分配一个或多个回调函数，如果该对象被单击、释放、拖动、删除等情况发生时，这些回调函数将被调用。

回调函数的分配方式如下：

.. code:: c

   lv_obj_add_event_cb(btn, btn_event_cb, LV_EVENT_CLICKED, NULL); /*为按钮分配一个回调函数*/

   ...

   void btn_event_cb(lv_event_t * e)
   {
       printf("Clicked\n");
   }

:cpp:enumerator:`LV_EVENT_CLICKED` 可以代替 :cpp:enumerator:`LV_EVENT_ALL` ，以便在任何事情发生时调用回调函数。

从 :cpp:expr:`lv_event_t * e` 中，可以使用以下方式获取当前事件代码：

.. code:: c

   lv_event_code_t code = lv_event_get_code(e);

触发事件的对象可以通过以下方式获取：

.. code:: c

   lv_obj_t * obj = lv_event_get_target(e);

要了解事件的所有功能，请转到 :ref:`events` 部分。


.. _quick-overview_parts:

Parts（部分）
~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Widgets might be built from one or more *parts*. For example, a button
has only one part called :cpp:enumerator:`LV_PART_MAIN`. However, a
:ref:`lv_slider` has :cpp:enumerator:`LV_PART_MAIN`, :cpp:enumerator:`LV_PART_INDICATOR`
and :cpp:enumerator:`LV_PART_KNOB`.

By using parts you can apply different styles to sub-elements of a
widget. (See below)

Read the widgets' documentation to learn which parts each uses.

.. raw:: html

   </details>
   <br>


部件可能由一个或多个 *部分* 组成。例如，一个按钮只有一个名为 :cpp:enumerator:`LV_PART_MAIN` 的部分。但是，一个 :ref:`lv_slider(滑块)`  具有 :cpp:enumerator:`LV_PART_MAIN`、 :cpp:enumerator:`LV_PART_INDICATOR` 和 :cpp:enumerator:`LV_PART_KNOB`。

通过使用部分，你可以对小部件的子元素应用不同的样式。（见下文）

阅读小部件的文档，了解每个小部件使用的部分。


.. _quick-overview_states:

States（状态）
~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL objects can be in a combination of the following states:

- :cpp:enumerator:`LV_STATE_DEFAULT`: Normal, released state
- :cpp:enumerator:`LV_STATE_CHECKED`: Toggled or checked state
- :cpp:enumerator:`LV_STATE_FOCUSED`: Focused via keypad or encoder or clicked via touchpad/mouse
- :cpp:enumerator:`LV_STATE_FOCUS_KEY`: Focused via keypad or encoder but not via touchpad/mouse
- :cpp:enumerator:`LV_STATE_EDITED`: Edit by an encoder
- :cpp:enumerator:`LV_STATE_HOVERED`: Hovered by mouse
- :cpp:enumerator:`LV_STATE_PRESSED`: Being pressed
- :cpp:enumerator:`LV_STATE_SCROLLED`: Being scrolled
- :cpp:enumerator:`LV_STATE_DISABLED`: Disabled

For example, if you press an object it will automatically go to the
:cpp:enumerator:`LV_STATE_FOCUSED` and :cpp:enumerator:`LV_STATE_PRESSED` states and when you
release it the :cpp:enumerator:`LV_STATE_PRESSED` state will be removed while focus
remains active.

To check if an object is in a given state use
``lv_obj_has_state(obj, LV_STATE_...)``. It will return ``true`` if the
object is currently in that state.

To manually add or remove states use:

.. raw:: html

   </details>
   <br>


LVGL 对象可以处于以下状态的组合：

- :cpp:enumerator:`LV_STATE_DEFAULT`: 正常，释放状态
- :cpp:enumerator:`LV_STATE_CHECKED`: 切换或选中状态
- :cpp:enumerator:`LV_STATE_FOCUSED`: 通过键盘或编码器聚焦或通过触摸板/鼠标点击
- :cpp:enumerator:`LV_STATE_FOCUS_KEY`: 通过键盘或编码器聚焦，但不通过触摸板/鼠标聚焦
- :cpp:enumerator:`LV_STATE_EDITED`: 由编码器编辑
- :cpp:enumerator:`LV_STATE_HOVERED`: 鼠标悬停
- :cpp:enumerator:`LV_STATE_PRESSED`: 正在被按下
- :cpp:enumerator:`LV_STATE_SCROLLED`: 正在滚动
- :cpp:enumerator:`LV_STATE_DISABLED`: 被禁用

例如，如果你按下一个对象，它会自动进入 :cpp:enumerator:`LV_STATE_FOCUSED` 和 :cpp:enumerator:`LV_STATE_PRESSED` 状态，当你释放它时， :cpp:enumerator:`LV_STATE_PRESSED` 状态将被移除，而焦点任然保持活动状态。

要检查对象是否处于给定状态，请使用 ``lv_obj_has_state(obj, LV_STATE_...)``。如果对象当时处于该状态，它将返回 ``true`` 。

要手动添加或删除状态，请使用下面的函数：


.. code:: c

   lv_obj_add_state(obj, LV_STATE_...);
   lv_obj_remove_state(obj, LV_STATE_...);

.. _quick-overview_styles:

Styles（样式）
~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

A style instance contains properties such as background color, border
width, font, etc. that describe the appearance of objects.

Styles are represented with :cpp:struct:`lv_style_t` variables. Only their pointer
is saved in the objects so they need to be defined as static or global.
Before using a style it needs to be initialized with
:cpp:expr:`lv_style_init(&style1)`. After that, properties can be added to
configure the style. For example:

.. raw:: html

   </details>
   <br>


一个样式实例包含背景颜色、边框宽度、字体等属性，用于描述对象的外观。

样式用 :cpp:struct:`lv_style_t` 类型的变量表示。由于只有他们的指针被保存在对象中，因此需要将它们定义为静态或全局变量。 在使用一个样式之前，需要使用  :cpp:expr:`lv_style_init(&style1)` 对其进行初始化。之后，可以添加属性来配置样式。例如：


.. code:: c

   static lv_style_t style1;
   lv_style_init(&style1);
   lv_style_set_bg_color(&style1, lv_color_hex(0xa03080))
   lv_style_set_border_width(&style1, 2))

.. raw:: html

   <details>
     <summary>显示原文</summary>

See the full list of properties here :ref:`styles_properties`.

Styles are assigned using the ORed combination of an object's part and
state. For example to use this style on the slider's indicator when the
slider is pressed:

.. raw:: html

   </details>
   <br>


在此处查看属性的完整列表 :ref:`styles_properties`。

样式是通过对象的部分和状态的按位或组合来分配的。例如，要在滑块被按下时将此样式应用于滑块的指示器上：


.. code:: c

   lv_obj_add_style(slider1, &style1, LV_PART_INDICATOR | LV_STATE_PRESSED);

.. raw:: html

   <details>
     <summary>显示原文</summary>

If the *part* is :cpp:enumerator:`LV_PART_MAIN` it can be omitted:

.. raw:: html

   </details>
   <br>


如果 *part* 是 :cpp:enumerator:`LV_PART_MAIN` ，则可以省略它：


.. code:: c

   lv_obj_add_style(btn1, &style1, LV_STATE_PRESSED); /*Equal to LV_PART_MAIN | LV_STATE_PRESSED*/

.. raw:: html

   <details>
     <summary>显示原文</summary>

Similarly, :cpp:enumerator:`LV_STATE_DEFAULT` can be omitted too:

.. raw:: html

   </details>
   <br>


类似地， :cpp:enumerator:`LV_STATE_DEFAULT` 也可以省略：


.. code:: c

   lv_obj_add_style(slider1, &style1, LV_PART_INDICATOR); /*Equal to LV_PART_INDICATOR | LV_STATE_DEFAULT*/

.. raw:: html

   <details>
     <summary>显示原文</summary>

For :cpp:enumerator:`LV_STATE_DEFAULT` and :cpp:enumerator:`LV_PART_MAIN` simply write ``0``:

.. raw:: html

   </details>
   <br>


对于 :cpp:enumerator:`LV_STATE_DEFAULT` 和 :cpp:enumerator:`LV_PART_MAIN` 只需写下 ``0``:


.. code:: c

   lv_obj_add_style(btn1, &style1, 0); /*Equal to LV_PART_MAIN | LV_STATE_DEFAULT*/

.. raw:: html

   <details>
     <summary>显示原文</summary>

Styles can be cascaded (similarly to CSS). It means you can add more
styles to a part of an object. For example ``style_btn`` can set a
default button appearance, and ``style_btn_red`` can overwrite the
background color to make the button red:

.. raw:: html

   </details>
   <br>


样式可以级联（类似于 CSS）。这意味着您可以为对象的一部分添加更多样式。 例如 ``style_btn`` 可以设置默认的按钮外观， ``style_btn_red`` 可以覆盖背景颜色使按钮变为红色：


.. code:: c

   lv_obj_add_style(btn1, &style_btn, 0);
   lv_obj_add_style(btn1, &style1_btn_red, 0);

.. raw:: html

   <details>
     <summary>显示原文</summary>

If a property is not set on for the current state, the style with
:cpp:enumerator:`LV_STATE_DEFAULT` will be used. A default value is used if the
property is not defined in the default state.

Some properties (typically the text-related ones) can be inherited. This
means if a property is not set in an object it will be searched for in
its parents too. For example, you can set the font once in the screen's
style and all text on that screen will inherit it by default.

Local style properties also can be added to objects. This creates a
style which resides inside the object and is used only by the object:

.. raw:: html

   </details>
   <br>


如果没有为当前状态设置属性，则将使用带有 :cpp:enumerator:`LV_STATE_DEFAULT` 的样式。如果在默认状态下未定义该属性，则会使用默认值。

一些属性（通常是与文本相关的属性）可以被继承。这意味着如果一个对象中未设置某个属性，它也会在它的父对象进行查找。 例如，您可以在屏幕的样式中设置一次字体，该屏幕上的所有文本都将默认继承它。

也可以向对象添加局部样式属性。这将创建一个驻留在对象内部且仅由该对象使用的样式：


.. code:: c

   lv_obj_set_style_bg_color(slider1, lv_color_hex(0x2080bb), LV_PART_INDICATOR | LV_STATE_PRESSED);

.. raw:: html

   <details>
     <summary>显示原文</summary>

To learn all the features of styles see the :ref:`styles` section.

.. raw:: html

   </details>
   <br>


要了解样式的所有功能，请参阅 :ref:`styles` 部分。


.. _quick-overview_themes:

Themes（主题）
~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Themes are the default styles for objects. Styles from a theme are
applied automatically when objects are created.

The theme for your application is a compile time configuration set in
``lv_conf.h``.

.. raw:: html

   </details>
   <br>


主题是对象的默认样式。创建对象时，将自动应用来自主题的样式。

应用程序的主题是在 ``lv_conf.h`` 中设置的编译时配置。


.. _quick-overview_examples:

Examples
--------

.. include:: ../examples/get_started/index.rst

.. _quick-overview_micropython:

MicroPython
-----------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Learn more about :ref:`micropython`.

.. raw:: html

   </details>
   <br>


了解有关 :ref:`micropython` 的更多信息。


.. code:: python

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
