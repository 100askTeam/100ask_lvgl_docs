.. _barcode:

=================
Barcode（条形码）
=================

.. raw:: html

   <details>
     <summary>显示原文</summary>

Barcode generation with LVGL. Uses
`code128 <https://github.com/fhunleth/code128>`__ by
`fhunleth <https://github.com/fhunleth>`__.

.. raw:: html

   </details>
   <br>

使用 LVGL 生成条形码。使用 `code128 <https://github.com/fhunleth/code128>`__ 并由 `fhunleth <https://github.com/fhunleth>`__ 提供。

.. _barcode_usage:

Usage（用法）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable :c:macro:`LV_USE_BARCODE` in ``lv_conf.h``.

Use :cpp:func:`lv_barcode_create` to create a barcode object, and use
:cpp:func:`lv_barcode_update` to generate a barcode.

Call :cpp:func:`lv_barcode_set_scale` to adjust scaling,
call :cpp:func:`lv_barcode_set_dark_color` and :cpp:func:`lv_barcode_set_light_color`
adjust color, call :cpp:func:`lv_barcode_set_direction` will set
direction to display, and call :cpp:func:`lv_barcode_update` again to regenerate
the barcode.

.. raw:: html

   </details>
   <br>

在 ``lv_conf.h`` 中启用 :c:macro:`LV_USE_BARCODE`。

使用 :cpp:func:`lv_barcode_create` 创建条形码对象，使用 :cpp:func:`lv_barcode_update` 生成条形码。

调用 :cpp:func:`lv_barcode_set_scale` 调整缩放，调用 :cpp:func:`lv_barcode_set_dark_color` 和 :cpp:func:`lv_barcode_set_light_color` 调整颜色，调用 :cpp:func:`lv_barcode_set_direction` 设置显示方向，再次调用 :cpp:func:`lv_barcode_update` 重新生成条形码。


Notes（笔记）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  It is best not to manually set the width of the barcode, because when
   the width of the Widget is lower than the width of the barcode, the
   display will be incomplete due to truncation.
-  The scale adjustment can only be an integer multiple, for example,
   :cpp:expr:`lv_barcode_set_scale(barcode, 2)` means 2x scaling.
-  The direction adjustment can be :cpp:enumerator:`LV_DIR_HOR` or :cpp:enumerator:`LV_DIR_VER`

.. raw:: html

   </details>
   <br>

- 最好不要手动设置条形码的宽度，因为当 Widget 的宽度小于条形码的宽度时，由于截断，显示会不完整。
- 缩放调整只能是整数倍，例如，:cpp:expr:`lv_barcode_set_scale(barcode, 2)` 意味着 2x 缩放。
- 方向调整可以是 :cpp:enumerator:`LV_DIR_HOR` 或 :cpp:enumerator:`LV_DIR_VER`。

.. _barcode_example:

Example
-------

.. include:: ../../examples/libs/barcode/index.rst

.. _barcode_api:

API
---

:ref:`code128_h`

