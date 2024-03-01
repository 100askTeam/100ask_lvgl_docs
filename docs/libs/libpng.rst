.. _libpng:

=============================
libpng decoder（libpng解码器）
=============================

.. raw:: html

   <details>
     <summary>显示原文</summary>

libpng is the official PNG reference library. It supports almost all PNG features, is extensible, and has been extensively tested for over 28 years.

Detailed introduction: http://www.libpng.org/pub/png/libpng.html

.. raw:: html

   </details>
   <br>


libpng 是官方的 PNG 参考库。它支持几乎所有 PNG 功能，可扩展，并且已经过超过 28 年的广泛测试。

详细介绍：http://www.libpng.org/pub/png/libpng.html


Install（安装）
--------------

.. code:: bash

    sudo apt install libpng-dev

Add libpng to your project（将libpng加入你的项目）
------------------------------------------------

.. code:: cmake

    find_package(PNG REQUIRED)
    include_directories(${PNG_INCLUDE_DIR})
    target_link_libraries(${PROJECT_NAME} PRIVATE ${PNG_LIBRARIES})

.. _libpng_usage:

Usage（用法） 
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable :c:macro:`LV_USE_LIBPNG` in ``lv_conf.h``.

See the examples below.
It should be noted that each image of this decoder needs to consume ``width x height x 4`` bytes of RAM, 
and it needs to be combined with the :ref:`overview_image_caching` feature to ensure that the memory usage is within a reasonable range.
The decoded image is stored in RGBA pixel format.

.. raw:: html

   </details>
   <br>


在 ``lv_conf.h`` 中启用 :c:macro:`LV_USE_LIBPNG` 。

请参阅以下示例。

应该注意，这个解码器的每个图象需要消耗 ``宽x高x4`` 字节的RAM，

它需要与 :ref:`overview_image_caching` 功能相结合，以确保内存使用在合理的范围内。

解码后的图像以RGBA像素格式存储。


.. _libpng_example:

Example
-------

.. include:: ../examples/libs/libpng/index.rst

.. _libpng_api:

API
---

:ref:`libpng`

