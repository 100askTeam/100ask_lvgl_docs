.. _lv_imgfont:

=====================
Image font（图片字体）
=====================

.. raw:: html

   <details>
     <summary>显示原文</summary>

Draw image in **label** or **span** obj with :cpp:type:`lv_imgfont`. This is often used to
display Unicode emoji icons in text.

Supported image formats: determined by enabled LVGL :ref:`image decoders <overview_image_decoder>`.

.. raw:: html

   </details>
   <br>


使用 **label**或 **span**对象以:cpp:type:`lv_imgfont`绘制图像。这通常用于在文本中显示Unicode表情符号图标。

支持的图像格式：由启用的LVGL:ref:`图像解码器<overview_image_decoder>`决定。


.. _lv_imgfont_usage:

Usage（用法）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable :c:macro:`LV_USE_IMGFONT` in ``lv_conf.h``.

To create a new *imgfont* use :cpp:expr:`lv_imgfont_create(height, path_cb, user_data)`.

- ``height`` Font size. 
- ``path_cb`` A function to get the image path of a character. 
  Return ``NULL`` if no image should be shown, but the character itself.
- ``user_data`` Pointer to user data.

To use the *imgfont* in a label, reference it:
:cpp:expr:`lv_obj_set_style_text_font(label, imgfont, LV_PART_MAIN)`

To destroy the *imgfont* that is no longer used, use :cpp:expr:`lv_imgfont_destroy(imgfont)`.

.. raw:: html

   </details>
   <br>


启用:c:macro:`LV_USE_IMGFONT` 在 ``lv_conf.h`` 中。

要创建一个新的 *imgfont*，使用 :cpp:expr:`lv_imgfont_create(height, path_cb, user_data)`。

- ``height`` 字体大小。
- ``path_cb`` 获取字符图像路径的函数。
  如果不应该显示图像，而是显示字符本身，返回 ``NULL``。
- ``user_data`` 用户数据指针。

要在标签中使用 *imgfont*，请引用它：
:cpp:expr:`lv_obj_set_style_text_font(label, imgfont, LV_PART_MAIN)`

要销毁不再使用的 *imgfont*，请使用 :cpp:expr:`lv_imgfont_destroy(imgfont)`。


.. _lv_imgfont_example:

Example
-------

.. include:: ../examples/others/imgfont/index.rst

.. _lv_imgfont_api:

API
---
