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


LVGL 生成条形码的功能，使用到了 `fhunleth <https://github.com/fhunleth>`__ 的 `code128 <https://github.com/fhunleth/code128>`__ 。


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


在 ``lv_conf.h`` 中启用 :c:macro:`LV_USE_BARCODE` 。

函数 :cpp:func:`lv_barcode_create` 用于创建条形码对象，函数 :cpp:func:`lv_barcode_update` 用于生成（刷新）条形码。

函数 :cpp:func:`lv_barcode_set_scale` 调整缩放，函数 :cpp:func:`lv_barcode_set_dark_color` 和 :cpp:func:`lv_barcode_set_light_color` 调整颜色，需要再次调用 :cpp:func:`lv_barcode_update` 以重新生成（刷新）条形码。


Notes（笔记）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  It is best not to manually set the width of the barcode, because when
   the width of the object is lower than the width of the barcode, the
   display will be incomplete due to truncation.
-  The scale adjustment can only be an integer multiple, for example,
   :cpp:expr:`lv_barcode_set_scale(barcode, 2)` means 2x scaling.
-  The direction adjustment can be :cpp:enumerator:`LV_DIR_HOR` or :cpp:enumerator:`LV_DIR_VER`

.. raw:: html

   </details>
   <br>


- 最好不要手动设置条形码的宽度，因为当 物体的宽度小于条形码的宽度， 由于截断，将得到不完整的条形码。
- 比例调整只能是整数倍，例如，:cpp:expr:`lv_barcode_set_scale（条形码，2）` 表示 2 倍缩放。
- 方向调整可以是 :cpp:enumerator:`LV_DIR_HOR` 或 :cpp:enumerator:`LV_DIR_VER`


.. _barcode_example:

Example
-------

.. include:: ../examples/libs/barcode/index.rst

.. _barcode_api:

API
---

:ref:`code128`

