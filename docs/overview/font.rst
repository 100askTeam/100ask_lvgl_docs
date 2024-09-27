.. _fonts:

============
Fonts（字体）
============

.. raw:: html

   <details>
     <summary>显示原文</summary>

In LVGL fonts are collections of bitmaps and other information required
to render images of individual letters (glyph). A font is stored in a
:cpp:type:`lv_font_t` variable and can be set in a style's *text_font* field.
For example:

.. code:: c

   lv_style_set_text_font(&my_style, &lv_font_montserrat_28);  /*Set a larger font*/

Fonts have a **format** property. It describes how the glyph draw data is stored.
It has *2* categories: `Legacy simple format` and `Advanced format`.
In the legacy simple format, the font is stored in a simple array of bitmaps.
In the advanced format, the font is stored in a different way like `Vector`, `SVG`, etc.

In the legacy simple format, the value stored for a pixel determines the pixel's opacity.
This way, with higher *bpp (bit per pixel)*, the edges of the letter can be smoother.
The possible *bpp* values are 1, 2, 4 and 8 (higher values mean better quality).

The *format* property also affects the amount of memory needed to store a
font. For example, *format = LV_FONT_GLYPH_FORMAT_A4* makes a font nearly four times larger
compared to *format = LV_FONT_GLYPH_FORMAT_A1*.

.. raw:: html

   </details>
   <br>


在LVGL中，字体是由位图和其他必要的信息组成，用于绘制单个字母（字形）的图像。字体存储在 `lv_font_t` 变量中，并可以在样式的 `text_font` 字段中设置。例如：

.. code:: c

   lv_style_set_text_font(&my_style, &lv_font_montserrat_28);  /*Set a larger font*/
 
字体有一个 **格式** 属性，描述了字形绘制数据的存储方式。它有两个分类： `传统简单格式` 和 `高级格式`。在传统简单格式中，字体存储在一个简单的位图数组中。在高级格式中，字体以不同的方式存储，例如 `矢量图`、 `SVG` 等。

在传统简单格式中，存储的像素值决定了像素的不透明度。这样，通过更高的位深度（每像素位数），字母的边缘可以更加平滑。可能的位深度值为1、2、4和8（更高的值意味着更好的质量）。

格式属性还影响存储字体所需的内存量。例如， *format = LV_FONT_GLYPH_FORMAT_A4* 的字体大小大约是 *format = LV_FONT_GLYPH_FORMAT_A1* 的四倍。


Unicode support（支持Unicode编码）
**********************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL supports **UTF-8** encoded Unicode characters. Your editor needs to
be configured to save your code/text as UTF-8 (usually this the default)
and be sure that, :c:macro:`LV_TXT_ENC` is set to :c:macro:`LV_TXT_ENC_UTF8` in
*lv_conf.h*. (This is the default value)

To test it try

.. code:: c

   lv_obj_t * label1 = lv_label_create(lv_screen_active(), NULL);
   lv_label_set_text(label1, LV_SYMBOL_OK);

If all works well, a ✓ character should be displayed.

.. raw:: html

   </details>
   <br>


LVGL支持 **UTF-8** 编码的Unicode字符。您的编辑器需要配置为以UTF-8格式保存代码/文本（通常这是默认设置），并确保在 *lv_conf.h* 中将 :c:macro:`LV_TXT_ENC` 设置为 :c:macro:`LV_TXT_ENC_UTF8` （这是默认值）。

要进行测试，请尝试以下代码：

.. code:: c

   lv_obj_t * label1 = lv_label_create(lv_screen_active(), NULL);
   lv_label_set_text(label1, LV_SYMBOL_OK);

如果一切正常，应该显示一个✓字符。


Built-in fonts（内置字体）
**************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

There are several built-in fonts in different sizes, which can be
enabled in ``lv_conf.h`` with *LV_FONT\_…* defines. 

.. raw:: html

   </details>
   <br>


有几种不同大小的内置字体可在 ``lv_conf.h`` 中通过 *LV_FONT_…* 定义启用。


Normal fonts（普通字体）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Containing all the ASCII characters, the degree symbol (U+00B0), the
bullet symbol (U+2022) and the built-in symbols (see below).

- :c:macro:`LV_FONT_MONTSERRAT_12`: 12 px font
- :c:macro:`LV_FONT_MONTSERRAT_14`: 14 px font
- :c:macro:`LV_FONT_MONTSERRAT_16`: 16 px font
- :c:macro:`LV_FONT_MONTSERRAT_18`: 18 px font
- :c:macro:`LV_FONT_MONTSERRAT_20`: 20 px font
- :c:macro:`LV_FONT_MONTSERRAT_22`: 22 px font
- :c:macro:`LV_FONT_MONTSERRAT_24`: 24 px font
- :c:macro:`LV_FONT_MONTSERRAT_26`: 26 px font
- :c:macro:`LV_FONT_MONTSERRAT_28`: 28 px font
- :c:macro:`LV_FONT_MONTSERRAT_30`: 30 px font
- :c:macro:`LV_FONT_MONTSERRAT_32`: 32 px font
- :c:macro:`LV_FONT_MONTSERRAT_34`: 34 px font
- :c:macro:`LV_FONT_MONTSERRAT_36`: 36 px font
- :c:macro:`LV_FONT_MONTSERRAT_38`: 38 px font
- :c:macro:`LV_FONT_MONTSERRAT_40`: 40 px font
- :c:macro:`LV_FONT_MONTSERRAT_42`: 42 px font
- :c:macro:`LV_FONT_MONTSERRAT_44`: 44 px font
- :c:macro:`LV_FONT_MONTSERRAT_46`: 46 px font
- :c:macro:`LV_FONT_MONTSERRAT_48`: 48 px font

.. raw:: html

   </details>
   <br>


包含所有的ASCII字符，度符号（U+00B0），圆点符号（U+2022）和内置的符号（见下方）。

- :c:macro:`LV_FONT_MONTSERRAT_12`：12像素字体
- :c:macro:`LV_FONT_MONTSERRAT_14`：14像素字体
- :c:macro:`LV_FONT_MONTSERRAT_16`：16像素字体
- :c:macro:`LV_FONT_MONTSERRAT_18`：18像素字体
- :c:macro:`LV_FONT_MONTSERRAT_20`：20像素字体
- :c:macro:`LV_FONT_MONTSERRAT_22`：22像素字体
- :c:macro:`LV_FONT_MONTSERRAT_24`：24像素字体
- :c:macro:`LV_FONT_MONTSERRAT_26`：26像素字体
- :c:macro:`LV_FONT_MONTSERRAT_28`：28像素字体
- :c:macro:`LV_FONT_MONTSERRAT_30`：30像素字体
- :c:macro:`LV_FONT_MONTSERRAT_32`：32像素字体
- :c:macro:`LV_FONT_MONTSERRAT_34`：34像素字体
- :c:macro:`LV_FONT_MONTSERRAT_36`：36像素字体
- :c:macro:`LV_FONT_MONTSERRAT_38`：38像素字体
- :c:macro:`LV_FONT_MONTSERRAT_40`：40像素字体
- :c:macro:`LV_FONT_MONTSERRAT_42`：42像素字体
- :c:macro:`LV_FONT_MONTSERRAT_44`：44像素字体
- :c:macro:`LV_FONT_MONTSERRAT_46`：46像素字体
- :c:macro:`LV_FONT_MONTSERRAT_48`：48像素字体


Special fonts（特殊字体）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :c:macro:`LV_FONT_MONTSERRAT_28_COMPRESSED`: Same as normal 28 px font but stored as a :ref:`fonts_compressed` with 3 bpp
-  :c:macro:`LV_FONT_DEJAVU_16_PERSIAN_HEBREW`: 16 px font with normal range + Hebrew, Arabic, Persian letters and all their forms
-  :c:macro:`LV_FONT_SIMSUN_16_CJK`: 16 px font with normal range plus 1000 of the most common CJK radicals
-  :c:macro:`LV_FONT_UNSCII_8`: 8 px pixel perfect font with only ASCII characters
-  :c:macro:`LV_FONT_UNSCII_16`: 16 px pixel perfect font with only ASCII characters

The built-in fonts are **global variables** with names like
:cpp:var:`lv_font_montserrat_16` for a 16 px height font. To use them in a
style, just add a pointer to a font variable like shown above.

The built-in fonts with *bpp = 4* contain the ASCII characters and use
the `Montserrat <https://fonts.google.com/specimen/Montserrat>`__ font.

In addition to the ASCII range, the following symbols are also added to
the built-in fonts from the `FontAwesome <https://fontawesome.com/>`__
font.

.. _fonts_symbols:

.. image:: /misc/symbols.png

The symbols can be used singly as:

.. code:: c

   lv_label_set_text(my_label, LV_SYMBOL_OK);

Or together with strings (compile time string concatenation):

.. code:: c

   lv_label_set_text(my_label, LV_SYMBOL_OK "Apply");

Or more symbols together:

.. code:: c

   lv_label_set_text(my_label, LV_SYMBOL_OK LV_SYMBOL_WIFI LV_SYMBOL_PLAY);

.. raw:: html

   </details>
   <br>


-  :c:macro:`LV_FONT_MONTSERRAT_28_COMPRESSED`: 与普通 28 像素字体相同，但以 3 bpp 存储为 :ref:`fonts_compressed`
-  :c:macro:`LV_FONT_DEJAVU_16_PERSIAN_HEBREW`: 16 像素字体覆盖常用字符范围，并包括希伯来、阿拉伯和波斯文字符及其形式
-  :c:macro:`LV_FONT_SIMSUN_16_CJK`: 16 像素字体覆盖常用字符范围，并包含 1000 多个最常见的CJK部首
-  :c:macro:`LV_FONT_UNSCII_8`: 8 像素像素完美的字体，仅包含 ASCII 字符
-  :c:macro:`LV_FONT_UNSCII_16`: 16 像素像素完美的字体，仅包含 ASCII 字符

内置字体是 **全局变量**，名称如 :cpp:var:`lv_font_montserrat_16` 代表高度为 16 像素的字体。要在样式中使用它们，只需添加一个指向字体变量的指针，如上所示。

具有 *bpp = 4* 的内置字体包含ASCII字符，并使用 `Montserrat <https://fonts.google.com/specimen/Montserrat>`__ 字体。

除ASCII范围外，还从 `FontAwesome <https://fontawesome.com/>`__ 字体中添加了以下符号。

.. _fonts_symbols:

.. image:: /misc/symbols.png

这些符号可以单独使用：

.. code:: c

   lv_label_set_text(my_label, LV_SYMBOL_OK);

或与字符串一起使用（编译时字符串连接）：

.. code:: c

   lv_label_set_text(my_label, LV_SYMBOL_OK "Apply");

或一起使用多个符号：

.. code:: c

   lv_label_set_text(my_label, LV_SYMBOL_OK LV_SYMBOL_WIFI LV_SYMBOL_PLAY);


Special features（特殊功能）
****************************

Bidirectional support（双向支持）
---------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Most languages use a Left-to-Right (LTR for short) writing direction,
however some languages (such as Hebrew, Persian or Arabic) use
Right-to-Left (RTL for short) direction.

LVGL not only supports RTL texts but supports mixed (a.k.a.
bidirectional, BiDi) text rendering too. Some examples:

.. image:: /misc/bidi.png

BiDi support is enabled by :c:macro:`LV_USE_BIDI` in *lv_conf.h*

All texts have a base direction (LTR or RTL) which determines some
rendering rules and the default alignment of the text (Left or Right).
However, in LVGL, the base direction is not only applied to labels. It's
a general property which can be set for every object. If not set then it
will be inherited from the parent. This means it's enough to set the
base direction of a screen and every object will inherit it.

The default base direction for screens can be set by
:c:macro:`LV_BIDI_BASE_DIR_DEF` in *lv_conf.h* and other objects inherit the
base direction from their parent.

To set an object's base direction use :cpp:expr:`lv_obj_set_style_base_dir(obj, base_dir, selector)`.
The possible base directions are:

- :cpp:enumerator:`LV_BASE_DIR_LTR`: Left to Right base direction
- :cpp:enumerator:`LV_BASE_DIR_RTL`: Right to Left base direction
- :cpp:enumerator:`LV_BASE_DIR_AUTO`: Auto detect base direction

This list summarizes the effect of RTL base direction on objects:

- Create objects by default on the right
- ``lv_tabview``: Displays tabs from right to left
- ``lv_checkbox``: Shows the box on the right
- ``lv_buttonmatrix``: Shows buttons from right to left
- ``lv_list``: Shows icons on the right
- ``lv_dropdown``: Aligns options to the right
- The texts in ``lv_table``, ``lv_buttonmatrix``, ``lv_keyboard``, ``lv_tabview``, ``lv_dropdown``, ``lv_roller`` are "BiDi processed" to be displayed correctly

.. raw:: html

   </details>
   <br>


大多数语言使用从左到右（简称LTR）的书写方向，然而一些语言（如希伯来语，波斯语或阿拉伯语）使用从右到左（简称RTL）的书写方向。

LVGL不仅支持RTL文本，还支持混合（也称为双向，BiDi）文本渲染。下面是一些示例：

.. image:: /misc/bidi.png

通过 *lv_conf.h* 中的 :c:macro:`LV_USE_BIDI` 可以启用BiDi支持

所有文本都有一个基本方向（LTR或RTL），确定了一些渲染规则和文本的默认对齐方式（左对齐或右对齐）。但是，在LVGL中，基本方向不仅适用于标签。这是一个可以为每个对象设置的通用属性。如果未设置，则会从父级继承。这意味着只需设置一个屏幕的基本方向，每个对象都会继承它。

可以通过 *lv_conf.h* 中的 :c:macro:`LV_BIDI_BASE_DIR_DEF` 设置屏幕的默认基本方向，其他对象从其父对象继承基本方向。

要设置对象的基本方向，请使用 :cpp:expr:`lv_obj_set_style_base_dir(obj, base_dir, selector)`。可能的基本方向包括：

- :cpp:enumerator:`LV_BASE_DIR_LTR`：从左到右的基本方向
- :cpp:enumerator:`LV_BASE_DIR_RTL`：从右到左的基本方向
- :cpp:enumerator:`LV_BASE_DIR_AUTO`：自动检测基本方向

此列表总结了RTL基本方向对对象的影响：

- 默认情况下在右侧创建对象
- ``lv_tabview``：从右到左显示选项卡
- ``lv_checkbox``：在右侧显示框
- ``lv_buttonmatrix``：从右到左显示按钮
- ``lv_list``：在右侧显示图标
- ``lv_dropdown``：将选项对齐到右侧
- ``lv_table``， ``lv_buttonmatrix``， ``lv_keyboard``， ``lv_tabview``， ``lv_dropdown``， ``lv_roller`` 中的文本是经过"BiDi处理"以正确显示


Arabic and Persian support(阿拉伯语和波斯语支持)
-----------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

There are some special rules to display Arabic and Persian characters:
the *form* of a character depends on its position in the text. A
different form of the same letter needs to be used when it is isolated,
at start, middle or end positions. Besides these, some conjunction rules
should also be taken into account.

LVGL supports these rules if :c:macro:`LV_USE_ARABIC_PERSIAN_CHARS` is enabled.

However, there are some limitations:

- Only displaying text is supported (e.g. on labels), text inputs (e.g. text area) don't support this feature.
- Static text (i.e. const) is not processed. E.g. texts set by :cpp:func:`lv_label_set_text` will be "Arabic processed" but :cpp:func:`lv_label_set_text_static` won't.
- Text get functions (e.g. :cpp:func:`lv_label_get_text`) will return the processed text.

.. raw:: html

   </details>
   <br>


有一些特殊规则来显示阿拉伯和波斯字符：
字符的 *形式* 取决于其在文本中的位置。当字符处于孤立、开始、中间或结尾位置时，需要使用相同字母的不同形式。除此之外，还应考虑一些连词规则。

如果启用了宏命令  :c:macro:`LV_USE_ARABIC_PERSIAN_CHARS`，LVGL将支持这些规则。

然而，存在一些限制：

- 仅支持显示文本（例如标签），在文本输入框（例如文本区域）中不支持此功能。
- 静态文本（即常量）不会被处理。例如，由函数 :cpp:func:`lv_label_set_text` 设置的文本将会被"阿拉伯处理"，但:cpp:func:`lv_label_set_text_static`不会。
- 文本获取函数（例如 :cpp:func:`lv_label_get_text`）将返回处理后的文本。


Subpixel rendering（亚像素渲染）
-------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Subpixel rendering allows for tripling the horizontal resolution by
rendering anti-aliased edges on Red, Green and Blue channels instead of
at pixel level granularity. This takes advantage of the position of
physical color channels of each pixel, resulting in higher quality
letter anti-aliasing. Learn more
`here <https://en.wikipedia.org/wiki/Subpixel_rendering>`__.

For subpixel rendering, the fonts need to be generated with special
settings:

- In the online converter tick the ``Subpixel`` box
- In the command line tool use ``--lcd`` flag. Note that the generated font needs about three times more memory.

Subpixel rendering works only if the color channels of the pixels have a
horizontal layout. That is the R, G, B channels are next to each other
and not above each other. The order of color channels also needs to
match with the library settings. By default, LVGL assumes ``RGB`` order,
however this can be swapped by setting :c:macro:`LV_SUBPX_BGR`  ``1`` in
*lv_conf.h*.

.. raw:: html

   </details>
   <br>


子像素渲染允许通过在红色、绿色和蓝色通道上渲染抗锯齿边缘而不是在像素级别上进行三倍水平分辨率。
这利用了每个像素的物理颜色通道的位置，从而实现更高质量的字母抗锯齿。在此了解更多信息
`here <https://en.wikipedia.org/wiki/Subpixel_rendering>`__。

要进行子像素渲染，需要使用特殊设置生成字体:

- 在在线转换器中勾选 ``Subpixel`` 框
- 在命令行工具中使用 ``--lcd`` 标志。请注意，生成的字体需要大约三倍的内存。

子像素渲染仅在像素的颜色通道具有水平布局时起作用。
也就是说，R、G、B通道相邻而不是重叠。颜色通道的顺序也需要与库设置相匹配。
默认情况下，LVGL假定是 ``RGB`` 顺序，但可以通过在 *lv_conf.h* 中设置 :c:macro:`LV_SUBPX_BGR`  ``1`` 来进行交换。


.. _fonts_compressed:

Compressed fonts（压缩字体）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The bitmaps of fonts can be compressed by

- ticking the ``Compressed`` check box in the online converter
- not passing the ``--no-compress`` flag to the offline converter (compression is applied by default)

Compression is more effective with larger fonts and higher bpp. However,
it's about 30% slower to render compressed fonts. Therefore, it's
recommended to compress only the largest fonts of a user interface,
because

- they need the most memory
- they can be compressed better
- and probably they are used less frequently then the medium-sized fonts, so the performance cost is smaller.

.. raw:: html

   </details>
   <br>


字体位图可以通过以下方式压缩：

- 在在线转换器中勾选 ``压缩`` 复选框
- 在离线转换器中不使用 ``--no-compress`` 标志（默认情况下会应用压缩）

对于较大的字体和较高的位深度，压缩效果更好。然而，压缩字体的渲染速度会慢大约30%。因此，建议只对用户界面中最大的字体进行压缩，因为：

- 它们需要最多的内存
- 它们可以更好地压缩
- 并且可能比中等大小的字体使用频率更低，因此性能成本更低。


Kerning（字距调整）
------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Fonts may provide kerning information to adjust the spacing between specific
characters.

- The online converter generates kerning tables.
- The offline converter generates kerning tables unless ``--no-kerning`` is
  specified.
- FreeType integration does not currently support kerning.
- The Tiny TTF font engine supports GPOS and Kern tables.

To configure kerning at runtime, use :cpp:func:`lv_font_set_kerning`.

.. raw:: html

   </details>
   <br>


字体可以提供字距调整信息，以调整特定字符之间的间距。

- 在线转换器生成字距表。
- 离线转换器生成字距表，除非指定了 ``--no-kerning``。
- FreeType集成目前不支持字距调整。
- Tiny TTF字体引擎支持GPOS和Kern表。

要在运行时配置字距调整，使用 :cpp:func:`lv_font_set_kerning`。


.. _add_font:

Add a new font（添加新的字体）
******************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

There are several ways to add a new font to your project:

1. The simplest method is to use the `Online font converter <https://lvgl.io/tools/fontconverter>`__.
   Just set the parameters, click the *Convert* button, copy the font to your project
   and use it. **Be sure to carefully read the steps provided on that site
   or you will get an error while converting.**
2. Use the `Offline font converter <https://github.com/lvgl/lv_font_conv>`__.
   (Requires Node.js to be installed)
3. If you want to create something like the built-in
   fonts (Montserrat font and symbols) but in a different size and/or
   ranges, you can use the ``built_in_font_gen.py`` script in
   ``lvgl/scripts/built_in_font`` folder. (This requires Python and
   ``lv_font_conv`` to be installed)

To declare a font in a file, use :cpp:expr:`LV_FONT_DECLARE(my_font_name)`.

To make fonts globally available (like the built-in fonts), add them to
:c:macro:`LV_FONT_CUSTOM_DECLARE` in *lv_conf.h*.

.. raw:: html

   </details>
   <br>


有几种方法可以向您的项目添加新字体：

1. 最简单的方法是使用 `在线字体转换器 <https://lvgl.io/tools/fontconverter>`__ 。
   设置参数，点击 *转换* 按钮，将字体复制到您的项目中
   并使用它。 **请务必仔细阅读该网站提供的步骤
   否则在转换过程中会出现错误。**
2. 使用 `离线字体转换器 <https://github.com/lvgl/lv_font_conv>`__ 。
   （需要安装Node.js）
3. 如果您想要创建类似于内置字体
   （Montserrat字体和符号）但是大小和/或范围不同的字体，可以使用
   ``lvgl/scripts/built_in_font`` 文件夹中的 ``built_in_font_gen.py`` 脚本。（这需要安装Python和 ``lv_font_conv``）

要在文件中声明字体，请使用 :cpp:expr:`LV_FONT_DECLARE(my_font_name)`。

要使字体在全局范围内可用（类似于内置字体），请将它们添加到
*lv_conf.h* 文件中的 :c:macro:`LV_FONT_CUSTOM_DECLARE`。


Add new symbols（添加新符号）
****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The built-in symbols are created from the `FontAwesome <https://fontawesome.com/>`__ font.

1. Search for a symbol on https://fontawesome.com. For example the
   `USB symbol <https://fontawesome.com/icons/usb?style=brands>`__. Copy its
   Unicode ID which is ``0xf287`` in this case.
2. Open the `Online font converter <https://lvgl.io/tools/fontconverter>`__.
   Add `FontAwesome.woff <https://lvgl.io/assets/others/FontAwesome5-Solid+Brands+Regular.woff>`__.
3. Set the parameters such as Name, Size, BPP. You'll use this name to
   declare and use the font in your code.
4. Add the Unicode ID of the symbol to the range field. E.g.\ ``0xf287``
   for the USB symbol. More symbols can be enumerated with ``,``.
5. Convert the font and copy the generated source code to your project.
   Make sure to compile the .c file of your font.
6. Declare the font using ``extern lv_font_t my_font_name;`` or simply
   use :cpp:expr:`LV_FONT_DECLARE(my_font_name)`.

.. raw:: html

   </details>
   <br>

内置符号是从 `FontAwesome <https://fontawesome.com/>`__ 字体创建的。

1. 在 https://fontawesome.com 上搜索符号。例如 `USB 符号 <https://fontawesome.com/icons/usb?style=brands>`__。 复制其Unicode ID，本例中为 ``0xf287``。
2. 打开 `在线字体转换器 <https://lvgl.io/tools/fontconverter>`__。
   添加 `FontAwesome.woff <https://lvgl.io/assets/others/FontAwesome5-Solid+Brands+Regular.woff>`__。
3. 设置参数，如名称、大小、BPP。您将使用此名称在代码中声明和使用字体。
4. 将符号的Unicode ID添加到范围字段中。例如 ``0xf287`` 表示USB符号。更多符号可以用 ``,`` 列举出来。
5. 转换字体，并将生成的源代码复制到您的项目中。
   确保编译字体的.c文件。 
6. 使用 ``extern lv_font_t my_font_name;`` 声明字体，或者简单地使用 :cpp:expr:`LV_FONT_DECLARE(my_font_name)`.


**Using the symbol** （使用符号）

.. raw:: html

   <details>
     <summary>显示原文</summary>

1. Convert the Unicode value to UTF8, for example on
   `this site <http://www.ltg.ed.ac.uk/~richard/utf-8.cgi?input=f287&mode=hex>`__.
   For ``0xf287`` the *Hex UTF-8 bytes* are ``EF 8A 87``.
2. Create a ``define`` string from the UTF8 values: ``#define MY_USB_SYMBOL "\xEF\x8A\x87"``
3. Create a label and set the text. Eg. :cpp:expr:`lv_label_set_text(label, MY_USB_SYMBOL)`

:note: :cpp:expr:`lv_label_set_text(label, MY_USB_SYMBOL)` searches for this
       symbol in the font defined in ``style.text.font`` properties. To use the
       symbol you may need to change it. Eg ``style.text.font = my_font_name``


.. raw:: html

   </details>
   <br>


1. 转换Unicode值为UTF8，例如在 `这个网站 <http://www.ltg.ed.ac.uk/~richard/utf-8.cgi?input=f287&mode=hex>`__ 上。
对于 ``0xf287``， *Hex UTF-8 bytes* 为 ``EF 8A 87``。
2. 从UTF8值创建一个 ``define`` 字符串： ``#define MY_USB_SYMBOL "\xEF\x8A\x87"``
3. 创建一个标签并设置文本。例如：:cpp:expr:`lv_label_set_text(label, MY_USB_SYMBOL)`

:note: :cpp:expr:`lv_label_set_text(label, MY_USB_SYMBOL)` 在 ``style.text.font`` 属性中定义的字体中搜索此符号。
要使用该符号，您可能需要更改字体。例如 ``style.text.font = my_font_name``


Load a font at run-time（在运行时加载字体）
******************************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:func:`lv_binfont_create` can be used to load a font from a file. The font needs
to have a special binary format. (Not TTF or WOFF). Use
`lv_font_conv <https://github.com/lvgl/lv_font_conv/>`__ with the
``--format bin`` option to generate an LVGL compatible font file.

:note: To load a font :ref:`LVGL's filesystem <overview_file_system>`
       needs to be enabled and a driver must be added.

Example

.. code:: c

   lv_font_t *my_font = lv_binfont_create("X:/path/to/my_font.bin");
   if(my_font == NULL) return;

   /*Use the font*/

   /*Free the font if not required anymore*/
   lv_binfont_destroy(my_font);

.. raw:: html

   </details>
   <br>


:cpp:func:`lv_binfont_create` 函数可用于从文件加载字体。该字体需要具有特殊的二进制格式（不是TTF或WOFF）。
使用 `lv_font_conv <https://github.com/lvgl/lv_font_conv/>`__ 并使用 ``--format bin`` 选项来生成与LVGL兼容的字体文件。

注意：要加载字体，需要启用 :ref:`LVGL的文件系统 <overview_file_system>` 并添加一个驱动程序。

例如

.. code:: c

   lv_font_t *my_font = lv_binfont_create("X:/path/to/my_font.bin");
   if(my_font == NULL) return;

   /*使用字体*/

   /*如果不再需要字体，则释放字体*/
   lv_binfont_destroy(my_font);


Load a font from a memory buffer at run-time（从内存缓冲区在运行时加载字体）
**************************************************************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:func:`lv_binfont_create_from_buffer`:cpp:func:`lv_binfont_create_from_buffer` can be used to load a font from a memory buffer.
This function may be useful to load a font from an external file system, which is not
supported by LVGL. The font needs to be in the same format as if it were loaded from a file.

:note: To load a font from a buffer :ref:`LVGL's filesystem <overview_file_system>`
       needs to be enabled and the MEMFS driver must be added.

Example

.. code:: c

   lv_font_t *my_font;
   uint8_t *buf;
   uint32_t bufsize;

   /*Read font file into the buffer from the external file system*/
   ...

   /*Load font from the buffer*/
   my_font = lv_binfont_create_from_buffer((void *)buf, buf));
   if(my_font == NULL) return;
   /*Use the font*/

   /*Free the font if not required anymore*/
   lv_binfont_destroy(my_font);

.. raw:: html

   </details>
   <br>


:cpp:func:`lv_binfont_create_from_buffer` 可以用来从内存缓冲区加载字体。
这个函数可能会用来从外部文件系统加载字体，这是LVGL不支持的。
字体需要具有与从文件加载时相同的格式。

:注意: 要从缓冲区加载字体，需要启用 :ref:`LVGL's filesystem <overview_file_system>` 并添加MEMFS驱动。

示例

.. code:: c

   lv_font_t *my_font;
   uint8_t *buf;
   uint32_t bufsize;

   /*Read font file into the buffer from the external file system*/
   ...

   /*Load font from the buffer*/
   my_font = lv_binfont_create_from_buffer((void *)buf, buf));
   if(my_font == NULL) return;
   /*Use the font*/

   /*Free the font if not required anymore*/
   lv_binfont_destroy(my_font);


Use a BDF font（使用BDF字体）
****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Small displays with low resolution don't look pretty with automatically rendered fonts. A bitmap font provides
the solution, but it's necessary to convert the bitmap font (BDF) to a TTF.

.. raw:: html

   </details>
   <br>


小尺寸且分辨率低的显示屏使用自动渲染的字体看起来并不美观。位图字体提供了解决方案，但需要将位图字体（BDF）转换为TTF格式。


Convert BDF to TTF（将BDF转换为TTF）
-----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

BDF are bitmap fonts where fonts are not described in outlines but in pixels. BDF files can be used but
they must be converted into the TTF format via mkttf. This tool uses potrace to generate outlines from
the bitmap information. The bitmap itself will be embedded into the TTF as well. `lv_font_conv <https://github.com/lvgl/lv_font_conv/>`__ uses
the embedded bitmap but it also needs the outlines. One could think you can use a fake MS Bitmap
only sfnt (ttf) (TTF without outlines) created by fontforge but this will not work.

Install imagemagick, python3, python3-fontforge and potrace

On Ubuntu Systems, just type

.. code:: bash
    sudo apt install imagemagick python3-fontforge potrace
Clone mkttf

.. code:: bash
    git clone https://github.com/Tblue/mkttf
Read the mkttf docs.

Former versions of imagemagick needs the imagemagick call in front of convert, identify and so on.
But newer versions don't. So you might probably change 2 lines in potrace-wrapper.sh.
Open potrace-wrapper.sh and remove imagemagick from line 55 and line 64.

line 55

.. code:: bash
    wh=($(identify -format '%[width]pt %[height]pt' "${input?}"))
line 64

.. code:: bash
    convert "${input?}" -sample '1000%' - \
It might be necessary to change the mkttf.py script.

line 1

.. code:: bash
    #!/usr/bin/env python3


.. raw:: html

   </details>
   <br>


BDF是位图字体，其中的字体不是用轮廓描述的，而是用像素描述的。BDF文件可以使用，但它们必须通过mkttf转换为TTF格式。这个工具使用potrace从位图信息生成轮廓。位图本身也会嵌入到TTF中。 
`lv_font_conv <https://github.com/lvgl/lv_font_conv/>`__ 使用嵌入的位图，但它也需要轮廓。有人可能会认为你可以使用由fontforge创建的假MS Bitmap only sfnt（ttf）（没有轮廓的TTF），但这不会起作用。

安装imagemagick、python3、python3-fontforge和potrace

在Ubuntu系统上，只需输入

.. code:: bash
    sudo apt install imagemagick python3-fontforge potrace
克隆mkttf

.. code:: bash
    git clone https://github.com/Tblue/mkttf
阅读mkttf文档。

旧版本的imagemagick需要在convert、identify等前面加上imagemagick调用。但新版本不需要。你可能需要更改potrace-wrapper.sh中的2行。
打开potrace-wrapper.sh，从第55行和第64行删除imagemagick。

第55行

.. code:: bash
    wh=($(identify -format '%[width]pt %[height]pt' "${input?}"))
第64行

.. code:: bash
    convert "${input?}" -sample '1000%' - \
可能需要更改mkttf.py脚本。

第1行

.. code:: bash
    #!/usr/bin/env python3


Example for a 12px font（12像素字体示例）
----------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

.. code:: bash
    cd mkttf
    ./mkttf.py ./TerminusMedium-12-12.bdf
    Importing bitmaps from 0 additional fonts...
    Importing font `./TerminusMedium-12-12.bdf' into glyph background...
    Processing glyphs...
    Saving TTF file...
    Saving SFD file...
    Done!
The TTF TerminusMedium-001.000.ttf has been created from ./TerminusMedium-12-12.bdf.
Create font for lvgl
.. code:: bash
    lv_font_conv --bpp 1 --size 12 --no-compress --font TerminusMedium-001.000.ttf --range 0x20-0x7e,0xa1-0xff --format lvgl -o terminus_1bpp_12px.c
:note: use 1bpp because we don't use anti-aliasing. It doesn't look sharp on displays with a low resolution.

.. raw:: html

   </details>
   <br>


.. code:: bash
    cd mkttf
    ./mkttf.py ./TerminusMedium-12-12.bdf
    Importing bitmaps from 0 additional fonts...
    Importing font `./TerminusMedium-12-12.bdf' into glyph background...
    Processing glyphs...
    Saving TTF file...
    Saving SFD file...
    Done!
The TTF TerminusMedium-001.000.ttf has been created from ./TerminusMedium-12-12.bdf.
为lvgl创建字体
.. code:: bash
    lv_font_conv --bpp 1 --size 12 --no-compress --font TerminusMedium-001.000.ttf --range 0x20-0x7e,0xa1-0xff --format lvgl -o terminus_1bpp_12px.c
:n注意: 使用1bpp因为我们不使用抗锯齿。在分辨率低的显示屏上它看起来不够锐利。


Add a new font engine（添加新的字体引擎）
****************************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL's font interface is designed to be very flexible but, even so, you
can add your own font engine in place of LVGL's internal one. For
example, you can use `FreeType <https://www.freetype.org/>`__ to
real-time render glyphs from TTF fonts or use an external flash to store
the font's bitmap and read them when the library needs them.

A ready to use FreeType can be found in
`lv_freetype <https://github.com/lvgl/lv_lib_freetype>`__ repository.

To do this, a custom :cpp:type:`lv_font_t` variable needs to be created:

.. code:: c

   /*Describe the properties of a font*/
   lv_font_t my_font;
   my_font.get_glyph_dsc = my_get_glyph_dsc_cb;        /*Set a callback to get info about glyphs*/
   my_font.get_glyph_bitmap = my_get_glyph_bitmap_cb;  /*Set a callback to get bitmap of a glyph*/
   my_font.line_height = height;                       /*The real line height where any text fits*/
   my_font.base_line = base_line;                      /*Base line measured from the top of line_height*/
   my_font.dsc = something_required;                   /*Store any implementation specific data here*/
   my_font.user_data = user_data;                      /*Optionally some extra user data*/

   ...

   /* Get info about glyph of `unicode_letter` in `font` font.
    * Store the result in `dsc_out`.
    * The next letter (`unicode_letter_next`) might be used to calculate the width required by this glyph (kerning)
    */
   bool my_get_glyph_dsc_cb(const lv_font_t * font, lv_font_glyph_dsc_t * dsc_out, uint32_t unicode_letter, uint32_t unicode_letter_next)
   {
       /*Your code here*/

       /* Store the result.
        * For example ...
        */
       dsc_out->adv_w = 12;        /*Horizontal space required by the glyph in [px]*/
       dsc_out->box_h = 8;         /*Height of the bitmap in [px]*/
       dsc_out->box_w = 6;         /*Width of the bitmap in [px]*/
       dsc_out->ofs_x = 0;         /*X offset of the bitmap in [pf]*/
       dsc_out->ofs_y = 3;         /*Y offset of the bitmap measured from the as line*/
       dsc_out->format= LV_FONT_GLYPH_FORMAT_A2;

       return true;                /*true: glyph found; false: glyph was not found*/
   }


   /* Get the bitmap of `unicode_letter` from `font`. */
   const uint8_t * my_get_glyph_bitmap_cb(const lv_font_t * font, uint32_t unicode_letter)
   {
       /* Your code here */

       /* The bitmap should be a continuous bitstream where
        * each pixel is represented by `bpp` bits */

       return bitmap;    /*Or NULL if not found*/
   }

.. raw:: html

   </details>
   <br>


LVGL的字体接口设计非常灵活，但即使如此，你也可以在LVGL的内部引擎之外添加自己的字体引擎。
例如，你可以使用 `FreeType <https://www.freetype.org/>`__ 实时渲染TTF字体的字形，或者使用外部flash来存储字体的位图，并在库需要时读取它们。

可以在 `lv_freetype <https://github.com/lvgl/lv_lib_freetype>`__ 存储库中找到一个可直接使用的FreeType。

要实现这一点，需要创建一个自定义的 :cpp:type:`lv_font_t` 变量：

.. code:: c

   /*描述字体的属性*/
   lv_font_t my_font;
   my_font.get_glyph_dsc = my_get_glyph_dsc_cb;        /*设置一个回调来获取关于字形的信息*/
   my_font.get_glyph_bitmap = my_get_glyph_bitmap_cb;  /*设置一个回调来获取字形的位图*/
   my_font.line_height = height;                       /*实际的行高度，适合任何文本*/
   my_font.base_line = base_line;                      /*从行高度顶部测量的基线*/
   my_font.dsc = something_required;                   /*在这里存储任何实现特定的数据*/
   my_font.user_data = user_data;                      /*可选的一些额外的用户数据*/

   ...

   /* 获取`font`字体中 `unicode_letter` 的字形信息。
    * 将结果存储在 `dsc_out` 中。
    * 下一个字母（`unicode_letter_next`）可能用于计算该字形所需的宽度（字距）。
    */
   bool my_get_glyph_dsc_cb(const lv_font_t * font, lv_font_glyph_dsc_t * dsc_out, uint32_t unicode_letter, uint32_t unicode_letter_next)
   {
       /*你的代码在这里*/

       /* 存储结果。
        * 例如 ...
        */
       dsc_out->adv_w = 12;        /*[px]中字形所需的水平空间*/
       dsc_out->box_h = 8;         /*[px]中位图的高度*/
       dsc_out->box_w = 6;         /*[px]中位图的宽度*/
       dsc_out->ofs_x = 0;         /*[pf]中位图的X偏移量*/
       dsc_out->ofs_y = 3;         /*从底线测量的位图的Y偏移量*/
       dsc_out->format= LV_FONT_GLYPH_FORMAT_A2;

       return true;                /*true: 找到了字形；false: 未找到字形*/
   }


   /* 从 `font` 中获取 `unicode_letter` 的位图。 */
   const uint8_t * my_get_glyph_bitmap_cb(const lv_font_t * font, uint32_t unicode_letter)
   {
       /* 你的代码在这里 */

       /* 位图应该是一个连续的比特流，其中
        * 每个像素由 `bpp` 位表示 */

       return bitmap;    /*如果未找到，则返回NULL*/
   }


Use font fallback（使用字体回退）
********************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can specify ``fallback`` in :cpp:type:`lv_font_t` to provide fallback to the
font. When the font fails to find glyph to a letter, it will try to let
font from ``fallback`` to handle.

``fallback`` can be chained, so it will try to solve until there is no ``fallback`` set.

.. code:: c

   /* Roboto font doesn't have support for CJK glyphs */
   lv_font_t *roboto = my_font_load_function();
   /* Droid Sans Fallback has more glyphs but its typeface doesn't look good as Roboto */
   lv_font_t *droid_sans_fallback = my_font_load_function();
   /* So now we can display Roboto for supported characters while having wider characters set support */
   roboto->fallback = droid_sans_fallback;

.. raw:: html

   </details>
   <br>


你可以在 :cpp:type:`lv_font_t` 中指定 ``fallback`` 来提供对字体的备用支持。当字体无法找到某个字母的字形时，它会尝试使用 ``fallback`` 中的字体来处理。

``fallback`` 可以被链式调用，因此它会一直尝试解决，直到没有设置 ``fallback`` 为止。

.. code:: c

   /* Roboto 字体不支持CJK字形 */
   lv_font_t *roboto = my_font_load_function();
   /* Droid Sans Fallback 有更多的字形，但其字体类型不如Roboto好看 */
   lv_font_t *droid_sans_fallback = my_font_load_function();
   /* 现在我们可以在支持字符的同时展示Roboto，同时拥有更广泛的字符支持 */
   roboto->fallback = droid_sans_fallback;

   
.. _fonts_api:

API
***
