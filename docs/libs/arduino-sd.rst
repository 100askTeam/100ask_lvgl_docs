.. _arduino_sd:

==========
Arduino SD
==========

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enables reading and writing on SD cards.
Once an SD memory card is connected to the SPI interface of the Arduino or Genuino board you can create files
and read/write on them. You can also move through directories on the SD card..

Detailed introduction: 
- https://www.arduino.cc/reference/en/libraries/sd/


.. raw:: html

   </details>
   <br>


允许对 SD 卡进行读写。
一旦 SD 存储卡连接到 Arduino 或 Genuino 板的 SPI 接口，您就可以创建文件并对它们进行读/写。您还可以移动 SD 卡上的目录。

详细介绍：
- https://www.arduino.cc/reference/en/libraries/sd/


Usage（用法）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable :c:macro:`LV_USE_FS_ARDUINO_SD` and define a :c:macro:`LV_FS_ARDUINO_SD_LETTER` in ``lv_conf.h``.
You probably need to configure the :c:macro:`LV_FS_ARDUINO_SD_CS_PIN` and :c:macro:`LV_FS_ARDUINO_SD_FREQUENCY` that
corresponds to the pin connected and the frequency used by the chip of the SD CARD.


.. raw:: html

   </details>
   <br>


启用 :c:macro:`LV_USE_FS_ARDUINO_SD` 并在 ``lv_conf.h`` 中定义 :c:macro:`LV_FS_ARDUINO_SD_LETTER` 。
您可能需要配置 :c:macro:`LV_FS_ARDUINO_SD_CS_PIN` 和 :c:macro:`LV_FS_ARDUINO_SD_FREQUENCY`对应SD卡芯片所连接的引脚和使用的频率。


API
---
