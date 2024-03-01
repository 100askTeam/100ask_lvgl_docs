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

By default, a font will use up to 4KB of cache to speed up rendering
glyphs. This maximum can be changed by using
:cpp:expr:`lv_tiny_ttf_create_data_ex(data, data_size, font_size, cache_size)`
or :cpp:expr:`lv_tiny_ttf_create_file_ex(path, font_size, cache_size)` (when
available). The cache size is indicated in bytes.

.. raw:: html

   </details>
   <br>


允许在 LVGL 中使用 TrueType 字体。

详细介绍：https://github.com/nothings/stb

在 ``lv_conf.h`` 中启用 :c:macro:`LV_USE_TINY_TTF` 时，:cpp:expr:`lv_tiny_ttf_create_data(data, data_size, font_size)`  可用于在指定的行高处创建 TTF 字体实例。然后，您可以在任何地方使用该字体都是可以接受的。

默认情况下，TTF 或 OTF 文件必须作为数组嵌入，或者标头，或加载到 RAM 中才能运行。

但是，如果启用了 :c:macro:`LV_TINY_TTF_FILE_SUPPORT` ，则 :cpp:expr:`lv_tiny_ttf_create_file(path, font_size)` 也将可用， 允许tiny_ttf从文件流式传输。该文件必须保持打开状态使用字体的整个过程。

创建字体后，可以使用 :cpp:expr:`lv_tiny_ttf_set_size(font, font_size)` 更改字体大小（以像素为单位）。

默认情况下，字体将使用最多 4KB 的缓存来加快渲染速度符号。可以使用 :cpp:expr:`lv_tiny_ttf_create_data_ex(data, data_size, font_size, cache_size)` 或 :cpp:expr:`lv_tiny_ttf_create_file_ex(path, font_size, cache_size)` 更改此最大值（当可用时）。缓存大小以字节表示。


.. _tiny_ttf_example:

Example
-------

.. include:: ../examples/libs/tiny_ttf/index.rst

.. _tiny_ttf_api:

API
---

:ref:`stb_rect_pack`

:ref:`stb_truetype_htcw`
