.. _qrcode:

================
QR code（二维码）
================

.. raw:: html

   <details>
     <summary>显示原文</summary>

QR code generation with LVGL. Uses
`QR-Code-generator <https://github.com/nayuki/QR-Code-generator>`__ by
`nayuki <https://github.com/nayuki>`__.

.. raw:: html

   </details>
   <br>


使用 LVGL 生成二维码。使用 `nayuki <https://github.com/nayuki>`__ 的 `QR-Code-generator <https://github.com/nayuki/QR-Code-generator>`__ 码生成器。


.. _qrcode_usage:

Usage（用法）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable :c:macro:`LV_USE_QRCODE` in ``lv_conf.h``.

Use :cpp:func:`lv_qrcode_create` to create a qrcode object, and use
:cpp:func:`lv_qrcode_update` to generate a QR code.

If you need to re-modify the size and color, use
:cpp:func:`lv_qrcode_set_size` and :cpp:func:`lv_qrcode_set_dark_color` or 
:cpp:func:`lv_qrcode_set_light_color`, and
call :cpp:func:`lv_qrcode_update` again to regenerate the QR code.

.. raw:: html

   </details>
   <br>


在 ``lv_conf.h`` 中启用 :c:macro:`LV_USE_QRCODE` 。

使用 :cpp:func:`lv_qrcode_create` 创建qrcode对象，并使用 :cpp:func:`lv_qrcode_update` 以生成二维码。

如果需要重新修改尺寸和颜色，请使用 :cpp:func:`lv_qrcode_set_size` 和 :cpp:func:`lv_qrcode_set_dark_color` 或 
:cpp:func:`lv_qrcode_set_light_color`，以及再次调用 :cpp:func:`lv_qrcode_update` 以重新生成QR代码。


Notes（笔记）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  QR codes with less data are smaller, but they scaled by an integer
   number to best fit to the given size.

.. raw:: html

   </details>
   <br>


- 数据较少的二维码较小，但它们按整数缩放 数字以最适合给定的尺寸。


.. _qrcode_example:

Example
-------

.. include:: ../examples/libs/qrcode/index.rst

.. _qrcode_api:

API
---

:ref:`qrcodegen`

