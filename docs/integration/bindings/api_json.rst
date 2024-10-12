Output API as JSON data（输出API作为JSON数据）
=============================================

.. raw:: html

   <details>
     <summary>显示原文</summary>

We have written a script that will read the header files in LVGL and outputs a
more friendly JSON format for the API. This is done so that bindings that generate
code automatically will have an easy way to collect the needed information without
having to reinvent the wheel. The JSON data format has already made libraries for
reading the format for just about every programming language out there.

The script in order to run does have some requirements.

  - Python >= 3.10
  - Pycparser >= 2.21: Python Library for reading the preprocessor ouotput from the C compiler
  - PyMSVC >= 0.4.0: Python library is using MSVC Compiler
  - C compiler, gcc for Linux, clang for OSX and MSVC for Windows
  - Doxygen: used to read the docstrings from the header files.

There are several options when running the script. They are as follows

  - `--output-path`: output directory for JSON file. If one is not supplied
    then it will be output stdout
  - `--lvgl-config`: path to lv_conf.h (including file name), if this is not
    set then a config file will be generated that has most common things turned on
  - `--develop`: leaves the temporary folder in place.


to use the script

.. code:: shell

    python /scripts/gen_json/gen_json.py --output-path=json/output/directory --lvgl-config=path/to/lv_conf.h


or if you want to run a subprocess from inside of a generation script and read the output from stdout

.. code:: shell

    python /scripts/gen_json/gen_json.py --lvgl-config=path/to/lv_conf.h



.. raw:: html

   </details>
   <br>


我们编写了一个脚本，用于读取LVGL中的头文件，并将API输出为更友好的JSON格式。这样做是为了让自动生成代码的绑定能够有一种简单的方法来收集所需信息，而不必重新发明轮子。JSON数据格式已经为几乎每种编程语言提供了用于读取该格式的库。

要运行此脚本，需要满足以下要求：

  - Python >= 3.10
  - Pycparser >= 2.21: 用于读取C编译器预处理器输出的Python库
  - PyMSVC >= 0.4.0: 使用MSVC编译器的Python库
  - C编译器，Linux使用gcc，OSX使用clang，Windows使用MSVC
  - Doxygen: 用于从头文件中读取文档字符串。

运行脚本时有几个选项，如下：

  - `--output-path`：JSON文件的输出目录。如果没有提供，则输出到标准输出
  - `--lvgl-config`: 指向lv_conf.h的路径（包括文件名），如果未设置，则会生成一个配置文件，其中大多数常见的选项都被打开
  - `--develop`: 保留临时文件夹

使用脚本的方法：

.. code:: shell

    python /scripts/gen_json/gen_json.py --output-path=json/output/directory --lvgl-config=path/to/lv_conf.h


或者，如果你想在生成脚本内部运行一个子进程并从标准输出读取输出：

.. code:: shell

    python /scripts/gen_json/gen_json.py --lvgl-config=path/to/lv_conf.h





.. raw:: html

   <details>
     <summary>显示原文</summary>

The JSON data is broken apart into a couple of main categories.

  - enums
  - functions
  - function_pointers
  - structures
  - unions
  - variables
  - typedefs
  - forward_decls
  - macros

Those categories are the element names undert the root of the JSON data.
The value for each categry is an array of JSON elements. There is a bit of
nesting with the elements in the arrays and I have created "json_types" that
will allow you to identify exactly what you are dealing with.

The different "json_types" are as follows:

  - ``"array"``: The array type is used to identify arrays.

    Available JSON fields:
      - ``"dim"``: number of items in the array
      - ``"quals"``: array of qualifiers, IE "const"
      - ``"type"``: This may or may not be available.
      - ``"name"``: the name of the data type


  - ``"field"``: This type is used to describe fields in structures and unions.
    It is used in the ``"fields"`` array of the ``"struct"`` and ``"union"`` JSON types.

    Available JSON fields:
      - ``"name"``: The name of the field.
      - ``"type"``: This contains the type information for the field. Check the
        ``"json_type"`` to know what type you are dealing with.
      - ``"bitsize"``: The number of bits the field has or ``null``
        if there is no bit size defined
      - ``"docstring"``: you should know what this is.


  - ``"arg"``: Used to describe an argument/parameter in a function or a function pointer.

    Available JSON fields:
      - ``"name"``: The name of the argument/parameter.
      - ``"type"``: This contains the type information for the field. Check the
        ``"json_type"`` to know what type you are dealing with.
      - ``"docstring"``: you should know what this is.
      - ``"quals"``: array of qualifiers, IE "const"


  - ``"forward_decl"``: Describes a forward declaration.There are structures in
    LVGL that are considered to be private and that is what these desccribe.

    Available JSON fields:
      - ``"name"``: The name of the formard declaration.
      - ``"type"``: This contains the type information for the field. Check the
        ``"json_type"`` to know what type you are dealing with.
      - ``"docstring"``: you should know what this is.
      - ``"quals"``: array of qualifiers, IE "const"


  - ``"function_pointer"``: Describes a function pointer. These are used when
    registering callback functions in LVGL.

    Available JSON fields:
      - ``"name"``: The name of the function pointer.
      - ``"type"``: This contains the return type information for the function pointer.
      - ``"docstring"``: you should know what this is.
      - ``"args"``: array of ``"arg"`` objects. This describes the fuction arguments/parameters.
      - ``"quals"``: array of qualifiers, IE "const"


  - ``"variable"``: Describes a global variable.

    Available JSON fields:
      - ``"name"``: The name of the variable.
      - ``"type"``: This contains the type information for the field. Check the
        ``"json_type"`` to know what type you are dealing with.
      - ``"docstring"``: you should know what this is.
      - ``"quals"``: array of qualifiers, IE "const"
      - ``"storage"``: array of storage classifiers, IE "extern"


  - ``"special_type"``:  Currently only used to describe an ellipsis argument
    for a function.

    Available JSON fields:
      - ``"name"``: will always be "ellipsis".


  - ``"primitive_type"``: This is a base type. There or no other types beneith this.
    This tells you that the type is a basic or primitive C type.
    IE: struct, union, int, unsigned int, etc...

    Available JSON fields:
      - ``"name"``: The name of the primitive type.


  - ``"enum"``: Describes a grouping of enumeration items/members.

    Available JSON fields:
      - ``"name"``: The name of the enumeration group/type.
      - ``"type"``: This contains the type information for the enumeration group.
        This is always going to be an "int" type. Make sure you do not use this
        type as the type for the members of this enumeration group. Check the
        enumeration members type to get the correct type.
      - ``"docstring"``: you should know what this is.
      - ``"members"``: array of ``"enum_member"`` objects


  - ``"enum_member"``: Describes an enumeration item/member. Only found under
    the ``"members"`` field of an ``"enum"`` JSON type

    Available JSON fields:
      - ``"name"``: The name of the enumeration.
      - ``"type"``: This contains the type information for the enum member.
        This gets a bit tricky because the type specified in here is not always
        going to be an "int". It will usually point to an lvgl type and the type
        of the lvgl type can be found in the ``"typedefs"`` section.
      - ``"docstring"``: you should know what this is.
      - ``"value"``: the enumeration member/item's value


  - ``"lvgl_type"``: This is a base type. There or no other types beneith this.
    This tells you that the type is an LVGL data type.

    Available JSON fields:
      - ``"name"``: The name of the type.
      - ``"quals"``: array of qualifiers, IE "const


  - ``"struct"``: Describes a structure

    Available JSON fields:
      - ``"name"``: The name of the structure.
      - ``"type"``: This contains the primitive type information for the structure.
      - ``"docstring"``: you should know what this is.
      - ``"fields"``: array of ``"field"`` elements.
      - ``"quals"``: array of qualifiers, IE "const"


  - ``"union"``: Describes a union

    Available JSON fields:
      - ``"name"``: The name of the union.
      - ``"type"``: This contains the primitive type information for the union.
      - ``"docstring"``: you should know what this is.
      - ``"fields"``: array of ``"field"`` elements.
      - ``"quals"``: array of qualifiers, IE "const"


  - ``"macro"``: describes a macro. There is limited information that can be
    collected about macros and in most cases a binding will need to have these
    statically added to a binding. It is more for collecting the docstrings than
    anything else.

    Available JSON fields:
      - ``"name"``: The name of the macro.
      - ``"docstring"``: you should know what this is.


  - ``"ret_type"``: return type from a function. This is only going to be seen in the ``"type"``
    element of a ``"function"`` type.

    Available JSON fields:
      - ``"type"``: This contains the type information for the field. Check the
        ``"json_type"`` to know what type you are dealing with.
      - ``"docstring"``: you should know what this is.


  - ``"function"``: Describes a function.

    Available JSON fields:
      - ``"name"``: The name of the function.
      - ``"type"``: This contains the type information for the return value.
      - ``"docstring"``: you should know what this is.
      - ``"args"``: array of ``"arg"`` json types. This describes the fuction arguments/parameters.


  - ``"stdlib_type"``: This is a base type, meaning that there are no more
    type levels beneith this. This tells us that the type is from the C stdlib.

    Available JSON fields:
      - ``"name"``: The name of the type.
      - ``"quals"``: array of qualifiers, IE "const


  - ``"unknown_type"``: This should not be seen. If it is then there needs to be
    an adjustment made to the script. Please open an issue and let us know if you see this type.

    Available JSON fields:
      - ``"name"``: The name of the type.
      - ``"quals"``: array of qualifiers, IE "const


  - ``"pointer"``: This is a wrapper object to let you know that the type you
    are dealing with is a pointer

    Available JSON fields:
      - ``"type"``: This contains the type information for the pointer. Check the
        ``"json_type"`` to know what type you are dealing with.
      - ``"quals"``: array of qualifiers, IE "const", may or may not be available.


  - ``"typedef"``: type definitions. I will explain more on this below.

    Available JSON fields:
      - ``"name"``: The name of the typedef.
      - ``"type"``: This contains the type information for the field. Check the
        ``"json_type"`` to know what type you are dealing with.
      - ``"docstring"``: you should know what this is.
      - ``"quals"``: array of qualifiers, IE "const"



Here is an example of what the output will look like.

.. code:: json

    {
        "enums":[
            {
                "name":"_lv_result_t",
                "type":{
                    "name":"int",
                    "json_type":"primitive_type"
                },
                "json_type":"enum",
                "docstring":"LVGL error codes. ",
                "members":[
                    {
                        "name":"LV_RESULT_INVALID",
                        "type":{
                            "name":"_lv_result_t",
                            "json_type":"lvgl_type"
                        },
                        "json_type":"enum_member",
                        "docstring":"",
                        "value":"0x0"
                    },
                    {
                        "name":"LV_RESULT_OK",
                        "type":{
                            "name":"_lv_result_t",
                            "json_type":"lvgl_type"
                        },
                        "json_type":"enum_member",
                        "docstring":"",
                        "value":"0x1"
                    }
                ]
            }
        ],
        "functions":[
            {
                "name":"lv_version_info",
                "type":{
                    "type":{
                        "type":{
                            "name":"char",
                            "json_type":"primitive_type",
                            "quals":[
                                "const"
                            ]
                        },
                        "json_type":"pointer",
                        "quals":[]
                    },
                    "json_type":"ret_type",
                    "docstring":""
                },
                "json_type":"function",
                "docstring":"",
                "args":[
                    {
                        "name":null,
                        "type":{
                            "name":"void",
                            "json_type":"primitive_type",
                            "quals":[]
                        },
                        "json_type":"arg",
                        "docstring":"",
                        "quals":[]
                    }
                ]
            }
        ],
        "function_pointers":[
            {
                "name":"lv_tlsf_walker",
                "type":{
                    "type":{
                        "name":"void",
                        "json_type":"primitive_type",
                        "quals":[]
                    },
                    "json_type":"ret_type",
                    "docstring":""
                },
                "json_type":"function_pointer",
                "docstring":"",
                "args":[
                    {
                        "name":"ptr",
                        "type":{
                            "type":{
                                "name":"void",
                                "json_type":"primitive_type",
                                "quals":[]
                            },
                            "json_type":"pointer",
                            "quals":[]
                        },
                        "json_type":"arg",
                        "docstring":""
                    },
                    {
                        "name":"size",
                        "type":{
                            "name":"size_t",
                            "json_type":"stdlib_type",
                            "quals":[]
                        },
                        "json_type":"arg",
                        "docstring":""
                    },
                    {
                        "name":"used",
                        "type":{
                            "name":"int",
                            "json_type":"primitive_type",
                            "quals":[]
                        },
                        "json_type":"arg",
                        "docstring":""
                    },
                    {
                        "name":"user",
                        "type":{
                            "type":{
                                "name":"void",
                                "json_type":"primitive_type",
                                "quals":[]
                            },
                            "json_type":"pointer",
                            "quals":[]
                        },
                        "json_type":"arg",
                        "docstring":""
                    }
                ],
                "quals":[]
            }
        ],
        "structures":[
            {
                "name":"_lv_gradient_cache_t",
                "type":{
                    "name":"struct",
                    "json_type":"primitive_type"
                },
                "json_type":"struct",
                "docstring":null,
                "fields":[
                    {
                        "name":"color_map",
                        "type":{
                            "type":{
                                "name":"lv_color_t",
                                "json_type":"lvgl_type",
                                "quals":[]
                            },
                            "json_type":"pointer",
                            "quals":[]
                        },
                        "json_type":"field",
                        "bitsize":null,
                        "docstring":""
                    },
                    {
                        "name":"opa_map",
                        "type":{
                            "type":{
                                "name":"lv_opa_t",
                                "json_type":"lvgl_type",
                                "quals":[]
                            },
                            "json_type":"pointer",
                            "quals":[]
                        },
                        "json_type":"field",
                        "bitsize":null,
                        "docstring":""
                    },
                    {
                        "name":"size",
                        "type":{
                            "name":"uint32_t",
                            "json_type":"stdlib_type",
                            "quals":[]
                        },
                        "json_type":"field",
                        "bitsize":null,
                        "docstring":""
                    }
                ]
            }
        ],
        "unions":[],
        "variables":[
            {
                "name":"lv_global",
                "type":{
                    "name":"lv_global_t",
                    "json_type":"lvgl_type",
                    "quals":[]
                },
                "json_type":"variable",
                "docstring":"",
                "quals":[],
                "storage":[
                    "extern"
                ]
            }
        ],
        "typedefs":[
            {
                "name":"lv_pool_t",
                "type":{
                    "type":{
                        "name":"void",
                        "json_type":"primitive_type",
                        "quals":[]
                    },
                    "json_type":"pointer"
                },
                "json_type":"typedef",
                "docstring":"",
                "quals":[]
            }
        ],
        "forward_decls":[
            {
                "name":"lv_fragment_managed_states_t",
                "type":{
                    "name":"struct",
                    "json_type":"primitive_type"
                },
                "json_type":"forward_decl",
                "docstring":"",
                "quals":[]
            }
        ],
        "macros":[
            {
                "name":"ZERO_MEM_SENTINEL",
                "json_type":"macro",
                "docstring":""
            }
        ]
    }


.. raw:: html

   </details>
   <br>


JSON 数据被拆分为几个主要类别。

  - 枚举（enums）
  - 函数（functions）
  - 函数指针（function_pointers）
  - 结构体（structures）
  - 联合体（unions）
  - 变量（variables）
  - 类型定义（typedefs）
  - 前向声明（forward_decls）
  - 宏（macros）

这些类别是 JSON 数据根目录下的元素名称。每个类别的值都是一个 JSON 元素数组。数组中的元素有些嵌套，并且我创建了“json_types”，他将允许您准确识别您正在处理的内容。

不同的“json_types”如下：

  - ``"array"``: 数组类型用于标识数组。

    可用的JSON字段:
      - ``"dim"``: 数组中的项目数；
      - ``"quals"``: 修饰符数组，如“const”；
      - ``"type"``: 可能有也可能没有；
      - ``"name"``: 数据类型的名称。


  - ``"field"``: 用于描述结构体和联合体中的字段。
    它在 ``"struct"`` 和 ``"union"`` JSON 类型的 ``"fields"`` 数组中使用。

    可用的JSON字段
      - ``"name"``: 字段的名称。
      - ``"type"``: 字段的类型信息。检查 ``"json_type"`` 来知道您正在处理什么类型。
      - ``"bitsize"``: 字段所拥有的位数，如果没有定义位大小则为 null。
      - ``"docstring"``: 你应该知道这是什么。


  - ``"arg"``: 用于描述函数或函数指针的参数。

    可用的JSON字段:
      - ``"name"``: 参数的名称
      - ``"type"``: 检查 ``"json_type"`` 来知道您正在处理什么类型的数据。
      - ``"docstring"``: 你应该知道这是什么。
      - ``"quals"``: 限定符数组，例如 "const"


  - ``"forward_decl"``:描述了一个前向声明。在LVGL中，有些结构体被视为私有的，这些前向声明就是用来描述它们的。

    可用的JSON字段：
      - ``"name"``: 前向声明的名称。
      - ``"type"``: 字段的类型信息。检查 ``"json_type"`` 来了解您正在处理的类型。
      - ``"docstring"``: 你应该知道这是什么
      - ``"quals"``: 限定符数组，例如 "const"


  - ``"function_pointer"``: 描述了一个函数指针。在LVGL中注册回调函数时使用。

    可用的JSON字段：
      - ``"name"``: 函数指针的名称。
      - ``"type"``: 包含函数指针的返回类型信息。
      - ``"docstring"``: 你应该知道这是什么
      - ``"args"``: ``"arg"`` 对象的数组。这描述了函数的参数/参数
      - ``"quals"``: 限定符数组，例如 "const"


  - ``"variable"``: 描述了一个全局变量。

    可用的JSON字段：
      - ``"name"``: 变量的名称。
      - ``"type"``: 包含该字段的类型信息。检查 ``"json_type"`` 来了解您正在处理的类型。
      - ``"docstring"``: 你应该知道这是什么
      - ``"quals"``: 限定符数组，例如 "const"
      - ``"storage"``: 存储类别数组，例如 "extern"


  - ``"special_type"``: 目前仅用于描述函数的可变参数（ellipsis）参数。

    可用的JSON字段：
      - ``"name"``: 总是 "ellipsis"。


  - ``"primitive_type"``: 这是一个基本类型。在它之下没有其他类型层级。
    这表明该类型是一个基本的或原始的C语言类型。
    例如：结构体(struct)、联合体(union)、整型(int)、无符号整型(unsigned int)等。

    可用的JSON字段：
      - ``"name"``: 原始类型的名称。


  - ``"enum"``: 描述了一个枚举项/成员的分组。

    可用的JSON字段：
      - ``"name"``: 枚举组/类型的名称。
      - ``"type"``: 包含枚举组的类型信息。这将始终是“int”类型。确保不要使用此类型作为此枚举组成员的类型。要获取正确的类型，请检查枚举成员的类型。
      - ``"docstring"``: 你应该知道这是什么
      - ``"members"``: ``"enum_member"`` 对象的数组。


  - ``"enum_member"``: 描述了一个枚举项/成员。只能在 ``"enum"`` JSON类型的 ``"members"`` 字段下找到。

    可用的JSON字段：
      - ``"name"``: 枚举的名称。
      - ``"type"``: 包含枚举成员的类型信息。这里有点复杂，因为这里指定的类型不总是“int”。它通常会指向一个LVGL类型，而LVGL类型的类型可以在 ``"typedefs"`` 部分找到。
      - ``"docstring"``: 你应该知道这是什么
      - ``"value"``: 枚举成员/项的值。


  - ``"lvgl_type"``: 这是一个基础类型。在它之下没有其他类型层级。
    这表明该类型是一个LVGL数据类型，是LVGL库特有的类型。

    可用的JSON字段：
      - ``"name"``: 类型的名称。
      - ``"quals"``: 限定符数组，例如 "const"


  - ``"struct"``: 描述了一个结构体。

    可用的JSON字段：
      - ``"name"``: 结构体的名称。
      - ``"type"``: 包含结构体的基础类型信息。
      - ``"docstring"``: 你应该知道这是什么
      - ``"fields"``: ``"field"`` 元素的数组，这些元素描述了结构体的成员。
      - ``"quals"``: 限定符数组，例如 "const"


  - ``"union"``: 描述了一个联合体（union）。

    可用的JSON字段：
      - ``"name"``: 联合体的名称。
      - ``"type"``: 包含联合体的基础类型信息。
      - ``"docstring"``: 你应该知道这是什么
      - ``"fields"``: ``"field"`` 元素的数组，这些元素描述了联合体的成员。
      - ``"quals"``: 限定符数组，例如 "const"


  - ``"macro"``: 描述了一个宏定义。关于宏的信息收集相对有限，并且在大多数情况下，绑定（binding）需要手动静态地将这些宏添加到绑定中。它主要是用于收集文档字符串，而不仅仅是其他内容。

    可用的JSON字段：
      - ``"name"``: 宏的名称。
      - ``"docstring"``: 你应该知道这是什么。


  - ``"ret_type"``: 函数的返回类型。这只会在使用 ``"function"`` 类型中的 ``"type"`` 元素时看到。

    可用的JSON字段：
      - ``"type"``: 包含字段的类型信息。检查 ``"json_type"`` 来了解您正在处理的类型是什么。
      - ``"docstring"``: 你应该知道这是什么。

  - ``"function"``: 描述了一个函数。

    可用的JSON字段：
      - ``"name"``: 函数的名称。
      - ``"type"``: 包含返回值的类型信息。
      - ``"docstring"``: 你应该知道这是什么。
      - ``"args"``: ``"arg"`` JSON类型的数组。这描述了函数的参数/参数列表。


  - ``"stdlib_type"``: 这是一个基础类型，意味着在这个类型之下没有更多的类型层级。这表明该类型来自C语言的标准库。

    可用的JSON字段：
      - ``"name"``: 类型的名称。
      - ``"quals"``: 限定符数组，例如 "const"

  - ``"unknown_type"``: 这通常不应该出现。如果出现了，那么需要对脚本进行调整。如果您看到这个类型，请提出一个issue（问题报告），并告知我们。

    可用的JSON字段：
      - ``"name"``: 类型的名称。
      - ``"quals"``: 限定符数组，例如 "const"


  - ``"pointer"``:这是一个包装对象，用于告知您正在处理的类型是一个指针。

    可用的JSON字段：
      - ``"type"``: 包含指针的类型信息。检查 ``"json_type"`` 来了解您正在处理的指针指向的是什么类型。
      - ``"quals"``: 限定符数组，例如 "const" 可能存在或不存在。


  - ``"typedef"``: 类型定义。我将在下面进一步解释这一点。

    可用的JSON字段：
      - ``"name"``: 类型定义的名称。
      - ``"type"``: 包含该字段的类型信息。检查 ``"json_type"`` 来了解您正在处理的类型。
      - ``"docstring"``: 你应该知道这是什么
      - ``"quals"``: 限定符数组，例如 "const"


这里是一个示例，展示了输出可能的样子。

.. code:: json

    {
        "enums":[
            {
                "name":"_lv_result_t",
                "type":{
                    "name":"int",
                    "json_type":"primitive_type"
                },
                "json_type":"enum",
                "docstring":"LVGL error codes. ",
                "members":[
                    {
                        "name":"LV_RESULT_INVALID",
                        "type":{
                            "name":"_lv_result_t",
                            "json_type":"lvgl_type"
                        },
                        "json_type":"enum_member",
                        "docstring":"",
                        "value":"0x0"
                    },
                    {
                        "name":"LV_RESULT_OK",
                        "type":{
                            "name":"_lv_result_t",
                            "json_type":"lvgl_type"
                        },
                        "json_type":"enum_member",
                        "docstring":"",
                        "value":"0x1"
                    }
                ]
            }
        ],
        "functions":[
            {
                "name":"lv_version_info",
                "type":{
                    "type":{
                        "type":{
                            "name":"char",
                            "json_type":"primitive_type",
                            "quals":[
                                "const"
                            ]
                        },
                        "json_type":"pointer",
                        "quals":[]
                    },
                    "json_type":"ret_type",
                    "docstring":""
                },
                "json_type":"function",
                "docstring":"",
                "args":[
                    {
                        "name":null,
                        "type":{
                            "name":"void",
                            "json_type":"primitive_type",
                            "quals":[]
                        },
                        "json_type":"arg",
                        "docstring":"",
                        "quals":[]
                    }
                ]
            }
        ],
        "function_pointers":[
            {
                "name":"lv_tlsf_walker",
                "type":{
                    "type":{
                        "name":"void",
                        "json_type":"primitive_type",
                        "quals":[]
                    },
                    "json_type":"ret_type",
                    "docstring":""
                },
                "json_type":"function_pointer",
                "docstring":"",
                "args":[
                    {
                        "name":"ptr",
                        "type":{
                            "type":{
                                "name":"void",
                                "json_type":"primitive_type",
                                "quals":[]
                            },
                            "json_type":"pointer",
                            "quals":[]
                        },
                        "json_type":"arg",
                        "docstring":""
                    },
                    {
                        "name":"size",
                        "type":{
                            "name":"size_t",
                            "json_type":"stdlib_type",
                            "quals":[]
                        },
                        "json_type":"arg",
                        "docstring":""
                    },
                    {
                        "name":"used",
                        "type":{
                            "name":"int",
                            "json_type":"primitive_type",
                            "quals":[]
                        },
                        "json_type":"arg",
                        "docstring":""
                    },
                    {
                        "name":"user",
                        "type":{
                            "type":{
                                "name":"void",
                                "json_type":"primitive_type",
                                "quals":[]
                            },
                            "json_type":"pointer",
                            "quals":[]
                        },
                        "json_type":"arg",
                        "docstring":""
                    }
                ],
                "quals":[]
            }
        ],
        "structures":[
            {
                "name":"_lv_gradient_cache_t",
                "type":{
                    "name":"struct",
                    "json_type":"primitive_type"
                },
                "json_type":"struct",
                "docstring":null,
                "fields":[
                    {
                        "name":"color_map",
                        "type":{
                            "type":{
                                "name":"lv_color_t",
                                "json_type":"lvgl_type",
                                "quals":[]
                            },
                            "json_type":"pointer",
                            "quals":[]
                        },
                        "json_type":"field",
                        "bitsize":null,
                        "docstring":""
                    },
                    {
                        "name":"opa_map",
                        "type":{
                            "type":{
                                "name":"lv_opa_t",
                                "json_type":"lvgl_type",
                                "quals":[]
                            },
                            "json_type":"pointer",
                            "quals":[]
                        },
                        "json_type":"field",
                        "bitsize":null,
                        "docstring":""
                    },
                    {
                        "name":"size",
                        "type":{
                            "name":"uint32_t",
                            "json_type":"stdlib_type",
                            "quals":[]
                        },
                        "json_type":"field",
                        "bitsize":null,
                        "docstring":""
                    }
                ]
            }
        ],
        "unions":[],
        "variables":[
            {
                "name":"lv_global",
                "type":{
                    "name":"lv_global_t",
                    "json_type":"lvgl_type",
                    "quals":[]
                },
                "json_type":"variable",
                "docstring":"",
                "quals":[],
                "storage":[
                    "extern"
                ]
            }
        ],
        "typedefs":[
            {
                "name":"lv_pool_t",
                "type":{
                    "type":{
                        "name":"void",
                        "json_type":"primitive_type",
                        "quals":[]
                    },
                    "json_type":"pointer"
                },
                "json_type":"typedef",
                "docstring":"",
                "quals":[]
            }
        ],
        "forward_decls":[
            {
                "name":"lv_fragment_managed_states_t",
                "type":{
                    "name":"struct",
                    "json_type":"primitive_type"
                },
                "json_type":"forward_decl",
                "docstring":"",
                "quals":[]
            }
        ],
        "macros":[
            {
                "name":"ZERO_MEM_SENTINEL",
                "json_type":"macro",
                "docstring":""
            }
        ]
    }
