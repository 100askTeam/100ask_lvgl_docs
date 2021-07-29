```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/overview/color.md
```
# Colors（颜色）

<details>
<summary>查看原文</summary>
<p>

The color module handles all color-related functions like changing color depth, creating colors from hex code, converting between color depths, mixing colors, etc.

`lv_color_t` is used to store a color, its fileds are set according to `LV_COLOR_DEPTH` in `lv_conf.h`. (See below)

You may set `LV_COLOR_16_SWAP` in `lv_conf.h` to swap the bytes of *RGB565* colors. You may need this to send the 16-bit colors via a byte-oriented interface like SPI. As 16-bit numbers are stored in Little Endian format (lower byte on the lower address), the interface will send the lower byte first. However, displays usually need the higher byte first. A mismatch in the byte order will result in highly distorted colors.
 
</p>
</details>

颜色模块处理所有与颜色相关的功能，如更改颜色深度、从十六进制代码创建颜色、颜色深度之间的转换、混合颜色等。

`lv_color_t` 用于存储颜色，其字段根据 `lv_conf.h` 中的 `LV_COLOR_DEPTH` 设置。 （见下文）

你可以在 `lv_conf.h` 中设置 `LV_COLOR_16_SWAP` 来交换 *RGB565* 颜色的字节。您可能需要它来通过面向字节的接口（如 SPI）发送 16 位颜色。由于 16 位数字以 Little Endian 格式存储（低位字节在低位地址），因此接口将首先发送低位字节。但是，显示器通常首先需要较高的字节。字节顺序不匹配将导致颜色高度失真。

## Creating colors（创造色彩）

### RGB（三原色）

<details>
<summary>查看原文</summary>
<p>

Create colors from Red, Green and Blue channel values
 
</p>
</details>

从红色、绿色和蓝色通道值创建颜色

```c
//All channels are 0-255
lv_color_t c = lv_color_make(red, green, blue);

//From hex code 0x000000..0xFFFFFF interpreted as RED + GREEN + BLUE
lv_color_t c = lv_color_hex(0x123456); 

//From 3 digits. Same as lv_color_hex(0x112233)
lv_color_t c = lv_color_hex3(0x123); 
```

### HSV（色调饱和值-Hue Saturation Value）

<details>
<summary>查看原文</summary>
<p>

Create colors from Hue, Saturation and Value values
 
</p>
</details>

根据色相、饱和度和值创建颜色

```c
//h = 0..359, s = 0..100, v = 0..100
lv_color_t c = lv_color_hsv_to_rgb(h, s, v);

//All channels are 0-255
lv_color_hsv_t c_hsv = lv_color_rgb_to_hsv(r, g, b);


//From lv_color_t variable
lv_color_hsv_t c_hsv = lv_color_to_hsv(color);
```

### Palette（调色板）

<details>
<summary>查看原文</summary>
<p>

LVGL includes [material design's palette](https://vuetifyjs.com/en/styles/colors/#material-colors). In this all color have a main as well as four darker and five lighter variants.

The names of the colors are as follows:
- `LV_PALETTE_RED`
- `LV_PALETTE_PINK`
- `LV_PALETTE_PURPLE`
- `LV_PALETTE_DEEP_PURPLE`
- `LV_PALETTE_INDIGO`
- `LV_PALETTE_BLUE`
- `LV_PALETTE_LIGHT_BLUE`
- `LV_PALETTE_CYAN`
- `LV_PALETTE_TEAL`
- `LV_PALETTE_GREEN`
- `LV_PALETTE_LIGHT_GREEN`
- `LV_PALETTE_LIME`
- `LV_PALETTE_YELLOW`
- `LV_PALETTE_AMBER`
- `LV_PALETTE_ORANGE`
- `LV_PALETTE_DEEP_ORANGE`
- `LV_PALETTE_BROWN`
- `LV_PALETTE_BLUE_GREY`
- `LV_PALETTE_GREY`
 
</p>
</details>

LVGL 包括[材料设计的调色板](https://vuetifyjs.com/en/styles/colors/#material-colors)。在此所有颜色都有一个主要的以及四个较深的变体和五个较浅的变体。

颜色名称如下：
- `LV_PALETTE_RED`
- `LV_PALETTE_PINK`
- `LV_PALETTE_PURPLE`
- `LV_PALETTE_DEEP_PURPLE`
- `LV_PALETTE_INDIGO`
- `LV_PALETTE_BLUE`
- `LV_PALETTE_LIGHT_BLUE`
- `LV_PALETTE_CYAN`
- `LV_PALETTE_TEAL`
- `LV_PALETTE_GREEN`
- `LV_PALETTE_LIGHT_GREEN`
- `LV_PALETTE_LIME`
- `LV_PALETTE_YELLOW`
- `LV_PALETTE_AMBER`
- `LV_PALETTE_ORANGE`
- `LV_PALETTE_DEEP_ORANGE`
- `LV_PALETTE_BROWN`
- `LV_PALETTE_BLUE_GREY`
- `LV_PALETTE_GREY`


<details>
<summary>查看原文</summary>
<p>

To get the main color use `lv_color_t c = lv_palette_main(LV_PALETTE_...)`.

For the lighter variants of a palette color use `lv_color_t c = lv_palette_lighten(LV_PALETTE_..., v)`. `v` can be 1..5.
For the darker variants of a palette color use `lv_color_t c = lv_palette_darken(LV_PALETTE_..., v)`. `v` can be 1..4.
 
</p>
</details>

要获得主要颜色，请使用 `lv_color_t c = lv_palette_main(LV_PALETTE_...)`。

对于调色板颜色的较浅变体，请使用`lv_color_t c = lv_palette_lighten(LV_PALETTE_..., v)`。 `v` 可以是 1..5。

对于调色板颜色的较暗变体，请使用`lv_color_t c = lv_palette_darken(LV_PALETTE_..., v)`。 `v` 可以是 1..4。

### Modify and mix colors（修改和混合颜色）

<details>
<summary>查看原文</summary>
<p>

The following functions can modify a color:
 
</p>
</details>

以下函数可以修改颜色：

```c
// Lighten a color. 0: no change, 255: white
lv_color_t c = lv_color_lighten(c, lvl);

// Darken a color. 0: no change, 255: black
lv_color_t c = lv_color_darken(lv_color_t c, lv_opa_t lvl);

// Lighten or darken a color. 0: black, 128: no change 255: black
lv_color_t c = lv_color_change_lightness(lv_color_t c, lv_opa_t lvl);


// Mix 2 colors with a given ratio 0: full c2, 255: full c1, 128: half c1 and half c2
lv_color_t c = lv_color_mix(c1, c2, ratio);
```

### Built-in colors（内置颜色）

<details>
<summary>查看原文</summary>
<p>

`lv_color_white()` and `lv_color_black()` return `0xFFFFFF` and `0x000000` respectively.
 
</p>
</details>

`lv_color_white()` 和 `lv_color_black()` 分别返回 `0xFFFFFF` 和 `0x000000`。

## Opacity（不透明度）

<details>
<summary>查看原文</summary>
<p>

To describe opacity the `lv_opa_t` type is created as a wrapper to `uint8_t`. Some defines are also introduced:

- `LV_OPA_TRANSP` Value: 0, means the opacity makes the color completely transparent
- `LV_OPA_10` Value: 25, means the color covers only a little
- `LV_OPA_20 ... OPA_80` come logically
- `LV_OPA_90` Value: 229, means the color near completely covers
- `LV_OPA_COVER` Value: 255, means the color completely covers

You can also use the `LV_OPA_*` defines in `lv_color_mix()` as a *ratio*.
 
</p>
</details>


## Color types（颜色类型）

<details>
<summary>查看原文</summary>
<p>

The following variable types are defined by the color module:

- `lv_color1_t` Monochrome color. Also has R, G, B fields for compatibility but they are always the same value (1 byte)
- `lv_color8_t` A structure to store R (3 bit),G (3 bit),B (2 bit) components for 8-bit colors (1 byte)
- `lv_color16_t` A structure to store R (5 bit),G (6 bit),B (5 bit) components for 16-bit colors (2 byte)
- `lv_color32_t` A structure to store R (8 bit),G (8 bit), B (8 bit) components for 24-bit colors (4 byte)
- `lv_color_t` Equal to `lv_color1/8/16/24_t` depending on current color depth setting
- `lv_color_int_t` `uint8_t`, `uint16_t` or `uint32_t` depending on color depth setting. Used to build color arrays from plain numbers.
- `lv_opa_t` A simple `uint8_t` type to describe opacity.
 
</p>
</details>


<details>
<summary>查看原文</summary>
<p>

The `lv_color_t`, `lv_color1_t`, `lv_color8_t`, `lv_color16_t` and `lv_color32_t` types have four fields:

- `ch.red` red channel
- `ch.green` green channel
- `ch.blue` blue channel
- `full*` red + green + blue as one number

You can set the current color depth in *lv_conf.h*, by setting the `LV_COLOR_DEPTH` define to 1 (monochrome), 8, 16 or 32.
 
</p>
</details>


### Convert color（颜色转换）

<details>
<summary>查看原文</summary>
<p>

You can convert a color from the current color depth to another. The converter functions return with a number, so you have to use the `full` field:
 
</p>
</details>

```c
lv_color_t c;
c.red   = 0x38;
c.green = 0x70;
c.blue  = 0xCC;

lv_color1_t c1;
c1.full = lv_color_to1(c);	/*Return 1 for light colors, 0 for dark colors*/

lv_color8_t c8;
c8.full = lv_color_to8(c);	/*Give a 8 bit number with the converted color*/

lv_color16_t c16;
c16.full = lv_color_to16(c); /*Give a 16 bit number with the converted color*/

lv_color32_t c24;
c32.full = lv_color_to32(c);	/*Give a 32 bit number with the converted color*/
```


## API


```eval_rst

.. doxygenfile:: lv_color.h
  :project: lvgl

```
