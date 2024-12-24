.. _yocto_project_core_components:

=================================================
Yocto Project Core Components（Yocto 项目核心组件）
=================================================

.. raw:: html

   <details>
     <summary>显示原文</summary>

The BitBake task executor together with various types of configuration files
form the OpenEmbedded-Core (OE-Core). This section overviews these components
by describing their use and how they interact.

BitBake handles the parsing and execution of the data files. The data
itself is of various types:

-  *Recipes:* Provides details about particular pieces of software.

-  *Class Data:* Abstracts common build information (e.g. how to build a
   Linux kernel).

-  *Configuration Data:* Defines machine-specific settings, policy
   decisions, and so forth. Configuration data acts as the glue to bind
   everything together.

BitBake knows how to combine multiple data sources together and refers
to each data source as a layer.

Here are some brief details on these core components.

.. raw:: html

   </details>
   <br>
  
BitBake 任务执行器与各种类型的配置文件共同构成 OpenEmbedded-Core (OE-Core)。本节概述这些组件，描述它们的用途及交互方式。  

BitBake 处理数据文件的解析和执行。数据本身包含以下几种类型：  

- *Recipes:* 提供特定软件的详细信息。  

- *Class Data:* 抽象常见的构建信息（例如，如何构建 Linux 内核）。  

- *Configuration Data:* 定义特定机器的设置、策略决策等。配置数据作为粘合剂，将所有内容整合在一起。  

BitBake 知道如何组合多个数据源，并将每个数据源称为层（layer）。  

以下是关于这些核心组件的一些简要说明。

.. _bitbake_section:

BitBake
*******

.. raw:: html

   <details>
     <summary>显示原文</summary>

BitBake is the tool at the heart of the OpenEmbedded Build System and is
responsible for parsing the Metadata, generating a list of tasks from it, and
then executing those tasks.

This section briefly introduces BitBake. If you want more information on
BitBake, see the `BitBake User Manual <https://docs.yoctoproject.org/bitbake/2.
8/index.html>`_.

To see a list of the options BitBake supports, use either of the
following commands::

   $ bitbake -h
   $ bitbake --help

The most common usage for BitBake is ``bitbake recipename``, where
``recipename`` is the name of the recipe you want to build (referred
to as the "target"). The target often equates to the first part of a
recipe's filename (e.g. "foo" for a recipe named ``foo_1.3.0-r0.bb``).
So, to process the ``matchbox-desktop_1.2.3.bb`` recipe file, you might
type the following::

   $ bitbake matchbox-desktop

Several different versions of ``matchbox-desktop`` might exist. BitBake chooses
the one selected by the distribution configuration. You can get more details
about how BitBake chooses between different target versions and providers in the
"`Preferences <https://docs.yoctoproject.org/bitbake/2.8/bitbake-user-manual/
bitbake-user-manual-execution.html#preferences>`_" section of the BitBake User
Manual.

BitBake also tries to execute any dependent tasks first. So for example,
before building ``matchbox-desktop``, BitBake would build a cross
compiler and ``glibc`` if they had not already been built.

A useful BitBake option to consider is the ``-k`` or ``--continue``
option. This option instructs BitBake to try and continue processing the
job as long as possible even after encountering an error. When an error
occurs, the target that failed and those that depend on it cannot be
remade. However, when you use this option other dependencies can still
be processed.

.. raw:: html

   </details>
   <br>

BitBake 是 OpenEmbedded 构建系统的核心工具，负责解析 Metadata，生成任务列表并执行这些任务。

本节简要介绍 BitBake。如果需要更多关于 BitBake 的信息，请参阅 `BitBake User Manual <https://docs.yoctoproject.org/bitbake/2.8/index.html>`_。

要查看 BitBake 支持的选项列表，可以使用以下任一命令::

   $ bitbake -h
   $ bitbake --help

BitBake 最常见的用法是 ``bitbake recipename``，其中 ``recipename`` 是您想要构建的配方名称（称为“目标”）。目标通常与配方文件名的第一部分对应（例如，对于名为 ``foo_1.3.0-r0.bb`` 的配方，目标为 "foo"）。因此，要处理 ``matchbox-desktop_1.2.3.bb`` 配方文件，可以输入以下命令::

   $ bitbake matchbox-desktop

可能存在多个不同版本的 ``matchbox-desktop``。BitBake 会选择由分发配置指定的版本。关于 BitBake 如何在不同目标版本和提供者之间进行选择的更多细节，可以参考 BitBake 用户手册中的 "`Preferences <https://docs.yoctoproject.org/bitbake/2.8/bitbake-user-manual/bitbake-user-manual-execution.html#preferences>`_" 部分。

BitBake 还会尝试优先执行所有依赖任务。例如，在构建 ``matchbox-desktop`` 之前，如果尚未构建交叉编译器和 ``glibc``，BitBake 会先构建它们。

一个有用的 BitBake 选项是 ``-k`` 或 ``--continue`` 选项。此选项指示 BitBake 在遇到错误时尽量继续处理任务。当发生错误时，失败的目标及其依赖项无法重新构建。但是，使用此选项时，其他依赖项仍可以被处理。

.. _recipes_section:

Recipes
*******

.. raw:: html

   <details>
     <summary>显示原文</summary>

Files that have the ``.bb`` suffix are "recipes" files. In general, a
recipe contains information about a single piece of software. This
information includes the location from which to download the unaltered
source, any source patches to be applied to that source (if needed),
which special configuration options to apply, how to compile the source
files, and how to package the compiled output.

The term "package" is sometimes used to refer to recipes. However, since
the word "package" is used for the packaged output from the OpenEmbedded
build system (i.e. ``.ipk`` or ``.deb`` files), this document avoids
using the term "package" when referring to recipes.

.. raw:: html

   </details>
   <br>

具有 ``.bb`` 后缀的文件是“recipes（配方）”文件。通常，配方包含关于某个单独软件的信息。这些信息包括下载未修改源代码的位置、需要应用于该源代码的补丁（如果需要）、要应用的特殊配置选项、如何编译源文件，以及如何打包编译后的输出。

术语“package（包）”有时用于指代配方。然而，由于“package”一词用于指 OpenEmbedded 构建系统生成的打包输出（例如 ``.ipk`` 或 ``.deb`` 文件），本文档在提到配方时避免使用“package”这个术语。

.. _classes_section:

Classes
*******

.. raw:: html

   <details>
     <summary>显示原文</summary>

Class files (``.bbclass``) contain information that is useful to share
between recipes files. An example is the autotools* class,
which contains common settings for any application that is built with
the `GNU Autotools <https://en.wikipedia.org/wiki/GNU_Autotools>`.
The "`Classes <https://docs.yoctoproject.org/ref-manual/classes.
html#classes>`_" chapter in the Yocto Project
Reference Manual provides details about classes and how to use them.

.. raw:: html

   </details>
   <br>

类文件(``.bbclass``)包含可在多个 recipes（配方）文件之间共享的信息。例如，autotools* 类包含使用 `GNU Autotools <https://en.wikipedia.org/wiki/GNU_Autotools>` 构建的应用程序的通用设置。Yocto Project 参考手册中的“ `Classes <https://docs.yoctoproject.org/ref-manual/classes.html#classes>`_”章节提供了有关类及其使用方法的详细信息。

Configurations
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The configuration files (``.conf``) define various configuration
variables that govern the OpenEmbedded build process. These files fall
into several areas that define machine configuration options,
distribution configuration options, compiler tuning options, general
common configuration options, and user configuration options in
``conf/local.conf``, which is found in the `Build Directory <https://docs.
yoctoproject.org/ref-manual/terms.html#term-Build-Directory>`_.

.. raw:: html

   </details>
   <br>

配置文件 (``.conf``) 定义了管理 OpenEmbedded 构建过程的各种配置变量。
这些文件分为几个区域，包括定义机器配置选项、发行版配置选项、编译器调优选项、通用公共配置选项，以及位于 ``conf/local.conf`` 的用户配置选项，后者位于 `Build Directory <https://docs.yoctoproject.org/ref-manual/terms.html#term-Build-Directory>`_。

.. _layers_section:

Layers
******

.. raw:: html

   <details>
     <summary>显示原文</summary>

Layers are repositories that contain related metadata (i.e. sets of
instructions) that tell the OpenEmbedded build system how to build a
target. `The yocto project layer model <https://docs.yoctoproject.org/
overview-manual/yp-intro.html#the-yocto-project-layer-model>`_
facilitates collaboration, sharing, customization, and reuse within the
Yocto Project development environment. Layers logically separate
information for your project. For example, you can use a layer to hold
all the configurations for a particular piece of hardware. Isolating
hardware-specific configurations allows you to share other metadata by
using a different layer where that metadata might be common across
several pieces of hardware.

There are many layers working in the Yocto Project development environment. The
`Yocto Project Compatible Layer Index <https://www.yoctoproject.org/development/
yocto-project-compatible-layers/>`_ and `OpenEmbedded Layer Index <https://
layers.openembedded.org/layerindex/branch/master/layers/>`_ both contain layers
from
which you can use or leverage.

By convention, layers in the Yocto Project follow a specific form. Conforming
to a known structure allows BitBake to make assumptions during builds on where
to find types of metadata. You can find procedures and learn about tools (i.e.
``bitbake-layers``) for creating layers suitable for the Yocto Project in the
"`understanding and creating layers <https://docs.yoctoproject.org/dev-manual/
layers.html#understanding-and-creating-layers>`_" section of the
Yocto Project Development Tasks Manual.

.. raw:: html

   </details>
   <br>

Layers 是包含相关元数据（即一组指令）的代码库，这些元数据告诉 OpenEmbedded 构建系统如何构建目标。 `The yocto project layer model <https://docs.yoctoproject.org/overview-manual/yp-intro.html#the-yocto-project-layer-model>`_ 促进了在 Yocto Project 开发环境中的协作、共享、定制和复用。Layers 在逻辑上分隔了项目的信息。例如，您可以使用一个 layer 来存储特定硬件的所有配置。隔离硬件特定配置可以通过使用其他 layer 来共享元数据，这些元数据可能适用于多个硬件。

在 Yocto Project 开发环境中，有许多 layers 在运行。 `Yocto Project Compatible Layer Index <https://www.yoctoproject.org/development/yocto-project-compatible-layers/>`_ 和 `OpenEmbedded Layer Index <https://layers.openembedded.org/layerindex/branch/master/layers/>`_ 都包含可以使用或借鉴的 layers。

按照约定，Yocto Project 中的 layers 遵循特定的格式。遵循已知的结构使得 BitBake 在构建过程中可以假定元数据的类型所在的位置。您可以在 Yocto Project Development Tasks Manual 的 "`understanding and creating layers <https://docs.yoctoproject.org/dev-manual/layers.html#understanding-and-creating-layers>`_" 章节中找到创建适用于 Yocto Project 的 layers 的操作步骤以及了解相关工具（如 ``bitbake-layers``）。

