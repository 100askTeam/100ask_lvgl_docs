.. _lv_menu:

======================
Menu （菜单）(lv_menu)
======================

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The menu widget can be used to easily create multi-level menus. It
handles the traversal between pages automatically.

.. raw:: html

   </details> 
   <br>


菜单小部件可用于轻松创建多级菜单。它自动处理页面之间的遍历。


.. _lv_menu_parts_and_styles:

Parts and Styles（零件和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The menu widget is built from the following objects: 

- Main container: :cpp:type:`lv_menu_main_cont`
- Main header: :cpp:type:`lv_menu_main_header_cont`
- Back button: :ref:`lv_button`
- Back button icon: :ref:`lv_image`
- Main page: :cpp:type:`lv_menu_page`
- Sidebar container: :cpp:type:`lv_menu_sidebar_cont`
- Sidebar header: :cpp:type:`lv_menu_sidebar_header_cont`
- Back button: :ref:`lv_button`
- Back button icon: :ref:`lv_image`
- Sidebar page: :cpp:type:`lv_menu_page`

.. raw:: html

   </details> 
   <br>


菜单小部件由以下对象构建：

- 主容器：:cpp:type:`lv_menu_main_cont`
- 主标题：:cpp:type:`lv_menu_main_header_cont`
- 返回按钮：:ref:`lv_button`
- 返回按钮图标：:ref:`lv_image`
- 主页：:cpp:type:`lv_menu_page`
- 侧边栏容器：:cpp:type:`lv_menu_sidebar_cont`
- 侧边栏标题：:cpp:type:`lv_menu_sidebar_header_cont`
- 返回按钮：:ref:`lv_button`
- 返回按钮图标：:ref:`lv_image`
- 侧边栏页面：:cpp:type:`lv_menu_page`


.. _lv_menu_usage:

Usage（用法）
*************

Create a menu（创建菜单）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_menu_create(parent)` creates a new empty menu.

.. raw:: html

   </details> 
   <br>


:cpp:expr:`lv_menu_create(parent)` 创建一个新的空菜单。


Header mode（标头模式）
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The following header modes exist:

- :cpp:enumerator:`LV_MENU_HEADER_TOP_FIXED` Header is positioned at the top.
- :cpp:enumerator:`LV_MENU_HEADER_TOP_UNFIXED` Header is positioned at the top and can be scrolled out of view.
- :cpp:enumerator:`LV_MENU_HEADER_BOTTOM_FIXED` Header is positioned at the bottom.

You can set header modes with :cpp:expr:`lv_menu_set_mode_header(menu, LV_MENU_HEADER...)`.

.. raw:: html

   </details> 
   <br>


存在以下标头模式：

- :cpp:enumerator:`LV_MENU_HEADER_TOP_FIXED` 标头位于顶部。
- :cpp:enumerator:`LV_MENU_HEADER_TOP_UNFIXED` 页眉位于顶部，可以滚动到视图之外。
- :cpp:enumerator:`LV_MENU_HEADER_BOTTOM_FIXED` 标题位于底部。

您可以使用 :cpp:expr:`lv_menu_set_mode_header(menu, LV_MENU_HEADER...)`。


Root back button mode（Root后退按钮模式）
----------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The following root back button modes exist:

- :cpp:enumerator:`LV_MENU_ROOT_BACK_BTN_DISABLED`
- :cpp:enumerator:`LV_MENU_ROOT_BACK_BTN_ENABLED`

You can set root back button modes with
:cpp:expr:`lv_menu_set_mode_root_back_button(menu, LV_MENU_ROOT_BACK_BTN...)`.

.. raw:: html

   </details> 
   <br>


存在以下根后退按钮模式：

- :cpp:enumerator:`LV_MENU_ROOT_BACK_BTN_DISABLED`
- :cpp:enumerator:`LV_MENU_ROOT_BACK_BTN_ENABLED`

您可以使用 :cpp:expr:`lv_menu_set_mode_root_back_button(menu, LV_MENU_ROOT_BACK_BTN...)`。


Create a menu page（创建菜单页）
-------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_menu_page_create(menu, title)` creates a new empty menu page. You
can add any widgets to the page.

.. raw:: html

   </details> 
   <br>


:cpp:expr:`lv_menu_page_create(menu, title)` 创建一个新的空菜单页。你可以向页面添加任何控件。


Set a menu page in the main area（在主区域设置菜单页面）
------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Once a menu page has been created, you can set it to the main area with
:cpp:expr:`lv_menu_set_page(menu, page)`. ``NULL`` to clear main and clear menu
history.

.. raw:: html

   </details> 
   <br>


创建菜单页面后，您可以使用 :cpp:expr:`lv_menu_set_page(menu, page)` 将其设置为主区域。 ``NULL`` 以清除主菜单和清除菜单历史。


Set a menu page in the sidebar（在边栏中设置菜单页面）
----------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Once a menu page has been created, you can set it to the sidebar with
:cpp:expr:`lv_menu_set_sidebar_page(menu, page)`. ``NULL`` to clear sidebar.

.. raw:: html

   </details> 
   <br>


创建菜单页面后，您可以使用 :cpp:expr:`lv_menu_set_sidebar_page(menu, page)` 将其设置为侧边栏。 ``NULL`` 以清除侧边栏。


Linking between menu pages（菜单页之间的链接）
---------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

For instance, you have created a button obj in the main page. When you
click the button obj, you want it to open up a new page, use
:cpp:expr:`lv_menu_set_load_page_event(menu, obj, new page)`.

.. raw:: html

   </details> 
   <br>


例如，您在主页中创建了一个按钮 obj。当你单击按钮 obj，您希望它打开一个新页面，使用 :cpp:expr:`lv_menu_set_load_page_event(menu, obj, new page)`。


Create a menu container, section, separator（创建菜单容器、节、分隔符）
---------------------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The following objects can be created so that it is easier to style the
menu:

- :cpp:expr:`lv_menu_cont_create(parent page)` creates a new empty container.
- :cpp:expr:`lv_menu_section_create(parent page)` creates a new empty section.
- :cpp:expr:`lv_menu_separator_create(parent page)` creates a separator.

.. raw:: html

   </details> 
   <br>


可以创建以下对象，以便更轻松地设置 菜单：

- :cpp:expr:`lv_menu_cont_create(parent page)` 创建一个新的空容器。
- :cpp:expr:`lv_menu_section_create(parent page)` 创建一个新的空白部分。
- :cpp:expr:`lv_menu_separator_create(parent page)` 创建一个分隔符。


.. _lv_menu_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` Sent when a page is shown.

   -  :cpp:expr:`lv_menu_get_cur_main_page(menu)` returns a pointer to menu page
      that is currently displayed in main.
   -  :cpp:expr:`lv_menu_get_cur_sidebar_page(menu)` returns a pointer to menu
      page that is currently displayed in sidebar.

-  :cpp:enumerator:`LV_EVENT_CLICKED` Sent when a back button in a header from either
   main or sidebar is clicked. :cpp:enumerator:`LV_OBJ_FLAG_EVENT_BUBBLE` is enabled
   on the buttons so you can add events to the menu itself.

   -  :cpp:expr:`lv_menu_back_button_is_root(menu, button)` to check if button is root
      back button

See the events of the :ref:`Base object <lv_obj>` too.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 显示页面时发送。

   -  :cpp:expr:`lv_menu_get_cur_main_page(menu)` 返回指向菜单页的指针 当前显示在 main 中。
   -  :cpp:expr:`lv_menu_get_cur_sidebar_page(menu)` 返回指向菜单的指针 当前显示在边栏中的页面。

-  :cpp:enumerator:`LV_EVENT_CLICKED` 当标题中的后退按钮来自任一时发送单击主栏或侧边栏。:cpp:enumerator:`LV_OBJ_FLAG_EVENT_BUBBLE` 已启用按钮，以便您可以将事件添加到菜单本身。

   -  :cpp:expr:`lv_menu_back_button_is_root(menu, button)` 检查按钮是否为root “后退” 按钮。

另请参阅 :ref:`基本对象 <lv_obj>` 的事件。

详细了解更多 :ref:`events`。


.. _lv_menu_keys:

Keys（按键）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No keys are handled by the menu widget.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


菜单小部件不处理任何 *按键* 。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_menu_example:

Example
*******

.. include:: ../examples/widgets/menu/index.rst

.. _lv_menu_api:

API
***
