```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/get-started/espressif.md
```

# Espressif (ESP32)
<details>
<summary>查看原文</summary>
<p>

Since v7.7.1 LVGL includes a Kconfig file, so LVGL can be used as an ESP-IDF v4 component.

</p>
</details>

由于 v7.7.1 LVGL 包含一个 Kconfig 文件，因此 LVGL 可以用作 ESP-IDF v4 组件。

## Get the LVGL demo project for ESP32（获取 ESP32 的 LVGL 演示项目）

<details>
<summary>查看原文</summary>
<p>

We've created [lv_port_esp32](https://github.com/lvgl/lv_port_esp32), a project using ESP-IDF and LVGL to show one of the demos from [lv_examples](https://github.com/lvgl/lv_examples).
You are able to configure the project to use one of the many supported display controllers, see [lvgl_esp32_drivers](https://github.com/lvgl/lvgl_esp32_drivers) for a complete list
of supported display and indev (touch) controllers.

</p>
</details>

我们创建了 [lv_port_esp32](https://github.com/lvgl/lv_port_esp32) 项目示例，这是一个使用 ESP-IDF 和 LVGL 的项目，这是从 [lv_examples](https://github.com/lvgl/lv_examples) 中移植的一个演示。您可以将项目配置为使用众多支持的显示控制器之一，请参阅 [lvgl_esp32_drivers](https://github.com/lvgl/lvgl_esp32_drivers) 以获取支持的显示和 indev（触摸）控制器的完整列表。

## Use LVGL in your ESP32 project（在 ESP32 项目中使用 LVGL）
### Prerequisites（前提）

<details>
<summary>查看原文</summary>
<p>

ESP-IDF v4 framework is the suggested version to use.

</p>
</details>

建议在 ESP-IDF v4 框架上使用 LVGL。

### Get LVGL（获取LVGL）

<details>
<summary>查看原文</summary>
<p>

You are suggested to add LVGL as a "component". This component can be located inside a directory named "components" on your project root directory.

When your project is a git repository you can include LVGL as a git submodule:

</p>
</details>

建议您将 LVGL 添加为“组件”。该组件可以位于项目根目录下名为“components”的目录中。

当您的项目是 git 存储库时，您可以将 LVGL 作为 git 子模块包含在内：

```c
git submodule add https://github.com/lvgl/lvgl.git components/lvgl
```

<details>
<summary>查看原文</summary>
<p>

The above command will clone LVGL's main repository into the `components/lvgl` directory. LVGL includes a `CMakeLists.txt` file that sets some configuration options so you can use LVGL right away.

When you are ready to configure LVGL launch the configuration menu with `idf.py menuconfig` on your project root directory, go to `Component config` and then `LVGL configuration`.

</p>
</details>

上面的命令会将 LVGL 的主存储库克隆到 `components/lvgl` 目录中。 LVGL 包含一个 `CMakeLists.txt` 文件，该文件设置了一些配置选项，因此您可以立即使用 LVGL。

当您准备好配置 LVGL 时，在项目根目录中使用 `idf.py menuconfig` 启动配置菜单，转到 `Component config`，然后转到 `LVGL configuration`。


## Use lvgl_esp32_drivers in your project（在您的项目中使用 lvgl_esp32_drivers）

<details>
<summary>查看原文</summary>
<p>

You are suggested to add `lvgl_esp32_drivers` as a "component". This component can be located inside a directory named "components" on your project root directory.

When your project is a git repository you can include `lvgl_esp32_drivers` as a git submodule:

</p>
</details>

建议您添加 `lvgl_esp32_drivers` 作为“组件”。该组件可以位于项目根目录下名为“components”的目录中。
当您的项目是 git 存储库时，您可以将 `lvgl_esp32_drivers` 作为 git 子模块包含在内：

```c
git submodule add https://github.com/lvgl/lvgl_esp32_drivers.git components/lvgl_esp32_drivers
```

### Support for ESP32-S2（支持 ESP32-S2）

<details>
<summary>查看原文</summary>
<p>

Basic support for ESP32-S2 has been added into the `lvgl_esp32_drivers` repository.

</p>
</details>

对 ESP32-S2 的基本支持已添加到 `lvgl_esp32_drivers` 存储库中。