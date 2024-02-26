.. _changelog:

Changelog（更改日志）
====================

v9.0.0
~~~~~~

Migration guide（迁移指南）
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

As v9 is a major version it contains API breaking changes too. Most of the conceptual changes in v9 were internal, however the API was affected some widgets reword and refactoring as well.

.. raw:: html

   </details> 
   <br>


由于 v9 是一个主要版本，它也包含 API 重大更改。v9 中的大多数概念更改都是内部的，但是 API 也受到了一些小部件重写和重构的影响。


IMPORTANT（重要）
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If you are updating a v8 project to v9, special care must be taken as some parts

-  will not result in compiler error, but LVGL might not work due to related issues
-  will result in hard to understand compiler errors

So pay extra attention to these:

- :cpp:func:`lv_display_set_buffers(display, buf1, buf2, buf_size_byte, mode)` is more or less the equivalent of ``lv_disp_draw_buf_init(&draw_buf_dsc, buf1, buf2, buf_size_px)`` from v8, however in **v9 the buffer size is set in bytes**.
- In v9 ``lv_color_t`` is always RGB888 regardless of ``LV_COLOR_DEPTH``.
- ``lv_conf.h`` has been changed a lot, so don't forget to update it from ``lv_conf_template.h``
- Be sure ``<stdint.h>`` is **not** included in ``lv_conf.h``. In v9 we have some assembly parts for even better performance and a random include there would mess up the assembly part.
- The online image converter in not updated yet. Until that use `LVGLImage.py <https://github.com/lvgl/lvgl/blob/master/scripts/LVGLImage.py>`__ .
- Run time dithering is rendering due its complexity and lack of GPU support. Smaller dithered and tiled images can be used as background images as a replacement.
- STM32's DMA2D (Chrom-ART) support is removed for now. It will be added again when an official partnership starts with ST too.
- SJPG was removed as the original TJPGD support decoding tile-by-tile. (typically a tile is 8x8 pixels)

.. raw:: html

   </details> 
   <br>


如果要将 v8 项目更新到 v9，必须特别注意某些部分

- 不会导致编译器错误，但 LVGL 可能由于相关问题而无法工作
- 将导致难以理解的编译器错误

所以要格外注意这些：

- :cpp:func:`lv_display_set_buffers(display, buf1, buf2, buf_size_byte, mode)` 或多或少与 v8 中的 ``lv_disp_draw_buf_init(&draw_buf_dsc, buf1, buf2, buf_size_px)`` 相同，但是在v9 中， **冲区大小以字节为单位设置**。
- 在 v9 中 无论 ``lv_conf_template.h``如何， ``lv_color_t`` 始终是 RGB888，.
- ``lv_conf.h`` 已经改变了很多，所有不要忘记更新它 ``lv_conf_template.h``
- 确保 ``<stdint.h>`` **不包含** 在 ``lv_conf.h``。 在 v9 中，我们有一些组装部件以获得更好的性能，随机包含会弄乱组装部件。
- 在线图像转换器尚未更新。直到使用 `LVGLImage.py <https://github.com/lvgl/lvgl/blob/master/scripts/LVGLImage.py>`__ 。
- 由于其复杂性和缺乏 GPU 支持，运行时抖动正在渲染。较小的抖动和平铺图像可以用作背景图像作为替代。
- STM32 的 DMA2D (Chrom-ART) 支持暂时被删除。当与 ST 建立正式合作伙伴关系时，也会再次添加它。
- SJPG 被删除，因为原来的 TJPGD 支持逐图块解码。（通常一个图块是 8x8 像素）


Main new features（主要新功能）
------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

- Run time display color format adjustment with RGB888 support
- Built-in support ``pthread``, ``FreeRTOS`` and other (RT)OSes which are used during rendering
- Built-in support LVGL's, C library, and other ``stdlib``s
- Better parallel rendering architecture. See the details :ref:`here <porting_draw>`
- Built in display and touch driver: SDL, Linux Frame buffer,  NuttX LCD and touch drivers, ST7789 and ILI9341 driver are available and more will come soon
- :ref:`observer` allows to bind data to UI elements and create a uniform and easy to maintain API
- GitHub CodeSpace integration makes possible to run LVGL in an Online VSCode editor with 3 click. See more `here <https://blog.lvgl.io/2023-04-13/monthly-newsletter>`__
- Add vector graphics support via ThorVG. It can be used to draw vector graphics to a `Canvas <https://github.com/lvgl/lvgl/blob/master/examples/widgets/canvas/lv_example_canvas_8.c>`__
- :ref:`lv_image` supports aligning, stretching or tiling the image source if the widget is larger or smaller.

.. raw:: html

   </details> 
   <br>


- 支持 RGB888 的运行时显示颜色格式调整
- 内置支持 ``pthread``, ``FreeRTOS`` 以及渲染期间使用的其他（RT）操作系统
- 内置支持 LVGL、C 库和其他 ``stdlib``s
- 更好的并行渲染架构。请参阅 :ref:`此处的详细信息 <porting_draw>`
- 内置显示和触摸驱动程序：SDL、Linux 帧缓冲区、NuttX LCD 和触摸驱动程序、ST7789 和 ILI9341 驱动程序均可用，更多内容即将推出
- :ref:`observer` 允许将数据绑定到 UI 元素并创建统一且易于维护的 API
- GitHub CodeSpace 集成使得只需单击 3 次即可在在线 VSCode 编辑器中运行 LVGL。 `在这里 <https://blog.lvgl.io/2023-04-13/monthly-newsletter>`__ 查看更多内容
- 通过 ThorVG 添加矢量图形支持。它可用于将矢量图形绘制到 `画布 <https://github.com/lvgl/lvgl/blob/master/examples/widgets/canvas/lv_example_canvas_8.c>`__ 上
- :ref:`lv_image` 如果小部件更大或更小， lv_image.h支持对齐、拉伸或平铺图像源。


General API changes（常规 API 更改）
-----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Although `lv_api_map.h <https://github.com/lvgl/lvgl/blob/master/src/lv_api_map.h>`__ address most of the refactoring we encourage you to use the latest API directly.

-  ``lv_disp_...`` is renamed to ``lv_display_...``
-  ``btn_...`` is renamed to ``button_...``
-  ``btnmatrix_...`` is renamed to ``buttonmatrix_...``
-  ``img_...`` is renamed to ``image_...``
-  ``zoom`` is renamed to ``scale``
-  ``angle`` is renamed to ``rotation``
-  ``scr`` is renamed to ``screen``
-  ``act`` is renamed to ``active``
-  ``del`` is renamed to ``delete``
-  ``col`` is renamed to ``column``
-  ``lv_obj_clear_flag`` is renamed to ``lv_obj_remove_flag``
-  ``lv_obj_clear_state`` is renamed to ``lv_obj_remove_state``
-  ``lv_coord_t`` was removed and replaced by ``int32_t``

.. raw:: html

   </details> 
   <br>


尽管 `lv_api_map.h <https://github.com/lvgl/lvgl/blob/master/src/lv_api_map.h>`__ 解决了大部分重构问题，但我们鼓励您直接使用最新的 API。

-  ``lv_disp_...`` 被重命名为 ``lv_display_...``
-  ``btn_...`` 被重命名为 ``button_...``
-  ``btnmatrix_...`` 被重命名为 ``buttonmatrix_...``
-  ``img_...`` 被重命名为 ``image_...``
-  ``zoom`` 被重命名为 ``scale``
-  ``angle`` 被重命名为 ``rotation``
-  ``scr`` 被重命名为 ``screen``
-  ``act`` 被重命名为 ``active``
-  ``del`` 被重命名为 ``delete``
-  ``col`` 被重命名为 ``column``
-  ``lv_obj_clear_flag`` 被重命名为 ``lv_obj_remove_flag``
-  ``lv_obj_clear_state`` 被重命名为 ``lv_obj_remove_state``
-  ``lv_coord_t`` 被删除并替换为 ``int32_t``


New color format management（新的颜色格式管理）
----------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  ``LV_IMG_CF_...`` was replaced by ``LV_COLOR_FORMAT_...``
-  ``LV_COLOR_DEPTH 24`` is supported for RGB888 rendering
-  ``lv_color_t`` always means RGB888

.. raw:: html

   </details> 
   <br>


-  ``LV_IMG_CF_...`` 被替换为 ``LV_COLOR_FORMAT_...``
-  ``LV_COLOR_DEPTH 24`` 支持RGB888渲染
-  ``lv_color_t`` 始终表示 RGB888


Display API（显示API）
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  ``lv_disp_drv_t`` and ``lv_disp_draw_buf_t`` was removed
-  To create a display and set it up:

.. code:: c

   lv_display_t * disp = lv_display_create(hor_res, ver_res)
   lv_display_set_flush_cb(disp, flush_cb);
   lv_display_set_buffers(disp, buf1, buf2, buf_size_in_bytes, mode);

-  Note that now **buf size is in bytes and not pixels**
-  ``mode`` can be:

   -  ``LV_DISPLAY_RENDER_MODE_PARTIAL`` This way the buffers can be
      smaller then the display to save RAM. At least 1/10 screen sized
      buffer(s) are recommended.
   -  ``LV_DISPLAY_RENDER_MODE_DIRECT`` The buffer(s) has to be screen
      sized and LVGL will render into the correct location of the
      buffer. This way the buffer always contain the whole image. With 2
      buffers the buffers’ content are kept in sync automatically. (Old
      v7 behavior)
   -  ``LV_DISPLAY_RENDER_MODE_FULL`` Just always redraw the whole
      screen. With 2 buffers is a standard double buffering.

-  Similarly to the widgets, now you can attach events to the display
   too, using ``lv_display_add_event()``
-  ``monitor_cb`` is removed and ``LV_EVENT_RENDER_READY`` event is
   fired instead
-  Instead of having display background color and image,
   ``lv_layer_bottom()`` is added where any color can be set or any
   widget can be created.
-  The target color format can be adjusted in the display in runtime by calling
   ``lv_display_set_color_format(disp, LV_COLOR_FORMAT_...)``
-  ``LV_COLOR_16_SWAP`` is removed and ``lv_draw_sw_rgb565_swap()`` can be called manually
   in the ``flush_cb`` if needed to swap the in-place.
-  ``disp_drv.scr_transp`` was removed and
   ``lv_display_set_color_format(disp, LV_COLOR_FORMAT_NATIVE_ALPHA)``
   can be used instead
-  ``set_px_cb`` is removed. You can can convert the rendered image in the ``flush_cb``.
-  For more details check out the docs
   `here /porting/display>`__ and
   `here /overview/display>`__.

.. raw:: html

   </details> 
   <br>


-  ``lv_disp_drv_t`` 和 ``lv_disp_draw_buf_t`` 被删除
- 要创建显示并设置它：

.. code:: c

   lv_display_t * disp = lv_display_create(hor_res, ver_res)
   lv_display_set_flush_cb(disp, flush_cb);
   lv_display_set_buffers(disp, buf1, buf2, buf_size_in_bytes, mode);

- 请注意， **现在buf 大小以字节为单位，而不是像素**
- mode可以是：

   -  ``LV_DISPLAY_RENDER_MODE_PARTIAL`` 这样缓冲区可以比显示器更小，以节省 RAM。建议至少使用 1/10 屏幕大小的缓冲区。
   -  ``LV_DISPLAY_RENDER_MODE_DIRECT`` 缓冲区必须是屏幕大小的，LVGL 将渲染到缓冲区的正确位置。这样缓冲区始终包含整个图像。使用 2 个缓冲区时，缓冲区的内容会自动保持同步。（旧的 v7 行为）
   -  ``LV_DISPLAY_RENDER_MODE_FULL`` 总是重画整个屏幕。有 2 个缓冲区是标准的双缓冲区。

- 与小部件类似，现在您也可以将事件附加到显示，使用 ``lv_display_add_event()``。
-  ``monitor_cb`` 被删除并且 ``LV_EVENT_RENDER_READY`` 触发事件。
- 不是显示背景颜色和图像，而 ``lv_layer_bottom()`` 添加可以设置任何颜色或可以创建任何小部件的位置。
- 可以在运行时通过调用 ``lv_display_set_color_format(disp, LV_COLOR_FORMAT_...)`` 在显示中调整目标颜色格式。
-  ``LV_COLOR_16_SWAP`` 已删除，如果需要 在 ``flush_cb``交换， ``lv_draw_sw_rgb565_swap()`` 可以手动调用。
-  ``disp_drv.scr_transp`` 已被删除并且 ``lv_display_set_color_format(disp, LV_COLOR_FORMAT_NATIVE_ALPHA)``可以替代使用。
-  ``set_px_cb`` 已删除。您可以将渲染的图像转换为 ``flush_cb``.

有关更多详细信息，请查看文档 `here /porting/display>`__ 和 `here /overview/display>`__。


Indev API（独立开发API）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  Similarly to the display ``lv_indev_drv_t`` was removed and an input
   device can be created like this:
-  Similarly to the widgets, now you can attach events to the indevs
   too, using ``lv_indev_add_event()``
-  The ``feedback_cb`` was removed, instead ``LV_EVENT_PRESSED/CLICKED/etc``
   events are sent to the input device

.. raw:: html

   </details> 
   <br>


- ``lv_indev_drv_t`` 与删除显示器类似，可以像这样创建输入设备：
- 与小部件类似，现在您也可以将事件附加到 indevs，使用 ``lv_indev_add_event()``。
- 已 ``feedback_cb`` 被删除，而改为 ``LV_EVENT_PRESSED/CLICKED/etc`` 事件被发送到输入设备


.. code:: c

   lv_indev_t * indev = lv_indev_create();
   lv_indev_set_type(indev, LV_INDEV_TYPE_...);
   lv_indev_set_read_cb(indev, read_cb);

Others（其他）
~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  ``lv_msg`` is removed and replaced by
   `lv_observer <https://docs.lvgl.io/master/others/observer.html>`__
-  ``lv_chart`` ticks support was removed,
   `lv_scale <https://docs.lvgl.io/master/widgets/scale.html>`__ can be
   used instead
- ``lv_msgbox`` is update to be more flexible. It uses normal button instead of button matrix
- ``lv_tabview`` was updated to user real button instead of a button matrix

.. raw:: html

   </details> 
   <br>


-  ``lv_msg`` 被删除并被 `lv_observer <https://docs.lvgl.io/master/others/observer.html>`__ 取代
-  ``lv_chart`` 刻度线支持已删除， 可以使用 `lv_scale <https://docs.lvgl.io/master/widgets/scale.html>`__  代替
- ``lv_msgbox`` 正在更新以更加灵活。它使用普通按钮而不是按钮矩阵
- ``lv_tabview`` 已更新为用户真实按钮而不是按钮矩阵


v8.3
~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

For Other v8.3.x releases visit the `Changelog in the release/v8.3 branch <https://github.com/lvgl/lvgl/blob/release/v8.3/docs/CHANGELOG.md>`__ .

.. raw:: html

   </details> 
   <br>


对于其他 v8.3.x 版本，请访问 `release/v8.3 分支中的变更日志。 <https://github.com/lvgl/lvgl/blob/release/v8.3/docs/CHANGELOG.md>`__ .

