.. _display_interface:

============================
Display interface（显示接口）
============================

.. raw:: html

   <details>
     <summary>显示原文</summary>

To create a display for LVGL call
:cpp:expr:`lv_display_t * display = lv_display_create(hor_res, ver_res)`. You can create
a multiple displays and a different driver for each (see below),

.. raw:: html

   </details>
   <br>


要为 LVGL 创建显示器，请调用 :cpp:expr:`lv_display_t * display = lv_display_create(hor_res, ver_res)`。您可以创建多个显示器，并为每个显示器使用不同的驱动程序（见下文），


Basic setup（基本设置）
**********************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Draw buffer(s) are simple array(s) that LVGL uses to render the screen's
content. Once rendering is ready the content of the draw buffer is sent
to the display using the ``flush_cb`` function.

.. raw:: html

   </details>
   <br>


绘制缓冲区是 LVGL 用来渲染屏幕内容的简单数组。渲染准备就绪后，绘制缓冲区的内容将通过 ``flush_cb`` 函数发送到显示器。


flush_cb
--------

.. raw:: html

   <details>
     <summary>显示原文</summary>

An example ``flush_cb`` looks like this:

.. code:: c

   void my_flush_cb(lv_display_t * display, const lv_area_t * area, void * px_map)
   {
       /*The most simple case (but also the slowest) to put all pixels to the screen one-by-one
        *`put_px` is just an example, it needs to be implemented by you.*/
       uint16_t * buf16 = (uint16_t *)px_map; /*Let's say it's a 16 bit (RGB565) display*/
       int32_t x, y;
       for(y = area->y1; y <= area->y2; y++) {
           for(x = area->x1; x <= area->x2; x++) {
               put_px(x, y, *buf16);
               buf16++;
           }
       }

       /* IMPORTANT!!!
        * Inform LVGL that you are ready with the flushing and buf is not used anymore*/
       lv_display_flush_ready(disp);
   }

Use :cpp:expr:`lv_display_set_flush_cb(disp, my_flush_cb)` to set a new ``flush_cb``.

:cpp:expr:`lv_display_flush_ready(disp)` needs to be called when flushing is ready
to inform LVGL the buffer is not used anymore by the driver and it can
render new content into it.

LVGL might render the screen in multiple chunks and therefore call
``flush_cb`` multiple times. To see if the current one is the last chunk
of rendering use :cpp:expr:`lv_display_flush_is_last(display)`.

.. raw:: html

   </details>
   <br>


示例 ``flush_cb`` 如下所示：

.. code:: c

   void my_flush_cb(lv_display_t * display, const lv_area_t * area, void * px_map)
   {
       /*The most simple case (but also the slowest) to put all pixels to the screen one-by-one
        *`put_px` is just an example, it needs to be implemented by you.*/
       uint16_t * buf16 = (uint16_t *)px_map; /*Let's say it's a 16 bit (RGB565) display*/
       int32_t x, y;
       for(y = area->y1; y <= area->y2; y++) {
           for(x = area->x1; x <= area->x2; x++) {
               put_px(x, y, *buf16);
               buf16++;
           }
       }

       /* IMPORTANT!!!
        * Inform LVGL that you are ready with the flushing and buf is not used anymore*/
       lv_display_flush_ready(disp);
   }

使用 :cpp:expr:`lv_display_set_flush_cb(disp, my_flush_cb)` 设置新的 ``flush_cb``。

当刷新准备好时，需要调用:cpp:expr:`lv_display_flush_ready(disp)` 来通知 LVGL 驱动程序不再使用缓冲区，并且它可以在其中渲染新的内容。

LVGL 可能会分多个块来渲染屏幕，因此会多次调用 ``flush_cb``。查看当前块是否是渲染的最后一个块，可以使用 :cpp:expr:`lv_display_flush_is_last(display)`。


Draw buffers（绘制缓冲区）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The draw buffers can be set with :cpp:expr:`lv_display_set_buffers(display, buf1, buf2, buf_size_byte, render_mode)`

-  ``buf1`` a buffer where LVGL can render
-  ``buf2`` a second optional buffer (see more details below)
-  ``buf_size_byte`` size of the buffer(s) in bytes
-  ``render_mode``

   -  :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_PARTIAL` Use the buffer(s) to render the
      screen in smaller parts. This way the buffers can be smaller then
      the display to save RAM. At least 1/10 screen size buffer(s) are
      recommended. In ``flush_cb`` the rendered images needs to be
      copied to the given area of the display. In this mode if a button is pressed
      only the button's area will be redrawn.
   -  :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_DIRECT` The buffer(s) has to be screen
      sized and LVGL will render into the correct location of the
      buffer. This way the buffer always contain the whole image. If two
      buffer are used the rendered areas are automatically copied to the
      other buffer after flushing. Due to this in ``flush_cb`` typically
      only a frame buffer address needs to be changed. If a button is pressed
      only the button's area will be redrawn.
   -  :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_FULL` The buffer(s) has to be screen
      sized and LVGL will always redraw the whole screen even if only 1
      pixel has been changed. If two screen sized draw buffers are
      provided, LVGL's display handling works like "traditional" double
      buffering. This means the ``flush_cb`` callback only has to update
      the address of the frame buffer to the ``px_map`` parameter.

Example:

.. raw:: html

   </details>
   <br>


绘制缓冲区可以用 :cpp:expr:`lv_display_set_buffers(display, buf1, buf2, buf_size_byte, render_mode)`进行设置

-  ``buf1`` LVGL 可以渲染的缓冲区
-  ``buf2`` 第二个可选缓冲区（请参阅下面的更多详细信息）
-  ``buf_size_byte`` 缓冲区的大小（以字节为单位）
-  ``render_mode``

-  :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_PARTIAL` 使用缓冲区呈以较小的部分渲染屏幕。这样，缓冲区可以更小显示用于节省 RAM。建议至少使用 1/10 的屏幕大小缓冲区。在 ``flush_cb`` 渲染图像中需要复制到显示器的给定区域。在此模式下，如果按下一个按钮 只有按钮所在的区域将被重新绘制。
-  :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_DIRECT` 缓冲区必须是 screen size ，并且 LVGL 将在缓冲区的正确位置进行渲染。这样，缓冲区始终包含整个图像。如果使用两个缓冲区，在刷新后渲染的区域会自动复制到另一个缓冲区。因此，由于 ``flush_cb``中的这一点，通常只需更改帧缓冲区的地址。如果按下一个按钮 只有按钮所在的区域将被重新绘制。
-  :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_FULL` 缓冲区必须是 screen size ，并且即使只有一个像素发生了变化， LVGL 也将始终重绘整个屏幕。如果提供了两个屏幕大小的绘制缓冲区， LVGL的显示处理工作方式类似于“传统”双缓冲。这意味着 ``flush_cb`` 回调只需要将帧缓冲区的地址更新到 ``px_map`` 参数。

例如：


.. code:: c

   static uint16_t buf[LCD_HOR_RES * LCD_VER_RES / 10];
   lv_display_set_buffers(disp, buf, NULL, sizeof(buf), LV_DISPLAY_RENDER_MODE_PARTIAL);

One buffer（一个缓冲区）
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

If only one buffer is used LVGL draws the content of the screen into
that draw buffer and sends it to the display via the ``flush_cb``. LVGL
then needs to wait until :cpp:expr:`lv_display_flush_ready` is called
(that is the content of the buffer is sent to the
display) before drawing something new into it.

.. raw:: html

   </details>
   <br>


如果只使用一个缓冲区，LVGL 会将屏幕内容绘制到该绘制缓冲区中并通过 ``flush_cb`` 将其发送到显示器。 然后 LVGL 需要等待，直到 :cpp:expr:`lv_display_flush_ready`被调用（即缓冲区的内容被发送到显示），才能在其中绘制新内容。

Two buffers（两个缓冲区）
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

If two buffers are used LVGL can draw into one buffer while the content
of the other buffer is sent to the display in the background. DMA or
other hardware should be used to transfer data to the display so the MCU
can continue drawing. This way, the rendering and refreshing of the
display become parallel operations.

.. raw:: html

   </details>
   <br>


如果使用两个缓冲区，LVGL 可以在一个缓冲区中进行绘制，而另一个缓冲区的内容则在后台被发送到显示器。 应使用 DMA 或其他硬件将数据传输到显示器，因此MCU可以继续绘制。 通过这种方式，显示器的渲染和刷新就变成了并行操作。


Advanced options（高级选项）
***************************

Resolution（分辨率）
-------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

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


要在创建后设置显示器的分辨率，请使用 :cpp:expr:`lv_display_set_resolution(display, hor_res, ver_res)`

对于 LVGL，不强制要求使用整个显示器，然而在某些情况下，物理分辨率很重要。例如，触摸板仍然能识别整个分辨率，并且需要将值转换为 LVGL 活动显示区域。因此，物理分辨率和活动区域的偏移量可以用 :cpp:expr:`lv_display_set_physical_resolution(disp, hor_res, ver_res)` 和 :cpp:expr:`lv_display_set_offset(disp, x, y)` 进行设置


Flush wait callback（刷新等待回调）
----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

By using :cpp:expr:`lv_display_flush_ready` LVGL will spin in a loop
while waiting for flushing.

However with the help of :cpp:expr:`lv_display_set_flush_wait_cb` a custom
wait callback be set for flushing. This callback can use a semaphore, mutex,
or anything else to optimize while the waiting for flush.

If ``flush_wait_cb`` is not set, LVGL assume that `lv_display_flush_ready`
is used.

.. raw:: html

   </details>
   <br>


通过使用 :cpp:expr:`lv_display_flush_ready` ， LVGL 在等待刷新时会在一个循环中旋转等待。

但是，借助 :cpp:expr:`lv_display_set_flush_wait_cb` 可以为刷新设置一个自定义的等待回调。此回调可以使用信号量、互斥锁或其他任何东西来在等待刷新时进行优化。

如果 ``flush_wait_cb`` 未设置，则 LVGL 假定使用了 `lv_display_flush_ready`。


Rotation（旋转）
---------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL supports rotation of the display in 90 degree increments. You can
select whether you would like software rotation or hardware rotation.

The orientation of the display can be changed with
``lv_display_set_rotation(disp, LV_DISPLAY_ROTATION_0/90/180/270)``.
LVGL will swap the horizontal and vertical resolutions internally
according to the set degree. When changing the rotation
:cpp:expr:`LV_EVENT_SIZE_CHANGED` is sent to the display to allow
reconfiguring the hardware. In lack of hardware display rotation support
:cpp:expr:`lv_draw_sw_rotate` can be used to rotate the buffer in the
``flush_cb``.

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


LVGL 支持以 90 度为增量旋转显示器。您可以选择是使用软件旋转还是硬件旋转。

可以使用 ``lv_display_set_rotation(disp, LV_DISPLAY_ROTATION_0/90/180/270)`` 更改显示器的方向。 LVGL 会根据设置的角度在内部交换水平和垂直分辨率。当改变旋转方向时，:cpp:expr:`LV_EVENT_SIZE_CHANGED` 事件被发送到显示器，以便重新配置硬件。如果缺乏硬件显示器旋转支持，可以在 ``flush_cb`` 中使用 :cpp:expr:`lv_draw_sw_rotate` 来旋转缓冲区。

:cpp:expr:`lv_display_rotate_area(display, &area)` 旋转渲染区域根据显示器当前的旋转设置。

请注意 :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_DIRECT` （直接渲染模式）中的小变化区域直接在帧缓冲区中渲染，所以之后不能再进行旋转。 因此，在直接模式下，只能旋转整个帧缓冲区。对于 :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_FULL` （全渲染模式）也是如此。

在 :cpp:enumerator:`LV_DISPLAY_RENDER_MODE_PARTIAL` （部分渲染模式）的情况下，小的渲染区域可以在刷新到帧缓冲区之前单独进行旋转。

Color format（颜色格式）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The default color format of the display is set according to :c:macro:`LV_COLOR_DEPTH`
(see ``lv_conf.h``)

- :c:macro:`LV_COLOR_DEPTH` ``32``: XRGB8888 (4 bytes/pixel)
- :c:macro:`LV_COLOR_DEPTH` ``24``: RGB888 (3 bytes/pixel)
- :c:macro:`LV_COLOR_DEPTH` ``16``: RGB565 (2 bytes/pixel)
- :c:macro:`LV_COLOR_DEPTH` ``8``: L8 (1 bytes/pixel)

- :c:macro:`LV_COLOR_DEPTH` ``1``: I1 (1 bit/pixel) Only support for horizontal mapped buffers. See :refr:`monochrome` for more details:
The ``color_format`` can be changed with
:cpp:expr:`lv_display_set_color_depth(display, LV_COLOR_FORMAT_...)`.
Besides the default value :c:macro:`LV_COLOR_FORMAT_ARGB8888` can be
used as a well.

It's very important that draw buffer(s) should be large enough for any
selected color format.


.. raw:: html

   </details>
   <br>


显示器的默认颜色格式是根据 :c:macro:`LV_COLOR_DEPTH` (请参阅 ``lv_conf.h``)

- :c:macro:`LV_COLOR_DEPTH` ``32``: XRGB8888（4 字节/像素）
- :c:macro:`LV_COLOR_DEPTH` ``24``: RGB888（3 字节/像素）
- :c:macro:`LV_COLOR_DEPTH` ``16``: RGB565（2字节/像素）
- :c:macro:`LV_COLOR_DEPTH` ``8``:L8（1 字节/像素）
- :c:macro:`LV_COLOR_DEPTH` ``1``:I1（每个像素1比特）仅支持水平映射缓冲区。有关更多详细信息，请参阅 :refr:`monochrome` :

颜色格式可以通过调用 :cpp:expr:`lv_display_set_color_depth(display, LV_COLOR_FORMAT_...)`来更改。除了默认值之外，也可以使用 :c:macro:`LV_COLOR_FORMAT_ARGB8888` 。

非常重要的是，绘图缓冲区（或缓冲区）的大小对于任何选定的颜色格式来说都应该是足够大的。

Swap endianness（交换字节序）
----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

In case of RGB565 color format it might be required to swap the 2 bytes
because the SPI, I2C or 8 bit parallel port periphery sends them in the wrong order.

The ideal solution is configure the hardware to handle the 16 bit data with different byte order,
however if it's not possible :cpp:expr:`lv_draw_sw_rgb565_swap(buf, buf_size_in_px)`
can be called in the ``flush_cb`` to swap the bytes.

If you wish you can also write your own function, or use assembly instructions for
the fastest possible byte swapping.

Note that this is not about swapping the Red and Blue channel but converting

``RRRRR GGG | GGG BBBBB``

to

``GGG BBBBB | RRRRR GGG``.


.. raw:: html

   </details>
   <br>


如果是 RGB565 颜色格式，则可能需要交换这 2 个字节 因为 SPI、I2C 或 8 位并行端口外设可能以错误的顺序发送它们。

理想的解决方案是配置硬件以处理具有不同字节顺序的 16 位数据， 但是如果不可能这样做，可以在 ``flush_cb`` 中调用 :cpp:expr:`lv_draw_sw_rgb565_swap(buf, buf_size_in_px)` 来交换字节。

如果你愿意，你也可以编写自己的函数，或者使用汇编指令来实现尽可能快的字节交换。

请注意，这不是交换红色和蓝色通道，而是进行转换


``RRRRR GGG | GGG BBBBB``

到

``GGG BBBBB | RRRRR GGG``.

.. _monochrome:

Monochrome Displays（单色显示器）
--------------------------------
.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL supports rendering directly in a 1-bit format for monochrome displays.
To enable it, set ``LV_COLOR_DEPTH 1`` or use :cpp:expr:`lv_display_set_color_format(display, LV_COLOR_FORMAT_I1)`.

The :cpp:expr:`LV_COLOR_FORMAT_I1` format assumes that bytes are mapped to rows (i.e., the bits of a byte are written next to each other).
The order of bits is MSB first, which means:

.. code::
             MSB           LSB
   bits       7 6 5 4 3 2 1 0
   pixels     0 1 2 3 4 5 6 7
             Left         Right
Ensure that the LCD controller is configured accordingly.

Internally, LVGL rounds the redrawn areas to byte boundaries. Therefore, updated areas will:

- Start on an ``Nx8`` coordinate.
- End on an ``Nx8 - 1`` coordinate.

When setting up the buffers for rendering (:cpp:func:`lv_display_set_buffers`), make the buffer 8 bytes larger.
This is necessary because LVGL reserves 2 x 4 bytes in the buffer, as these are assumed to be used as a palette.

To skip the palette, include the following line in your ``flush_cb`` function: ``px_map += 8``.

As usual, monochrome displays support partial, full, and direct rendering modes as well.
In full and direct modes, the buffer size should be large enough for the whole screen, meaning ``(horizontal_resolution x vertical_resolution / 8) + 8`` bytes.
As LVGL can not handle fractional width make sure to round the horizontal resolution to 8-
(For example 90 to 96)

.. raw:: html

   </details>
   <br>


LVGL 支持以 1 位格式直接在单色显示器上进行渲染。
要启用它，请设置 ``LV_COLOR_DEPTH 1`` 或使用 :cpp:expr:`lv_display_set_color_format(display, LV_COLOR_FORMAT_I1)`。

 :cpp:expr:`LV_COLOR_FORMAT_I1` 格式假设字节映射到行（即，一个字节的位是相邻写入的）。
位的顺序是最高有效位（MSB）在前，这意味着：

.. code::
             MSB           LSB
   bits       7 6 5 4 3 2 1 0
   pixels     0 1 2 3 4 5 6 7
             Left         Right
请确保相应地配置LCD控制器

在内部，LVGL 将重绘区域四舍五入到字节边界。因此，更新区域将：

- 从 ``Nx8`` 坐标开始。
- 在 ``Nx8 - 1`` 坐标结束。

在设置渲染缓冲区 (:cpp:func:`lv_display_set_buffers`) 时，使缓冲区增大 8 字节。
这是必要的，因为 LVGL 保留缓冲区中的 2 x 4 字节，这些字节假定用作调色板。

要跳过调色板，在您的 ``flush_cb`` 函数中包含以下行： ``px_map += 8``。

像往常一样，单色显示器也支持部分、全屏和直接渲染模式。
在全屏和直接模式下，缓冲区大小应足够容纳整个屏幕，即 ``（水平分辨率 x 垂直分辨率 / 8）+ 8`` 字节。
由于 LVGL 不能处理小数宽度，请确保将水平分辨率四舍五入到 8 的倍数
（例如，90 四舍五入到 96）


User data（用户数据）
--------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

With :cpp:expr:`lv_display_set_user_data(disp, p)` a pointer to a custom data can
be stored in display object.

.. raw:: html

   </details>
   <br>


使用 :cpp:expr:`lv_display_set_user_data(disp, p)` 指向自定义数据的指针可以 存储在显示对象中。


Decoupling the display refresh timer
------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>


Normally the dirty (a.k.a invalid) areas are checked and redrawn in
every :c:macro:`LV_DEF_REFR_PERIOD` milliseconds (set in ``lv_conf.h``).
However, in some cases you might need more control on when the display
refreshing happen, for example to synchronize rendering with VSYNC or
the TE signal.

You can do this in the following way:

.. code:: c

   /*Delete the original display refresh timer*/
   lv_display_delete_refr_timer(disp);

   /*Call this anywhere you want to refresh the dirty areas*/
   _lv_display_refr_timer(NULL);

If you have multiple displays call :cpp:expr:`lv_display_set_default(disp1)` to
select the display to refresh before :cpp:expr:`_lv_display_refr_timer(NULL)`.


.. note:: that :cpp:func:`lv_timer_handler` and :cpp:func:`_lv_display_refr_timer` cannot  run at the same time.


If the performance monitor is enabled, the value of :c:macro:`LV_DEF_REFR_PERIOD` needs to be set to be
consistent with the refresh period of the display to ensure that the statistical results are correct.


.. raw:: html

   </details>
   <br>


通常，每经过 :c:macro:`LV_DEF_REFR_PERIOD` 毫秒（设置在 ``lv_conf.h`` 中），脏区（又称无效区）就会被检查并重新绘制。 但是，在某些情况下，您可能需要对显示器刷新时间进行更多控制，例如将渲染与 VSYNC （垂直同步信号）或 TE （行结束信号）同步。

您可以通过以下方式执行此操作：  

.. code:: c

   /*Delete the original display refresh timer*/
   lv_timer_delete(disp->refr_timer);
   disp->refr_timer = NULL;


   /*Call this anywhere you want to refresh the dirty areas*/
   _lv_display_refr_timer(NULL);

如果您有多个显示器，请调用 :cpp:expr:`lv_display_set_default(disp1)` 来选择要刷新的显示器，然后再调用 :cpp:expr:`_lv_display_refr_timer(NULL)` 。


.. 注意::  :cpp:func:`lv_timer_handler` 和 :cpp:func:`_lv_display_refr_timer` 不能同时运行。.


如果启用了性能监视器，则需要将 :c:macro:`LV_DEF_REFR_PERIOD` 的值设置为与显示器的刷新周期一致，以确保统计结果正确无误。


Force refreshing（强制刷新）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Normally the invalidated areas (marked for redraw) are rendered in :cpp:func:`lv_timer_handler` in every
:c:macro:`LV_DEF_REFR_PERIOD` milliseconds. However, by using :cpp:func:`lv_refr_now(display)` you can ask LVGL to
redraw the invalid areas immediately. The refreshing will happen in :cpp:func:`lv_refr_now` which might take
longer time.

The parameter of :cpp:func:`lv_refr_now` is a display to refresh. If ``NULL`` is set the default display will be updated.

.. raw:: html

   </details>
   <br>


通常，无效区域（标记为需要重绘的区域）会在每经过 :cpp:macro:`LV_DEF_REFR_PERIOD` 毫秒的 :cpp:func:`lv_timer_handler` 中进行渲染。但是，通过使用 :cpp:func:`lv_refr_now（display）`，您可以要求LVGL立即重新绘制无效区域。刷新将发生在 :cpp:func:`lv_refr_now` 中，这可能需要更长的时间。

:cpp:func:`lv_refr_now` 的参数是一个要刷新的显示器。如果设置了 ``NULL`` ，则将更新默认显示器。


Events（事件）
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_display_add_event_cb(disp, event_cb, LV_EVENT_..., user_data)` adds
an event handler to a display. The following events are sent:

- :cpp:enumerator:`LV_EVENT_INVALIDATE_AREA` An area is invalidated (marked for redraw).
  :cpp:expr:`lv_event_get_param(e)` returns a pointer to an :cpp:struct:`lv_area_t`
  variable with the coordinates of the area to be invalidated. The area can
  be freely modified if needed to adopt it the special requirement of the
  display. Usually needed with monochrome displays to invalidate ``N x 8``
  rows or columns at once.
- :cpp:enumerator:`LV_EVENT_REFR_REQUEST`: Sent when something happened that requires redraw.
- :cpp:enumerator:`LV_EVENT_REFR_START`: Sent when a refreshing cycle starts. Sent even if there is nothing to redraw.
- :cpp:enumerator:`LV_EVENT_REFR_READY`: Sent when refreshing is ready (after rendering and calling the ``flush_cb``). Sent even if no redraw happened.
- :cpp:enumerator:`LV_EVENT_RENDER_START`: Sent when rendering starts.
- :cpp:enumerator:`LV_EVENT_RENDER_READY`: Sent when rendering is ready (before calling the ``flush_cb``)
- :cpp:enumerator:`LV_EVENT_FLUSH_START`: Sent before the ``flush_cb`` is called.
- :cpp:enumerator:`LV_EVENT_FLUSH_READY`: Sent when the ``flush_cb`` returned.
- :cpp:enumerator:`LV_EVENT_RESOLUTION_CHANGED`: Sent when the resolution changes due
  to :cpp:func:`lv_display_set_resolution` or :cpp:func:`lv_display_set_rotation`.


.. raw:: html

   </details>
   <br>


:cpp:expr:`lv_display_add_event_cb(disp, event_cb, LV_EVENT_..., user_data)` 向一个显示器添加事件处理程序。将发送以下事件：

- :cpp:enumerator:`LV_EVENT_INVALIDATE_AREA` 一个区域被标记为无效（需要重绘）。:cpp:expr:`lv_event_get_param(e)` 返回一个指向 :cpp:struct:`lv_area_t` 类型变量的指针，该变量包含需要无效化区域的坐标。该区域如果需要，可以自由修改这个区域以适应显示器的特殊要求。通常在单色显示器中需要一次无效化 ``N x 8`` 行或列时使用。
- :cpp:enumerator:`LV_EVENT_REFR_REQUEST`: 在发生需要重绘的事情时发送。
- :cpp:enumerator:`LV_EVENT_REFR_START`: 刷新周期开始时发送。即使没有任何内容需要重绘，也会发送。
- :cpp:enumerator:`LV_EVENT_REFR_READY`: 在刷新完成时发送（渲染并调用 ``flush_cb`` ）。即使没有发生重绘也会发送。
- :cpp:enumerator:`LV_EVENT_RENDER_START`: 在渲染开始时发送。
- :cpp:enumerator:`LV_EVENT_RENDER_READY`: 在渲染准备就绪时发送（在调用 ``flush_cb`` 之前）
- :cpp:enumerator:`LV_EVENT_FLUSH_START`: 在调用 ``flush_cb`` 之前发送。
- :cpp:enumerator:`LV_EVENT_FLUSH_READY`: 在返回 ``flush_cb`` 时发送。
- :cpp:enumerator:`LV_EVENT_RESOLUTION_CHANGED`: 当由于 :cpp:func:`lv_display_set_resolution` 或 :cpp:func:`lv_display_set_rotation`导致分辨率改变时发送。


Further reading（深入学习）
**************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  `lv_port_disp_template.c <https://github.com/lvgl/lvgl/blob/master/examples/porting/lv_port_disp_template.c>`__
   for a template for your own driver.
-  :ref:`Drawing <drawing>` to learn more about how rendering
   works in LVGL.
-  :ref:`display_features` to learn more about higher
   level display features.

.. raw:: html

   </details>
   <br>


- `lv_port_disp_template.c <https://github.com/lvgl/lvgl/blob/master/examples/porting/lv_port_disp_template.c>`__ 获取您自己的驱动程序的模板。
- :ref:`Drawing <drawing>` 了解更多关于渲染在 LVGL 中是如何工作的。
- :ref:`display_features` ，以了解有关更高级别显示功能的更多信息。

API
***
