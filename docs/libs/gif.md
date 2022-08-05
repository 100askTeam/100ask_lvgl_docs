```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/libs/gif.md
```

# GIF decoder（GIF解码器）

<details>
<summary>查看原文</summary>
<p>

Allow using GIF images in LVGL. Based on https://github.com/lecram/gifdec

When enabled in `lv_conf.h` with `LV_USE_GIF` `lv_gif_create(parent)` can be used to create a gif widget.

`lv_gif_set_src(obj, src)` works very similarly to `lv_img_set_src`. As source, it also accepts images as variables (`lv_img_dsc_t`) or files.

</p>
</details>

GIF解码器让我们可以在 LVGL 中使用 GIF 图像。基于 [https://github.com/lecram/gifdec](https://github.com/lecram/gifdec) 实现。


如果在 `lv_conf.h` 中启用了 `LV_USE_GIF` 后，可以使用 `lv_gif_create(parent)` 创建 gif 组件，这与 `lv_img_create` 非常相似。

`lv_gif_set_src(obj, src)` 的工作方式与 `lv_img_set_src` 非常相似。作为源，它还接受图像作为变量 (`lv_img_dsc_t`) 或文件。

## Convert GIF files to C array（将 GIF 文件转换为 C 数组）

<details>
<summary>查看原文</summary>
<p>

To convert a GIF file to byte values array use [LVGL's online converter](https://lvgl.io/tools/imageconverter). Select "Raw" color format and "C array" Output format.
 
</p>
</details>

要将 GIF 文件转换为字节值的数组，请使用 LVGL 的[在线转换器](https://lvgl.io/tools/imageconverter)。选择 “RAW” 颜色格式和 “C array” 输出格式。

## Use GIF images from file（使用GIF文件）

<details>
<summary>查看原文</summary>
<p>

For example:
```c
lv_gif_set_src(obj, "S:path/to/example.gif");
```

Note that, a file system driver needs to be registered to open images from files. Read more about it [here](https://docs.lvgl.io/master/overview/file-system.html) or just enable one in `lv_conf.h` with `LV_USE_FS_...` 

</p>
</details>

示例：


```c
lv_gif_create(lv_scr_act());
lv_gif_set_src(obj, "S:path/to/example.gif");
```

注意，需要注册文件系统驱动程序才能从文件中打开图像。点击[这里](https://docs.lvgl.io/master/overview/file-system.html)阅读关于文件系统的更多信息，或直接在 `lv_conf.h` 中打开其中一个类似 `LV_USE_FS_...` 的宏。

## Memory requirements（内存要求）

<details>
<summary>查看原文</summary>
<p>

To decode and display a GIF animation the following amount of RAM is required:
- `LV_COLOR_DEPTH 8`: 3 x image width x image height 
- `LV_COLOR_DEPTH 16`: 4 x image width x image height 
- `LV_COLOR_DEPTH 32`: 5 x image width x image height 


</p>
</details>

要解码和显示 GIF 文件，需要以下数量的 RAM (字节)：
- `LV_COLOR_DEPTH 8`：3 x 图像宽度 x 图像高度
- `LV_COLOR_DEPTH 16`：4 x 图像宽度 x 图像高度
- `LV_COLOR_DEPTH 32`：5 x 图像宽度 x 图像高度

## Example
```eval_rst
.. include:: ../../examples/libs/gif/index.rst
```

## API

```eval_rst
.. doxygenfile:: lv_gif.h
  :project: lvgl
```