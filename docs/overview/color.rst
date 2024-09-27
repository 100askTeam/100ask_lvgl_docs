.. _color:

=============
Colors（颜色）
=============

.. raw:: html

   <details>
     <summary>显示原文</summary>

The color module handles all color-related functions like changing color
depth, creating colors from hex code, converting between color depths,
mixing colors, etc.

The type :cpp:type:`lv_color_t` is used to store a color in RGB888 format.
This type and format is used in almost all APIs regardless to :cpp:expr:`LV_COLOR_DEPTH`.

.. raw:: html

   </details>
   <br>


颜色模块处理所有与颜色相关的功能，如改变颜色深度、从十六进制代码创建颜色、在颜色深度之间转换、混合颜色等。

类型 :cpp:type:`lv_color_t` 用于以RGB888格式存储颜色。无论 :cpp:expr:`LV_COLOR_DEPTH` 如何，几乎所有 API 中都使用此类型和格式。


.. _color_create:

Creating colors（创造色彩）
**************************

RGB（三原色）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Create colors from Red, Green and Blue channel values:

.. raw:: html

   </details>
   <br>


从红色、绿色和蓝色通道值创建颜色


.. code:: c

   /*All channels are 0-255*/
   lv_color_t c = lv_color_make(red, green, blue);


   /*Same but can be used for const initialization too */
   lv_color_t c = LV_COLOR_MAKE(red, green, blue);

   /*From hex code 0x000000..0xFFFFFF interpreted as RED + GREEN + BLUE*/
   lv_color_t c = lv_color_hex(0x123456);

   /*From 3 digits. Same as lv_color_hex(0x112233)*/
   lv_color_t c = lv_color_hex3(0x123);

HSV（色调饱和值-Hue Saturation Value）
-------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Create colors from Hue, Saturation and Value values:

.. raw:: html

   </details>
   <br>


根据色相、饱和度和值创建颜色


.. code:: c

   //h = 0..359, s = 0..100, v = 0..100
   lv_color_t c = lv_color_hsv_to_rgb(h, s, v);

   //All channels are 0-255
   lv_color_hsv_t c_hsv = lv_color_rgb_to_hsv(r, g, b);


   //From lv_color_t variable
   lv_color_hsv_t c_hsv = lv_color_to_hsv(color);

.. _color_palette:

Palette（调色板）
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL includes `Material Design's palette <https://vuetifyjs.com/en/styles/colors/#material-colors>`__ of
colors. In this system all named colors have a nominal main color as
well as four darker and five lighter variants.

The names of the colors are as follows:

- :c:macro:`LV_PALETTE_RED`
- :c:macro:`LV_PALETTE_PINK`
- :c:macro:`LV_PALETTE_PURPLE`
- :c:macro:`LV_PALETTE_DEEP_PURPLE`
- :c:macro:`LV_PALETTE_INDIGO`
- :c:macro:`LV_PALETTE_BLUE`
- :c:macro:`LV_PALETTE_LIGHT_BLUE`
- :c:macro:`LV_PALETTE_CYAN`
- :c:macro:`LV_PALETTE_TEAL`
- :c:macro:`LV_PALETTE_GREEN`
- :c:macro:`LV_PALETTE_LIGHT_GREEN`
- :c:macro:`LV_PALETTE_LIME`
- :c:macro:`LV_PALETTE_YELLOW`
- :c:macro:`LV_PALETTE_AMBER`
- :c:macro:`LV_PALETTE_ORANGE`
- :c:macro:`LV_PALETTE_DEEP_ORANGE`
- :c:macro:`LV_PALETTE_BROWN`
- :c:macro:`LV_PALETTE_BLUE_GREY`
- :c:macro:`LV_PALETTE_GREY`

To get the main color use
``lv_color_t c = lv_palette_main(LV_PALETTE_...)``.

For the lighter variants of a palette color use
``lv_color_t c = lv_palette_lighten(LV_PALETTE_..., v)``. ``v`` can be
1..5. For the darker variants of a palette color use
``lv_color_t c = lv_palette_darken(LV_PALETTE_..., v)``. ``v`` can be
1..4.

.. raw:: html

   </details>
   <br>


LVGL中包含 `Material Design's palette <https://vuetifyjs.com/en/styles/colors/#material-colors>`__ 的颜色。在这个系统中，所有命名的颜色都有一个名义上的主要颜色，以及四种较暗和五种较浅的变体。

颜色的名称如下：

- :c:macro:`LV_PALETTE_RED`
- :c:macro:`LV_PALETTE_PINK`
- :c:macro:`LV_PALETTE_PURPLE`
- :c:macro:`LV_PALETTE_DEEP_PURPLE`
- :c:macro:`LV_PALETTE_INDIGO`
- :c:macro:`LV_PALETTE_BLUE`
- :c:macro:`LV_PALETTE_LIGHT_BLUE`
- :c:macro:`LV_PALETTE_CYAN`
- :c:macro:`LV_PALETTE_TEAL`
- :c:macro:`LV_PALETTE_GREEN`
- :c:macro:`LV_PALETTE_LIGHT_GREEN`
- :c:macro:`LV_PALETTE_LIME`
- :c:macro:`LV_PALETTE_YELLOW`
- :c:macro:`LV_PALETTE_AMBER`
- :c:macro:`LV_PALETTE_ORANGE`
- :c:macro:`LV_PALETTE_DEEP_ORANGE`
- :c:macro:`LV_PALETTE_BROWN`
- :c:macro:`LV_PALETTE_BLUE_GREY`
- :c:macro:`LV_PALETTE_GREY`

要获取主要颜色，请使用
``lv_color_t c = lv_palette_main(LV_PALETTE_...)``.

要获得调整亮度后的调色板颜色，请使用 ``lv_color_t c = lv_palette_lighten(LV_PALETTE_..., v)``. ``v`` 可以是1到5。

要获得调整深度后的调色板颜色，请使用 ``lv_color_t c = lv_palette_darken(LV_PALETTE_..., v)``. ``v`` 可以是1到4。


.. _color_modify_and_mix:

Modify and mix colors（修改和混合颜色）
--------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The following functions can modify a color:

.. raw:: html

   </details>
   <br>


以下函数可以修改颜色：


.. code:: c

   // Lighten a color. 0: no change, 255: white
   lv_color_t c = lv_color_lighten(c, lvl);

   // Darken a color. 0: no change, 255: black
   lv_color_t c = lv_color_darken(lv_color_t c, lv_opa_t lvl);

   // Lighten or darken a color. 0: black, 128: no change 255: white
   lv_color_t c = lv_color_change_lightness(lv_color_t c, lv_opa_t lvl);


   // Mix two colors with a given ratio 0: full c2, 255: full c1, 128: half c1 and half c2
   lv_color_t c = lv_color_mix(c1, c2, ratio);

.. _color_builtin:

Built-in colors（内置颜色）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:func:`lv_color_white` and :cpp:func:`lv_color_black` return ``0xFFFFFF`` and
``0x000000`` respectively.

.. raw:: html

   </details>
   <br>


:cpp:func:`lv_color_white` 和 :cpp:func:`lv_color_black` 分别返回 ``0xFFFFFF`` 和 ``0x000000``。


.. _color_opacity:

Opacity（不透明度）
******************

.. raw:: html

   <details>
     <summary>显示原文</summary>

To describe opacity the :cpp:type:`lv_opa_t` type is created from ``uint8_t``.
Some special purpose defines are also introduced:

-  :cpp:enumerator:`LV_OPA_TRANSP` Value: 0, means no opacity making the color
   completely transparent
-  :cpp:enumerator:`LV_OPA_10` Value: 25, means the color covers only a little
-  ``LV_OPA_20 ... OPA_80`` follow logically
-  :cpp:enumerator:`LV_OPA_90` Value: 229, means the color near completely covers
-  :cpp:enumerator:`LV_OPA_COVER` Value: 255, means the color completely covers (full
   opacity)

You can also use the ``LV_OPA_*`` defines in :cpp:func:`lv_color_mix` as a
mixing *ratio*.

.. raw:: html

   </details>
   <br>


描述不透明度时，创建了 :cpp:type:`lv_opa_t` 类型，该类型由 `uint8_t` 创建。
还引入了一些特殊目的的定义：

-  :cpp:enumerator:`LV_OPA_TRANSP` 值为0，表示完全透明，使颜色完全透明
-  :cpp:enumerator:`LV_OPA_10` 值为25，表示颜色仅覆盖一小部分
-  ``LV_OPA_20 ... OPA_80`` 遵循逻辑
-  :cpp:enumerator:`LV_OPA_90` 值为229，表示颜色几乎完全覆盖
-  :cpp:enumerator:`LV_OPA_COVER` 值为255，表示颜色完全覆盖（完全不透明）

您还可以在 :cpp:func:`lv_color_mix` 中使用 ``LV_OPA_*`` 定义作为混合的 *比例*。


.. _color_api:

API
***
