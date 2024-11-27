.. _ffmpeg:

============================
FFmpeg support（FFmpeg 支持）
============================

.. raw:: html

   <details>
     <summary>显示原文</summary>

A complete, cross-platform solution to record, convert and stream audio and video.

Detailed introduction: https://www.ffmpeg.org

.. raw:: html

   </details>
   <br>


用于录制、转换和流式传输音频和视频的完整跨平台解决方案。

详细介绍：https://www.ffmpeg.org


Install FFmpeg（安装 FFmpeg）
----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Download first FFmpeg from `here <https://www.ffmpeg.org/download.html>`__, then install it:

.. code:: shell

    ./configure --disable-all --disable-autodetect --disable-podpages --disable-asm --enable-avcodec --enable-avformat --enable-decoders --enable-encoders --enable-demuxers --enable-parsers --enable-protocol='file' --enable-swscale --enable-zlib
    make
    sudo make install

.. raw:: html

   </details>
   <br>


首先从这里下载 FFmpeg，然后安装它：

.. code:: shell

    ./configure --disable-all --disable-autodetect --disable-podpages --disable-asm --enable-avcodec --enable-avformat --enable-decoders --enable-encoders --enable-demuxers --enable-parsers --enable-protocol='file' --enable-swscale --enable-zlib
    make
    sudo make install


Add FFmpeg to your project（将 FFmpeg 添加到您的项目）
----------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  Add library: ``FFmpeg`` (for GCC: ``-lavformat -lavcodec -lavutil -lswscale -lm -lz -lpthread``)

.. raw:: html

   </details>
   <br>


- 添加库：(对于 GCC：FFmpeg-lavformat -lavcodec -lavutil -lswscale -lm -lz -lpthread)


.. _ffmpeg_usage:

Usage（用法）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable :c:macro:`LV_USE_FFMPEG` in .

See the examples below.

:Note: FFmpeg extension doesn't use LVGL's file system. You can
simply pass the path to the image or video as usual on your operating
system or platform.

.. raw:: html

   </details>
   <br>


在 :c:macro:`LV_USE_FFMPEG` 中启用 ``lv_conf.h``。

请参阅以下示例。

:注意: FFmpeg 扩展不使用 LVGL 的文件系统。您可以只需像往常一样在操作中传递图像或视频的路径即可系统或平台。


.. _ffmpeg_example:

Example
-------

.. include:: ../examples/libs/ffmpeg/index.rst

.. _ffmpeg_api:

API
---

