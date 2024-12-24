.. _font_manager:

============
Font Manager
============

.. raw:: html

   <details>
     <summary>显示原文</summary>

Font Manager is a secondary encapsulation based on :ref:`freetype`, which
facilitates upper-level applications to manage and use vector fonts. Currently
supported functions include:

- Font resource reference counting (reduces repeated creation of font resources).
- Font resource concatenation (font fallback).
- Font resource recycling mechanism (buffers recently deleted font resources to reduce the time overhead of repeated creation).

.. raw:: html

   </details>
   <br>

Font Manager 是基于 :ref:`freetype` 的二次封装，用于方便上层应用程序管理和使用矢量字体。目前支持的功能包括：

- 字体资源的引用计数（减少字体资源的重复创建）。  
- 字体资源拼接（字体回退机制）。  
- 字体资源回收机制（缓存最近删除的字体资源，以减少重复创建的时间开销）。

.. _font_manager_usage:

Usage
*****

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable :c:macro:`LIB_FREETYPE` and `LV_USE_FONT_MANAGER` in ``lv_conf.h``.

Configure :c:macro:`LV_FONT_MANAGER_NAME_MAX_LEN` to set the maximum length of the font name.

.. raw:: html

   </details>
   <br>

在 ``lv_conf.h`` 中启用 :c:macro:`LIB_FREETYPE` 和 `LV_USE_FONT_MANAGER`。

通过配置 :c:macro:`LV_FONT_MANAGER_NAME_MAX_LEN` 来设置字体名称的最大长度。

Initialize Font Manager
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Use :cpp:func:`lv_font_manager_create` to create a font manager, where the
:cpp:func:`recycle_cache_size` parameter is used to set the number of font recycling
caches,which can improve font creation efficiency.

Use :cpp:func:`lv_font_manager_add_path_static` to add a mapping between the font
file path and the custom font name, so that the application can access the font
resources more conveniently.  It should be noted that if the file path is not static
(assigned from a local variable), please use :cpp:func:`lv_font_manager_add_path` to
add the path.  This API will copy the path content to the internal management.

Use :cpp:func:`lv_font_manager_remove_path` to remove the font path mapping.

.. code-block:: c

   static lv_font_manager_t * g_font_manager = NULL;

   void font_manager_init(void)
   {
      /* Create font manager, with 8 fonts recycling buffers */
      g_font_manager = lv_font_manager_create(8);

      /* Add font path mapping to font manager */
      lv_font_manager_add_path_static(g_font_manager, "Lato-Regular", "./lvgl/examples/libs/freetype/Lato-Regular.ttf");
      lv_font_manager_add_path_static(g_font_manager, "MyFont", "./path/to/myfont.ttf");
   }

.. raw:: html

   </details>
   <br>

使用 :cpp:func:`lv_font_manager_create` 创建一个字体管理器，其中 :cpp:func:`recycle_cache_size` 参数用于设置字体回收缓存的数量，可以提高字体创建效率。

使用 :cpp:func:`lv_font_manager_add_path_static` 添加字体文件路径与自定义字体名称之间的映射，从而使应用程序可以更方便地访问字体资源。需要注意的是，如果文件路径不是静态路径 (assigned from a local variable)，请使用 :cpp:func:`lv_font_manager_add_path` 添加路径。此 API 会复制路径内容到内部管理。

使用 :cpp:func:`lv_font_manager_remove_path` 移除字体路径映射。

.. code-block:: c

   static lv_font_manager_t * g_font_manager = NULL;

   void font_manager_init(void)
   {
      /* Create font manager, with 8 fonts recycling buffers */
      g_font_manager = lv_font_manager_create(8);

      /* Add font path mapping to font manager */
      lv_font_manager_add_path_static(g_font_manager, "Lato-Regular", "./lvgl/examples/libs/freetype/Lato-Regular.ttf");
      lv_font_manager_add_path_static(g_font_manager, "MyFont", "./path/to/myfont.ttf");
   }


Create Font from Font Manager
-----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Use :cpp:func:`lv_font_manager_create_font` to create a font.  The parameters are
basically the same as :cpp:func:`lv_freetype_font_create`.

The :cpp:func:`font_family` parameter can be filled with the names of multiple fonts
(separated by ``,``) to achieve font concatenation (when the corresponding glyph is
not found in a font file, it will automatically search from the next concatenated
font).

.. code-block:: c

   static lv_font_t * g_font = NULL;

   /* Create font from font manager */
   lv_font_t * g_font = lv_font_manager_create_font(g_font_manager,
                                                    "Lato-Regular,MyFont",
                                                    LV_FREETYPE_FONT_RENDER_MODE_BITMAP,
                                                    24,
                                                    LV_FREETYPE_FONT_STYLE_NORMAL);

   /* Create label with the font */
   lv_obj_t * label = lv_label_create(lv_screen_active());
   lv_obj_set_style_text_font(label, g_font, 0);
   lv_label_set_text(label, "Hello World!");

.. raw:: html

   </details>
   <br>

使用 :cpp:func:`lv_font_manager_create_font` 创建字体。参数基本与 :cpp:func:`lv_freetype_font_create` 相同。

:cpp:func:`font_family` 参数可以填入多个字体名称（用 ``,`` 分隔）以实现字体拼接（当在某个字体文件中未找到对应的字形时，会自动从下一个拼接的字体中搜索）。

.. code-block:: c

   static lv_font_t * g_font = NULL;

   /* 从字体管理器创建字体 */
   lv_font_t * g_font = lv_font_manager_create_font(g_font_manager,
                                                    "Lato-Regular,MyFont",
                                                    LV_FREETYPE_FONT_RENDER_MODE_BITMAP,
                                                    24,
                                                    LV_FREETYPE_FONT_STYLE_NORMAL);

   /* 使用该字体创建标签 */
   lv_obj_t * label = lv_label_create(lv_screen_active());
   lv_obj_set_style_text_font(label, g_font, 0);
   lv_label_set_text(label, "Hello World!");


Delete Font
-----------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Use :cpp:func:`lv_font_manager_delete_font` to delete the font.
The font manager will mark the font resource as a recyclable font so that it can be
quickly created next time.

Note that you need to delete the widget that references the font first, and then
delete the font to avoid accessing wild pointers.

.. code-block:: c

   /* Delete label and font */
   lv_obj_delete(label);
   lv_font_manager_delete_font(g_font_manager, g_font);
   g_font = NULL;

.. raw:: html

   </details>
   <br>

使用 :cpp:func:`lv_font_manager_delete_font` 删除字体。  
字体管理器会将字体资源标记为可回收字体，以便下次能够快速创建。  

需要注意的是，需要先删除引用该字体的控件，然后再删除字体，以避免访问野指针。  

.. code-block:: c  

   /* 删除标签和字体 */  
   lv_obj_delete(label);  
   lv_font_manager_delete_font(g_font_manager, g_font);  
   g_font = NULL;  

Delete Font Manager
-------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Use :cpp:func:`lv_font_manager_delete` to destroy the entire font manager. It should
be noted that before destruction, it is necessary to ensure that the application has
deleted all fonts using :cpp:func:`lv_font_manager_delete_font`.  The font manager
will check the reference status of all allocated fonts.  If there are still fonts
being referenced, the font manager will fail to destroy and return false.

.. raw:: html

   </details>
   <br>

使用 :cpp:func:`lv_font_manager_delete` 销毁整个字体管理器。  
需要注意的是，在销毁之前，需要确保应用程序已使用 :cpp:func:`lv_font_manager_delete_font` 删除所有字体。  
字体管理器会检查所有已分配字体的引用状态。如果仍有字体被引用，字体管理器将销毁失败并返回 false。  

.. _font_manager_example:

Example
*******

.. include:: ../../examples/others/font_manager/index.rst

.. _font_manager_api:

API
***
