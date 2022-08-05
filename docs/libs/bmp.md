```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/libs/bmp.md
```

# BMP decoder（BMP解码器）

<details>
<summary>查看原文</summary>
<p>


This extension allows the use of BMP images in LVGL. 
This implementation uses [bmp-decoder](https://github.com/caj-johnson/bmp-decoder) library.
The pixels are read on demand (not the whole image is loaded) so using BMP images requires very little RAM. 

If enabled in `lv_conf.h` by `LV_USE_BMP` LVGL will register a new image decoder automatically so BMP files can be directly used as image sources. For example:
```
lv_img_set_src(my_img, "S:path/to/picture.bmp");
```

Note that, a file system driver needs to registered to open images from files. Read more about it [here](https://docs.lvgl.io/master/overview/file-system.html) or just enable one in `lv_conf.h` with `LV_USE_FS_...` 

</p>
</details>

这个拓展库让我们可以在 LVGL 中使用 BMP 图像。其中使用的是 [bmp-decoder](https://github.com/caj-johnson/bmp-decoder) 库。bmp图的像素是按需读取的（不是加载整个图像），因此使用 BMP 图像需要很少的 RAM。

在 lv_conf.h 中打开 LV_USE_BMP 后，LVGL 会在初始化时自动注册一个新的BMP图象解码器，之后就可以直接打开BMP格式的图像文件。例如：

```
lv_img_set_src(my_img, "S:path/to/picture.bmp");
```

注意，需要注册文件系统驱动程序才能从文件系统中打开bmp图像，点击[这里](https://docs.lvgl.io/master/overview/file-system.html)阅读了解更多信息，或直接在 `lv_conf.h` 中打开其中一个类似 `LV_USE_FS_...` 的宏。

## Limitations（限制）

<details>
<summary>查看原文</summary>
<p>


- Only BMP files are supported and BMP images as C array (`lv_img_dsc_t`) are not. It's because there is no practical differences between how the BMP files and LVGL's image format stores the image data. 
- BMP files can be loaded only from file. If you want to store them in flash it's better to convert them to C array with [LVGL's image converter](https://lvgl.io/tools/imageconverter).
- The BMP files color format needs to match with `LV_COLOR_DEPTH`. Use GIMP to save the image in the required format.
  Both RGB888 and ARGB888 works with `LV_COLOR_DEPTH 32`
- Palette is not supported.
- Because not the whole image is read in can not be zoomed or rotated.

</p>
</details>

- 仅支持 BMP 文件，不支持像 C 数组 (`lv_img_dsc_t`) 这样的 BMP 图像数据。这是因为 BMP 文件和 LVGL 的图像格式存储图像数据的方式没有实际区别。
- BMP 文件只能从文件中加载。如果您想将它们存储在 闪存(FLASH) 中，最好使用 LVGL 的[图像转换器](https://lvgl.io/tools/imageconverter)将它们转换为 C 数组。
- BMP 文件的颜色格式需要与 `lv_conf.h` 中的 `LV_COLOR_DEPTH` 匹配。使用 GIMP 以所需格式保存图像。 RGB888 和 ARGB888 都适用于 `LV_COLOR_DEPTH 32`
- 不支持调色板。
- 因为不是整个图像被读入后不能进行缩放或旋转。

## Example
```eval_rst

.. include:: ../../examples/libs/bmp/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_bmp.h
  :project: lvgl

```
