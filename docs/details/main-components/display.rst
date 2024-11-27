.. _display:

================
Displays（显示）
================

.. raw:: html

   <details>
     <summary>显示原文</summary>

:important: The basic concept of a *display* in LVGL is explained in the :ref:`porting` section. So before reading further, please read that section first.

.. raw:: html

   </details>
   <br>


:重要提示: LVGL中的 *显示* 基本概念在 :ref:`porting` 章节有解释。因此在继续阅读之前，请先阅读该部分。


.. _display_multi_display_support:

Multiple display support（多显示器支持）
***************************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

In LVGL you can have multiple displays, each with their own driver,
widgets and color depth.

Creating more displays is easy: just use :cpp:func:`lv_display_create` and
add set the buffer and the ``flush_cb``. When you create the UI, use
:cpp:expr:`lv_display_set_default(disp)` to tell the library on which display to
create objects.

Why would you want multi-display support? Here are some examples:

- Have a "normal" TFT display with local UI and create "virtual" screens on VNC
  on demand. (You need to add your VNC driver).
- Have a large TFT display and a small monochrome display.
- Have some smaller and simple displays in a large instrument or technology.
- Have two large TFT displays: one for a customer and one for the shop assistant.

.. raw:: html

   </details>
   <br>


在LVGL中，你可以拥有多个显示器，每个显示器都有自己的驱动程序、控件和颜色深度。

创建多个的显示器很简单：只需使用 :cpp:func:`lv_display_create` 并设置缓冲区和 ``flush_cb``。当你创建UI时，使用 :cpp:expr:`lv_display_set_default(disp)` 告诉库在哪个显示器上创建对象。

为什么你需要多显示器支持呢？以下是一些例子：

- 有一个“正常”彻底TFT显示屏，带有本地UI，并在VNC上按需创建“虚拟”屏幕。（你需要添加VNC驱动程序）。
- 有一个大型TFT显示屏和一个小型单色显示屏。
- 在大型仪器或技术设备中有一些较小且简单的显示器。
- 有两个大型TFT显示器：一个供客户使用，一个供店员使用。


.. _display_one_display:

Using only one display（仅使用一个显示器）
-----------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Using more displays can be useful but in most cases it's not required.
Therefore, the whole concept of multi-display handling is completely
hidden if you register only one display. By default, the last created
(and only) display is used.

:cpp:func:`lv_screen_active`, :cpp:func:`lv_screen_load`, :cpp:func:`lv_layer_top`,
:cpp:func:`lv_layer_sys`, :c:macro:`LV_HOR_RES` and :c:macro:`LV_VER_RES` are always applied
on the most recently created (default) display. If you pass ``NULL`` as
``disp`` parameter to display related functions the default display will
usually be used. E.g. :cpp:expr:`lv_display_trigger_activity(NULL)` will trigger a
user activity on the default display. (See below in :ref:`Inactivity <display_inactivity>`).

.. raw:: html

   </details>
   <br>


使用多个的显示器可能会很有用的，但在大多数情况下并不是必需的。
因此，如果您只注册一个显示器，则整个多显示器处理的概念将完全被隐藏。
默认情况下，将使用最后创建的（也是唯一的）显示器。

:cpp:func:`lv_screen_active`、:cpp:func:`lv_screen_load`、:cpp:func:`lv_layer_top`、
:cpp:func:`lv_layer_sys`、:c:macro:`LV_HOR_RES` 和 :c:macro:`LV_VER_RES` 总是应用于最近创建的（默认）显示器。
如果您将 ``NULL`` 作为 ``disp`` 参数传递给显示相关的函数，通常会使用默认显示器。
例如，:cpp:expr:`lv_display_trigger_activity(NULL)` 将在默认显示器上触发用户活动。（在下面的 :ref:`Inactivity <display_inactivity>` 中查看）。


Mirror display（镜像显示）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To mirror the image of a display to another display, you don't need to
use multi-display support. Just transfer the buffer received in
``flush_cb`` to the other display too.

.. raw:: html

   </details>
   <br>


将一个显示器的图像镜像到另一个显示器上，你不需要使用多显示器支持。只需将在 ``flush_cb`` 中接收到的缓冲区也传输到另一个显示器上即可。


Split image（分割图像）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can create a larger virtual display from an array of smaller ones.
You can create it as below: 1. Set the resolution of the displays to the
large display's resolution. 2. In ``flush_cb``, truncate and modify the
``area`` parameter for each display. 3. Send the buffer's content to
each real display with the truncated area.

.. raw:: html

   </details>
   <br>


你可以从一组较小的显示器创建一个更大的虚拟显示器。

创建步骤如下：

1. 将显示器的分辨率设置为大显示器的分辨率。
2. 在 ``flush_cb`` 函数中，截取和修改每个显示器的 ``area`` 参数。
3. 使用截取后的区域将缓冲区的内容发送到每个真实的显示器。

.. _display_screens:

Screens（屏幕）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Every display has its own set of :ref:`screens <objects_screens>` and the
objects on each screen.

Be sure not to confuse displays and screens:

-  **Displays** are the physical hardware drawing the pixels.
-  **Screens** are the high-level root objects associated with a
   particular display. One display can have multiple screens associated
   with it, but not vice versa.

Screens can be considered the highest level containers which have no
parent. A screen's size is always equal to its display and their origin
is (0;0). Therefore, a screen's coordinates can't be changed,
i.e. :cpp:func:`lv_obj_set_pos`, :cpp:func:`lv_obj_set_size` or similar functions
can't be used on screens.

A screen can be created from any object type but the two most typical
types are :ref:`Base object <lv_obj>` and :ref:`Image <lv_image>`
(to create a wallpaper).

To create a screen, use
:cpp:expr:`lv_obj_t * scr = lv_<type>_create(NULL)`. ``NULL`` indicates no parent.

To load a screen, use :cpp:expr:`lv_screen_load(scr)`. To get the active screen,
use :cpp:expr:`lv_screen_active()`. These functions work on the default display. If
you want to specify which display to work on, use
:cpp:expr:`lv_display_get_screen_active(disp)` and :cpp:expr:`lv_display_load_screen(disp, scr)`. A
screen can be loaded with animations too. Read more
:ref:`here <objects_load_screens>`.

Screens can be deleted with :cpp:expr:`lv_obj_delete(scr)`, but ensure that you do
not delete the currently loaded screen.

.. raw:: html

   </details>
   <br>


每个显示器都有自己的一组屏幕（:ref:`屏幕 <objects_screens>`）和每个屏幕上的对象。

确保不要混淆显示器和屏幕：

- **显示器** 是绘制像素的物理硬件。
- **屏幕** 是与特定显示器关联的高级根对象。一个显示器可以有多个与之关联的屏幕，但反之不行。

屏幕可以被视为是没有父对象的最高级别容器。屏幕的大小始终等于其显示器的大小，它们的原点是（0；0）。因此，屏幕的坐标无法更改，即不能在屏幕上使用 :cpp:func:`lv_obj_set_pos`、:cpp:func:`lv_obj_set_size` 或类似的函数。

屏幕可以由任何对象类型创建，但最常见的两种类型是 :ref:`基本对象 <lv_obj>` 和 :ref:`Image <lv_image>` （用于创建壁纸）。

要创建一个屏幕，请使用 :cpp:expr:`lv_obj_t * scr = lv_<type>_create(NULL)`。 ``NULL`` 表示没有父对象。

要加载一个屏幕，请使用 :cpp:expr:`lv_screen_load(scr)`。要获取活动屏幕，请使用 :cpp:expr:`lv_screen_active()`。这些函数适用于默认显示器。如果您要指定要在哪个显示器上工作，请使用 :cpp:expr:`lv_display_get_screen_active(disp)` 和 :cpp:expr:`lv_display_load_screen(disp, scr)`。屏幕还可以加载动画。了解更多信息，请参阅 :ref:`这里 <objects_load_screens>`。

屏幕可以使用 :cpp:expr:`lv_obj_delete(scr)` 删除，但请确保不要删除当前加载的屏幕。


Transparent screens（透明屏幕）
------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Usually, the opacity of the screen is :cpp:enumerator:`LV_OPA_COVER` to provide a
solid background for its children. If this is not the case (opacity <
100%) the display's ``bottom_layer`` be visible. If the bottom layer's
opacity is also not :cpp:enumerator:`LV_OPA_COVER` LVGL has no solid background to
draw.

This configuration (transparent screen and display) could be used to
create for example OSD menus where a video is played on a lower layer,
and a menu is overlaid on an upper layer.

To properly render the screen the display's color format needs to be set
to one with alpha channel.

In summary, to enable transparent screens and displays for OSD menu-like
UIs:

- Set the screen's ``bg_opa`` to transparent:
  :cpp:expr:`lv_obj_set_style_bg_opa(lv_screen_active(), LV_OPA_TRANSP, LV_PART_MAIN)`
- Set the bottom layer's ``bg_opa`` to transparent:
  :cpp:expr:`lv_obj_set_style_bg_opa(lv_layer_bottom(), LV_OPA_TRANSP, LV_PART_MAIN)`
- Set the screen's ``bg_opa`` to 0:
  :cpp:expr:`lv_obj_set_style_bg_opa(lv_screen_active(), LV_OPA_0, LV_PART_MAIN)`
- Set a color format with alpha channel. E.g.
  :cpp:expr:`lv_display_set_color_format(disp, LV_COLOR_FORMAT_ARGB8888)`

.. raw:: html

   </details>
   <br>


通常，屏幕的不透明度是 :cpp:enumerator:`LV_OPA_COVER`，以便为它的子对象提供一个坚实的背景。如果不是这种情况（不透明度<100%），显示的 ``bottom_layer`` 将会可见。如果底层的不透明度也不是 :cpp:enumerator:`LV_OPA_COVER`，LVGL 将无法绘制坚实的背景。

这种配置（透明屏幕和显示屏）可以用于创建例如在底层播放视频，而在上层覆盖菜单的 OSD 菜单。

为了正确地渲染屏幕，显示的颜色格式需要设置为带有 alpha 通道的格式。

总之，要为 OSD 菜单般的用户界面启用透明屏幕和显示：

- 将屏幕的 ``bg_opa`` 设置为透明:
  :cpp:expr:`lv_obj_set_style_bg_opa(lv_screen_active(), LV_OPA_TRANSP, LV_PART_MAIN)`
- 将底层的 ``bg_opa`` 设置为透明:
  :cpp:expr:`lv_obj_set_style_bg_opa(lv_layer_bottom(), LV_OPA_TRANSP, LV_PART_MAIN)`
- 将屏幕的 ``bg_opa`` 设置为 0:
  :cpp:expr:`lv_obj_set_style_bg_opa(lv_screen_active(), LV_OPA_0, LV_PART_MAIN)`
- 设置一个带有 alpha 通道的颜色格式。例如：
  :cpp:expr:`lv_display_set_color_format(disp, LV_COLOR_FORMAT_ARGB8888)`


.. _display_features:

Features of displays（显示器的特点）
***********************************

.. _display_inactivity:

Inactivity（不活动）
--------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

A user's inactivity time is measured on each display. Every use of an
:ref:`Input device <indev>` (if :ref:`associated with the display <porting_indev_other_features>`) counts as an activity. To
get time elapsed since the last activity, use
:cpp:expr:`lv_display_get_inactive_time(disp)`. If ``NULL`` is passed, the lowest
inactivity time among all displays will be returned (**NULL isn't just
the default display**).

You can manually trigger an activity using
:cpp:expr:`lv_display_trigger_activity(disp)`. If ``disp`` is ``NULL``, the default
screen will be used (**and not all displays**).

.. raw:: html

   </details>
   <br>


用户的不活动时间是在每个显示器上进行测量的。每次使用 :ref:`Input device <indev>` （如果 :ref:`与显示器相关联 <porting_indev_other_features>`）都会被视为一次活动。要获取自上次活动以来经过的时间，请使用 :cpp:expr:`lv_display_get_inactive_time(disp)`。
如果传递了 ``NULL``，则将返回所有显示器中最低的不活动时间（ **“NULL”不只是默认显示器**）。

您可以使用 :cpp:expr:`lv_display_trigger_activity(disp)` 手动触发一次活动。如果 ``disp`` 是 ``NULL``，则将使用默认屏幕（ **而不是所有显示器**）。


Background（背景）
------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Every display has a background color, background image and background
opacity properties. They become visible when the current screen is
transparent or not positioned to cover the whole display.

The background color is a simple color to fill the display. It can be
adjusted with :cpp:expr:`lv_obj_set_style_bg_color(obj, color)`;

The display background image is a path to a file or a pointer to an
:cpp:struct:`lv_image_dsc_t` variable (converted image data) to be used as
wallpaper. It can be set with :cpp:expr:`lv_obj_set_style_bg_image_src(obj, &my_img)`;
If a background image is configured the background won't be filled with
``bg_color``.

The opacity of the background color or image can be adjusted with
:cpp:expr:`lv_obj_set_style_bg_opa(obj, opa)`.

The ``disp`` parameter of these functions can be ``NULL`` to select the
default display.

.. raw:: html

   </details>
   <br>


每个显示器都有背景颜色，背景图像和背景不透明度属性。当当前屏幕是透明的或未定位以覆盖整个显示屏时，它们就会变得可见。

背景颜色是填充显示器的简单颜色。可以使用 :cpp:expr:`lv_obj_set_style_bg_color(obj, color)` 来调整它。

显示器背景图像是一个文件路径或指向 :cpp:struct:`lv_image_dsc_t` 变量（转换后的图像数据）的指针，以用作壁纸。可以使用 :cpp:expr:`lv_obj_set_style_bg_img_src(obj, &my_img)` 来设置它。
如果配置了背景图像，背景就不会用 ``bg_color`` 填充。

背景颜色或图像的不透明度可以使用 :cpp:expr:`lv_obj_set_style_bg_opa(obj, opa)` 来调整。

这些函数的 ``disp`` 参数可以是 ``NULL`` 以选择默认显示。


.. _display_api:

API
***
