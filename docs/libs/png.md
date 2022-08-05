```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/libs/png.md
```

# PNG decoder（PNG解码器）

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

PNG解码器让我们可以在 LVGL 中使用 PNG 图像。这个实现中使用到了 [lodepng](https://github.com/lvandeve/lodepng) 库。

如果在 `lv_conf.h` 中启用了 `LV_USE_PNG` ，LVGL 在初始化时会自动注册 PNG 图像解码器，之后 PNG 文件可以直接用作图像源使用。

请注意，需要注册文件系统驱动程序才能从文件中打开图像。在此处阅读有关它的更多信息，或者仅在 lv_conf.h 中使用 LV_USE_FS_ 启用一个...

请注意，需要注册文件系统驱动程序才能从文件中打开图像。点击[这里](https://docs.lvgl.io/master/overview/file-system.html)阅读关于文件系统的更多信息，或直接在 `lv_conf.h` 中打开其中一个类似 `LV_USE_FS_...` 的宏。

PNG解码器会对整个PNG图像解码，所以在解码过程中需要RAM为： `图像宽度 x 图像高度 x 4字节`

由于解码 PNG 图像可能需要大量时间，这时候 LVGL 的图像缓存功能就能派上用场了( `lv_conf.h` 中的 `LV_IMG_CACHE_DEF_SIZE`)。


-----------
## 拓展阅读

- [PNG图象格式](https://baike.baidu.com/item/PNG)


## Example
```eval_rst

.. include:: ../../examples/libs/png/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_png.h
  :project: lvgl

