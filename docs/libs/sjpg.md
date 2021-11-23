```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/libs/sjpg.md
```

# JPG decoder(JPG解码器)
<details>
<summary>查看原文</summary>
<p>

Allow the use of JPG images in LVGL. Besides that it also allows the use of a custom format, called Split JPG (SJPG), which can be decided in more optimal way on embedded systems.

</p>
</details>

允许在 LVGL 中使用 JPG 图像。除此之外，它还允许使用称为 Split JPG (SJPG) 的自定义格式，可以在嵌入式系统上以更优化的方式决定。

## Overview(概述)

<details>
<summary>查看原文</summary>
<p>

- Supports both normal JPG and the custom SJPG formats.
- Decoding normal JPG consumes RAM with the size fo the whole uncompressed image (recommended only for devices with more RAM)
- SJPG is a custom format based on "normal" JPG and specially made for LVGL.
- SJPG is 'split-jpeg' which is a bundle of small jpeg fragments with an sjpg header.
- SJPG size will be almost comparable to the jpg file or might be a slightly larger.
- File read from file and c-array are implemented.
- SJPEG frame fragment cache enables fast fetching of lines if availble in cache.
- By default the sjpg image cache will be image width * 2 * 16 bytes (can be modified)
- Currently only 16 bit image format is supported (TODO)
- Only the required partion of the JPG and SJPG images are decoded, therefore they can't be zoomed or rotated.

</p>
</details>

- 支持普通 JPG 和自定义 SJPG 格式。
- 解码普通 JPG 会消耗整个未压缩图像大小的 RAM（仅推荐用于具有更多 RAM 的设备）
- SJPG 是基于“普通”JPG 的自定义格式，专为LVGL。
- SJPG 是“split-jpeg”，它是一捆带有 sjpg 标头的小 jpeg 片段。
- SJPG 大小几乎与 jpg 文件相当，或者可能稍大一些。
- 从文件和 c-array 读取的文件已实现。
- 如果缓存中可用，SJPEG 帧片段缓存可以快速获取行。
- 默认情况下，sjpg 图像缓存将为图像宽度 * 2 * 16 字节（可以修改）- 目前仅支持 16 位图像格式（TODO )
- 仅解码 JPG 和 SJPG 图像所需的部分，因此无法对其进行缩放或旋转。


## Usage(用法)

<details>
<summary>查看原文</summary>
<p>

If enabled in `lv_conf.h` by `LV_USE_SJPG` LVGL will register a new image decoder automatically so JPG and SJPG files can be directly used as image sources. For example:

</p>
</details>

如果在 `lv_conf.h` 中通过 `LV_USE_SJPG` 启用 LVGL 将自动注册一个新的图像解码器，因此 JPG 和 SJPG 文件可以直接用作图像源。例如：

```
lv_img_set_src(my_img, "S:path/to/picture.jpg");
```

<details>
<summary>查看原文</summary>
<p>

Note that, a file system driver needs to registered to open images from files. Read more about it [here](https://docs.lvgl.io/master/overview/file-system.html) or just enable one in `lv_conf.h` with `LV_USE_FS_...` 

</p>
</details>


> 请注意，文件系统驱动程序需要注册才能从文件中打开图像。阅读更多相关信息 [此处](https://docs.lvgl.io/master/overview/file-system.html) 或仅在 `lv_conf.h` 中使用 `LV_USE_FS_...` 启用一个



## Converter(转换器)

### Converting JPG to C array(将 JPG 转换为 C 数组)

<details>
<summary>查看原文</summary>
<p>


  - Use lvgl online tool https://lvgl.io/tools/imageconverter 
  - Color format = RAW, output format = C Array

</p>
</details>

- 使用 lvgl 在线工具 https://lvgl.io/tools/imageconverter 
- 颜色格式 = RAW，输出格式 = C 数组
  
### Converting JPG to SJPG(将 JPG 转换为 SJPG)

<details>
<summary>查看原文</summary>
<p>


</p>
</details>

python3 and the PIL library required. (PIL can be installed with `pip3 install pillow`)

To create SJPG from JPG:
- Copy the image to convert into `lvgl/scripts`
- `cd lvgl/scripts`
- `python3 jpg_to_sjpg.py image_to_convert.jpg`. It creates both a C files and an SJPG image.

The expected result is:
```sh
Conversion started...

Input:
        image_to_convert.jpg
        RES = 640 x 480

Output:
        Time taken = 1.66 sec
        bin size = 77.1 KB
        walpaper.sjpg           (bin file)
        walpaper.c              (c array)

All good!
```


## Example(示例)
```eval_rst

.. include:: ../../examples/libs/sjpg/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_sjpg.h
  :project: lvgl
