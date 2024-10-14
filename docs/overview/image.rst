.. _overview_image:

==============
Images（图象）
==============

.. raw:: html

   <details>
     <summary>显示原文</summary>

An image can be a file or a variable which stores the bitmap itself and
some metadata.

.. raw:: html

   </details>
   <br>


图像可以是一个文件，也可以是一个存储位图本身以及一些元数据的变量。

Store images（存储图像）
************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can store images in two places

- as a variable in internal memory (RAM or ROM)
- as a file

.. raw:: html

   </details>
   <br>


你可以将图像存储在两个地方：

- 作为内部存储器中的变量（RAM或ROM）
- 作为文件


.. _overview_image_variables:

Variables（变量）
-----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>


Images stored internally in a variable are composed mainly of an
:cpp:struct:`lv_image_dsc_t` structure with the following fields:

- **header**:

  - *cf*: Color format. See :ref:`below <overview_image_color_formats>`
  - *w*: width in pixels (<= 2048)
  - *h*: height in pixels (<= 2048)
  - *always zero*: 3 bits which need to be always zero
  - *reserved*: reserved for future use
- **data**: pointer to an array where the image itself is stored
- **data_size**: length of ``data`` in bytes

These are usually stored within a project as C files. They are linked
into the resulting executable like any other constant data.

.. raw:: html

   </details>
   <br>


在变量中存储的图像主要由下面几个字段组成的 :cpp:struct:`lv_image_dsc_t` 结构体：

- **头部**：

  - *cf*：颜色格式。请参见 :ref:`below <overview_image_color_formats>`
  - *w*：以像素为单位的宽度（<= 2048）
  - *h*：以像素为单位的高度（<= 2048）
  - *always zero*：总是为零的3比特
  - *reserved*：为未来使用保留
- **数据**：指向存储图像本身的数组的指针
- **data_size**： ``数据`` 的长度，以字节为单位

这些通常以C文件的形式存储在项目中。它们像其他常量数据一样被链接进最终生成的可执行文件中。


.. _overview_image_files:

Files（文件）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To deal with files you need to add a storage *Drive* to LVGL. In short,
a *Drive* is a collection of functions (*open*, *read*, *close*, etc.)
registered in LVGL to make file operations. You can add an interface to
a standard file system (FAT32 on SD card) or you create your simple file
system to read data from an SPI Flash memory. In every case, a *Drive*
is just an abstraction to read and/or write data to memory. See the
:ref:`File system <overview_file_system>` section to learn more.

Images stored as files are not linked into the resulting executable, and
must be read into RAM before being drawn. As a result, they are not as
resource-friendly as images linked at compile time. However, they are
easier to replace without needing to rebuild the main program.

.. raw:: html

   </details>
   <br>


为了处理文件，你需要给LVGL添加一个存储 *驱动器*。简而言之，
一个 *驱动器* 是在LVGL中注册的一组函数（ *打开*、 *读取*、 *关闭* 等）
用于进行文件操作。你可以添加一个标准文件系统的接口
（例如SD卡上的FAT32），或者你可以创建自己的简易文件系统
来从SPI Flash存储器读取数据。无论哪种情况， *驱动器* 
只是一个抽象，用来读取和/或写入数据到存储器。查看
:ref:`File system <overview_file_system>` 部分以了解更多。

存储为文件的图像不会链接到生成的可执行文件中，
必须在绘制之前读入RAM。因此，它们不像在编译时链接的图像那样
资源友好。然而，它们更容易被替换，无需重新构建主程序。


.. _overview_image_color_formats:

Color formats（颜色格式）
*************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Various built-in color formats are supported:

- :cpp:enumerator:`LV_COLOR_FORMAT_NATIVE`: Simply stores the RGB colors (in whatever color depth LVGL is configured for).
- :cpp:enumerator:`LV_COLOR_FORMAT_NATIVE_WITH_ALPHA`: Like :cpp:enumerator:`LV_COLOR_FORMAT_NATIVE` but it also adds an alpha (transparency) byte for every pixel.
- :cpp:enumerator:`LV_COLOR_FORMAT_I1`, :cpp:enumerator:`LV_COLOR_FORMAT_I2`, :cpp:enumerator:`LV_COLOR_FORMAT_I4`, :cpp:enumerator:`LV_COLOR_FORMAT_I8`:
  Uses a palette with 2, 4, 16 or 256 colors and stores each pixel in 1, 2, 4 or 8 bits.
- :cpp:enumerator:`LV_COLOR_FORMAT_A1`, :cpp:enumerator:`LV_COLOR_FORMAT_A2`, :cpp:enumerator:`LV_COLOR_FORMAT_A4`, :cpp:enumerator:`LV_COLOR_FORMAT_A8`:
  **Only stores the Alpha value with 1, 2, 4 or 8 bits.** The pixels take the color of ``style.img_recolor`` and
  the set opacity. The source image has to be an alpha channel. This is
  ideal for bitmaps similar to fonts where the whole image is one color
  that can be altered.

The bytes of :cpp:enumerator:`LV_COLOR_FORMAT_NATIVE` images are stored in the following order.

- 32-bit color depth:
    - **Byte 0**: Blue
    - **Byte 1**: Green
    - **Byte 2**: Red
    - **Byte 3**: Alpha (only with :cpp:enumerator:`LV_COLOR_FORMAT_NATIVE_WITH_ALPHA`)
- 16-bit color depth:
    - **Byte 0**: Green 3 lower bit, Blue 5 bit
    - **Byte 1**: Red 5 bit, Green 3 higher bit
    - **Byte 2**: Alpha byte (only with :cpp:enumerator:`LV_COLOR_FORMAT_NATIVE_WITH_ALPHA`)
- 8-bit color depth:
    - **Byte 0**: Red 3 bit, Green 3 bit, Blue 2 bit
    - **Byte 2**: Alpha byte (only with :cpp:enumerator:`LV_COLOR_FORMAT_NATIVE_WITH_ALPHA`)

You can store images in a *Raw* format to indicate that it's not encoded
with one of the built-in color formats and an external :ref:`Image decoder <overview_image_decoder>`
needs to be used to decode the image.

- :cpp:enumerator:`LV_COLOR_FORMAT_RAW`: Indicates a basic raw image (e.g. a PNG or JPG image).
- :cpp:enumerator:`LV_COLOR_FORMAT_RAW_ALPHA`: Indicates that an image has alpha and an alpha byte is added for every pixel.

.. raw:: html

   </details>
   <br>


支持多种内置颜色格式：

- :cpp:enumerator:`LV_COLOR_FORMAT_NATIVE`：简单地保存RGB颜色（在LVGL配置的任何颜色深度下）。
- :cpp:enumerator:`LV_COLOR_FORMAT_NATIVE_WITH_ALPHA`：类似于 :cpp:enumerator:`LV_COLOR_FORMAT_NATIVE`，但它还为每个像素增加了一个alpha（透明度）字节。
- :cpp:enumerator:`LV_COLOR_FORMAT_I1` ，:cpp:enumerator:`LV_COLOR_FORMAT_I2` ，:cpp:enumerator:`LV_COLOR_FORMAT_I4` ，:cpp:enumerator:`LV_COLOR_FORMAT_I8`：
  使用具有2、4、16或256种颜色的调色板，并将每个像素存储在1、2、4或8比特中。
- :cpp:enumerator:`LV_COLOR_FORMAT_A1` ，:cpp:enumerator:`LV_COLOR_FORMAT_A2` ，:cpp:enumerator:`LV_COLOR_FORMAT_A4` ，:cpp:enumerator:`LV_COLOR_FORMAT_A8`：
  **仅以1、2、4或8比特存储Alpha值。** 像素采用 ``style.img_recolor`` 的颜色和设定的透明度。源图像必须是alpha通道。这非常适合于整个图像是一种可以更改的颜色的位图，类似于字体。

:cpp:enumerator:`LV_COLOR_FORMAT_NATIVE` 图像的字节按以下顺序存储。

- 32位颜色深度：
    - **字节 0**：蓝色
    - **字节 1**：绿色
    - **字节 2**：红色
    - **字节 3**：Alpha（仅限 :cpp:enumerator:`LV_COLOR_FORMAT_NATIVE_WITH_ALPHA`）
- 16位颜色深度：
    - **字节 0**：绿色低3位，蓝色5位
    - **字节 1**：红色5位，绿色高3位
    - **字节 2**：Alpha字节（仅限 :cpp:enumerator:`LV_COLOR_FORMAT_NATIVE_WITH_ALPHA`）
- 8位颜色深度：
    - **字节 0**：红色3位，绿色3位，蓝色2位
    - **字节 2**：Alpha字节（仅限 :cpp:enumerator:`LV_COLOR_FORMAT_NATIVE_WITH_ALPHA`）

您可以将图像存储为 *Raw* 格式，以表示它没有使用内置颜色格式之一进行编码，需要使用外部 :ref:`图像解码器<overview_image_decoder>` 来解码图像。

- :cpp:enumerator:`LV_COLOR_FORMAT_RAW`：表示基本的原始图像（例如PNG或JPG图像）。
- :cpp:enumerator:`LV_COLOR_FORMAT_RAW_ALPHA`：表示图像具有alpha，并为每个像素增加了一个alpha字节。


Add and use images（添加和使用图像）
***********************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can add images to LVGL in two ways:

- using the online converter
- manually create images

.. raw:: html

   </details>
   <br>


您可以通过两种方式向LVGL添加图像：

- 使用在线转换器
- 手动创建图像


Online converter（在线转换器）
-----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The online Image converter is available here:
https://lvgl.io/tools/imageconverter

Adding an image to LVGL via the online converter is easy.

1. You need to select a *BMP*, *PNG* or *JPG* image first.
2. Give the image a name that will be used within LVGL.
3. Select the :ref:`Color format <overview_image_color_formats>`.
4. Select the type of image you want. Choosing a binary will generate a
   ``.bin`` file that must be stored separately and read using the :ref:`file support <overview_image_files>`.
   Choosing a variable will generate a standard C file that can be linked into your project.
5. Hit the *Convert* button. Once the conversion is finished, your
   browser will automatically download the resulting file.

In the generated C arrays (variables), bitmaps for all the color depths
(1, 8, 16 or 32) are included in the C file, but only the color depth
that matches :c:macro:`LV_COLOR_DEPTH` in *lv_conf.h* will actually be linked
into the resulting executable.

In the case of binary files, you need to specify the color format you
want:

- RGB332 for 8-bit color depth
- RGB565 for 16-bit color depth
- RGB565 Swap for 16-bit color depth (two bytes are swapped)
- RGB888 for 32-bit color depth

.. raw:: html

   </details>
   <br>


在线图像转换器可以在这里找到：
https://lvgl.io/tools/imageconverter

通过在线转换器将图像添加到LVGL非常简单。

1. 首先，您需要选择一个 *BMP*、*PNG* 或 *JPG* 图像。
2. 给图像一个在LVGL中使用的名称。
3. 选择 :ref:`颜色格式 <overview_image_color_formats>`。
4. 选择您想要的图像类型。选择二进制将生成一个
   必须单独存储并使用 :ref:`文件支持 <overview_image_files>` 读取的 ``.bin`` 文件。
   选择变量将生成一个标准的C文件，可以链接到您的项目中。
5. 点击 *转换* 按钮。转换完成后，您的
   浏览器将自动下载生成的文件。

在生成的C数组（变量）中，所有颜色深度
（1、8、16或32位）的位图都包含在C文件中，但只有与在 *lv_conf.h* 中的 :c:macro:`LV_COLOR_DEPTH` 宏匹配的颜色深度
才会实际链接到生成的可执行文件中。

对于二进制文件，您需要指定您想要的颜色格式：

- 8位颜色深度的RGB332
- 16位颜色深度的RGB565
- 16位颜色深度的RGB565交换（两字节交换）
- 32位颜色深度的RGB888


Manually create an image（手动创建图像）
---------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If you are generating an image at run-time, you can craft an image
variable to display it using LVGL. For example:

.. code:: c

   uint8_t my_img_data[] = {0x00, 0x01, 0x02, ...};

   static lv_image_dsc_t my_img_dsc = {
       .header.always_zero = 0,
       .header.w = 80,
       .header.h = 60,
       .data_size = 80 * 60 * LV_COLOR_DEPTH / 8,
       .header.cf = LV_COLOR_FORMAT_NATIVE,          /*Set the color format*/
       .data = my_img_data,
   };

Another (possibly simpler) option to create and display an image at
run-time is to use the :ref:`Canvas <lv_canvas>` object.

.. raw:: html

   </details>
   <br>


如果您在运行时生成图像，您可以创建一个图像变量来使用LVGL显示它。例如：

.. code:: c

   uint8_t my_img_data[] = {0x00, 0x01, 0x02, ...};

   static lv_image_dsc_t my_img_dsc = {
       .header.always_zero = 0,
       .header.w = 80,
       .header.h = 60,
       .data_size = 80 * 60 * LV_COLOR_DEPTH / 8,
       .header.cf = LV_COLOR_FORMAT_NATIVE,          /*设置颜色格式*/
       .data = my_img_data,
   };

另一个（可能更简单的）选项来创建和显示运行时图像是使用 :ref:`Canvas <lv_canvas>` 对象。


Use images（使用图片）
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The simplest way to use an image in LVGL is to display it with an
:ref:`lv_image` object:

.. code:: c

   lv_obj_t * icon = lv_image_create(lv_screen_active(), NULL);

   /*From variable*/
   lv_image_set_src(icon, &my_icon_dsc);

   /*From file*/
   lv_image_set_src(icon, "S:my_icon.bin");

If the image was converted with the online converter, you should use
:cpp:expr:`LV_IMAGE_DECLARE(my_icon_dsc)` to declare the image in the file where
you want to use it.

.. raw:: html

   </details>
   <br>


在LVGL中使用图片的最简单方式是通过一个 :ref:`lv_image` 对象来显示它：

.. code:: c

   lv_obj_t * icon = lv_image_create(lv_screen_active(), NULL);

   /*从变量加载*/
   lv_image_set_src(icon, &my_icon_dsc);

   /*从文件加载*/
   lv_image_set_src(icon, "S:my_icon.bin");

如果图片是通过在线转换器转换的，你应该使用
:cpp:expr:`LV_IMAGE_DECLARE(my_icon_dsc)` 在你想使用它的文件中声明这个图片。


.. _overview_image_decoder:

Image decoder（图像解码器）
***************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

As you can see in the :ref:`overview_image_color_formats` section, LVGL
supports several built-in image formats. In many cases, these will be
all you need. LVGL doesn't directly support, however, generic image
formats like PNG or JPG.

To handle non-built-in image formats, you need to use external libraries
and attach them to LVGL via the *Image decoder* interface.

An image decoder consists of 4 callbacks:

- **info** get some basic info about the image (width, height and color format).
- **open** open an image:
    - store a decoded image
    - set it to ``NULL`` to indicate the image can be read line-by-line.
- **get_area** if *open* didn't fully open an image this function should give back part of image as decoded data.
- **close** close an opened image, free the allocated resources.

You can add any number of image decoders. When an image needs to be
drawn, the library will try all the registered image decoders until it
finds one which can open the image, i.e. one which knows that format.

The following formats are understood by the built-in decoder:
- ``LV_COLOR_FORMAT_I1``
- ``LV_COLOR_FORMAT_I2``
- ``LV_COLOR_FORMAT_I4``
- ``LV_COLOR_FORMAT_I8``
- ``LV_COLOR_FORMAT_RGB888``
- ``LV_COLOR_FORMAT_XRGB8888``
- ``LV_COLOR_FORMAT_ARGB8888``
- ``LV_COLOR_FORMAT_RGB565``
- ``LV_COLOR_FORMAT_RGB565A8``

.. raw:: html

   </details>
   <br>


如在 :ref:`overview_image_color_formats` 部分中所见，LVGL 支持多种内置图像格式。在许多情况下，这些就是你所需要的全部。然而，LVGL 并不直接支持通用图像格式，如 PNG 或 JPG。

要处理非内置图像格式，你需要使用外部库，并通过 *图像解码器*接口将它们连接到LVGL。

一个图像解码器由4个回调组成：

- **info** 获取关于图像的一些基本信息（宽度、高度和颜色格式）。
- **open** 打开一个图像：
    - 存储解码后的图像
    - 设置为 ``NULL`` 表示图像可以逐行读取。
- **get_area** 如果 *open* 没有完全打开图像，这个函数应该返回图像的一部分作为解码数据。
- **close** 关闭打开的图像，释放分配的资源。

你可以添加任意数量的图像解码器。当需要绘制一个图像时，库会尝试所有注册的图像解码器，直到找到一个能够打开该图像的解码器，即一个知道那种格式的解码器。

内置解码器理解以下格式：

- ``LV_COLOR_FORMAT_I1``
- ``LV_COLOR_FORMAT_I2``
- ``LV_COLOR_FORMAT_I4``
- ``LV_COLOR_FORMAT_I8``
- ``LV_COLOR_FORMAT_RGB888``
- ``LV_COLOR_FORMAT_XRGB8888``
- ``LV_COLOR_FORMAT_ARGB8888``
- ``LV_COLOR_FORMAT_RGB565``
- ``LV_COLOR_FORMAT_RGB565A8``


Custom image formats（自定义图像格式）
-------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The easiest way to create a custom image is to use the online image
converter and select ``Raw`` or ``Raw with alpha`` format.
It will just take every byte of the
binary file you uploaded and write it as an image "bitmap". You then
need to attach an image decoder that will parse that bitmap and generate
the real, renderable bitmap.

``header.cf`` will be :cpp:enumerator:`LV_COLOR_FORMAT_RAW`, :cpp:enumerator:`LV_COLOR_FORMAT_RAW_ALPHA`
accordingly. You should choose the correct format according to your needs:
a fully opaque image, using an alpha channel.

After decoding, the *raw* formats are considered *True color* by the
library. In other words, the image decoder must decode the *Raw* images
to *True color* according to the format described in the :ref:`overview_image_color_formats` section.

.. raw:: html

   </details>
   <br>


创建自定义图像最简单的方法是使用在线图像转换器，并选择 ``Raw`` 或 ``Raw with alpha`` 格式。它将获取你上传的二进制文件的每个字节，并将其作为图像 “位图” 写入。
然后你需要附加一个图像解码器，它会解析该位图并生成真正的、可渲染的位图。

``header.cf`` 将分别是 :cpp:enumerator:`LV_COLOR_FORMAT_RAW` ，:cpp:enumerator:`LV_COLOR_FORMAT_RAW_ALPHA`。
根据你的需求，你应该选择正确的格式：完全不透明的图像，或用alpha通道的图像。

解码后，这些 *raw* 格式会被库视为 *True color* 。换句话说，图像解码器必须根据 :ref:`overview_image_color_formats` 章节中描述的格式，将 *Raw* 图像解码为 *True color*图像。


Register an image decoder（注册图像解码器）
------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Here's an example of getting LVGL to work with PNG images.

First, you need to create a new image decoder and set some functions to
open/close the PNG files. It should look like this:

.. code:: c

   /*Create a new decoder and register functions */
   lv_image_decoder_t * dec = lv_image_decoder_create();
   lv_image_decoder_set_info_cb(dec, decoder_info);
   lv_image_decoder_set_open_cb(dec, decoder_open);
   lv_image_decoder_set_close_cb(dec, decoder_close);


   /**
    * Get info about a PNG image
    * @param decoder   pointer to the decoder where this function belongs
    * @param src       can be file name or pointer to a C array
    * @param header    image information is set in header parameter
    * @return          LV_RESULT_OK: no error; LV_RESULT_INVALID: can't get the info
    */
   static lv_result_t decoder_info(lv_image_decoder_t * decoder, const void * src, lv_image_header_t * header)
   {
     /*Check whether the type `src` is known by the decoder*/
     if(is_png(src) == false) return LV_RESULT_INVALID;

     /* Read the PNG header and find `width` and `height` */
     ...

     header->cf = LV_COLOR_FORMAT_ARGB8888;
     header->w = width;
     header->h = height;
   }

   /**
    * Open a PNG image and decode it into dsc.decoded
    * @param decoder   pointer to the decoder where this function belongs
    * @param dsc       image descriptor
    * @return          LV_RESULT_OK: no error; LV_RESULT_INVALID: can't open the image
    */
   static lv_result_t decoder_open(lv_image_decoder_t * decoder, lv_image_decoder_dsc_t * dsc)
   {
     (void) decoder; /*Unused*/

     /*Check whether the type `src` is known by the decoder*/
     if(is_png(dsc->src) == false) return LV_RESULT_INVALID;

     /*Decode and store the image. If `dsc->decoded` is `NULL`, the `decoder_get_area` function will be called to get the image data line-by-line*/
     dsc->decoded = my_png_decoder(dsc->src);

     /*Change the color format if decoded image format is different than original format. For PNG it's usually decoded to ARGB8888 format*/
     dsc->decoded.header.cf = LV_COLOR_FORMAT_...

     /*Call a binary image decoder function if required. It's not required if `my_png_decoder` opened the image in true color format.*/
     lv_result_t res = lv_bin_decoder_open(decoder, dsc);

     return res;
   }

   /**
    * Decode an area of image
    * @param decoder      pointer to the decoder where this function belongs
    * @param dsc          image decoder descriptor
    * @param full_area    input parameter. the full area to decode after enough subsequent calls
    * @param decoded_area input+output parameter. set the values to `LV_COORD_MIN` for the first call and to reset decoding.
    *                     the decoded area is stored here after each call.
    * @return             LV_RESULT_OK: ok; LV_RESULT_INVALID: failed or there is nothing left to decode
    */
   static lv_result_t decoder_get_area(lv_image_decoder_t * decoder, lv_image_decoder_dsc_t * dsc,
                                    const lv_area_t * full_area, lv_area_t * decoded_area)
   {
    /**
     * If `dsc->decoded` is always set in `decoder_open` then `decoder_get_area` does not need to be implemented.
     * If `dsc->decoded` is only sometimes set or never set in `decoder_open` then `decoder_get_area` is used to
     * incrementally decode the image by calling it repeatedly until it returns `LV_RESULT_INVALID`.
     * In the example below the image is decoded line-by-line but the decoded area can have any shape and size
     * depending on the requirements and capabilities of the image decoder.
     */
     my_decoder_data_t * my_decoder_data = dsc->user_data;
     /* if `decoded_area` has a field set to `LV_COORD_MIN` then reset decoding */
     if(decoded_area->y1 == LV_COORD_MIN) {
       decoded_area->x1 = full_area->x1;
       decoded_area->x2 = full_area->x2;
       decoded_area->y1 = full_area->y1;
       decoded_area->y2 = decoded_area->y1; /* decode line-by-line, starting with the first line */
       /* create a draw buf the size of one line */
       bool reshape_success = NULL != lv_draw_buf_reshape(my_decoder_data->partial,
                                                          dsc->decoded.header.cf,
                                                          lv_area_get_width(full_area),
                                                          1,
                                                          LV_STRIDE_AUTO);
       if(!reshape_success) {
         lv_draw_buf_destroy(my_decoder_data->partial);
         my_decoder_data->partial = lv_draw_buf_create(lv_area_get_width(full_area),
                                                       1,
                                                       dsc->decoded.header.cf,
                                                       LV_STRIDE_AUTO);
         my_png_decode_line_reset(full_area);
       }
     }
     /* otherwise decoding is already in progress. decode the next line */
     else {
       /* all lines have already been decoded. indicate completion by returning `LV_RESULT_INVALID` */
       if (decoded_area->y1 >= full_area->y2) return LV_RESULT_INVALID;
       decoded_area->y1++;
       decoded_area->y2++;
     }
     my_png_decode_line(my_decoder_data->partial);
     return LV_RESULT_OK;
   }

   /**
    * Close PNG image and free data
    * @param decoder   pointer to the decoder where this function belongs
    * @param dsc       image decoder descriptor
    * @return          LV_RESULT_OK: no error; LV_RESULT_INVALID: can't open the image
    */
   static void decoder_close(lv_image_decoder_t * decoder, lv_image_decoder_dsc_t * dsc)
   {
     /*Free all allocated data*/
     my_png_cleanup();
     my_decoder_data_t * my_decoder_data = dsc->user_data;
     lv_draw_buf_destroy(my_decoder_data->partial);
     
     /*Call the built-in close function if the built-in open/get_area was used*/
     lv_bin_decoder_close(decoder, dsc);

   }

So in summary:

- In ``decoder_info``, you should collect some basic information about the image and store it in ``header``.
- In ``decoder_open``, you should try to open the image source pointed by
  ``dsc->src``. Its type is already in ``dsc->src_type == LV_IMG_SRC_FILE/VARIABLE``.
  If this format/type is not supported by the decoder, return :cpp:enumerator:`LV_RESULT_INVALID`.
  However, if you can open the image, a pointer to the decoded image should be
  set in ``dsc->decoded``. If the format is known, but you don't want to
  decode the entire image (e.g. no memory for it), set ``dsc->decoded = NULL`` and
  use ``decoder_get_area`` to get the image area pixels.
- In ``decoder_close`` you should free all allocated resources.
- ``decoder_get_area`` is optional. In this case you should decode the whole image In
  ``decoder_open`` function and store image data in ``dsc->decoded``.
  Decoding the whole image requires extra memory and some computational overhead.

.. raw:: html

   </details>
   <br>


一下是一个使用LVGL处理PNG图像的示例。

首先，您需要创建一个新的图像解码器并设置一些打开/关闭PNG文件的函数。代码如下：

.. code:: c
  /* 创建一个新的解码器并注册函数 */
  lv_image_decoder_t * dec = lv_image_decoder_create();
  lv_image_decoder_set_info_cb(dec, decoder_info);
  lv_image_decoder_set_open_cb(dec, decoder_open);
  lv_image_decoder_set_close_cb(dec, decoder_close);


  /**
  * 获取PNG图像的信息
  * @param decoder  指向解码器的指针
  * @param src      可以是文件名或指向C数组的指针
  * @param header   图像信息存储在header参数中
  * @return         LV_RESULT_OK: 没有错误; LV_RESULT_INVALID: 无法获取信息
  */
  static lv_result_t decoder_info(lv_image_decoder_t * decoder, const void * src, lv_image_header_t * header)
  {
    /* 检查解码器是否识别src的类型 */
    if(is_png(src) == false) return LV_RESULT_INVALID;

    /* 读取PNG文件头并获取 `width` 和 `height` */
    ...

    header->cf = LV_COLOR_FORMAT_ARGB8888;
    header->w = width;
    header->h = height;
  }

  /**
  * 打开PNG图像并将其解码到dsc.decoded中
  * @param decoder  指向解码器的指针
  * @param dsc      图像描述符
  * @return         LV_RESULT_OK: 没有错误; LV_RESULT_INVALID: 无法打开图像
  */
  static lv_result_t decoder_open(lv_image_decoder_t * decoder, lv_image_decoder_dsc_t * dsc)
  {
    (void) decoder; /* 未使用 */

    /*检查解码器是否识别src的类型 */
    if(is_png(dsc->src) == false) return LV_RESULT_INVALID;

    /* 解码并存储图像。如果`dsc->decoded`为`NULL`，则会调用`read_line`函数逐行获取图像数据 */
    dsc->decoded = my_png_decoder(dsc->src);

    /*如果解码后的图像格式与原始格式不同，修改颜色格式。对于PNG图像，通常解码格式为ARGB8888 */
    dsc->decoded.header.cf = LV_COLOR_FORMAT_...

    /*如果需要，调用二进制图像解码器函数。如果`my_png_decoder`以真彩色格式打开了图像，则不需要。*/
    lv_result_t res = lv_bin_decoder_open(decoder, dsc);

    return res;
  }

  /**
  * 解码图像的一个区域
  * @param decoder      指向解码器的指针
  * @param dsc          图像解码器描述符
  * @param full_area    在足够的后续调用后要解码的完整区域
  * @param decoded_area 输入+输出参数。将第一次调用的值设置为“LV_COORD_MIN”并重置解码。
  *                     每次调用后解码区域都存储在这里。
  * @return             LV_RESULT_OK: 没有错误; LV_RESULT_INVALID: 失败或没有任何内容可供解码
  */
  static lv_result_t decoder_get_area(lv_image_decoder_t * decoder, lv_image_decoder_dsc_t * dsc,
                                  const lv_area_t * full_area, lv_area_t * decoded_area)
  {
    /**
     * If `dsc->decoded` is always set in `decoder_open` then `decoder_get_area` does not need to be implemented.
     * If `dsc->decoded` is only sometimes set or never set in `decoder_open` then `decoder_get_area` is used to
     * incrementally decode the image by calling it repeatedly until it returns `LV_RESULT_INVALID`.
     * In the example below the image is decoded line-by-line but the decoded area can have any shape and size
     * depending on the requirements and capabilities of the image decoder.
     */
     my_decoder_data_t * my_decoder_data = dsc->user_data;
     /* if `decoded_area` has a field set to `LV_COORD_MIN` then reset decoding */
     if(decoded_area->y1 == LV_COORD_MIN) {
       decoded_area->x1 = full_area->x1;
       decoded_area->x2 = full_area->x2;
       decoded_area->y1 = full_area->y1;
       decoded_area->y2 = decoded_area->y1; /* decode line-by-line, starting with the first line */
       /* create a draw buf the size of one line */
       bool reshape_success = NULL != lv_draw_buf_reshape(my_decoder_data->partial,
                                                          dsc->decoded.header.cf,
                                                          lv_area_get_width(full_area),
                                                          1,
                                                          LV_STRIDE_AUTO);
       if(!reshape_success) {
         lv_draw_buf_destroy(my_decoder_data->partial);
         my_decoder_data->partial = lv_draw_buf_create(lv_area_get_width(full_area),
                                                       1,
                                                       dsc->decoded.header.cf,
                                                       LV_STRIDE_AUTO);
         my_png_decode_line_reset(full_area);
       }
     }
     /* otherwise decoding is already in progress. decode the next line */
     else {
       /* all lines have already been decoded. indicate completion by returning `LV_RESULT_INVALID` */
       if (decoded_area->y1 >= full_area->y2) return LV_RESULT_INVALID;
       decoded_area->y1++;
       decoded_area->y2++;
     }
     my_png_decode_line(my_decoder_data->partial);
     return LV_RESULT_OK;
  }

  /**
  * 关闭PNG图像并释放数据
  * @param decoder  指向解码器的指针
  * @param dsc      图像解码器描述符
  * @return         LV_RESULT_OK: 没有错误; LV_RESULT_INVALID: 无法打开图像
  */
  static void decoder_close(lv_image_decoder_t * decoder, lv_image_decoder_dsc_t * dsc)
  {
    /* 释放所有分配的数据 */
     my_png_cleanup();
     my_decoder_data_t * my_decoder_data = dsc->user_data;
     lv_draw_buf_destroy(my_decoder_data->partial);

    /* 如果使用了内置的打开/获取区域，则调用内置的关闭函数 */
    lv_bin_decoder_close(decoder, dsc);

  }

总结一下：

- 在 ``decoder_info`` 函数中，您应该收集有关图像的一些基本信息，并将其存储在 ``header`` 中。
- 在 ``decoder_open`` 函数中，您应该尝试打开指向 ``dsc->src`` 的图像源。它的类型已经在 ``dsc->src_type == LV_IMG_SRC_FILE/VARIABLE``中。
  如果该格式/类型不受解码器支持，返回 ``LV_RESULT_INVALID``。然而，如果可以打开图像，应将指向解码图像的指针设置在 ``dsc->decoded`` 中。
  如果已知格式，但不想解码整个图像（例如没有足够的内存），请设置 ``dsc->decoded = NULL``，并使用 ``decoder_get_area`` 来获取图像区域的像素。
- 在 ``decoder_close`` 函数中，应该释放所有分配的资源。
- ``decoder_get_area`` 函数是可选的。在这种情况下，您应该在 ``decoder_open`` 函数中解码整个图像并将图像数据存储在 ``dsc->decoded`` 中。
  解码整个图像需要额外的内存和一些计算开销。


Manually use an image decoder（手动使用图像解码器）
-------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL will use registered image decoders automatically if you try and
draw a raw image (i.e. using the ``lv_image`` object) but you can use them
manually too. Create an :cpp:type:`lv_image_decoder_dsc_t` variable to describe
the decoding session and call :cpp:func:`lv_image_decoder_open`.

The ``color`` parameter is used only with ``LV_COLOR_FORMAT_A1/2/4/8``
images to tell color of the image.

.. code:: c


   lv_result_t res;
   lv_image_decoder_dsc_t dsc;
   lv_image_decoder_args_t args = { 0 }; /*Custom decoder behavior via args*/
   res = lv_image_decoder_open(&dsc, &my_img_dsc, &args);

   if(res == LV_RESULT_OK) {
     /*Do something with `dsc->decoded`. You can copy out the decoded image by `lv_draw_buf_dup(dsc.decoded)`*/
     lv_image_decoder_close(&dsc);
   }

.. raw:: html

   </details>
   <br>


LVGL会自动使用注册的图像解码器，如果您尝试绘制原始图像（即使用 ``lv_image`` 对象），但您也可以手动使用它们。创建一个 :cpp:type:`lv_image_decoder_dsc_t` 类型的变量来描述解码会话，并调用 :cpp:func:`lv_image_decoder_open`函数。

``color`` 参数仅适用于 ``LV_COLOR_FORMAT_A1/2/4/8`` 图像，用于定义图像的颜色。

.. code:: c
  lv_result_t res;
  lv_image_decoder_dsc_t dsc;
  lv_image_decoder_args_t args = {0}; /*通过args自定义解码器行为*/
  res = lv_image_decoder_open(&dsc, &my_img_dsc, &args);

  if(res == LV_RESULT_OK) {
    /* 使用 `dsc->decoded` 做一些事情。您可以通过 `lv_draw_buf_dup(dsc.decoded)` 复制已解码的图像*/
    lv_image_decoder_close(&dsc);
  }



Image post-processing（图像后处理）
----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Considering that some hardware has special requirements for image formats,
such as alpha premultiplication and stride alignment, most image decoders (such as PNG decoders)
may not directly output image data that meets hardware requirements.

For this reason, LVGL provides a solution for image post-processing.
First, call a custom post-processing function after ``lv_image_decoder_open`` to adjust the data in the image cache,
and then mark the processing status in ``cache_entry->process_state`` (to avoid repeated post-processing).

See the detailed code below:

- Stride alignment and premultiply post-processing example:

.. code:: c

   /* Define post-processing state */
   typedef enum {
     IMAGE_PROCESS_STATE_NONE = 0,
     IMAGE_PROCESS_STATE_STRIDE_ALIGNED = 1 << 0,
     IMAGE_PROCESS_STATE_PREMULTIPLIED_ALPHA = 1 << 1,
   } image_process_state_t;

   lv_result_t my_image_post_process(lv_image_decoder_dsc_t * dsc)
   {
     lv_color_format_t color_format = dsc->header.cf;
     lv_result_t res = LV_RESULT_OK;

     if(color_format == LV_COLOR_FORMAT_ARGB8888) {
       lv_cache_lock();
       lv_cache_entry_t * entry = dsc->cache_entry;

       if(!(entry->process_state & IMAGE_PROCESS_STATE_PREMULTIPLIED_ALPHA)) {
         lv_draw_buf_premultiply(dsc->decoded);
         LV_LOG_USER("premultiplied alpha OK");

         entry->process_state |= IMAGE_PROCESS_STATE_PREMULTIPLIED_ALPHA;
       }

       if(!(entry->process_state & IMAGE_PROCESS_STATE_STRIDE_ALIGNED)) {
          uint32_t stride_expect = lv_draw_buf_width_to_stride(decoded->header.w, decoded->header.cf);
          if(decoded->header.stride != stride_expect) {
              LV_LOG_WARN("Stride mismatch");
              lv_draw_buf_t * aligned = lv_draw_buf_adjust_stride(decoded, stride_expect);
              if(aligned == NULL) {
                  LV_LOG_ERROR("No memory for Stride adjust.");
                  return NULL;
              }

              decoded = aligned;
          }

          entry->process_state |= IMAGE_PROCESS_STATE_STRIDE_ALIGNED;
       }

   alloc_failed:
       lv_cache_unlock();
     }

     return res;
   }

- GPU draw unit example:

.. code:: c

  void gpu_draw_image(lv_draw_unit_t * draw_unit, const lv_draw_image_dsc_t * draw_dsc, const lv_area_t * coords)
  {
    ...
    lv_image_decoder_dsc_t decoder_dsc;
    lv_result_t res = lv_image_decoder_open(&decoder_dsc, draw_dsc->src, NULL);
    if(res != LV_RESULT_OK) {
      LV_LOG_ERROR("Failed to open image");
      return;
    }

    res = my_image_post_process(&decoder_dsc);
    if(res != LV_RESULT_OK) {
      LV_LOG_ERROR("Failed to post-process image");
      return;
    }
    ...
  }

.. raw:: html

   </details>
   <br>


鉴于一些硬件对图像格式有特殊要求，比如 alpha 预乘和步长对齐，大多数图像解码器（例如 PNG 解码器）可能无法直接输出符合硬件要求的图像数据。

为此，LVGL 提供了图像后处理的解决方案。首先，在 `lv_image_decoder_open` 后调用自定义后处理函数来调整图像缓存中的数据，然后在 `cache_entry->process_state` 中标记处理状态（以避免重复后处理）。

详细代码如下：

- 步长对齐和预乘后处理示例：

.. code:: c

   /* Define post-processing state */
   typedef enum {
     IMAGE_PROCESS_STATE_NONE = 0,
     IMAGE_PROCESS_STATE_STRIDE_ALIGNED = 1 << 0,
     IMAGE_PROCESS_STATE_PREMULTIPLIED_ALPHA = 1 << 1,
   } image_process_state_t;

   lv_result_t my_image_post_process(lv_image_decoder_dsc_t * dsc)
   {
     lv_color_format_t color_format = dsc->header.cf;
     lv_result_t res = LV_RESULT_OK;

     if(color_format == LV_COLOR_FORMAT_ARGB8888) {
       lv_cache_lock();
       lv_cache_entry_t * entry = dsc->cache_entry;

       if(!(entry->process_state & IMAGE_PROCESS_STATE_PREMULTIPLIED_ALPHA)) {
         lv_draw_buf_premultiply(dsc->decoded);
         LV_LOG_USER("premultiplied alpha OK");

         entry->process_state |= IMAGE_PROCESS_STATE_PREMULTIPLIED_ALPHA;
       }

       if(!(entry->process_state & IMAGE_PROCESS_STATE_STRIDE_ALIGNED)) {
          uint32_t stride_expect = lv_draw_buf_width_to_stride(decoded->header.w, decoded->header.cf);
          if(decoded->header.stride != stride_expect) {
              LV_LOG_WARN("Stride mismatch");
              lv_draw_buf_t * aligned = lv_draw_buf_adjust_stride(decoded, stride_expect);
              if(aligned == NULL) {
                  LV_LOG_ERROR("No memory for Stride adjust.");
                  return NULL;
              }

              decoded = aligned;
          }

          entry->process_state |= IMAGE_PROCESS_STATE_STRIDE_ALIGNED;
       }

   alloc_failed:
       lv_cache_unlock();
     }

     return res;
   }

- GPU 绘制单元示例：

.. code:: c

  void gpu_draw_image(lv_draw_unit_t * draw_unit, const lv_draw_image_dsc_t * draw_dsc, const lv_area_t * coords)
  {
    ...
    lv_image_decoder_dsc_t decoder_dsc;
    lv_result_t res = lv_image_decoder_open(&decoder_dsc, draw_dsc->src, NULL);
    if(res != LV_RESULT_OK) {
      LV_LOG_ERROR("Failed to open image");
      return;
    }

    res = my_image_post_process(&decoder_dsc);
    if(res != LV_RESULT_OK) {
      LV_LOG_ERROR("Failed to post-process image");
      return;
    }
    ...
  }

.. raw:: html

   </details>
   <br>


.. _overview_image_caching:

Image caching（图片缓存）
************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Sometimes it takes a lot of time to open an image. Continuously decoding
a PNG/JPEG image or loading images from a slow external memory would be
inefficient and detrimental to the user experience.

Therefore, LVGL caches image data. Caching means some
images will be left open, hence LVGL can quickly access them from
``dsc->decoded`` instead of needing to decode them again.

Of course, caching images is resource intensive as it uses more RAM to
store the decoded image. LVGL tries to optimize the process as much as
possible (see below), but you will still need to evaluate if this would
be beneficial for your platform or not. Image caching may not be worth
it if you have a deeply embedded target which decodes small images from
a relatively fast storage medium.

.. raw:: html

   </details>
   <br>


有时候打开一张图片可能需要很长时间。连续解码PNG/JPEG图像或者从慢速的外部存储加载图像，都是低效的，会对用户体验产生不利影响。

因此，LVGL对图像数据进行了缓存。缓存的意思是，一些图像会被保持打开状态，这样LVGL可以迅速从 ``dsc->decoded`` 访问它们，而不需要再次解码。

当然，缓存图像在资源上是非常密集的，因为它使用了更多的RAM来存储解码后的图像。LVGL尽量优化了这一过程（见下文），但你仍然需要评估这是否对你的平台有利。
如果你有一个深度嵌入式的目标平台，从相对快速的存储介质解码小图像的话，图像缓存可能并不值得。


Cache size（缓存大小）
---------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>、

The size of cache (in bytes) can be defined with
:c:macro:`LV_CACHE_DEF_SIZE` in *lv_conf.h*. The default value is 0, so
no image is cached.

The size of cache can be changed at run-time with
:cpp:expr:`lv_cache_set_max_size(size_t size)`,
and get with :cpp:expr:`lv_cache_get_max_size()`.

.. raw:: html

   </details>
   <br>


缓存的大小（以字节为单位）可以在 *lv_conf.h* 中通过 :c:macro:`LV_CACHE_DEF_SIZE` 定义。默认值是0，因此没有图像会被缓存。

缓存的大小可以在运行时通过 :cpp:expr:`lv_cache_set_max_size(size_t size)` 来更改，
并且可以通过 :cpp:expr:`lv_cache_get_max_size()` 来获取。


Value of images（图片的价值）
----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

When you use more images than available cache size, LVGL can't cache all the
images. Instead, the library will close one of the cached images to free
space.

To decide which image to close, LVGL uses a measurement it previously
made of how long it took to open the image. Cache entries that hold
slower-to-open images are considered more valuable and are kept in the
cache as long as possible.

If you want or need to override LVGL's measurement, you can manually set
the *weight* value in the cache entry in
``cache_entry->weight = time_ms`` to give a higher or lower value. (Leave
it unchanged to let LVGL control it.)

Every cache entry has a *"life"* value. Every time an image is opened
through the cache, the *life* value of all entries is increased by their
*weight* values to make them older.
When a cached image is used, its *usage_count* value is increased
to make it more alive.

If there is no more space in the cache, the entry with *usage_count == 0*
and lowest life value will be dropped.

.. raw:: html

   </details>
   <br>


当你使用的图像数量超出了可用缓存大小时，LVGL 无法缓存所有图像。相反，库会关闭一个缓存中的图像以释放空间。

为了决定关闭哪个图像，LVGL 使用了它之前对打开图像所需时间的测量。缓存项中那些打开较慢的图像被认为更有价值，并且尽可能长时间地保留在缓存中。

如果你想要或需要覆盖 LVGL 的测量结果，你可以在缓存条目中手动设置 *权重* 值， `cache_entry->weight = time_ms` 来给出更高或更低的值。（保持不变以让 LVGL 控制它。）

每个缓存条目都有一个 *"生命周期"* 值。每次通过缓存打开图像时，所有条目的 *生命周期* 值会根据它们的 *权重* 值增加，使它们变得更旧。
当缓存中的图像被使用时，其 *使用计数* （usage_count）的值会增加，以使其变得更活跃。

如果缓存中没有更多空间，那么 *使用计数（usage_count）== 0* 且生命周期值最低的条目将被删除。


Memory usage（内存使用情况）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Note that a cached image might continuously consume memory. For example,
if three PNG images are cached, they will consume memory while they are
open.

Therefore, it's the user's responsibility to be sure there is enough RAM
to cache even the largest images at the same time.

.. raw:: html

   </details>
   <br>


请注意，缓存的图像可能会持续消耗内存。例如，如果缓存了三个PNG图像，它们在打开时会消耗内存。

因此，用户有责任确保有足够的RAM来同时缓存甚至最大的图像。


Clean the cache（清理缓存）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Let's say you have loaded a PNG image into a :cpp:struct:`lv_image_dsc_t` ``my_png``
variable and use it in an ``lv_image`` object. If the image is already
cached and you then change the underlying PNG file, you need to notify
LVGL to cache the image again. Otherwise, there is no easy way of
detecting that the underlying file changed and LVGL will still draw the
old image from cache.

To do this, use :cpp:expr:`lv_cache_invalidate(lv_cache_find(&my_png, LV_CACHE_SRC_TYPE_PTR, 0, 0));`.

.. raw:: html

   </details>
   <br>


假设你已经将一个PNG图像加载到了一个名为 ``my_png`` 的 :cpp:struct:`lv_image_dsc_t` 变量中，并在一个 ``lv_image`` 对象中使用它。
如果图像已经被缓存了，并且你改变了底层的PNG文件，你需要通知LVGL重新缓存该图像。否则，就没有简单的方式来检测到底层文件的改变，LVGL仍然会从缓存中绘制旧的图像。

要实现这一点，使用 :cpp:expr:`lv_cache_invalidate(lv_cache_find(&my_png, LV_CACHE_SRC_TYPE_PTR, 0, 0));`。


Custom cache algorithm（自定义缓存算法）
---------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If you want to implement your own cache algorithm, you can refer to the
following code to replace the LVGL built-in cache manager:

.. code:: c

   static lv_cache_entry_t * my_cache_add_cb(size_t size)
   {
     ...
   }

   static lv_cache_entry_t * my_cache_find_cb(const void * src, lv_cache_src_type_t src_type, uint32_t param1, uint32_t param2)
   {
     ...
   }

   static void my_cache_invalidate_cb(lv_cache_entry_t * entry)
   {
     ...
   }

   static const void * my_cache_get_data_cb(lv_cache_entry_t * entry)
   {
     ...
   }

   static void my_cache_release_cb(lv_cache_entry_t * entry)
   {
     ...
   }

   static void my_cache_set_max_size_cb(size_t new_size)
   {
     ...
   }

   static void my_cache_empty_cb(void)
   {
     ...
   }

   void my_cache_init(void)
   {
    /*Initialize new cache manager.*/
    lv_cache_manager_t my_manager;
    my_manager.add_cb = my_cache_add_cb;
    my_manager.find_cb = my_cache_find_cb;
    my_manager.invalidate_cb = my_cache_invalidate_cb;
    my_manager.get_data_cb = my_cache_get_data_cb;
    my_manager.release_cb = my_cache_release_cb;
    my_manager.set_max_size_cb = my_cache_set_max_size_cb;
    my_manager.empty_cb = my_cache_empty_cb;

    /*Replace existing cache manager with the new one.*/
    lv_cache_lock();
    lv_cache_set_manager(&my_manager);
    lv_cache_unlock();
   }

.. raw:: html

   </details>
   <br>


如果你想实现自己的缓存算法，你可以参考下面的代码来替换LVGL内置的缓存管理器：

.. code:: c

   static lv_cache_entry_t * my_cache_add_cb(size_t size)
   {
     ...
   }

   static lv_cache_entry_t * my_cache_find_cb(const void * src, lv_cache_src_type_t src_type, uint32_t param1, uint32_t param2)
   {
     ...
   }

   static void my_cache_invalidate_cb(lv_cache_entry_t * entry)
   {
     ...
   }

   static const void * my_cache_get_data_cb(lv_cache_entry_t * entry)
   {
     ...
   }

   static void my_cache_release_cb(lv_cache_entry_t * entry)
   {
     ...
   }

   static void my_cache_set_max_size_cb(size_t new_size)
   {
     ...
   }

   static void my_cache_empty_cb(void)
   {
     ...
   }

   void my_cache_init(void)
   {
    /*初始化新的缓存管理器*/
    lv_cache_manager_t my_manager;
    my_manager.add_cb = my_cache_add_cb;
    my_manager.find_cb = my_cache_find_cb;
    my_manager.invalidate_cb = my_cache_invalidate_cb;
    my_manager.get_data_cb = my_cache_get_data_cb;
    my_manager.release_cb = my_cache_release_cb;
    my_manager.set_max_size_cb = my_cache_set_max_size_cb;
    my_manager.empty_cb = my_cache_empty_cb;

    /*用新的缓存管理器替换现有的缓存管理器*/
    lv_cache_lock();
    lv_cache_set_manager(&my_manager);
    lv_cache_unlock();
   }
   
      
.. _overview_image_api:

API
***
