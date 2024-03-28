.. _arduino_esp_littlefs:

=========================================
Arduino ESP littlefs（Arduino ESP 小文件）
=========================================

.. raw:: html

   <details>
     <summary>显示原文</summary>

LittleFS is a little fail-safe filesystem designed for microcontrollers and integrated in the Arduino framework 
when used with ESP32 and ESP8266.

Detailed introduction: 
- https://github.com/esp8266/Arduino 
- https://github.com/espressif/arduino-esp32

.. raw:: html

   </details>
   <br>


LittleFS 是一个小型故障安全文件系统，专为微控制器设计并集成在 Arduino 框架中
与 ESP32 和 ESP8266 一起使用时。

详细介绍：
- https://github.com/esp8266/Arduino
- https://github.com/espressif/arduino-esp32


Usage
-----

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable :c:macro:`LV_USE_FS_ARDUINO_ESP_LITTLEFS` and define a :c:macro`LV_FS_ARDUINO_ESP_LITTLEFS_LETTER` in ``lv_conf.h``.

.. raw:: html

   </details>
   <br>


启用 :c:macro:`LV_USE_FS_ARDUINO_ESP_LITTLEFS` 并在 lv_conf.h 中定义 :c:macro:`LV_FS_ARDUINO_ESP_LITTLEFS_LETTER` 。


API
---
