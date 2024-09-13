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
To make the variable visible in the C file, you need to declare it with
:cpp:expr:`LV_IMAGE_DECLARE(converted_img_var)`.

To use external files, you also need to convert the image files using
the online converter tool but now you should select the binary output
format. You also need to use LVGL's file system module and register a
driver with some functions for the basic file operation. Go to the
:ref:`File system <overview_file_system>` to learn more. To set an image sourced
from a file, use :cpp:expr:`lv_image_set_src(img, "S:folder1/my_img.bin")` .

You can also set a symbol similarly to :ref:`Labels <lv_label>`. In
this case, the image will be rendered as text according to the *font*
specified in the style. It enables to use of light-weight monochrome
"letters" instead of real images. You can set symbol like :cpp:expr:`lv_image_set_src(img1, LV_SYMBOL_OK)` .

.. raw:: html

   </details> 
   <br>


为了提供最大的灵活性，图像的来源可以是：

- 代码中的变量（带有像素的 C 数组）。
- 外部存储的文件（例如在 SD 卡上）。
- 带有 :ref:`Symbols(符号) <fonts_symbols>` 的文本。

要设置图像的来源，请使用 :cpp:expr:`lv_image_set_src(img, src)` 接口。

要从 PNG、JPG 或 BMP 图像生成像素数组，请使用 `LVGL官网的在线图像转换工具 <https://lvgl.io/tools/imageconverter>`__ 并将转换后的图像指针（比如 ``converted_img_var`` ）通过接口函数 :cpp:expr:`lv_image_set_src(img1, &converted_img_var)` 使用。要使该变量在 C 文件中可见，需要使用 :cpp:expr:`LV_IMAGE_DECLARE(converted_img_var)` 声明它。

要使用外部文件，还需要使用 `LVGL官网的在线图像转换工具 <https://lvgl.io/tools/imageconverter>`__  转换图像文件，这时候需要选择转为二进制输出格式；转出来之后还需要使用 :ref:`LVGL 的文件系统接口 <overview_file_system>` 对接你适配好的文件系统驱动。 要设置来自文件系统的二进制图像文件，请使用这样使用该接口 :cpp:expr:`lv_image_set_src(img, "S:folder1/my_img.bin")` 。

图像控件还可以显示类似于 :ref:`标签 <lv_label>` 控件那样显示 :ref:`Symbols(符号) <fonts_symbols>` 或者字符；在这种情况下，图像将根据样式中指定的 *font* 呈现文本。 它允许使用轻量级单色 “字母” 而不是真实图像，例如 :cpp:expr:`lv_image_set_src(img1, LV_SYMBOL_OK "Some text")` 。


Label as an image（标签作为图象）
----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Images and labels are sometimes used to convey the same thing. For
example, to describe what a button does. Therefore, images and labels
are somewhat interchangeable, that is the images can display texts by
using :c:macro:`LV_SYMBOL_DUMMY` as the prefix of the text. For example,
:cpp:expr:`lv_image_set_src(img, LV_SYMBOL_DUMMY, "Some text")`.

.. raw:: html

   </details> 
   <br>


图像和标签有时可以用于传达相同的内容，例如，描述按钮的作用。因此，图像和标签在某种程度上是可以互换的，也就是说图像可以通过使用 :c:macro:`LV_SYMBOL_DUMMY` 作为文本的前缀来显示文本。 例如， :cpp:expr:`lv_image_set_src(img, LV_SYMBOL_DUMMY "Some text")` 。


Transparency（透明度）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The internal (variable) and external images support 2 transparency
handling methods:

-  **Alpha byte**: An alpha byte is added to every pixel that contains
   the pixel's opacity

.. raw:: html

   </details> 
   <br>


内部（变量）和外部图像支持 2 种透明度处理方法：

- **Alpha 字节** 向每个包含像素不透明度的像素添加一个 Alpha 字节


Palette and Alpha index（调色板和 Alpha 索引）
-----------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Besides the *True color* (RGB) color format, the following formats are
supported:

- **Indexed**: Image has a palette.
- **Alpha indexed**: Only alpha values are stored.

These options can be selected in the image converter. To learn more
about the color formats, read the :ref:`Images <overview_image>` section.

.. raw:: html

   </details> 
   <br>


除了 *True color* (RGB) 颜色格式外，还支持以下格式：

- **Indexed（索引）** ： 图像有调色板。

- **Alpha indexed（透明度索引）** ：仅存储 Alpha（透明度） 值。

可以在图像转换器中选择这些选项。 要了解有关颜色格式的更多信息，请阅读 :ref:`图像 <overview_image>`  部分。


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
displayed image. Useful if the object size is smaller than the image
source size. Using the offset parameter a `Texture atlas <https://en.wikipedia.org/wiki/Texture_atlas>`__
or a "running image" effect can be created by :ref:`Animating <animations>` the x or y offset.

.. raw:: html

   </details> 
   <br>


可以通过接口 :cpp:expr:`lv_image_set_offset_x(img, x_ofs)` 和 :cpp:expr:`lv_image_set_offset_y(img, y_ofs)` 为显示的图像添加一些偏移，这在对象尺寸小于图像源大小的情况下非常有用。使用偏移参数，可以创建一个 `纹理图集 <https://en.wikipedia.org/wiki/Texture_atlas>`__ 或 "运行图像 "效果，可以通过动画 :ref:`Animating <animations>` 设置 x 或 y 偏移量。


Transformations（转换）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Using the :cpp:expr:`lv_image_set_scale(img, factor)` the images will be zoomed.
Set ``factor`` to ``256`` or :c:macro:`LV_SCALE_NONE` to disable zooming. A
larger value enlarges the images (e.g. ``512`` double size), a smaller
value shrinks it (e.g. ``128`` half size). Fractional scale works as
well. E.g. ``281`` for 10% enlargement.

:cpp:expr:`lv_image_set_scale_x(img, factor)` and
:cpp:expr:`lv_image_set_scale_y(img, factor)` also can be used to
the scale independently horizontally and vertically (non-uniform scale).

To rotate the image use :cpp:expr:`lv_image_set_rotation(img, angle)`. Angle has 0.1
degree precision, so for 45.8° set 458.

By default, the pivot point of the rotation is the center of the image.
It can be changed with :cpp:expr:`lv_image_set_pivot(img, pivot_x, pivot_y)`.
``0;0`` is the top left corner.

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

**IMPORTANT** The transformation of the image is independent of the
transformation properties coming from styles. (See
:ref:`here <styles_opacity_blend_modes_transformations>`). The main
differences are that pure image widget transformation

- doesn't transform the children of the image widget
- image is transformed directly without creating an intermediate layer (buffer) to snapshot the widget

.. raw:: html

   </details> 
   <br>


可以通过接口 :cpp:expr:`lv_image_set_scale(img, factor)` 缩放图像，参数 ``factor`` 控制缩放，将其设置为 ``256`` 或 :c:macro:`LV_SCALE_NONE` 就是不进行缩放；一个较大的值会放大图像（例如 ``512`` 放大两倍），较小的值会缩小它（例如 ``128`` 缩小一半）；分数缩放也可以同样有效。例如 ``281`` 用于 10% 的放大。

可以通过函数 :cpp:expr:`lv_image_set_scale_x(img, factor)` 和 :cpp:expr:`lv_image_set_scale_y(img, factor)` 进行水平和垂直独立缩放（非均匀缩放）。

要旋转图像，请使用 :cpp:expr:`lv_image_set_rotation(img, angle)` ； 参数 ``factor`` 控制角度，其角度精度为 0.1 度，比如，要设置为 45.8° 将其设置为458。

默认情况下，旋转的轴心点是图像的中心，可以通过函数 :cpp:expr:`lv_image_set_pivot(img, pivot_x, pivot_y)` 更改轴心点； 参数 ``pivot_x`` , ``pivot_y`` 就是要指定的轴心点坐标，比如 ``[0, 0]`` 意思是将轴心点改到图像的左上角。

转换的质量可以通过函数 :cpp:expr:`lv_image_set_antialias(img, true)` 进行调整；启用抗锯齿会让转换质量更高，但速度较慢。

转换需要整个图像可用。因此索引图像 (``LV_COLOR_FORMAT_I1/2/4/8_...``)，仅 Alpha 图像无法转换。 换言之，转换仅适用于存储为 C 数组的普通 (A)RGB 或 A8 图像有效，或者如果自定义 :ref:`overview_image_decoder` 返回整个图像。

注意，图像对象的真实坐标在转换过程中不会改变。也就是说，:cpp:expr:`lv_obj_get_width/height/x/y()` 将返回原始的、未缩放的坐标。

**重要** 图像的转换与来自样式的转换属性无关，(请阅读 :ref:`这里 <styles_opacity_blend_modes_transformations>` )。主要区别在于纯图像控件的转换。

- 不会转换图像控件的子项
- 图像直接转换，无需创建中间层（缓冲区）来快照控件


Inner align（内部对齐）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

By default the image widget's width and height is :cpp:enumerator:`LV_SIZE_CONTENT`.
It means that the widget will be sized automatically according to the image source.

If the widget's width or height is set the larger value the ``inner_align`` property tells
how to align the image source inside the widget.

The alignment set any of these:

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

The ``offset`` value is applied after the image source is aligned. For example setting an ``y=-10``
and :cpp:enumerator:`LV_IMAGE_ALIGN_CENTER` will move the image source up a little bit
from the center of the widget.

Or to automatically scale or tile the image

- :cpp:enumerator:`LV_IMAGE_ALIGN_STRETCH` Set X and Y scale to fill the widget's area
- :cpp:enumerator:`LV_IMAGE_ALIGN_TILE` Tile the image to will the widget area. Offset is applied to shift the tiling.

The alignment can be set by :cpp:func:`lv_image_set_inner_align`

.. raw:: html

   </details> 
   <br>


默认情况下，图像控件的宽度和高度为 :cpp:enumerator:`LV_SIZE_CONTENT` ，也就是说其会根据图像源自动调整大小。

如果宽度或高度设置为较大的值，则 ``inner_align`` 属性会告知如何在图像控件内对齐图像源。

对齐方式可以设置为：

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

``offset（偏移）`` 值在图像源对齐后应用。例如，设置 ``y=-10`` 和 :cpp:enumerator:`LV_IMAGE_ALIGN_CENTER` 将使图像源从控件的中心向上移动一些。

或者自动缩放或平铺图像

- :cpp:enumerator:`LV_IMAGE_ALIGN_STRETCH` 自动根据 X 和 Y 的比例来平铺填充控件的区域，即使控件区域不对称。
- :cpp:enumerator:`LV_IMAGE_ALIGN_TILE` 将图像像印章那样平铺满控件区域，底层应用 offset（偏移） 来移动平铺。

对齐方式可以通过调用此函数设置 :cpp:func:`lv_image_set_inner_align`


.. _lv_image_events:

Events（事件）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No special events are sent by image objects.

See the events of the :ref:`Base object <lv_obj>` too.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


图像对象不发送特殊事件。

请阅读 :ref:`基本对象 <lv_obj>` 的事件。

详细了解更多 :ref:`events` 。


.. _lv_image_keys:

Keys（按键）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No *Keys* are processed by the object type.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


图像对象不处理 *Keys* 。

阅读了解有关 :ref:`indev_keys` 的更多信息。

.. _lv_image_example:

Example
**********

.. include:: ../examples/widgets/image/index.rst

.. _lv_image_api:

API
****
