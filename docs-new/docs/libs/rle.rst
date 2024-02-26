.. _rle:

=======================
RLE Compress（RLE 压缩）
=======================

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL provides a custom RLE compression method. It can be used to reduce binary
image size. The RLE compression is a lossless compression method.

The LVGL's built-in binary image decoder supports RLE compressed images.
The decoder supports both variable and file as image sources. The original
binary data is directly decoded to RAM

.. raw:: html

   </details>
   <br>


LVGL提供了一种自定义的RLE压缩方法。它可用于减少二进制 图像大小。RLE 压缩是一种无损压缩方法。

LVGL的内置二进制图像解码器支持RLE压缩图像。 解码器支持变量和文件作为图像源。原版二进制数据直接解码到RAM。


Benefits（好处）
---------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Based on test result from a watch project. Most of the images can be compressed
to save more than 70% space as show in below statistic. It shows the file count
of every compress level. For rare conditions, RLE compress may increase the file
size if there's no large repetition in data.

.. raw:: html

   </details>
   <br>


基于手表项目的测试结果。大多数图像都可以压缩节省 70% 以上的空间，如以下统计数据所示。它显示文件计数 每个压缩级别。在极少数情况下，RLE 压缩可能会增加文件 如果数据中没有较大的重复，则为 size。


.. image:: /libs/rle-compress-statistics.png
   :alt: RLE compress statistics from a watch project
   :align: center


Theory（理论）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The RLE algorithm is a simple compression algorithm that is based on the fact that
the for many pixels, the color is the same. The algorithm simply counts how many
repeated data are there and store the count value and the color value.
If the coming pixels are not repeated, it stores the non-repeat count value and
original color value. For more details, the script used to compress the image
can be found from ``lvgl/script/LVGLImage.py``.

.. raw:: html

   </details>
   <br>


RLE 算法是一种简单的压缩算法，它基于以下事实： 对于许多像素，颜色是相同的。该算法只是计算数量 重复数据在那里，并存储计数值和颜色值。 如果即将到来的像素不重复，则存储非重复计数值和 原始颜色值。有关更多详细信息，请参阅用于压缩图像的脚本 可以从 ``lvgl/script/LVGLImage.py``中找到。


.. code:: python

    def rle_compress(self, data: bytearray, blksize: int, threshold=16):
        index = 0
        data_len = len(data)
        compressed_data = []
        while index < data_len:
            memview = memoryview(data)
            repeat_cnt = self.get_repeat_count(
                memview[index:], blksize)
            if repeat_cnt == 0:
                # done
                break
            elif repeat_cnt < threshold:
                nonrepeat_cnt = self.get_nonrepeat_count(
                    memview[index:], blksize, threshold)
                ctrl_byte = uint8_t(nonrepeat_cnt | 0x80)
                compressed_data.append(ctrl_byte)
                compressed_data.append(
                    memview[index: index + nonrepeat_cnt*blksize])
                index += nonrepeat_cnt * blksize
            else:
                ctrl_byte = uint8_t(repeat_cnt)
                compressed_data.append(ctrl_byte)
                compressed_data.append(memview[index: index + blksize])
                index += repeat_cnt * blksize

        return b"".join(compressed_data)

.. _rle_usage:

Usage（用法）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To use the RLE Decoder, enable it in ``lv_conf.h`` configuration file by setting :c:macro:`LV_USE_RLE` to `1`.
The RLE image can be used same as other images.

.. raw:: html

   </details>
   <br>


要使用 RLE 解码器，请在配置文件 ``lv_conf.h``中将其设置为 1 来启用它。 RLE 图像可以与其他图像一样使用。


.. code:: c

   lv_image_set_src(img, "path/to/image.rle");

Generate RLE compressed binary images（生成RLE压缩二进制镜像）
------------------------------------------------------------
.. raw:: html

   <details>
     <summary>显示原文</summary>

The image can be directly generated using script ``lvgl/script/LVGLImage.py``

.. raw:: html

   </details>
   <br>


可以使用脚本直接生成图像 ``lvgl/script/LVGLImage.py``


.. code:: bash

   ./script/LVGLImage.py --ofmt BIN --cf I8 --compress RLE cogwheel.png
