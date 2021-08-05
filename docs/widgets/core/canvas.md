```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/widgets/canvas.md
```
# Canvas（画布） (lv_canvas)


## Overview（概述）

<details>
<summary>查看原文</summary>
<p>

A Canvas inherits from [Image](/widgets/core/img) where the user can draw anything. 
Rectangles, texts, images, lines, arcs can be drawn here using lvgl's drawing engine. 
Additionally "effects" can be applied, such as rotation, zoom and blur.

</p>
</details>

Canvas 继承自 [Image](/widgets/core/img)，用户可以在其中绘制任何内容。
矩形、文本、图像、线条、圆弧可以在这里使用lvgl的绘图引擎绘制。
此外，可以应用“效果”，例如旋转、缩放和模糊。

## Parts and Styles（零件和风格）

<details>
<summary>查看原文</summary>
<p>

`LV_PART_MAIN` Uses the typical rectangle style properties and image style properties.

</p>
</details>

`LV_PART_MAIN` 使用典型的矩形样式属性和图像样式属性。

## Usage（用法）

### Buffer（缓冲区）

<details>
<summary>查看原文</summary>
<p>

The Canvas needs a buffer in which stores the drawn image.
To assign a buffer to a Canvas, use `lv_canvas_set_buffer(canvas, buffer, width, height, LV_IMG_CF_...)`. 
Where  `buffer` is a static buffer (not just a local variable) to hold the image of the canvas.
For example,
`static lv_color_t buffer[LV_CANVAS_BUF_SIZE_TRUE_COLOR(width, height)]`. 
`LV_CANVAS_BUF_SIZE_...` macros help to determine the size of the buffer with different color formats.

The canvas supports all the built-in color formats like `LV_IMG_CF_TRUE_COLOR` or `LV_IMG_CF_INDEXED_2BIT`. 
See the full list in the [Color formats](/overview/image.html#color-formats) section.

</p>
</details>

Canvas 需要一个缓冲区来存储绘制的图像。
要为 Canvas 分配缓冲区，请使用 `lv_canvas_set_buffer(canvas, buffer, width, height, LV_IMG_CF_...)`。
其中 `buffer` 是一个静态缓冲区（不仅仅是一个局部变量）来保存画布的图像。
例如，
`静态lv_color_t 缓冲区[LV_CANVAS_BUF_SIZE_TRUE_COLOR(width, height)]`。
`LV_CANVAS_BUF_SIZE_...` 宏有助于确定具有不同颜色格式的缓冲区的大小。

画布支持所有内置颜色格式，如“LV_IMG_CF_TRUE_COLOR”或“LV_IMG_CF_INDEXED_2BIT”。
请参阅 [颜色格式](/overview/image.html#color-formats) 部分中的完整列表。

### Indexed colors（颜色索引）

<details>
<summary>查看原文</summary>
<p>

For `LV_IMG_CF_INDEXED_1/2/4/8` color formats a palette needs to be 
initialized with  `lv_canvas_set_palette(canvas, 3, LV_COLOR_RED)`. It sets pixels with *index=3* to red.

</p>
</details>

对于“LV_IMG_CF_INDEXED_1/2/4/8”颜色格式，调色板需要用 `lv_canvas_set_palette(canvas, 3, LV_COLOR_RED)` 初始化。 它将 *index=3* 的像素设置为红色。

### Drawing（画画）

<details>
<summary>查看原文</summary>
<p>

To set a pixel on the canvas, use `lv_canvas_set_px(canvas, x, y, LV_COLOR_RED)`.
With `LV_IMG_CF_INDEXED_...` or `LV_IMG_CF_ALPHA_...`, the index of the color or the alpha value needs to be passed as color. 
E.g. `lv_color_t c; c.full = 3;`

`lv_canvas_fill_bg(canvas, LV_COLOR_BLUE, LV_OPA_50)` fills the whole canvas to blue with 50% opacity. Note that if the current color format doesn't support colors (e.g. `LV_IMG_CF_ALPHA_2BIT`) the color will be ignored. 
Similarly, if opacity is not supported (e.g. `LV_IMG_CF_TRUE_COLOR`) it will be ignored.

An array of pixels can be copied to the canvas with `lv_canvas_copy_buf(canvas, buffer_to_copy, x, y, width, height)`. 
The color format of the buffer and the canvas need to match.

</p>
</details>

要在画布上设置像素，请使用`lv_canvas_set_px(canvas, x, y, LV_COLOR_RED)`。
使用 `LV_IMG_CF_INDEXED_...` 或 `LV_IMG_CF_ALPHA_...`，颜色的索引或 alpha 值需要作为颜色传递。
例如。 `lv_color_t c; c.full = 3;`

`lv_canvas_fill_bg(canvas, LV_COLOR_BLUE, LV_OPA_50)` 将整个画布填充为蓝色，不透明度为 50%。 请注意，如果当前颜色格式不支持颜色（例如`LV_IMG_CF_ALPHA_2BIT`），则颜色将被忽略。
同样，如果不支持不透明度（例如`LV_IMG_CF_TRUE_COLOR`），它将被忽略。

可以使用`lv_canvas_copy_buf(canvas, buffer_to_copy, x, y, width, height)`将像素数组复制到画布。
缓冲区和画布的颜色格式需要匹配。

<details>
<summary>查看原文</summary>
<p>

To draw something to the canvas use
- `lv_canvas_draw_rect(canvas, x, y, width, heigth, &draw_dsc)`
- `lv_canvas_draw_text(canvas, x, y, max_width, &draw_dsc, txt)`
- `lv_canvas_draw_img(canvas, x, y, &img_src, &draw_dsc)`
- `lv_canvas_draw_line(canvas, point_array, point_cnt, &draw_dsc)`
- `lv_canvas_draw_polygon(canvas, points_array, point_cnt, &draw_dsc)`
- `lv_canvas_draw_arc(canvas, x, y, radius, start_angle, end_angle, &draw_dsc)`

`draw_dsc` is a `lv_draw_rect/label/img/line/arc_dsc_t` variable which should be first initialized with one of `lv_draw_rect/label/img/line/arc_dsc_init()` and then modified with the desired colors and other values.

The draw function can draw to any color format. For example, it's possible to draw a text to an `LV_IMG_VF_ALPHA_8BIT` canvas and use the result image as a [draw mask](/overview/drawing) later.

</p>
</details>

要在画布上绘制一些东西，请使用
- `lv_canvas_draw_rect(canvas, x, y, width, heigth, &draw_dsc)`
- `lv_canvas_draw_text(canvas, x, y, max_width, &draw_dsc, txt)`
- `lv_canvas_draw_img(canvas, x, y, &img_src, &draw_dsc)`
- `lv_canvas_draw_line(canvas, point_array, point_cnt, &draw_dsc)`
- `lv_canvas_draw_polygon(canvas, points_array, point_cnt, &draw_dsc)`
- `lv_canvas_draw_arc(canvas, x, y, radius, start_angle, end_angle, &draw_dsc)`

`draw_dsc` 是一个 `lv_draw_rect/label/img/line/arc_dsc_t` 变量，它应该首先使用 `lv_draw_rect/label/img/line/arc_dsc_init()` 中的一个进行初始化，然后使用所需的颜色和其他值进行修改。

draw 函数可以绘制成任何颜色格式。 例如，可以在“LV_IMG_VF_ALPHA_8BIT”画布上绘制文本，然后将结果图像用作[绘制蒙版](/overview/drawing)。

### Transformations（变换）

<details>
<summary>查看原文</summary>
<p>

`lv_canvas_transform()` can be used to rotate and/or scale the image of an image and store the result on the canvas. 
The function needs the following parameters:
- `canvas` pointer to a canvas object to store the result of the transformation.
- `img pointer` to an image descriptor to transform. Can be the image descriptor of an other canvas too (`lv_canvas_get_img()`).
- `angle` the angle of rotation (0..3600), 0.1 deg resolution
- `zoom` zoom factor (256: no zoom, 512: double size, 128: half size);
- `offset_x` offset X to tell where to put the result data on destination canvas
- `offset_y` offset X to tell where to put the result data on destination canvas
- `pivot_x` pivot X of rotation. Relative to the source canvas. Set to `source width / 2` to rotate around the center
- `pivot_y` pivot Y of rotation. Relative to the source canvas. Set to `source height / 2` to rotate around the center
- `antialias` true: apply anti-aliasing during the transformation. Looks better but slower.
 
Note that a canvas can't be rotated on itself.  You need a source and destination canvas or image.

</p>
</details>

`lv_canvas_transform()` 可用于旋转和/或缩放图像的图像并将结果存储在画布上。
该函数需要以下参数：
- `canvas` 指向一个画布对象的指针，用于存储转换的结果。
- 指向要转换的图像描述符的“img 指针”。也可以是其他画布的图像描述符（`lv_canvas_get_img()`）。
- `angle` 旋转角度 (0..3600)，0.1 度分辨率
- `zoom` 缩放系数（256：无缩放，512：双倍尺寸，128：半尺寸）；
- `offset_x` 偏移 X 来告诉将结果数据放在目标画布上的什么位置
- `offset_y` 偏移 X 来告诉将结果数据放在目标画布上的什么位置
- `pivot_x` 旋转的枢轴 X。相对于源画布。设置为 `source width / 2` 以围绕中心旋转
- `pivot_y` 旋转轴 Y。相对于源画布。设置为 `source height / 2` 以围绕中心旋转
- `antialias` true：在转换过程中应用抗锯齿。看起来更好但更慢。
 
请注意，画布不能自行旋转。您需要一个源和目标画布或图像。

### Blur（糊化）

<details>
<summary>查看原文</summary>
<p>

A given area of the canvas can be blurred horizontally with `lv_canvas_blur_hor(canvas, &area, r)` or vertically with `lv_canvas_blur_ver(canvas, &area, r)`. 
`r` is the radius of the blur (greater value means more intensive burring). `area` is the area where the blur should be applied (interpreted relative to the canvas).

</p>
</details>

画布的给定区域可以使用 `lv_canvas_blur_hor(canvas, &area, r)` 进行水平模糊处理，或者使用 `lv_canvas_blur_ver(canvas, &area, r)` 进行垂直模糊处理。
`r` 是模糊的半径（值越大意味着毛刺越强）。 `area` 是应该应用模糊的区域（相对于画布进行解释）。

## Events（事件）

<details>
<summary>查看原文</summary>
<p>

No special events are sent by canvas objects.
The same events are sent as for the 

See the events of the [Images](/widgets/core/img) too.

Learn more about [Events](/overview/event).

</p>
</details>

画布对象不会发送特殊事件。

也可以查看 [Images](/widgets/core/img) 的事件。

详细了解 [事件](/overview/event)。

## Keys（按键）

<details>
<summary>查看原文</summary>
<p>

No *Keys* are processed by the object type.

Learn more about [Keys](/overview/indev).

</p>
</details>

对象类型不处理 *Keys*。

了解有关 [Keys](/overview/indev) 的更多信息。

## Example
```eval_rst

.. include:: ../../../examples/widgets/canvas/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_canvas.h
  :project: lvgl

```
