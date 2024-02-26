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

Before every function have in ``.h`` files a comment like this:

.. code:: c

   /**
    * Return with the screen of an object
    * @param obj pointer to an object
    * @return pointer to a screen
    */
   lv_obj_t * lv_obj_get_screen(lv_obj_t * obj);

Always use ``/*Something*/`` format and NOT ``//Something``

Write readable code to avoid descriptive comments like:
``x++; /*Add 1 to x*/``. The code should show clearly what you are
doing.

You should write **why** have you done this:
``x++; /*Because of closing '\0' of the string*/``

Short "code summaries" of a few lines are accepted. E.g.
``/*Calculate the new coordinates*/``

In comments use \` \` when referring to a variable. E.g.
:literal:`/\*Update the value of \`x_act`*/`


.. raw:: html

   </details> 
   <br>


在文件中的每个函数之前都有 ``.h`` 这样的注释：

.. code:: c

   /**
    * Return with the screen of an object
    * @param obj pointer to an object
    * @return pointer to a screen
    */
   lv_obj_t * lv_obj_get_screen(lv_obj_t * obj);

始终使用 ``/*Something*/`` 格式而不是 ``//Something``

编写可读的代码以避免描述性注释，例如 ``x++; /*Add 1 to x*/``。代码应该清楚地显示您在做什么。

你应该写下 **为什么** 这样做： ``x++; /*Because of closing '\0' of the string*/``

接受几行的简短“代码摘要”。例如 ``/*Calculate the new coordinates*/``

在注释中引用变量时使用 \` \` 。例如 :literal:`/\*Update the value of \`x_act`*/`

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

- 使用 ``enum``\ s 代替宏。如果不可避免地使用 ``define``\s在 ``define``之后使用 :cpp:expr:`LV_export_CONST_INT（defined_value）` 导出它们。
- 在函数参数中，使用 ``type name[]`` 数组参数的声明而不是 :cpp:expr:`type * name`类型
- 使用类型化指针而不是 :cpp:expr:`void *` 指针
- 小部件构造函数必须遵循该 ``lv_<widget_name>_create(lv_obj_t * parent)`` 模式。
- Widget 成员函数必须以 ``lv_<widget_name>``  开头并且应该首先接收 :cpp:expr:`lv_obj_t *` ，该参数是指向 widget 对象本身的指针。
- ``struct`` API 应遵循小部件的规定。即接收一个指向 ``struct`` 的指针作为第一个参数，并且名称的前缀struct也应该用作函数名称的前缀（例如 :cpp:expr:`lv_display_set_default(lv_display_t * disp)`）
- 不属于公共API的函数和 ``struct``\ s 必须以下划线开头，才能将它们标记为“private”。
- 参数也必须在 H 文件中命名。
-  ``malloc`` 不要写入静态或全局变量。而是在 ``lv_global_t``结构中声明变量，并在使用时 ``lv_global_t`` 用 :cpp:expr:`(LV_GLOBAL_DEFAULT()->variable)` 标记该变量。
- 要注册和使用回调，需要遵循以下操作之一。

   - 将指向 a 的指针struct作为注册函数和回调的第一个参数传递。 那 ``struct`` 必须包含 ``void * user_data`` 字段。
   - 注册函数的最后一个参数必须是 ``void * user_data`` ，并且 ``user_data``需要作为回调的最后一个参数传递。


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

.. raw:: html

   </details> 
   <br>


如果你想跳过任何特定的钩子，你可以这样做：


.. code:: console

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
