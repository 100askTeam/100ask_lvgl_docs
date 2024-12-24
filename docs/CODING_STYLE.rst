.. _coding-style:

Coding style（编码风格）
=======================

File template（文件模板）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Use `misc/lv_templ.c <https://github.com/lvgl/lvgl/blob/master/src/misc/lv_templ.c>`__
and `misc/lv_templ.h <https://github.com/lvgl/lvgl/blob/master/src/misc/lv_templ.h>`__

.. raw:: html

   </details> 
   <br>


使用 `misc/lv_templ.c <https://github.com/lvgl/lvgl/blob/master/src/misc/lv_templ.c>`__ 和  `misc/lv_templ.h <https://github.com/lvgl/lvgl/blob/master/src/misc/lv_templ.h>`__


Naming conventions（命名规定）
-----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  Words are separated by '\_'
-  In variable and function names use only lower case letters
   (e.g. *height_tmp*)
-  In enums and defines use only upper case letters
   (e.g. *e.g. MAX_LINE_NUM*)
-  Global names (API):

   -  start with *lv*
   -  followed by module name: *button*, *label*, *style* etc.
   -  followed by the action (for functions): *set*, *get*, etc.
   -  closed with the subject: *name*, *size*, *state* etc.

-  Typedefs

   -  prefer ``typedef struct`` and ``typedef enum`` instead of
      ``struct name`` and ``enum name``
   -  always end ``typedef struct`` and ``typedef enum`` type names with
      ``_t``

-  Abbreviations:

   -  The following abbreviations are used and allowed:

      - ``dsc`` descriptor
      - ``param`` parameter
      - ``indev`` input device
      - ``anim`` animation
      - ``buf``  buffer
      - ``str`` string
      - ``min/max`` minimum/maximum
      - ``alloc`` allocate
      - ``ctrl`` control
      - ``pos`` position
   -  Avoid adding new abbreviations

.. raw:: html

   </details> 
   <br>


- 单词之间用 '\_' 分隔
- 在变量和函数名称中仅使用小写字母（例如 *height_tmp* ）
- 在枚举和定义中仅使用大写字母（例如 *MAX_LINE_NUM* ）
- 全局名称 (API)：

   -  以 *lv* 开头
   -  后面是模块名称： *按钮、标签、样式* 等。
   -  接下来是操作（对于函数）： *set、get* 等。
   -  以主题结束： *名称、大小、状态* 等。

- 类型定义

   -  更喜欢 ``typedef struct`` 和 ``typedef enum`` 而不是
      ``struct name`` 和 ``enum name``
   -  始终以 ``typedef struct`` 和 ``typedef enum`` 类型写入名称 ``_t`` 结尾

- 缩写：

   -  允许并使用以下缩写：

      - ``dsc`` descriptor（描述符）
      - ``param`` parameter（范围）
      - ``indev`` input device（输入设备）
      - ``anim`` animation（动画）
      - ``buf``  buffer（缓冲）
      - ``str`` string（行）
      - ``min/max`` minimum/maximum（最小值/最大值）
      - ``alloc`` allocate（分配）
      - ``ctrl`` control（控制）
      - ``pos`` position（位置）
   -  Avoid adding new abbreviations（避免添加新的缩写）


Coding guide（编码指南）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>
-  Editor:

   -  Set editor to use 4 spaces for tab indentations (instead of tab characters).
   -  Exception:  the **Kconfig** file and any make files require leading tab characters
      on child items.

-  Functions:

   -  Write function with single responsibility
   -  Make the functions ``static`` where possible

-  Variables:

   -  One line, one declaration (BAD: char x, y;)
   -  Use ``<stdint.h>`` (*uint8_t*, *int32_t* etc)
   -  Declare variables where needed (not all at function start)
   -  Use the smallest required scope
   -  Variables in a file (outside functions) are always *static*
   -  Do not use global variables (use functions to set/get static
      variables)

.. raw:: html

   </details> 
   <br>
-  编辑器：

   -  设置编辑器使用4个空格进行缩进（而不是制表符）。
   -  例外： **Kconfig** 文件和任何 make 文件在子项上需要使用前导制表符。

- 功能：

   -  编写具有单一职责的函数
   -  尽可能将函数设置为 ``static`` 功能

- 变量：

   -  一行，一个声明 (BAD: char x, y;)
   -  使用 ``<stdint.h>`` (*uint8_t*, *int32_t* etc)
   -  在需要的地方声明变量（并非全部在函数开始时声明）
   -  使用所需的最小范围
   -  文件中的变量（外部函数）始终是 *静态* 的
   -  不要使用全局变量（使用函数设置/获取静态变量）


Comments（注释）
---------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Before every function prototype in ``.h`` files, include a Doxygen-formatted comment
like this:

.. code-block:: c

    /**
     * Brief description.  Add a blank line + additional paragraphs when more detail is needed.
     * @param  parent     brief description of argument.  Additional detail can appear
     *                    on subsequent lines.  List of accepted values:
     *                    - value one
     *                    - value two
     *                    - value three
     * @return   brief description of return value.
     */
    type_name_t * lv_function_name(lv_obj_t * parent);

The normal comment prefix ``/**`` causes the comment to document the code member
*after* the comment.  When documenting a code member that is *before* the
comment, such as a struct member, use ``/**<`` like this:

.. code-block:: c

    /**
     * Brief description of struct
     *
     * When more detail is needed, add a blank line then the detail.
     */
    typedef struct {
        char      *text;    /**< Brief description of this member */
        uint16_t   length;  /**< Brief description of this member */
    } lv_example_type_t;

-  When commenting code, use block comments like this ``/* Description */``,
   not end-of-line comments like this ``// Description``.

-  Include a space after the ``/*`` or ``/**<`` and before the ``*/`` for improved readability.

-  Write readable code to avoid descriptive comments like:  ``x++; /* Add 1 to x */``.

-  The code should show clearly what you are doing.

-  You should write **why** you did it:  ``x++;  /* Point to closing '\0' of string */``

-  Short "code summaries" of a few lines are accepted: ``/* Calculate new coordinates */``

-  In comments use back-quotes (\`...\`) when referring to a code element, such as a variable, type,
   or struct name: ``/* Update value of `x_act` */``

-  When adding or modifying comments, priorities are (in order of importance):

       1.  clarity (the ease with which other programmers can understand your intention),
       2.  readability (the ease with which other programmers can read your comments),
       3.  brevity (the quality of using few words when speaking or writing).

-  Blank lines within comments are desirable when they improve clarity and readability.

-  Remember, when you are writing source code, you are not just teaching the computer
   what to do, but also teaching other programmers how it works, not only users of the
   API, but also future maintainers of your source code.  Comments add information
   about what you were thinking when the code was written, and **why** you did things
   that way---information that cannot be conveyed by the source code alone.


.. raw:: html

   </details> 
   <br>


在 ``.h`` 文件中的每个函数原型之前，包含一个 Doxygen 格式的注释，如下所示：

.. code-block:: c

    /**
     * 简要描述。当需要更多细节时，添加空行和额外段落。
     * @param  parent     参数的简要描述。额外的细节可以出现在后续行中。接受的值列表：
     *                    - 值一
     *                    - 值二
     *                    - 值三
     * @return   返回值的简要描述。
     */
    type_name_t * lv_function_name(lv_obj_t * parent);

普通的注释前缀 ``/**`` 会使注释记录在注释后的代码成员。当记录注释在注释前的代码成员时，
例如结构体成员，使用 ``/**<``，如下所示：

.. code-block:: c

    /**
     * 结构体的简要描述
     *
     * 当需要更多细节时，添加空行然后添加细节。
     */
    typedef struct {
        char      *text;    /**< 该成员的简要描述 */
        uint16_t   length;  /**< 该成员的简要描述 */
    } lv_example_type_t;

-  注释代码时，使用块注释 ``/* 描述 */``，而不是行尾注释 ``// 描述``。

-  为了提高可读性，在 ``/*`` 或 ``/**<`` 之后和 ``*/`` 之前包含一个空格。

-  编写可读的代码，避免描述性注释，如：``x++; /* x 加 1 */``。

-  代码应清楚地显示你在做什么。

-  你应该写明 **为什么** 这样做：``x++;  /* 指向字符串的结束符 '\0' */``

-  接受几行的简短“代码摘要”：``/* 计算新坐标 */``

-  在注释中使用反引号（\`...\`）引用代码元素，如变量、类型或结构体名称：``/* 更新 `x_act` 的值 */``

-  添加或修改注释时，优先级（按重要性顺序）：

       1.  清晰度（其他程序员理解你意图的难易程度），
       2.  可读性（其他程序员阅读你注释的难易程度），
       3.  简洁性（说话或写作时使用较少词语的质量）。

-  当空行能提高清晰度和可读性时，注释中应包含空行。

-  记住，当你编写源代码时，你不仅是在教计算机该做什么，还在教其他程序员它是如何工作的，
   不仅是 API 的用户，还有你源代码的未来维护者。注释添加了代码编写时你在想什么以及
   **为什么** 这样做的信息——这些信息是源代码本身无法传达的。

Doxygen Comment Specifics（Doxygen 注释细节）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.. raw:: html

   <details>
     <summary>显示原文</summary>
Doxygen is the first program in a chain that generates the online LVGL API
documentation from the files in the LVGL repository.  Doxygen detects files it should
pay attention to by them having a ``@file`` command inside a Doxygen comment.  Doxygen
comments begin with a leading ``/**``.  It ignores comments that do not have exactly
two ``*``.

The following is an illustration of an API function prototype with documentation
illustrating most of the Doxygen commands used in LVGL.

.. code-block:: c

    /**
     * Set alignment of Widgets placed in containers with LV_STYLE_FLEX_FLOW style.
     *
     * The values for the `..._place` arguments come from the `lv_flex_align_t`
     * enumeration and have the same meanings as they do for flex containers in CSS.
     * @param  obj                   pointer to flex container.  It must have
     *                               `LV_STYLE_FLEX_FLOW` style or nothing will happen.
     * @param  main_place            where to place items on main axis (in their track).
     *                               (Any value of `lv_flex_align_t`.)
     * @param  cross_place           where to place item in track on cross axis.
     *                               - `LV_FLEX_ALIGN_START`
     *                               - `LV_FLEX_ALIGN_END`
     *                               - `LV_FLEX_ALIGN_CENTER`
     * @param  track_cross_place     where to place tracks in cross direction.
     *                               (Any value of `lv_flex_align_t`.)
     * Example for a title bar layout:
     * @code{.c}
     *     lv_obj_set_flex_align(title_bar, LV_FLEX_ALIGN_START, LV_FLEX_ALIGN_CENTER, LV_FLEX_ALIGN_CENTER);
     * @endcode
     * @see
     *     - https://css-tricks.com/snippets/css/a-guide-to-flexbox/
     *     - see  `lv_obj_set_flex_grow()` for additional information.
     */
    void lv_obj_set_flex_align(lv_obj_t * widget, lv_flex_align_t main_place, lv_flex_align_t cross_place,
                               lv_flex_align_t track_cross_place);


- Always start Doxygen comment with a brief description of the code element it documents.

- When more detail is needed, add a blank line below the brief description and add
  additional information that may be needed by LVGL API users, including preconditions
  for calling the function.  Doxygen needs the blank line to separate "brief" from
  "detail" portions of the description.

- Describe function parameters with the ``@param`` command.  When a function writes
  to the address contained by a pointer parameter, if not already obvious (e.g. when
  the parameter name contains the word "out"), include the direction in the command
  for clarity:

      ``@param[out]  param_name     description``.

- Describe return values with the ``@return`` command.

- Add at least 2 spaces after Doxygen commands for improved readability.

- Use back-quotes (\`...\`) around code elements (variables, type names, function names).  For type
  names and function names, Doxygen generates a hyperlink to that code member's
  documentation (when it exists) with or without the single back-quotes.

- Append empty "()" to function names.  Doxygen will not generate a hyperlink to the
  function's documentation without this.

- Use proper grammar for clarity.  Descriptions of parameters do not need periods
  after them unless they are full sentences.

- Align edges of text around lists of parameters for ease of reading.

- Lists (e.g. of accepted parameter values) can be created by using the '-' character.
  If the list needs to be numbered, numbers can also be used.

- Place example code in a code block by surrounding it with ``@code{.c}`` and ``@endcode`` commands.
  Doxygen doesn't need the ``{.c}`` part, but the downstream software does.

- Refer reader to additional information using the ``@see`` command.  Doxygen adds a
  "See also" paragraph.  The text following the ``@see`` command will be indented.

- If you create a new pair of ``.c`` and ``.h`` files (e.g. for a new driver), ensure
  a Doxygen comment like this is at the top of each new file.  Doxygen will not parse
  the file without the ``@file`` command being present.

.. code-block:: c

      /**
       * @file filename.c
       *
       */
.. raw:: html

   </details> 
   <br>
Doxygen 是生成在线 LVGL API 文档的链条中的第一个程序，它从 LVGL 仓库中的文件生成文档。
Doxygen 通过在 Doxygen 注释中包含 ``@file`` 命令来检测它应该关注的文件。Doxygen 注释以
前导 ``/**`` 开始。它会忽略不完全有两个 ``*`` 的注释。

以下是一个带有文档的 API 函数原型示例，展示了 LVGL 中使用的大多数 Doxygen 命令。

.. code-block:: c

    /**
     * 设置在具有 LV_STYLE_FLEX_FLOW 样式的容器中放置的部件的对齐方式。
     *
     * `..._place` 参数的值来自 `lv_flex_align_t` 枚举，并且与 CSS 中的弹性容器具有相同的含义。
     * @param  obj                   指向弹性容器的指针。它必须具有 `LV_STYLE_FLEX_FLOW` 样式，否则不会发生任何事情。
     * @param  main_place            在主轴上放置项目的位置（在它们的轨道中）。
     *                               （`lv_flex_align_t` 的任何值。）
     * @param  cross_place           在交叉轴上放置项目的位置。
     *                               - `LV_FLEX_ALIGN_START`
     *                               - `LV_FLEX_ALIGN_END`
     *                               - `LV_FLEX_ALIGN_CENTER`
     * @param  track_cross_place     在交叉方向上放置轨道的位置。
     *                               （`lv_flex_align_t` 的任何值。）
     * 示例标题栏布局：
     * @code{.c}
     *     lv_obj_set_flex_align(title_bar, LV_FLEX_ALIGN_START, LV_FLEX_ALIGN_CENTER, LV_FLEX_ALIGN_CENTER);
     * @endcode
     * @see
     *     - https://css-tricks.com/snippets/css/a-guide-to-flexbox/
     *     - 参见 `lv_obj_set_flex_grow()` 以获取更多信息。
     */
    void lv_obj_set_flex_align(lv_obj_t * widget, lv_flex_align_t main_place, lv_flex_align_t cross_place,
                               lv_flex_align_t track_cross_place);


- 始终以简要描述代码元素的 Doxygen 注释开始。

- 当需要更多细节时，在简要描述下方添加一个空行，并添加 LVGL API 用户可能需要的额外信息，
  包括调用函数的前提条件。Doxygen 需要空行来分隔“简要”部分和“详细”部分。

- 使用 ``@param`` 命令描述函数参数。当函数写入指针参数包含的地址时，如果不明显（例如参数名称包含“out”），
  为了清晰起见，在命令中包含方向：

      ``@param[out]  param_name     描述``。

- 使用 ``@return`` 命令描述返回值。

- 在 Doxygen 命令后至少添加 2 个空格以提高可读性。

- 使用反引号（\`...\`）引用代码元素（变量、类型名称、函数名称）。对于类型名称和函数名称，
  Doxygen 会生成指向该代码成员文档的超链接（如果存在）。

- 在函数名称后附加空的“()”。没有这个，Doxygen 将不会生成指向函数文档的超链接。

- 使用正确的语法以确保清晰。参数描述不需要句号，除非它们是完整的句子。

- 对齐参数列表周围的文本边缘以便于阅读。

- 可以使用“-”字符创建列表（例如接受的参数值）。如果需要编号列表，也可以使用数字。

- 将示例代码放在代码块中，使用 ``@code{.c}`` 和 ``@endcode`` 命令将其包围。Doxygen 不需要 ``{.c}`` 部分，
  但下游软件需要。

- 使用 ``@see`` 命令引用读者获取更多信息。Doxygen 会添加一个“另请参见”段落。``@see`` 命令后的文本将缩进。

- 如果创建了一对新的 ``.c`` 和 ``.h`` 文件（例如用于新驱动程序），请确保在每个新文件的顶部都有一个 Doxygen 注释。
  如果没有 ``@file`` 命令，Doxygen 将不会解析该文件。

.. code-block:: c

      /**
       * @file filename.c
       *
       */
Supported Doxygen Commands（支持的 Doxygen 命令）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.. raw:: html

   <details>
     <summary>显示原文</summary>
-  ``@file``
   tells Doxygen to parse this file and also supplies documentation about
   the file itself when applicable (everything following it in the same comment).
-  ``@param  name  description``
   documents ``name`` as a function parameter, and ``description`` is the text that
   follows it until Doxygen encounters a blank line or another Doxygen command.
-  ``@return  description``
   documents the return value until Doxygen encounters a blank line or another Doxygen command.
-  ``@code{.c}/@endcode``
   surrounds code that should be placed in a code block.  While Doxygen knows to use C
   color-coding of code blocks in a .C file, the downstream part of the documentation
   generation sequence does not, so the ``{.c}`` appendage to the ``@code`` command
   is necessary.
-  ``@note  text``
   starts a paragraph where a note can be entered.  The note ends with a blank line,
   the end of the comment, or another Doxygen command that starts a new section.
   If the note contains more than one paragraph, additional paragraphs can be added
   by using additional ``@note`` commands.  At this writing, ``@par`` commands do not
   add additional paragraphs to notes as indicated in the Doxygen documentation.
-  ``@see  text``
   generates a "See also" pagraph in a highlighted section, helpful when additional
   information about a topic can be found elsewhere.
.. raw:: html

   </details> 
   <br>
-  ``@file``
   告诉 Doxygen 解析此文件，并在适用时提供有关文件本身的文档（同一注释中的所有内容）。
-  ``@param  name  description``
   将 ``name`` 记录为函数参数，``description`` 是后续文本，直到 Doxygen 遇到空行或另一个 Doxygen 命令。
-  ``@return  description``
   记录返回值，直到 Doxygen 遇到空行或另一个 Doxygen 命令。
-  ``@code{.c}/@endcode``
   包围应放置在代码块中的代码。虽然 Doxygen 知道在 .C 文件中使用 C 语法高亮显示代码块，
   但文档生成序列的下游部分不知道，因此 ``@code`` 命令的 ``{.c}`` 附加部分是必要的。
-  ``@note  text``
   开始一个可以输入注释的段落。注释以空行、注释结束或另一个开始新部分的 Doxygen 命令结束。
   如果注释包含多个段落，可以使用额外的 ``@note`` 命令添加额外的段落。目前，``@par`` 命令不会像
   Doxygen 文档中所述那样为注释添加额外的段落。
-  ``@see  text``
   在高亮部分生成一个“另请参见”段落，当有关主题的更多信息可以在其他地方找到时很有帮助。
API Conventions（API规定）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To support the auto-generation of bindings, the LVGL C API must
follow some coding conventions:

- Use ``enum``\ s instead of macros. If inevitable to use ``define``\ s
  export them with :cpp:expr:`LV_EXPORT_CONST_INT(defined_value)` right after the ``define``.
- In function arguments use ``type name[]`` declaration for array parameters instead of :cpp:expr:`type * name`
- Use typed pointers instead of :cpp:expr:`void *` pointers
- Widget constructor must follow the ``lv_<widget_name>_create(lv_obj_t * parent)`` pattern.
- Widget members function must start with ``lv_<widget_name>`` and should receive :cpp:expr:`lv_obj_t *` as first
  argument which is a pointer to widget object itself.
- ``struct`` APIs should follow the widgets' conventions. That is to receive a pointer to the ``struct`` as the
  first argument, and the prefix of the ``struct`` name should be used as the prefix of the
  function name too (e.g. :cpp:expr:`lv_display_set_default(lv_display_t * disp)`)
- Functions and ``struct``\ s which are not part of the public API must begin with underscore in order to mark them as "private".
- Argument must be named in H files too.
- Do not ``malloc`` into a static or global variables. Instead declare the variable in ``lv_global_t``
  structure in ``lv_global.h`` and mark the variable with :cpp:expr:`(LV_GLOBAL_DEFAULT()->variable)` when it's used.
- To register and use callbacks one of the following needs to be followed.

   - Pass a pointer to a ``struct`` as the first argument of both the registration function and the callback. That
     ``struct`` must contain ``void * user_data`` field.
   - The last argument of the registration function must be ``void * user_data`` and the same ``user_data``
     needs to be passed as the last argument of the callback.


To learn more refer to the documentation of `MicroPython <integration/bindings/micropython>`__.

.. raw:: html

   </details> 
   <br>


为了支持自动生成绑定，LVGL C API 必须遵循一些编码约定：

- 使用 ``enum``\ s 代替宏。如果不可避免地使用 ``define``\s在 ``define`` 之后使用 :cpp:expr:`LV_export_CONST_INT（defined_value）` 导出它们。
- 在函数参数中，使用 ``type name[]`` 数组参数的声明而不是 :cpp:expr:`type * name` 类型
- 使用类型化指针而不是 :cpp:expr:`void *` 指针
- 小部件构造函数必须遵循该 ``lv_<widget_name>_create(lv_obj_t * parent)`` 模式。
- Widget 成员函数必须以 ``lv_<widget_name>``  开头并且应该首先接收 :cpp:expr:`lv_obj_t *` ，该参数是指向 widget 对象本身的指针。
- ``struct`` API 应遵循小部件的规定。即接收一个指向 ``struct`` 的指针作为第一个参数，并且名称的前缀struct也应该用作函数名称的前缀（例如 :cpp:expr:`lv_display_set_default(lv_display_t * disp)`）
- 不属于公共API的函数和 ``struct``\ s 必须以下划线开头，才能将它们标记为“private”。
- 参数也必须在 H 文件中命名。
-  ``malloc`` 不要写入静态或全局变量。而是在 ``lv_global_t`` 结构中声明变量，并在使用时 ``lv_global_t`` 用 :cpp:expr:`(LV_GLOBAL_DEFAULT()->variable)` 标记该变量。
- 要注册和使用回调，需要遵循以下操作之一。

   - 将指向 a 的指针struct作为注册函数和回调的第一个参数传递。 那 ``struct`` 必须包含 ``void * user_data`` 字段。
   - 注册函数的最后一个参数必须是 ``void * user_data`` ，并且 ``user_data`` 需要作为回调的最后一个参数传递。


要了解更多信息，请参阅 `MicroPython <integration/bindings/micropython>`__ 的文档。


Formatting（格式化）
--------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Here is example to show bracket placing and using of white spaces:

.. code:: c

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

Use 4 spaces indentation instead of tab.

You can use **astyle** to format the code. Run ``code-format.py`` from
the ``scripts`` folder.

.. raw:: html

   </details> 
   <br>


下面是显示括号放置和空格使用的示例：

.. code:: c

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

使用 4 个空格缩进而不是制表符。

您可以使用 **astyle** 来格式化代码。 ``code-format.py`` 从文件夹运行 ``scripts`` 。


pre-commit（预提交）
--------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

`pre-commit <https://pre-commit.com/>`__ is a multi-language package
manager for pre-commit hooks. See the `installation
guide <https://pre-commit.com/#installation>`__ to get pre-commit python
package installed into your development machine.

Once you have ``pre-commit`` installed you will need to `set up the git
hook scripts <https://pre-commit.com/#3-install-the-git-hook-scripts>`__
with:

.. code:: console

   pre-commit install

now ``pre-commit`` will run automatically on ``git commit``!

.. raw:: html

   </details> 
   <br>


`pre-commit <https://pre-commit.com/>`__ 是一个用于预提交挂钩的多语言包管理器。请参阅 `安装指南 <https://pre-commit.com/#installation>`__ ，将预提交 python 包安装到您的开发计算机中。

一旦 ``pre-commit`` 安装完成后， 您需要使用 `设置githook脚本 <https://pre-commit.com/#3-install-the-git-hook-scripts>`__ 命令。


Hooks（Hooks）
--------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The ``format-source`` local hook (see ``.pre-commit-config.yaml``) runs
**astyle** on all the staged source and header files (that are not
excluded, see ``exclude`` key of the hook configuration) before entering
the commit message, if any file gets formatted by **astyle** you will
need to add the change to the staging area and run ``git commit`` again.

The ``trailing-whitespace`` hook fixes trailing whitespaces on all of
the files.

.. raw:: html

   </details> 
   <br>


本地 ``format-source`` 挂钩（请参阅 ``.pre-commit-config.yaml``） 在输入提交消息之前对所有暂存源文件和头文件（未 ``排除``，请参阅挂钩配置的关键）运行 **astyle**  ，如果任何文件被 **astyle** 格式化，您将需要将更改添加到暂存区并再次运行 ``git commit`` 。

该 ``trailing-whitespace`` 挂钩修复所有文件上的尾随空格。


Skipping hooks（跳钩）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If you want to skip any particular hook you can do so with:

.. code-block:: console

   SKIP=name-of-the-hook git commit
.. raw:: html

   </details> 
   <br>


如果你想跳过任何特定的钩子，可以这样做：

.. code-block:: console

   SKIP=name-of-the-hook git commit


Testing hooks（测试钩子）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

It's no necessary to do a commit to test the hooks, you can test hooks
by adding the files into the staging area and run:

.. raw:: html

   </details> 
   <br>


没有必要进行提交来测试钩子，您可以通过将文件添加到暂存区域并运行来测试钩子：


.. code:: console

   pre-commit run name-of-the-hook
