```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/widgets/extra/calendar.md
```
# Calendar（日历） (lv_calendar)

## Overview（概述）

<details>
<summary>查看原文</summary>
<p>

The Calendar object is a classic calendar which can:
- show the days of any month in a 7x7 matrix 
- Show the name of the days 
- highlight the current day (today)
- highlight any user-defined dates

The Calendar is added to the default group (if it is set). Calendar is an editable object which allow selecting and clicking the dates with encoder navigation too.

To make the Calendar flexible, by default it doesn't show the current year or month. Instead, there are external "headers" that can be attached to the calendar.

</p>
</details>

Calendar 对象是一个经典的日历，它可以：
- 在 7x7 矩阵中显示任何月份的天数
- 显示日期的名称
- 突出显示当天（今天）
- 突出显示任何用户定义的日期

日历将添加到默认组（如果已设置）。 日历是一个可编辑的对象，它也允许使用编码器导航选择和单击日期。

为了使日历灵活，默认情况下它不显示当前的年份或月份。 相反，有可以附加到日历的外部“标题”。

## Parts and Styles（部件和样式）

<details>
<summary>查看原文</summary>
<p>

The calendar object uses the [Button matrix](/widgets/core/btnmatrix) object under the hood to arrange the days into a matrix.
- `LV_PART_MAIN` The background of the calendar. Uses all the background related style properties.
- `LV_PART_ITEMS` Refers to the dates and day names. Button matrix control flags are set to differentiate the buttons and a custom drawer event is added modify the properties of the buttons as follows:
   - day names have no border, no background and drawn with a gray color
   - days of the previous and next month have `LV_BTNMATRIX_CTRL_DISABLED` flag
   - today has a thicker border with the theme's primary color
   - highlighted days have some opacity with the theme's primary color.

</p>
</details>

日历对象使用引擎盖下的 [Button matrix](/widgets/core/btnmatrix) 对象将日期排列成矩阵。
- `LV_PART_MAIN` 日历的背景。 使用所有与背景相关的样式属性。
- `LV_PART_ITEMS` 指的是日期和日期名称。 设置按钮矩阵控制标志以区分按钮并添加自定义抽屉事件，修改按钮的属性如下：
    - 日名称没有边框，没有背景，并用灰色绘制
    - 上个月和下个月的天数有 `LV_BTNMATRIX_CTRL_DISABLED` 标志
    - 今天与主题的主色有更厚的边框
    - 突出显示的日子与主题的主要颜色有一些不透明度。

## Usage（用法）

<details>
<summary>查看原文</summary>
<p>

Some functions use the `lv_calendar_date_t` type which is a structure with `year`, `month` and `day` fields.

</p>
</details>

一些函数使用 `lv_calendar_date_t` 类型，这是一个带有 `year`、`month` 和 `day` 字段的结构。

### Current date（当前日期）

<details>
<summary>查看原文</summary>
<p>

To set the current date (today), use the `lv_calendar_set_today_date(calendar, year, month, day)` function. `month` needs to be in 1..12 range and `day` in 1..31 range.

</p>
</details>

要设置当前日期（今天），请使用 `lv_calendar_set_today_date(calendar, year, month, day)` 函数。 `month` 需要在 1..12 范围内，`day` 需要在 1..31 范围内。

### Shown date（显示日期）

<details>
<summary>查看原文</summary>
<p>

To set the shown date, use `lv_calendar_set_shown_date(calendar, year, month)`;

</p>
</details>

要设置显示日期，请使用`lv_calendar_set_shown_date(calendar, year, month)`；

### Highlighted days（突出显示的日子）

<details>
<summary>查看原文</summary>
<p>

The list of highlighted dates should be stored in a `lv_calendar_date_t` array loaded by `lv_calendar_set_highlighted_dates(calendar, highlighted_dates, date_num)`.
Only the array's pointer will be saved so the array should be a static or global variable.

</p>
</details>

突出显示的日期列表应存储在由`lv_calendar_set_highlighted_dates(calendar, highlight_dates, date_num)`加载的`lv_calendar_date_t`数组中。
只有数组的指针会被保存，所以数组应该是一个静态或全局变量。

### Name of the days（日期）

<details>
<summary>查看原文</summary>
<p>

The name of the days can be adjusted with `lv_calendar_set_day_names(calendar, day_names)` where `day_names` looks like `const char * day_names[7] = {"Su", "Mo", ...};`
Only the pointer of the day names is saved so the elements should be static, global or constant variables.

</p>
</details>

日期的名称可以用 `lv_calendar_set_day_names(calendar, day_names)` 调整，其中 `day_names` 看起来像 `const char * day_names[7] = {"Su", "Mo", ...};`
只保存日期名称的指针，因此元素应该是静态、全局或常量变量。

## Events（事件）

<details>
<summary>查看原文</summary>
<p>

- `LV_EVENT_VALUE_CHANGED` Sent if a date is clicked. `lv_calendar_get_pressed_date(calendar, &date)` set `date` to the date currently being pressed. Returns `LV_RES_OK` if there is a valid pressed date, else `LV_RES_INV`. 

Learn more about [Events](/overview/event).

</p>
</details>

- `LV_EVENT_VALUE_CHANGED` 如果点击日期发送。 `lv_calendar_get_pressed_date(calendar, &date)` 将 `date` 设置为当前按下的日期。 如果存在有效的按下日期，则返回 `LV_RES_OK`，否则返回 `LV_RES_INV`。

详细了解 [事件](/overview/event)。

## Keys（按键）

<details>
<summary>查看原文</summary>
<p>

- `LV_KEY_RIGHT/UP/LEFT/RIGHT` To navigate among the buttons to dates
- `LV_KEY_ENTER` To press/release the selected date

Learn more about [Keys](/overview/indev).

</p>
</details>

- `LV_KEY_RIGHT/UP/LEFT/RIGHT` 在按钮之间导航到日期
- `LV_KEY_ENTER` 按下/释放所选日期

了解有关 [Keys](/overview/indev) 的更多信息。

## Headers（标题）

### Arrow buttons（箭头按钮）

<details>
<summary>查看原文</summary>
<p>

`lv_calendar_header_arrow_create(parent, calendar, button_size)` creates a header that contains a left and right arrow on the sides and a text with the current year and month between them.

</p>
</details>

`lv_calendar_header_arrow_create(parent, calendar, button_size)` 创建一个标题，其中包含两侧的左右箭头和文本，其中包含当前年份和月份。

### Drop-down（下拉）

<details>
<summary>查看原文</summary>
<p>

`lv_calendar_header_dropdown_create(parent, calendar)` creates a header that contains 2 drop-drown lists: one for the year and another for the month.

</p>
</details>

`lv_calendar_header_dropdown_create(parent, calendar)` 创建一个包含 2 个下拉列表的标题：一个用于年份，另一个用于月份。

## Example

```eval_rst

.. include:: ../../../examples/widgets/calendar/index.rst

```

## API

```eval_rst

.. doxygenfile:: lv_calendar.h
  :project: lvgl

```
