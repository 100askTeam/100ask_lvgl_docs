.. _simulator:

============================
Simulator on PC（PC端模拟器）
============================

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can try out LVGL **using only your PC** (i.e. without any
development boards). LVGL will run on a simulator environment on the PC
where anyone can write and experiment with real LVGL applications.

Using the simulator on a PC has the following advantages:

- Hardware independent: Write code, run it on the PC and see the result on a monitor.
- Cross-platform: Any Windows, Linux or macOS system can run the PC simulator.
- Portability: The written code is portable, which means you can simply copy it when migrating to embedded hardware.
- Easy Validation: The simulator is also very useful to report bugs because it
  provides a common platform for every user. So it's a good idea to
  reproduce a bug in the simulator and use that code snippet in the
  `Forum <https://forum.lvgl.io>`__.

.. raw:: html

   </details>
   <br>


**您可以使用仅您的个人电脑** （即没有任何开发板）来尝试 LVGL。
LVGL 将在个人电脑的模拟器环境中运行，任何人都可以编写和试验真正的 LVGL 应用程序。

使用个人电脑上的模拟器具有以下优点：

- 硬件无关：编写代码，在个人电脑上运行，并在监视器上查看结果。
- 跨平台：任何 Windows、Linux 或 macOS 系统都可以运行个人电脑模拟器。
- 可移植性：编写的代码是可移植的，这意味着在迁移到嵌入式硬件时，您可以简单地复制它。
- 易于验证：模拟器还非常有用，可用于报告错误，因为它为每位用户提供了一个通用平台。
  因此，在模拟器中重现错误并使用该代码片段在 `论坛 <https://forum.lvgl.io>`__ 上是一个好主意。


Select an IDE（选择一个IDE）
----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The simulator is ported to various IDEs (Integrated Development Environments).
Choose your favorite IDE, read its README on GitHub, download the project, and load it to the IDE.

- `Eclipse with SDLdriver <https://github.com/lvgl/lv_sim_eclipse_sdl>`__: Recommended on Linux and Mac
- `CodeBlocks <https://github.com/lvgl/lv_sim_codeblocks_win>`__: Recommended on Windows
- `VisualStudio <https://github.com/lvgl/lv_sim_visual_studio_sdl>`__: For Windows
- `VSCode with SDL/X11 driver <https://github.com/lvgl/lv_sim_vscode_sdl>`__: Recommended on Linux (SDL/X11) and Mac (SDL)
- `PlatformIO with SDL driver <https://github.com/lvgl/lv_platformio>`__: Recommended on Linux and Mac
- `MDK with FastModel <https://github.com/lvgl/lv_port_an547_cm55_sim>`__: For Windows

External project not maintained by the LVGL organization:

- `QT Creator <https://github.com/Varanda-Labs/lvgl-qt-sim>`__: Cross platform

You can use any IDE for development but, for simplicity, the
configuration for Eclipse CDT is what we'll focus on in this tutorial.
The following section describes the set-up guide of Eclipse CDT in more
detail.

:Note: If you are on Windows, it's usually better to use the Visual
       Studio or CodeBlocks projects instead. They work out of the box without
       requiring extra steps.**

.. raw:: html

   </details>
   <br>


模拟器已移植到各种集成开发环境（IDE）中。
选择您喜欢的 IDE，在 GitHub 上阅读其 README，下载项目，并将其加载到 IDE 中。

- `Eclipse with SDLdriver <https://github.com/lvgl/lv_sim_eclipse_sdl>`__: Linux 和 Mac 推荐使用
- `CodeBlocks <https://github.com/lvgl/lv_sim_codeblocks_win>`__: Windows 推荐使用
- `VisualStudio <https://github.com/lvgl/lv_sim_visual_studio_sdl>`__: Windows 使用
- `VSCode with SDL/X11 driver <https://github.com/lvgl/lv_sim_vscode_sdl>`__: Linux（SDL/X11）和 Mac（SDL）推荐使用
- `PlatformIO with SDL driver <https://github.com/lvgl/lv_platformio>`__: Linux 和 Mac 推荐使用
- `MDK with FastModel <https://github.com/lvgl/lv_port_an547_cm55_sim>`__: Windows 使用

非 LVGL 组织维护的外部项目：

- `QT Creator <https://github.com/Varanda-Labs/lvgl-qt-sim>`__: 跨平台

您可以使用任何 IDE 进行开发，但为了简化流程，本教程将重点介绍 Eclipse CDT 的配置。
下一节将更详细地描述 Eclipse CDT 的设置指南。

:注意: 如果您使用的是 Windows，通常最好使用 Visual Studio 或 CodeBlocks 项目。它们无需额外步骤即可直接工作。


Set-up Eclipse CDT（设置 Eclipse CDT）
---------------------------------------

Install Eclipse CDT（安装 Eclipse CDT）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

`Eclipse CDT <https://eclipse.org/cdt/>`__ is a C/C++ IDE.

Eclipse is a Java-based tool so be sure **Java Runtime Environment** is installed on your system.

On Debian-based distros (e.g. Ubuntu): ``sudo apt-get install default-jre``

:note: If you are using other distros, then please install a 'Java
       Runtime Environment' suitable to your distro. Note: If you are using
       macOS and get a "Failed to create the Java Virtual Machine" error,
       uninstall any other Java JDK installs and install Java JDK 8u. This
       should fix the problem.

You can download Eclipse's CDT from:
https://www.eclipse.org/cdt/downloads.php. Start the installer and
choose *Eclipse CDT* from the list.

.. raw:: html

   </details>
   <br>


`Eclipse CDT <https://eclipse.org/cdt/>`__ 是一个 C/C++ 集成开发环境。

Eclipse 是一个基于 Java 的工具，因此请确保在您的系统上安装了 **Java 运行时环境**。

在基于 Debian 的发行版（例如 Ubuntu）上： ``sudo apt-get install default-jre``

:注意: 如果您使用的是其他发行版，请安装适合您发行版的“Java 运行时环境”。
:注意: 如果您使用的是 macOS 并且出现“无法创建 Java 虚拟机”错误，请卸载任何其他 Java JDK 安装并安装 Java JDK 8u。
      这应该可以解决问题。

您可以从以下链接下载 Eclipse 的 CDT：
https://www.eclipse.org/cdt/downloads.php。启动安装程序，并从列表中选择 Eclipse CDT。


Install SDL 2（安装 SDL 2）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

The PC simulator uses
- `SDL2 <https://www.libsdl.org/download-2.0.php>`__ cross-platform library or
- `X11 <https://www.x.org/releases/current/doc/libX11/libX11/libX11.html>`__ Linux library

to simulate a TFT display and a touchpad.

.. raw:: html

   </details>
   <br>


PC模拟器使用

- `SDL2 <https://www.libsdl.org/download-2.0.php>`__ 跨平台库或
- `X11 <https://www.x.org/releases/current/doc/libX11/libX11/libX11.html>`__ Linux库

来模拟 TFT 显示器和触摸板。


Linux
^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

On **Linux** you can easily install SDL2 using a terminal:

1. Find the current version of SDL2: ``apt-cache search libsdl2 (e.g. libsdl2-2.0-0)``
2. Install SDL2: ``sudo apt-get install libsdl2-2.0-0`` (replace with the found version)
3. Install SDL2 development package: ``sudo apt-get install libsdl2-dev``
4. If build essentials are not installed yet: ``sudo apt-get install build-essential``

On **Linux** X11 is even easier to install by terminal:

1. Install XLib: ``sudo apt-get install libx11-6`` (should be installed already)
2. Install XLib development package: ``sudo apt-get install libx11-dev``

.. raw:: html

   </details>
   <br>


在 **Linux** 上，您可以通过终端轻松安装 SDL2：

1. 查找 SDL2 的当前版本： ``apt-cache search libsdl2（例如 libsdl2-2.0-0）``
2. 安装 SDL2： ``sudo apt-get install libsdl2-2.0-0（用找到的版本替换）``
3. 安装 SDL2 开发包： ``sudo apt-get install libsdl2-dev``
4. 如果尚未安装构建基础工具： ``sudo apt-get install build-essential``

在 **Linux** 上，通过终端安装 X11 更为简单：

1. 安装 XLib： ``sudo apt-get install libx11-6`` （应该已经安装）
2. 安装 XLib 开发包： ``sudo apt-get install libx11-dev``


Windows
^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

If you are using **Windows** firstly you need to install
MinGW (`64 bit version <https://www.mingw-w64.org/downloads/#msys2>`__). After
installing MinGW, do the following steps to add SDL2:

1. Download the development libraries of SDL. Go to
   https://www.libsdl.org/download-2.0.php and download *Development Libraries: SDL2-devel-2.0.5-mingw.tar.gz*
2. Decompress the file and go to *x86_64-w64-mingw32* directory (for 64 bit MinGW) or to *i686-w64-mingw32* (for 32 bit MinGW)
3. Copy *mingw32/include/SDL2* folder to *C:/MinGW/…/x86_64-w64-mingw32/include*
4. Copy *mingw32/lib/* content to *C:/MinGW/…/x86_64-w64-mingw32/lib*
5. Copy *mingw32/bin/SDL2.dll* to *{eclipse_workspace}/pc_simulator/Debug/\_*. Do it later when Eclipse is installed.

:Note: If you are using **Microsoft Visual Studio** instead of Eclipse
       then you don't have to install MinGW.

.. raw:: html

   </details>
   <br>


如果你正在使用 **Windows**，首先你需要安装 
MinGW（ `64 位版本 <https://www.mingw-w64.org/downloads/#msys2>`__）。
安装 MinGW 后，请按照以下步骤添加 SDL2：

1. 下载 SDL 的开发库。前往 https://www.libsdl.org/download-2.0.php 并下载 *Development Libraries: SDL2-devel-2.0.5-mingw.tar.gz*
2. 解压文件，然后进入 *x86_64-w64-mingw32* 目录（对于 64 位 MinGW）或 *i686-w64-mingw32*（对于 32 位 MinGW）
3. 将 *mingw32/include/SDL2* 文件夹复制到 *C:/MinGW/…/x86_64-w64-mingw32/include*
4. 将 *mingw32/lib/* 的内容复制到 *C:/MinGW/…/x86_64-w64-mingw32/lib*
5. 将 *mingw32/bin/SDL2.dll* 复制到 *{eclipse_workspace}/pc_simulator/Debug/_*。这步可以在安装 Eclipse 之后进行。

:注意: 如果你正在使用 **Microsoft Visual Studio** 而不是 Eclipse，那么你不必安装 MinGW。


OSX
^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

On **OSX** you can easily install SDL2 with brew: ``brew install sdl2``

If something is not working, then please refer `this tutorial <http://lazyfoo.net/tutorials/SDL/01_hello_SDL/index.php>`__ to
get started with SDL.

.. raw:: html

   </details>
   <br>


在 OSX 上，你可以通过 brew 轻松安装 SDL2： ``brew install sdl2``

如果某些功能不起作用，请参考 `这个教程 <http://lazyfoo.net/tutorials/SDL/01_hello_SDL/index.php>`__ 以开始使用 SDL。


Pre-configured project（预配置的项目）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

A pre-configured graphics library project (based on the latest release)
is always available to get started easily. You can find the latest one
on `GitHub <https://github.com/lvgl/lv_sim_eclipse_sdl>`__.
(Please note that, the project is configured for Eclipse CDT).

.. raw:: html

   </details>
   <br>


一个预配置的图形库项目（基于最新版本）总是可用于轻松开始。你可以在  
`GitHub <https://github.com/lvgl/lv_sim_eclipse_sdl>`__ 上找到最新的项目。  
（请注意，该项目是为 Eclipse CDT 配置的）。


Add the pre-configured project to Eclipse CDT（将预配置的项目添加到 Eclipse CDT）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Run Eclipse CDT. It will show a dialogue about the **workspace path**.
Before accepting the path, check that path and copy (and unzip) the
downloaded pre-configured project there. After that, you can accept the
workspace path. Of course you can modify this path but in that case copy
the project to the corresponding location.

Close the start-up window and go to **File->Import** and choose
**General->Existing project into Workspace**. **Browse the root
directory** of the project and click **Finish**

On **Windows** you have to do two additional things:

-  Copy the **SDL2.dll** into the project's Debug folder
-  Right-click on the project -> Project properties -> C/C++ Build ->
   Settings -> Libraries -> Add … and add *mingw32* above SDLmain and
   SDL. (The order is important: mingw32, SDLmain, SDL)

.. raw:: html

   </details>
   <br>


运行 Eclipse CDT。它将显示一个关于 **工作区路径** 的对话框。
在接受路径之前，请检查该路径并将下载的预配置项目复制（并解压）到该路径。
之后，你可以接受工作区路径。当然，你可以修改此路径，但在那种情况下，将项目复制到相应的位置。

关闭启动窗口，然后转到 **文件->导入**，并 **选择 常规->现有项目到工作区**。 **浏览项目的根目录** 并点击 **完成**

在 **Windows** 上，你需要做两件额外的事情：

- 将 **SDL2.dll** 复制到项目的 Debug 文件夹中
- 右键点击项目 -> 项目属性 -> C/C++ 构建 -> 设置 -> 库 -> 添加 … 并在 SDLmain 和 SDL 之上添加 *mingw32*。
 （顺序很重要：mingw32、SDLmain、SDL）


Compile and Run（编译并运行）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Now you are ready to run LVGL on your PC. Click on the Hammer Icon on
the top menu bar to Build the project. If you have done everything
right, then you will not get any errors. Note that on some systems
additional steps might be required to "see" SDL 2 from Eclipse but in
most cases the configuration in the downloaded project is enough.

After a successful build, click on the Play button on the top menu bar
to run the project. Now a window should appear in the middle of your
screen.

Now you are ready to use LVGL and begin development on your PC.

.. raw:: html

   </details>
   <br>


现在你已经准备好在你的电脑上运行LVGL了。点击顶部菜单栏上的锤子图标来构建项目。
如果你已经正确地完成了所有步骤，那么你将不会遇到任何错误。
请注意，在某些系统上，可能需要额外的步骤才能在Eclipse中“看到”SDL 2，但在大多数情况下，下载的项目中的配置已经足够了。

构建成功后，点击顶部菜单栏上的播放按钮来运行项目。现在，屏幕中央应该会出现一个窗口。

现在你已经准备好使用LVGL并在你的电脑上开始开发了。


Using SDL manually（手动使用 SDL）
-----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

In case you don't use a supported IDE, you can also use LVGL's SDL support manually:

.. raw:: html

   </details>
   <br>


如果你不使用支持的集成开发环境（IDE），也可以手动使用LVGL的SDL支持：


.. code:: cmake

    #include <lvgl.h>
    #include <unistd.h>

    int main()
    {
        lv_init();
        lv_display_t *display = lv_sdl_window_create(800, 600);
        lv_indev_t *mouse = lv_sdl_mouse_create();
        lv_indev_t *keyboard = lv_sdl_keyboard_create();
        ...

        while (true) {
            uint32_t ms_delay = lv_timer_handler();
            usleep(ms_delay * 1000);
        }
    }
