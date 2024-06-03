.. _rlottie:

==============
Rlottie player
==============

.. raw:: html

   <details>
     <summary>显示原文</summary>

.. warning::
   Rlottie is deprecated. Consider using :ref:`lv_lottie` instead.

Allows playing Lottie animations in LVGL. Taken from `lv_rlottie <https://github.com/ValentiWorkLearning/lv_rlottie>`__.

LVGL provides the interface to `Samsung/rlottie <https://github.com/Samsung/rlottie>`__ library's C
API. That is the actual Lottie player is not part of LVGL, it needs to
be built separately.

.. raw:: html

   </details>
   <br>


.. warning::
   Rlottie 已被弃用。请考虑改用 :ref:`lv_lottie`。

允许在 LVGL 中播放 Lottie 动画。摘自 `lv_rlottie <https://github.com/ValentiWorkLearning/lv_rlottie>`__。

LVGL 为 `Samsung/rlottie <https://github.com/Samsung/rlottie>`__ 库的 C 提供接口应用程序接口。也就是说，实际的 Lottie 玩家不是 LVGL 的一部分，它需要单独构建。


Build Rlottie（构建Rlottie）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To build Samsung's Rlottie C++14 compatible compiler and optionally
CMake 3.14 or higher is required.

To build on desktop you can follow the instructions from Rlottie's
`README <https://github.com/Samsung/rlottie/blob/master/README.md>`__.

In the most basic case it looks like this:

.. code:: shell

   mkdir rlottie_workdir
   cd rlottie_workdir
   git clone https://github.com/Samsung/rlottie.git
   mkdir build
   cd build
   cmake ../rlottie
   make -j
   sudo make install

And finally add the ``-lrlottie`` flag to your linker.

On embedded systems you need to take care of integrating Rlottie to the
given build system.

.. raw:: html

   </details>
   <br>


构建三星的 Rlottie C++ 兼容编译器，并可选地需要 CMake 3.14 或更高版本。

要在桌面上构建，您可以按照 Rlottie 的 `README <https://github.com/Samsung/rlottie/blob/master/README.md>`__ 中的说明进行操作。

在最基本的情况下，它看起来像这样：

.. code:: shell

   mkdir rlottie_workdir
   cd rlottie_workdir
   git clone https://github.com/Samsung/rlottie.git
   mkdir build
   cd build
   cmake ../rlottie
   make -j
   sudo make install

最后，将标志 ``-lrlottie`` 添加到您的链接器。

在嵌入式系统上，您需要注意将 Rlottie 集成到给定的构建系统。


ESP-IDF example at bottom （ESP-IDF 示例位于底部）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. _rlottie_usage:

Usage（用法）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can use animation from files or raw data (text). In either case
first you need to enable :c:macro:`LV_USE_RLOTTIE` in ``lv_conf.h``.

The ``width`` and ``height`` of the object be set in the *create*
function and the animation will be scaled accordingly.

.. raw:: html

   </details>
   <br>


您可以使用来自文件或原始数据（文本）的动画。无论哪种情况 首先，您需要在 ``lv_conf.h`` 中启用 :c:macro:`LV_USE_RLOTTIE` 。

在 *create* 函数中设置对象的 ``width`` 和 ``height`` ，动画将相应地缩放。


Use Rlottie from file（从文件使用 Rlottie）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

To create a Lottie animation from file use:

.. code:: c

     lv_obj_t * lottie = lv_rlottie_create_from_file(parent, width, height, "path/to/lottie.json");

Note that, Rlottie uses the standard STDIO C file API, so you can use
the path "normally" and no LVGL specific driver letter is required.

.. raw:: html

   </details>
   <br>


要从文件使用创建 Lottie 动画：

.. code:: c

     lv_obj_t * lottie = lv_rlottie_create_from_file(parent, width, height, "path/to/lottie.json");

请注意，Rlottie 使用标准的 STDIO C 文件 API，因此您可以使用 路径“通常”，不需要特定于 LVGL 的驱动程序号。


Use Rlottie from raw string data（从原始字符串数据使用 Rlottie）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

``lv_example_rlottie_approve.c`` contains an example animation in raw
format. Instead storing the JSON string, a hex array is stored for the
following reasons:

- avoid escaping ``"`` character in the JSON file
- some compilers don't support very long strings

``lvgl/scripts/filetohex.py`` can be used to convert a Lottie file a hex
array. E.g.:

.. code:: shell

   ./filetohex.py path/to/lottie.json > out.txt

To create an animation from raw data:

.. code:: c

   extern const uint8_t lottie_data[];
   lv_obj_t* lottie = lv_rlottie_create_from_raw(parent, width, height, (const char *)lottie_data);

.. raw:: html

   </details>
   <br>


``lv_example_rlottie_approve.c`` 包含 RAW 格式的示例动画格式。而不是存储 JSON 字符串，而是为原因如下：

- 避免在 JSON 文件中转义字符 ``"`` 
- 某些编译器不支持很长的字符串

``lvgl/scripts/filetohex.py`` 可用于将 Lottie 文件转换为十六进制数组。例如：

.. code:: shell

   ./filetohex.py path/to/lottie.json > out.txt

要从原始数据创建动画：

.. code:: c

   extern const uint8_t lottie_data[];
   lv_obj_t* lottie = lv_rlottie_create_from_raw(parent, width, height, (const char *)lottie_data);


Getting animations（获取动画）
-----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Lottie is standard and popular format so you can find many animation
files on the web. For example: https://lottiefiles.com/

You can also create your own animations with Adobe After Effects or
similar software.

.. raw:: html

   </details>
   <br>


Lottie 是标准且流行的格式，因此您可以找到许多动画 Web 上的文件。例如：https://lottiefiles.com/

您还可以使用Adobe After Effects或类似的软件。


Controlling animations（控制动画）
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL provides two functions to control the animation mode:
:cpp:func:`lv_rlottie_set_play_mode` and :cpp:func:`lv_rlottie_set_current_frame`.
You'll combine your intentions when calling the first method, like in
these examples:

.. code:: c

   lv_obj_t * lottie = lv_rlottie_create_from_file(scr, 128, 128, "test.json");
   lv_obj_center(lottie);
   // Pause to a specific frame
   lv_rlottie_set_current_frame(lottie, 50);
   lv_rlottie_set_play_mode(lottie, LV_RLOTTIE_CTRL_PAUSE); // The specified frame will be displayed and then the animation will pause

   // Play backward and loop
   lv_rlottie_set_play_mode(lottie, LV_RLOTTIE_CTRL_PLAY | LV_RLOTTIE_CTRL_BACKWARD | LV_RLOTTIE_CTRL_LOOP);

   // Play forward once (no looping)
   lv_rlottie_set_play_mode(lottie, LV_RLOTTIE_CTRL_PLAY | LV_RLOTTIE_CTRL_FORWARD);

The default animation mode is **play forward with loop**.

If you don't enable looping, a :cpp:enumerator:`LV_EVENT_READY` is sent when the
animation can not make more progress without looping.

To get the number of frames in an animation or the current frame index,
you can cast the :c:struct:`lv_obj_t` instance to a :c:struct:`lv_rlottie_t` instance
and inspect the ``current_frame`` and ``total_frames`` members.

.. raw:: html

   </details>
   <br>


LVGL 提供了两个功能来控制动画模式：:cpp:func:`lv_rlottie_set_play_mode` 和 :cpp:func:`lv_rlottie_set_current_frame` 。 在调用第一种方法时，您将结合您的意图，例如 这些示例：

.. code:: c

   lv_obj_t * lottie = lv_rlottie_create_from_file(scr, 128, 128, "test.json");
   lv_obj_center(lottie);
   // Pause to a specific frame
   lv_rlottie_set_current_frame(lottie, 50);
   lv_rlottie_set_play_mode(lottie, LV_RLOTTIE_CTRL_PAUSE); // The specified frame will be displayed and then the animation will pause

   // Play backward and loop
   lv_rlottie_set_play_mode(lottie, LV_RLOTTIE_CTRL_PLAY | LV_RLOTTIE_CTRL_BACKWARD | LV_RLOTTIE_CTRL_LOOP);

   // Play forward once (no looping)
   lv_rlottie_set_play_mode(lottie, LV_RLOTTIE_CTRL_PLAY | LV_RLOTTIE_CTRL_FORWARD);

默认动画模式是 **循环向前播放** 。

如果不启用循环，则在 :cpp:enumerator:`LV_EVENT_READY` 没有循环，动画就无法取得更大的进步。

为了获得动画中的帧数或当前帧索引，可以将 :c:struct:`lv_obj_t` 实例强制转换为 :c:struct:` lv_rlottie_t` 实例并检查 ``current_frame`` 和 ``total_frames`` 成员。


ESP-IDF Example（ESP-IDF 示例）
------------------------------

Background（背景）
~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Rlottie can be expensive to render on embedded hardware. Lottie
animations tend to use a large amount of CPU time and can use large
portions of RAM. This will vary from lottie to lottie but in general for
best performance:

- Limit total # of frames in the animation
- Where possible, try to avoid bezier type animations
- Limit animation render size

If your ESP32 chip does not have SPIRAM you will face severe limitations
in render size.

To give a better idea on this, lets assume you want to render a 240x320
lottie animation.

In order to pass initialization of the lv_rlottie_t object, you need
240x320x32/8 (307k) available memory. The latest ESP32-S3 has 256kb RAM
available for this (before freeRtos and any other initialization starts
taking chunks out). So while you can probably start to render a 50x50
animation without SPIRAM, PSRAM is highly recommended.

Additionally, while you might be able to pass initialization of the
lv_rlottie_t object, as rlottie renders frame to frame, this consumes
additional memory. A 30 frame animation that plays over 1 second
probably has minimal issues, but a 300 frame animation playing over 10
seconds could very easily crash due to lack of memory as rlottie
renders, depending on the complexity of the animation.

Rlottie will not compile for the IDF using the ``-02`` compiler option at
this time.

For stability in lottie animations, I found that they run best in the
IDF when enabling :c:macro:`LV_MEM_CUSTOM` (using ``stdlib.h``)

For all its faults, when running right-sized animations, they provide a
wonderful utility to LVGL on embedded LCDs and can look really good when
done properly.

When picking/designing a lottie animation consider the following
limitations:

- Build the lottie animation to be sized for the intended size
- it can scale/resize, but performance will be best when the base lottie size is as intended
- - Limit total number of frames, the longer the lottie animation is,
the more memory it will consume for rendering (rlottie consumes IRAM for rendering)
- Build the lottie animation for the intended frame rate
- default lottie is 60fps, embedded LCDs likely won't go above 30fps

.. raw:: html

   </details>
   <br>


Rlottie 在嵌入式硬件上渲染的成本可能很高。洛蒂 动画往往会占用大量的 CPU 时间，并且可以使用较大的 部分 RAM。这将因 lottie 而异，但一般来说 最佳性能：

- 限制动画中 # 的帧总数
- 在可能的情况下，尽量避免使用贝塞尔类型的动画
- 限制动画渲染大小

如果您的 ESP32 芯片没有 SPIRAM，您将面临严重的限制 在渲染大小中。

为了更好地说明这一点，假设您要渲染 240x320 洛蒂动画。

为了传递 lv_rlottie_t 对象的初始化，您需要 240x320x32/8 （307K） 可用内存。最新的 ESP32-S3 具有 256kb RAM 可用于此（在 freeRtos 和任何其他初始化开始之前 取出块）。因此，虽然您可以开始渲染 50x50 没有 SPIRAM 的动画，强烈推荐使用 PSRAM。

此外，虽然您可能能够传递 lv_rlottie_t对象，当 rlottie 逐帧渲染时，这会消耗额外的内存。播放时间超过 1 秒的 30 帧动画 可能问题很少，但一个 300 帧的动画播放超过 10 帧由于内存不足，几秒钟很容易崩溃，因为 Rlottie 渲染，具体取决于动画的复杂程度。

Rlottie 不会使用 ``-02`` 编译器选项为 IDF 编译这一次。

为了保持乐透动画的稳定性，我发现它们在 :c:macro:`LV_MEM_CUSTOM` 启用时的 IDF(使用 ``stdlib.h``)

尽管存在所有缺陷，但在运行大小合适的动画时，它们会提供 在嵌入式 LCD 上对 LVGL 有很好的实用性，并且在以下情况下看起来非常好 做得好。

在挑选/设计彩票动画时，请考虑以下事项 局限性：

- 生成 lottie 动画以调整为预期大小
- 它可以缩放/调整大小，但当基本 Lottie 大小符合预期时，性能将最佳
- 限制总帧数，lottie 动画越长，
- 渲染消耗的内存越多（rlottie 使用IRAM进行渲染） - 为预期的帧速率构建 lottie 动画 - 默认 lottie 是 60fps，嵌入式 LCD 可能不会超过 30fps


IDF Setup（IDF设置）
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Where the LVGL simulator uses the installed rlottie lib, the IDF works
best when using rlottie as a submodule under the components directory.

.. code:: shell

   cd 'your/project/directory'
   git add submodule
   git add submodule https://github.com/Samsung/rlottie.git ./components/rlottie/rlottie
   git submodule update --init --recursive

Now, Rlottie is available as a component in the IDF, but it requires
some additional changes and a CMakeLists file to tell the IDF how to
compile.

.. raw:: html

   </details>
   <br>


当 LVGL 模拟器使用已安装的 rlottie 库时，IDF 可以工作 最好将 rlottie 用作 components 目录下的子模块。

.. code:: shell

   cd 'your/project/directory'
   git add submodule
   git add submodule https://github.com/Samsung/rlottie.git ./components/rlottie/rlottie
   git submodule update --init --recursive

现在，Rlottie 可作为 IDF 中的一个组件使用，但它需要 一些额外的更改和一个 CMakeLists 文件，用于告诉 IDF 如何编译。


Rlottie patch file（Rlottie 补丁文件）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Rlottie relies on a dynamic linking for an image loader lib. This needs
to be disabled as the IDF doesn't play nice with dynamic linking.

A patch file is available in lvgl under:
``/env_support/esp/rlottie/0001-changes-to-compile-with-esp-idf.patch``

Apply the patch file to your rlottie submodule.

.. raw:: html

   </details>
   <br>


Rlottie 依赖于图像加载器库的动态链接。这需要被禁用，因为 IDF 不能很好地使用动态链接。

补丁文件在 lvgl 中可用，位于以下位置： ``/env_support/esp/rlottie/0001-changes-to-compile-with-esp-idf.patch``

将修补程序文件应用于 rlottie 子模块。


CMakeLists for IDF（适用于 IDF 的 CMakeLists）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

An example CMakeLists file has been provided at
``/env_support/esp/rlottie/CMakeLists.txt``

Copy this CMakeLists file to
``'your-project-directory'/components/rlottie/``

In addition to the component CMakeLists file, you'll also need to tell
your project level CMakeLists in your IDF project to require rlottie:

.. code:: console

   REQUIRES "lvgl" "rlottie"

From here, you should be able to use lv_rlottie objects in your ESP-IDF
project as any other widget in LVGL ESP examples. Please remember that
these animations can be highly resource constrained and this does not
guarantee that every animation will work.

.. raw:: html

   </details>
   <br>


CMakeLists 文件示例已在 ``/env_support/esp/rlottie/CMakeLists.txt``

将此 CMakeLists 文件复制到 ``'your-project-directory'/components/rlottie/``

除了组件 CMakeLists 文件外，您还需要告诉 您的项目级别 CMakeLists 在您的 IDF 项目中要求 rlottie：

.. code:: console

   REQUIRES "lvgl" "rlottie"

从这里，您应该能够在 ESP-IDF 中使用lv_rlottie对象项目作为 LVGL ESP 示例中的任何其他小部件。请记住这些动画可能受到高度资源限制，但事实并非如此，保证每个动画都能正常工作。


Additional Rlottie considerations in ESP-IDF（ESP-IDF 中的其它 Rlottie 注意事项）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

While unnecessary, removing the ``rlottie/rlottie/example`` folder can remove
many un-needed files for this embedded LVGL application

From here, you can use the relevant LVGL lv_rlottie functions to create
lottie animations in LVGL on embedded hardware!

Please note, that while lottie animations are capable of running on many
ESP chips, below is recommended for best performance.

-  ESP32-S3-WROOM-1-N16R8

   -  16mb quad spi flash
   -  8mb octal spi PSRAM

-  IDF4.4 or higher

The Esp-box devkit meets this spec and
https://github.com/espressif/esp-box is a great starting point to adding
lottie animations.

You will need to enable :c:macro:`LV_USE_RLOTTIE` through **idf.py** menuconfig under
LVGL component settings.

.. raw:: html

   </details>
   <br>


虽然没有必要，但删除文件夹可以删除 ``rlottie/rlottie/example`` 此嵌入式 LVGL 应用程序的许多不需要的文件

从这里，您可以使用相关的 LVGL lv_rlottie函数来创建 嵌入式硬件上的 LVGL 中的 lottie 动画！

请注意，虽然 lottie 动画能够在许多上运行 ESP芯片，建议使用以下芯片以获得最佳性能。

- ESP32-S3-WROOM-1-N16R8

 - 16MB四通道SPI闪存
 - 8MB八通道SPI PSRAM

- IDF4.4 或更高版本

Esp-box devkit 符合此规范，https://github.com/espressif/esp-box 是一个很好的起点 洛蒂动画。

您需要通过 menuconfig 在 **idf.py** 下启用 :c:macro:`LV_USE_RLOTTIE`  LVGL 组件设置。


Additional changes to make use of SPIRAM（使用 SPIRAM 的其他更改）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_alloc/realloc` do not make use of SPIRAM. Given the high memory usage
of lottie animations, it is recommended to shift as much out of internal
DRAM into SPIRAM as possible. In order to do so, SPIRAM will need to be
enabled in the menuconfig options for your given espressif chip.

There may be a better solution for this, but for the moment the
recommendation is to make local modifications to the lvgl component in
your espressif project. This is as simple as swapping
:cpp:expr:`lv_alloc/lv_realloc` calls in `lv_rlottie.c`` with :cpp:expr:`heap_caps_malloc` (for
IDF) with the appropriate :cpp:expr:`MALLOC_CAP` call - for SPIRAM usage this is
:cpp:expr:`MALLOC_CAP_SPIRAM`.

.. code:: c

   rlottie->allocated_buf = heap_caps_malloc(allocated_buf_size+1, MALLOC_CAP_SPIRAM);

.. raw:: html

   </details>
   <br>


:cpp:expr:`lv_alloc/realloc` 不使用SPIRAM。鉴于内存使用率高的 lottie 动画，建议尽可能多地从内部转移，尽可能将 DRAM 放入 SPIRAM 中。为此，SPIRAM 需要在给定乐鑫芯片的 menuconfig 选项中启用。

可能有更好的解决方案，但就目前而言， 建议对 LVGL 组件进行本地修改您的乐鑫项目。这就像将 `lv_rlottie.c` 中的 :cpp:expr:`lv_alloc/lv_realloc` 调用与 :cpp:expr:`heap_caps_malloc` 交换一样简单（用于 IDF） 与适当的 :cpp:expr:`MALLOC_CAP` 调用 - 对于 SPIRAM 的使用，这是 :cpp:expr:`MALLOC_CAP_SPIRAM`。

.. code:: c

   rlottie->allocated_buf = heap_caps_malloc(allocated_buf_size+1, MALLOC_CAP_SPIRAM);


.. _rlottie_example:

Example
-------

.. include:: ../examples/libs/rlottie/index.rst

.. _rlottie_api:

API
---
