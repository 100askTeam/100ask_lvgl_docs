.. _lv_image:

========================
Image （图象）(lv_image)
========================

Overview（概述）
******************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Images are the basic object to display images from flash (as arrays) or
from files. Images can display symbols (``LV_SYMBOL_...``) too.

Using the :ref:`Image decoder interface <overview_image_decoder>` custom image formats
can be supported as well.

.. raw:: html

   </details> 
   <br>


图像是显示来自闪存（数组）或来自文件的图像的基本对象。 图像也可以显示符号 (``LV_SYMBOL_...``) 。

使用 :ref:`图像解码器接口( Image decoder interface) <overview_image_decoder>` 也可以支持自定义图像格式。


.. _lv_image_parts_and_styles:

Parts and Styles（部分和样式）
********************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

- :cpp:enumerator:`LV_PART_MAIN` A background rectangle that uses the typical
  background style properties and the image itself using the image
  style properties.

.. raw:: html

   </details> 
   <br>


- :cpp:enumerator:`LV_PART_MAIN` 使用典型背景样式属性的背景矩形和使用图像样式（img）属性的图像本身。


.. _lv_image_usage:

Usage（用法）
****************

Image source（图片来源）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To provide maximum flexibility, the source of the image can be:

- a variable in code (a C array with the pixels).
- a file stored externally (e.g. on an SD card).
- a text with :ref:`Symbols <fonts_symbols>`.

To set the source of an image, use :cpp:expr:`lv_image_set_src(img, src)`.

To generate a pixel array from a PNG, JPG or BMP image, use the `Online image converter tool <https://lvgl.io/tools/imageconverter>`__
and set the converted image with its pointer  :cpp:expr:`lv_image_set_src(img1, &converted_img_var)`
To make the converted image variable accessible from the C file, you need to declare it with
:cpp:expr:`LV_IMAGE_DECLARE(converted_img_var)`.

To use external files, you also need to convert the image files using
the online converter tool, but select the binary output
format. You also need to use LVGL's file system module and register a
driver with some functions for basic file operations.  See
:ref:`File system <overview_file_system>` to learn more.  Then set the translated
image as the image source with :cpp:expr:`lv_image_set_src(img, "S:folder1/my_img.bin")`.

You can also set a symbol as an image source similar to a :ref:`Labels <lv_label>`. In
this case, the image will be rendered as text according to the *font*
specified in the style. It enables the use of light-weight monochrome
"characters" instead of real images. You can set a symbol as an image source with
:cpp:expr:`lv_image_set_src(img1, LV_SYMBOL_OK)`.

.. raw:: html

   </details> 
   <br>


为了提供最大的灵活性，图像的来源可以是：

- 代码中的变量（带有像素的 C 数组）。
- 外部存储的文件（例如在 SD 卡上）。
- 带有 :ref:`Symbols(符号) <fonts_symbols>` 的文本。

要设置图像的来源，请使用 :cpp:expr:`lv_image_set_src(img, src)` 接口。

要从 PNG、JPG 或 BMP 图像生成像素数组，请使用 `LVGL官网的在线图像转换工具 <https://lvgl.io/tools/imageconverter>`__ 并将转换后的图像指针（比如 ``converted_img_var`` ）通过接口函数 :cpp:expr:`lv_image_set_src(img1, &converted_img_var)` 使用。要使转换后的图像变量能从 C 文件中访问，需要使用 :cpp:expr:`LV_IMAGE_DECLARE(converted_img_var)` 声明它。

若要使用外部文件，你还需要使用在线转换工具对图像文件进行转换，不过要选择二进制输出格式。此外，还需要使用 LVGL（轻量级图形库）的文件系统模块，并注册一个带有一些用于基本文件操作功能的驱动程序。可查看 :ref:`File system <overview_file_system>` 以了解更多相关内容。然后使用 :cpp:expr:`lv_image_set_src(img, "S:folder1/my_img.bin")`将转换后的图像设置为图像源。

你还可以将一个符号设置为图像源，这与 :ref:`Labels <lv_label>` 的用法类似。在这种情况下，图像将依据样式中指定的 *font* 被渲染成文本。这样一来，就可以使用轻量级的单色 “字符” 来替代真实图像了。你可以使用 :cpp:expr:`lv_image_set_src(img1, LV_SYMBOL_OK)` 来将一个符号设置为图像源。

Label as an image（标签作为图象）
----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Images and labels are sometimes used to convey the same thing, such as
describing what a button does.  In this context, images and labels
are somewhat interchangeable:  images can display text by
using the macro :c:macro:`LV_SYMBOL_DUMMY` (which equates to a 3-byte C string
containing a special code) as the prefix of the text.  For example,
``lv_image_set_src(img, LV_SYMBOL_DUMMY "Some text")``.

.. raw:: html

   </details> 
   <br>


图像和标签有时用于传达相同的内容，比如描述一个按钮的功能。在这种情况下，图像和标签在一定程度上是可以互换的：图像能够通过使用宏 :c:macro:`LV_SYMBOL_DUMMY`（它等同于一个包含特殊代码的 3 字节 C 语言字符串）作为文本前缀来显示文本。例如， ``lv_image_set_src(img, LV_SYMBOL_DUMMY "Some text")`` 这样的用法。

Transparency（透明度）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The internal (variable) and external images support 2 transparency
handling methods:

-  **Alpha byte**: An alpha channel is added to every pixel that contains
   its opacity, typically a byte.  It is the 'A' in the the various color formats
   that contain an alpha channel, such as ARGB8888, ARGB8565, ARGB1555, etc.
-  **Indexed transparent color**:  a specific index in a color palette serves to
   signal transparency for each pixel that uses it.

.. raw:: html

   </details> 
   <br>


内部（变量）和外部图像支持 2 种透明度处理方法：

-  **Alpha 字节**：每个像素都会添加一个包含其不透明度信息的 Alpha 通道，通常为一个字节。它就是各种包含 Alpha 通道的颜色格式（如 ARGB8888、ARGB8565、ARGB1555 等）中的 “A”。
-  **索引透明色**：调色板中的某个特定索引用于表示使用该索引的每个像素的透明性。

Palette and Alpha index（调色板和 Alpha 索引）
-----------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Besides the *True color* (RGB) color format, the following formats are
supported:

- **Indexed**: Image has a color palette, and each pixel is an index into that palette.
- **Alpha indexed**: The values stored at pixel positions are alpha (opacity) values.

These options can be selected in the image converter. To learn more
about the color formats, read the :ref:`overview_image_color_formats` section.

.. raw:: html

   </details> 
   <br>


除了 *True color* (RGB) 颜色格式外，还支持以下格式：

- **Indexed（索引）** ： 图像具有一个调色板，并且每个像素都是指向该调色板的一个索引。

- **Alpha indexed（透明度索引）** ：存储在像素位置处的值为 Alpha（不透明度）值。

可以在图像转换器中选择这些选项。 要了解有关颜色格式的更多信息，请阅读 :ref:`overview_image_color_formats`  部分。


Recolor（重新着色）
--------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

A color can be mixed with every pixel of an image with a given
intensity. This can be useful to show different states (checked,
inactive, pressed, etc.) of an image without storing more versions of
the same image. This feature can be enabled in the style by setting
``img_recolor_opa`` between :cpp:enumerator:`LV_OPA_TRANSP` (no recolor, value: 0) and
:cpp:enumerator:`LV_OPA_COVER` (full recolor, value: 255). The default value is
:cpp:enumerator:`LV_OPA_TRANSP` so this feature is disabled.

The color to mix is set by ``img_recolor``.

.. raw:: html

   </details> 
   <br>


颜色可以与具有给定强度的图像的每个像素混合。 这对于显示图像的不同状态（选中、非活动、按下等）非常有用，而无需存储同一图像的更多版本。 可以通过在 :cpp:enumerator:`LV_OPA_TRANSP` （无重新着色，值：0）和 :cpp:enumerator:`LV_OPA_COVER` （完全重新着色，值：255）之间设置 ``image_recolor_opa`` 在样式中启用此功能。 默认值为 :cpp:enumerator:`LV_OPA_TRANSP` 因此禁用此功能。

要混合的颜色通过 ``image_recolor`` 样式设置。


Offset（偏移量）
-----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

With :cpp:expr:`lv_image_set_offset_x(img, x_ofs)` and
:cpp:expr:`lv_image_set_offset_y(img, y_ofs)`, you can add some offset to the
displayed image. Useful if the Widget size is smaller than the image
source size. Using the offset parameter a `Texture atlas <https://en.wikipedia.org/wiki/Texture_atlas>`__
or a "running image" effect can be created by :ref:`Animating <animations>` the x or y offset.

.. raw:: html

   </details> 
   <br>


可以通过接口 :cpp:expr:`lv_image_set_offset_x(img, x_ofs)` 和 :cpp:expr:`lv_image_set_offset_y(img, y_ofs)` 为显示的图像添加一些偏移，这在部件尺寸小于图像源大小的情况下非常有用。使用偏移参数，可以创建一个 `纹理图集 <https://en.wikipedia.org/wiki/Texture_atlas>`__ 或 "运行图像 "效果，可以通过动画 :ref:`Animating <animations>` 设置 x 或 y 偏移量。


Transformations（转换）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can zoom images in or out by using :cpp:expr:`lv_image_set_scale(img, factor)`.
Set ``factor`` to ``256`` or :c:macro:`LV_SCALE_NONE` to disable zooming. A
larger value enlarges the images (e.g. ``512`` double size), a smaller
value shrinks it (e.g. ``128`` half size). Fractional scaling works using a value
that is proportionally larger or smaller, e.g. ``281`` for 10% enlargement.

:cpp:expr:`lv_image_set_scale_x(img, factor)` and
:cpp:expr:`lv_image_set_scale_y(img, factor)` also can be used to
the scale independently horizontally and vertically (non-uniform scale).

To rotate the image use :cpp:expr:`lv_image_set_rotation(img, angle_x10)`.
The ``angle_x10`` argument is an ``int32_t`` containing the angle (in degrees)
multiplied by 10.  This gives 0.1-degree resolution.  Example:  458 means 45.8°.

By default, the pivot point of the rotation is the center of the image.
This can be changed with :cpp:expr:`lv_image_set_pivot(img, pivot_x, pivot_y)` where
the coordinates ``(0,0)`` represent the top left corner.

The quality of the transformation can be adjusted with
:cpp:expr:`lv_image_set_antialias(img, true)`. With enabled anti-aliasing
the transformations are higher quality but slower.

The transformations require the whole image to be available. Therefore
indexed images (``LV_COLOR_FORMAT_I1/2/4/8_...``), alpha only images cannot be transformed.
In other words transformations work only on normal (A)RGB or A8 images stored as
C array, or if a custom :ref:`overview_image_decoder`
returns the whole image.

Note that the real coordinates of image objects won't change during
transformation. That is :cpp:expr:`lv_obj_get_width/height/x/y()` will return
the original, non-zoomed coordinates.

**IMPORTANT**:  The transformation of the image is independent of the transformation
properties :ref:`coming from styles <style_opacity_blend_modes_transformations>`.
The main differences are that pure Image Widget transformations:

- do not transform the children of the Image Widget, and
- the image is transformed directly without creating an intermediate layer (buffer) to snapshot the Widget.

.. raw:: html

   </details> 
   <br>


你可以通过使用 :cpp:expr:`lv_image_set_scale(img, factor)`来对图像进行放大或缩小操作。
将 ``factor`` 设置为 ``256`` 或者 :c:macro:`LV_SCALE_NONE`可禁用缩放功能。较大的值会放大图像（例如， ``512`` 表示放大两倍），较小的值则会缩小图像（例如， ``128`` 表示缩小为一半大小）。分数缩放可使用按比例增大或减小的值来实现，例如， ``281`` 表示放大 10%。

可以通过函数 :cpp:expr:`lv_image_set_scale_x(img, factor)` 和 :cpp:expr:`lv_image_set_scale_y(img, factor)` 进行水平和垂直独立缩放（非均匀缩放）。

要旋转图像，可使用 :cpp:expr:`lv_image_set_rotation(img, angle_x10)`。
``angle_x10`` 参数是一个 ``int32_t`` 类型的数据，它包含的是角度（以度为单位）乘以 10 之后的值。这样可以实现 0.1 度的分辨率。例如，458 就表示 45.8 度。

默认情况下，旋转的中心点是图像的中心。
可以使用 :cpp:expr:`lv_image_set_pivot(img, pivot_x, pivot_y)`来改变这一中心点，其中坐标 ``(0,0)`` 代表图像的左上角。

转换的质量可以通过函数 :cpp:expr:`lv_image_set_antialias(img, true)` 进行调整；启用抗锯齿会让转换质量更高，但速度较慢。

转换需要整个图像可用。因此索引图像 (``LV_COLOR_FORMAT_I1/2/4/8_...``)，仅 Alpha 图像无法转换。 换言之，转换仅适用于存储为 C 数组的普通 (A)RGB 或 A8 图像有效，或者如果自定义 :ref:`overview_image_decoder` 返回整个图像。

注意，图像对象的真实坐标在转换过程中不会改变。也就是说，:cpp:expr:`lv_obj_get_width/height/x/y()` 将返回原始的、未缩放的坐标。

**重要** 图像的变换与那些 :ref:`coming from styles <style_opacity_blend_modes_transformations>` 是相互独立的。
主要区别在于纯粹的图像部件变换具有以下特点：

- 不会变换图像部件的子部件；
- 图像是直接进行变换的，不会创建一个中间层（缓冲区）来对部件进行快照处理。


Inner align（内部对齐）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

By default the image widget's width and height is :cpp:enumerator:`LV_SIZE_CONTENT`.
It means that the widget will be sized automatically according to the image source.

If the Widget's width or height is set to a different value, the value of the ``inner_align``
property (set using :cpp:expr:`lv_image_set_inner_align(widget, align)`) governs how
the image source is aligned inside the Widget.

``align`` can be any of these values:

- :cpp:enumerator:`LV_IMAGE_ALIGN_DEFAULT`: Meaning top left
- :cpp:enumerator:`LV_IMAGE_ALIGN_TOP_LEFT`
- :cpp:enumerator:`LV_IMAGE_ALIGN_TOP_MID`
- :cpp:enumerator:`LV_IMAGE_ALIGN_TOP_RIGHT`
- :cpp:enumerator:`LV_IMAGE_ALIGN_BOTTOM_LEFT`
- :cpp:enumerator:`LV_IMAGE_ALIGN_BOTTOM_MID`
- :cpp:enumerator:`LV_IMAGE_ALIGN_BOTTOM_RIGHT`
- :cpp:enumerator:`LV_IMAGE_ALIGN_LEFT_MID`
- :cpp:enumerator:`LV_IMAGE_ALIGN_RIGHT_MID`
- :cpp:enumerator:`LV_IMAGE_ALIGN_CENTER`
- :cpp:enumerator:`LV_IMAGE_ALIGN_STRETCH`
- :cpp:enumerator:`LV_IMAGE_ALIGN_TILE`

Any ``offset`` value is applied after the image source is aligned. For example setting
an offset of ``y=-10`` with ``align`` == :cpp:enumerator:`LV_IMAGE_ALIGN_CENTER` will
move the image source up 10 pixels from the center of the Widget.

To automatically scale or tile the image, pass one of these ``align`` values:

- :cpp:enumerator:`LV_IMAGE_ALIGN_STRETCH` Set X and Y scale to fill the Widget's area
- :cpp:enumerator:`LV_IMAGE_ALIGN_TILE` Tile image to fill Widget's area. Offset is applied to shift the tiling.


.. raw:: html

   </details> 
   <br>


默认情况下，图像控件的宽度和高度为 :cpp:enumerator:`LV_SIZE_CONTENT` ，也就是说其会根据图像源自动调整大小。

如果部件的宽度或高度被设置为一个不同的值，那么 ``inner_align`` 属性的值（通过:cpp:expr:`lv_image_set_inner_align(widget, align)`进行设置）将决定图像源在部件内部如何对齐。

``align`` 可以是以下任何一个值：

- :cpp:enumerator:`LV_IMAGE_ALIGN_DEFAULT`：意思是左上角
- :cpp:enumerator:`LV_IMAGE_ALIGN_TOP_LEFT`
- :cpp:enumerator:`LV_IMAGE_ALIGN_TOP_MID`
- :cpp:enumerator:`LV_IMAGE_ALIGN_TOP_RIGHT`
- :cpp:enumerator:`LV_IMAGE_ALIGN_BOTTOM_LEFT`
- :cpp:enumerator:`LV_IMAGE_ALIGN_BOTTOM_MID`
- :cpp:enumerator:`LV_IMAGE_ALIGN_BOTTOM_RIGHT`
- :cpp:enumerator:`LV_IMAGE_ALIGN_LEFT_MID`
- :cpp:enumerator:`LV_IMAGE_ALIGN_RIGHT_MID`
- :cpp:enumerator:`LV_IMAGE_ALIGN_CENTER`
- :cpp:enumerator:`LV_IMAGE_ALIGN_STRETCH`
- :cpp:enumerator:`LV_IMAGE_ALIGN_TILE`

任何 ``offset`` 值都是在图像源对齐之后应用的。例如，当 ``align`` 的值等于 :cpp:enumerator:`LV_IMAGE_ALIGN_CENTER`时，设置一个 ``y=-10`` 的偏移量，将会把图像源从部件的中心向上移动 10 个像素。

为了自动缩放或平铺图像，可传入以下这些 ``align`` 值中的一个：

- :cpp:enumerator:`LV_IMAGE_ALIGN_STRETCH` 将 X 和 Y 方向的缩放比例设置为填充部件的区域
- :cpp:enumerator:`LV_IMAGE_ALIGN_TILE` 平铺图像以填充部件的区域。偏移量可应用于此来移动平铺的位置


.. _lv_image_events:

Events（事件）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No special events are sent by Image Widgets.  By default, Image Widgets are created
without the LV_OBJ_FLAG_CLICKABLE flag, but you can add it to make an Image Widget
detect and emit LV_EVENT_CLICKED events if desired.

.. admonition::  Further Reading

    Learn more about :ref:`lv_obj_events` emitted by all Widgets.

    Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


图像部件不会发送特殊事件。默认情况下，图像部件在创建时是没有设置 LV_OBJ_FLAG_CLICKABLE 标志的，但如果有需要，你可以添加该标志，使图像部件能够检测并发出 LV_EVENT_CLICKED 事件。

了解更多关于所有部件都会发出的 :ref:`lv_obj_events` 的相关内容。

了解更多关于 :ref:`events` 的相关内容。


.. _lv_image_keys:

Keys（按键）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No *Keys* are processed by Image Widgets.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


图像部件不会处理任何*按键*操作。

阅读了解有关 :ref:`indev_keys` 的更多信息。

.. _lv_image_example:

Example
**********

.. include:: ../../examples/widgets/image/index.rst

.. _lv_image_api:

API
****
