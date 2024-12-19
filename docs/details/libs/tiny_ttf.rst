.. _tiny_ttf:

=======================================
Tiny TTF font engine（微小的TTF字体引擎）
=======================================

.. _tiny_ttf_usage:

Usage（用法）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Allow using TrueType fonts in LVGL.

Detailed introduction: https://github.com/nothings/stb

When enabled in ``lv_conf.h`` with :c:macro:`LV_USE_TINY_TTF`
:cpp:expr:`lv_tiny_ttf_create_data(data, data_size, font_size)` can be used to
create a TTF font instance at the specified line height. You can then
use that font anywhere :c:struct:`lv_font_t` is accepted.

By default, the TTF or OTF file must be embedded as an array, either in
a header, or loaded into RAM in order to function.

However, if :c:macro:`LV_TINY_TTF_FILE_SUPPORT` is enabled,
:cpp:expr:`lv_tiny_ttf_create_file(path, font_size)` will also be available,
allowing tiny_ttf to stream from a file. The file must remain open the
entire time the font is being used.

After a font is created, you can change the font size in pixels by using
:cpp:expr:`lv_tiny_ttf_set_size(font, font_size)`.

By default, a font will cache data for upto 256 glyphs elements to speed up rendering.
This maximum can be changed by using
:cpp:expr:`lv_tiny_ttf_create_data_ex(data, data_size, font_size, kerning, cache_size)`
or :cpp:expr:`lv_tiny_ttf_create_file_ex(path, font_size, kerning, cache_size)` (when
available). The cache size is indicated in number of entries. Kerning is whether to allow
if supported, or disable.

.. raw:: html

   </details>
   <br>


允许在 LVGL 中使用 TrueType 字体。


在 ``lv_conf.h`` 中启用 :c:macro:`LV_USE_TINY_TTF` 后，可以使用 :cpp:expr:`lv_tiny_ttf_create_data(data, data_size, font_size)` 创建一个指定行高的 TTF 字体实例。随后可以在任何接受 :c:struct:`lv_font_t` 的地方使用该字体。

默认情况下，TTF 或 OTF 文件必须作为数组嵌入到头文件中，或者加载到 RAM 中才能正常工作。

然而，如果启用了 :c:macro:`LV_TINY_TTF_FILE_SUPPORT`，还可以使用 :cpp:expr:`lv_tiny_ttf_create_file(path, font_size)`，允许 tiny_ttf 从文件中流式加载。文件在字体使用期间必须保持打开状态。

创建字体后，可以通过 :cpp:expr:`lv_tiny_ttf_set_size(font, font_size)` 按像素更改字体大小。

默认情况下，字体将缓存最多 256 个字形元素以加速渲染。可以通过使用 :cpp:expr:`lv_tiny_ttf_create_data_ex(data, data_size, font_size, kerning, cache_size)` 或 :cpp:expr:`lv_tiny_ttf_create_file_ex(path, font_size, kerning, cache_size)`（如果可用）更改此最大值。缓存大小以条目数表示。Kerning 参数用于指定是否启用字距调整（如果支持），或禁用。


.. _tiny_ttf_example:

Example
-------

.. include:: ../../examples/libs/tiny_ttf/index.rst

.. _tiny_ttf_api:

API
---

:ref:`stb_rect_pack_h`

:ref:`stb_truetype_htcw_h`

