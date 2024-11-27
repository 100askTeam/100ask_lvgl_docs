.. _lv_calendar:

==============================
Calendar（日历） (lv_calendar)
==============================

Overview（概述）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Calendar object is a classic calendar which can: - show the days of
any month in a 7x7 matrix - Show the name of the days - highlight the
current day (today) - highlight any user-defined dates

The Calendar is added to the default group (if it is set). Calendar is
an editable object which allow selecting and clicking the dates with
encoder navigation too.

To make the Calendar flexible, by default it doesn't show the current
year or month. Instead, there are optional "headers" that can be
attached to the calendar.

.. raw:: html

   </details> 
   <br>


Calendar 对象是一个经典日历，它可以：

- 通过一个7x7矩阵显示任何月份
- 显示日期名称
- 突出显示当前日期（今天）
- 突出显示任何用户定义的日期

日历默认会添加到默认组（如果已设置）。日历控件可以通过编码器的导航模式选中，之后可以通过编辑模式选择指定的日期。

为了使日历灵活，默认情况下它不显示当前的年份或月份。但是可以通过可选的 “标头（headers）” 附加到日历的顶部，这样就可以显示当前的年份及月份，并且可以切换到其他年份或月份。


.. _lv_calendar_parts_and_styles:

Parts and Styles（部分和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The calendar object uses the `Button matrix </widgets/buttonmatrix>`__
object under the hood to arrange the days into a matrix.

- :cpp:enumerator:`LV_PART_MAIN` The background of the calendar. Uses all the background related style properties.
- :cpp:enumerator:`LV_PART_ITEMS` Refers to the dates and day names. Button matrix control flags are set to differentiate the
  buttons and a custom drawer event is added modify the properties of the buttons as follows:

  - day names have no border, no background and drawn with a gray color
  - days of the previous and next month have :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_DISABLED` flag
  - today has a thicker border with the theme's primary color - highlighted days have some opacity with the theme's primary color.

.. raw:: html

   </details> 
   <br>


calendar 对象的底层是通过按钮矩阵对象将日期排列到（7x7）矩阵中。

- :cpp:enumerator:`LV_PART_MAIN` 日历的背景。使用所有与背景相关的样式属性。

- :cpp:enumerator:`LV_PART_ITEMS` 指日期和日期名称。设置按钮矩阵控制标志来区分不同的按钮（日期），并添加自定义绘制（drawer）事件，可参考如下方式修改按钮的属性：

  - 日期名称没有边框，没有背景，用灰色绘制
  - 矩阵中上个月和下个月的天数有 :cpp:enumerator:`LV_BUTTONMATRIX_CTRL_DISABLED` 标志
  - 今天（你指定的日期）有较厚的边框（使用主题的主色） 
  - 突出显示的日期有一些不透明度（使用主题的主色）。


.. _lv_calendar_usage:

Usage（用法）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Some functions use the :cpp:struct:`lv_calendar_date_t` type which is a structure
with ``year``, ``month`` and ``day`` fields.

.. raw:: html

   </details> 
   <br>


某些函数使用 :cpp:struct:`lv_calendar_date_t` 结构体类型，这个结构体有 ``year``, ``month`` 和 ``day`` 成员。


Current date（当前日期）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To set the current date (today), use the
:cpp:expr:`lv_calendar_set_today_date(calendar, year, month, day)` function.
``month`` needs to be in 1..12 range and ``day`` in 1..31 range.

.. raw:: html

   </details> 
   <br>


要设置当前日期（今天），请使用 :cpp:expr:`lv_calendar_set_today_date(calendar, year, month, day)` 函数。 ``month（月）`` 的范围：1..12 ； ``day（日）`` 的范围：1..31。


Shown date（显示日期）
---------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To set the shown date, use
:cpp:expr:`lv_calendar_set_shown_date(calendar, year, month)`

.. raw:: html

   </details> 
   <br>


设置想展示的日期（年月），请使用 :cpp:expr:`lv_calendar_set_shown_date(calendar, year, month)` 函数。


Highlighted days（突出显示的日期）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The list of highlighted dates should be stored in a
:cpp:struct:`lv_calendar_date_t` array loaded by
:cpp:expr:`lv_calendar_set_highlighted_dates(calendar, highlighted_dates, date_num)`.
Only the array's pointer will be saved so the array should be a static
or global variable.

.. raw:: html

   </details> 
   <br>


可以指定多个想要突出显示的日期，突出显示的日期列表应存储在 :cpp:struct:`lv_calendar_date_t` 类型的数组中，其通过 :cpp:expr:`lv_calendar_set_highlighted_dates(calendar, highlighted_dates, date_num)` 函数加载，该函数只会保存数组的指针，所以该数组应该是静态的或全局变量。


Name of the days（日期名称）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The name of the days can be adjusted with
:cpp:expr:`lv_calendar_set_day_names(calendar, day_names)` where ``day_names``
looks like ``const char * day_names[7] = {"Su", "Mo", ...};`` Only the
pointer of the day names is saved so the elements should be static,
global or constant variables.

.. raw:: html

   </details>  
   <br>


可以使用函数 :cpp:expr:`lv_calendar_set_day_names(calendar, day_names)` 调整日期的名称（默认是星期一至星期天的英文缩写），其中参数 ``day_names`` 可以是类似这样的数组 ``const char * day_names[7] = {"Su", "Mo", ...};`` 只有保存日期名称的指针，因此元素应该是静态的，全局变量或常量变量。


Custom year list（自定义年份列表）
--------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Sets a custom year list with :cpp:expr:`lv_calendar_header_dropdown_set_year_list(calendar, years_list)`
where ``years_list`` is a pointer to the custom years list. It can be a constant string
like ``static const char * years = "2023\n2022\n2021\n2020\n2019";``, 
or can be generated dynamically into a buffer as well.

.. raw:: html

   </details> 
   <br>


使用 :cpp:expr:`lv_calendar_header_dropdown_set_year_list(calendar, years_list)` 函数设置自定义年份列表，其中参数 ``years_list`` 是指向自定义年份列表的指针。它可以是一个常量字符串比如 ``static const char * years = "2023\n2022\n2021\n2020\n2019";``，或者也可以动态生成到缓冲区中。


Chinese calendar（中国历法）
----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Chinese calendar is a traditional cultural tool that integrates elements 
such as the lunar calendar, solar terms, and traditional festivals. It is 
widely used in Chinese social life, helping people understand the dates of 
the lunar calendar, arrange festival activities, and inherit the excellent 
traditional culture of the Chinese nation. Whether in families, businesses, 
or education, the Chinese calendar plays an irreplaceable role, enabling 
people to better understand and appreciate the charm of Chinese traditional 
culture.

If you want to use the Chinese calendar, please 
use :cpp:expr:`lv_calendar_set_chinese_mode(calendar, true)` to enable it.

.. raw:: html

   </details> 
   <br>


中国历法是一种融合了农历、节气和传统节日等元素的传统文化工具。它广泛应用于中国社会生活中，帮助人们了解农历日期，安排节日活动，继承中华民族优秀的传统文化。无论是在家庭、商业还是教育领域，中国历法都发挥着不可替代的作用，使人们能够更好地理解和欣赏中国传统文化的魅力。

如果您想使用中国历法，请使用函数 :cpp:expr:`lv_calendar_set_chinese_mode(calendar, true)` 启用它。



.. _lv_calendar_header:

Headers（头部）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

**From v8.1 the header is added directly into the Calendar widget and
the API of the headers has been changed.**

.. raw:: html

   </details> 
   <br>


**从 v8.1 开始，标题直接添加到日历小部件中，并且 标头的 API 已更改。**


Arrow buttons（箭头按钮）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_calendar_header_arrow_create(calendar)` creates a header that
contains a left and right arrow on the sides and a text with the current
year and month between them.

.. raw:: html

   </details> 
   <br>


:cpp:expr:`lv_calendar_header_arrow_create(calendar)` 创建一个标头，该标头两侧包含一个左右箭头和一个带有当前他们之间的年和月


Drop-down（下拉列表）
--------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_calendar_header_dropdown_create(calendar)` creates a header that
contains 2 drop-drown lists: one for the year and another for the month.

.. raw:: html

   </details> 
   <br>


:cpp:expr:`lv_calendar_header_dropdown_create(calendar)` 创建一个标头，该标头包含 2 个下拉列表：一个用于年份，另一个用于月份。


.. _lv_calendar_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` Sent if a date is clicked.
   :cpp:expr:`lv_calendar_get_pressed_date(calendar, &date)` set ``date`` to the
    date currently being pressed. Returns :cpp:enumerator:`LV_RESULT_OK` if there is a
   valid pressed date, else :cpp:enumerator:`LV_RESULT_INVALID`.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 如果单击日期，则发送该事件，通过调用函数 :cpp:expr:`lv_calendar_get_pressed_date(calendar, &date)` 将 ``date`` 设置为当前按下的日期。如果存在，则返回 :cpp:enumerator:`LV_RES_OK` 有效的按下日期，否则 :cpp:enumerator:`LV_RES_INVALID`。

详细了解更多 :ref:`events`。


.. _lv_calendar_keys:

Keys（按键）
***********

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  ``LV_KEY_RIGHT/UP/LEFT/RIGHT`` To navigate among the buttons to dates
-  :cpp:enumerator:`LV_KEY_ENTER` To press/release the selected date

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


-  ``LV_KEY_RIGHT/UP/LEFT/RIGHT`` 在按钮之间导航到日期
-  :cpp:enumerator:`LV_KEY_ENTER` 按下/松开所选日期

详细了解更多 :ref:`indev_keys`。


.. _lv_calendar_example:

Example
*******

.. include:: ../examples/widgets/calendar/index.rst

.. _lv_calendar_api:

API
***
