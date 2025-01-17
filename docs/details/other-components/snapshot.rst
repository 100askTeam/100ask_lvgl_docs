.. _snapshot:

================
Snapshot（快照）
================

.. raw:: html

   <details>
     <summary>显示原文</summary>

Snapshot provides API to take snapshot image for LVGL Widget together
with its children. The image will look exactly like the Widget on display.

.. raw:: html

   </details>
   <br>

Snapshot（快照） 提供了一个 API，用于为 LVGL Widget 及其子节点捕获快照图像。  
生成的图像将与 Widget 在显示器上的外观完全一致。

.. _snapshot_usage:

Usage（用法）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Simply call API :cpp:func:`lv_snapshot_take` to generate the image descriptor
which can be set as image Widget src using :cpp:func:`lv_image_set_src`.

Note, only following color formats are supported for now:

- :cpp:enumerator:`LV_COLOR_FORMAT_RGB565`
- :cpp:enumerator:`LV_COLOR_FORMAT_RGB888`
- :cpp:enumerator:`LV_COLOR_FORMAT_XRGB8888`
- :cpp:enumerator:`LV_COLOR_FORMAT_ARGB8888`

.. raw:: html

   </details>
   <br>


只需调用API :cpp:func:`lv_snapshot_take` 来生成图像描述符，可以通过函数 :cpp:func:`lv_image_set_src` 将其设置为图像对象的图像源。

注意，目前仅支持以下颜色格式：

- :cpp:enumerator:`LV_COLOR_FORMAT_RGB565`
- :cpp:enumerator:`LV_COLOR_FORMAT_RGB888`
- :cpp:enumerator:`LV_COLOR_FORMAT_XRGB8888` 
- :cpp:enumerator:`LV_COLOR_FORMAT_ARGB8888`


Free the Image（释放图像）
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

The memory :cpp:func:`lv_snapshot_take` uses are dynamically allocated using
:cpp:func:`lv_draw_buf_create`. Use API :cpp:func:`lv_draw_buf_destroy` to free the memory it
takes. This will firstly free memory the image data takes, then the
image descriptor.

The snapshot image which is the draw buffer returned by :cpp:func:`lv_snapshot_take`
normally won't be added to cache because it can be drawn directly. So you don't need
to invalidate cache by :cpp:func:`lv_image_cache_drop` before destroy the draw buffer.

Below code snippet explains usage of this API.

.. code-block:: c

   void update_snapshot(lv_obj_t * widget, lv_obj_t * img_snapshot)
   {
       lv_draw_buf_t* snapshot = (void*)lv_image_get_src(img_snapshot);
       if(snapshot) {
           lv_draw_buf_destroy(snapshot);
       }
       snapshot = lv_snapshot_take(widget, LV_COLOR_FORMAT_ARGB8888);
       lv_image_set_src(img_snapshot, snapshot);
   }

.. raw:: html

   </details>
   <br>


函数 :cpp:func:`lv_snapshot_take` 消耗的内存是通过 :cpp:func:`lv_draw_buf_create` 动态分配的。 需要使用函数 :cpp:func:`lv_draw_buf_destroy` 来释放它所占用的内存，这会首先释放图像数据所占用的内存，然后释放图像描述符。

通过 :cpp:func:`lv_snapshot_take` 返回的绘图缓冲区通常不会被添加到缓存中，因为它可以直接绘制。因此，在删除绘图缓冲区之前，您不需要通过 :cpp:func:`lv_image_cache_drop` 来使缓存失效。

下面的代码片段解释了 :cpp:func:`lv_snapshot_take` 的用法：

.. code-block:: c

   void update_snapshot(lv_obj_t * widget, lv_obj_t * img_snapshot)
   {
       lv_draw_buf_t* snapshot = (void*)lv_image_get_src(img_snapshot);
       if(snapshot) {
           lv_draw_buf_destroy(snapshot);
       }
       snapshot = lv_snapshot_take(widget, LV_COLOR_FORMAT_ARGB8888);
       lv_image_set_src(img_snapshot, snapshot);
   }


Use Existing Buffer（使用现有的缓冲区）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

If the snapshot needs update now and then, or simply caller provides memory, use API
``lv_result_t lv_snapshot_take_to_draw_buf(lv_obj_t * widget, lv_color_format_t cf, lv_draw_buf_t * draw_buf);``
for this case. It's caller's responsibility to create and destroy the draw buffer.

If snapshot is generated successfully, the image descriptor is updated
and image data will be stored to provided ``buf``.

Note that snapshot may fail if provided buffer is not enough, which may
happen when Widget size changes. It's recommended to use API
:cpp:func:`lv_snapshot_reshape_draw_buf` to prepare the buffer firstly and if it
fails, destroy the existing draw buffer and call `lv_snapshot_take` directly.

.. raw:: html

   </details>
   <br>


如果快照需要不时更新，或者只是调用方提供内存，可以使用API
``lv_result_t lv_snapshot_take_to_draw_buf(lv_obj_t * widget, lv_color_format_t cf, lv_draw_buf_t * draw_buf);``
来处理这种情况。创建和销毁绘制缓冲区是调用者的责任（LVGL不处理）。

如果快照生成成功，则更新图像描述符，并将图像数据存储到提供的“buf”中。

需要注意的是，如果提供的缓冲区不够大，快照可能会失败，这可能发生在对象大小发生变化时。建议使用API
:cpp:func:`lv_snapshot_reshape_draw_buf` 来预先准备缓冲区，如果失败，销毁现有的绘制缓冲区并直接调用 `lv_snapshot_take` 。


.. _snapshot_example:

Example
-------

.. include:: ../../examples/others/snapshot/index.rst

.. _snapshot_api:

API
---

