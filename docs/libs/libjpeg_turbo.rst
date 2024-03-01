.. _libjpeg:

============================================
libjpeg-turbo decoder（libjpeg-turbo 解码器）
============================================

.. raw:: html

   <details>
     <summary>显示原文</summary>

**libjpeg-turbo** is a JPEG image codec that uses SIMD instructions to accelerate baseline JPEG compression and decompression on x86, 
x86-64, Arm, PowerPC, and MIPS systems, as well as progressive JPEG compression on x86, x86-64, and Arm systems.

Detailed introduction: https://libjpeg-turbo.org

Library source: https://github.com/libjpeg-turbo/libjpeg-turbo

.. raw:: html

   </details>
   <br>


**libjpeg-turbo** 是一个 JPEG 图像编解码器，它使用 SIMD 指令来加速 x86 上的基线 JPEG 压缩和解压缩， x86-64、Arm、PowerPC 和 MIPS 系统，以及 x86、x86-64 和 Arm 系统上的渐进式 JPEG 压缩。

详细介绍：https://libjpeg-turbo.org

库源： https://github.com/libjpeg-turbo/libjpeg-turbo


.. _libjpeg_install:

Install（安装）
--------------

.. code:: bash

    sudo apt install libjpeg-turbo8-dev

Add libjpeg-turbo to your project（将 libjpeg-turbo 添加到您的项目中）
-------------------------------------------------------------------

.. code:: cmake

    find_package(JPEG REQUIRED)
    include_directories(${JPEG_INCLUDE_DIR})
    target_link_libraries(${PROJECT_NAME} PRIVATE ${JPEG_LIBRARIES})

.. _libjpeg_usage:

Usage（用法）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable :c:macro:`LV_USE_LIBJPEG_TURBO` in ``lv_conf.h``.

See the examples below.
It should be noted that each image of this decoder needs to consume ``image width x image height x 3`` bytes of RAM, 
and it needs to be combined with the :ref:`overview_image_caching` feature to ensure that the memory usage is within a reasonable range.

.. raw:: html

   </details>
   <br>


在 ``lv_conf.h`` 中启用 :c:macro:`LV_USE_LIBJPEG_TURBO` 。

请参阅以下示例。

应当注意，该解码器的每个图像需要消耗 ``图像宽度x图像高度x3`` 字节的RAM，

它需要与 :ref:`overview_image_caching` 功能相结合，以确保内存使用在合理的范围内。


.. _libjpeg_example:

Example
-------

.. include:: ../examples/libs/libjpeg_turbo/index.rst

.. _libjpeg_api:

API
---

:ref:`libjpeg_turbo`

