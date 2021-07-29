```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/overview/font.md
```
# Fonts（字体）

<details>
<summary>查看原文</summary>
<p>

In LVGL fonts are collections of bitmaps and other information required to render the images of the letters (glyph). 
A font is stored in a `lv_font_t` variable and can be set in a style's *text_font* field. For example:
 
</p>
</details>

在 LVGL 中，字体是渲染字母（字形）图像所需的位图和其他信息的集合。
字体存储在 `lv_font_t` 变量中，可以在样式的 *text_font* 字段中设置。例如：

```c
lv_style_set_text_font(&my_style, LV_STATE_DEFAULT, &lv_font_montserrat_28);  /*Set a larger font*/
```

<details>
<summary>查看原文</summary>
<p>

The fonts have a **bpp (bits per pixel)** property. It shows how many bits are used to describe a pixel in the font. The value stored for a pixel determines the pixel's opacity.
This way, with higher *bpp*, the edges of the letter can be smoother. The possible *bpp* values are 1, 2, 4 and 8 (higher value means better quality).

The *bpp* also affects the required memory size to store the font. For example, *bpp = 4* makes the font nearly 4 times larger compared to *bpp = 1*.  
 
</p>
</details>

字体具有 **bpp（每像素位数）** 属性。它显示了使用多少位来描述字体中的像素。为像素存储的值决定了像素的不透明度。
这样，使用更高的 *bpp*，字母的边缘可以更平滑。可能的 *bpp* 值为 1、2、4 和 8（值越高表示质量越好）。

*bpp* 还会影响存储字体所需的内存大小。例如，*bpp = 4* 使字体比 *bpp = 1* 大近 4 倍。

## Unicode support（支持Unicode编码）

<details>
<summary>查看原文</summary>
<p>

LVGL supports **UTF-8** encoded Unicode characters.
Your editor needs to be configureed to save your code/text as UTF-8 (usually this the default) and be sure that, `LV_TXT_ENC` is set to `LV_TXT_ENC_UTF8` in *lv_conf.h*. (This is the default value)

To test it try
 
</p>
</details>

LVGL 支持 **UTF-8** 编码的 Unicode 字符。
您的编辑器需要配置为将您的代码/文本保存为 UTF-8（通常这是默认值），并确保在 *lv_conf.h* 中将 `LV_TXT_ENC` 设置为 `LV_TXT_ENC_UTF8`。 （这是默认值）

要测试它，请参考这个用法：

```c
lv_obj_t * label1 = lv_label_create(lv_scr_act(), NULL);
lv_label_set_text(label1, LV_SYMBOL_OK);
```

<details>
<summary>查看原文</summary>
<p>

If all works well, a ✓ character should be displayed.
 
</p>
</details>

如果一切正常，应显示 ✓ 字符。

## Built-in fonts（内置字体）

<details>
<summary>查看原文</summary>
<p>

There are several built-in fonts in different sizes, which can be enabled in `lv_conf.h` by *LV_FONT_...* defines.
 
</p>
</details>

有几种不同大小的内置字体，可以通过 *LV_FONT_...* 定义在 `lv_conf.h` 中启用。

### Normal fonts（普通字体）

<details>
<summary>查看原文</summary>
<p>

Containing all the ASCII characters, the degree symbol (U+00B0), the bullet symbol (U+2022) and the built-in symbols (see below).
- `LV_FONT_MONTSERRAT_12` 12 px font
- `LV_FONT_MONTSERRAT_14` 14 px font
- `LV_FONT_MONTSERRAT_16` 16 px font
- `LV_FONT_MONTSERRAT_18` 18 px font
- `LV_FONT_MONTSERRAT_20` 20 px font
- `LV_FONT_MONTSERRAT_22` 22 px font
- `LV_FONT_MONTSERRAT_24` 24 px font
- `LV_FONT_MONTSERRAT_26` 26 px font
- `LV_FONT_MONTSERRAT_28` 28 px font
- `LV_FONT_MONTSERRAT_30` 30 px font
- `LV_FONT_MONTSERRAT_32` 32 px font
- `LV_FONT_MONTSERRAT_34` 34 px font
- `LV_FONT_MONTSERRAT_36` 36 px font
- `LV_FONT_MONTSERRAT_38` 38 px font
- `LV_FONT_MONTSERRAT_40` 40 px font
- `LV_FONT_MONTSERRAT_42` 42 px font
- `LV_FONT_MONTSERRAT_44` 44 px font
- `LV_FONT_MONTSERRAT_46` 46 px font
- `LV_FONT_MONTSERRAT_48` 48 px font
 
</p>
</details>

包含所有 ASCII 字符、度数符号 (U+00B0)、子弹符号 (U+2022) 和内置符号（见下文）。
- `LV_FONT_MONTSERRAT_12` 12 像素字体
- `LV_FONT_MONTSERRAT_14` 14 像素字体
- `LV_FONT_MONTSERRAT_16` 16 像素字体
- `LV_FONT_MONTSERRAT_18` 18 像素字体
- `LV_FONT_MONTSERRAT_20` 20 像素字体
- `LV_FONT_MONTSERRAT_22` 22 像素字体
- `LV_FONT_MONTSERRAT_24` 24 像素字体
- `LV_FONT_MONTSERRAT_26` 26 像素字体
- `LV_FONT_MONTSERRAT_28` 28 像素字体
- `LV_FONT_MONTSERRAT_30` 30 像素字体
- `LV_FONT_MONTSERRAT_32` 32 像素字体
- `LV_FONT_MONTSERRAT_34` 34 像素字体
- `LV_FONT_MONTSERRAT_36` 36 像素字体
- `LV_FONT_MONTSERRAT_38` 38 像素字体
- `LV_FONT_MONTSERRAT_40` 40 像素字体
- `LV_FONT_MONTSERRAT_42` 42 像素字体
- `LV_FONT_MONTSERRAT_44` 44 像素字体
- `LV_FONT_MONTSERRAT_46` 46 像素字体
- `LV_FONT_MONTSERRAT_48` 48 像素字体

### Special fonts（特殊字体）

<details>
<summary>查看原文</summary>
<p>

- `LV_FONT_MONTSERRAT_12_SUBPX` Same as normal 12 px font but with [subpixel rendering](#subpixel-rendering) 
- `LV_FONT_MONTSERRAT_28_COMPRESSED` Same as normal 28 px font but  [compressed font](#compress-fonts) with 3 bpp
- `LV_FONT_DEJAVU_16_PERSIAN_HEBREW` 16 px font with normal range + Hebrew, Arabic, Persian letters and all their forms
- `LV_FONT_SIMSUN_16_CJK`16 px font with normal range + 1000 most common CJK radicals
- `LV_FONT_UNSCII_8` 8 px pixel perfect font with only ASCII characters
- `LV_FONT_UNSCII_16` 16 px pixel perfect font with only ASCII characters


The built-in fonts are **global variables** with names like `lv_font_montserrat_16` for a 16 px hight font. To use them in a style, just add a pointer to a font variable like shown above.

The built-in fonts with *bpp = 4* contain the ASCII characters and use the [Montserrat](https://fonts.google.com/specimen/Montserrat) font.

In addition to the ASCII range, the following symbols are also added to the built-in fonts from the [FontAwesome](https://fontawesome.com/) font.
 
</p>
</details>

- `LV_FONT_MONTSERRAT_12_SUBPX` 与普通 12 px 字体相同，但具有 [子像素渲染](#subpixel-rendering)
- `LV_FONT_MONTSERRAT_28_COMPRESSED` 与普通 28 px 字体相同，但 [压缩字体](#compress-fonts) 为 3 bpp
- `LV_FONT_DEJAVU_16_PERSIAN_HEBREW` 16 px 字体，正常范围 + 希伯来语、阿拉伯语、波斯语字母及其所有形式
- `LV_FONT_SIMSUN_16_CJK`16 px 字体，正常范围 + 1000 个最常见的 CJK 部首
- `LV_FONT_UNSCII_8` 8 px 像素完美字体，只有 ASCII 字符
- `LV_FONT_UNSCII_16` 16 px 像素完美字体，只有 ASCII 字符

内置字体是**全局变量**，其名称类似于 16 像素高字体的“lv_font_montserrat_16”。要在样式中使用它们，只需添加一个指向字体变量的指针，如上所示。

*bpp = 4* 的内置字体包含 ASCII 字符并使用 [Montserrat](https://fonts.google.com/specimen/Montserrat) 字体。

除了 ASCII 范围外，以下符号还添加到 [FontAwesome](https://fontawesome.com/) 字体的内置字体中。


![](/misc/symbols.png "Built-in Symbols in LVGL")


<details>
<summary>查看原文</summary>
<p>

The symbols can be used as:
 
</p>
</details>

这些符号可以这样使用：

```c
lv_label_set_text(my_label, LV_SYMBOL_OK);
```

<details>
<summary>查看原文</summary>
<p>

Or with together with strings:
 
</p>
</details>

或与字符串一起使用：

```c
lv_label_set_text(my_label, LV_SYMBOL_OK "Apply");
```

<details>
<summary>查看原文</summary>
<p>

Or more symbols together:
 
</p>
</details>

一个或多个符号组合在一起：

```c
lv_label_set_text(my_label, LV_SYMBOL_OK LV_SYMBOL_WIFI LV_SYMBOL_PLAY);
```

## Special features（特殊功能）

### Bidirectional support（双向支持）

<details>
<summary>查看原文</summary>
<p>

Most of the languages use Left-to-Right (LTR for short) writing direction, however some languages (such as Hebrew, Persian or Arabic) uses Right-to-Left (RTL for short) direction. 

LVGL not only supports RTL texts but supports mixed (a.k.a. bidirectional, BiDi) text rendering too. Some examples:
 
</p>
</details>

大多数语言使用从左到右（简称 LTR）书写方向，但是一些语言（例如希伯来语、波斯语或阿拉伯语）使用从右到左（简称 RTL）方向。

LVGL 不仅支持 RTL 文本，还支持混合（又名双向，BiDi）文本渲染。一些例子：

![](/misc/bidi.png "Bidirectional text examples")

<details>
<summary>查看原文</summary>
<p>

BiDi support is enabled by `LV_USE_BIDI` in *lv_conf.h*

All texts have a base direction (LTR or RTL) which determines some rendering rules and the default alignment of the text (Left or Right).
However, in LVGL, base direction is applied not only for labels. It's a general property which can be set for every object. 
If unset then it will be inherited from the parent. 
So it's enough to set the base direction of the screen and every object will inherit it.

The default base direction of screen can be set by `LV_BIDI_BASE_DIR_DEF` in *lv_conf.h* and other objects inherit the base direction from their parent.
 
</p>
</details>

BiDi 支持由 *lv_conf.h* 中的 `LV_USE_BIDI` 启用

所有文本都有一个基本方向（LTR 或 RTL），它决定了一些渲染规则和文本的默认对齐方式（左或右）。
然而，在 LVGL 中，基本方向不仅适用于标签。这是一个可以为每个对象设置的通用属性。
如果未设置，则它将从父级继承。
所以设置屏幕的基本方向就足够了，每个对象都会继承它。

屏幕的默认基本方向可以通过*lv_conf.h* 中的`LV_BIDI_BASE_DIR_DEF` 设置，其他对象从其父对象继承基本方向。

<details>
<summary>查看原文</summary>
<p>

To set an object's base direction use `lv_obj_set_base_dir(obj, base_dir)`.  The possible base direction are:
- `LV_BIDI_DIR_LTR`: Left to Right base direction
- `LV_BIDI_DIR_RTL`: Right to Left base direction
- `LV_BIDI_DIR_AUTO`: Auto detect base direction
- `LV_BIDI_DIR_INHERIT`: Inherit the base direction from the parent (default for non-screen objects)

This list summarizes the effect of RTL base direction on objects:
- Create objects by default on the right
- `lv_tabview`: displays tabs from right to left
- `lv_checkbox`: Show the box on the right
- `lv_btnmatrix`: Show buttons from right to left
- `lv_list`: Show the icon on the right
- `lv_dropdown`: Align the options to the right
- The texts in `lv_table`, `lv_btnmatrix`, `lv_keyboard`, `lv_tabview`, `lv_dropdown`, `lv_roller` are "BiDi processed" to be displayed correctly
 
</p>
</details>

要设置对象的基本方向，请使用 `lv_obj_set_base_dir(obj, base_dir)`。可能的基本方向是：
- `LV_BIDI_DIR_LTR`：从左到右的基本方向
- `LV_BIDI_DIR_RTL`：从右到左的基本方向
- `LV_BIDI_DIR_AUTO`：自动检测基本方向
- `LV_BIDI_DIR_INHERIT`：从父级继承基本方向（非屏幕对象的默认值）

此列表总结了 RTL 基本方向对对象的影响：
- 默认在右侧创建对象
- `lv_tabview`：从右到左显示标签
- `lv_checkbox`：显示右侧的框
- `lv_btnmatrix`：从右到左显示按钮
- `lv_list`：在右侧显示图标
- `lv_dropdown`：将选项向右对齐
- `lv_table`、`lv_btnmatrix`、`lv_keyboard`、`lv_tabview`、`lv_dropdown`、`lv_roller` 中的文本是“BiDi 处理”以正确显示

### Arabic and Persian support(阿拉伯语和波斯语支持)

<details>
<summary>查看原文</summary>
<p>

There are some special rules to display Arabic and Persian characters: the *form* of the character depends on their position in the text. 
A different form of the same letter needs to be used if it isolated, start, middle or end position. Besides these some conjunction rules also should be taken into account.

LVGL supports to apply these rules if `LV_USE_ARABIC_PERSIAN_CHARS` is enabled.  
 
</p>
</details>

显示阿拉伯语和波斯语字符有一些特殊规则：字符的*形式*取决于它们在文本中的位置。
如果同一个字母是孤立的、开始的、中间的或结束的位置，则需要使用不同形式的相同字母。除了这些，还应该考虑一些连词规则。

如果启用了“LV_USE_ARABIC_PERSIAN_CHARS”，LVGL 支持应用这些规则。

<details>
<summary>查看原文</summary>
<p>

However, there some limitations:
- Only displaying texts is supported (e.g. on labels), text inputs (e.g. text area) don't support this feature.
- Static text (i.e. const) is not processed. E.g. texts set by `lv_label_set_text()` will be "Arabic processed" but `lv_lable_set_text_static()` won't.
- Text get functions (e.g. `lv_label_get_text()`) will return the processed text. 
 
</p>
</details>

但是，有一些限制：
- 仅支持显示文本（例如在标签上），文本输入（例如文本区域）不支持此功能。
- 不处理静态文本（即 const）。例如。 `lv_label_set_text()` 设置的文本将是“阿拉伯语处理”，但 `lv_lable_set_text_static()` 不会。
- 文本获取函数（例如`lv_label_get_text()`）将返回处理后的文本。

### Subpixel rendering（亚像素渲染）

<details>
<summary>查看原文</summary>
<p>

Subpixel rendering allows for tripling the horizontal resolution by rendering on Red, Green and Blue channel instead of pixel level. This takes advantage of the position of physical color channels of each pixel, resulting in higher quality letter anti-aliasing. Learn more [here](https://en.wikipedia.org/wiki/Subpixel_rendering).

For subpixel rendering the fonts need to be generated with special settings: 
- In the online converter tick the `Subpixel` box
- In the command line tool use `--lcd` flag. Note that the generated font needs about 3 times more memory.

Subpixel rendering works only if the color channels of the pixels have a horizontal layout. That is the R, G, B channels are next each other and not above each other. 
The order of color channels also needs to match with the library settings. By default LVGL assumes `RGB` order, however this can be swapped by setting `LV_SUBPX_BGR  1` in *lv_conf.h*.
 
</p>
</details>

亚像素渲染通过在红色、绿色和蓝色通道（而不是像素级）上渲染，允许将水平分辨率提高三倍。这将利用每个像素的物理颜色通道的位置，从而实现更高质量的字母消除混叠。了解更多[此处](https://en.wikipedia.org/wiki/Subpixel_rendering).

对于亚像素渲染，需要使用特殊设置生成字体：
-在在线转换器中，勾选“亚像素”框
-在命令行工具中，使用“---lcd”标志。请注意，生成的字体需要大约3倍的内存。

仅当像素的颜色通道具有水平布局时，子像素渲染才起作用。也就是说，R、G、B通道彼此相邻，而不是彼此上方。
颜色通道的顺序也需要与库设置相匹配。默认情况下，LVGL采用“RGB”顺序，但这可以通过在*LV_conf.h*中设置“LV_SUBPX_BGR 1”进行交换。

### Compress fonts（压缩字体）

<details>
<summary>查看原文</summary>
<p>

The bitmaps of the fonts can be compressed by 
- ticking the `Compressed` check box in the online converter
- not passing `--no-compress` flag to the offline converter (compression is applied by default) 

The compression is more effective with larger fonts and higher bpp. However, it's about 30% slower to render the compressed fonts.
Therefore it's recommended to compress only the largest fonts of user interface, because
- they need the most memory 
- they can be compressed better
- and probably they are used less frequently then the medium sized fonts, so the performance cost is smaller.
 
</p>
</details>

字体的位图可以通过以下方式压缩
- 勾选在线转换器中的“压缩”复选框
- 不将 `--no-compress` 标志传递给离线转换器（默认情况下应用压缩）

对于更大的字体和更高的 bpp，压缩更有效。但是，渲染压缩字体的速度要慢 30% 左右。
因此建议只压缩用户界面的最大字体，因为
- 他们需要最多的内存
- 它们可以被更好地压缩
- 可能它们的使用频率低于中等字体，因此性能成本更小。

## Add new font（添加新字体）

<details>
<summary>查看原文</summary>
<p>

There are several ways to add a new font to your project:
1. The simplest method is to use the [Online font converter](https://lvgl.io/tools/fontconverter). Just set the parameters, click the *Convert* button, copy the font to your project and use it. **Be sure to carefully read the steps provided on that site or you will get an error while converting.**
2. Use the [Offline font converter](https://github.com/lvgl/lv_font_conv). (Requires Node.js to be installed)
3. If you want to create something like the built-in fonts (Roboto font and symbols) but in different size and/or ranges, you can use the `built_in_font_gen.py` script in `lvgl/scripts/built_in_font` folder.
(This requires Python and `lv_font_conv` to be installed)

To declare the font in a file, use `LV_FONT_DECLARE(my_font_name)`.

To make the fonts globally available (like the builtin fonts), add them to `LV_FONT_CUSTOM_DECLARE` in *lv_conf.h*.
 
</p>
</details>

有几种方法可以将新字体添加到您的项目中：
1. 最简单的方法是使用【在线字体转换器】(https://lvgl.io/tools/fontconverter)。只需设置参数，单击*Convert* 按钮，将字体复制到您的项目并使用它。 **请务必仔细阅读该网站上提供的步骤，否则转换时会出错。**
2. 使用【离线字体转换器】(https://github.com/lvgl/lv_font_conv)。 （需要安装 Node.js）
3. 如果您想创建类似内置字体（Roboto 字体和符号）但大小和/或范围不同的内容，您可以使用 `lvgl/scripts/built_in_font` 文件夹中的 `built_in_font_gen.py` 脚本。
（这需要安装 Python 和 `lv_font_conv`）

要在文件中声明字体，请使用`LV_FONT_DECLARE(my_font_name)`。

要使字体全局可用（如内置字体），请将它们添加到 *lv_conf.h* 中的 `LV_FONT_CUSTOM_DECLARE`。

## Add new symbols（添加新符号）

<details>
<summary>查看原文</summary>
<p>

The built-in symbols are created from the [FontAwesome](https://fontawesome.com/) font. 

1. Search symbol on [https://fontawesome.com](https://fontawesome.com). For example the [USB symbol](https://fontawesome.com/icons/usb?style=brands). Copy it's Unicode ID which is `0xf287` in this case.
2. Open the [Online font converter](https://lvgl.io/tools/fontconverter). Add Add [FontAwesome.woff](https://lvgl.io/assets/others/FontAwesome5-Solid+Brands+Regular.woff). . 
3. Set the parameters such as Name, Size, BPP. You'll use this name to declare and use the font in your code.
4. Add the Unicode ID of the symbol to the range field. E.g.` 0xf287` for the USB symbol. More symbols can be enumerated with `,`.
5. Convert the font and copy it to your project. Make sure to compile the .c file of your font.
6. Declare the font using `extern lv_font_t my_font_name;` or simply `LV_FONT_DECLARE(my_font_name);`.

**Using the symbol**

</p>
</details>

内置符号是从 [FontAwesome](https://fontawesome.com/) 字体创建的。

1. 在[https://fontawesome.com](https://fontawesome.com)上搜索符号。例如 [USB 符号](https://fontawesome.com/icons/usb?style=brands)。复制它的 Unicode ID，在本例中为“0xf287”。
2. 打开【在线字体转换器】(https://lvgl.io/tools/fontconverter)。添加 添加 [FontAwesome.woff](https://lvgl.io/assets/others/FontAwesome5-Solid+Brands+Regular.woff)。 .
3. 设置Name、Size、BPP等参数。您将使用此名称在代码中声明和使用字体。
4. 将符号的 Unicode ID 添加到范围字段中。例如，USB 符号的` 0xf287`。更多的符号可以用`,`来枚举。
5. 转换字体并将其复制到您的项目中。确保编译字体的 .c 文件。
6. 使用`extern lv_font_t my_font_name;` 或简单的`LV_FONT_DECLARE(my_font_name);`声明字体。

**使用符号**


<details>
<summary>查看原文</summary>
<p>

1. Convert the Unicode value to UTF8, for example on [this site](http://www.ltg.ed.ac.uk/~richard/utf-8.cgi?input=f287&mode=hex). For `0xf287` the *Hex UTF-8 bytes* are `EF 8A 87`.
2. Create a `define` from the UTF8 values: `#define MY_USB_SYMBOL "\xEF\x8A\x87"`
3. Create a label and set the text. Eg. `lv_label_set_text(label, MY_USB_SYMBOL)`

Note - `lv_label_set_text(label, MY_USB_SYMBOL)` searches for this symbol in the font defined in `style.text.font` properties. To use the symbol you may need to change it. Eg ` style.text.font = my_font_name` 
 
</p>
</details>

1. 将Unicode 值转换为UTF8，例如在[本站](http://www.ltg.ed.ac.uk/~richard/utf-8.cgi?input=f287&mode=hex)。对于`0xf287`，*Hex UTF-8 字节* 是`EF 8A 87`。
2. 从 UTF8 值创建一个 `define`：`#define MY_USB_SYMBOL "\xEF\x8A\x87"`
3. 创建标签并设置文本。例如。 `lv_label_set_text（标签，MY_USB_SYMBOL）`

注意 - `lv_label_set_text(label, MY_USB_SYMBOL)` 在 `style.text.font` 属性中定义的字体中搜索此符号。要使用该符号，您可能需要对其进行更改。例如` style.text.font = my_font_name`

## Load font at run-time（在运行时加载字体）

<details>
<summary>查看原文</summary>
<p>

`lv_font_load` can be used to load a font from a file. The font to load needs to have a special binary format. (Not TTF or WOFF). 
Use [lv_font_conv](https://github.com/lvgl/lv_font_conv/) with `--format bin` option to generate an LVGL compatible font file.

Note that to load a font [LVGL's filesystem](/overview/file-system) needs to be enabled and a driver needs to be added.

Example
 
</p>
</details>

`lv_font_load` 可用于从文件加载字体。要加载的字体需要具有特殊的二进制格式。 （不是 TTF 或 WOFF）。
使用 [lv_font_conv](https://github.com/lvgl/lv_font_conv/) 和 `--format bin` 选项来生成 LVGL 兼容字体文件。

请注意，要加载字体 [LVGL 的文件系统](/overview/file-system) 需要启用，并且需要添加驱动程序。

例子

```c
lv_font_t * my_font;
my_font = lv_font_load(X/path/to/my_font.bin);

/*Use the font*/

/*Free the font if not required anymore*/
lv_font_free(my_font);
```


## Add a new font engine（添加新的字体引擎）

<details>
<summary>查看原文</summary>
<p>

LVGL's font interface is designed to be very flexible.
But even so you don't need to use LVGL's internal font engine: you can add your own.
For example, use [FreeType](https://www.freetype.org/) to real-time render glyphs from TTF fonts or use an external flash to store the font's bitmap and read them when the library needs them.

A ready to use FreeType can be found in [lv_freetype](https://github.com/lvgl/lv_lib_freetype) repository.

To do this a custom `lv_font_t` variable needs to be created:
 
</p>
</details>

LVGL 的字体界面设计得非常灵活。
但即便如此，您也不需要使用 LVGL 的内部字体引擎：您可以添加自己的字体引擎。
例如，使用 [FreeType](https://www.freetype.org/) 从 TTF 字体实时渲染字形或使用外部闪存存储字体的位图并在库需要时读取它们。

可以在 [lv_freetype](https://github.com/lvgl/lv_lib_freetype) 存储库中找到准备使用的 FreeType。

为此，需要创建一个自定义的 `lv_font_t` 变量：

```c
/*Describe the properties of a font*/
lv_font_t my_font;
my_font.get_glyph_dsc = my_get_glyph_dsc_cb;        /*Set a callback to get info about gylphs*/
my_font.get_glyph_bitmap = my_get_glyph_bitmap_cb;  /*Set a callback to get bitmap of a glyp*/
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
    dsc_out->bpp   = 2;         /*Bits per pixel: 1/2/4/8*/

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
```
