.. _obj_property:

=============================
Widget Property（小部件属性）
=============================

.. raw:: html

   <details>
     <summary>显示原文</summary>

Widgets have many properties that can decide what they look like and how they behave.
For example, the size, position, color, font, etc. are properties of a widget.
Specially, widget local style is also a property of a widget.

.. raw:: html

   </details>
   <br>


部件具有许多属性，这些属性可以决定它们的外观和行为。
例如，大小、位置、颜色、字体等都是部件的属性。
特别地，部件的本地样式也是部件的一个属性。


.. _obj_property_usage:

Usage（用法）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Two APIs are provided to get/set widget properties. It can be enabled by setting
:c:macro:`LV_USE_OBJ_PROPERTY` to `1` in ``lv_conf.h``.

.. code:: c

    typedef struct {
        lv_prop_id_t id;
        union {
            int32_t num;                /**< Number integer number (opacity, enums, booleans or "normal" numbers)*/
            const void * ptr;           /**< Constant pointers  (font, cone text, etc)*/
            lv_color_t color;           /**< Colors*/
            lv_style_value_t _style;    /**< A place holder for style value which is same as property value.*/
        };
    } lv_property_t;

    lv_result_t lv_obj_set_property(lv_obj_t * obj, const lv_property_t * value);
    lv_property_t lv_obj_get_property(lv_obj_t * obj, lv_prop_id_t id);

.. raw:: html

   </details>
   <br>


提供了两个API来获取/设置小部件属性。可以通过在 `lv_conf.h`中将`:c:macro:`LV_USE_OBJ_PROPERTY`设置为 `1`来启用。

.. code:: c

    typedef struct {
        lv_prop_id_t id;
        union {
            int32_t num;                /**< 整数数字（不透明度，枚举，布尔值或“正常”数字）*/
            const void * ptr;           /**< 常量指针（字体，文本等）*/
            lv_color_t color;           /**< 颜色*/
            lv_style_value_t _style;    /**< 样式值的占位符，与属性值相同。*/
        };
    } lv_property_t;

    lv_result_t lv_obj_set_property(lv_obj_t * obj, const lv_property_t * value);
    lv_property_t lv_obj_get_property(lv_obj_t * obj, lv_prop_id_t id);


.. _obj_property_id:

Property ID（属性ID）
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:type:`lv_prop_id_t` identifies which property to get/set. :cpp:type:`lv_property_t` is an enum value
defined in ``lv_obj_property.h`` that are grouped by widget class. You can add your own
widget property ID following same rule and using helper macro :c:macro:`LV_PROPERTY_ID`.
Do make sure the ID is unique across all widgets.


Property ID is a 32-bit value. The higher 4bits indicates the property value type.
The lower 28bits is the property ID.

Note that :cpp:type:`lv_style_prop_t` is also valid property ID.

.. raw:: html

   <details>
     <summary>显示原文</summary>


:cpp:type:`lv_prop_id_t` 用于标识要获取/设置的属性。:cpp:type:`lv_property_t`是在 ``lv_obj_property.h``中定义的枚举值，按照部件类进行分组。
您可以按照相同规则并使用辅助宏 :c:macro:`LV_PROPERTY_ID` 来添加自己的部件属性标识。请确保该标识在所有部件中是唯一的。

属性标识是一个32位的值。高4位表示属性值类型，低28位表示属性标识ID。

请注意，:cpp:type:`lv_style_prop_t` 也是有效的属性标识。

     
.. _obj_property_value:

Property Value（属性值）
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Property value is a union of all possible property types including integer, pointer and color.
``_style`` is kept their just to indicate it's compatible with ``style`` value type.

.. raw:: html

   </details>
   <br>


属性值是所有可能的属性类型的并集，包括整数、指针和颜色。
``_style`` 只是保留它们，以表示它与 ``style`` 值类型兼容。


A Step Further（更进一步）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The unified widget property set/get API is useful when developing wrapper layer for other
modules like micropython, lua, or for an external animation engine.

For pointer type of property value, which typically points to a specific struct, it still needs
additional code to convert values from dict, table etc to a C struct before setting to widget.

Another possible use case is to ease of creating UI from lots of code. For example, you can gather
all properties to an array now and set properties with a for loop.

.. code:: c

    lv_property_t props[] = {
        { .id = LV_PROPERTY_IMAGE_SRC, .ptr = &img_demo_widgets_avatar, },
        { .id = LV_PROPERTY_IMAGE_PIVOT, .ptr = &pivot_50, },
        { .id = LV_PROPERTY_IMAGE_SCALE, .num = 128, },
        { .id = LV_PROPERTY_OBJ_FLAG_CLICKABLE, .num = 1, },
        { .id = LV_STYLE_IMAGE_OPA, .num = 128, },
        { .id = LV_STYLE_BG_COLOR, .color = (lv_color_t){.red = 0x11, .green = 0x22, .blue = 0x33}, },
    }

    LV_OBJ_SET_PROPERTY_ARRAY(obj, props);

.. raw:: html

   </details>
   <br>


统一的小部件属性设置/获取API在开发其他模块（如micropython、lua或外部动画引擎）的包装层时非常有用。

对于指针类型的属性值，通常指向特定的结构体，仍然需要额外的代码将值从字典、表等转换为C结构体，然后再设置到小部件中。

另一个可能的用例是简化大量代码创建UI的过程。例如，现在您可以将所有属性收集到一个数组中，然后使用for循环设置属性。

.. code:: c

    lv_property_t props[] = {
        { .id = LV_PROPERTY_IMAGE_SRC, .ptr = &img_demo_widgets_avatar, },
        { .id = LV_PROPERTY_IMAGE_PIVOT, .ptr = &pivot_50, },
        { .id = LV_PROPERTY_IMAGE_SCALE, .num = 128, },
        { .id = LV_PROPERTY_OBJ_FLAG_CLICKABLE, .num = 1, },
        { .id = LV_STYLE_IMAGE_OPA, .num = 128, },
        { .id = LV_STYLE_BG_COLOR, .color = (lv_color_t){.red = 0x11, .green = 0x22, .blue = 0x33}, },
    }

    LV_OBJ_SET_PROPERTY_ARRAY(obj, props);


