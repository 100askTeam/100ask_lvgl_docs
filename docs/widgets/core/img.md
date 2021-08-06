```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/widgets/img.md
```
# Image（图象） (lv_img)


## Overview（概述）

<details>
<summary>查看原文</summary>
<p>

Images are the basic object to display images from flash (as arrays) or from files. Images can display symbols (`LV_SYMBOL_...`) too.

Using the [Image decoder interface](/overview/image.html#image-decoder) custom image formats can be supported as well.

</p>
</details>

图像是显示来自闪存（作为数组）或来自文件的图像的基本对象。 图像也可以显示符号（`LV_SYMBOL_...`）。

使用[图像解码器接口](/overview/image.html#image-decoder) 也可以支持自定义图像格式。

## Parts and Styles（部件和风格）

<details>
<summary>查看原文</summary>
<p>

- `LV_PART_MAIN` A background rectangle that uses the typical background style properties and the image itself using the image style properties.

</p>
</details>

- `LV_PART_MAIN` 使用典型背景样式属性的背景矩形和使用图像样式属性的图像本身。


## Usage（用法）

### Image source（图片来源）

<details>
<summary>查看原文</summary>
<p>

To provide maximum flexibility, the source of the image can be:

- a variable in code (a C array with the pixels).
- a file stored externally (e.g. on an SD card).
- a text with [Symbols](/overview/font).

To set the source of an image, use `lv_img_set_src(img, src)`.

To generate a pixel array from a PNG, JPG or BMP image, use the [Online image converter tool](https://lvgl.io/tools/imageconverter) and set the converted image with its pointer: `lv_img_set_src(img1, &converted_img_var);`
To make the variable visible in the C file, you need to declare it with `LV_IMG_DECLARE(converted_img_var)`.

</p>
</details>

为了提供最大的灵活性，图像的来源可以是：

- 代码中的变量（带有像素的 C 数组）。
- 外部存储的文件（例如在 SD 卡上）。
- 带有 [Symbols](/overview/font) 的文本。

要设置图像的来源，请使用`lv_img_set_src(img, src)`。

要从 PNG、JPG 或 BMP 图像生成像素数组，请使用 [在线图像转换工具](https://lvgl.io/tools/imageconverter) 并使用其指针设置转换后的图像：`lv_img_set_src(img1, &converted_img_var );`
要使该变量在 C 文件中可见，您需要使用 `LV_IMG_DECLARE(converted_img_var)` 声明它。

<details>
<summary>查看原文</summary>
<p>

To use external files, you also need to convert the image files using the online converter tool but now you should select the binary output format.
You also need to use LVGL's file system module and register a driver with some functions for the basic file operation. Go to the [File system](/overview/file-system) to learn more.
To set an image sourced from a file, use `lv_img_set_src(img, "S:folder1/my_img.bin")`.

You can also set a symbol similarly to [Labels](/widgets/core/label). In this case, the image will be rendered as text according to the *font* specified in the style.  It enables to use of light-weight monochrome "letters" instead of real images. You can set symbol like `lv_img_set_src(img1, LV_SYMBOL_OK)`.

</p>
</details>

要使用外部文件，您还需要使用在线转换器工具转换图像文件，但现在您应该选择二进制输出格式。
您还需要使用 LVGL 的文件系统模块，并为基本文件操作注册一个具有一些功能的驱动程序。 转到 [文件系统](/overview/file-system) 了解更多信息。
要设置来自文件的图像，请使用`lv_img_set_src(img, "S:folder1/my_img.bin")`。

您还可以设置类似于 [标签](/widgets/core/label) 的符号。 在这种情况下，图像将根据样式中指定的 *font* 呈现为文本。 它允许使用轻量级单色“字母”而不是真实图像。 你可以设置像`lv_img_set_src(img1, LV_SYMBOL_OK)`这样的符号。

### Label as an image（标签作为图象）

<details>
<summary>查看原文</summary>
<p>

Images and labels are sometimes used to convey the same thing. For example, to describe what a button does. 
Therefore, images and labels are somewhat interchangeable, that is the images can display texts by using `LV_SYMBOL_DUMMY` as the prefix of the text. For example, `lv_img_set_src(img, LV_SYMBOL_DUMMY "Some text")`.

</p>
</details>

图像和标签有时用于传达相同的内容。 例如，描述按钮的作用。
因此，图像和标签在某种程度上是可以互换的，即图像可以通过使用“LV_SYMBOL_DUMMY”作为文本的前缀来显示文本。 例如，`lv_img_set_src(img, LV_SYMBOL_DUMMY "Some text")`。

### Transparency（透明度）

<details>
<summary>查看原文</summary>
<p>

The internal (variable) and external images support 2 transparency handling methods:

- **Chroma-keying** - Pixels with `LV_COLOR_CHROMA_KEY` (*lv_conf.h*) color will be transparent.
- **Alpha byte** - An alpha byte is added to every pixel that contains the pixel's opacity

</p>
</details>

内部（变量）和外部图像支持 2 种透明度处理方法：

- **色度键控** - 具有`LV_COLOR_CHROMA_KEY` (*lv_conf.h*) 颜色的像素将是透明的。
- **Alpha 字节** - 向每个包含像素不透明度的像素添加一个 Alpha 字节


### Palette and Alpha index（调色板和Alpha索引）

<details>
<summary>查看原文</summary>
<p>

Besides the *True color* (RGB) color format, the following formats are supported:
- **Indexed** - Image has a palette.
- **Alpha indexed** - Only alpha values are stored.

These options can be selected in the image converter. To learn more about the color formats, read the [Images](/overview/image) section.

</p>
</details>

除了 *True color* (RGB) 颜色格式外，还支持以下格式：
- **索引** - 图像有调色板。
- **Alpha 索引** - 仅存储 Alpha 值。

可以在图像转换器中选择这些选项。 要了解有关颜色格式的更多信息，请阅读 [图像](/overview/image) 部分。

### Recolor（重新着色）

<details>
<summary>查看原文</summary>
<p>

A color can be mixed with every pixel of an image with a given intensity.
This can be useful to show different states (checked, inactive, pressed, etc.) of an image without storing more versions of the same image.
This feature can be enabled in the style by setting `img_recolor_opa` between `LV_OPA_TRANSP` (no recolor, value: 0) and `LV_OPA_COVER` (full recolor, value: 255).
The default value is `LV_OPA_TRANSP` so this feature is disabled.

The color to mix is set by `img_recolor`.

</p>
</details>

颜色可以与具有给定强度的图像的每个像素混合。
这对于显示图像的不同状态（选中、非活动、按下等）非常有用，而无需存储同一图像的更多版本。
可以通过在“LV_OPA_TRANSP”（无重新着色，值：0）和“LV_OPA_COVER”（完全重新着色，值：255）之间设置“img_recolor_opa”在样式中启用此功能。
默认值为“LV_OPA_TRANSP”，因此禁用此功能。

要混合的颜色由 `img_recolor` 设置。

### Auto-size（自动大小）

<details>
<summary>查看原文</summary>
<p>

If the width or height of the image object is set to `LV_SIZE_CONTENT` the object's size will be set according to the size of the image source in the respective direction.

</p>
</details>

如果图像对象的宽度或高度设置为`LV_SIZE_CONTENT`，则对象的大小将根据图像源在相应方向上的大小设置。

### Mosaic（马赛克）

<details>
<summary>查看原文</summary>
<p>

If the object's size is greater than the image size in any directions, then the image will be repeated like a mosaic.
This allows creation a large image from only a very narrow source.
For example, you can have a *300 x 5* image with a special gradient and set it as a wallpaper using the mosaic feature.

</p>
</details>

如果对象的大小在任何方向上都大于图像大小，则图像将像马赛克一样重复。
这允许仅从非常窄的源创建大图像。
例如，您可以使用带有特殊渐变的 *300 x 5* 图像，并使用马赛克功能将其设置为墙纸。

### Offset（偏移）

<details>
<summary>查看原文</summary>
<p>

With `lv_img_set_offset_x(img, x_ofs)` and `lv_img_set_offset_y(img, y_ofs)`, you can add some offset to the displayed image.
Useful if the object size is smaller than the image source size.
Using the offset parameter a [Texture atlas](https://en.wikipedia.org/wiki/Texture_atlas) or a "running image" effect can be created by [Animating](/overview/animation) the x or y offset.

</p>
</details>

使用 `lv_img_set_offset_x(img, x_ofs)` 和 `lv_img_set_offset_y(img, y_ofs)`，您可以为显示的图像添加一些偏移量。
如果对象大小小于图像源大小，则很有用。
使用偏移参数 [Texture atlas](https://en.wikipedia.org/wiki/Texture_atlas) 或“运行图像”效果可以通过 [Animating](/overview/animation) x 或 y 偏移创建。

## Transformations（转换）

<details>
<summary>查看原文</summary>
<p>

Using the `lv_img_set_zoom(img, factor)` the images will be zoomed. Set `factor` to `256` or `LV_IMG_ZOOM_NONE` to disable zooming. 
A larger value enlarges the images (e.g. `512` double size), a smaller value shrinks it (e.g. `128` half size).
Fractional scale works as well. E.g. `281` for 10% enlargement.

To rotate the image use `lv_img_set_angle(img, angle)`. Angle has 0.1 degree precision, so for 45.8° set 458.

The `transform_zoom` and `transform_angle` style properties are also used to determine the final zoom and angle.

By default, the pivot point of the rotation is the center of the image. It can be changed with `lv_img_set_pivot(img, pivot_x, pivot_y)`. `0;0` is the top left corner.

</p>
</details>

使用 `lv_img_set_zoom(img, factor)` 图像将被缩放。 将 `factor` 设置为 `256` 或 `LV_IMG_ZOOM_NONE` 以禁用缩放。
较大的值会放大图像（例如“512”双倍尺寸），较小的值会缩小图像（例如“128”半尺寸）。
分数尺度也有效。 例如。 `281` 放大 10%。

要旋转图像，请使用 `lv_img_set_angle(img, angle)`。 角度的精度为 0.1 度，因此对于 45.8° 设置 458。

`transform_zoom` 和 `transform_angle` 样式属性也用于确定最终的缩放和角度。

默认情况下，旋转的轴心点是图像的中心。 它可以通过 `lv_img_set_pivot(img, pivot_x, pivot_y)` 改变。 `0;0` 是左上角。

<details>
<summary>查看原文</summary>
<p>

The quality of the transformation can be adjusted with `lv_img_set_antialias(img, true/false)`. With enabled anti-aliasing the transformations are higher quality but slower.

The transformations require the whole image to be available. Therefore indexed images (`LV_IMG_CF_INDEXED_...`), alpha only images (`LV_IMG_CF_ALPHA_...`) or images from files can not be transformed. 
In other words transformations work only on true color images stored as C array, or if a custom [Image decoder](/overview/images#image-edecoder) returns the whole image.

Note that the real coordinates of image objects won't change during transformation. That is `lv_obj_get_width/height/x/y()` will return the original, non-zoomed coordinates.

</p>
</details>

转换的质量可以通过 `lv_img_set_antialias(img, true/false)` 来调整。 启用抗锯齿后，转换质量更高但速度更慢。

转换需要整个图像可用。 因此，索引图像（`LV_IMG_CF_INDEXED_...`）、仅 alpha 图像（`LV_IMG_CF_ALPHA_...`）或来自文件的图像无法转换。
换句话说，转换仅适用于存储为 C 数组的真彩色图像，或者如果自定义 [图像解码器](/overview/images#image-edecoder) 返回整个图像。

请注意，图像对象的真实坐标在转换过程中不会改变。 即`lv_obj_get_width/height/x/y()` 将返回原始的、未缩放的坐标。

### Size mode（尺寸模式）

<details>
<summary>查看原文</summary>
<p>

By default if the image is zoom or rotated the real coordinates of the image object are not changed. 
The larger content simply overflows the object's boundaries. 
It also means the layouts are not affected the by the transformations. 

If you need the object size to be updated to the transformed size set `lv_img_set_size_mode(img, LV_IMG_SIZE_MODE_REAL)`. (The previous mode is the default and called `LV_IMG_SIZE_MODE_VIRTUAL`).
In this case if the width/height of the object is set to `LV_SIZE_CONTENT` the object's size will be set to the zoomed and rotated size.
If an explicit size is set then the overflowing content will be cropped. 

</p>
</details>

默认情况下，如果图像被缩放或旋转，图像对象的真实坐标不会改变。
较大的内容只是溢出对象的边界。
这也意味着布局不受转换的影响。

如果您需要将对象大小更新为转换后的大小集`lv_img_set_size_mode(img, LV_IMG_SIZE_MODE_REAL)`。 （之前的模式是默认模式，称为`LV_IMG_SIZE_MODE_VIRTUAL`）。
在这种情况下，如果对象的宽度/高度设置为“LV_SIZE_CONTENT”，则对象的大小将设置为缩放和旋转后的大小。
如果设置了明确的大小，那么溢出的内容将被裁剪。

## Events（事件）

<details>
<summary>查看原文</summary>
<p>

No special events are sent by image objects.

See the events of the [Base object](/widgets/obj) too.

Learn more about [Events](/overview/event).

</p>
</details>

图像对象不发送特殊事件。

参见 [Base object](/widgets/obj) 的事件。

详细了解 [事件](/overview/event)。

## Keys（按键）

<details>
<summary>查看原文</summary>
<p>

No *Keys* are processed by the object type.

Learn more about [Keys](/overview/indev).

</p>
</details>

对象类型不处理 *Keys*。

了解有关 [Keys](/overview/indev) 的更多信息。

## Example

```eval_rst

.. include:: ../../../examples/widgets/img/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_img.h
  :project: lvgl

```
