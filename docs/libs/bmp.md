```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/libs/bmp.md
```

# BMP decoder(BMP解码器)
<details>
<summary>查看原文</summary>
<p>

This extension allows the use of BMP images in LVGL. 
This implementation uses [bmp-decoder](https://github.com/caj-johnson/bmp-decoder) library.
The pixel are read on demand (not the whole image is loaded) so using BMP images requires very little RAM. 

If enabled in `lv_conf.h` by `LV_USE_BMP` LVGL will register a new image decoder automatically so BMP files can be directly used as image sources. For example:
```
lv_img_set_src(my_img, "S:path/to/picture.bmp");
```

Note that, a file system driver needs to registered to open images from files. Read more about it [here](https://docs.lvgl.io/master/overview/file-system.html) or just enable one in `lv_conf.h` with `LV_USE_FS_...` 

</p>
</details>

此扩展允许在 LVGL 中使用 BMP 图像。
此实现使用 [bmp-decoder](https://github.com/caj-johnson/bmp-decoder) 库。
像素是按需读取的（不是整个图像被加载），因此使用 BMP 图像需要很少的 RAM。

如果在 `lv_conf.h` 中通过 `LV_USE_BMP` 启用 LVGL 将自动注册一个新的图像解码器，因此 BMP 文件可以直接用作图像源。例如：

```
lv_img_set_src(my_img, "S:path/to/picture.bmp");
```

> 请注意，文件系统驱动程序需要注册才能从文件中打开图像。阅读更多相关信息 [此处](https://docs.lvgl.io/master/overview/file-system.html) 或仅在 `lv_conf.h` 中使用 `LV_USE_FS_...` 启用一个

## Limitations(限制条件)

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



- 仅支持 BMP 文件，不支持 BMP 图像作为 C 数组 (`lv_img_dsc_t`)。这是因为 BMP 文件和 LVGL 的图像格式存储图像数据的方式没有实际区别。
- BMP 文件只能从文件中加载。如果您想将它们存储在闪存中，最好使用 [LVGL 的图像转换器](https://lvgl.io/tools/imageconverter) 将它们转换为 C 数组。
- BMP 文件颜色格式需要与`LV_COLOR_DEPTH` 匹配。使用 GIMP 以所需格式保存图像。 RGB888 和 ARGB888 都适用于`LV_COLOR_DEPTH 32`
- 不支持调色板。
- 因为不是整个图像被读入不能缩放或旋转。


## Example
```eval_rst

.. include:: ../../examples/libs/bmp/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_bmp.h
  :project: lvgl

```
