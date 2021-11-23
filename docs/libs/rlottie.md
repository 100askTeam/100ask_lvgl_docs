```eval_rst
.. include:: /header.rst
:github_url: |github_link_base|/libs/rlottie.md
```


# Lottie player

<details>
<summary>查看原文</summary>
<p>

Allows to use Lottie animations in LVGL. Taken from this [base repository](https://github.com/ValentiWorkLearning/lv_rlottie)

LVGL provides the interface to [Samsung/rlottie](https://github.com/Samsung/rlottie) library's C API. That is the actual Lottie player is not part of LVGL, it needs to be built separately.

</p>
</details>

允许在 LVGL 中使用 Lottie 动画。取自 [base repository](https://github.com/ValentiWorkLearning/lv_rlottie) 

LVGL 提供了到 [Samsung/rlottie](https://github.com/Samsung/rlottie) 库的 C API 的接口。也就是说实际的 Lottie 播放器不是 LVGL 的一部分，它需要单独构建。

## Build Rlottie(构建 Rlottie)

<details>
<summary>查看原文</summary>
<p>

To build Samsung's Rlottie C++14-compatible compiler and optionally CMake 3.14 or higher is required.

To build on desktop you can follow the instrutions from Rlottie's [README](https://github.com/Samsung/rlottie/blob/master/README.md). In the most basic case it looks like this:

</p>
</details>

要构建三星的 Rlottie C++14 兼容编译器和可选的 CMake 3.14 或更高版本是必需的。

要在桌面上构建，您可以按照 Rlottie 的 [README](https://github.com/Samsung/rlottie/blob/master /README.md）。在最基本的情况下，它看起来像这样：


```
mkdir rlottie_workdir
cd rlottie_workdir
git clone https://github.com/Samsung/rlottie.git
mkdir build
cd build
cmake ../rlottie
make -j
sudo make install
```

<details>
<summary>查看原文</summary>
<p>

And finally add the `-lrlottie` flag to your linker.

On embedded systems you need to take care of integrating Rlottie to the given build system.

</p>
</details>

最后将 `-lrlottie` 标志添加到您的链接器。

在嵌入式系统上，您需要注意将 Rlottie 集成到给定的构建系统。

## Usage(用法)

<details>
<summary>查看原文</summary>
<p>

You can use animation from files or raw data (text). In either case first you need to enable `LV_USE_RLOTTIE` in `lv_conf.h`.


The `width` and `height` of the object be set in the *create* function and the animation will be scaled accordingly.

</p>
</details>

您可以使用来自文件或原始数据（文本）的动画。在任何一种情况下，

您首先需要在 `lv_conf.h` 中启用 `LV_USE_RLOTTIE`。对象的 `width` 和 `height` 在 *create* 函数中设置，动画将相应缩放。

### Use Rlottie from file(使用文件中的 Rlottie)

<details>
<summary>查看原文</summary>
<p>

To create a Lottie animation from file use:

</p>
</details>

要从文件创建 Lottie 动画，请使用：

```c
  lv_obj_t * lottie = lv_rlottie_create_from_file(parent, width, height, "path/to/lottie.json");
```

<details>
<summary>查看原文</summary>
<p>

Note that, Rlottie uses the standard STDIO C file API, so you can use the path "normally" and no LVGL specific driver letter is required.

</p>
</details>

请注意，Rlottie 使用标准 STDIO C 文件 API，因此您可以“正常”使用路径，并且不需要特定于 LVGL 的驱动程序字母。

### Use Rlottie from raw string data(使用原始字符串数据中的 Rlottie)

<details>
<summary>查看原文</summary>
<p>

`lv_example_rlottie_approve.c` contains an example animation in raw format. Instead storing the JSON string a hex array is stored for the following reasons:
- avoid escaping `"` in the JSON file
- some compilers don't support very long strings

`lvgl/scripts/filetohex.py` can be used to convert a Lottie file a hex array. E.g.:

</p>
</details>

`lv_example_rlottie_approve.c` 包含原始格式的示例动画。代替存储 JSON 字符串，存储十六进制数组的原因如下：

- 避免在 JSON 文件中转义 `"`
- 一些编译器不支持很长的字符串

`lvgl/scripts/filetohex.py` 可用于转换一个Lottie 归档一个十六进制数组。例如：

```
./filetohex.py path/to/lottie.json > out.txt
```

<details>
<summary>查看原文</summary>
<p>

To create an animation from raw data:

</p>
</details>

从原始数据创建一个动画：

```c
extern const uint8_t lottie_data[];
lv_obj_t* lottie = lv_rlottie_create_from_raw(parent, width, height, (const char *)lottie_data);
```

## Getting animations(获取动画)

<details>
<summary>查看原文</summary>
<p>

Lottie is standard and popular format so you can find many animation files on the web.
For example: https://lottiefiles.com/

You can also create your own animations with Adobe After Effects or similar software.

</p>
</details>

Lottie 是标准和流行的格式，因此您可以在网络上找到许多动画文件。

例如：https://lottiefiles.com/您还可以使用 Adob​​e After Effects 或类似软件创建自己的动画。

## Example(示例)

```eval_rst

.. include:: ../../examples/libs/rlottie/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_rlottie.h
  :project: lvgl
