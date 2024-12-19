.. _lodepng:

================================
LodePNG decoder（LodePNG解码器）
================================

.. raw:: html

   <details>
     <summary>显示原文</summary>

Allow the use of PNG images in LVGL.

Detailed introduction: https://github.com/lvandeve/lodepng

If enabled in ``lv_conf.h`` by :c:macro:`LV_USE_LODEPNG` LVGL will register a new
image decoder automatically so PNG files can be directly used as any
other image sources.

:note: a file system driver needs to be registered to open images from
       files. Read more about it :ref:`overview_file_system` or just
       enable one in ``lv_conf.h`` with ``LV_USE_FS_...``


The whole PNG image is decoded, so ``width x height x 4`` bytes free RAM space is required.
The decoded image is stored in RGBA pixel format.

As it might take significant time to decode PNG images LVGL's :ref:`overview_image_caching` feature can be useful.

.. raw:: html

   </details>
   <br>


允许在 LVGL 中使用 PNG 图像。

详细介绍：[LodePNG GitHub](https://github.com/lvandeve/lodepng)

在 ``lv_conf.h`` 中启用 :c:macro:`LV_USE_LODEPNG` 后，LVGL 将自动注册一个新的图像解码器，PNG 文件可以像其他图像源一样直接使用。

:note: 需要注册文件系统驱动程序以打开文件中的图像。更多信息请参见 :ref:`overview_file_system`，或者直接在 ``lv_conf.h`` 中启用一个驱动程序，使用 ``LV_USE_FS_...``。

整个 PNG 图像都会被解码，因此需要 ``width x height x 4`` 字节的空闲 RAM 空间。解码后的图像以 RGBA 像素格式存储。

由于解码 PNG 图像可能需要显著的时间，LVGL 的 :ref:`overview_image_caching` 特性可能会非常有用。

Compress PNG files（压缩PNG文件）
---------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

PNG file format supports True color (24/32 bit), and 8-bit palette colors.
Usually cliparts, drawings, icons and simple graphics are stored in PNG format,
that do not use the whole color space, so it is possible to compress further
the image by using 8-bit palette colors, instead of 24/32 bit True color format.
Because embedded devices have limited (flash) storage, it is recommended
to compress images.

One option is to use a free online PNG compressor site,
for example Compress PNG: https://compresspng.com/

.. raw:: html

   </details>
   <br>


PNG 文件格式支持真彩色（24/32 位）和 8 位调色板颜色。通常，剪贴画、图画、图标和简单图形使用 PNG 格式存储，这些图像并未使用整个色彩空间，因此可以通过使用 8 位调色板颜色来进一步压缩图像，而不是使用 24/32 位的真彩色格式。

由于嵌入式设备的（闪存）存储有限，建议对图像进行压缩。

一种选择是使用免费的在线 PNG 压缩网站，例如：Compress PNG：[https://compresspng.com/](https://compresspng.com/)

.. _lodepng_example:

Example
-------

.. include:: ../../examples/libs/lodepng/index.rst

.. _lodepng_api:

API
---

:ref:`lodepng_h`

