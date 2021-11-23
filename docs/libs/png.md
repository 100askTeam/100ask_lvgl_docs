```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/libs/png.md
```

# PNG decoder(PNG解码器)

<details>
<summary>查看原文</summary>
<p>


Allow the use of PNG images in LVGL. This implementation uses [lodepng](https://github.com/lvandeve/lodepng) library.

If enabled in `lv_conf.h` by `LV_USE_PNG` LVGL will register a new image decoder automatically so PNG files can be directly used as any other image  sources.

Note that, a file system driver needs to registered to open images from files. Read more about it [here](https://docs.lvgl.io/master/overview/file-system.html) or just enable one in `lv_conf.h` with `LV_USE_FS_...` 

The whole PNG image is decoded so during decoding RAM equals to `image width x image height x 4` bytes are required.

As it might take significant time to decode PNG images LVGL's [images caching](https://docs.lvgl.io/master/overview/image.html#image-caching) feature can be useful. 

</p>
</details>


允许在 LVGL 中使用 PNG 图像。此实现使用 [lodepng](https://github.com/lvandeve/lodepng) 库。

如果在 `lv_conf.h` 中通过 `LV_USE_PNG` 启用，LVGL 将自动注册一个新的图像解码器，因此 PNG 文件可以直接用作任何其他图像源。

请注意，需要注册文件系统驱动程序才能从文件中打开图像。阅读有关它的更多信息 [此处](https://docs.lvgl.io/master/overview/file-system.html) 或仅使用 `LV_USE_FS_...` 在 `lv_conf.h` 中启用一个 

整个 PNG 图像是因此在解码过程中解码 RAM 等于`图像宽度 x 图像高度 x 4` 字节是必需的。

因为解码 PNG 图像可能需要大量时间 LVGL 的 [图像缓存](https://docs.lvgl.io/master/overview/ image.html#image-caching) 功能很有用。


## Example(用法)
```eval_rst

.. include:: ../../examples/libs/png/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_png.h
  :project: lvgl

