.. _bmp:

========================
BMP decoder（BMP解码器）
========================

.. raw:: html

   <details>
     <summary>显示原文</summary>

This extension allows the use of BMP images in LVGL.

Library source: https://github.com/caj-johnson/bmp-decoder

The pixels are read on demand (not the whole image is loaded)
so using BMP images requires very little RAM.

If enabled in ``lv_conf.h`` by :c:macro:`LV_USE_BMP` LVGL will register a new
image decoder automatically so BMP files can be directly used as image
sources. For example:

.. code-block:: c

   lv_image_set_src(my_img, "S:path/to/picture.bmp");

Note that, a file system driver needs to registered to open images from
files. Read more about it :ref:`overview_file_system` or just
enable one in ``lv_conf.h`` with ``LV_USE_FS_...``

.. raw:: html

   </details>
   <br>


此扩展允许在 LVGL 中使用 BMP 图像。

库源代码: https://github.com/caj-johnson/bmp-decoder

像素按需读取（不是加载整个图像），因此使用 BMP 图像需要非常少的 RAM。

如果在 ``lv_conf.h`` 中启用 :c:macro:`LV_USE_BMP`，LVGL 将自动注册一个新的图像解码器，因此 BMP 文件可以直接用作图像源。例如：

.. code-block:: c

   lv_image_set_src(my_img, "S:path/to/picture.bmp");

请注意，需要注册一个文件系统驱动程序才能从文件中打开图像。阅读更多关于它的信息 :ref:`overview_file_system`，或者只需在 ``lv_conf.h`` 中启用一个，通过 ``LV_USE_FS_...``。

.. _bmp_limitations:

Limitations（限制）
------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  Only BMP files are supported and BMP images as C array
   (:c:struct:`lv_image_dsc_t`) are not. It's because there is no practical
   differences between how the BMP files and LVGL's image format stores
   the image data.
-  BMP files can be loaded only from file. If you want to store them in
   flash it's better to convert them to C array with `LVGL's image converter <https://lvgl.io/tools/imageconverter>`__.
-  The BMP files color format needs to match with :c:macro:`LV_COLOR_DEPTH`.
   Use GIMP to save the image in the required format. Both RGB888 and
   ARGB888 works with :c:macro:`LV_COLOR_DEPTH` ``32``
-  Palette is not supported.
-  Because not the whole image is read in cannot be zoomed or rotated.

.. raw:: html

   </details>
   <br>


- 仅支持 BMP 文件，不能作为 C 数组 (:c:struct:`lv_image_dsc_t`) 使用 BMP 图像。这是因为 BMP 文件与 LVGL 的图像格式在存储图像数据的方式上没有实质性的区别。
- BMP 文件只能从文件中加载。如果你想将它们存储在闪存中，最好使用 `LVGL 的图像转换器 <https://lvgl.io/tools/imageconverter>`__ 将它们转换为 C 数组。
- BMP 文件的颜色格式需要与 :c:macro:`LV_COLOR_DEPTH` 匹配。使用 GIMP 保存图像为所需格式。RGB888 和 ARGB888 都适用于 :c:macro:`LV_COLOR_DEPTH` ``32``。
- 不支持调色板。
- 由于不是读取整个图像，因此不能进行缩放或旋转。

.. _bmp_example:

Example
-------

.. include:: ../../examples/libs/bmp/index.rst

.. _bmp_api:

API
---

