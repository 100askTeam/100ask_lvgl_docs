```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/porting/display.md
```
# Display interface（显示接口）

<details>
<summary>查看原文</summary>
<p>

To register a display for LVGL a `lv_disp_draw_buf_t` and a `lv_disp_drv_t` variable have to be initialized.
- `lv_disp_draw_buf_t` contains internal graphic buffer(s) called draw buffer(s).
- `lv_disp_drv_t` contains callback functions to interact with the display and manipulate drawing related things.

</p>
</details>

要为 LVGL 注册一个显示器，必须初始化一个 `lv_disp_draw_buf_t` 和一个 `lv_disp_drv_t` 变量。
- `lv_disp_draw_buf_t` 包含称为绘制缓冲区的内部图形缓冲区。
- `lv_disp_drv_t` 包含与显示交互和操作绘图相关事物的回调函数。

## Draw buffer（绘制缓冲区）

<details>
<summary>查看原文</summary>
<p>

Draw buffer(s) are simple array(s) that LVGL uses to render the content of the screen. 
Once rendering is ready the content of the draw buffer is sent to the display using the `flush_cb` function set in the display driver (see below).

A draw draw buffer can be initialized via a `lv_disp_draw_buf_t` variable like this:

</p>
</details>

绘制缓冲区是 LVGL 用来渲染屏幕内容的简单数组。
一旦渲染准备就绪，绘制缓冲区的内容将使用显示驱动程序中设置的 `flush_cb` 函数发送到显示器（见下文）。

绘制绘制缓冲区可以通过“lv_disp_draw_buf_t”变量初始化，如下所示：

```c
/*A static or global variable to store the buffers*/
static lv_disp_draw_buf_t disp_buf;

/*Static or global buffer(s). The second buffer is optional*/
static lv_color_t buf_1[MY_DISP_HOR_RES * 10];
static lv_color_t buf_2[MY_DISP_HOR_RES * 10];

/*Initialize `disp_buf` with the buffer(s). With only one buffer use NULL instead buf_2 */
lv_disp_draw_buf_init(&disp_buf, buf_1, buf_2, MY_DISP_HOR_RES*10);
```

<details>
<summary>查看原文</summary>
<p>

Note that `lv_disp_draw_buf_t` needs to be static, global or dynamically allocated and not a local variable destroyed if goes out of the scope. 

As you can see the draw buffer can be smaller than the screen. In this case, the larger areas will be redrawn in smaller parts that fit into the draw buffer(s).
If only a small area changes (e.g. a button is pressed) then only that area will be refreshed.

A larger buffer results in better performance but above 1/10 screen sized buffer(s) there is no significant performance improvement. 
Therefore it's recommended to choose the size of the draw buffer(s) to at least 1/10 screen sized.

If only **one buffer** is used LVGL draws the content of the screen into that draw buffer and sends it to the display. 
This way LVGL needs to wait until the content of the buffer is sent to the display before drawing something new in it.

If **two buffers**  are used LVGL can draw into one buffer while the content of the other buffer is sent to display in the background. 
DMA or other hardware should be used to transfer the data to the display to let the MCU draw meanwhile.
This way, the rendering and refreshing of the display become parallel. 

</p>
</details>

请注意，`lv_disp_draw_buf_t` 需要是静态的、全局的或动态分配的，而不是超出范围时销毁的局部变量。

如您所见，绘制缓冲区可以小于屏幕。在这种情况下，较大的区域将被重新绘制为适合绘制缓冲区的较小部分。
如果只有一个小区域发生变化（例如按下按钮），则只会刷新该区域。

更大的缓冲区会导致更好的性能，但超过 1/10 屏幕大小的缓冲区没有显着的性能改进。
因此，建议选择绘制缓冲区的大小至少为屏幕大小的 1/10。

如果只使用**一个缓冲区**，LVGL 将屏幕内容绘制到该绘制缓冲区中并将其发送到显示器。
这样 LVGL 需要等到缓冲区的内容发送到显示器，然后再在其中绘制新内容。

如果使用**两个缓冲区**，LVGL 可以绘制到一个缓冲区中，而另一个缓冲区的内容被发送到后台显示。
应使用 DMA 或其他硬件将数据传输到显示器，让 MCU 同时绘制。
这样，显示的渲染和刷新变得并行。

<details>
<summary>查看原文</summary>
<p>

In the display driver (`lv_disp_drv_t`) the `full_refresh` bit can be enabled to force LVGL to always redraw the whole screen. This works in both *one buffer* and *two buffers* modes.

If `full_refresh` is enabled and 2 screen sized draw buffers are provided, LVGL's display handling works like "traditional" double buffering. 
This means in `flush_cb` only the address of the frame buffer needs to be changed to the provided pointer (`color_p` parameter).
This configuration should be used if the MCU has LCD controller periphery and not with an external display controller (e.g. ILI9341 or SSD1963). 

You can measure the performance of different draw buffer configurations using the [benchmark example](https://github.com/lvgl/lv_demos/tree/master/src/lv_demo_benchmark).

</p>
</details>

在显示驱动程序（`lv_disp_drv_t`）中，可以启用 `full_refresh` 位以强制 LVGL 始终重绘整个屏幕。这适用于 *one buffer* 和 *two buffers* 模式。

如果启用 `full_refresh` 并提供 2 个屏幕大小的绘制缓冲区，LVGL 的显示处理就像“传统”双缓冲一样工作。

这意味着在 `flush_cb` 中只有帧缓冲区的地址需要更改为提供的指针（`color_p` 参数）。
如果 MCU 具有 LCD 控制器外围设备而不是外部显示控制器（例如 ILI9341 或 SSD1963），则应使用此配置。

您可以使用 [基准示例](https://github.com/lvgl/lv_demos/tree/master/src/lv_demo_benchmark) 测量不同绘制缓冲区配置的性能。

## Display driver（显示驱动程序）

<details>
<summary>查看原文</summary>
<p>

Once the buffer initialization is ready a `lv_disp_drv_t` display driver needs to be
1. initialized with `lv_disp_drv_init(&disp_drv)`
2. its fields need to be set
3. it needs to be registered in LVGL with `lv_disp_drv_register(&disp_drv)`

Note that `lv_disp_drv_t` also needs to be static, global or dynamically allocated and not a local variable destroyed if goes out of the scope. 

</p>
</details>

一旦缓冲区初始化准备好，`lv_disp_drv_t` 显示驱动程序需要
1. 用`lv_disp_drv_init(&disp_drv)`初始化
2. 它的字段需要设置
3. 需要在LVGL中用`lv_disp_drv_register(&disp_drv)`注册

请注意，`lv_disp_drv_t` 也需要是静态的、全局的或动态分配的，而不是超出范围时销毁的局部变量。

### Mandatory fields（必须要适配的部分）

<details>
<summary>查看原文</summary>
<p>

In the most simple case only the following fields of `lv_disp_drv_t` need to be set:
- `draw_buf` pointer to an initialized `lv_disp_draw_buf_t` variable.
- `hor_res` horizontal resolution of the display in pixels. 
- `ver_res` vertical resolution of the display in pixels.
- `flush_cb` a callback function to copy a buffer's content to a specific area of the display. 
`lv_disp_flush_ready(&disp_drv)` needs to be called when flushing is ready. 
LVGL might render the screen in multiple chunks and therefore call `flush_cb` multiple times. To see if the current one is the last chunk of rendering use `lv_disp_flush_is_last(&disp_drv)`.

</p>
</details>

在最简单的情况下，只需要设置`lv_disp_drv_t`的以下字段：
- 指向初始化的 `lv_disp_draw_buf_t` 变量的 `draw_buf` 指针。
- `hor_res` 显示器的水平分辨率（以像素为单位）。
- `ver_res` 显示器的垂直分辨率（以像素为单位）。
- `flush_cb` 一个回调函数，用于将缓冲区的内容复制到显示器的特定区域。

`lv_disp_flush_ready(&disp_drv)` 需要在刷新准备好时调用。
LVGL 可能会以多个块呈现屏幕，因此多次调用 `flush_cb`。要查看当前是否是渲染的最后一个块，请使用 `lv_disp_flush_is_last(&disp_drv)`。

### Optional fields （可选的部分）

<details>
<summary>查看原文</summary>
<p>

There are some optional data fields:
- `color_chroma_key` A color which will be drawn as transparent on chrome keyed images. Set to `LV_COLOR_CHROMA_KEY` by default from `lv_conf.h`.
- `anti_aliasing` use anti-aliasing (edge smoothing). Enabled by default if `LV_COLOR_DEPTH` is set to at least 16 in `lv_conf.h`.
- `rotated` and `sw_rotate` See the [Rotation](#rotation) section below.
- `screen_transp` if `1` the screen itself can have transparency as well. `LV_COLOR_SCREEN_TRANSP` needs to enabled in `lv_conf.h` and requires `LV_COLOR_DEPTH 32`.
- `user_data` A custom `void `user data for the driver..

</p>
</details>

有一些可选的数据字段：
- `color_chroma_key` 将在镀铬键控图像上绘制为透明的颜色。从`lv_conf.h`默认设置为`LV_COLOR_CHROMA_KEY`。
- `anti_aliasing` 使用抗锯齿（边缘平滑）。如果在 lv_conf.h 中将 LV_COLOR_DEPTH 设置为至少 16，则默认启用。
- `rotated` 和 `sw_rotate` 请参阅下面的 [Rotation](#rotation) 部分。
- `screen_transp` 如果 `1` 屏幕本身也可以具有透明度。 `LV_COLOR_SCREEN_TRANSP` 需要在 `lv_conf.h` 中启用并且需要 `LV_COLOR_DEPTH 32`。
- `user_data` 驱动程序的自定义`void `用户数据..

<details>
<summary>查看原文</summary>
<p>

Some other optional callbacks to make easier and more optimal to work with monochrome, grayscale or other non-standard RGB displays:
- `rounder_cb` Round the coordinates of areas to redraw. E.g. a 2x2 px can be converted to 2x8.
It can be used if the display controller can refresh only areas with specific height or width (usually 8 px height with monochrome displays).
- `set_px_cb` a custom function to write the draw buffer. It can be used to store the pixels more compactly in the draw buffer if the display has a special color format. (e.g. 1-bit monochrome, 2-bit grayscale etc.)
This way the buffers used in `lv_disp_draw_buf_t` can be smaller to hold only the required number of bits for the given area size. Note that, rendering with `set_px_cb` is slower than normal rendering.
- `monitor_cb` A callback function that tells how many pixels were refreshed in how much time. Called when the last chunk is rendered and sent to the display. 
- `clean_dcache_cb` A callback for cleaning any caches related to the display.

</p>
</details>

一些其他可选的回调，使处理单色、灰度或其他非标准 RGB 显示器更容易、更优化：
- `rounder_cb` 四舍五入要重绘的区域的坐标。例如。 2x2 px 可以转换为 2x8。
如果显示控制器只能刷新具有特定高度或宽度的区域（单色显示器通常为 8 像素高度），则可以使用它。
- `set_px_cb` 一个自定义函数来写入绘制缓冲区。如果显示器具有特殊的颜色格式，它可用于将像素更紧凑地存储在绘图缓冲区中。 （例如 1 位单色、2 位灰度等）
这样，`lv_disp_draw_buf_t` 中使用的缓冲区可以更小，以仅容纳给定区域大小所需的位数。请注意，使用`set_px_cb` 渲染比普通渲染慢。
- `monitor_cb` 一个回调函数，告诉我们在多长时间内刷新了多少像素。当最后一个块被渲染并发送到显示器时调用。
- `clean_dcache_cb` 用于清理与显示相关的任何缓存的回调。

<details>
<summary>查看原文</summary>
<p>

LVGL has built-in support to several GPUs (see `lv_conf.h`) but if something else is required these functions can be used to make LVGL use a GPU:
- `gpu_fill_cb` fill an area in the memory with a color.
- `gpu_wait_cb` if any GPU function returns while the GPU is still working, LVGL will use this function when required to make sure GPU rendering is ready.

</p>
</details>

LVGL 内置了对多个 GPU 的支持（参见 `lv_conf.h`），但如果需要其他功能，这些函数可用于使 LVGL 使用 GPU：
- `gpu_fill_cb` 用颜色填充内存中的一个区域。
- `gpu_wait_cb` 如果在 GPU 仍在工作时任何 GPU 函数返回，LVGL 将在需要时使用此函数以确保 GPU 渲染准备就绪。

### Examples（示例）

<details>
<summary>查看原文</summary>
<p>

All together it looks like this:

</p>
</details>

放在一起看起来像这样：

```c
static lv_disp_drv_t disp_drv;          /*A variable to hold the drivers. Must be static or global.*/
lv_disp_drv_init(&disp_drv);            /*Basic initialization*/
disp_drv.draw_buf = &disp_buf;          /*Set an initialized buffer*/
disp_drv.flush_cb = my_flush_cb;        /*Set a flush callback to draw to the display*/
disp_drv.hor_res = 320;                 /*Set the horizontal resolution in pixels*/
disp_drv.ver_res = 240;                 /*Set the vertical resolution in pixels*/

lv_disp_t * disp;
disp = lv_disp_drv_register(&disp_drv); /*Register the driver and save the created display objects*/
```

<details>
<summary>查看原文</summary>
<p>

Here are some simple examples of the callbacks:

</p>
</details>

以下是回调的一些简单示例：

```c
void my_flush_cb(lv_disp_drv_t * disp_drv, const lv_area_t * area, lv_color_t * color_p)
{
    /*The most simple case (but also the slowest) to put all pixels to the screen one-by-one
     *`put_px` is just an example, it needs to implemented by you.*/
    int32_t x, y;
    for(y = area->y1; y <= area->y2; y++) {
        for(x = area->x1; x <= area->x2; x++) {
            put_px(x, y, *color_p)
            color_p++;
        }
    }

    /* IMPORTANT!!!
     * Inform the graphics library that you are ready with the flushing*/
    lv_disp_flush_ready(disp_drv);
}

void my_gpu_fill_cb(lv_disp_drv_t * disp_drv, lv_color_t * dest_buf, const lv_area_t * dest_area, const lv_area_t * fill_area, lv_color_t color);
{
    /*It's an example code which should be done by your GPU*/
    uint32_t x, y;
    dest_buf += dest_width * fill_area->y1; /*Go to the first line*/

    for(y = fill_area->y1; y < fill_area->y2; y++) {
        for(x = fill_area->x1; x < fill_area->x2; x++) {
            dest_buf[x] = color;
        }
        dest_buf+=dest_width;    /*Go to the next line*/
    }
}


void my_rounder_cb(lv_disp_drv_t * disp_drv, lv_area_t * area)
{
  /* Update the areas as needed.
   * For example it makes the area to start only on 8th rows and have Nx8 pixel height.*/
   area->y1 = area->y1 & 0x07;
   area->y2 = (area->y2 & 0x07) + 8;
}

void my_set_px_cb(lv_disp_drv_t * disp_drv, uint8_t * buf, lv_coord_t buf_w, lv_coord_t x, lv_coord_t y, lv_color_t color, lv_opa_t opa)
{
   /* Write to the buffer as required for the display.
    * For example it writes only 1-bit for monochrome displays mapped vertically.*/
   buf += buf_w * (y >> 3) + x;
   if(lv_color_brightness(color) > 128) (*buf) |= (1 << (y % 8));
   else (*buf) &= ~(1 << (y % 8));
}

void my_monitor_cb(lv_disp_drv_t * disp_drv, uint32_t time, uint32_t px)
{
  printf("%d px refreshed in %d ms\n", time, ms);
}

void my_clean_dcache_cb(lv_disp_drv_t * disp_drv, uint32)
{
  /* Example for Cortex-M (CMSIS) */
  SCB_CleanInvalidateDCache();
}
```

## Rotation（旋转屏幕）

<details>
<summary>查看原文</summary>
<p>

LVGL supports rotation of the display in 90 degree increments. You can select whether you'd like software rotation or hardware rotation.

If you select software rotation (`sw_rotate` flag set to 1), LVGL will perform the rotation for you. Your driver can and should assume that the screen width and height have not changed. Simply flush pixels to the display as normal. Software rotation requires no additional logic in your `flush_cb` callback.

There is a noticeable amount of overhead to performing rotation in software, which is why hardware rotation is also available. In this mode, LVGL draws into the buffer as though your screen now has the width and height inverted. You are responsible for rotating the provided pixels yourself.

</p>
</details>

LVGL 支持以 90 度为增量旋转显示器。您可以选择是要软件轮换还是硬件轮换。

如果您选择软件旋转（`sw_rotate` 标志设置为 1），LVGL 将为您执行旋转。您的驱动程序可以并且应该假设屏幕宽度和高度没有改变。只需像往常一样将像素刷新到显示器即可。软件轮换在您的 `flush_cb` 回调中不需要额外的逻辑。

在软件中执行轮换需要大量的开销，这就是硬件轮换也可用的原因。在这种模式下，LVGL 将绘制到缓冲区中，就好像您的屏幕现在具有反转的宽度和高度一样。您有责任自己旋转提供的像素。

<details>
<summary>查看原文</summary>
<p>

The default rotation of your display when it is initialized can be set using the `rotated` flag. The available options are `LV_DISP_ROT_NONE`, `LV_DISP_ROT_90`, `LV_DISP_ROT_180`, or `LV_DISP_ROT_270`. The rotation values are relative to how you would rotate the physical display in the clockwise direction. Thus, `LV_DISP_ROT_90` means you rotate the hardware 90 degrees clockwise, and the display rotates 90 degrees counterclockwise to compensate.

(Note for users upgrading from 7.10.0 and older: these new rotation enum values match up with the old 0/1 system for rotating 90 degrees, so legacy code should continue to work as expected. Software rotation is also disabled by default for compatibility.)

Display rotation can also be changed at runtime using the `lv_disp_set_rotation(disp, rot)` API.

Support for software rotation is a new feature, so there may be some glitches/bugs depending on your configuration. If you encounter a problem please open an issue on [GitHub](https://github.com/lvgl/lvgl/issues).

</p>
</details>

初始化时显示器的默认旋转可以使用 `rotated` 标志设置。可用的选项是“LV_DISP_ROT_NONE”、“LV_DISP_ROT_90”、“LV_DISP_ROT_180”或“LV_DISP_ROT_270”。旋转值与顺时针方向旋转物理显示器的方式有关。因此，`LV_DISP_ROT_90` 表示您将硬件顺时针旋转 90 度，显示器逆时针旋转 90 度以进行补偿。

（请注意从 7.10.0 及更早版本升级的用户：这些新的旋转枚举值与旧的 0/1 系统匹配，用于旋转 90 度，因此遗留代码应继续按预期工作。默认情况下，软件旋转也被禁用以实现兼容性.)

也可以在运行时使用 `lv_disp_set_rotation(disp, rot)` API 更改显示旋转。

支持软件轮换是一项新功能，因此根据您的配置可能存在一些故障/错误。如果您遇到问题，请在 [GitHub](https://github.com/lvgl/lvgl/issues) 上打开一个问题。

## Further reading（深入学习）

<details>
<summary>查看原文</summary>
<p>

- [lv_port_disp_template.c](https://github.com/lvgl/lvgl/blob/master/examples/porting/lv_port_disp_template.c) for a template for your own driver.
- [Drawing](/overview/drawing) to learn more about how rendering works in LVGL.
- [Display features](/overview/display) to learn more about higher level display features.

</p>
</details>

- [lv_port_disp_template.c](https://github.com/lvgl/lvgl/blob/master/examples/porting/lv_port_disp_template.c) 用于您自己的驱动程序的模板。
- [Drawing](/overview/drawing) 了解更多关于渲染在 LVGL 中是如何工作的。
- [显示功能](/overview/display) 以了解有关更高级别显示功能的更多信息。

## API

```eval_rst

.. doxygenfile:: lv_hal_disp.h
  :project: lvgl

```
