.. _build_cmake:

=====
cmake
=====

Overview（概览）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

This project uses CMakePresets to ensure an easy build.  Find out more on Cmake Presets here:
https://cmake.org/cmake/help/latest/manual/cmake-presets.7.html

.. raw:: html

   </details>
   <br>


这个项目使用CMakePresets来确保轻松构建。在这里了解更多关于CMake Presets的信息：https://cmake.org/cmake/help/latest/manual/cmake-presets.7.html


Prerequisites（先决条件）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You need to install

- CMake
- Ninja (for Linux builds). Be sure to Add ninja to your PATH!

.. raw:: html

   </details>
   <br>


你需要安装

- CMake
- Ninja（适用于Linux构建）。一定要将ninja添加到你的PATH路径中！


How to build this project using cmake（如何使用cmake构建这个项目）
----------------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The recommended way to build this project is to use the provided CMakePresets.json. This file contains 2 configurations

- a windows (msvc) build using Visual Studio
- a linux (gcc) build using Ninja

More configurations will be added once available.

.. raw:: html

   </details>
   <br>


建议使用提供的CMakePresets.json文件来构建这个项目。该文件包含两个配置：
- 使用Visual Studio进行Windows (msvc)构建
- 使用Ninja进行Linux (gcc)构建

一旦可用，将添加更多配置。


Build with IDE（使用集成开发环境）
---------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The recommend way for consuming CMakePresets is a CMakePresets aware IDE such as

- VS 2022
- VS Code
- CLion

Simply load this project into your IDE and select your desired preset and you are good to go.

.. raw:: html

   </details>
   <br>


把CMakePresets用于最佳方式是使用CMakePresets感知的IDE，比如

- VS 2022
- VS Code
- CLion

只需将此项目加载到您的IDE中，然后选择您所需的预设，就可以开始了。


Build with CMake GUI（使用CMake GUI进行构建）
--------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Open this project with CMake GUI and select your desired preset.
When hitting the generate button, CMake will create solution files (for VS) or Ninja Files (for Linux Ninja Build)

The following targets are available.

- lvgl (the actual library, required)
- lvgl_thorvg (an vector graphics extension, optional)
- lvgl_examples (example usages, optional)
- lvgl_demos (some demos, optional)

All optional targets can be disabled by setting the proper cache variables.
If you use cmake to install lvgl 3 folders will be created.

- include/lvgl (contains all public headers)
- bin (contains all binaries (\*.dll))
- lib (contains all precompiled source files (\*.lib))

.. raw:: html

   </details>
   <br>


打开 CMake GUI 并选择您想要的预设配置。
点击生成按钮后，CMake 将创建解决方案文件（用于 VS）或 Ninja 文件（用于 Linux Ninja Build）。

以下目标可用：

- lvgl（实际库，必需）
- lvgl_thorvg（矢量图形扩展，可选）
- lvgl_examples（示例用法，可选）
- lvgl_demos（一些演示，可选）

所有可选目标都可以通过设置合适的缓存变量来禁用。
如果使用 cmake 安装 lvgl，将创建 3 个文件夹。

- include/lvgl（包含所有公共头文件）
- bin（包含所有二进制文件（\*.dll））
- lib（包含所有预编译源文件（\*.lib））


Build with Command line（使用命令行进行构建）
--------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can also build your project using the command line.
Run the following commands

- cmake --preset windows-base
- cmake --build --preset windows-base_dbg
- ctest --preset windows-base_dbg

.. raw:: html

   </details>
   <br>


您也可以使用命令行来构建您的项目。
运行以下命令：

- cmake --preset windows-base
- cmake --build --preset windows-base_dbg
- ctest --preset windows-base_dbg


