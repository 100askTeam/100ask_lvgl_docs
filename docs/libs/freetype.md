```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/libs/bmp.md
```

# FreeType support(支持FreeType)

<details>
<summary>查看原文</summary>
<p>

Interface to [FreeType](https://www.freetype.org/) to generate font bitmaps run time.

</p>
</details>

[FreeType](https://www.freetype.org/) 的接口以生成字体位图运行时。

## Install FreeType(安装 FreeType)

<details>
<summary>查看原文</summary>
<p>

- Download Freetype from [here](https://sourceforge.net/projects/freetype/files/)
- `make`
- `sudo make install`

</p>
</details>

- 从[这里](https://sourceforge.net/projects/freetype/files/)下载Freetype
- `make`
- `sudo make install`

## Add FreeType to your project(将 FreeType 添加到项目中)

<details>
<summary>查看原文</summary>
<p>

- Add include path: `/usr/include/freetype2` (for GCC: `-I/usr/include/freetype2 -L/usr/local/lib`)
- Add library: `freetype` (for GCC: `-L/usr/local/lib -lfreetype`)

</p>
</details>

- 添加包含路径：`/usr/include/freetype2`（对于 GCC：`-I/usr/include/freetype2 -L/usr/local/lib`）
- 添加库：`freetype`（对于 GCC：`-L /usr/local/lib -lfreetype`)

## Usage(用法)

<details>
<summary>查看原文</summary>
<p>

Enable `LV_USE_FREETYPE` in `lv_conf.h`.

See the examples below.

Note that, the FreeType extension doesn't use LVGL's file system. 
You can simply pass the path to the font as usual on your operating system or platform.

</p>
</details>

在 `lv_conf.h` 中启用 `LV_USE_FREETYPE`。

参见下面的示例。

注意，FreeType 扩展不使用 LVGL 的文件系统。
您可以像往常一样在操作系统或平台上简单地传递字体的路径。

## Learn more(深入学习)

<details>
<summary>查看原文</summary>
<p>

- FreeType [tutorial](https://www.freetype.org/freetype2/docs/tutorial/step1.html) 
- LVGL's [font interface](https://docs.lvgl.io/v7/en/html/overview/font.html#add-a-new-font-engine)

</p>
</details>

- FreeType [教程](https://www.freetype.org/freetype2/docs/tutorial/step1.html) 
- LVGL 的 [字体界面](https://docs.lvgl.io/v7/en/html/overview /font.html#add-a-new-font-engine)

## API

```eval_rst

.. doxygenfile:: lv_freetype.h
  :project: lvgl

```