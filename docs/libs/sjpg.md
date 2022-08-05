```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/libs/sjpg.md
```

# JPG decoder（JPG解码器）

<details>
<summary>查看原文</summary>
<p>

Allow the use of JPG images in LVGL. Besides that it also allows the use of a custom format, called Split JPG (SJPG), which can be decoded in more optimal way on embedded systems.

</p>
</details>

JPG解码器让我们可以在 LVGL 中使用 JPG 图像。除此之外，它还允许使用称为拆分 JPG (SJPG) 的自定义格式，这个格式可以在嵌入式系统上以更优化的方式进行解码。

## Overview（概述）

<details>
<summary>查看原文</summary>
<p>

  - Supports both normal JPG and the custom SJPG formats.
  - Decoding normal JPG consumes RAM with the size fo the whole uncompressed image (recommended only for devices with more RAM)
  - SJPG is a custom format based on "normal" JPG and specially made for LVGL.
  - SJPG is 'split-jpeg' which is a bundle of small jpeg fragments with an sjpg header.
  - SJPG size will be almost comparable to the jpg file or might be a slightly larger.
  - File read from file and c-array are implemented.
  - SJPEG frame fragment cache enables fast fetching of lines if available in cache.
  - By default the sjpg image cache will be image width * 2 * 16 bytes (can be modified)
  - Currently only 16 bit image format is supported (TODO)
  - Only the required partion of the JPG and SJPG images are decoded, therefore they can't be zoomed or rotated.

</p>
</details>

- 支持普通 JPG 和自定义 SJPG 格式。
- 解码普通 JPG 会消耗整个未压缩图像大小的 RAM（仅推荐用于具有更多 RAM 的设备）
- SJPG 是一种基于 “普通” JPG 的自定义格式，非常适合在 LVGL 上使用。
- SJPG 是 `split-jpeg` ，它是一段带有 sjpg 标头的小 jpeg 片段数据。
- SJPG 大小将几乎与 jpg 文件相当，或者可能会稍大一些。
- 实现了从文件和 c-array 读取文件。
- 如果在缓存中可用，SJPEG 帧片段缓存可以快速获取行。
- 默认情况下，sjpg 图像缓存大小为 **图像宽度 * 2 * 16** 字节（可修改）
- 目前仅支持 16 位图像格式 (TODO)
- 仅对 JPG 和 SJP G图像的所需部分进行解码，所以无法缩放或旋转。

## Usage（用法）

<details>
<summary>查看原文</summary>
<p>

If enabled in `lv_conf.h` by `LV_USE_SJPG` LVGL will register a new image decoder automatically so JPG and SJPG files can be directly used as image sources. For example:
```
lv_img_set_src(my_img, "S:path/to/picture.jpg");
```

Note that, a file system driver needs to registered to open images from files. Read more about it [here](https://docs.lvgl.io/master/overview/file-system.html) or just enable one in `lv_conf.h` with `LV_USE_FS_...` 


</p>
</details>


如果在 `lv_conf.h` 中启用了 `LV_USE_SJPG` ，LVGL 在初始化时会自动注册 jpg 图像解码器，之后 JPG 和 SJPG 文件可以直接用作图像源使用。例如：

```
lv_img_set_src(my_img, "S:path/to/picture.jpg");
```

注意，这需要注册文件系统驱动程序才能从文件中打开图像。点击[这里](https://docs.lvgl.io/master/overview/file-system.html)阅读了解更多信息，或直接在 `lv_conf.h` 中打开其中一个类似 `LV_USE_FS_...` 的宏。

## Converter（转换器）

### Converting JPG to C array（转换JPG为C数组）

<details>
<summary>查看原文</summary>
<p>

  - Use lvgl online tool https://lvgl.io/tools/imageconverter 
  - Color format = RAW, output format = C Array

</p>
</details>

- 使用 lvgl 在线工具： [https://lvgl.io/tools/imageconverter](https://lvgl.io/tools/imageconverter)
- 颜色格式为 RAW，输出格式为 Array

### Converting JPG to SJPG （转换JPG为SJPG）

<details>
<summary>查看原文</summary>
<p>

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

</p>
</details>


需要 python3 和 PIL 库。 （PIL可以用pip安装 pip3 install pillow ）

通过 jpg 生成 SJPG：

- 复制jpg图像文件到 `lvgl/scripts` 目录下
- 进入到 `lvgl/scripts` 目录： cd  lvgl/scripts
- 执行脚本转换脚本，注意，这会同时创建一个 C 文件和一个 SJPG 图像： `python3 jpg_to_sjpg.py image_to_convert.jpg`

正常的运行结果：

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

----
## 拓展阅读

- [JPG图象格式](https://baike.baidu.com/item/JPEG%E6%A0%BC%E5%BC%8F)

## Example
```eval_rst

.. include:: ../../examples/libs/sjpg/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_sjpg.h
  :project: lvgl
