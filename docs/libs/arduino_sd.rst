.. _arduino_sd:

==========
Arduino SD（Arduino SD卡）
==========================

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


使在 SD 卡上进行读写成为可能。
一旦将 SD 存储卡连接到 Arduino 或 Genuino 开发板的 SPI 接口，你就可以在它们上面创建文件并进行读写。你还可以遍历 SD 卡上的目录。

详细介绍：

- https://www.arduino.cc/reference/en/libraries/sd/


Usage（用法）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable :c:macro:`LV_USE_FS_ARDUINO_SD` and define a :c:macro:`LV_FS_ARDUINO_SD_LETTER` in ``lv_conf.h``.
You will need to initialize the SD card before LVGL can use it (i.e. :cpp:expr:`SD.begin(0, SPI, 40000000)`).

.. raw:: html

   </details>
   <br>


在 ``lv_conf.h`` 中启用 :c:macro:`LV_USE_FS_ARDUINO_SD` 并定义一个 :c:macro:`LV_FS_ARDUINO_SD_LETTER` 。
在使用 LVGL 之前，你需要先初始化 SD 卡 (例如：:cpp:expr:`SD.begin(0, SPI, 40000000)`)。


API
---
