.. _ime_pinyin:

=======================
Pinyin IME（拼音输入法）
=======================
.. raw:: html

   <details>
     <summary>显示原文</summary>

Pinyin IME provides API to provide Chinese Pinyin input method (Chinese
input) for keyboard object, which supports 26 key and 9 key input modes.
You can think of ``lv_ime_pinyin`` as a Pinyin input method plug-in for
keyboard objects.

Normally, an environment where :ref:`lv_keyboard` can
run can also run ``lv_ime_pinyin``. There are two main influencing
factors: the size of the font file and the size of the dictionary.

.. raw:: html

   </details>
   <br>


拼音输入法（Pinyin IME）提供了API，支持键盘对象使用中文拼音输入法（中文输入），它支持26键和9键输入模式。
您可以将 ``lv_ime_pinyin``视为键盘对象的拼音输入法插件。

通常情况下，可以运行:ref:`lv_keyboard`的环境也可以运行 ``lv_ime_pinyin``。
有两个主要影响因素：字体文件的大小和字典的大小。


.. _ime_pinyin_example:

Usage（用法）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable :c:macro:`LV_USE_IME_PINYIN` in ``lv_conf.h``.

First use :cpp:expr:`lv_ime_pinyin_create(lv_screen_active())` to create a Pinyin
input method plug-in, then use
:cpp:expr:`lv_ime_pinyin_set_keyboard(pinyin_ime, kb)` to add the ``keyboard``
you created to the Pinyin input method plug-in. You can use
:cpp:expr:`lv_ime_pinyin_set_dict(pinyin_ime, your_dict)` to use a custom
dictionary (if you don't want to use the built-in dictionary at first,
you can disable :c:macro:`LV_IME_PINYIN_USE_DEFAULT_DICT` in ``lv_conf.h``,
which can save a lot of memory space).

The built-in thesaurus is customized based on the
**LV_FONT_SIMSUN_16_CJK** font library, which currently only has more
than ``1,000`` most common CJK radicals, so it is recommended to use
custom fonts and thesaurus.

In the process of using the Pinyin input method plug-in, you can change
the keyboard and dictionary at any time.

.. raw:: html

   </details>
   <br>


在 ``lv_conf.h``中启用:c:macro:`LV_USE_IME_PINYIN`。

首先使用:cpp:expr:`lv_ime_pinyin_create(lv_screen_active())` 创建一个拼音输入法插件，然后使用:cpp:expr:`lv_ime_pinyin_set_keyboard(pinyin_ime, kb)`将你创建的 ``keyboard``添加到拼音输入法插件中。
你可以使用:cpp:expr:`lv_ime_pinyin_set_dict(pinyin_ime, your_dict)`来使用自定义字典（如果你起初不想使用内置字典，可以在``lv_conf.h``中禁用:c:macro:`LV_IME_PINYIN_USE_DEFAULT_DICT`，这样可以节省大量的内存空间）。

内置的词库是基于 **LV_FONT_SIMSUN_16_CJK**字体库定制的，目前只有超过 ``1,000``个最常用的CJK基本字，因此推荐使用自定义字体和词库。

在使用拼音输入法插件的过程中，你可以随时更改键盘和字典。


Custom dictionary（自定义词典）
-------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If you don't want to use the built-in Pinyin dictionary, you can use the
custom dictionary. Or if you think that the built-in phonetic dictionary
consumes a lot of memory, you can also use a custom dictionary.

Customizing the dictionary is very simple.

First, set :c:macro:`LV_IME_PINYIN_USE_DEFAULT_DICT` to ``0`` in ``lv_conf.h``

Then, write a dictionary in the following format.

.. raw:: html

   </details>
   <br>


如果您不想使用内置的拼音词典，您可以使用自定义词典。或者，如果您认为内置的拼音词典占用了大量内存，您也可以使用自定义词典。

自定义词典非常简单。

首先，在 ``lv_conf.h``中将:c:macro:`LV_IME_PINYIN_USE_DEFAULT_DICT`设置为 ``0``。

然后，按照以下格式编写词典。


Dictionary format（字典格式）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

The arrangement order of each pinyin syllable is very important. You
need to customize your own thesaurus according to the Hanyu Pinyin
syllable table. You can read
`here <https://baike.baidu.com/item/%E6%B1%89%E8%AF%AD%E6%8B%BC%E9%9F%B3%E9%9F%B3%E8%8A%82/9167981>`__
to learn about the Hanyu Pinyin syllables and the syllable table.

Then, write your own dictionary according to the following format:

.. code:: c

   lv_100ask_pinyin_dict_t your_pinyin_dict[] = {
               { "a", "啊阿呵吖" },
               { "ai", "埃挨哎唉哀皑蔼矮碍爱隘癌艾" },
               { "an", "按安暗岸俺案鞍氨胺厂广庵揞犴铵桉谙鹌埯黯" },
               { "ang", "昂肮盎仰" },
               { "ao", "凹敖熬翱袄傲奥懊澳" },
               { "ba", "芭捌叭吧笆八疤巴拔跋靶把坝霸罢爸扒耙" },
               { "bai", "白摆佰败拜柏百稗伯" },
               /* ...... */
               { "zuo", "昨左佐做作坐座撮琢柞"},
               {NULL, NULL}

**The last item** must end with ``{null, null}``, or it will not work
properly.

.. raw:: html

   </details>
   <br>


每个拼音音节的排列顺序非常重要。你需要根据汉语拼音音节表定制自己的词库。
你可以阅读这里的内容了解汉语拼音音节和音节表。然后，根据以下格式编写你自己的词典：

.. code:: c
   lv_100ask_pinyin_dict_t your_pinyin_dict[] = {
               { "a", "啊阿呵吖" },
               { "ai", "埃挨哎唉哀皑蔼矮碍爱隘癌艾" },
               { "an", "按安暗岸俺案鞍氨胺厂广庵揞犴铵桉谙鹌埯黯" },
               { "ang", "昂肮盎仰" },
               { "ao", "凹敖熬翱袄傲奥懊澳" },
               { "ba", "芭捌叭吧笆八疤巴拔跋靶把坝霸罢爸扒耙" },
               { "bai", "白摆佰败拜柏百稗伯" },
               /* ...... */
               { "zuo", "昨左佐做作坐座撮琢柞"},
               {NULL, NULL}


**最后一项**必须以 ``{null, null}``结尾，否则它将无法正常工作。


.. _ime_pinyin_apply_new_dictionary:

Apply new dictionary（应用新的字典）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

After writing a dictionary according to the above dictionary format, you
only need to call this function to set up and use your dictionary:

.. code:: c

       lv_obj_t * pinyin_ime = lv_100ask_pinyin_ime_create(lv_screen_active());
       lv_100ask_pinyin_ime_set_dict(pinyin_ime, your_pinyin_dict);

.. raw:: html

   </details>
   <br>


根据上述字典格式编写字典后，您只需要调用此函数进行设置和使用您的字典：

.. code:: c

       lv_obj_t * pinyin_ime = lv_100ask_pinyin_ime_create(lv_screen_active());
       lv_100ask_pinyin_ime_set_dict(pinyin_ime, your_pinyin_dict);


.. _ime_pinyin_modes:

Modes（模式）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The lv_ime_pinyin have the following modes:

-  :cpp:enumerator:`LV_IME_PINYIN_MODE_K26`: Pinyin 26 key input mode
-  :cpp:enumerator:`LV_IME_PINYIN_MODE_K9`: Pinyin 9 key input mode
-  :cpp:enumerator:`LV_IME_PINYIN_MODE_K9_NUMBER`: Numeric keypad mode

The ``TEXT`` modes' layout contains buttons to change mode.

To set the mode manually, use :cpp:expr:`lv_ime_pinyin_set_mode(pinyin_ime, mode)`.
The default mode is :cpp:enumerator:`LV_IME_PINYIN_MODE_K26`.

.. raw:: html

   </details>
   <br>


lv_ime_pinyin有以下几种模式：

-  :cpp:enumerator:`LV_IME_PINYIN_MODE_K26`: 拼音26键输入模式
-  :cpp:enumerator:`LV_IME_PINYIN_MODE_K9`: 拼音9键输入模式
-  :cpp:enumerator:`LV_IME_PINYIN_MODE_K9_NUMBER`: 数字键盘模式

``TEXT`` 模式的布局包含了切换模式的按钮。

要手动设置模式，使用 :cpp:expr:`lv_ime_pinyin_set_mode(pinyin_ime, mode)`。
默认模式是 :cpp:enumerator:`LV_IME_PINYIN_MODE_K26`。


.. _ime_pinyin_example:

Example
-------

.. include:: ../examples/others/ime/index.rst

.. _ime_pinyin_api:

API
---

