```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/overview/display.md
```
# Displays（显示）

<details>
<summary>查看原文</summary>
<p>

``` important:: The basic concept of *display* in LVGL is explained in the [Porting](/porting/display) section. So before reading further, please read the [Porting](/porting/display) section first.
```
 
</p>
</details>

``` important:: LVGL 中*display* 的基本概念在[Porting](/porting/display) 部分进行了解释。因此，在进一步阅读之前，请先阅读 [移植](/porting/display) 部分。
```

## Multiple display support（多显示器支持）

<details>
<summary>查看原文</summary>
<p>

In LVGL, you can have multiple displays, each with their own driver and objects. The only limitation is that every display needs to be have same color depth (as defined in `LV_COLOR_DEPTH`). 
If the displays are different in this regard the rendered image can be converted to the correct format in the drivers `flush_cb`.

Creating more displays is easy: just initialize more display buffers and register another driver for every display.
When you create the UI, use `lv_disp_set_default(disp)` to tell the library on which display to create objects.
 
</p>
</details>

在 LVGL 中，您可以拥有多个显示器，每个显示器都有自己的驱动程序和对象。唯一的限制是每个显示器都需要具有相同的颜色深度（如`LV_COLOR_DEPTH` 中所定义）。
如果在这方面显示不同，渲染图像可以在驱动程序“flush_cb”中转换为正确的格式。

创建更多显示很容易：只需初始化更多显示缓冲区并为每个显示注册另一个驱动程序。
创建 UI 时，使用 `lv_disp_set_default(disp)` 告诉库在哪个显示器上创建对象。

<details>
<summary>查看原文</summary>
<p>

Why would you want multi-display support? Here are some examples:
- Have a "normal" TFT display with local UI and create "virtual" screens on VNC on demand. (You need to add your VNC driver).
- Have a large TFT display and a small monochrome display.
- Have some smaller and simple displays in a large instrument or technology.
- Have two large TFT displays: one for a customer and one for the shop assistant.
 
</p>
</details>

为什么需要多显示器支持？这里有些例子：
- 拥有带有本地 UI 的“正常”TFT 显示，并根据需要在 VNC 上创建“虚拟”屏幕。 （您需要添加您的 VNC 驱动程序）。
- 拥有大型 TFT 显示屏和小型单色显示屏。
- 在大型仪器或技术中使用一些更小更简单的显示器。
- 有两个大的 TFT 显示器：一个给顾客用，一个给店员用。

### Using only one display（仅使用一个显示器）

<details>
<summary>查看原文</summary>
<p>

Using more displays can be useful but in most cases it's not required. Therefore, the whole concept of multi-display is completely hidden if you register only one display.
By default, the lastly created (and only) display is used.

`lv_scr_act()`, `lv_scr_load(scr)`, `lv_layer_top()`, `lv_layer_sys()`, `LV_HOR_RES` and `LV_VER_RES` are always applied on the most recently created (default) screen.
If you pass `NULL` as `disp` parameter to display related function, usually the default display will be used.
E.g. `lv_disp_trig_activity(NULL)` will trigger a user activity on the default screen. (See below in [Inactivity](#Inactivity)).
 
</p>
</details>

使用更多显示器可能很有用，但在大多数情况下不是必需的。因此，如果您只注册一个显示器，则完全隐藏多显示器的整个概念。
默认情况下，使用最后创建的（也是唯一的）显示。

`lv_scr_act()`、`lv_scr_load(scr)`、`lv_layer_top()`、`lv_layer_sys()`、`LV_HOR_RES` 和`LV_VER_RES` 始终应用于最近创建的（默认）屏幕。
如果你将 `NULL` 作为 `disp` 参数传递给显示相关函数，通常会使用默认显示。
例如。 `lv_disp_trig_activity(NULL)` 将在默认屏幕上触发用户活动。 （请参阅下面的 [Inactivity](#Inactivity)）。

### Mirror display（镜像显示）

<details>
<summary>查看原文</summary>
<p>

To mirror the image of the display to another display, you don't need to use the multi-display support. Just transfer the buffer received in `drv.flush_cb` to the other display too.
 
</p>
</details>

要将显示器的图像镜像到另一个显示器，您不需要使用多显示器支持。只需将在 `drv.flush_cb` 中接收到的缓冲区也传输到另一个显示器。

### Split image（分割图像）

<details>
<summary>查看原文</summary>
<p>

You can create a larger display from smaller ones. You can create it as below:
1. Set the resolution of the displays to the large display's resolution.
2. In `drv.flush_cb`, truncate and modify the `area` parameter for each display.
3. Send the buffer's content to each display with the truncated area.
 
</p>
</details>

您可以从较小的显示器创建更大的显示器。您可以按如下方式创建它：
1. 将显示器的分辨率设置为大显示器的分辨率。
2. 在`drv.flush_cb`中，对每个显示器截断并修改`area`参数。
3. 将缓冲区的内容发送到每个截断区域的显示器。

## Screens（屏幕）

<details>
<summary>查看原文</summary>
<p>

Every display has each set of [Screens](overview/object#screen-the-most-basic-parent) and the object on the screens.

Be sure not to confuse displays and screens:

* **Displays** are the physical hardware drawing the pixels.
* **Screens** are the high-level root objects associated with a particular display. One display can have multiple screens associated with it, but not vice versa.

Screens can be considered the highest level containers which have no parent.
The screen's size is always equal to its display and size their position is (0;0). Therefore, the screens coordinates can't be changed, i.e. `lv_obj_set_pos()`, `lv_obj_set_size()` or similar functions can't be used on screens.
 
</p>
</details>

每个显示器都有每组 [屏幕](overview/object#screen-the-most-basic-parent) 和屏幕上的对象。

确保不要混淆显示和屏幕：

* **显示器** 是绘制像素的物理硬件。
* **屏幕** 是与特定显示器关联的高级根对象。一个显示器可以有多个与其关联的屏幕，但反之则不然。

屏幕可以被认为是没有父级的最高级别的容器。
屏幕的大小总是等于它的显示和大小，它们的位置是 (0;0)。因此，屏幕坐标不能改变，即`lv_obj_set_pos()`、`lv_obj_set_size()` 或类似函数不能在屏幕上使用。

<details>
<summary>查看原文</summary>
<p>

A screen can be created from any object type but the two most typical types are the [Base object](/widgets/obj) and the [Image](/widgets/core/img) (to create a wallpaper).

To create a screen, use `lv_obj_t * scr = lv_<type>_create(NULL, copy)`. `copy` can be an other screen to copy it.

To load a screen, use `lv_scr_load(scr)`. To get the active screen, use `lv_scr_act()`. These functions works on the default display. If you want to to specify which display to work on, use `lv_disp_get_scr_act(disp)` and `lv_disp_load_scr(disp, scr)`. Screen can be loaded with animations too. Read more [here](object.html#load-screens).

Screens can be deleted with `lv_obj_del(scr)`, but ensure that you do not delete the currently loaded screen.
 
</p>
</details>

可以从任何对象类型创建屏幕，但最典型的两种类型是 [Base object](/widgets/obj) 和 [Image](/widgets/core/img)（用于创建壁纸）。

要创建屏幕，请使用 `lv_obj_t * scr = lv_<type>_create(NULL, copy)`。 `copy` 可以是另一个屏幕来复制它。

要加载屏幕，请使用 `lv_scr_load(scr)`。要获取活动屏幕，请使用 `lv_scr_act()`。这些功能适用于默认显示。如果你想指定在哪个显示器上工作，使用 `lv_disp_get_scr_act(disp)` 和 `lv_disp_load_scr(disp, scr)`。屏幕也可以加载动画。阅读更多 [此处](object.html#load-screens)。

可以使用`lv_obj_del(scr)` 删除屏幕，但请确保不要删除当前加载的屏幕。

### Transparent screens（透明屏幕）

<details>
<summary>查看原文</summary>
<p>

Usually, the opacity of the screen is `LV_OPA_COVER` to provide a solid background for its children. If it's not the case (opacity &lt; 100%) the display's background color or image will be visible. 
See the [Display background](#display-background) section for more details. If the display's background opacity is also not `LV_OPA_COVER` LVGL has no solid background to draw. 

This configuration (transparent screen and display) could be used to create for example OSD menus where a video is played on a lower layer, and a menu is overlayed on an upper layer.
 
</p>
</details>

通常，屏幕的不透明度为“LV_OPA_COVER”，为其子项提供纯色背景。如果不是这种情况（不透明度 < 100%），显示器的背景颜色或图像将可见。
有关更多详细信息，请参阅 [显示背景](#display-background) 部分。如果显示器的背景不透明度也不是 `LV_OPA_COVER`，则 LVGL 没有可绘制的纯色背景。

这种配置（透明屏幕和显示）可用于创建例如 OSD 菜单，其中视频在下层播放，菜单覆盖在上层。

<details>
<summary>查看原文</summary>
<p>

To handle transparent displays special (slower) color mixing algorithms need to be used by LVGL so this feature needs to enabled with `LV_COLOR_SCREEN_TRANSP` in `lv_conf.h`. 
As this mode operates on the Alpha channel of the pixels `LV_COLOR_DEPTH = 32` is also required. The Alpha channel of 32-bit colors will be 0 where there are no objects and 255 where there are solid objects.

In summary, to enable transparent screen and displays to create OSD menu-like UIs:
- Enable `LV_COLOR_SCREEN_TRANSP` in `lv_conf.h`
- Be sure to use `LV_COLOR_DEPTH 32`
- Set the screens opacity to `LV_OPA_TRANSP` e.g. with `lv_obj_set_style_local_bg_opa(lv_scr_act(), LV_OBJMASK_PART_MAIN, LV_STATE_DEFAULT, LV_OPA_TRANSP)`
- Set the display opacity to `LV_OPA_TRANSP` with `lv_disp_set_bg_opa(NULL, LV_OPA_TRANSP);`
 
</p>
</details>

为了处理透明显示，LVGL 需要使用特殊的（较慢的）颜色混合算法，因此需要通过 `lv_conf.h` 中的 `LV_COLOR_SCREEN_TRANSP` 启用此功能。
由于此模式在像素的 Alpha 通道上运行，因此还需要“LV_COLOR_DEPTH = 32”。 32 位颜色的 Alpha 通道在没有对象时为 0，在有实体对象时为 255。

总之，要启用透明屏幕和显示以创建类似 OSD 菜单的 UI：
- 在`lv_conf.h`中启用`LV_COLOR_SCREEN_TRANSP`
- 请务必使用`LV_COLOR_DEPTH 32`
- 将屏幕不透明度设置为“LV_OPA_TRANSP”，例如使用`lv_obj_set_style_local_bg_opa(lv_scr_act(), LV_OBJMASK_PART_MAIN, LV_STATE_DEFAULT, LV_OPA_TRANSP)`
- 使用 `lv_disp_set_bg_opa(NULL, LV_OPA_TRANSP);` 将显示不透明度设置为 `LV_OPA_TRANSP`

## Features of displays（显示器的特点）

### Inactivity（不活动）

<details>
<summary>查看原文</summary>
<p>

The user's inactivity is measured on each display. Every use of an [Input device](/overview/indev) (if [associated with the display](/porting/indev#other-features)) counts as an activity.
To get time elapsed since the last activity, use `lv_disp_get_inactive_time(disp)`. If `NULL` is passed, the overall smallest inactivity time will be returned from all displays (**not the default display**).

You can manually trigger an activity using `lv_disp_trig_activity(disp)`. If `disp` is `NULL`, the default screen will be used (**and not all displays**).
 
</p>
</details>

在每个显示器上测量用户的不活动。每次使用 [输入设备](/overview/indev) （如果 [与显示器相关联](/porting/indev#other-features) ）都算作一次活动。
要获取自上次活动以来经过的时间，请使用 `lv_disp_get_inactive_time(disp)` 。如果传递 `NULL` ，则将从所有显示（**不是默认显示**）返回总体最小不活动时间。

您可以使用 `lv_disp_trig_activity(disp)` 手动触发活动。如果 `disp` 为 `NULL` ，将使用默认屏幕（** 并非所有显示**）。

### Background（背景）

<details>
<summary>查看原文</summary>
<p>

Every display has background color, a background image and background opacity properties. They become visible when the current screen is transparent or not positioned to cover the whole display.

Background color is a simple color to fill the display. It can be adjusted with `lv_disp_set_bg_color(disp, color)`;

Background image is a path to a file or a pointer to an `lv_img_dsc_t` variable (converted image) to be used as wallpaper. It can be set with `lv_disp_set_bg_color(disp, &my_img)`;
If the background image is set (not `NULL`) the background won't be filled with `bg_color`.

The opacity of the background color or image can be adjusted with `lv_disp_set_bg_opa(disp, opa)`. 

The `disp` parameter of these functions can be `NULL` to refer it to the default display.
 
</p>
</details>


每个显示器都有背景颜色、背景图像和背景不透明度属性。当当前屏幕透明或未定位以覆盖整个显示器时，它们变得可见。

背景色是一种简单的颜色来填充显示。可以通过`lv_disp_set_bg_color(disp, color)`进行调整；

背景图像是文件的路径或指向用作墙纸的“lv_img_dsc_t”变量（转换后的图像）的指针。可以用`lv_disp_set_bg_color(disp, &my_img)`设置；
如果设置了背景图像（不是“NULL”），背景将不会被“bg_color”填充。

背景颜色或图像的不透明度可以通过 `lv_disp_set_bg_opa(disp, opa)` 进行调整。

这些函数的 `disp` 参数可以是 `NULL` 以引用默认显示。


## API

```eval_rst

.. doxygenfile:: lv_disp.h
  :project: lvgl

```
