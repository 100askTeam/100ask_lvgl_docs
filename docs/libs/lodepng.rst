.. _lodepng:

===============
LodePNG decoder
===============

.. raw:: html

   <details>
     <summary>显示原文</summary>

Allow the use of PNG images in LVGL.

Detailed introduction: https://github.com/lvandeve/lodepng

If enabled in ``lv_conf.h`` by :c:macro:`LV_USE_LODEPNG` LVGL will register a new
image decoder automatically so PNG files can be directly used as any
other image sources.

:Note: a file system driver needs to be registered to open images from 
files. Read more about it :ref:`overview_file_system` or just
enable one in ``lv_conf.h`` with ``LV_USE_FS_...``

The whole PNG image is decoded, so ``width x height x 4`` bytes free RAM space is required. 
The decoded image is stored in RGBA pixel format.

As it might take significant time to decode PNG images LVGL's :ref:`overview_image_caching` feature can be useful.

.. raw:: html

   </details>
   <br>


PNG解码器让我们可以在 LVGL 中使用 PNG 图像。

详细介绍：https://github.com/lvandeve/lodepng

如果在 ``lv_conf.h`` 中启用了 :c:macro:`LV_USE_LODEPNG` 在初始化时会自动注册 PNG 图像解码器，之后 PNG 文件可以直接用作图像源使用。

:注意: 需要注册文件系统驱动程序才能从文件中打开图像。阅读有关它的 :ref:`overview_file_system` 更多信息，或者仅在 ``lv_conf.h`` 中使用 ``LV_USE_FS_...`` 启用一个

对整个PNG图像进行解码，因此需要 ``宽x高x 4`` 字节的空闲RAM空间。解码后的图像以RGBA像素格式存储。

由于解码 PNG 图像可能需要大量时间，这时候 LVGL :ref:`overview_image_caching` 功能就能派上用场了( lv_conf.h 中的 LV_IMG_CACHE_DEF_SIZE)。


Compress PNG files（压缩PNG文件）
-------------------------------

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


PNG 文件格式支持真彩色（24/32 位）和 8 位调色板颜色。 通常剪贴画、绘图、图标和简单图形以 PNG 格式存储， 不使用整个色彩空间，因此可以进一步压缩 使用 8 位调色板颜色而不是 24/32 位真彩色格式的图像。 由于嵌入式设备的（闪存）存储有限，因此建议使用 压缩图像。

一种选择是使用免费的在线 PNG 压缩器站点， 例如压缩 PNG：https://compresspng.com/


.. _lodepng_example:

Example
-------

.. include:: ../examples/libs/lodepng/index.rst

.. _lodepng_api:

API
---

:ref:`lodepng`

