.. _arduino_sd:

===========
Arduino SD
===========

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

启用对 SD 卡的读写功能。  
一旦将 SD 存储卡连接到 Arduino 或 Genuino 板的 SPI 接口，您就可以创建文件并进行读写操作。您还可以在 SD 卡上的目录中移动。

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

在 ``lv_conf.h`` 中启用 :c:macro:`LV_USE_FS_ARDUINO_SD` 并定义 :c:macro:`LV_FS_ARDUINO_SD_LETTER`。  
您需要在 LVGL 使用 SD 卡之前初始化 SD 卡（即 :cpp:expr:`SD.begin(0, SPI, 40000000)`）。

API
---
