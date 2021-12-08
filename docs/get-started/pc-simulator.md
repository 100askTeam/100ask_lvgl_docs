```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/get-started/pc-simulator.md
```
# Simulator on PC（PC上的模拟器）

<details>
<summary>查看原文</summary>
<p>

You can try out LVGL **using only your PC** (i.e. without any development boards). LVGL will run on a simulator environment on the PC where anyone can write and experiment with real LVGL applications.

Using the simulator on a PC has the following advantages:
- Hardware independent - Write code, run it on the PC and see the result on a monitor.
- Cross-platform - Any Windows, Linux or macOS system can run the PC simulator.  
- Portability - The written code is portable, which means you can simply copy it when migrating to embedded hardware.
- Easy Validation - The simulator is also very useful to report bugs because it provides a common platform for every user. So it's a good idea to reproduce a bug in the simulator and use that code snippet in the [Forum](https://forum.lvgl.io).

</p>
</details>

您可以仅使用您的 PC **试用 LVGL（即没有任何开发板）。 LVGL 将在 PC 上的模拟器环境中运行，任何人都可以在其中编写和试验真实的 LVGL 应用程序。

在 PC 上使用模拟器具有以下优点：
- 独立于硬件 - 编写代码，在 PC 上运行并在监视器上查看结果。
- 跨平台 - 任何 Windows、Linux 或 macOS 系统都可以运行 PC 模拟器。
- 可移植性 - 编写的代码是可移植的，这意味着您可以在迁移到嵌入式硬件时简单地复制它。
- 轻松验证 - 模拟器对于报告错误也非常有用，因为它为每个用户提供了一个通用平台。 因此，最好在模拟器中重现错误并

可以在 [论坛](https://forum.lvgl.io) 中使用你在pc模拟器写的代码片段。


## Select an IDE（选择适合的IDE）

<details>
<summary>查看原文</summary>
<p>

The simulator is ported to various IDEs (Integrated Development Environments). Choose your favorite IDE, read its README on GitHub, download the project, and load it to the IDE.

- [Eclipse with SDL driver](https://github.com/lvgl/lv_sim_eclipse_sdl): Recommended on Linux and Mac
- [CodeBlocks](https://github.com/lvgl/lv_sim_codeblocks_win): Recommended on Windows
- [VisualStudio with SDL driver](https://github.com/lvgl/lv_sim_visual_studio_sdl): For Windows
- [VSCode with SDL driver](https://github.com/lvgl/lv_sim_vscode_sdl): Recommended on Linux and Mac
- [PlatformIO with SDL driver](https://github.com/lvgl/lv_platformio): Recommended on Linux and Mac

</p>
</details>

模拟器被移植到各种 IDE（集成开发环境）。选择您最喜欢的 IDE，在 GitHub 上阅读其 README，下载项目，然后将其加载到 IDE。

- [Eclipse with SDL driver](https://github.com/lvgl/lv_sim_eclipse_sdl): Linux 和 Mac
- [CodeBlocks](https://github.com/lvgl/lv_sim_codeblocks_win): Windows （简单方便推荐使用）
- [VisualStudio with SDL driver](https://github.com/lvgl/lv_sim_visual_studio_sdl): Windows
- [VSCode with SDL driver](https://github.com/lvgl/lv_sim_vscode_sdl): Linux 和 Mac 
- [PlatformIO with SDL driver](https://github.com/lvgl/lv_platformio): Linux 和 Mac 

<details>
<summary>查看原文</summary>
<p>

You can use any IDE for development but, for simplicity, the configuration for Eclipse CDT is what we'll focus on in this tutorial.
The following section describes the set-up guide of Eclipse CDT in more detail.

**Note: If you are on Windows, it's usually better to use the Visual Studio or CodeBlocks projects instead. They work out of the box without requiring extra steps.**

</p>
</details>


您可以使用任何 IDE 进行开发，但为简单起见，Eclipse CDT 的配置是我们在本教程中重点关注的内容。
以下部分更详细地描述了 Eclipse CDT 的设置指南。

**注意：如果您使用的是 Windows，通常最好改用 Visual Studio 或 CodeBlocks 项目。它们开箱即用，无需额外步骤。**


## Set-up Eclipse CDT（使用 Eclipse CDT 开发）

### Install Eclipse CDT（安装 Eclipse CDT）

<details>
<summary>查看原文</summary>
<p>

[Eclipse CDT](https://eclipse.org/cdt/) is a C/C++ IDE.

Eclipse is a Java based software therefore be sure **Java Runtime Environment** is installed on your system.   

On Debian-based distros (e.g. Ubuntu): `sudo apt-get install default-jre`

Note: If you are using other distros, then please refer and install 'Java Runtime Environment' suitable to your distro.
Note: If you are using macOS and get a "Failed to create the Java Virtual Machine" error, uninstall any other Java JDK installs and install Java JDK 8u. This should fix the problem.

You can download Eclipse's CDT from: [https://www.eclipse.org/cdt/downloads.php](https://www.eclipse.org/cdt/downloads.php). Start the installer and choose *Eclipse CDT* from the list.

</p>
</details>

Eclipse 是基于 Java 的软件，因此请确保您的系统上安装了 **Java 运行时环境**。

在基于 Debian 的发行版（例如 Ubuntu）上：`sudo apt-get install default-jre`

注意：如果您使用其他发行版，请参考并安装适合您的发行版的“Java 运行时环境”。
注意：如果您使用的是 macOS 并收到“无法创建 Java 虚拟机”错误，请卸载任何其他 Java JDK 安装并安装 Java JDK 8u。这应该可以解决问题。

您可以从以下位置下载 Eclipse 的 CDT：[https://www.eclipse.org/cdt/downloads.php](https://www.eclipse.org/cdt/downloads.php) 。启动安装程序并从列表中选择 Eclipse CDT。

### Install SDL 2（安装 SDL 2）

<details>
<summary>查看原文</summary>
<p>

The PC simulator uses the [SDL 2](https://www.libsdl.org/download-2.0.php) cross platform library to simulate a TFT display and a touch pad. 

</p>
</details>

PC 模拟器使用 [SDL 2](https://www.libsdl.org/download-2.0.php) 跨平台库来模拟 TFT 显示器和触摸板。

#### Linux

<details>
<summary>查看原文</summary>
<p>

On **Linux** you can easily install SDL2 using a terminal:

1. Find the current version of SDL2: `apt-cache search libsdl2 (e.g. libsdl2-2.0-0)`
2. Install SDL2: `sudo apt-get install libsdl2-2.0-0` (replace with the found version)
3. Install SDL2 development package: `sudo apt-get install libsdl2-dev`
4. If build essentials are not installed yet: `sudo apt-get install build-essential`

</p>
</details>

在 **Linux** 上，您可以使用终端轻松安装 SDL2：

1. 找到SDL2的当前版本：`apt-cache search libsdl2 (e.g. libsdl2-2.0-0)`
2. 安装SDL2：`sudo apt-get install libsdl2-2.0-0`（替换为找到的版本）
3. 安装SDL2开发包：`sudo apt-get install libsdl2-dev`
4. 如果尚未安装 build Essentials：`sudo apt-get install build-essential`


#### Windows

<details>
<summary>查看原文</summary>
<p>

If you are using **Windows** firstly you need to install MinGW ([64 bit version](http://mingw-w64.org/doku.php/download)). After installing MinGW, do the following steps to add SDL2:

1. Download the development libraries of SDL.   
Go to [https://www.libsdl.org/download-2.0.php](https://www.libsdl.org/download-2.0.php) and download _Development Libraries: SDL2-devel-2.0.5-mingw.tar.gz_
2. Decompress the file and go to _x86_64-w64-mingw32_ directory (for 64 bit MinGW) or to _i686-w64-mingw32_ (for 32 bit MinGW)
3. Copy _..._mingw32/include/SDL2_ folder to _C:/MinGW/.../x86_64-w64-mingw32/include_
4. Copy _..._mingw32/lib/_ content to _C:/MinGW/.../x86_64-w64-mingw32/lib_
5. Copy _..._mingw32/bin/SDL2.dll_ to _{eclipse_worksapce}/pc_simulator/Debug/_.  Do it later when Eclipse is installed. 

Note: If you are using **Microsoft Visual Studio** instead of Eclipse then you don't have to install MinGW. 

</p>
</details>

如果您使用的是 Windows，则需要安装 MinGW（64 位版本）。安装MinGW后，执行以下步骤添加SDL2：

1. 下载 SDL 的开发库。打开 [https://www.libsdl.org/download-2.0.php](https://www.libsdl.org/download-2.0.php) 并下载开发库：SDL2-devel-2.0.5-mingw.tar.gz
2. 解压文件并进入 x86_64-w64-mingw32 目录（对于 64 位 MinGW）或 i686-w64-mingw32（对于 32 位 MinGW）
3. 将 _...mingw32/include/SDL2 文件夹复制到 C:/MinGW/.../x86_64-w64-mingw32/include
4. 将 _...mingw32/lib/ 内容复制到 C:/MinGW/.../x86_64-w64-mingw32/lib
5. 将 _...mingw32/bin/SDL2.dll 复制到 {eclipse_workapce}/pc_simulator/Debug/。稍后在安装 Eclipse 时执行此操作。

注意：如果您使用 **Microsoft Visual Studio** 而不是 Eclipse，那么您不必安装 MinGW。

#### OSX

<details>
<summary>查看原文</summary>
<p>

On **OSX** you can easily install SDL2 with brew: `brew install sdl2`

If something is not working, then please refer [this tutorial](http://lazyfoo.net/tutorials/SDL/01_hello_SDL/index.php) to get started with SDL.

</p>
</details>

在 **OSX** 上，您可以使用 brew 轻松安装 SDL2：`brew install sdl2`

如果出现问题，请参阅 [这个教程](http://lazyfoo.net/tutorials/SDL/01_hello_SDL/index.php) 以开始使用 SDL。

### Pre-configured project（预配置项目）

<details>
<summary>查看原文</summary>
<p>

A pre-configured graphics library project (based on the latest release) is always available to get started easily. 
You can find the latest one on [GitHub](https://github.com/lvgl/lv_sim_eclipse_sdl).
(Please note that, the project is configured for Eclipse CDT). 

</p>
</details>

预配置的图形库项目（基于最新版本）始终可以轻松上手。你可以在 [GitHub仓库](https://github.com/lvgl/lv_sim_eclipse_sdl) 上找到最新的版本。 （请注意，该项目是为 Eclipse CDT 配置的）。

### Add the pre-configured project to Eclipse CDT（将预先配置的项目添加到 Eclipse CDT）

<details>
<summary>查看原文</summary>
<p>

Run Eclipse CDT. It will show a dialogue about the **workspace path**. Before accepting the path, check that path and copy (and unzip) the downloaded pre-configured project there. After that, you can accept the workspace path. Of course you can modify this path but, in that case copy the project to the corresponding location.

Close the start up window and go to **File-&gt;Import** and choose **General-&gt;Existing project into Workspace**. **Browse the root directory** of the project and click **Finish**

On **Windows** you have to do two additional things:

- Copy the **SDL2.dll** into the project's Debug folder 
- Right click on the project -&gt; Project properties -&gt; C/C++ Build -&gt; Settings -&gt; Libraries -&gt; Add ... and add _mingw32_ above SDLmain and SDL. (The order is important: mingw32, SDLmain, SDL)

</p>
</details>

运行 Eclipse CDT。它将显示有关 **工作区路径** 的对话。在接受路径之前，检查该路径并在那里复制（并解压缩）下载的预配置项目。之后，您可以接受工作区路径。当然，您可以修改此路径，但在这种情况下，将项目复制到相应位置。

关闭启动窗口并转到 **File->Import** 并选择 **General->Existing project into Workspace**。 **浏览项目根目录**，点击**完成**

在 **Windows** 上，您必须做另外两件事：

- 将 **SD​​L2.dll** 复制到项目的 Debug 文件夹中
- 右键单击​​项目-> 项目属性-> C/C++ 构建-> 设置-> 库-> 添加...并在SDLmain 和SDL 上方添加_mingw32_。 （顺序很重要：mingw32、SDLmain、SDL）


### Compile and Run（编译并运行）

<details>
<summary>查看原文</summary>
<p>

Now you are ready to run LVGL on your PC. Click on the Hammer Icon on the top menu bar to Build the project. If you have done everything right, then you will not get any errors. Note that on some systems additional steps might be required to "see" SDL 2 from Eclipse but, in most of cases the configurations in the downloaded project is enough.

After a success build, click on the Play button on the top menu bar to run the project. Now a window should appear in the middle of your screen.

Now you are ready to use LVGL and begin development on your PC.

</p>
</details>

现在您已准备好在您的 PC 上运行 LVGL。单击顶部菜单栏上的锤子图标以构建项目。如果你做的一切都是正确的，那么你就不会出现任何错误。请注意，在某些系统上，从 Eclipse 中“查看”SDL 2 可能需要额外的步骤，但在大多数情况下，下载项目中的配置就足够了。

成功构建后，单击顶部菜单栏上的“播放”按钮以运行项目。现在，屏幕中间应该会出现一个窗口。

现在您已准备好使用 LVGL 并可以开始在您的 PC 上进行开发了！

