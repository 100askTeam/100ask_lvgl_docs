.. _freetype:

================================
FreeType support（FreeType 支持）
================================

.. raw:: html

   <details>
     <summary>显示原文</summary>

Interface to FreeType library to generate font bitmaps run time.

Detailed introduction: https://www.freetype.org

.. raw:: html

   </details>
   <br>


FreeType 库的接口，用于生成字体位图运行时。

详细介绍：https://www.freetype.org


Add FreeType to your project（将 FreeType 添加到你的项目）
--------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

First, Download FreeType from `here <https://sourceforge.net/projects/freetype/files/>`__.

There are two ways to use FreeType:

.. raw:: html

   </details>
   <br>


首先，从 `这里 <https://sourceforge.net/projects/freetype/files/>`__ 下载 FreeType。

有两种方法可以使用 FreeType：


For UNIX（对于 UNIX）
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

For UNIX systems, it is recommended to use the way of compiling and installing libraries.

- Enter the FreeType source code directory
- ``make``
- ``sudo make install``
- Add include path: ``/usr/include/freetype2`` (for GCC: ``-I/usr/include/freetype2 -L/usr/local/lib``)
- Link library: ``freetype`` (for GCC: ``-L/usr/local/lib -lfreetype``)

.. raw:: html

   </details>
   <br>


对于UNIX系统，建议使用编译和安装库的方式。

- 进入 FreeType 源码目录
- ``make``
- ``sudo make install``
- 添加包含路径： ``/usr/include/freetype2`` (对于 GCC： ``-I/usr/include/freetype2 -L/usr/local/lib``)
- 链接库： ``freetype`` (对于 GCC： ``-L/usr/local/lib -lfreetype``)


For Embedded Devices（对于嵌入式设备）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

For embedded devices, it is more recommended to use the FreeType
configuration file provided by LVGL, which only includes the most
commonly used functions, which is very meaningful for saving limited
FLASH space.

-  Copy the FreeType source code to your project directory.
-  Refer to the following ``Makefile`` for configuration:

.. code:: make

   # FreeType custom configuration header file
   CFLAGS += -DFT2_BUILD_LIBRARY
   CFLAGS += -DFT_CONFIG_MODULES_H=<lvgl/src/libs/freetype/ftmodule.h>
   CFLAGS += -DFT_CONFIG_OPTIONS_H=<lvgl/src/libs/freetype/ftoption.h>

   # FreeType include path
   CFLAGS += -Ifreetype/include

   # FreeType C source file
   FT_CSRCS += freetype/src/base/ftbase.c
   FT_CSRCS += freetype/src/base/ftbitmap.c
   FT_CSRCS += freetype/src/base/ftdebug.c
   FT_CSRCS += freetype/src/base/ftglyph.c
   FT_CSRCS += freetype/src/base/ftinit.c
   FT_CSRCS += freetype/src/cache/ftcache.c
   FT_CSRCS += freetype/src/gzip/ftgzip.c
   FT_CSRCS += freetype/src/sfnt/sfnt.c
   FT_CSRCS += freetype/src/smooth/smooth.c
   FT_CSRCS += freetype/src/truetype/truetype.c
   CSRCS += $(FT_CSRCS)

.. raw:: html

   </details>
   <br>


对于嵌入式设备，更建议使用 FreeType LVGL 提供的配置文件，其中仅包含最 常用函数，对于节省有限非常有意义 FLASH空间。

- 将 FreeType 源代码复制到项目目录。
- 有关配置，请参阅以下内容： ``Makefile`` 

.. code:: make

   # FreeType custom configuration header file
   CFLAGS += -DFT2_BUILD_LIBRARY
   CFLAGS += -DFT_CONFIG_MODULES_H=<lvgl/src/libs/freetype/ftmodule.h>
   CFLAGS += -DFT_CONFIG_OPTIONS_H=<lvgl/src/libs/freetype/ftoption.h>

   # FreeType include path
   CFLAGS += -Ifreetype/include

   # FreeType C source file
   FT_CSRCS += freetype/src/base/ftbase.c
   FT_CSRCS += freetype/src/base/ftbitmap.c
   FT_CSRCS += freetype/src/base/ftdebug.c
   FT_CSRCS += freetype/src/base/ftglyph.c
   FT_CSRCS += freetype/src/base/ftinit.c
   FT_CSRCS += freetype/src/cache/ftcache.c
   FT_CSRCS += freetype/src/gzip/ftgzip.c
   FT_CSRCS += freetype/src/sfnt/sfnt.c
   FT_CSRCS += freetype/src/smooth/smooth.c
   FT_CSRCS += freetype/src/truetype/truetype.c
   CSRCS += $(FT_CSRCS)


.. _freetype_usage:

Usage（用法）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable :c:macro:`LV_USE_FREETYPE` in ``lv_conf.h``.

Cache configuration:

- :c:macro:`LV_FREETYPE_CACHE_SIZE` Maximum memory(Bytes) used to cache font bitmap, outline, character maps, etc.
  :Note: This value does not include the memory used by ``FT_Face`` and ``FT_Size`` objects
- :c:macro:`LV_FREETYPE_CACHE_FT_FACES`: Maximum open number of ``FT_Face`` objects.
- :c:macro:`LV_FREETYPE_CACHE_FT_SIZES`: Maximum open number of ``FT_Size`` objects.

By default, the FreeType extension doesn't use LVGL's file system. You
can simply pass the path to the font as usual on your operating system
or platform.

If you want FreeType to use lvgl's memory allocation and file system
interface, you can enable :c:macro:`LV_FREETYPE_USE_LVGL_PORT` in
``lv_conf.h``, convenient for unified management.

The font style supports *Italic* and **Bold** fonts processed by
software, and can be set with reference to the following values:

- :cpp:enumerator:`LV_FREETYPE_FONT_STYLE_NORMAL`: Default style.
- :cpp:enumerator:`LV_FREETYPE_FONT_STYLE_ITALIC`: Italic style.
- :cpp:enumerator:`LV_FREETYPE_FONT_STYLE_BOLD`:  Bold style.

They can be combined.eg:
:cpp:expr:`LV_FREETYPE_FONT_STYLE_BOLD | LV_FREETYPE_FONT_STYLE_ITALIC`.

Use the :cpp:func:`lv_freetype_font_create` function to create a font. To
delete a font, use :cpp:func:`lv_freetype_font_delete`. For more detailed usage,
please refer to example code.

.. raw:: html

   </details>
   <br>


在 :c:macro:`LV_USE_FREETYPE` 中启用 ``lv_conf.h``。

缓存配置：

- :c:macro:`LV_FREETYPE_CACHE_SIZE` 用于缓存字体位图、轮廓图、字符映射表等的最大内存（字节）。 ：注意：此值不包括 ``FT_Face`` 和 ``FT_Size`` 对象使用的内存。
- :c:macro:`LV_FREETYPE_CACHE_FT_FACES`：最大打开 ``FT_Face`` 对象数。
- :c:macro:`LV_FREETYPE_CACHE_FT_SIZES`：最大打开 ``FT_Size`` 对象数。

默认情况下，FreeType 扩展不使用 LVGL 的文件系统。你 可以像往常一样在操作系统上简单地传递字体的路径 或平台。

如果希望 FreeType 使用 lvgl 的内存分配和文件系统接口，即可启用 :c:macro:`LV_FREETYPE_USE_LVGL_PORT`在 ``lv_conf.h``里 ，方便统一管理。

字体样式支持 *斜体* 和 **粗体** 处理 软件，并可参考以下值进行设置：

- :cpp:enumerator:`LV_FREETYPE_FONT_STYLE_NORMAL`：默认样式。
- :cpp:enumerator:`LV_FREETYPE_FONT_STYLE_ITALIC`：斜体样式。
- :cpp:enumerator:`LV_FREETYPE_FONT_STYLE_BOLD`：粗体样式。

它们可以 combined.eg：:cpp:expr:`LV_FREETYPE_FONT_STYLE_BOLD | LV_FREETYPE_FONT_STYLE_ITALIC`。

使用:cpp:func:`lv_freetype_font_create` 函数创建字体。到删除字体，使用:cpp:func:`lv_freetype_font_delete`。为了更详细的使用，请参阅示例代码。


.. _freetype_example:

Example
-------

.. include:: ../examples/libs/freetype/index.rst

Learn more（了解更多信息）
----------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  FreeType`tutorial <https://www.freetype.org/freetype2/docs/tutorial/step1.html>`__
-  LVGL's :ref:`add_font`

.. raw:: html

   </details>
   <br>


FreeType `教程 <https://www.freetype.org/freetype2/docs/tutorial/step1.html>`__

LVGL的:ref:`添加新字体`


.. _freetype_api:

API
---

:ref:`ftoption`

:ref:`ftmodule`

