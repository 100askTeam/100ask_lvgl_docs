```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/libs/gif.md
```

# GIF decoder(GIF解码器)

<details>
<summary>查看原文</summary>
<p>

Allow to use of GIF images in LVGL. Based on https://github.com/lecram/gifdec

When enabled in `lv_conf.h` with `LV_USE_GIF` `lv_gif_create(parent)` can be used to create a gif widget.

`lv_gif_set_src(obj, src)` works very similarly to `lv_img_set_src`. As source It also accepts images as variables (`lv_img_dsc_t`) or files.

</p>
</details>

允许在 LVGL 中使用 GIF 图像。基于 [https://github.com/lecram/gifdec](https://github.com/lecram/gifdec)

当在 `lv_conf.h` 和 `LV_USE_GIF` 中启用时，`lv_gif_create(parent)` 可用于创建 gif 小部件。

`lv_gif_set_src(obj, src)` 的工作方式与 `lv_img_set_src` 非常相似。作为源 它还接受图像作为变量（`lv_img_dsc_t`）或文件。

## Convert GIF files to C array(将 GIF 文件转换为 C 数组)

<details>
<summary>查看原文</summary>
<p>

To convert a GIF file to byte values array use [LVGL's online converter](https://lvgl.io/tools/imageconverter). Select "Raw" color format and "C array" Output format.
 
</p>
</details>

要将 GIF 文件转换为字节值数组，请使用 [LVGL 的在线转换器](https://lvgl.io/tools/imageconverter)。选择“原始”颜色格式和“C 数组”输出格式。

## Use GIF images from file(使用文件中的 GIF 图片)

For example:
```c
lv_gif_set_src(obj, "S:path/to/example.gif");
```

<details>
<summary>查看原文</summary>
<p>

Note that, a file system driver needs to regsitered to open images from files. Read more about it [here](https://docs.lvgl.io/master/overview/file-system.html) or just enable one in `lv_conf.h` with `LV_USE_FS_...` 

</p>
</details>

请注意，文件系统驱动程序需要注册才能从文件中打开图像。阅读更多相关信息 [此处](https://docs.lvgl.io/master/overview/file-system.html) 或仅在 `lv_conf.h` 中使用 `LV_USE_FS_...` 启用一个


## Memory requirements(内存要求)

<details>
<summary>查看原文</summary>
<p>

To decode and display a GIF animation the following amount of RAM is required:
- `LV_COLOR_DEPTH 8`: 3 x image width x image height 
- `LV_COLOR_DEPTH 16`: 4 x image width x image height 
- `LV_COLOR_DEPTH 32`: 5 x image width x image height 

</p>
</details>

要解码和显示 GIF 动画，需要以下 RAM 量：

- `LV_COLOR_DEPTH 8`：3 x 图像宽度 x 图像高度 
- `LV_COLOR_DEPTH 16`：4 x 图像宽度 x 图像高度 
- `LV_COLOR_DEPTH 32`：5 x 图像宽度 x 图像高度

## Example(用法)

```eval_rst

.. include:: ../../examples/libs/gif/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_gif.h
  :project: lvgl

```