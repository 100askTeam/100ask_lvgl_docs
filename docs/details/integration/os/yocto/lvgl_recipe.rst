.. _yocto_lvgl_recipe:

=============
LVGL in Yocto
=============

.. raw:: html

   <details>
     <summary>显示原文</summary>

This chapter serves as a guide to help you create a recipe for an application
using LVGL. While the process will be demonstrated for the Raspberry Pi 3
(64-bit), it can be applied to any board in a similar way.

.. raw:: html

   </details>
   <br>

本章节作为指南，帮助您为使用 LVGL 的应用程序创建一个 recipe。
尽管本示例将在 Raspberry Pi 3 (64-bit) 上演示，但类似的过程也可以应用于其他开发板。

Build Host Packages
*******************

.. raw:: html

   <details>
     <summary>显示原文</summary>

You must install essential host packages on your build host. The following
command installs the host packages based on an Ubuntu distribution

.. code-block::

    sudo apt install gawk wget git diffstat unzip texinfo gcc build-essential \
    chrpath socat cpio python3 python3-pip python3-pexpect xz-utils \
    debianutils iputils-ping python3-git python3-jinja2 python3-subunit zstd \
    liblz4-tool file locales libacl1

.. note::

    For host package requirements on all supported Linux distributions, see the
    `Required Packages for the Build Host <https://docs.yoctoproject.org/
    ref-manual/system-requirements.html#required-packages-for-the-build-host>`_
    section in the Yocto Project Reference Manual.

.. raw:: html

   </details>
   <br>

您必须在构建主机上安装必要的主机软件包。以下命令基于 Ubuntu 发行版安装主机软件包：

.. code-block::  

    sudo apt install gawk wget git diffstat unzip texinfo gcc build-essential \  
    chrpath socat cpio python3 python3-pip python3-pexpect xz-utils \  
    debianutils iputils-ping python3-git python3-jinja2 python3-subunit zstd \  
    liblz4-tool file locales libacl1  

.. note::  

    有关所有支持的 Linux 发行版的主机软件包要求，请参见 Yocto Project 参考手册中的  
    `Required Packages for the Build Host <https://docs.yoctoproject.org/
    ref-manual/system-requirements.html#required-packages-for-the-build-host>`_ 部分。


Use Git to clone the required repositories
******************************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

After this section the folder tree will be like this

.. code-block:: none

    lvgl_yocto_guide/
    ├── build/
    │   ├── cache/
    │   ├── conf/
    │   ├── downloads/
    │   └── ...
    └── sources/
        ├── meta-openembedded
        ├── meta-raspberrypi
        └── poky

Start creating the folder architecture

.. code-block::

    mkdir -p lvgl_yocto_guide/sources

Clone Poky, meta-openembedded and meta-raspberrypi in the sources

.. code-block::

    cd lvgl_yocto_guide/sources
    git clone --branch scarthgap https://git.yoctoproject.org/poky.git
    git clone --branch scarthgap https://git.openembedded.org/meta-openembedded
    git clone --branch scarthgap git://git.yoctoproject.org/meta-raspberrypi

.. raw:: html

   </details>
   <br>

完成本节后，文件夹结构将如下所示：

.. code-block:: none  

    lvgl_yocto_guide/  
    ├── build/  
    │   ├── cache/  
    │   ├── conf/  
    │   ├── downloads/  
    │   └── ...  
    └── sources/  
        ├── meta-openembedded  
        ├── meta-raspberrypi  
        └── poky  

开始创建文件夹结构：  

.. code-block::  

    mkdir -p lvgl_yocto_guide/sources  

在 sources 中克隆 Poky、meta-openembedded 和 meta-raspberrypi：  

.. code-block::  

    cd lvgl_yocto_guide/sources  
    git clone --branch scarthgap https://git.yoctoproject.org/poky.git  
    git clone --branch scarthgap https://git.openembedded.org/meta-openembedded  
    git clone --branch scarthgap git://git.yoctoproject.org/meta-raspberrypi  


Build a base image
******************

.. raw:: html

   <details>
     <summary>显示原文</summary>

To understand better what is going on, let's build the image like it is
prepared for us

.. code-block:: none

    cd ../ # go back to the root folder
    source sources/poky/oe-init-build-env

Now you should have a folder named ``build`` next to ``sources``. The last
command
also sets the current directory to the build directory.

In the build directory, there is a ``conf`` folder with some files in it

.. code-block:: none

    └── build/
        └── conf/
            ├── bblayers.conf
            ├── conf-notes.txt
            ├── conf-summary.txt
            ├── local.conf
            └── templateconf.cfg

The important files for us are ``local.conf`` and ``bblayers.conf``

To add layers to the project there are 2 options:

**Bitbake commands (Option 1)**

You need to be in the same terminal you did the ``source`` command. Add the
layers with the Bitbake command like this

.. code-block::

    bitbake-layers add-layer ../sources/meta-openembedded
    bitbake-layers add-layer ../sources/meta-raspberrypi

**Modify conf file (Option 2)**

Open ``conf/bblayers.conf`` file and add manually the paths:

.. code-block:: bash

    # POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.conf
    # changes incompatibly
    POKY_BBLAYERS_CONF_VERSION = "2"

    BBPATH = "${TOPDIR}"
    BBFILES ?= ""

    BBLAYERS ?= " \
    ${TOPDIR}/../sources/poky/meta \
    ${TOPDIR}/../sources/poky/meta-poky \
    ${TOPDIR}/../sources/poky/meta-yocto-bsp \
    ${TOPDIR}/../sources/meta-raspberrypi \
    ${TOPDIR}/../sources/meta-openembedded/meta-oe \
    ${TOPDIR}/../sources/meta-openembedded/meta-multimedia \
    ${TOPDIR}/../sources/meta-openembedded/meta-networking \
    ${TOPDIR}/../sources/meta-openembedded/meta-python \
    "

To ensure the layers were added as expected, run the Bitbake command to show
all the layers::

    bitbake-layers show-layers

The following layers should be listed:
    -  core
    -  yocto
    -  yoctobsp
    -  raspberrypi
    -  openembedded-layer
    -  multimedia-layer
    -  networking-layer
    -  meta-python

.. raw:: html

   </details>
   <br>

为了更好地理解正在发生的事情，让我们构建一个为我们准备好的镜像。

.. code-block:: none  

    cd ../ # 返回到根目录  
    source sources/poky/oe-init-build-env  

现在您应该在 ``sources`` 文件夹旁边看到一个名为 ``build`` 的文件夹。最后一条命令还将当前目录设置为构建目录。

在构建目录中，有一个包含一些文件的 ``conf`` 文件夹：

.. code-block:: none  

    └── build/  
        └── conf/  
            ├── bblayers.conf  
            ├── conf-notes.txt  
            ├── conf-summary.txt  
            ├── local.conf  
            └── templateconf.cfg  

对我们来说，重要的文件是 ``local.conf`` 和 ``bblayers.conf``。  

要将 layers 添加到项目中，有两种方法：

**Bitbake 命令（选项 1）**

您需要在执行过 ``source`` 命令的同一终端中。使用 Bitbake 命令添加 layers，如下所示：

.. code-block::  

    bitbake-layers add-layer ../sources/meta-openembedded  
    bitbake-layers add-layer ../sources/meta-raspberrypi  

**修改 conf 文件（选项 2）**

打开 ``conf/bblayers.conf`` 文件，手动添加路径：

.. code-block:: bash  

    # POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.conf  
    # changes incompatibly  
    POKY_BBLAYERS_CONF_VERSION = "2"  

    BBPATH = "${TOPDIR}"  
    BBFILES ?= ""  

    BBLAYERS ?= " \  
    ${TOPDIR}/../sources/poky/meta \  
    ${TOPDIR}/../sources/poky/meta-poky \  
    ${TOPDIR}/../sources/poky/meta-yocto-bsp \  
    ${TOPDIR}/../sources/meta-raspberrypi \  
    ${TOPDIR}/../sources/meta-openembedded/meta-oe \  
    ${TOPDIR}/../sources/meta-openembedded/meta-multimedia \  
    ${TOPDIR}/../sources/meta-openembedded/meta-networking \  
    ${TOPDIR}/../sources/meta-openembedded/meta-python \  
    "  

为了确保 layers 被正确添加，运行以下 Bitbake 命令以显示所有 layers：

.. code-block::  

    bitbake-layers show-layers  

以下 layers 应该会被列出：  
- core  
- yocto  
- yoctobsp  
- raspberrypi  
- openembedded-layer  
- multimedia-layer  
- networking-layer  
- meta-python  

Build for RaspberryPi3 64
=========================

.. raw:: html

   <details>
     <summary>显示原文</summary>

The available machine configurations for Raspberrypi can be listed like this

.. code-block::

    ls ../sources/meta-raspberrypi/conf/machine/*.conf

To build an image for Raspberrypi3 64 bits, modify the file ``local.conf`` file
replacing the ``MACHINE ??=`` default value like this

.. code-block:: bash

    MACHINE ??= "raspberrypi3-64"

To build the image we will target, it is also needed to add this to the file:

.. code-block:: bash

    LICENSE_FLAGS_ACCEPTED = "synaptics-killswitch"

.. note::

    You can find more information about this variable `here <https://meta-raspberrypi.readthedocs.io/en/latest/ipcompliance.html#linux-firmware-rpidistro>`_.

Everything is setup, time to build the image::

    bitbake core-image-base

.. raw:: html

   </details>
   <br>

可以通过以下命令列出 Raspberry Pi 可用的机器配置：  

.. code-block::  

    ls ../sources/meta-raspberrypi/conf/machine/*.conf  

要为 Raspberry Pi 3 64 位构建镜像，修改 ``local.conf`` 文件，将默认的 ``MACHINE ??=`` 值替换为以下内容：  

.. code-block:: bash  

    MACHINE ??= "raspberrypi3-64"  

此外，为了构建目标镜像，还需要在文件中添加以下内容：  

.. code-block:: bash  

    LICENSE_FLAGS_ACCEPTED = "synaptics-killswitch"  

.. note::  

    您可以在 `这里 <https://meta-raspberrypi.readthedocs.io/en/latest/ipcompliance.html#linux-firmware-rpidistro>`_ 找到关于此变量的更多信息。  

一切都已设置完毕，开始构建镜像：  

.. code-block::  

    bitbake core-image-base  

Overview of the build
=====================

.. raw:: html

   <details>
     <summary>显示原文</summary>

Let's go through the build folders to understand what happened.

.. raw:: html

   </details>
   <br>

让我们浏览一下构建文件夹以了解发生了什么。

Downloads
---------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The folder location can be changed with the ``DL_DIR`` variable.

The Downloads folder is a fundamental part of the Yocto build environment,
serving as a local cache for all external sources and dependencies. This
caching mechanism is essential for efficient builds, ensuring that repeated
builds do not waste time downloading the same files again.

.. raw:: html

   </details>
   <br>

可以使用 ``DL_DIR`` 变量更改文件夹位置。

Downloads 文件夹是 Yocto 构建环境的基本部分，充当所有外部源和依赖项的本地缓存。
这缓存机制对于高效构建至关重要，确保重复构建不会浪费时间再次下载相同的文件。

tmp/deploy
----------

.. raw:: html

   <details>
     <summary>显示原文</summary>

This folder contains the final output artifacts that are ready for deployment.
These artifacts include kernel images, root filesystems, packages, SDKs,
bootloader files, and other components that are generated during the Yocto
build process.

There are some key folders:
    -  **images**: it contains the images that can be flashed or deployed to
       the target device. Files like the Linux kernel, root filesystem (e.g., .
       ext4, .tar.gz, .squashfs), bootloaders (e.g., U-Boot), and other
       bootable images for the device are found here. t’s organized by the
       machine (or target board) for which the image was built.
    -  **rmp/deb/ipk**: These folders contain the individual software packages
       generated during the build, in the specified package format (RPM, DEB,
       or IPK). These packages are typically created when you’re building your
       Yocto project with package management support enabled. These can later
       be installed on the target device using package management tools
    -  **sdk**: This subdirectory contains Software Development Kits (SDKs)
       that you can use to cross-compile applications for your target system.
       The SDKs are generated when you use the ``bitbake -c populate_sdk``
       command.

.. raw:: html

   </details>
   <br>

该文件夹包含已经准备好部署的最终输出产物。这些产物包括内核镜像、根文件系统、软件包、SDK、引导加载程序文件以及在 Yocto 构建过程中生成的其他组件。

一些关键文件夹包括：  

- **images**：包含可以刷写或部署到目标设备的镜像。这里可以找到 Linux 内核、根文件系统（例如 `.ext4`、`.tar.gz`、`.squashfs`）、引导加载程序（例如 U-Boot）以及设备的其他可引导镜像。它按照构建镜像的机器（或目标板）进行组织。  
- **rmp/deb/ipk**：这些文件夹包含在构建过程中生成的独立软件包，采用指定的包格式（RPM、DEB 或 IPK）。当您在启用包管理支持的情况下构建 Yocto 项目时，这些软件包会被创建。稍后可以使用包管理工具将这些包安装到目标设备上。  
- **sdk**：该子目录包含软件开发工具包（SDK），可用于为目标系统交叉编译应用程序。当您使用 ``bitbake -c populate_sdk`` 命令时，会生成这些 SDK。


tmp/sysroots-components
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

This folder is a modular approach introduced in Yocto to handle sysroots. It
divides the sysroot into individual components, which can be thought of as the
building blocks or packages that make up the entire sysroot environment.

Each component corresponds to a specific package or dependency that is staged
into the sysroot. This approach allows for more efficient reuse of sysroots
across multiple packages or builds, and it helps with dependency tracking and
management during the build process.

The sysroot-components directory helps optimize the build process because if
one package changes, Yocto only needs to update the corresponding component
rather than rebuilding or copying the entire sysroot.

If you followed the previous steps, here are the folders you will find:
    - ``all``: Architecture-independent files.
    - ``cortexa53``: Files for the Cortex-A53 (ARMv8-A) architecture.
    - ``manifests``: Track files installed in the sysroot by package.
    - ``raspberrypi3_64``: Files specific to the Raspberry Pi 3 (64-bit).
    - ``x86_64``: Files for the x86_64 (PC) architecture, typically for
      cross-compilation tools.
    - ``x86_64-nativesdk``: Files related to the SDK for cross-compilation on
      an x86_64 host.

Each folder corresponds to components relevant to the specific architecture,
and they collectively form the complete environment needed to compile and run
software for the target and host systems.

.. raw:: html

   </details>
   <br>

这个文件夹是在 Yocto 中引入的一种模块化方法，用来处理 sysroots。它将 sysroot 分割为各个组件，这些组件可以被看作是构成整个 sysroot 环境的基础块或包。

每个组件对应于一个特定的包或依赖，这些包或依赖被阶段性地集成到 sysroot 中。这种方法允许跨多个包或构建更高效地重用 sysroots，并在构建过程中帮助跟踪和管理依赖关系。

sysroot-components 目录有助于优化构建过程，因为如果一个包发生变化，Yocto 只需要更新相应的组件，而不是重新构建或复制整个 sysroot。

如果你遵循了前面的步骤，这里是你会找到的文件夹：
    - ``all``：与体系结构无关的文件。
    - ``cortexa53``：针对 Cortex-A53 (ARMv8-A) 体系结构的文件。
    - ``manifests``：跟踪 sysroot 中由包安装的文件。
    - ``raspberrypi3_64``：特定于树莓派 3 (64 位) 的文件。
    - ``x86_64``：针对 x86_64 (PC) 体系结构的文件，通常用于跨平台编译工具。
    - ``x86_64-nativesdk``：与 x86_64 主机上的 SDK 相关的文件。

每个文件夹对应于与特定体系结构相关的组件，它们共同形成了编译和运行目标系统和主机系统软件所需的完整环境。

tmp/sysroots-uninative
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The sysroots-uninative directory in Yocto is used to support the "uninative"
feature, which allows for more reproducible builds by ensuring that the build
environment remains consistent across different host systems. It essentially
provides a way to use the same native build tools across different Linux
distributions.

.. raw:: html

   </details>
   <br>

Yocto 中的 sysroots-uninative 目录用于支持“uninative”功能，该功能通过确保在不同的主机系统上保持构建环境的一致性，从而实现更可重现的构建。它本质上提供了一种在不同 Linux 发行版之间使用相同的本地构建工具的方法。

tmp/work
--------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The ``work`` folder in Yocto is a key directory in the ``tmp`` folder that
holds all the temporary build artifacts for each package during the build
process. It is where the actual building and compiling of individual packages
or recipes takes place. Each package (or "recipe") that BitBake processes
generates temporary files and directories inside this ``work`` folder.

The ``work`` folder is typically structured by machine architecture and
package. Here's how it generally works:

.. code-block:: none

    work/
    └── <architecture>/
        └── <package>/
            └── <version>/
                ├── temp/
                ├── work/
                ├── sysroot-destdir/
                └── image/

This folder is very important and helps a lot during debug phases. The ``temp``
subfolder contains important logs that can help you diagnose build issues. This
is where you'll look when a build fails to figure out what went wrong.

.. raw:: html

   </details>
   <br>

Yocto 中的 ``work`` 文件夹是 ``tmp`` 文件夹中的一个关键目录，它保存了构建过程中每个包的所有临时构建产物。这是单个包或配方实际进行构建和编译的地方。BitBake 处理的每个包（或“配方”）都会在这个 ``work`` 文件夹内生成临时文件和目录。

``work`` 文件夹通常按机器架构和包进行结构化。以下是它的一般工作方式：

.. code-block:: none

    work/
    └── <architecture>/
        └── <package>/
            └── <version>/
                ├── temp/
                ├── work/
                ├── sysroot-destdir/
                └── image/

这个文件夹非常重要，特别是在调试阶段，它提供了很大的帮助。 ``temp`` 子文件夹包含重要的日志，可以帮助你诊断构建问题。当构建失败时，你需要查看这里以找出问题所在。

LVGL recipe
***********

.. raw:: html

   <details>
     <summary>显示原文</summary>

Find more information about recipes in :ref:`recipes_section` section.

There is a recipe in ``meta-openembedded`` since ``honister``.

.. list-table:: lvgl recipe version
   :widths: 200 100
   :header-rows: 1

   * - Branch
     - Recipe
   * - scarthgap (Yocto Project 5.0)
     - lvgl 9.1.0
   * - nanbield (Yocto Project 4.3)
     - lvgl 8.3.10
   * - mickledore (Yocto Project 4.2)
     - lvgl 8.1.0
   * - langdale (Yocto Project 4.1)
     - lvgl 8.1.0
   * - langdale (Yocto Project 4.1)
     - lvgl 8.1.0
   * - kirkstone (Yocto Project 4.0)
     - lvgl 8.0.3

In this guide, we are on the ``scarthgap`` branch, so we are using lvgl 9.1.0.

Let's dive into this recipe to understand what is done. The objective is to add
this library as a shared object in the target rootfs, and also to generate a
SDK with lvgl.

This is the path of lvgl recipes: ``lvgl_yocto_guide/sources/meta-openembedded/
meta-oe/recipes-graphics/lvgl``

Here is the architecture of lvgl recipes folder:

.. code-block:: bash

    lvgl
    ├── files
    │   ├── 0002-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch
    │   ├── 0003-Make-fbdev-device-node-runtime-configurable-via-envi.patch
    │   ├── 0004-Factor-out-fbdev-initialization-code.patch
    │   ├── 0005-Add-DRM-KMS-example-support.patch
    │   ├── 0006-Add-SDL2-example-support.patch
    │   ├── 0007-fix-cmake-generate-versioned-shared-libraries.patch
    │   └── 0008-fix-fbdev-set-resolution-prior-to-buffer.patch
    ├── lv-conf.inc
    ├── lvgl_9.1.0.bb
    └── lvgl-demo-fb_9.1.0.bb

-  ``file`` folder contains all the patches that can be applied when
   building the recipe.
-  ``lv_conf.inc`` is an include file, usually containing common configuration
   settings for LVGL that can be shared between multiple recipes.
-  ``lvgl_9.1.0.bb`` is the recipe to build lvgl library.
-  ``lvgl-demo-fb_9.1.0.bb`` is a recipe to build an application using lvgl.

For now let's understand the recipe of lvgl library.

.. code-block:: bash

    # SPDX-FileCopyrightText: Huawei Inc.
    #
    # SPDX-License-Identifier: MIT

    HOMEPAGE = "https://lvgl.io/"
    DESCRIPTION = "LVGL is an OSS graphics library to create embedded GUI"
    SUMMARY = "Light and Versatile Graphics Library"
    LICENSE = "MIT"
    LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=bf1198c89ae87f043108cea62460b03a"

    SRC_URI = "\
        git://github.com/lvgl/lvgl;protocol=https;branch=master \
        file://0002-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch \
        file://0007-fix-cmake-generate-versioned-shared-libraries.patch \
        file://0008-fix-fbdev-set-resolution-prior-to-buffer.patch \
        "
    SRCREV = "e1c0b21b2723d391b885de4b2ee5cc997eccca91"

    inherit cmake

    EXTRA_OECMAKE = "-DLIB_INSTALL_DIR=${baselib} -DBUILD_SHARED_LIBS=ON"
    S = "${WORKDIR}/git"

    require lv-conf.inc

    do_install:append() {
        install -d "${D}${includedir}/${PN}"
        install -m 0644 "${S}/lv_conf.h" "${D}${includedir}/${PN}/lv_conf.h"
    }

    FILES:${PN}-dev += "\
        ${includedir}/${PN}/ \
        "

**LICENSE**: Indicates the licensing of the software, stating that it is
distributed under the MIT License.

**LIC_FILES_CHKSUM**: This variable contains a checksum (in this case, an MD5 hash)
for the license file (here assumed to be LICENCE.txt). This helps to ensure the
integrity of the license file included in the package. In LVGL repository,
there is a LICENSE.txt. To get the value of the hash of the file, you can do
this command: ``md5sum LICENSE.txt``

SRC_URI: Specifies the locations of the source code and patches for the recipe:
    - The main source repository for LVGL specifying the master branch.
    - The following arguments are the local patch files that will be applied to
      the source code during the build process.

**SRCREV**: Defines the specific commit (in this case, a Git SHA hash) from
which the source code will be fetched. This ensures that the build uses a
consistent version of the code.

**inherit**: This line indicates that the recipe uses the ``cmake`` class,
which provides functionality for building projects that use CMake as
their build system.

**EXTRA_OECMAKE**: Additional options passed to CMake during the
configuration step.

**S**: This variable defines the source directory where the unpacked source
code will be located after fetching. ``${WORKDIR}`` is a standard
variable in BitBake that points to the working directory for the recipe.
require: This line includes another configuration file, ``lv-conf.inc``,
which likely contains additional configuration options or variables
specific to the LVGL library.

**FILES**: This is a BitBake variable used to specify the files that should
be included in a particular package. In this case, the variable is
specifying files for a package related to development (i.e., header
files).

.. raw:: html

   </details>
   <br>

在 :ref:`recipes_section` 部分可以找到更多有关配方的信息。

自 ``honister`` 以来， ``meta-openembedded`` 中就有一个配方。

.. list-table:: lvgl recipe version
   :widths: 200 100
   :header-rows: 1

   * - Branch
     - Recipe
   * - scarthgap (Yocto Project 5.0)
     - lvgl 9.1.0
   * - nanbield (Yocto Project 4.3)
     - lvgl 8.3.10
   * - mickledore (Yocto Project 4.2)
     - lvgl 8.1.0
   * - langdale (Yocto Project 4.1)
     - lvgl 8.1.0
   * - langdale (Yocto Project 4.1)
     - lvgl 8.1.0
   * - kirkstone (Yocto Project 4.0)
     - lvgl 8.0.3

在这份指南中，我们处于 ``scarthgap`` 分支，因此我们正在使用 lvgl 9.1.0。

让我们深入了解这个配方，以理解其功能。目标是将这个库作为共享对象添加到目标 rootfs 中，并生成一个包含 lvgl 的 SDK。

这是 lvgl 配方的路径： ``lvgl_yocto_guide/sources/meta-openembedded/meta-oe/recipes-graphics/lvgl``

下面是 lvgl 配方文件夹的结构：

.. code-block:: bash

    lvgl
    ├── files
    │   ├── 0002-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch
    │   ├── 0003-Make-fbdev-device-node-runtime-configurable-via-envi.patch
    │   ├── 0004-Factor-out-fbdev-initialization-code.patch
    │   ├── 0005-Add-DRM-KMS-example-support.patch
    │   ├── 0006-Add-SDL2-example-support.patch
    │   ├── 0007-fix-cmake-generate-versioned-shared-libraries.patch
    │   └── 0008-fix-fbdev-set-resolution-prior-to-buffer.patch
    ├── lv-conf.inc
    ├── lvgl_9.1.0.bb
    └── lvgl-demo-fb_9.1.0.bb

- ``file`` 文件夹包含所有在构建配方时可以应用的补丁。
- ``lv_conf.inc`` 是一个包含文件，通常包含可以在多个配方之间共享的 LVGL 的常见配置设置。
- ``lvgl_9.1.0.bb`` 是构建 lvgl 库的配方。
- ``lvgl-demo-fb_9.1.0.bb`` 是一个构建使用 lvgl 的应用程序的配方。

现在让我们来了解 lvgl 库的配方。

.. code-block:: bash

    # SPDX-FileCopyrightText: Huawei Inc.
    #
    # SPDX-License-Identifier: MIT

    HOMEPAGE = "https://lvgl.io/"
    DESCRIPTION = "LVGL is an OSS graphics library to create embedded GUI"
    SUMMARY = "Light and Versatile Graphics Library"
    LICENSE = "MIT"
    LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=bf1198c89ae87f043108cea62460b03a"

    SRC_URI = "\
        git://github.com/lvgl/lvgl;protocol=https;branch=master \
        file://0002-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch \
        file://0007-fix-cmake-generate-versioned-shared-libraries.patch \
        file://0008-fix-fbdev-set-resolution-prior-to-buffer.patch \
        "
    SRCREV = "e1c0b21b2723d391b885de4b2ee5cc997eccca91"

    inherit cmake

    EXTRA_OECMAKE = "-DLIB_INSTALL_DIR=${baselib} -DBUILD_SHARED_LIBS=ON"
    S = "${WORKDIR}/git"

    require lv-conf.inc

    do_install:append() {
        install -d "${D}${includedir}/${PN}"
        install -m 0644 "${S}/lv_conf.h" "${D}${includedir}/${PN}/lv_conf.h"
    }

    FILES:${PN}-dev += "\
        ${includedir}/${PN}/ \
        "

**LICENSE**：指示软件的许可证，声明其根据 MIT 许可证分发。

**LIC_FILES_CHKSUM**：这个变量包含一个校验和（在这种情况下，是一个 MD5 哈希值）用于许可证文件（这里假设为 LICENCE.txt）。这有助于确保包含在包中的许可证文件的完整性。在 LVGL 仓库中，有一个 LICENSE.txt。要获取文件的哈希值，你可以执行此命令：``md5sum LICENSE.txt``

SRC_URI：指定配方的源代码和补丁的位置：
    - 指定主源仓库为 LVGL 的 master 分支。
    - 以下参数是在构建过程中将应用于源代码的本地补丁文件。

**SRCREV**：定义从中获取源代码的特定提交（在此案例中，是一个 Git SHA 哈希值）。这确保构建使用代码的一致版本。

**inherit**：这一行表明配方使用了 ``cmake`` 类，该类为使用 CMake 作为构建系统的项目提供功能。

**EXTRA_OECMAKE**：在配置步骤中传递给 CMake 的额外选项。

**S**：这个变量定义了解压缩源代码后将位于何处的源目录。``${WORKDIR}`` 是 BitBake 中的一个标准变量，指向配方的工作目录。
require：这一行包含了另一个配置文件，``lv-conf.inc``，其中可能包含额外的配置选项或特定于 LVGL 库的变量。

**FILES**：这是一个 BitBake 变量，用于指定应包含在特定包中的文件。在这种情况下，变量正在指定与开发相关的包的文件（即头文件）。

Recipe Tasks
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

When a recipe is compiled, it will run multiple tasks. You can run each task
manually to understand what is generated each step, or you can run ``bitbake
lvgl`` to run all the tasks.

Fetch (do_fetch)
   .. code-block:: bash

      bitbake lvgl -c fetch

   Fetch task fetches the package source from the local or remote repository.

   The fetch Repo address has to be stored in **SRC_URI** variable. In
   **SRCREV** Variable the commit hash of github repo is defined.

   When the fetch task has been completed, you can find the fetched sources in
   ``build/downloads``.

   For this recipe, you will find a new folder here: ``lvgl_yocto_guide
   build/downloads/git2/github.com.lvgl.lvgl``.

   You can also find the folder architecture created in ``lvgl_yocto_guide/
   build/tmp/work/cortexa53-poky-linux/lvgl`` but these folders are empty since
   only the fetch was done.




Unpack (do_upack)
   .. code-block:: bash

      bitbake lvgl -c unpack

   Unpack task unpacks the package that has been downloaded with Fetch task.

   In the ``lvgl_yocto_guide/build/tmp/work/cortexa53-poky-linux/lvgl/9.1.0``
   folder, you can now find the source code in ``git`` (as it was defined in
   the recipe). You will also see the patches that will be applied on the next
   step. So for now, the sources are unmodified and the same than the commit
   that was specified.



Patch (do_patch)
   .. code-block:: bash

      bitbake lvgl -c patch

   Patch task locates the patch files and applies the patches to the sources
   if any patch is available. This is optional task, executes if patch is
   available.

   Patch file is also defined in **SRC_URI** variable. By default it runs in
   current source directory **${S}**.

Configure (do_configure)
   .. code-block:: bash

      bitbake lvgl -c configure

   The Configuration task configures the source by enabling and disabling any
   build-time and configuration options for the software being built before
   compilation if any configuration is available.

   This is a optional steps, executes if configuration is available.

   In this case, it creates a build directory, It invokes CMake to configure
   the project, specifying build options and paths based on variables in your
   recipe. It generates Makefiles or project files needed for the build. Also,
   there are operations added in the task in ``lv-conf.inc``.

   So at the end of the task, in the ``lvgl_yocto_guide/build/tmp/work/
   cortexa53-poky-linux/lvgl/9.1.0``, you will find a ``build`` folder that was
   generated running the CMake command, but nothing is built yet. Also, the
   sysroots have everything required to build lvgl library.


Compile (do_compile)
   .. code-block:: bash

      bitbake lvgl -c compile

   The Compilation task compiles the source code if any compilation steps are
   available and generates a binary file.

   This is a optional steps, executes if compilation is available.

   If there are any compilation steps, then these steps are define in
   do_compile() funtion of bitbake.

   Like in the previous task, this is handle by ``inherit cmake``.

   In the build folder, you can now see the built library. The ``.so`` files
   are available in ``lvgl_yocto_guide/build/tmp/work/ cortexa53-poky-linux/lvgl/9.1.0/build/lib``.

   After this task has been completed, everything is ready to be installed.

Install (do_install)
   .. code-block:: bash

      bitbake lvgl -c install

   The Install task copies files that are to be packaged into the holding area
   **${D}**. This task runs with the current working directory **${S}** which
   is the compilation directory.

   It creates the necessary directory for the header files in the destination
   installation directory.
   It installs the ``lv_conf.h`` header file from the source directory into the
   appropriate include directory in the destination path, ensuring it has the
   correct permissions.

   The lvgl library (``.so`` files) are also ready to be installed in the final
   image. A new folder ``image`` was created.

.. important::

    In the file ``build/conf/local.conf``, add these 2 lines at the end of the
    file:

    .. code-block:: bash

        IMAGE_INSTALL:append = " lvgl"
        TOOLCHAIN_HOST_TASK:append = " lvgl"

    This will add the lvgl library in the generated image, and it will also add
    the library to the host SDK we will generate later on.

    With these modifications, you can now run the image recipe again::

        bitbake core-image-base

    This will execute all the previous described tasks.

    If everything went well, you should now found this file ``build/tmp/deploy/
    rpm/cortexa53/lvgl-9.1.0-r0.cortexa53.rpm`` and other rpm files related to
    lvgl.

.. raw:: html

   </details>
   <br>

当一个配方被编译时，它将运行多个任务。你可以手动运行每个任务以了解每个步骤生成的内容，或者你可以运行 ``bitbake lvgl`` 来运行所有任务。

提取（do_fetch）
   .. code-block:: bash

      bitbake lvgl -c fetch

   提取任务从本地或远程仓库获取包源。

   提取仓库地址必须存储在 **SRC_URI** 变量中。在 **SRCREV** 变量中定义了 github 仓库的提交哈希。

   当提取任务完成后，你可以在 ``build/downloads`` 中找到已获取的源。

   对于这个配方，你将在这里找到一个新文件夹：``lvgl_yocto_guide/build/downloads/git2/github.com.lvgl.lvgl``。

   你也可以在 ``lvgl_yocto_guide/build/tmp/work/cortexa53-poky-linux/lvgl`` 中找到创建的文件夹结构，但这些文件夹是空的，因为只完成了提取。

解包（do_unpack）
   .. code-block:: bash

      bitbake lvgl -c unpack

   解包任务解压了之前提取任务下载的包。

   在 ``lvgl_yocto_guide/build/tmp/work/cortexa53-poky-linux/lvgl/9.1.0`` 文件夹中，现在可以找到在 ``git`` 中的源代码（如配方中定义）。你还会看到下一步将应用的补丁。所以目前为止，源代码未经修改，与指定的提交一致。



打补丁（do_patch）
   .. code-block:: bash

      bitbake lvgl -c patch

   打补丁任务找到补丁文件并应用到源代码上，如果有可用的补丁的话。这是一个可选任务，仅在有补丁时执行。

   补丁文件也在 **SRC_URI** 变量中定义。默认情况下，它在当前源目录 **${S}** 中运行。

配置（do_configure）
   .. code-block:: bash

      bitbake lvgl -c configure

   配置任务在编译前通过启用和禁用任何构建时和配置选项来配置源代码，如果有可用的配置的话。

   这是一个可选步骤，仅在有配置时执行。

   在这种情况下，它创建了一个构建目录，调用 CMake 配置项目，根据配方中的变量指定构建选项和路径。它生成了构建所需的 Makefile 或项目文件。另外，在 ``lv-conf.inc`` 中添加了任务操作。

   因此，在任务结束时，在 ``lvgl_yocto_guide/build/tmp/work/cortexa53-poky-linux/lvgl/9.1.0`` 中，你会发现一个通过运行 CMake 命令生成的 ``build`` 文件夹，但目前还没有构建任何内容。此外，sysroots 包含构建 lvgl 库所需的所有内容。

编译（do_compile）
   .. code-block:: bash

      bitbake lvgl -c compile

   编译任务如果有可用的编译步骤，将编译源代码并生成二进制文件。

   这是一个可选步骤，仅在有编译时执行。

   如果有任何编译步骤，那么这些步骤在 bitbake 的 do_compile() 函数中定义。

   如同前一个任务，这由 ``inherit cmake`` 处理。

   在构建文件夹中，你现在可以看到已构建的库。``.so`` 文件位于 ``lvgl_yocto_guide/build/tmp/work/cortexa53-poky-linux/lvgl/9.1.0/build/lib``。

   完成这个任务后，一切都准备好安装了。

安装（do_install）
   .. code-block:: bash

      bitbake lvgl -c install

   安装任务将要打包的文件复制到保持区域 **${D}**。这个任务在当前工作目录 **${S}** 运行，即编译目录。

   它在目的安装目录创建了存放头文件的必要目录。
   它将源目录中的 ``lv_conf.h`` 头文件安装到目的路径的适当包含目录中，并确保它具有正确的权限。

   lvgl 库（``.so`` 文件）也已准备好在最终映像中安装。一个新的文件夹 ``image`` 被创建了。

.. 重要提示：

    在文件 ``build/conf/local.conf`` 中，添加以下两行到文件末尾：

    .. code-block:: bash

        IMAGE_INSTALL:append = " lvgl"
        TOOLCHAIN_HOST_TASK:append = " lvgl"

    这将在生成的映像中添加 lvgl 库，并且也将库添加到我们稍后将生成的宿主 SDK 中。

    有了这些修改，你现在可以再次运行映像配方：

        bitbake core-image-base

    这将执行所有前面描述的任务。

    如果一切顺利，你现在应该能在这个文件 ``build/tmp/deploy/rpm/cortexa53/lvgl-9.1.0-r0.cortexa53.rpm`` 和其他与 lvgl 相关的 rpm 文件中找到。


SDK generation
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Generating a Software Development Kit (SDK) in Yocto serves several important
purposes, particularly in embedded development:

    - **Development Environment**: The SDK provides developers with a
      ready-to-use development environment tailored for a specific target
      hardware platform.
      This includes the necessary tools, libraries, and headers to build
      applications that run on the target device.
    - **Cross-Compilation**: The SDK allows developers to cross-compile
      applications from a host machine (typically x86 or x86_64 architecture)
      for a different architecture (e.g., ARM). This is essential for embedded
      systems, where development often occurs on more powerful machines.
    - **Simplified Development**: By packaging all required components, the SDK
      simplifies the process of setting up a development environment.
      Developers don't need to manually install and configure tools and
      libraries; everything needed is included in the SDK.
    - **Consistent Build Environment**: The SDK ensures that developers are
      working with the same versions of and tools used in the Yocto
      build, which helps to avoid compatibility issues and ensures that
      applications will behave as expected on the target device.

To generate an SDK of the environment, run the following command:

.. code-block:: bash

    bitbake core-image-base -c populate_sdk

This will create a sript ``build/tmp/deploy/sdk/
poky-glibc-x86_64-core-image-base-cortexa53-raspberrypi3-64-toolchain-5.0.4.
sh``. This script allows you to install the SDK where you prefer. Here is the
execution output of the scrips

.. code-block:: bash

    $ ./sdk/poky-glibc-x86_64-core-image-base-cortexa53-raspberrypi3-64-toolchain-5.0.4.sh
    Poky (Yocto Project Reference Distro) SDK installer version 5.0.4
    =================================================================
    Enter target directory for SDK (default: /opt/poky/5.0.4): /opt/poky/sdk-with-lvgl
    You are about to install the SDK to "/opt/poky/sdk-with-lvgl". Proceed [Y/n]? y

If you want to ensure the SDK was generated with lvgl being installed, go to
the path you extracted the SDK and find all lvgl files:

.. code-block:: bash

    cd /opt/poky/5.0.4/sysroots/cortexa53-poky-linux
    find . -name "*lvgl*"

The ``.so`` files you will find will depend on the LVGL configuration you used.

Now to use the SDK environment and cross-compile an application:

.. code-block:: bash

    source /opt/poke/5.0.4/environment-setup-cortexa53-poky-linux

.. note::

   The tools available in LVGL library will depend on the build configuration
   the recipe was done with.

.. raw:: html

   </details>
   <br>

在 Yocto 中生成软件开发套件（SDK）有几个重要的目的，尤其是在嵌入式开发中：

- **开发环境**：SDK 为开发人员提供了一个针对特定目标硬件平台的即用型开发环境。
  这包括构建在目标设备上运行的应用程序所需的工具、库和头文件。
- **交叉编译**：SDK 允许开发人员从主机（通常是 x86 或 x86_64 架构）为不同的架构（例如，ARM）交叉编译应用程序。这对于嵌入式系统至关重要，因为开发通常在更强大的机器上进行。
- **简化开发**：通过打包所有必需组件，SDK 简化了设置开发环境的过程。
  开发者无需手动安装和配置工具及库；所需的一切都包含在 SDK 中。
- **一致的构建环境**：SDK 确保开发者使用的是 Yocto 构建中使用的相同版本的工具，这有助于避免兼容性问题，并确保应用程序在目标设备上的表现如预期。

要生成环境的 SDK，请运行以下命令：

.. code-block:: bash

    bitbake core-image-base -c populate_sdk

这将创建一个脚本 ``build/tmp/deploy/sdk/poky-glibc-x86_64-core-image-base-cortexa53-raspberrypi3-64-toolchain-5.0.4.sh``。此脚本允许您选择安装 SDK 的位置。这里是脚本的执行输出：

.. code-block:: bash

    $ ./sdk/poky-glibc-x86_64-core-image-base-cortexa53-raspberrypi3-64-toolchain-5.0.4.sh
    Poky (Yocto Project Reference Distro) SDK installer version 5.0.4
    =================================================================
    输入 SDK 的目标目录（默认：/opt/poky/5.0.4）：/opt/poky/sdk-with-lvgl
    您即将将 SDK 安装到“/opt/poky/sdk-with-lvgl”。继续 [Y/n]? y

如果您想确保 SDK 在安装 lvgl 的情况下生成，请转到您提取 SDK 的路径并找到所有 lvgl 文件：

.. code-block:: bash

    cd /opt/poky/5.0.4/sysroots/cortexa53-poky-linux
    find . -name "*lvgl*"

您将找到的 ``.so`` 文件将取决于您使用的 LVGL 配置。

现在要使用 SDK 环境并交叉编译应用程序：

.. code-block:: bash

    source /opt/poke/5.0.4/environment-setup-cortexa53-poky-linux

.. note::

   LVGL 库中可用的工具将取决于配方的构建配置。

Custom recipe
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Until this section, everything was already done for you. We used existing
recipes. The objective here is to create a recipe from scratch and to add the
generated binary in the image.

.. raw:: html

   </details>
   <br>

到这一部分为止，一切都已经为您完成了。我们使用现有的配方。这里的目标是从头开始创建一个配方并添加在图像中生成二进制。

Create a layer
==============

.. raw:: html

   <details>
     <summary>显示原文</summary>

First, create a layer and add it to the configuration file

.. code-block::

   bitbake-layers create-layer ../sources/meta-mylvgl
   bitbake-layers add-layer ../sources/meta-mylvgl

In the ``sources`` folder, a new folder was created: ``meta-mylvgl`` and the
directory tree should look like the following

.. code-block:: none

   ├── conf
   │   └── layer.conf
   ├── COPYING.MIT
   ├── README
   └── recipes-example
       └── example
           └── example_0.1.bb

.. raw:: html

   </details>
   <br>

首先，创建一个层并将其添加到配置文件中

.. code-block:: 

   bitbake-layers create-layer ../sources/meta-mylvgl
   bitbake-layers add-layer ../sources/meta-mylvgl

在 ``sources`` 文件夹中，创建了一个新文件夹：``meta-mylvgl``，目录树应如下所示

.. code-block:: none

   ├── conf
   │   └── layer.conf
   ├── COPYING.MIT
   ├── README
   └── recipes-example
       └── example
           └── example_0.1.bb

Create a recipe
===============

.. raw:: html

   <details>
     <summary>显示原文</summary>

Following this structure, create  a folder containing the recipies to build 1
or multiple applications using lvgl

.. code-block::

   cd ../sources/meta-mylvgl
   mkdir -p recipes-lvglapp/lvgl-fbdev-benchmark/files
   touch recipes-lvglapp/lvgl-fbdev-benchmark/lvglbenchmarkfbdev_2.4.bb

We will focus on 1 application that will clone an lvgl git repository and patch
it for our needs.

The content of ``recipes-lvglapp/lvgl-fbdev-benchmark/lvglbenchmarkfbdev_2.4.
bb``

.. code-block:: none

   DESCRIPTION = "My C++ lvgl app with CMake"

   LICENSE = "MIT"
   LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

   # Update SRC_URI to point to the GitHub repository
   SRC_URI = "gitsm://github.com/lvgl/lv_port_linux.git;branch=master;protocol=https \
              file://0001-change-config-file-to-run-fbdev-with-2-threads.patch \
              file://0002-adapt-CMakeLists-file-to-compile-and-link-fbdev.patch \
             "

   S = "${WORKDIR}/git"

   inherit cmake

   CMAKE_PROJECT_NAME = "lvgl_app"
   CMAKE_PROJECT_VERSION = "2.0"

   do_install() {
       install -d ${D}${bindir}
       install -m 0755 ${S}/bin/lvglbenchmark ${D}${bindir}
   }

The sources come from ``lv_port_linux`` repository. We apply 2 patches to modify the ``CMakeLists.txt`` and ``lv_conf.h``.

.. raw:: html

   </details>
   <br>

遵循此结构，创建一个文件夹，包含使用 lvgl 构建一个或多个应用程序的配方

.. code-block::

   cd ../sources/meta-mylvgl
   mkdir -p recipes-lvglapp/lvgl-fbdev-benchmark/files
   touch recipes-lvglapp/lvgl-fbdev-benchmark/lvglbenchmarkfbdev_2.4.bb

我们将专注于一个应用程序，该应用程序将克隆一个 lvgl 的 git 仓库并为我们的需求打补丁。

``recipes-lvglapp/lvgl-fbdev-benchmark/lvglbenchmarkfbdev_2.4.bb`` 的内容如下：

.. code-block:: none

   DESCRIPTION = "My C++ lvgl app with CMake"

   LICENSE = "MIT"
   LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

   # Update SRC_URI to point to the GitHub repository
   SRC_URI = "gitsm://github.com/lvgl/lv_port_linux.git;branch=master;protocol=https \
              file://0001-change-config-file-to-run-fbdev-with-2-threads.patch \
              file://0002-adapt-CMakeLists-file-to-compile-and-link-fbdev.patch \
             "

   S = "${WORKDIR}/git"

   inherit cmake

   CMAKE_PROJECT_NAME = "lvgl_app"
   CMAKE_PROJECT_VERSION = "2.0"

   do_install() {
       install -d ${D}${bindir}
       install -m 0755 ${S}/bin/lvglbenchmark ${D}${bindir}
   }

资源来自 ``lv_port_linux`` 仓库。我们应用两个补丁来修改 ``CMakeLists.txt`` 和 ``lv_conf.h``。

Patch 1
-------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Create the first patch file

.. code-block::

   touch 0001-change-config-file-to-run-fbdev-with-2-threads.patch

Content of ``0001-change-config-file-to-run-fbdev-with-2-threads.patch``

.. code-block:: none

    From d49d475d57f69d6172a6b38095ebf3b887f0e731 Mon Sep 17 00:00:00 2001
    From: Gabriel Catel Torres <gabriel.catel@edgemtech.ch>
    Date: Tue, 1 Oct 2024 10:28:55 +0200
    Subject: [PATCH] change config file to run fbdev with 2 threads

    ---
    lv_conf.h | 34 +++++++++++++++++-----------------
    1 file changed, 17 insertions(+), 17 deletions(-)

    diff --git a/lv_conf.h b/lv_conf.h
    index 62a834f..58fbe7a 100644
    --- a/lv_conf.h
    +++ b/lv_conf.h
    @@ -39,9 +39,9 @@
      * - LV_STDLIB_RTTHREAD:    RT-Thread implementation
      * - LV_STDLIB_CUSTOM:      Implement the functions externally
      */
    -#define LV_USE_STDLIB_MALLOC    LV_STDLIB_BUILTIN
    -#define LV_USE_STDLIB_STRING    LV_STDLIB_BUILTIN
    -#define LV_USE_STDLIB_SPRINTF   LV_STDLIB_BUILTIN
    +#define LV_USE_STDLIB_MALLOC    LV_STDLIB_CLIB
    +#define LV_USE_STDLIB_STRING    LV_STDLIB_CLIB
    +#define LV_USE_STDLIB_SPRINTF   LV_STDLIB_CLIB

    #define LV_STDINT_INCLUDE       <stdint.h>
    #define LV_STDDEF_INCLUDE       <stddef.h>
    @@ -89,7 +89,7 @@
      * - LV_OS_WINDOWS
      * - LV_OS_MQX
      * - LV_OS_CUSTOM */
    -#define LV_USE_OS   LV_OS_NONE
    +#define LV_USE_OS   LV_OS_PTHREAD

    #if LV_USE_OS == LV_OS_CUSTOM
        #define LV_OS_CUSTOM_INCLUDE <stdint.h>
    @@ -117,12 +117,12 @@
      * and can't be drawn in chunks. */

    /* The target buffer size for simple layer chunks. */
    -#define LV_DRAW_LAYER_SIMPLE_BUF_SIZE    (24 * 1024)   /* [bytes] */
    +#define LV_DRAW_LAYER_SIMPLE_BUF_SIZE    (512 * 1024)   /* [bytes] */

    /* The stack size of the drawing thread.
      * NOTE: If FreeType or ThorVG is enabled, it is recommended to set it to 32KB or more.
      */
    -#define LV_DRAW_THREAD_STACK_SIZE    (8 * 1024)   /* [bytes] */
    +#define LV_DRAW_THREAD_STACK_SIZE    (32 * 1024)   /* [bytes] */

    #define LV_USE_DRAW_SW 1
    #if LV_USE_DRAW_SW == 1
    @@ -147,7 +147,7 @@
      /* Set the number of draw unit.
          * > 1 requires an operating system enabled in `LV_USE_OS`
          * > 1 means multiple threads will render the screen in parallel */
    -    #define LV_DRAW_SW_DRAW_UNIT_CNT    1
    +    #define LV_DRAW_SW_DRAW_UNIT_CNT    2

        /* Use Arm-2D to accelerate the sw render */
        #define LV_USE_DRAW_ARM2D_SYNC      0
    @@ -979,8 +979,8 @@
    #define LV_USE_LINUX_FBDEV      1
    #if LV_USE_LINUX_FBDEV
        #define LV_LINUX_FBDEV_BSD           0
    -    #define LV_LINUX_FBDEV_RENDER_MODE   LV_DISPLAY_RENDER_MODE_PARTIAL
    -    #define LV_LINUX_FBDEV_BUFFER_COUNT  0
    +    #define LV_LINUX_FBDEV_RENDER_MODE   LV_DISPLAY_RENDER_MODE_DIRECT
    +    #define LV_LINUX_FBDEV_BUFFER_COUNT  2
        #define LV_LINUX_FBDEV_BUFFER_SIZE   60
    #endif

    @@ -1069,19 +1069,19 @@
    #define LV_USE_DEMO_WIDGETS 1

    /* Demonstrate the usage of encoder and keyboard */
    -#define LV_USE_DEMO_KEYPAD_AND_ENCODER 1
    +#define LV_USE_DEMO_KEYPAD_AND_ENCODER 0

    /* Benchmark your system */
    #define LV_USE_DEMO_BENCHMARK 1

    /* Render test for each primitives. Requires at least 480x272 display */
    -#define LV_USE_DEMO_RENDER 1
    +#define LV_USE_DEMO_RENDER 0

    /* Stress test for LVGL */
    -#define LV_USE_DEMO_STRESS 1
    +#define LV_USE_DEMO_STRESS 0

    /* Music player demo */
    -#define LV_USE_DEMO_MUSIC 1
    +#define LV_USE_DEMO_MUSIC 0
    #if LV_USE_DEMO_MUSIC
        #define LV_DEMO_MUSIC_SQUARE    0
        #define LV_DEMO_MUSIC_LANDSCAPE 0
    @@ -1091,16 +1091,16 @@
    #endif

    /* Flex layout demo */
    -#define LV_USE_DEMO_FLEX_LAYOUT     1
    +#define LV_USE_DEMO_FLEX_LAYOUT     0

    /* Smart-phone like multi-language demo */
    -#define LV_USE_DEMO_MULTILANG       1
    +#define LV_USE_DEMO_MULTILANG       0

    /* Widget transformation demo */
    -#define LV_USE_DEMO_TRANSFORM       1
    +#define LV_USE_DEMO_TRANSFORM       0

    /* Demonstrate scroll settings */
    -#define LV_USE_DEMO_SCROLL          1
    +#define LV_USE_DEMO_SCROLL          0

    /* Vector graphic demo */
    #define LV_USE_DEMO_VECTOR_GRAPHIC  0
    --
    2.34.1

.. raw:: html

   </details>
   <br>

.. code-block:: none

    From d49d475d57f69d6172a6b38095ebf3b887f0e731 Mon Sep 17 00:00:00 2001
    From: Gabriel Catel Torres <gabriel.catel@edgemtech.ch>
    Date: Tue, 1 Oct 2024 10:28:55 +0200
    Subject: [PATCH] change config file to run fbdev with 2 threads

    ---
    lv_conf.h | 34 +++++++++++++++++-----------------
    1 file changed, 17 insertions(+), 17 deletions(-)

    diff --git a/lv_conf.h b/lv_conf.h
    index 62a834f..58fbe7a 100644
    --- a/lv_conf.h
    +++ b/lv_conf.h
    @@ -39,9 +39,9 @@
      * - LV_STDLIB_RTTHREAD:    RT-Thread implementation
      * - LV_STDLIB_CUSTOM:      Implement the functions externally
      */
    -#define LV_USE_STDLIB_MALLOC    LV_STDLIB_BUILTIN
    -#define LV_USE_STDLIB_STRING    LV_STDLIB_BUILTIN
    -#define LV_USE_STDLIB_SPRINTF   LV_STDLIB_BUILTIN
    +#define LV_USE_STDLIB_MALLOC    LV_STDLIB_CLIB
    +#define LV_USE_STDLIB_STRING    LV_STDLIB_CLIB
    +#define LV_USE_STDLIB_SPRINTF   LV_STDLIB_CLIB

    #define LV_STDINT_INCLUDE       <stdint.h>
    #define LV_STDDEF_INCLUDE       <stddef.h>
    @@ -89,7 +89,7 @@
      * - LV_OS_WINDOWS
      * - LV_OS_MQX
      * - LV_OS_CUSTOM */
    -#define LV_USE_OS   LV_OS_NONE
    +#define LV_USE_OS   LV_OS_PTHREAD

    #if LV_USE_OS == LV_OS_CUSTOM
        #define LV_OS_CUSTOM_INCLUDE <stdint.h>
    @@ -117,12 +117,12 @@
      * and can't be drawn in chunks. */

    /* The target buffer size for simple layer chunks. */
    -#define LV_DRAW_LAYER_SIMPLE_BUF_SIZE    (24 * 1024)   /* [bytes] */
    +#define LV_DRAW_LAYER_SIMPLE_BUF_SIZE    (512 * 1024)   /* [bytes] */

    /* The stack size of the drawing thread.
      * NOTE: If FreeType or ThorVG is enabled, it is recommended to set it to 32KB or more.
      */
    -#define LV_DRAW_THREAD_STACK_SIZE    (8 * 1024)   /* [bytes] */
    +#define LV_DRAW_THREAD_STACK_SIZE    (32 * 1024)   /* [bytes] */

    #define LV_USE_DRAW_SW 1
    #if LV_USE_DRAW_SW == 1
    @@ -147,7 +147,7 @@
      /* Set the number of draw unit.
          * > 1 requires an operating system enabled in `LV_USE_OS`
          * > 1 means multiple threads will render the screen in parallel */
    -    #define LV_DRAW_SW_DRAW_UNIT_CNT    1
    +    #define LV_DRAW_SW_DRAW_UNIT_CNT    2

        /* Use Arm-2D to accelerate the sw render */
        #define LV_USE_DRAW_ARM2D_SYNC      0
    @@ -979,8 +979,8 @@
    #define LV_USE_LINUX_FBDEV      1
    #if LV_USE_LINUX_FBDEV
        #define LV_LINUX_FBDEV_BSD           0
    -    #define LV_LINUX_FBDEV_RENDER_MODE   LV_DISPLAY_RENDER_MODE_PARTIAL
    -    #define LV_LINUX_FBDEV_BUFFER_COUNT  0
    +    #define LV_LINUX_FBDEV_RENDER_MODE   LV_DISPLAY_RENDER_MODE_DIRECT
    +    #define LV_LINUX_FBDEV_BUFFER_COUNT  2
        #define LV_LINUX_FBDEV_BUFFER_SIZE   60
    #endif

    @@ -1069,19 +1069,19 @@
    #define LV_USE_DEMO_WIDGETS 1

    /* Demonstrate the usage of encoder and keyboard */
    -#define LV_USE_DEMO_KEYPAD_AND_ENCODER 1
    +#define LV_USE_DEMO_KEYPAD_AND_ENCODER 0

    /* Benchmark your system */
    #define LV_USE_DEMO_BENCHMARK 1

    /* Render test for each primitives. Requires at least 480x272 display */
    -#define LV_USE_DEMO_RENDER 1
    +#define LV_USE_DEMO_RENDER 0

    /* Stress test for LVGL */
    -#define LV_USE_DEMO_STRESS 1
    +#define LV_USE_DEMO_STRESS 0

    /* Music player demo */
    -#define LV_USE_DEMO_MUSIC 1
    +#define LV_USE_DEMO_MUSIC 0
    #if LV_USE_DEMO_MUSIC
        #define LV_DEMO_MUSIC_SQUARE    0
        #define LV_DEMO_MUSIC_LANDSCAPE 0
    @@ -1091,16 +1091,16 @@
    #endif

    /* Flex layout demo */
    -#define LV_USE_DEMO_FLEX_LAYOUT     1
    +#define LV_USE_DEMO_FLEX_LAYOUT     0

    /* Smart-phone like multi-language demo */
    -#define LV_USE_DEMO_MULTILANG       1
    +#define LV_USE_DEMO_MULTILANG       0

    /* Widget transformation demo */
    -#define LV_USE_DEMO_TRANSFORM       1
    +#define LV_USE_DEMO_TRANSFORM       0

    /* Demonstrate scroll settings */
    -#define LV_USE_DEMO_SCROLL          1
    +#define LV_USE_DEMO_SCROLL          0

    /* Vector graphic demo */
    #define LV_USE_DEMO_VECTOR_GRAPHIC  0
    --
    2.34.1

Patch 2
-------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Create the first patch file

.. code-block::

   touch 0002-adapt-CMakeLists-file-to-compile-and-link-fbdev.patch

Content of ``0002-adapt-CMakeLists-file-to-compile-and-link-fbdev.patch``

.. code-block:: none

    From ad464e0683aced74085fb89895b8d040ecad0206 Mon Sep 17 00:00:00 2001
    From: Gabriel Catel Torres <gabriel.catel@edgemtech.ch>
    Date: Tue, 1 Oct 2024 10:31:29 +0200
    Subject: [PATCH] adapt CMakeLists file to compile and link only for fbdev

    ---
    CMakeLists.txt | 17 +++++------------
    1 file changed, 5 insertions(+), 12 deletions(-)

    diff --git a/CMakeLists.txt b/CMakeLists.txt
    index 658193f..ad56cc2 100644
    --- a/CMakeLists.txt
    +++ b/CMakeLists.txt
    @@ -1,8 +1,8 @@
    cmake_minimum_required(VERSION 3.10)
    project(lvgl)

    -set(CMAKE_C_STANDARD 99)#C99 # lvgl officially support C99 and above
    -set(CMAKE_CXX_STANDARD 17)#C17
    +set(CMAKE_C_STANDARD 99)
    +set(CMAKE_CXX_STANDARD 17)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)

    set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
    @@ -10,15 +10,8 @@ set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
    add_subdirectory(lvgl)
    target_include_directories(lvgl PUBLIC ${PROJECT_SOURCE_DIR})

    -add_executable(main main.c mouse_cursor_icon.c)
    +add_executable(lvglbenchmark main.c mouse_cursor_icon.c)

    -include(${CMAKE_CURRENT_LIST_DIR}/lvgl/tests/FindLibDRM.cmake)
    -include_directories(${Libdrm_INCLUDE_DIRS})
    -
    -find_package(SDL2)
    -find_package(SDL2_image)
    -include_directories(${SDL2_INCLUDE_DIRS} ${SDL2_IMAGE_INCLUDE_DIRS})
    -
    -target_link_libraries(main lvgl lvgl::examples lvgl::demos lvgl::thorvg ${SDL2_LIBRARIES} ${SDL2_IMAGE_LIBRARIES} ${Libdrm_LIBRARIES} m pthread)
    -add_custom_target (run COMMAND ${EXECUTABLE_OUTPUT_PATH}/main DEPENDS main)
    +target_link_libraries(lvglbenchmark lvgl lvgl::examples lvgl::demos lvgl::thorvg m pthread)
    +add_custom_target (run COMMAND ${EXECUTABLE_OUTPUT_PATH}/lvglbenchmark DEPENDS main)

    --
    2.34.1

.. raw:: html

   </details>
   <br>

创建第二个补丁文件：

.. code-block::

touch 0002-adapt-CMakeLists-file-to-compile-and-link-fbdev.patch

Content of ``0002-adapt-CMakeLists-file-to-compile-and-link-fbdev.patch``

.. code-block:: none

    From ad464e0683aced74085fb89895b8d040ecad0206 Mon Sep 17 00:00:00 2001
    From: Gabriel Catel Torres <gabriel.catel@edgemtech.ch>
    Date: Tue, 1 Oct 2024 10:31:29 +0200
    Subject: [PATCH] adapt CMakeLists file to compile and link only for fbdev

    ---
    CMakeLists.txt | 17 +++++------------
    1 file changed, 5 insertions(+), 12 deletions(-)

    diff --git a/CMakeLists.txt b/CMakeLists.txt
    index 658193f..ad56cc2 100644
    --- a/CMakeLists.txt
    +++ b/CMakeLists.txt
    @@ -1,8 +1,8 @@
    cmake_minimum_required(VERSION 3.10)
    project(lvgl)

    -set(CMAKE_C_STANDARD 99)#C99 # lvgl officially support C99 and above
    -set(CMAKE_CXX_STANDARD 17)#C17
    +set(CMAKE_C_STANDARD 99)
    +set(CMAKE_CXX_STANDARD 17)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)

    set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
    @@ -10,15 +10,8 @@ set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
    add_subdirectory(lvgl)
    target_include_directories(lvgl PUBLIC ${PROJECT_SOURCE_DIR})

    -add_executable(main main.c mouse_cursor_icon.c)
    +add_executable(lvglbenchmark main.c mouse_cursor_icon.c)

    -include(${CMAKE_CURRENT_LIST_DIR}/lvgl/tests/FindLibDRM.cmake)
    -include_directories(${Libdrm_INCLUDE_DIRS})
    -
    -find_package(SDL2)
    -find_package(SDL2_image)
    -include_directories(${SDL2_INCLUDE_DIRS} ${SDL2_IMAGE_INCLUDE_DIRS})
    -
    -target_link_libraries(main lvgl lvgl::examples lvgl::demos lvgl::thorvg ${SDL2_LIBRARIES} ${SDL2_IMAGE_LIBRARIES} ${Libdrm_LIBRARIES} m pthread)
    -add_custom_target (run COMMAND ${EXECUTABLE_OUTPUT_PATH}/main DEPENDS main)
    +target_link_libraries(lvglbenchmark lvgl lvgl::examples lvgl::demos lvgl::thorvg m pthread)
    +add_custom_target (run COMMAND ${EXECUTABLE_OUTPUT_PATH}/lvglbenchmark DEPENDS main)

    --
    2.34.1

Build the recipe
================

You should now be able to see the recipe listing the existing recipes

.. code-block::

   bitbake-layers show-recipes | grep lvglbenchmarkfbdev

Now add the recipe to the project. Modify ``build/conf/local.conf`` file adding
this line

.. code-block::

   IMAGE_INSTALL:append = " lvglbenchmarkfbdev"

Now build the image

.. code-block::

   bitbake core-image-base

Run this command to ensure the binary was generated and was installed in the
rootfs

.. code-block::

    # Run this command in build/tmp folder
    find . -wholename "*bin/lvglbench*"
