# Coding style（编码风格）

## File format（文件格式）

<details>
<summary>查看原文</summary>
<p>

Use [misc/lv_templ.c](https://github.com/lvgl/lvgl/blob/master/src/misc/lv_templ.c) and [misc/lv_templ.h](https://github.com/lvgl/lvgl/blob/master/src/misc/lv_templ.h)

</p>
</details>

使用 [misc/lv_templ.c](https://github.com/lvgl/lvgl/blob/master/src/misc/lv_templ.c) 和 [misc/lv_templ.h](https://github.com/ lvgl/lvgl/blob/master/src/misc/lv_templ.h)

## Naming conventions（命名约定）

<details>
<summary>查看原文</summary>
<p>

* Words are separated by '_'
* In variable and function names use only lower case letters (e.g. *height_tmp*)
* In enums and defines use only upper case letters (e.g. *e.g. MAX_LINE_NUM*)
* Global names (API):
  * start with *lv*
  * followed by module name: *btn*, *label*, *style* etc.
  * followed by the action (for functions): *set*, *get*, *refr* etc.
  * closed with the subject: *name*, *size*, *state* etc.
* Typedefs
  * prefer `typedef struct` and `typedef enum` instead of  `struct name` and `enum name`
  * always end `typedef struct` and `typedef enum` type names with `_t`
* Abbreviations:
  * Only words longer or equal than 6 characters can be abbreviated.
  * Abbreviate only if it makes the word at least half as long
  * Use only very straightforward and well-known abbreviations (e.g. pos: position, def: default, btn: button)

</p>
</details>

* 单词以'_'分隔
* 在变量和函数名称中仅使用小写字母（例如 *height_tmp*）
* 在枚举和定义中仅使用大写字母（例如 *例如 MAX_LINE_NUM*）
* 全局名称（API）：
   * 以 *lv* 开头
   * 后跟模块名称：*btn*、*label*、*style* 等。
   * 后跟操作（对于函数）：*set*、*get*、*refr* 等。
   * 以主题结尾：*name*、*size*、*state* 等。
* 类型定义
   * 更喜欢 `typedef struct` 和 `typedef enum` 而不是 `struct name` 和 `enum name`
   * 总是以 `_t` 结束 `typedef struct` 和 `typedef enum` 类型名称
* 缩写：
   * 只能缩写长度大于或等于 6 个字符的单词。
   * 仅在使单词长度至少为一半时才缩写
   * 只使用非常直接和众所周知的缩写（例如 pos: position, def: default, btn: button）


## Coding guide（编码指南）

<details>
<summary>查看原文</summary>
<p>

* Functions:
  * Try to write function shorter than is 50 lines
  * Always shorter than 200 lines (except very straightforwards)
* Variables:
  * One line, one declaration (BAD: char x, y;)
  * Use `<stdint.h>` (*uint8_t*, *int32_t* etc)
  * Declare variables where needed (not all at function start)
  * Use the smallest required scope
  * Variables in a file (outside functions) are always *static*
  * Do not use global variables (use functions to set/get static variables)

</p>
</details>

* 功能：
   * 尝试编写少于 50 行的函数
   * 总是少于 200 行（非常简单的除外）
* 变量：
   * 一行，一个声明（坏：char x, y;）
   * 使用 `<stdint.h>` (*uint8_t*, *int32_t* 等)
   * 在需要的地方声明变量（并非全部在函数启动时）
   * 使用所需的最小范围
   * 文件中的变量（函数外）总是 *static*
   * 不要使用全局变量（使用函数来设置/获取静态变量）


## Comments（评论）

<details>
<summary>查看原文</summary>
<p>

Before every function have a comment like this:

</p>
</details>

在每个函数之前都有这样的注释：

```c
/**
 * Return with the screen of an object
 * @param obj pointer to an object
 * @return pointer to a screen
 */
lv_obj_t * lv_obj_get_scr(lv_obj_t * obj);
```

<details>
<summary>查看原文</summary>
<p>

Always use `/*Something*/` format and NOT `//Something`

Write readable code to avoid descriptive comments like:
`x++; /*Add 1 to x*/`.
The code should show clearly what you are doing.

You should write **why** have you done this:
`x++; /*Because of closing '\0' of the string*/`

Short "code summaries" of a few lines are accepted. E.g. `/*Calculate the new coordinates*/`

In comments use \` \` when referring to a variable. E.g. ``/*Update the value of `x_act`*/``

</p>
</details>

始终使用 `/*Something*/` 格式而不是 `//Something`

编写可读的代码以避免描述性注释，例如：
`x++; /*给x加1*/`。
代码应该清楚地显示你在做什么。

你应该写**为什么**你这样做：
`x++; /*因为关闭了字符串的'\0'*/`

接受几行的简短“代码摘要”。 例如。 `/*计算新坐标*/`

在注释中，在引用变量时使用 \` \`。 例如。 ``/*更新`x_act`的值*/``

### Formatting（格式化）

<details>
<summary>查看原文</summary>
<p>

Here is example to show bracket placing and using of white spaces:

</p>
</details>

这是显示括号放置和使用空格的示例：

```c
/**
 * Set a new text for a label. Memory will be allocated to store the text by the label.
 * @param label pointer to a label object
 * @param text '\0' terminated character string. NULL to refresh with the current text.
 */
void lv_label_set_text(lv_obj_t * label, const char * text)
{   /*Main brackets of functions in new line*/

    if(label == NULL) return; /*No bracket only if the command is inline with the if statement*/

    lv_obj_inv(label);

    lv_label_ext_t * ext = lv_obj_get_ext(label);

    /*Comment before a section*/
    if(text == ext->txt || text == NULL) {  /*Bracket of statements start inline*/
        lv_label_refr_text(label);
        return;
    }

    ...
}
```


<details>
<summary>查看原文</summary>
<p>

Use 4 spaces indentation instead of tab.

You can use **astyle** to format the code. Run `code-formatter.sh` from the `scrips` folder.

</p>
</details>

使用 4 个空格缩进代替制表符。

您可以使用 **astyle** 来格式化代码。 从 `scrips` 文件夹运行 `code-formatter.sh`。

