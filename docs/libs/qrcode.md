```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/libs/qrcode.md
```

# QR code(二维码)

<details>
<summary>查看原文</summary>
<p>

QR code generation with LVGL. Uses [QR-Code-generator](https://github.com/nayuki/QR-Code-generator) by [nayuki](https://github.com/nayuki).

</p>
</details>

使用 LVGL 生成二维码。使用 [QR-Code-generator](https://github.com/nayuki/QR-Code-generator) by [nayuki](https://github.com/nayuki)。

## Get started(开始)

<details>
<summary>查看原文</summary>
<p>

- Download or clone this repository
  - [Download](https://github.com/lvgl/lv_lib_qrcode.git) from GitHub
  - Clone: git clone https://github.com/lvgl/lv_lib_qrcode.git
- Include the library: `#include "lv_lib_qrcode/lv_qrcode.h"`
- Test with the following code:

</p>
</details>

- 下载或克隆此存储库 
  - [下载](https://github.com/lvgl/lv_lib_qrcode.git) 从 GitHub 
  - 克隆：git clone https://github.com/lvgl/lv_lib_qrcode.git
- 引用库： `#include "lv_lib_qrcode/lv_qrcode.h"`
- 使用以下代码进行测试：

```c
const char * data = "Hello world";

/*Create a 100x100 QR code*/
lv_obj_t * qr = lv_qrcode_create(lv_scr_act(), 100, lv_color_hex3(0x33f), lv_color_hex3(0xeef));

/*Set data*/
lv_qrcode_update(qr, data, strlen(data));
```

## Notes(注意)

<details>
<summary>查看原文</summary>
<p>

- QR codes with less data are smaller but they scaled by an integer numbers number to best fit to the given size

</p>
</details>

- 数据较少的二维码较小，但按整数缩放以最适合给定大小

## Example(示例)
```eval_rst

.. include:: ../../examples/libs/qrcode/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_qrcode.h
  :project: lvgl
