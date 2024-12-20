.. _display:

====================
Display (lv_display)
====================

.. raw:: html

   <details>
     <summary>显示原文</summary>

What is a Display?
******************
In LVGL, an *lv_display_t* (not to be confused with a :ref:`Screen <screens>`) is a
data type that represents a single display panel --- the hardware that displays
LVGL-rendered pixels on your device.  During system initialization, you must do the
following for each display panel you want LVGL to use:

- :ref:`create an lv_display_t <creating_a_display>` object for it,
- assign a :ref:`flush_callback` for it, and
- assign its :ref:`draw_buffers`.

.. raw:: html

   </details>
   <br>

什么是显示器？
******************

在 LVGL 中，*lv_display_t*（不要与 :ref:`Screen <screens>` 混淆）是一个数据类型，表示一个单独的显示面板——即硬件设备，用于在您的设备上显示 LVGL 渲染的像素。
在系统初始化期间，您必须为每个希望 LVGL 使用的显示面板执行以下操作：

- :ref:`为其创建 lv_display_t <creating_a_display>` 对象，
- 为其分配一个 :ref:`flush_callback`，
- 分配它的 :ref:`draw_buffers`。

.. _multiple_dislays:

.. raw:: html

   <details>
     <summary>显示原文</summary>

How Many Displays Can LVGL Use?
*******************************
LVGL can use any number of displays.  It is only limited by available RAM and MCU time.

Why would you want multi-display support?  Here are some examples:

- Have a "normal" TFT display with local UI and create "virtual" screens on VNC
  on demand. (You need to add your VNC driver.)
- Have a large TFT display and a small monochrome display.
- Have some smaller and simple displays in a large instrument or technology.
- Have two large TFT displays: one for a customer and one for the shop assistant.

If you set up LVGL to use more than one display, be aware that some functions use the
:ref:`default_display` during their execution, such as creating :ref:`screens`.

.. raw:: html

   </details>
   <br>

LVGL 可以使用多少个显示器？
*******************************

LVGL 可以使用任意数量的显示器，唯一的限制是可用的 RAM 和 MCU 时间。

为什么你需要支持多显示器？以下是一些示例：

- 拥有一个“正常的”TFT 显示器用于本地 UI，并根据需要在 VNC 上创建“虚拟”屏幕。（你需要添加 VNC 驱动程序。）
- 拥有一个大尺寸 TFT 显示器和一个小的单色显示器。
- 在一个大型仪器或技术设备中拥有一些较小且简单的显示器。
- 拥有两个大尺寸 TFT 显示器：一个给客户用，另一个给店员用。

如果你设置 LVGL 使用多个显示器，请注意某些函数在执行时使用 :ref:`default_display`，例如创建 :ref:`screens`。

.. _display_features:

Display Features
****************


.. _display_attributes:

.. raw:: html

   <details>
     <summary>显示原文</summary>

Attributes
----------
Once created, a Display object remembers the characteristics of the display hardware
it is representing, as well as other things relevant to its lifetime:

- Resolution (width and height in pixels)
- Color Depth (bits per pixel)
- Color Format (how colors in pixels are laid out)
- 4 :ref:`screen_layers` automatically created with each display
- All :ref:`screens` created in association with this display (and not yet deleted---only
  one is dislayed at any given time)
- The :ref:`draw_buffers` assigned to it
- The :ref:`flush_callback` function that moves pixels from :ref:`draw_buffers` to Display hardware
- What areas of the display have been updated (made "dirty") so rendering logic can
  compute what to render during a :ref:`display refresh <basic_data_flow>`
- Optional custom pointer as :ref:`display_user_data`

.. raw:: html

   </details>
   <br>

属性
----------

一旦创建，Display 对象会记住它所表示的显示硬件的特性，以及与其生命周期相关的其他信息：

- 分辨率（宽度和高度，单位为像素）
- 颜色深度（每像素位数）
- 颜色格式（像素中的颜色布局方式）
- 每个显示器自动创建的 4 个 :ref:`screen_layers`
- 与此显示器关联的所有 :ref:`screens`（且尚未删除——在任何给定时刻只显示一个）
- 分配给它的 :ref:`draw_buffers`
- 用于将像素从 :ref:`draw_buffers` 移动到显示硬件的 :ref:`flush_callback` 函数
- 显示器的哪些区域已更新（被标记为“脏”），以便渲染逻辑在 :ref:`display refresh <basic_data_flow>` 时计算需要渲染的内容
- 可选的自定义指针，作为 :ref:`display_user_data`

.. _screen_layers:

.. raw:: html

   <details>
     <summary>显示原文</summary>

Screen Layers
-------------

When an ``lv_display_t`` object is created, 4 permanent :ref:`screens` that
facilitate layering are created and attached to it.

1.  Bottom Layer       (below Active Screen, transparent, not scroll-able, but click-able)
2.  :ref:`active_screen`
3.  Top Layer          (above Active Screen, transparent and neither scroll-able nor click-able)
4.  System Layer       (above Top Layer, transparent and neither scroll-able nor click-able)

1, 3 and 4 are independent of the :ref:`active_screen` and they will be shown (if
they contain anything that is visible) regardless of which screen is the
:ref:`active_screen`.

.. note::

    For the bottom layer to be visible, the Active Screen's background has to be
    at least partially, if not fully, transparent.

You can get pointers to each of these screens on the :ref:`default_display` by using
(respectively):

- :cpp:func:`lv_screen_active`,
- :cpp:func:`lv_layer_top`,
- :cpp:func:`lv_layer_sys`, and
- :cpp:func:`lv_layer_bottom`.

You can get pointers to each of these screens on a specified display by using
(respectively):

- :cpp:expr:`lv_display_get_screen_active(disp)`,
- :cpp:expr:`lv_display_get_layer_top(disp)`,
- :cpp:expr:`lv_display_get_layer_sys(disp)`, and
- :cpp:expr:`lv_display_get_layer_bottom(disp)`.

To set a Screen you create to be the :ref:`active_screen`, call
:cpp:func:`lv_screen_load` or :cpp:func:`lv_screen_load_anim`.

.. raw:: html

   </details>
   <br>

屏幕层
-------------

当一个 ``lv_display_t`` 对象被创建时，4 个永久的 :ref:`screens` 会被创建并附加到它上面，这些屏幕有助于实现层次结构。

1. 底层（位于活动屏幕下方，透明、不可滚动，但可以点击）
2. :ref:`active_screen`
3. 顶层（位于活动屏幕上方，透明且不可滚动或点击）
4. 系统层（位于顶层上方，透明且不可滚动或点击）

1、3 和 4 层是独立于 :ref:`active_screen` 的，它们会被显示（如果它们包含任何可见内容），无论当前活动屏幕是什么。

.. note::

    为了使底层可见，活动屏幕的背景必须至少部分透明，甚至完全透明。

你可以通过以下方式获取 :ref:`default_display` 上这些屏幕的指针（分别是）：

- :cpp:func:`lv_screen_active`，
- :cpp:func:`lv_layer_top`，
- :cpp:func:`lv_layer_sys`，和
- :cpp:func:`lv_layer_bottom`。

你也可以通过以下方式获取指定显示器上的这些屏幕的指针（分别是）：

- :cpp:expr:`lv_display_get_screen_active(disp)`，
- :cpp:expr:`lv_display_get_layer_top(disp)`，
- :cpp:expr:`lv_display_get_layer_sys(disp)`，和
- :cpp:expr:`lv_display_get_layer_bottom(disp)`。

要将创建的屏幕设置为 :ref:`active_screen`，调用 :cpp:func:`lv_screen_load` 或 :cpp:func:`lv_screen_load_anim`。

.. _layers_top_and_sys:

.. raw:: html

   <details>
     <summary>显示原文</summary>

Top and System Layers
~~~~~~~~~~~~~~~~~~~~~

LVGL uses the Top Layer and System Layer two empower you to ensure that certain
:ref:`widgets` are *always* on top of other layers.

You can add "pop-up windows" to the *Top Layer* freely.  The Top Layer was meant to
be used to create Widgets that are visible on all Screens shown on a Display.  But,
the *System Layer* is intended for system-level things (e.g. mouse cursor will be
placed there with :cpp:func:`lv_indev_set_cursor`).

These layers work like any other Widget, meaning they have styles, and any kind of
Widgets can be created in them.

.. note::
    While the Top Layer and System Layer are created by their owning :ref:`display`
    as not scroll-able and not click-able, these behaviors can be overridden the same
    as any other Widget by using :cpp:expr:`lv_obj_set_scrollbar_mode(scr1, LV_SCROLLBAR_MODE_xxx)`
    and :cpp:expr:`lv_obj_add_flag(scr1, LV_OBJ_FLAG_CLICKABLE)` respectively.

If the :cpp:enumerator:`LV_OBJ_FLAG_CLICKABLE` flag is set on the Top Layer, then it will
absorb all user clicks and acts as a modal Widget.

.. code-block:: c

   lv_obj_add_flag(lv_layer_top(), LV_OBJ_FLAG_CLICKABLE);

.. raw:: html

   </details>
   <br>

顶层和系统层
~~~~~~~~~~~~~~~~~~~~~

LVGL 使用顶层和系统层来确保某些 :ref:`widgets` *始终* 位于其他层之上。

你可以自由地将“弹出窗口”添加到 *顶层*。顶层旨在用于创建在显示器上所有屏幕上都可见的 Widgets。
而 *系统层* 则用于系统级别的内容（例如，鼠标光标将通过 :cpp:func:`lv_indev_set_cursor` 被放置在该层）。

这些层像任何其他 Widget 一样工作，这意味着它们有样式，并且可以在它们上创建任何类型的 Widget。

.. note::

    虽然顶层和系统层是由它们所属的 :ref:`display` 创建的，并且默认不可滚动和不可点击，但这些行为可以像任何其他 Widget 一样被覆盖
    方法是分别使用 :cpp:expr:`lv_obj_set_scrollbar_mode(scr1, LV_SCROLLBAR_MODE_xxx)` 和 :cpp:expr:`lv_obj_add_flag(scr1, LV_OBJ_FLAG_CLICKABLE)`。

如果在顶层上设置了 :cpp:enumerator:`LV_OBJ_FLAG_CLICKABLE` 标志，则它将吸收所有用户点击并充当模态 Widget。

.. code-block:: c

   lv_obj_add_flag(lv_layer_top(), LV_OBJ_FLAG_CLICKABLE);

.. _layers_bottom:

.. raw:: html

   <details>
     <summary>显示原文</summary>

Bottom Layer
~~~~~~~~~~~~

Similar to the Top- and System Layers, the Bottom Layer is also the full size of the
Display, but it is located below the :ref:`active_screen`.  It's visible only if the
Active Screen's background opacity is < 255.

.. raw:: html

   </details>
   <br>

底层
~~~~~~~~~~~~

与顶层和系统层类似，底层也与显示器的大小相同，但它位于 :ref:`active_screen` 之下。
只有当活动屏幕的背景不透明度小于 255 时，底层才会可见。

.. _display_events:

.. raw:: html

   <details>
     <summary>显示原文</summary>

Display Events
**************

:cpp:expr:`lv_display_add_event_cb(disp, event_cb, LV_EVENT_..., user_data)` adds
an event handler to a display.

If you added ``user_data`` to the Display, you can retrieve it in an event like this:

.. code-block:: c

    lv_dislay_t  *display1;
    my_type_t    *my_user_data;
    display1 = (lv_dislay_t *)lv_event_get_current_target(e);
    my_user_data = lv_display_get_user_data(display1);

The following events are sent:

- :cpp:enumerator:`LV_EVENT_INVALIDATE_AREA` An area is invalidated (marked for redraw).
  :cpp:expr:`lv_event_get_param(e)` returns a pointer to an :cpp:struct:`lv_area_t`
  variable with the coordinates of the area to be invalidated. The area can
  be freely modified if needed to adopt it the special requirement of the
  display. Usually needed with monochrome displays to invalidate ``N x 8``
  rows or columns at once.
- :cpp:enumerator:`LV_EVENT_REFR_REQUEST`: Sent when something happened that requires redraw.
- :cpp:enumerator:`LV_EVENT_REFR_START`: Sent when a refreshing cycle starts. Sent even if there is nothing to redraw.
- :cpp:enumerator:`LV_EVENT_REFR_READY`: Sent when refreshing is ready (after rendering and calling the :ref:`flush_callback`). Sent even if no redraw happened.
- :cpp:enumerator:`LV_EVENT_RENDER_START`: Sent when rendering starts.
- :cpp:enumerator:`LV_EVENT_RENDER_READY`: Sent when rendering is ready (before calling the :ref:`flush_callback`)
- :cpp:enumerator:`LV_EVENT_FLUSH_START`: Sent before the :ref:`flush_callback` is called.
- :cpp:enumerator:`LV_EVENT_FLUSH_READY`: Sent when the :ref:`flush_callback` returned.
- :cpp:enumerator:`LV_EVENT_RESOLUTION_CHANGED`: Sent when the resolution changes due
  to :cpp:func:`lv_display_set_resolution` or :cpp:func:`lv_display_set_rotation`.

.. raw:: html

   </details>
   <br>

显示器事件
**************

:cpp:expr:`lv_display_add_event_cb(disp, event_cb, LV_EVENT_..., user_data)` 为显示器添加事件处理程序。

如果你在显示器中添加了 ``user_data``，你可以在事件中像这样获取它：

.. code-block:: c

    lv_dislay_t  *display1;
    my_type_t    *my_user_data;
    display1 = (lv_dislay_t *)lv_event_get_current_target(e);
    my_user_data = lv_display_get_user_data(display1);

以下是发送的事件：

- :cpp:enumerator:`LV_EVENT_INVALIDATE_AREA` 区域无效（标记为重绘）。 :cpp:expr:`lv_event_get_param(e)` 返回一个指向 :cpp:struct:`lv_area_t` 变量的指针，表示需要无效化的区域的坐标。如果需要，可以自由修改该区域，以适应显示器的特殊要求。通常在单色显示器中需要一次性使 ``N x 8`` 行或列无效。
- :cpp:enumerator:`LV_EVENT_REFR_REQUEST`：当发生需要重绘的事件时发送。
- :cpp:enumerator:`LV_EVENT_REFR_START`：当刷新周期开始时发送。即使没有需要重绘的内容，也会发送此事件。
- :cpp:enumerator:`LV_EVENT_REFR_READY`：当刷新准备就绪时发送（在渲染和调用 :ref:`flush_callback` 之后）。即使没有发生重绘，也会发送此事件。
- :cpp:enumerator:`LV_EVENT_RENDER_START`：当渲染开始时发送。
- :cpp:enumerator:`LV_EVENT_RENDER_READY`：当渲染准备好时发送（在调用 :ref:`flush_callback` 之前）。
- :cpp:enumerator:`LV_EVENT_FLUSH_START`：在调用 :ref:`flush_callback` 之前发送。
- :cpp:enumerator:`LV_EVENT_FLUSH_READY`：当 :ref:`flush_callback` 返回时发送。
- :cpp:enumerator:`LV_EVENT_RESOLUTION_CHANGED`：当分辨率因 :cpp:func:`lv_display_set_resolution` 或 :cpp:func:`lv_display_set_rotation` 发生变化时发送。

.. _display_setup:

Display Setup
*************


.. _creating_a_display:

.. raw:: html

   <details>
     <summary>显示原文</summary>

Creating a Display
------------------

To create a display for LVGL:

.. code-block:: c

    lv_display_t * display1 = lv_display_create(hor_res, ver_res)

You can create :ref:`multiple dislays <multiple_dislays>` with a different driver for
each (see below).

When an ``lv_display_t`` object is created, with it are created 4 Screens set up
to help you manage layering of displayed Widgets.  See :ref:`transparent_screens` and
:ref:`screen_layers` for more information.

.. raw:: html

   </details>
   <br>

创建显示器
------------------

要为 LVGL 创建一个显示器：

.. code-block:: c

    lv_display_t * display1 = lv_display_create(hor_res, ver_res)

你可以创建多个 :ref:`显示器 <multiple_dislays>`，每个显示器可以使用不同的驱动程序（见下文）。

当创建 ``lv_display_t`` 对象时，它会自动创建 4 个屏幕，用于帮助你管理显示的 Widgets 的层次。有关更多信息，请参见 :ref:`透明屏幕` 和 :ref:`屏幕层`。


.. _default_display:

.. raw:: html

   <details>
     <summary>显示原文</summary>

Default Display
~~~~~~~~~~~~~~~
When the first :ref:`display` object is created, it becomes the Default Display.  If
other Display Objects are created (to service additional Display Panels), the Default
Display remains the first one created.

To set another :ref:`display` as the Default Display, call :cpp:func:`lv_display_set_default`.

See :ref:`multiple_dislays` for more information about using multiple displays.

For many ``lv_display_...()`` functions, passing NULL for the ``disp`` argument will
cause the function to target the Default Display.  Check the API documentation for
the function you are calling to be sure.

.. raw:: html

   </details>
   <br>

默认显示器
~~~~~~~~~~~~~~~

当第一个 :ref:`显示器` 对象被创建时，它会成为默认显示器。如果创建了其他显示器对象（用于服务其他显示面板），默认显示器将保持为第一个创建的显示器。

要设置另一个 :ref:`显示器` 为默认显示器，请调用 :cpp:func:`lv_display_set_default`。

有关使用多个显示器的更多信息，请参见 :ref:`多个显示器`。

对于许多 ``lv_display_...()`` 函数，传递 NULL 作为 ``disp`` 参数将使该函数作用于默认显示器。请检查你调用的函数的 API 文档以确认。

.. _draw_buffers:

.. raw:: html

   <details>
     <summary>显示原文</summary>

Draw Buffer(s)
--------------

During system initialization, you must set drawing buffers for LVGL to use for each
display.  Do so by calling:

.. code-block:: c

    lv_display_set_buffers(display1, buf1, buf2, buf_size_in_bytes, render_mode)

-  ``buf1`` a buffer to which LVGL can render pixels
-  ``buf2`` a second optional buffer (see below)
-  ``buf_size_in_bytes`` size of buffer(s) in bytes
-  ``render_mode`` is one of the following:

   -  :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_PARTIAL` Use the buffer(s) to render
      to the display using buffers smaller than the size of the display.  Use of
      buffers at least 1/10 display size is recommended.  In :ref:`flush_callback` the rendered
      images needs to be copied to the given area of the display.  In this mode if a
      button is pressed only the button's area will be redrawn.
   -  :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_DIRECT` The buffer size(es) must match
      the size of the display.  LVGL will render into the correct location of the
      buffer.  Using this method the buffer(s) always contain the whole display image.
      If two buffer are used, the rendered areas are automatically copied to the
      other buffer after flushing.  Due to this in :ref:`flush_callback` typically
      only a frame buffer address needs to be changed.  If a button is pressed
      only the button's area will be redrawn.
   -  :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_FULL` The buffer size(es) must match
      the size of the display.  LVGL will always redraw the whole screen even if only
      1 pixel has been changed.  If two display-sized draw buffers are provided,
      LVGL's display handling works like "traditional" double buffering.  This means
      the :ref:`flush_callback` callback only has to update the address of the frame buffer to
      the ``px_map`` parameter.

.. raw:: html

   </details>
   <br>

绘图缓冲区
--------------

在系统初始化期间，必须为 LVGL 设置绘图缓冲区，以供每个显示器使用。通过以下方式设置：

.. code-block:: c

    lv_display_set_buffers(display1, buf1, buf2, buf_size_in_bytes, render_mode)

-  ``buf1``：LVGL 可以渲染像素的缓冲区
-  ``buf2``：第二个可选缓冲区（见下文）
-  ``buf_size_in_bytes``：缓冲区的大小（以字节为单位）
-  ``render_mode``：以下之一：

   -  :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_PARTIAL` 使用小于显示器大小的缓冲区进行渲染。建议缓冲区至少为显示器大小的 1/10。在 :ref:`flush_callback` 中，需要将渲染的图像复制到显示器的指定区域。在此模式下，如果按下按钮，则仅按钮区域会被重绘。
   -  :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_DIRECT` 缓冲区大小必须与显示器大小匹配。LVGL 会将图像渲染到缓冲区的正确位置。使用此方法，缓冲区始终包含整个显示图像。如果使用两个缓冲区，渲染区域会在刷新后自动复制到另一个缓冲区。因此，在 :ref:`flush_callback` 中，通常只需更改帧缓冲区地址。如果按下按钮，则仅按钮区域会被重绘。
   -  :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_FULL` 缓冲区大小必须与显示器大小匹配。LVGL 会始终重绘整个屏幕，即使只有 1 个像素发生变化。如果提供了两个与显示器大小相同的绘图缓冲区，LVGL 的显示处理方式类似于传统的双缓冲。这意味着 :ref:`flush_callback` 回调只需更新帧缓冲区的地址到 ``px_map`` 参数。

.. raw:: html

   <details>
     <summary>显示原文</summary>

Simple Example
~~~~~~~~~~~~~~

.. code-block:: c

    /* Declare buffer for 1/10 screen size; BYTES_PER_PIXEL will be 2 for RGB565. */
    #define BYTES_PER_PIXEL (LV_COLOR_FORMAT_GET_SIZE(LV_COLOR_FORMAT_RGB565))
    static uint8_t buf1[MY_DISP_HOR_RES * MY_DISP_VER_RES / 10 * BYTES_PER_PIXEL];
    /* Set display buffer for display `display1`. */
    lv_display_set_buffers(display1, buf1, NULL, sizeof(buf1), LV_DISPLAY_RENDER_MODE_PARTIAL);

.. raw:: html

   </details>
   <br>

简单示例
~~~~~~~~~~~~~~

.. code-block:: c

    /* 声明一个缓冲区，大小为屏幕的1/10；对于 RGB565，BYTES_PER_PIXEL 将为 2。 */
    #define BYTES_PER_PIXEL (LV_COLOR_FORMAT_GET_SIZE(LV_COLOR_FORMAT_RGB565))
    static uint8_t buf1[MY_DISP_HOR_RES * MY_DISP_VER_RES / 10 * BYTES_PER_PIXEL];
    /* 设置 display1 的显示缓冲区。 */
    lv_display_set_buffers(display1, buf1, NULL, sizeof(buf1), LV_DISPLAY_RENDER_MODE_PARTIAL);


.. raw:: html

   <details>
     <summary>显示原文</summary>

One Buffer
~~~~~~~~~~

If only one buffer is used, LVGL draws the content of the screen into
that draw buffer and sends it to the display via the :ref:`flush_callback`. LVGL
then waits until :cpp:func:`lv_display_flush_ready` is called
(that is, the content of the buffer has been sent to the
display) before drawing something new into it.

.. raw:: html

   </details>
   <br>

一个缓冲区
~~~~~~~~~~

如果只使用一个缓冲区，LVGL 会将屏幕内容绘制到该绘图缓冲区，并通过 :ref:`flush_callback` 将其发送到显示器。
然后，LVGL 会等待直到调用 :cpp:func:`lv_display_flush_ready`（即缓冲区内容已发送到显示器）后，再向该缓冲区绘制新的内容。

.. raw:: html

   <details>
     <summary>显示原文</summary>

Two Buffers
~~~~~~~~~~~

If two buffers are used LVGL can draw into one buffer while the content
of the other buffer is sent to the display in the background.  DMA or
other hardware should be used to transfer data to the display so the MCU
can continue drawing.  Doing so allows *rendering* and *refreshing* the
display to become parallel operations.

.. raw:: html

   </details>
   <br>

两个缓冲区
~~~~~~~~~~~

如果使用两个缓冲区，LVGL 可以在一个缓冲区绘制内容，同时将另一个缓冲区的内容在后台发送到显示器。
应使用 DMA 或其他硬件将数据传输到显示器，这样 MCU 就可以继续绘制。这样做使得 *渲染* 和 *刷新* 显示器成为并行操作。

.. _flush_callback:

.. raw:: html

   <details>
     <summary>显示原文</summary>

Flush Callback
--------------

Draw buffer(s) are simple array(s) that LVGL uses to render the display's
content.  Once rendering is has been completed, the content of the draw buffer is
sent to the display using a Flush Callback function.

An example looks like this:

.. code-block:: c

    void my_flush_cb(lv_display_t * display, const lv_area_t * area, uint8_t * px_map)
    {
        /* The most simple case (also the slowest) to send all rendered pixels to the
         * screen one-by-one.  `put_px` is just an example.  It needs to be implemented by you. */
        uint16_t * buf16 = (uint16_t *)px_map; /* Let's say it's a 16 bit (RGB565) display */
        int32_t x, y;
        for(y = area->y1; y <= area->y2; y++) {
            for(x = area->x1; x <= area->x2; x++) {
                put_px(x, y, *buf16);
                buf16++;
            }
        }

        /* IMPORTANT!!!
         * Inform LVGL that flushing is complete so buffer can be modified again. */
        lv_display_flush_ready(disp);
    }

During system initialization, tell LVGL you want that function to copy pixels from
rendered pixel-buffers to a particular display by doing the following:

.. code-block:: c

    lv_display_set_flush_cb(display1, my_flush_cb)

Note that which display is targeted is passed to the function, so you can use the
same function for multiple displays, or use different functions for multiple
displays.  It's up to you.

.. note::

    :cpp:expr:`lv_display_flush_ready(display1)` needs to be called when flushing is
    complete to inform LVGL that the buffer is available again to render new content
    into it.

LVGL might render the screen in multiple chunks and therefore call your Flush
Callback multiple times.  To see whether the current call is for the last chunk being
rendered, use :cpp:expr:`lv_display_flush_is_last(display1)`.

.. raw:: html

   </details>
   <br>

Flush Callback
--------------

绘图缓冲区（Draw buffer(s)）是 LVGL 用于渲染显示内容的简单数组。渲染完成后，绘图缓冲区的内容会通过 Flush Callback 函数发送到显示屏。

示例如下：

.. code-block:: c

    void my_flush_cb(lv_display_t * display, const lv_area_t * area, uint8_t * px_map)
    {
        /* 最简单的情况（也是最慢的），将所有渲染的像素逐一发送到屏幕。
         * `put_px` 只是一个示例，需要由用户自行实现。*/
        uint16_t * buf16 = (uint16_t *)px_map; /* 假设这是一个 16 位 (RGB565) 的显示屏 */
        int32_t x, y;
        for(y = area->y1; y <= area->y2; y++) {
            for(x = area->x1; x <= area->x2; x++) {
                put_px(x, y, *buf16);
                buf16++;
            }
        }

        /* 重要！！！
         * 通知 LVGL 刷新已完成，这样缓冲区可以再次被修改。*/
        lv_display_flush_ready(disp);
    }

在系统初始化期间，通过以下方式告知 LVGL 使用该函数将渲染的像素从像素缓冲区复制到特定显示屏：

.. code-block:: c

    lv_display_set_flush_cb(display1, my_flush_cb)

注意，目标显示屏会作为参数传递给该函数，因此您可以使用相同的函数处理多个显示屏，也可以为多个显示屏使用不同的函数，选择权在于您。

.. note::

    :cpp:expr:`lv_display_flush_ready(display1)` 在刷新完成时需要被调用，以通知 LVGL 缓冲区可以再次用于渲染新内容。

LVGL 可能会将屏幕分成多个块进行渲染，因此可能多次调用您的 Flush Callback。要判断当前调用是否是最后一个渲染块，可使用 :cpp:expr:`lv_display_flush_is_last(display1)`。


Advanced Options
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Resolution
----------

To set the resolution of the display after creation use
:cpp:expr:`lv_display_set_resolution(display, hor_res, ver_res)`

It's not mandatory to use the whole display for LVGL, however in some
cases the physical resolution is important. For example the touchpad
still sees the whole resolution and the values needs to be converted to
the active LVGL display area. So the physical resolution and the offset
of the active area can be set with
:cpp:expr:`lv_display_set_physical_resolution(disp, hor_res, ver_res)` and
:cpp:expr:`lv_display_set_offset(disp, x, y)`

.. raw:: html

   </details>
   <br>

分辨率  
----------  

要在创建显示器后设置其分辨率，可以使用  
:cpp:expr:`lv_display_set_resolution(display, hor_res, ver_res)`  

并非必须为LVGL使用整个显示器，但在某些情况下，物理分辨率仍然非常重要。
例如，触摸板仍会检测到整个分辨率，其值需要转换为活动的LVGL显示区域。
因此，可以通过以下方式设置物理分辨率和活动区域的偏移量：  
:cpp:expr:`lv_display_set_physical_resolution(disp, hor_res, ver_res)` 和  
:cpp:expr:`lv_display_set_offset(disp, x, y)`  

.. raw:: html

   <details>
     <summary>显示原文</summary>

Flush-Wait Callback
-------------------

By using :cpp:func:`lv_display_flush_ready` LVGL will spin in a loop
while waiting for flushing.

However with the help of :cpp:func:`lv_display_set_flush_wait_cb` a custom
wait callback be set for flushing. This callback can use a semaphore, mutex,
or anything else to optimize waiting for the flush to be completed.

If a Flush-Wait Callback is not set, LVGL assumes that
:cpp:func:`lv_display_flush_ready` is used.

.. raw:: html

   </details>
   <br>

刷新等待回调  
-------------------  

通过使用 :cpp:func:`lv_display_flush_ready`，LVGL会在等待刷新时循环运行。  

然而，借助 :cpp:func:`lv_display_set_flush_wait_cb`，可以为刷新设置一个自定义的等待回调。
此回调可以使用信号量、互斥锁或其他任何机制来优化刷新完成的等待过程。  

如果未设置刷新等待回调，LVGL将默认假定使用 :cpp:func:`lv_display_flush_ready`。  


.. raw:: html

   <details>
     <summary>显示原文</summary>

Rotation
--------

LVGL supports rotation of the display in 90 degree increments. You can
select whether you would like software rotation or hardware rotation.

The orientation of the display can be changed with
``lv_display_set_rotation(disp, LV_DISPLAY_ROTATION_0/90/180/270)``.
LVGL will swap the horizontal and vertical resolutions internally
according to the set degree. When changing the rotation
:cpp:enumerator:`LV_EVENT_SIZE_CHANGED` event is emitted (for any part of your system
that has "subscribed" to this event) to allow reconfiguring of the hardware.
In lack of hardware display rotation support
:cpp:func:`lv_draw_sw_rotate` can be used to rotate the buffer in the
:ref:`flush_callback`.

:cpp:expr:`lv_display_rotate_area(display, &area)` rotates the rendered area
according to the current rotation settings of the display.

Note that in :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_DIRECT` the small changed areas
are rendered directly in the frame buffer so they cannot be
rotated later. Therefore in direct mode only the whole frame buffer can be rotated.
The same is true for :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_FULL`.

In the case of :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_PARTIAL` the small rendered areas
can be rotated on their own before flushing to the frame buffer.

.. raw:: html

   </details>
   <br>

旋转  
--------  

LVGL支持以90度为增量旋转显示器。您可以选择使用软件旋转或硬件旋转。  

显示器的方向可以通过  
``lv_display_set_rotation(disp, LV_DISPLAY_ROTATION_0/90/180/270)``  
进行更改。LVGL会根据设置的角度在内部交换水平和垂直分辨率。当更改旋转时，会触发  
:cpp:enumerator:`LV_EVENT_SIZE_CHANGED`  
事件（对于系统中“订阅”该事件的任何部分），以便重新配置硬件。  

如果硬件显示器不支持旋转，  
:cpp:func:`lv_draw_sw_rotate`  
可以用于在 :ref:`flush_callback` 中旋转缓冲区。  

:cpp:expr:`lv_display_rotate_area(display, &area)`  
会根据显示器当前的旋转设置旋转渲染区域。  

请注意，在 :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_DIRECT` 模式下，微小的变更区域会直接在帧缓冲区中渲染，因此无法在之后进行旋转。
因此，在直接模式下只能旋转整个帧缓冲区。对于 :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_FULL` 模式也是如此。  

在 :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_PARTIAL` 模式下，微小的渲染区域可以在刷新到帧缓冲区之前单独进行旋转。  


.. raw:: html

   <details>
     <summary>显示原文</summary>

Color Format
------------

The default color format of the display is set according to :c:macro:`LV_COLOR_DEPTH`
(see ``lv_conf.h``)

- :c:macro:`LV_COLOR_DEPTH` ``32``: XRGB8888 (4 bytes/pixel)
- :c:macro:`LV_COLOR_DEPTH` ``24``: RGB888 (3 bytes/pixel)
- :c:macro:`LV_COLOR_DEPTH` ``16``: RGB565 (2 bytes/pixel)
- :c:macro:`LV_COLOR_DEPTH` ``8``: L8 (1 bytes/pixel)
- :c:macro:`LV_COLOR_DEPTH` ``1``: I1 (1 bit/pixel) Only support for horizontal mapped buffers. See :ref:`monochrome` for more details:

The ``color_format`` can be changed with
:cpp:expr:`lv_display_set_color_depth(display, LV_COLOR_FORMAT_...)`.
Besides the default value :c:macro:`LV_COLOR_FORMAT_ARGB8888` can be
used as a well.

It's very important that draw buffer(s) should be large enough for the
selected color format.

.. raw:: html

   </details>
   <br>

颜色格式  
------------  

显示器的默认颜色格式是根据 :c:macro:`LV_COLOR_DEPTH` 设置的（参见 ``lv_conf.h``）。  

- :c:macro:`LV_COLOR_DEPTH` ``32``: XRGB8888（每像素4字节）  
- :c:macro:`LV_COLOR_DEPTH` ``24``: RGB888（每像素3字节）  
- :c:macro:`LV_COLOR_DEPTH` ``16``: RGB565（每像素2字节）  
- :c:macro:`LV_COLOR_DEPTH` ``8``: L8（每像素1字节）  
- :c:macro:`LV_COLOR_DEPTH` ``1``: I1（每像素1位）。仅支持水平映射缓冲区。更多详情参见 :ref:`monochrome`。  

``color_format`` 可以通过  
:cpp:expr:`lv_display_set_color_depth(display, LV_COLOR_FORMAT_...)`  
进行更改。除了默认值，还可以使用 :c:macro:`LV_COLOR_FORMAT_ARGB8888`。  

需要特别注意的是，绘图缓冲区的大小应足够容纳所选的颜色格式。  

.. raw:: html

   <details>
     <summary>显示原文</summary>

Swapping Endian-ness
--------------------

In case of RGB565 color format it might be required to swap the 2 bytes
because the SPI, I2C or 8 bit parallel port periphery sends them in the wrong order.

The ideal solution is configure the hardware to handle the 16 bit data with different byte order,
however if this is not possible :cpp:expr:`lv_draw_sw_rgb565_swap(buf, buf_size_in_px)`
can be called in the :ref:`flush_callback` to swap the bytes.

If you wish you can also write your own function, or use assembly instructions for
the fastest possible byte swapping.

Note that this is not about swapping the Red and Blue channel but converting

``RRRRR GGG | GGG BBBBB``

to

``GGG BBBBB | RRRRR GGG``.

.. raw:: html

   </details>
   <br>

交换字节序  
--------------------

在使用RGB565颜色格式的情况下，可能需要交换2个字节的位置，因为SPI、I2C或8位并行端口外围设备可能会以错误的顺序发送它们。  

理想的解决方案是配置硬件以处理具有不同字节顺序的16位数据。然而，如果无法实现这一点，可以在 :ref:`flush_callback` 中调用  
:cpp:expr:`lv_draw_sw_rgb565_swap(buf, buf_size_in_px)`  
来交换字节。  

如果需要，也可以编写自己的函数，或者使用汇编指令以实现最快速的字节交换。  

请注意，这不是关于交换红色和蓝色通道，而是将以下格式转换：  

``RRRRR GGG | GGG BBBBB``  

为  

``GGG BBBBB | RRRRR GGG``。  

.. _monochrome:

.. raw:: html

   <details>
     <summary>显示原文</summary>

Monochrome Displays
-------------------

LVGL supports rendering directly in a 1-bit format for monochrome displays.
To enable it, set ``LV_COLOR_DEPTH 1`` or use :cpp:expr:`lv_display_set_color_format(display, LV_COLOR_FORMAT_I1)`.

The :cpp:expr:`LV_COLOR_FORMAT_I1` format assumes that bytes are mapped to rows (i.e., the bits of a byte are written next to each other).
The order of bits is MSB first, which means:

.. code-block::

             MSB           LSB
   bits       7 6 5 4 3 2 1 0

are represented on the display as:

.. code-block::

   pixels     0 1 2 3 4 5 6 7
             Left         Right

Ensure that the LCD controller is configured accordingly.

Internally, LVGL rounds the redrawn areas to byte boundaries. Therefore, updated areas will:

- start on an ``Nx8`` coordinate, and
- end on an ``Nx8 - 1`` coordinate.

When setting up the buffers for rendering (:cpp:func:`lv_display_set_buffers`), make the buffer 8 bytes larger.
This is necessary because LVGL reserves 2 x 4 bytes in the buffer, as these are assumed to be used as a palette.

To skip the palette, include the following line in your :ref:`flush_callback` function: ``px_map += 8``.

As usual, monochrome displays support partial, full, and direct rendering modes as well.
In full and direct modes, the buffer size should be large enough for the whole screen,
meaning ``(horizontal_resolution x vertical_resolution / 8) + 8`` bytes.
As LVGL can not handle fractional width make sure to round the horizontal resolution
to 8 bits (for example 90 to 96).

The :cpp:func:`lv_draw_sw_i1_convert_to_vtiled` function is used to convert a draw
buffer in I1 color format from a row-wise (htiled) to a column-wise (vtiled) buffer
layout.  This conversion is necessary for certain display controllers that require a
different draw buffer mapping.  The function assumes that the buffer width and height
are rounded to a multiple of 8.  The bit order of the resulting vtiled buffer can be
specified using the `bit_order_lsb` parameter.

For more details, refer to the implementation in
:cpp:func:`lv_draw_sw_i1_convert_to_vtiled` in :file:`src/draw/sw/lv_draw_sw.c`.

To ensure that the redrawn areas start and end on byte boundaries, you can add a
rounder callback to your display driver.  This callback will round the width and
height to the nearest multiple of 8.

Here is an example of how to implement and set a rounder callback:

.. code:: c

    static void my_rounder_cb(lv_event_t *e)
    {
        lv_area_t *area = lv_event_get_param(e);

        /* Round the height to the nearest multiple of 8 */
        area->y1 = (area->y1 & ~0x7);
        area->y2 = (area->y2 | 0x7);
    }

    lv_display_add_event_cb(display, my_rounder_cb, LV_EVENT_INVALIDATE_AREA, display);

In this example, the `my_rounder_cb` function rounds the coordinates of the redrawn
area to the nearest multiple of 8. The `x1` and `y1` coordinates are rounded down,
while the `x2` and `y2` coordinates are rounded up. This ensures that the width and
height of the redrawn area are always multiples of 8.

.. raw:: html

   </details>
   <br>

单色显示器  
-------------------

LVGL支持以1位格式直接渲染到单色显示器。要启用此功能，可以设置 ``LV_COLOR_DEPTH 1`` 或使用  
:cpp:expr:`lv_display_set_color_format(display, LV_COLOR_FORMAT_I1)`。

:cpp:expr:`LV_COLOR_FORMAT_I1` 格式假定字节被映射到行（即，一个字节的位被彼此相邻地写入）。位的顺序为MSB优先，这意味着：

.. code-block::

             MSB           LSB  
   bits       7 6 5 4 3 2 1 0  

在显示器上显示为：  

.. code-block::  

   pixels     0 1 2 3 4 5 6 7  
             左           右  

请确保LCD控制器已按此配置。

在内部，LVGL会将重绘区域对齐到字节边界。因此，更新的区域将：  

- 从 ``Nx8`` 坐标开始，  
- 并在 ``Nx8 - 1`` 坐标结束。  

在设置渲染缓冲区时（:cpp:func:`lv_display_set_buffers`），请将缓冲区大小增加8字节。这是必要的，因为LVGL在缓冲区中保留了2 x 4字节，假定它们将用作调色板。  

要跳过调色板，可以在 :ref:`flush_callback` 函数中包含以下行：  
``px_map += 8``。  

与往常一样，单色显示器支持部分、完整和直接渲染模式。  
在完整和直接模式下，缓冲区的大小应足以容纳整个屏幕，即 ``(horizontal_resolution x vertical_resolution / 8) + 8`` 字节。由于LVGL无法处理小数宽度，请确保将水平分辨率四舍五入为8的倍数（例如，从90调整为96）。  

:cpp:func:`lv_draw_sw_i1_convert_to_vtiled` 函数用于将I1颜色格式的绘图缓冲区从按行排列（htiled）转换为按列排列（vtiled）的缓冲区布局。此转换对于某些需要不同绘图缓冲区映射的显示控制器是必要的。此函数假定缓冲区宽度和高度均为8的倍数。可以使用 `bit_order_lsb` 参数指定生成的vtiled缓冲区的位顺序。  

更多详情，请参见 :cpp:func:`lv_draw_sw_i1_convert_to_vtiled` 在 :file:`src/draw/sw/lv_draw_sw.c` 中的实现。

为了确保重绘区域从字节边界开始和结束，可以向显示驱动程序添加一个回调函数，用于将宽度和高度四舍五入为8的倍数。

以下是实现和设置回调函数的示例：

.. code:: c  

    static void my_rounder_cb(lv_event_t *e)  
    {  
        lv_area_t *area = lv_event_get_param(e);  

        /* 将高度四舍五入为8的倍数 */  
        area->y1 = (area->y1 & ~0x7);  
        area->y2 = (area->y2 | 0x7);  
    }  

    lv_display_add_event_cb(display, my_rounder_cb, LV_EVENT_INVALIDATE_AREA, display);  

在此示例中，`my_rounder_cb` 函数将重绘区域的坐标四舍五入为8的倍数。 `x1` 和 `y1` 坐标向下取整，而 `x2` 和 `y2` 坐标向上取整。这确保了重绘区域的宽度和高度始终是8的倍数。  

.. raw:: html

   <details>
     <summary>显示原文</summary>

Constraints on Redrawn Area
---------------------------

Some display controllers have specific requirements for the window area where the rendered image can be sent
(e.g., `x1` must be even, and `x2` must be odd).

In the case of monochrome displays, `x1` must be `Nx8`, and `x2` must be `Nx8 - 1`.
(If the display uses `LV_COLOR_FORMAT_I1`, LVGL automatically applies this rounding. See :ref:`monochrome`.)

The size of the invalidated (redrawn) area can be controlled as follows:

.. code-block:: c

    void rounder_event_cb(lv_event_t * e)
    {
        lv_area_t * a = lv_event_get_invalidated_area(e);

        a->x1 = a->x1 & (~0x1); /* Ensure x1 is even */
        a->x2 = a->x2 | 0x1;    /* Ensure x2 is odd */
    }

    ...

    lv_display_add_event_cb(disp, rounder_event_cb, LV_EVENT_INVALIDATE_AREA, NULL);

.. raw:: html

   </details>
   <br>

重绘区域的约束  
---------------------------

某些显示控制器对发送渲染图像的窗口区域有特定要求（例如， `x1` 必须是偶数，而 `x2` 必须是奇数）。  

对于单色显示器， `x1` 必须为 `Nx8`， `x2` 必须为 `Nx8 - 1`。（如果显示器使用 `LV_COLOR_FORMAT_I1`，LVGL会自动应用此舍入规则。参见 :ref:`monochrome`。）  

可以通过以下方式控制无效化（重绘）区域的大小：  

.. code-block:: c  

    void rounder_event_cb(lv_event_t * e)  
    {  
        lv_area_t * a = lv_event_get_invalidated_area(e);  

        a->x1 = a->x1 & (~0x1); /* 确保 x1 是偶数 */  
        a->x2 = a->x2 | 0x1;    /* 确保 x2 是奇数 */  
    }  

    ...  

    lv_display_add_event_cb(disp, rounder_event_cb, LV_EVENT_INVALIDATE_AREA, NULL);  

.. raw:: html

   <details>
     <summary>显示原文</summary>

Tiled Rendering
---------------

When multiple CPU cores are available and a large area needs to be redrawn, LVGL must identify independent areas that can be rendered in parallel.

For example, if there are 4 CPU cores, one core can draw the screen's background while the other 3 must wait until it is finished. If there are 2 buttons on the screen, those 2 buttons can be rendered in parallel, but 2 cores will still remain idle.

Due to dependencies among different areas, CPU cores cannot always be fully utilized.

To address this, LVGL can divide large areas that need to be updated into smaller tiles. These tiles are independent, making it easier to find areas that can be rendered concurrently.

Specifically, if there are 4 tiles and 4 cores, there will always be an independent area for each core within one of the tiles.

The maximum number of tiles can be set using the function :cpp:expr:`lv_display_set_tile_cnt(disp, cnt)`. The default value is :cpp:expr:`LV_DRAW_SW_DRAW_UNIT_CNT` (or 1 if software rendering is not enabled).

Small areas are not further divided into smaller tiles because the overhead of spinning up 4 cores would outweigh the benefits.

The ideal tile size is calculated as ``ideal_tile_size = draw_buf_size / tile_cnt``. For example, in :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_DIRECT` mode on an 800x480 screen, the display buffer is 800x480 = 375k pixels. If there are 4 tiles, the ideal tile size is approximately 93k pixels. Based on this, core utilization is as follows:

- 30k pixels: 1 core
- 90k pixels: 1 core
- 95k pixels: 2 cores (above 93k pixels, 2 cores are used)
- 150k pixels: 2 cores
- 200k pixels: 3 cores (above 186k pixels, 3 cores are used)
- 300k pixels: 4 cores (above 279k pixels, 4 cores are used)
- 375k pixels: 4 cores

In :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_DIRECT`, the screen-sized draw buffer is divided by the tile count to determine the ideal tile sizes. If smaller areas are refreshed, it may result in fewer cores being used.

In :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_FULL`, the maximum number of tiles is always created when the entire screen is refreshed.

In :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_PARTIAL`, the partial buffer is divided into tiles. For example, if the draw buffer is 1/10th the size of the screen and there are 2 tiles, then 1/20th + 1/20th of the screen area will be rendered at once.

Tiled rendering only affects the rendering process, and the :ref:`flush_callback` is called once for each invalidated area. Therefore, tiling is not visible from the flushing point of view.

.. raw:: html

   </details>
   <br>

分块渲染
---------------

当多个CPU核心可用且需要重绘大区域时，LVGL必须识别出可以并行渲染的独立区域。  

例如，如果有4个CPU核心，一个核心可以绘制屏幕的背景，而其他3个核心必须等待背景绘制完成。如果屏幕上有2个按钮，则这两个按钮可以并行渲染，但仍会有两个核心处于空闲状态。  

由于不同区域之间可能存在依赖关系，CPU核心无法始终得到完全利用。  

为了解决这一问题，LVGL可以将需要更新的大区域划分为更小的**块（tiles）**。这些块是独立的，从而更容易找到可以并行渲染的区域。  

具体来说，如果有4个块和4个核心，那么每个核心在这些块中总能找到一个独立的区域进行渲染。  

可以使用 :cpp:expr:`lv_display_set_tile_cnt(disp, cnt)` 设置块的最大数量。默认值为 :cpp:expr:`LV_DRAW_SW_DRAW_UNIT_CNT`（如果未启用软件渲染，则默认为1）。  

小区域不会进一步划分为更小的块，因为启动4个核心的开销会超过划分的收益。  

理想的块大小由以下公式计算：``ideal_tile_size = draw_buf_size / tile_cnt``。例如，在 :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_DIRECT` 模式下，对于800x480的屏幕，显示缓冲区为800x480 = 375k像素。如果有4个块，则理想的块大小约为93k像素。基于此，核心的利用情况如下：  

- 30k像素：1个核心  
- 90k像素：1个核心  
- 95k像素：2个核心（超过93k像素时，启用2个核心）  
- 150k像素：2个核心  
- 200k像素：3个核心（超过186k像素时，启用3个核心）  
- 300k像素：4个核心（超过279k像素时，启用4个核心）  
- 375k像素：4个核心  

在 :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_DIRECT` 模式中，屏幕大小的绘图缓冲区按照块数量划分以确定理想的块大小。如果刷新较小的区域，可能会导致使用的核心数量减少。  

在 :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_FULL` 模式中，当整个屏幕刷新时，始终会创建最大数量的块。  

在 :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_PARTIAL` 模式中，部分缓冲区会被划分为块。例如，如果绘图缓冲区为屏幕大小的1/10且有2个块，那么屏幕区域的1/20 + 1/20会同时渲染。  

分块渲染仅影响渲染过程，而 :ref:`flush_callback` 每次仅针对无效化的区域调用一次。因此，从刷新回调的角度看，分块渲染是不可见的。  

.. raw:: html

   <details>
     <summary>显示原文</summary>

Decoupling the Display Refresh Timer
------------------------------------

Normally the dirty (a.k.a invalid) areas are checked and redrawn in
every :c:macro:`LV_DEF_REFR_PERIOD` milliseconds (set in ``lv_conf.h``).
However, in some cases you might need more control on when the display
refreshing happen, for example to synchronize rendering with VSYNC or
the TE signal.

You can do this in the following way:

.. code-block:: c

   /* Delete original display refresh timer */
   lv_display_delete_refr_timer(display1);

   /* Call this to refresh dirty (changed) areas of the display. */
   _lv_display_refr_timer(NULL);

If you have multiple displays call :cpp:expr:`lv_display_set_default(display1)` to
select the display to refresh before :cpp:expr:`_lv_display_refr_timer(NULL)`.


.. note:: :cpp:func:`lv_timer_handler` and :cpp:func:`_lv_display_refr_timer` must not run at the same time.


If the performance monitor is enabled, the value of :c:macro:`LV_DEF_REFR_PERIOD` needs to be set to be
consistent with the refresh period of the display to ensure that the statistical results are correct.

.. raw:: html

   </details>
   <br>

解耦显示刷新定时器
------------------------------------  

通常情况下，脏区域（即无效区域）会在每个 :c:macro:`LV_DEF_REFR_PERIOD` 毫秒（在 ``lv_conf.h`` 中设置）内被检查并重绘。  
然而，在某些情况下，您可能需要对显示刷新时间进行更多控制，例如与VSYNC或TE信号同步渲染。  

您可以通过以下方式实现：  

.. code-block:: c  

   /* 删除原始显示刷新定时器 */  
   lv_display_delete_refr_timer(display1);  

   /* 调用此函数以刷新显示的脏（已更改）区域。 */  
   _lv_display_refr_timer(NULL);  

如果您有多个显示器，可以在调用 :cpp:expr:`_lv_display_refr_timer(NULL)` 之前，通过 :cpp:expr:`lv_display_set_default(display1)` 来选择需要刷新的显示器。  

.. note::  
   :cpp:func:`lv_timer_handler` 和 :cpp:func:`_lv_display_refr_timer` 不可同时运行。  

如果启用了性能监控，则需要将 :c:macro:`LV_DEF_REFR_PERIOD` 的值设置为与显示器的刷新周期一致，以确保统计结果的正确性。  

.. raw:: html

   <details>
     <summary>显示原文</summary>

Force Refreshing
----------------

Normally the invalidated areas (marked for redrawing) are rendered in
:cpp:func:`lv_timer_handler` in every :c:macro:`LV_DEF_REFR_PERIOD` milliseconds.
However, by using :cpp:expr:`lv_refr_now(display)` you can ask LVGL to redraw the
invalid areas immediately. The refreshing will happen in :cpp:func:`lv_refr_now`
which might take longer.

The parameter of :cpp:func:`lv_refr_now` is a display to refresh.  If ``NULL`` is set
the :ref:`default_display` will be updated.

.. raw:: html

   </details>
   <br>

强制刷新
----------------

通常情况下，无效区域（标记为需要重绘的区域）会在每个 :c:macro:`LV_DEF_REFR_PERIOD` 毫秒内，通过 :cpp:func:`lv_timer_handler` 进行渲染。  
然而，通过使用 :cpp:expr:`lv_refr_now(display)`，您可以让LVGL立即重绘无效区域。刷新将在 :cpp:func:`lv_refr_now` 中执行，这可能会耗时更长。  

:cpp:func:`lv_refr_now` 的参数是需要刷新的显示器。如果设置为 ``NULL``，将更新 :ref:`default_display`。  


.. raw:: html

   <details>
     <summary>显示原文</summary>

Mirroring a Display
-------------------

To mirror the image of a display to another display, you don't need to use
multi-display support. Just transfer the buffer received in the first display's
:ref:`flush_callback` to the other display as well.

.. raw:: html

   </details>
   <br>

显示镜像
-------------------

要将一个显示器的图像镜像到另一个显示器，无需使用多显示器支持功能。
只需将第一个显示器的 :ref:`flush_callback` 接收到的缓冲区传输到另一个显示器即可。  

.. raw:: html

   <details>
     <summary>显示原文</summary>

Split Image
-----------

You can create a larger virtual display from an array of smaller ones.
You can create it by:

1. setting the resolution of the displays to the large display's resolution;
2. in :ref:`flush_callback`, truncate and modify the ``area`` parameter for each display; and
3. send the buffer's content to each real display with the truncated area.

.. raw:: html

   </details>
   <br>

拆分图像  
-----------

您可以通过一组较小的显示器创建一个更大的虚拟显示器。可以通过以下步骤实现：  

1. 将显示器的分辨率设置为大显示器的分辨率；  
2. 在 :ref:`flush_callback` 中，对每个显示器截取并修改 ``area`` 参数；  
3. 使用截取的区域将缓冲区的内容发送到每个实际的显示器。  

.. _display_user_data:

.. raw:: html

   <details>
     <summary>显示原文</summary>

User Data
---------

With :cpp:expr:`lv_display_set_user_data(display1, p)` a custom pointer can be stored
with ``lv_display_t`` object.  This pointer can be used later, e.g. in
:ref:`display_events`.

.. raw:: html

   </details>
   <br>

用户数据  
---------

通过 :cpp:expr:`lv_display_set_user_data(display1, p)`，可以将自定义指针存储到 ``lv_display_t`` 对象中。
此指针可以在以后使用，例如在 :ref:`display_events` 中。  

.. _display_inactivity:

.. raw:: html

   <details>
     <summary>显示原文</summary>

Inactivity Measurement
----------------------

A user's inactivity time is measured and stored with each ``lv_display_t`` object.
Every use of an :ref:`Input Device <indev>` (if :ref:`associated with the display
<indev_other_features>`) counts as an activity.  To get time elapsed since the last
activity, use :cpp:expr:`lv_display_get_inactive_time(display1)`.  If ``NULL`` is
passed, the lowest inactivity time among all displays will be returned (in this case
NULL does *not* mean the :ref:`default_display`).

You can manually trigger an activity using
:cpp:expr:`lv_display_trigger_activity(display1)`.  If ``display1`` is ``NULL``, the
:ref:`default_display` will be used (**not all displays**).

.. raw:: html

   </details>
   <br>

不活动时间测量
----------------------

每个 ``lv_display_t`` 对象都会记录用户的不活动时间。  
每次使用 :ref:`输入设备 <indev>`（如果 :ref:`与显示器相关联 <indev_other_features>`）都会被视为一次活动。  
要获取自上次活动以来的时间，可以使用 :cpp:expr:`lv_display_get_inactive_time(display1)`。  
如果传入 ``NULL``，将返回所有显示器中最短的不活动时间（在这种情况下， ``NULL`` 并不表示 :ref:`default_display`）。  

您可以通过 :cpp:expr:`lv_display_trigger_activity(display1)` 手动触发一次活动。
如果 ``display1`` 是 ``NULL``，将使用 :ref:`default_display`（ **而不是所有显示器** ）。  


.. admonition::  Further Reading

.. raw:: html

   <details>
     <summary>显示原文</summary>

    -  `lv_port_disp_template.c <https://github.com/lvgl/lvgl/blob/master/examples/porting/lv_port_disp_template.c>`__
       for a template for your own driver.
    -  :ref:`Drawing <draw>` to learn more about how rendering works in LVGL.

.. raw:: html

   </details>
   <br>

-  `lv_port_disp_template.c <https://github.com/lvgl/lvgl/blob/master/examples/porting/lv_port_disp_template.c>`__  
   提供一个用于自定义驱动程序的模板。  
-  :ref:`Drawing <draw>` 了解有关LVGL中渲染工作原理的更多信息。  

API
***
