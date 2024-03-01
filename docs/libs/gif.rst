.. _gif:

=======================
GIF decoder（GIF解码器）
=======================

.. raw:: html

   <details>
     <summary>显示原文</summary>

Allow using GIF images in LVGL.

Detailed introduction: https://github.com/lecram/gifdec

When enabled in ``lv_conf.h`` with :c:macro:`LV_USE_GIF`
:cpp:expr:`lv_gif_create(parent)` can be used to create a gif widget.

:cpp:expr:`lv_gif_set_src(obj, src)` works very similarly to :cpp:func:`lv_image_set_src`.
As source, it also accepts images as variables (:c:struct:`lv_image_dsc_t`) or
files.

.. raw:: html

   </details>
   <br>


GIF解码器让我们可以在 LVGL 中使用 GIF 图像。

详细介绍： https://github.com/lecram/gifdec 。

如果在 ``lv_conf.h`` 中启用了 :c:macro:`LV_USE_GIF` 后，可以使用 :cpp:expr:`lv_gif_create(parent)` 创建 gif 组件，这与 lv_img_create 非常相似。
 
:cpp:expr:`lv_gif_set_src(obj, src)` 的工作方式与 :cpp:func:`lv_image_set_src` 非常相似。作为源，它还接受图像作为变量 (:c:struct:`lv_image_dsc_t`) 或文件。


Convert GIF files to C array（将 GIF 文件转换为 C 数组）
------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To convert a GIF file to byte values array use `LVGL's online
converter <https://lvgl.io/tools/imageconverter>`__. Select "Raw" color
format and "C array" Output format.

.. raw:: html

   </details>
   <br>


要将 GIF 文件转换为字节值的数组，请使用 `LVGL的在线转换器 <https://lvgl.io/tools/imageconverter>`__。选择 “RAW” 颜色格式和 “C array” 输出格式。


Use GIF images from file（使用GIF文件）
--------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

For example:

.. code:: c

   lv_gif_set_src(obj, "S:path/to/example.gif");

Note that, a file system driver needs to be registered to open images
from files. Read more about it :ref:`overview_file_system` or just
enable one in ``lv_conf.h`` with ``LV_USE_FS_...``

.. raw:: html

   </details>
   <br>


示例：

.. code:: c

   lv_gif_set_src(obj, "S:path/to/example.gif");

注意，需要注册文件系统驱动程序才能从文件中打开图像。阅读 :ref:`overview_file_system` 关于文件系统的更多信息，或直接在 ``lv_conf.h`` 中打开其中一个类似 ``LV_USE_FS_...`` 的宏。


Memory requirements（内存要求）
------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To decode and display a GIF animation the following amount of RAM is
required: 

- :c:macro:`LV_COLOR_DEPTH` ``8``: 3 x image width x image height
- :c:macro:`LV_COLOR_DEPTH` ``16``: 4 x image width x image height
- :c:macro:`LV_COLOR_DEPTH` ``32``: 5 x image width x image height

.. raw:: html

   </details>
   <br>


要解码和显示 GIF 文件，需要以下数量的 RAM (字节)：

- :c:macro:`LV_COLOR_DEPTH` ``8``：3 x 图像宽度 x 图像高度
- :c:macro:`LV_COLOR_DEPTH` ``16``：4 x 图像宽度 x 图像高度
- :c:macro:`LV_COLOR_DEPTH` ``32``：5 x 图像宽度 x 图像高度


.. _gif_example:

Example
-------

.. include:: ../examples/libs/gif/index.rst

.. _gif_api:

API
---

:ref:`gifdec`

