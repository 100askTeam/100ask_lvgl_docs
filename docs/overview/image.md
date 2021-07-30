```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/overview/image.md
```
# Images（图象）

<details>
<summary>查看原文</summary>
<p>

An image can be a file or variable which stores the bitmap itself and some metadata.
 
</p>
</details>

图像可以是存储位图本身和一些元数据的文件或变量。

## Store images（存储图像）

<details>
<summary>查看原文</summary>
<p>

You can store images in two places
- as a variable in the internal memory (RAM or ROM)
- as a file
 
</p>
</details>

您可以将图像存储在两个地方
- 作为内部存储器（RAM 或 ROM）中的变量
- 作为文件


### Variables（变量）

<details>
<summary>查看原文</summary>
<p>

The images stored internally in a variable are composed mainly of an `lv_img_dsc_t` structure with the following fields:
- **header**
  - *cf* Color format. See [below](#color-format)
  - *w* width in pixels (<= 2048)
  - *h* height in pixels (<= 2048)
  - *always zero* 3 bits which need to be always zero
  - *reserved* reserved for future use
- **data** pointer to an array where the image itself is stored
- **data_size** length of `data` in bytes

These are usually stored within a project as C files. They are linked into the resulting executable like any other constant data.
 
</p>
</details>

内部存储在变量中的图像主要由具有以下字段的 `lv_img_dsc_t` 结构组成：
- **标题**
- *cf* 颜色格式。见[下面](#color-format)
- *w* 像素宽度 (<= 2048)
- *h* 以像素为单位的高度 (<= 2048)
- *始终为零* 3位，需要始终为零
- *保留*保留供将来使用
- **data** 指向存储图像本身的数组的指针
- **data_size** `data` 的长度（以字节为单位）

这些通常作为 C 文件存储在项目中。它们像任何其他常量数据一样链接到生成的可执行文件中。

### Files（文件）

<details>
<summary>查看原文</summary>
<p>

To deal with files you need to add a *Drive* to LVGL. In short, a *Drive* is a collection of functions (*open*, *read*, *close*, etc.) registered in LVGL to make file operations.
You can add an interface to a standard file system (FAT32 on SD card) or you create your simple file system to read data from an SPI Flash memory.
In every case, a *Drive* is just an abstraction to read and/or write data to memory.
See the [File system](/overview/file-system) section to learn more.

Images stored as files are not linked into the resulting executable, and must be read to RAM before being drawn. As a result, they are not as resource-friendly as variable images. However, they are easier to replace without needing to recompile the main program.
 
</p>
</details>

要处理文件，您需要将 *Drive* 添加到 LVGL。简而言之，*Drive* 是在 LVGL 中注册的用于进行文件操作的函数（*open*、*read*、*close* 等）的集合。
您可以向标准文件系统（SD 卡上的 FAT32）添加接口，或者创建简单的文件系统以从 SPI 闪存读取数据。
在任何情况下，*Drive* 都只是读取和/或将数据写入内存的抽象。
请参阅 [文件系统](/overview/file-system) 部分了解更多信息。

存储为文件的图像不会链接到生成的可执行文件中，并且必须在绘制之前读取到 RAM。因此，它们不像可变图像那样资源友好。但是，它们更容易替换而无需重新编译主程序。

## Color formats（颜色格式）

<details>
<summary>查看原文</summary>
<p>

Various built-in color formats are supported:
- **LV_IMG_CF_TRUE_COLOR** Simply stores the RGB colors (in whatever color depth LVGL is configured for).
- **LV_IMG_CF_TRUE_COLOR_ALPHA** Like `LV_IMG_CF_TRUE_COLOR` but it also adds an alpha (transparency) byte for every pixel.
- **LV_IMG_CF_TRUE_COLOR_CHROMA_KEYED** Like `LV_IMG_CF_TRUE_COLOR` but if a pixel has `LV_COLOR_TRANSP` (set in *lv_conf.h*) color the pixel will be transparent.
- **LV_IMG_CF_INDEXED_1/2/4/8BIT** Uses a palette with 2, 4, 16 or 256 colors and stores each pixel in 1, 2, 4 or 8 bits.
- **LV_IMG_CF_ALPHA_1/2/4/8BIT** **Only stores the Alpha value on 1, 2, 4 or 8 bits.** The pixels take the color of `style.image.color` and the set opacity. The source image has to be an alpha channel. This is ideal for bitmaps similar to fonts (where the whole image is one color but you'd like to be able to change it).

The bytes of the `LV_IMG_CF_TRUE_COLOR` images are stored in the following order.
 
</p>
</details>

支持各种内置颜色格式：
- **LV_IMG_CF_TRUE_COLOR** 简单地存储 RGB 颜色（以 LVGL 配置的任何颜色深度）。
- **LV_IMG_CF_TRUE_COLOR_ALPHA** 类似于 `LV_IMG_CF_TRUE_COLOR`，但它还为每个像素添加了一个 alpha（透明度）字节。
- **LV_IMG_CF_TRUE_COLOR_CHROMA_KEYED** 类似于 `LV_IMG_CF_TRUE_COLOR`，但如果像素具有 `LV_COLOR_TRANSP`（在 *lv_conf.h* 中设置）颜色，则像素将是透明的。
- **LV_IMG_CF_INDEXED_1/2/4/8BIT** 使用具有 2、4、16 或 256 种颜色的调色板，并以 1、2、4 或 8 位存储每个像素。
- **LV_IMG_CF_ALPHA_1/2/4/8BIT** **仅以 1、2、4 或 8 位存储 Alpha 值。** 像素采用 `style.image.color` 的颜色和设置的不透明度。源图像必须是 alpha 通道。这非常适用于类似于字体的位图（其中整个图像是一种颜色，但您希望能够更改它）。

`LV_IMG_CF_TRUE_COLOR` 图像的字节按以下顺序存储。


<details>
<summary>查看原文</summary>
<p>

For 32-bit color depth:
- Byte 0: Blue
- Byte 1: Green
- Byte 2: Red
- Byte 3: Alpha

For 16-bit color depth:
- Byte 0: Green 3 lower bit, Blue 5 bit
- Byte 1: Red 5 bit, Green 3 higher bit
- Byte 2: Alpha byte (only with LV_IMG_CF_TRUE_COLOR_ALPHA)

For 8-bit color depth:
- Byte 0: Red 3 bit, Green 3 bit, Blue 2 bit
- Byte 2: Alpha byte (only with LV_IMG_CF_TRUE_COLOR_ALPHA)

 
</p>
</details>

对于 32 位色深：
- 字节 0：蓝色
- 字节 1：绿色
- 字节 2：红色
- 字节 3：阿尔法

对于 16 位色深：
- 字节 0：绿色 3 低位，蓝色 5 位
- 字节 1：红色 5 位，绿色 3 高位
- 字节 2：Alpha 字节（仅适用于 LV_IMG_CF_TRUE_COLOR_ALPHA）

对于 8 位色深：
- 字节 0：红色 3 位，绿色 3 位，蓝色 2 位
- 字节 2：Alpha 字节（仅适用于 LV_IMG_CF_TRUE_COLOR_ALPHA）


<details>
<summary>查看原文</summary>
<p>

You can store images in a *Raw* format to indicate that it's not encoded with one of the built-in color formats and an external [Image decoder](#image-decoder) needs to be used to decode the image.
- **LV_IMG_CF_RAW** Indicates a basic raw image (e.g. a PNG or JPG image).
- **LV_IMG_CF_RAW_ALPHA** Indicates that the image has alpha and an alpha byte is added for every pixel.
- **LV_IMG_CF_RAW_CHROME_KEYED** Indicates that the image is chroma-keyed as described in `LV_IMG_CF_TRUE_COLOR_CHROMA_KEYED` above.
 
</p>
</details>

您可以以 *Raw* 格式存储图像，以表明它没有使用其中一种内置颜色格式进行编码，并且需要使用外部 [图像解码器](#image-decoder) 来解码图像。
- **LV_IMG_CF_RAW** 表示基本的原始图像（例如 PNG 或 JPG 图像）。
- **LV_IMG_CF_RAW_ALPHA** 表示图像具有 alpha 并且为每个像素添加一个 alpha 字节。
- **LV_IMG_CF_RAW_CHROME_KEYED** 表示图像是色度键控的，如上面“LV_IMG_CF_TRUE_COLOR_CHROMA_KEYED”中所述。


## Add and use images（添加和使用图像）

<details>
<summary>查看原文</summary>
<p>

You can add images to LVGL in two ways:
- using the online converter
- manually create images
 
</p>
</details>

您可以通过两种方式将图像添加到 LVGL：
- 使用在线转换器
- 手动创建图像


### Online converter（在线转换器）

<details>
<summary>查看原文</summary>
<p>

The online Image converter is available here: https://lvgl.io/tools/imageconverter

Adding an image to LVGL via online converter is easy.

1. You need to select a *BMP*, *PNG* or *JPG* image first.
2. Give the image a name that will be used within LVGL.
3. Select the [Color format](#color-formats).
4. Select the type of image you want. Choosing a binary will generate a `.bin` file that must be stored separately and read using the [file support](#files). Choosing a variable will generate a standard C file that can be linked into your project.
5. Hit the *Convert* button. Once the conversion is finished, your browser will automatically download the resulting file.
 
</p>
</details>

在线图像转换器可在此处获得：[https://lvgl.io/tools/imageconverter](https://lvgl.io/tools/imageconverter)

通过在线转换器将图像添加到 LVGL 很容易。
1. 您需要先选择*BMP*、*PNG* 或*JPG* 图像。
2. 为图像指定一个将在 LVGL 中使用的名称。
3. 选择[颜色格式](#color-formats)。
4. 选择您想要的图像类型。选择二进制文件将生成一个 `.bin` 文件，该文件必须单独存储并使用 [文件支持](#files) 读取。选择一个变量将生成一个可以链接到您的项目的标准 C 文件。
5. 点击*转换*按钮。转换完成后，您的浏览器将自动下载生成的文件。

<details>
<summary>查看原文</summary>
<p>

In the converter C arrays (variables), the bitmaps for all the color depths (1, 8, 16 or 32) are included in the C file, but only the color depth that matches `LV_COLOR_DEPTH` in *lv_conf.h* will actually be linked into the resulting executable.

In case of binary files, you need to specify the color format you want:
- RGB332 for 8-bit color depth
- RGB565 for 16-bit color depth
- RGB565 Swap for 16-bit color depth (two bytes are swapped)
- RGB888 for 32-bit color depth
 
</p>
</details>

在转换器 C 数组（变量）中，所有颜色深度（1、8、16 或 32）的位图都包含在 C 文件中，但实际上只有与 *lv_conf.h* 中的 `LV_COLOR_DEPTH` 匹配的颜色深度才会链接到生成的可执行文件中。

对于二进制文件，您需要指定所需的颜色格式：
- RGB332 8 位色深
- RGB565 16 位色深
- RGB565 交换 16 位色深（交换两个字节）
- RGB888 用于 32 位色深


### Manually create an image（手动创建图像）

<details>
<summary>查看原文</summary>
<p>

If you are generating an image at run-time, you can craft an image variable to display it using LVGL. For example:
 
</p>
</details>

如果您在运行时生成图像，您可以制作一个图像变量以使用 LVGL 显示它。例如：

```c
uint8_t my_img_data[] = {0x00, 0x01, 0x02, ...};

static lv_img_dsc_t my_img_dsc = {
    .header.always_zero = 0,
    .header.w = 80,
    .header.h = 60,
    .data_size = 80 * 60 * LV_COLOR_DEPTH / 8,
    .header.cf = LV_IMG_CF_TRUE_COLOR,          /*Set the color format*/
    .data = my_img_data,
};

```


<details>
<summary>查看原文</summary>
<p>

If the color format is `LV_IMG_CF_TRUE_COLOR_ALPHA` you can set `data_size` like `80 * 60 * LV_IMG_PX_SIZE_ALPHA_BYTE`.

Another (possibly simpler) option to create and display an image at run-time is to use the [Canvas](/widgets/core/canvas) object.
 
</p>
</details>

如果颜色格式是`LV_IMG_CF_TRUE_COLOR_ALPHA`，你可以将`data_size`设置为`80 * 60 * LV_IMG_PX_SIZE_ALPHA_BYTE`。

在运行时创建和显示图像的另一个（可能更简单）选项是使用 [Canvas](/widgets/core/canvas) 对象。

### Use images（使用图片）


<details>
<summary>查看原文</summary>
<p>

The simplest way to use an image in LVGL is to display it with an [lv_img](/widgets/core/img) object:
 
</p>
</details>

在 LVGL 中使用图像的最简单方法是使用 [lv_img](/widgets/core/img) 对象显示它：

```c
lv_obj_t * icon = lv_img_create(lv_scr_act(), NULL);

/*From variable*/
lv_img_set_src(icon, &my_icon_dsc);

/*From file*/
lv_img_set_src(icon, "S:my_icon.bin");
```


<details>
<summary>查看原文</summary>
<p>

If the image was converted with the online converter, you should use `LV_IMG_DECLARE(my_icon_dsc)` to declare the image in the file where you want to use it.
 
</p>
</details>

如果图像是使用在线转换器转换的，则应使用 `LV_IMG_DECLARE(my_icon_dsc)` 在要使用的文件中声明图像。

## Image decoder（图像解码器）

<details>
<summary>查看原文</summary>
<p>

As you can see in the [Color formats](#color-formats) section, LVGL supports several built-in image formats. In many cases, these will be all you need. LVGL doesn't directly support, however, generic image formats like PNG or JPG.

To handle non-built-in image formats, you need to use external libraries and attach them to LVGL via the *Image decoder* interface.

The image decoder consists of 4 callbacks:
- **info** get some basic info about the image (width, height and color format).
- **open** open the image: either store the decoded image or set it to `NULL` to indicate the image can be read line-by-line.
- **read** if *open* didn't fully open the image this function should give some decoded data (max 1 line) from a given position.
- **close** close the opened image, free the allocated resources.

You can add any number of image decoders. When an image needs to be drawn, the library will try all the registered image decoders until it finds one which can open the image, i.e. one which knows that format.

The `LV_IMG_CF_TRUE_COLOR_...`, `LV_IMG_INDEXED_...` and `LV_IMG_ALPHA_...` formats (essentially, all non-`RAW` formats) are understood by the built-in decoder.
 
</p>
</details>

正如您在 [颜色格式](#color-formats) 部分中看到的，LVGL 支持多种内置图像格式。在许多情况下，这些将是您所需要的。但是，LVGL 不直接支持 PNG 或 JPG 等通用图像格式。

要处理非内置图像格式，您需要使用外部库并通过*图像解码器* 接口将它们附加到 LVGL。

图像解码器由 4 个回调组成：
- **info** 获取有关图像的一些基本信息（宽度、高度和颜色格式）。
- **open** 打开图像：要么存储解码后的图像，要么将其设置为 `NULL` 以指示可以逐行读取图像。
- **read** 如果 *open* 没有完全打开图像，这个函数应该从给定的位置给出一些解码数据（最多 1 行）。
- **close** 关闭打开的图片，释放分配的资源。

您可以添加任意数量的图像解码器。当需要绘制图像时，库将尝试所有注册的图像解码器，直到找到可以打开图像的解码器，即知道该格式的解码器。

`LV_IMG_CF_TRUE_COLOR_...`、`LV_IMG_INDEXED_...` 和`LV_IMG_ALPHA_...` 格式（基本上，所有非`RAW` 格式）被内置解码器理解。

### Custom image formats（自定义图像格式）


<details>
<summary>查看原文</summary>
<p>

The easiest way to create a custom image is to use the online image converter and set `Raw`, `Raw with alpha` or `Raw with chroma-keyed` format. It will just take every byte of the binary file you uploaded and write it as the image "bitmap". You then need to attach an image decoder that will parse that bitmap and generate the real, renderable bitmap.

`header.cf` will be `LV_IMG_CF_RAW`, `LV_IMG_CF_RAW_ALPHA` or `LV_IMG_CF_RAW_CHROME_KEYED` accordingly. You should choose the correct format according to your needs: fully opaque image, use alpha channel or use chroma keying.

After decoding, the *raw* formats are considered *True color* by the library. In other words, the image decoder must decode the *Raw* images to *True color* according to the format described in [#color-formats](Color formats) section.
 
</p>
</details>

创建自定义图像的最简单方法是使用在线图像转换器并设置“Raw”、“Raw with alpha”或“Raw with chroma-keyed”格式。它只会获取您上传的二进制文件的每个字节并将其写入图像“位图”。然后，您需要附加一个图像解码器，该解码器将解析该位图并生成真实的、可渲染的位图。

`header.cf` 将相应地为 `LV_IMG_CF_RAW`、`LV_IMG_CF_RAW_ALPHA` 或 `LV_IMG_CF_RAW_CHROME_KEYED`。您应该根据需要选择正确的格式：完全不透明的图像、使用 alpha 通道或使用色度键控。

解码后，*raw* 格式被库视为*真彩色*。换句话说，图像解码器必须根据 [#color-formats]（颜色格式）部分中描述的格式将 *Raw* 图像解码为 *True color*。

<details>
<summary>查看原文</summary>
<p>

If you want to create a custom image, you should use `LV_IMG_CF_USER_ENCODED_0..7` color formats. However, the library can draw the images only in *True color* format (or *Raw* but finally it's supposed to be in *True color* format).
The `LV_IMG_CF_USER_ENCODED_...` formats are not known by the library and therefore they should be decoded to one of the known formats from [#color-formats](Color formats) section.
It's possible to decode the image to a non-true color format first (for example: `LV_IMG_INDEXED_4BITS`) and then call the built-in decoder functions to convert it to *True color*.

With *User encoded* formats, the color format in the open function (`dsc->header.cf`) should be changed according to the new format.
 
</p>
</details>

如果要创建自定义图像，则应使用`LV_IMG_CF_USER_ENCODED_0..7` 颜色格式。但是，该库只能以 *True color* 格式（或 *Raw* 但最终它应该以 *True color* 格式）绘制图像。

lvgl库不知道`LV_IMG_CF_USER_ENCODED_...` 格式，因此应该将它们解码为[#color-formats]（颜色格式）部分中的已知格式之一。
可以先将图像解码为非真彩色格式（例如：`LV_IMG_INDEXED_4BITS`），然后调用内置解码器函数将其转换为*真彩色*。

使用*用户编码*格式，打开函数（`dsc->header.cf`）中的颜色格式应根据新格式进行更改。

### Register an image decoder（注册图像解码器）

<details>
<summary>查看原文</summary>
<p>

Here's an example of getting LVGL to work with PNG images.

First, you need to create a new image decoder and set some functions to open/close the PNG files. It should looks like this:
 
</p>
</details>

这是让 LVGL 处理 PNG 图像的示例。

首先，您需要创建一个新的图像解码器并设置一些功能来打开/关闭 PNG 文件。它应该是这样的：

```c
/*Create a new decoder and register functions */
lv_img_decoder_t * dec = lv_img_decoder_create();
lv_img_decoder_set_info_cb(dec, decoder_info);
lv_img_decoder_set_open_cb(dec, decoder_open);
lv_img_decoder_set_close_cb(dec, decoder_close);


/**
 * Get info about a PNG image
 * @param decoder pointer to the decoder where this function belongs
 * @param src can be file name or pointer to a C array
 * @param header store the info here
 * @return LV_RES_OK: no error; LV_RES_INV: can't get the info
 */
static lv_res_t decoder_info(lv_img_decoder_t * decoder, const void * src, lv_img_header_t * header)
{
  /*Check whether the type `src` is known by the decoder*/
  if(is_png(src) == false) return LV_RES_INV;

  /* Read the PNG header and find `width` and `height` */
  ...

  header->cf = LV_IMG_CF_RAW_ALPHA;
  header->w = width;
  header->h = height;
}

/**
 * Open a PNG image and return the decided image
 * @param decoder pointer to the decoder where this function belongs
 * @param dsc pointer to a descriptor which describes this decoding session
 * @return LV_RES_OK: no error; LV_RES_INV: can't get the info
 */
static lv_res_t decoder_open(lv_img_decoder_t * decoder, lv_img_decoder_dsc_t * dsc)
{

  /*Check whether the type `src` is known by the decoder*/
  if(is_png(src) == false) return LV_RES_INV;

  /*Decode and store the image. If `dsc->img_data` is `NULL`, the `read_line` function will be called to get the image data line-by-line*/
  dsc->img_data = my_png_decoder(src);

  /*Change the color format if required. For PNG usually 'Raw' is fine*/
  dsc->header.cf = LV_IMG_CF_...

  /*Call a built in decoder function if required. It's not required if`my_png_decoder` opened the image in true color format.*/
  lv_res_t res = lv_img_decoder_built_in_open(decoder, dsc);

  return res;
}

/**
 * Decode `len` pixels starting from the given `x`, `y` coordinates and store them in `buf`.
 * Required only if the "open" function can't open the whole decoded pixel array. (dsc->img_data == NULL)
 * @param decoder pointer to the decoder the function associated with
 * @param dsc pointer to decoder descriptor
 * @param x start x coordinate
 * @param y start y coordinate
 * @param len number of pixels to decode
 * @param buf a buffer to store the decoded pixels
 * @return LV_RES_OK: ok; LV_RES_INV: failed
 */
lv_res_t decoder_built_in_read_line(lv_img_decoder_t * decoder, lv_img_decoder_dsc_t * dsc, lv_coord_t x,
                                                  lv_coord_t y, lv_coord_t len, uint8_t * buf)
{
   /*With PNG it's usually not required*/

   /*Copy `len` pixels from `x` and `y` coordinates in True color format to `buf` */

}

/**
 * Free the allocated resources
 * @param decoder pointer to the decoder where this function belongs
 * @param dsc pointer to a descriptor which describes this decoding session
 */
static void decoder_close(lv_img_decoder_t * decoder, lv_img_decoder_dsc_t * dsc)
{
  /*Free all allocated data*/

  /*Call the built-in close function if the built-in open/read_line was used*/
  lv_img_decoder_built_in_close(decoder, dsc);

}

```


<details>
<summary>查看原文</summary>
<p>

So in summary:
- In `decoder_info`, you should collect some basic information about the image and store it in `header`.
- In `decoder_open`, you should try to open the image source pointed by `dsc->src`. Its type is already in `dsc->src_type == LV_IMG_SRC_FILE/VARIABLE`.
If this format/type is not supported by the decoder, return `LV_RES_INV`.
However, if you can open the image, a pointer to the decoded *True color* image should be set in `dsc->img_data`.
If the format is known but you don't want to decode the entire image (e.g. no memory for it) set `dsc->img_data = NULL` to call `read_line` to get the pixels.
- In `decoder_close` you should free all the allocated resources.
- `decoder_read` is optional. Decoding the whole image requires extra memory and some computational overhead.
However, if can decode one line of the image without decoding the whole image, you can save memory and time.
To indicate that the *line read* function should be used, set `dsc->img_data = NULL` in the open function.
 
</p>
</details>

所以总结一下：
- 在`decoder_info`中，你应该收集一些关于图像的基本信息并将其存储在`header`中。
- 在`decoder_open`中，你应该尝试打开`dsc->src`指向的图像源。它的类型已经在`dsc->src_type == LV_IMG_SRC_FILE/VARIABLE`中。
如果解码器不支持此格式/类型，则返回“LV_RES_INV”。
但是，如果您可以打开图像，则应在`dsc->img_data` 中设置指向解码的*真彩色* 图像的指针。
如果格式已知但您不想解码整个图像（例如没有内存），请设置 `dsc->img_data = NULL` 以调用 `read_line` 来获取像素。
- 在 `decoder_close` 中，你应该释放所有分配的资源。
- `decoder_read` 是可选的。解码整个图像需要额外的内存和一些计算开销。
但是，如果可以解码一行图像而不解码整个图像，则可以节省内存和时间。
表示 *line read* 函数应该是我们

### Manually use an image decoder（手动使用图像解码器）


<details>
<summary>查看原文</summary>
<p>

LVGL will use the registered image decoder automatically if you try and draw a raw image (i.e. using the `lv_img` object) but you can use them manually too. Create a `lv_img_decoder_dsc_t` variable to describe the decoding session and call `lv_img_decoder_open()`.
 
</p>
</details>

如果您尝试绘制原始图像（即使用 `lv_img` 对象），LVGL 将自动使用注册的图像解码器，但您也可以手动使用它们。创建一个 `lv_img_decoder_dsc_t` 变量来描述解码会话并调用 `lv_img_decoder_open()`。

```c

lv_res_t res;
lv_img_decoder_dsc_t dsc;
res = lv_img_decoder_open(&dsc, &my_img_dsc, LV_COLOR_WHITE);

if(res == LV_RES_OK) {
  /*Do something with `dsc->img_data`*/
  lv_img_decoder_close(&dsc);
}

```


## Image caching（图片缓存）

<details>
<summary>查看原文</summary>
<p>

Sometimes it takes a lot of time to open an image.
Continuously decoding a PNG image or loading images from a slow external memory would be inefficient and detrimental to the user experience.

Therefore, LVGL caches a given number of images. Caching means some images will be left open, hence LVGL can quickly access them from `dsc->img_data` instead of needing to decode them again.

Of course, caching images is resource-intensive as it uses more RAM (to store the decoded image). LVGL tries to optimize the process as much as possible (see below), but you will still need to evaluate if this would be beneficial for your platform or not. If you have a deeply embedded target which decodes small images from a relatively fast storage medium, image caching may not be worth it.
 
</p>
</details>

有时打开图像需要很多时间。
连续解码 PNG 图像或从缓慢的外部存储器加载图像将是低效的并且不利于用户体验。

因此，LVGL 缓存给定数量的图像。缓存意味着一些图像将保持打开状态，因此 LVGL 可以从 `dsc->img_data` 快速访问它们，而无需再次解码它们。

当然，缓存图像是资源密集型的，因为它使用更多的 RAM（用于存储解码的图像）。 LVGL 尝试尽可能地优化流程（见下文），但您仍需要评估这是否对您的平台有益。如果您有一个深度嵌入的目标，可以从相对较快的存储介质中解码小图像，则图像缓存可能不值得。

### Cache size（缓存大小）

<details>
<summary>查看原文</summary>
<p>

The number of cache entries can be defined in `LV_IMG_CACHE_DEF_SIZE` in *lv_conf.h*. The default value is 1 so only the most recently used image will be left open.

The size of the cache can be changed at run-time with `lv_img_cache_set_size(entry_num)`.
 
</p>
</details>

缓存条目的数量可以在 *lv_conf.h* 中的 `LV_IMG_CACHE_DEF_SIZE` 中定义。默认值为 1，因此只有最近使用的图像将保持打开状态。

缓存的大小可以在运行时通过 `lv_img_cache_set_size(entry_num)` 改变。

### Value of images（图片的价值）

<details>
<summary>查看原文</summary>
<p>

When you use more images than cache entries, LVGL can't cache all of the images. Instead, the library will close one of the cached images (to free space).

To decide which image to close, LVGL uses a measurement it previously made of how long it took to open the image. Cache entries that hold slower-to-open images are considered more valuable and are kept in the cache as long as possible.

If you want or need to override LVGL's measurement, you can manually set the *time to open* value in the decoder open function in `dsc->time_to_open = time_ms` to give a higher or lower value. (Leave it unchanged to let LVGL set it.)

Every cache entry has a *"life"* value. Every time an image opening happens through the cache, the *life* value of all entries is decreased to make them older.
When a cached image is used, its *life* value is increased by the *time to open* value to make it more alive.

If there is no more space in the cache, the entry with the smallest life value will be closed.
 
</p>
</details>

当您使用的图像多于缓存条目时，LVGL 无法缓存所有图像。相反，库将关闭缓存的图像之一（以释放空间）。

为了决定关闭哪个图像，LVGL 使用它之前对打开图像所花费的时间进行的测量。保存打开速度较慢的图像的缓存条目被认为更有价值，并尽可能长时间地保存在缓存中。

如果您想要或需要覆盖 LVGL 的测量，您可以在 `dsc->time_to_open = time_ms` 中的解码器打开函数中手动设置 *time to open* 值，以给出更高或更低的值。 （保持不变，让 LVGL 设置它。）

每个缓存条目都有一个 *"life"* 值。每次通过缓存打开图像时，所有条目的 *life* 值都会减少以使其更旧。
当使用缓存图像时，它的 *life* 值会增加 *time to open* 值以使其更加活跃。

如果缓存中没有更多空间，则生命值最小的条目将被关闭。

### Memory usage（内存使用情况）

<details>
<summary>查看原文</summary>
<p>

Note that the cached image might continuously consume memory. For example, if 3 PNG images are cached, they will consume memory while they are open.

Therefore, it's the user's responsibility to be sure there is enough RAM to cache even the largest images at the same time.
 
</p>
</details>

请注意，缓存的图像可能会持续消耗内存。例如，如果缓存了 3 个 PNG 图片，它们将在打开时消耗内存。

因此，用户有责任确保有足够的 RAM 来同时缓存最大的图像。

### Clean the cache（清理缓存）

<details>
<summary>查看原文</summary>
<p>

Let's say you have loaded a PNG image into a `lv_img_dsc_t my_png` variable and use it in an `lv_img` object. If the image is already cached and you then change the underlying PNG file, you need to notify LVGL to cache the image again. Otherwise, there is no easy way of detecting that the underlying file changed and LVGL will still draw the old image.

To do this, use `lv_img_cache_invalidate_src(&my_png)`. If `NULL` is passed as a parameter, the whole cache will be cleaned.
 
</p>
</details>

假设您已将 PNG 图像加载到 `lv_img_dsc_t my_png` 变量中，并在 `lv_img` 对象中使用它。如果图像已经缓存，然后您更改了底层 PNG 文件，则需要通知 LVGL 再次缓存图像。否则，没有简单的方法可以检测到底层文件发生了变化，而 LVGL 仍会绘制旧图像。

为此，请使用`lv_img_cache_invalidate_src(&my_png)`。如果将 `NULL` 作为参数传递，则整个缓存将被清除。


## API


### Image buffer（图像缓冲区）

```eval_rst

.. doxygenfile:: lv_img_buf.h
  :project: lvgl

```
