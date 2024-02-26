.. _tjpgd:

================================================================
Tiny JPEG Decompressor (TJpgDec)（微型 JPEG 解压缩器 (TJpgDec) ）
================================================================

.. raw:: html

   <details>
     <summary>显示原文</summary>

Allow the use of JPEG (JPG) images in LVGL.

Detailed introduction: `TJpgDec <http://elm-chan.org/fsw/tjpgd/>`__

.. raw:: html

   </details>
   <br>


允许在 LVGL 中使用 JPEG （JPG） 图像。

详细介绍： `TJpgDec <http://elm-chan.org/fsw/tjpgd/>`__


.. _tjpgd_overview:

Overview（概述）
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  JPEG is decoded in 8x8 tiles.
-  Only baseline JPEG files are supported (no progressive JPEG support).
-  Read from file and C array are implemented.
-  Only the required portions of the JPEG images are decoded,
   therefore they can't be zoomed or rotated.

.. raw:: html

   </details>
   <br>


- JPEG以 8x8 图块解码。
- 仅支持基线 JPEG 文件（不支持渐进式 JPEG）。
- 实现了从文件读取和 C 数组。
- 仅解码JPEG图像的所需部分， 因此，它们无法缩放或旋转。


.. _tjpgd_usage:

Usage（用法）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If enabled in ``lv_conf.h`` by :c:macro:`LV_USE_TJPGD` LVGL will register a new
image decoder automatically so JPEG files can be used directly
as image sources.

For example:

.. code:: c

   lv_image_set_src(my_img, "S:path/to/picture.jpg");

:Note: a file system driver needs to be registered to open images from
files. Read more about :ref:`overview_file_system` or just
enable one in ``lv_conf.h`` with ``LV_USE_FS_...`` config.

.. raw:: html

   </details>
   <br>


如果在 ``lv_conf.h``中由:c:mmacro:`lv_USE_TJPGD`LVGL启用将注册一个新的自动图像解码器，因此可以直接使用 JPEG 文件作为图像源。

例如：

.. code:: c

   lv_image_set_src(my_img, "S:path/to/picture.jpg");

:注意: 需要注册文件系统驱动程序才能打开映像文件。阅读更多关于 :ref:`文件系统的信息`，或者只是使用 ``LV_USE_FS_...`` 在 ``lv_conf.h`` 启用一个配置。


Converter（转换器）
------------------

Converting JPEG to C array（将JPEG转换为C数组）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  Use lvgl online tool https://lvgl.io/tools/imageconverter
-  Color format = RAW, output format = C Array

.. raw:: html

   </details>
   <br>


- 使用lvgl在线工具 https://lvgl.io/tools/imageconverter
- 颜色格式 = RAW，输出格式 = C 数组


.. _tjpgd_example:

Example
-------

.. include:: ../examples/libs/tjpgd/index.rst

.. _tjpgd_api:

API
---

:ref:`lv_tjpgd`

:ref:`tjpgd`

:ref:`tjpgdcnf`
