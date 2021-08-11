```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/CONTRIBUTING.md
```

# Contributing（贡献）

## Introduction（介绍）

<details>
<summary>查看原文</summary>
<p>

Join LVGL's community and leave your footprint in the library!

There are a lot of ways to contribute to LVGL even if you are are new to the library or even new to programming. 

It might be scary to make the first step but you have nothing to be afraid of. 
A friendly and helpful community is waiting for you. Get to know like-minded people and make something great together.

So let's find which contribution option fits you the best and help you join the development of LVGL!

Before getting started here are some guidelines to make contribution smoother:
- Be kind and friendly. 
- Be sure to read the relevant part of the documentation before posting a question.
- Ask questions in the [Forum](https://forum.lvgl.io/) and use [GitHub](https://github.com/lvgl/) for development-related discussions.
- Always fill out the post or issue templates in the Forum or GitHub (or at least provide equivalent information). It makes understanding your contribution or issue easier and you will get a useful response faster.
- If possible send an absolute minimal but buildable code example in order to reproduce the issue. Be sure it contains all the required variable declarations, constants, and assets (images, fonts).
- Use [Markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) to format your posts. You can learn it in 10 minutes.
- Speak about one thing in one issue or topic. It makes your post easier to find later for someone with the same question.
- Give feedback and close the issue or mark the topic as solved if your question is answered. 
- For non-trivial fixes and features, it's better to open an issue first to discuss the details instead of sending a pull request directly.
- Please read and follow the <a href="https://github.com/lvgl/lvgl/blob/master/docs/CODING_STYLE.md">Coding style</a> guide.

</p>
</details>

加入 LVGL 的社区，在图书馆留下你的足迹！

有很多方法可以为 LVGL 做出贡献，即使您是库的新手，甚至是编程的新手。

迈出第一步可能会很可怕，但你没有什么可害怕的。
一个友好而乐于助人的社区正等着您。结识志同道合的人，共同创造美好。

那么让我们来找出最适合您的贡献选项，并帮助您加入 LVGL 的开发！

在开始之前，这里有一些指导方针可以使贡献更顺畅：
- 善良和友好。
- 在发布问题之前，请务必阅读文档的相关部分。
- 在[论坛](https://forum.lvgl.io/) 提出问题，并使用[GitHub](https://github.com/lvgl/) 进行与开发相关的讨论。
- 始终填写论坛或 GitHub 中的帖子或问题模板（或至少提供等效信息）。它使您更容易理解您的贡献或问题，并且您将更快地获得有用的响应。
- 如果可能，发送一个绝对最小但可构建的代码示例以重现问题。确保它包含所有必需的变量声明、常量和资产（图像、字体）。
- 使用 [Markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) 来格式化您的帖子。你可以在 10 分钟内学会它。
- 在一个问题或主题中谈论一件事。以后有相同问题的人可以更轻松地找到您的帖子。
- 如果您的问题得到解答，请提供反馈并关闭问题或将主题标记为已解决。
- 对于重要的修复和功能，最好先打开一个问题来讨论细节，而不是直接发送拉取请求。
- 请阅读并遵循<a href="https://github.com/lvgl/lvgl/blob/master/docs/CODING_STYLE.md">编码风格</a>指南。

## Pull request（拉取请求）

<details>
<summary>查看原文</summary>
<p>

Merging new code into the lvgl, documentation, blog, examples, and other repositories happen via *Pull requests* (PR for short).
A PR is a notification like "Hey, I made some updates to your project. Here are the changes, you can add them if you want."
To do this you need a copy (called fork) of the original project under your account, make some changes there, and notify the original repository about your updates. 
You can see what it looks like on GitHub for LVGL here: [https://github.com/lvgl/lvgl/pulls](https://github.com/lvgl/lvgl/pulls).

To add your changes you can edit files online on GitHub and send a new Pull request from there (recommended for small changes) or
 add the updates in your favorite editor/IDE and use git to publish the changes (recommended for more complex updates).

</p>
</details>

将新代码合并到 lvgl、文档、博客、示例和其他存储库中是通过 *Pull 请求 *（简称 PR）进行的。
PR 是类似于“嘿，我对您的项目进行了一些更新。这是更改，如果需要，您可以添加它们”的通知。
为此，您需要您帐户下的原始项目的副本（称为 fork），在那里进行一些更改，并将您的更新通知原始存储库。
您可以在 GitHub 上查看 LVGL 的样子：[https://github.com/lvgl/lvgl/pulls](https://github.com/lvgl/lvgl/pulls)。

要添加您的更改，您可以在 GitHub 上在线编辑文件并从那里发送新的拉取请求（建议进行小改动）或
  在您喜欢的编辑器/IDE 中添加更新并使用 git 发布更改（推荐用于更复杂的更新）。

### From GitHub（来自GitHub）

<details>
<summary>查看原文</summary>
<p>

1. Navigate to the file you want to edit.
2. Click the Edit button in the top right-hand corner.
3. Add your changes to the file.
4. Add a commit message on the bottom of the page.
5. Click the *Propose changes* button.

</p>
</details>

1. 导航到要编辑的文件。
2. 单击右上角的编辑按钮。
3. 将您的更改添加到文件中。
4. 在页面底部添加提交信息。
5. 单击*提议更改* 按钮。

### From command line（从命令行获取）

<details>
<summary>查看原文</summary>
<p>

The instructions describe the main `lvgl` repository but it works the same way for the other repositories.
1. Fork the [lvgl repository](https://github.com/lvgl/lvgl). To do this click the "Fork" button in the top right corner. 
It will "copy" the `lvgl` repository to your GitHub account (`https://github.com/<YOUR_NAME>?tab=repositories`)
2. Clone your forked repository.
3. Add your changes. You can create a *feature branch* from *master* for the updates: `git checkout -b the-new-feature` 
4. Commit and push your changes to the forked `lvgl` repository.
5. Create a PR on GitHub from the page of your `lvgl` repository (`https://github.com/<YOUR_NAME>/lvgl`) by clicking the *"New pull request"* button. Don't forget to select the branch where you added your changes.
7. Set the base branch. It means where you want to merge your update. In the `lvgl` repo fixes go to `master`, new features to `dev` branch. 
8. Describe what is in the update. An example code is welcome if applicable.
9. If you need to make more changes, just update your forked `lvgl` repo with new commits. They will automatically appear in the PR.

</p>
</details>

这些说明描述了主要的 `lvgl` 存储库，但它的工作方式与其他存储库相同。
1. fork [lvgl 仓库](https://github.com/lvgl/lvgl)。为此，请单击右上角的“叉”按钮。
它会将 `lvgl` 存储库“复制”到您的 GitHub 帐户（`https://github.com/<YOUR_NAME>?tab=repositories`）
2. 克隆您的分叉存储库。
3. 添加您的更改。您可以从 *master* 创建一个 *feature 分支* 用于更新：`git checkout -b the-new-feature`
4. 提交并将您的更改推送到分叉的 `lvgl` 存储库。
5. 在你的 `lvgl` 存储库页面 (`https://github.com/<YOUR_NAME>/lvgl`) 上点击 *"New pull request"* 按钮，在 GitHub 上创建 PR。不要忘记选择添加更改的分支。
7. 设置基础分支。这意味着您要合并更新的位置。在 `lvgl` 存储库中，修复转到 `master`，`dev` 分支的新功能。
8. 描述更新内容。如果适用，欢迎提供示例代码。
9. 如果您需要进行更多更改，只需使用新提交更新您的分叉 `lvgl` 存储库。它们将自动出现在 PR 中。

### Commit message format（commit的格式）

<details>
<summary>查看原文</summary>
<p>

In commit messages please follow the [Angular Commit Format](https://gist.github.com/brianclements/841ea7bffdb01346392c).

Some examples:

</p>
</details>

在提交消息中，请遵循 [Angular Commit Format](https://gist.github.com/brianclements/841ea7bffdb01346392c)。

一些例子：

```
fix(img) update size if a new source is set
```

```
fix(bar) fix memory leak

The animations weren't deleted in the destructor.

Fixes: #1234
```

```
feat add span widget

The span widget allows mixing different font sizes, colors and styles.
It's similar to HTML <span>
```

```
docs(porting) fix typo
```

## Developer Certification of Origin (DCO)（开发者原产地认证 (DCO)）

### Overview（概述）

<details>
<summary>查看原文</summary>
<p>

To ensure all licensing criteria are met for every repository of the LVGL project, we apply a process called DCO (Developer's Certificate of Origin).

The text of DCO can be read here: [https://developercertificate.org/](https://developercertificate.org/).

By contributing to any repositories of the LVGL project you agree that your contribution complies with the DCO.

If your contribution fulfills the requirements of the DCO no further action is needed. If you are unsure feel free to ask us in a comment.

</p>
</details>

为确保 LVGL 项目的每个存储库都满足所有许可标准，我们应用了一个称为 DCO（开发者原产地证书）的流程。

DCO 的文本可以在这里阅读：[https://developercertificate.org/](https://developercertificate.org/)。

通过为 LVGL 项目的任何存储库做出贡献，您同意您的贡献符合 DCO。

如果您的捐款符合 DCO 的要求，则无需采取进一步行动。 如果您不确定，请随时在评论中询问我们。

### Accepted licenses and copyright notices（接受的许可和版权声明）

<details>
<summary>查看原文</summary>
<p>

To make the DCO easier to digest, here are some practical guides about specific cases:

</p>
</details>

为了让 DCO 更容易消化，这里有一些关于特定案例的实用指南：

#### Your own work（你自己的作品）

<details>
<summary>查看原文</summary>
<p>

The simplest case is when the contribution is solely your own work. 
In this case you can just send a Pull Request without worrying about any licensing issues.

</p>
</details>

最简单的情况是贡献完全是您自己的工作。
在这种情况下，您可以只发送拉取请求而不必担心任何许可问题。

#### Use code from online source（使用来自网上的代码）

<details>
<summary>查看原文</summary>
<p>

If the code you would like to add is based on an article, post or comment on a website (e.g. StackOverflow) the license and/or rules of that site should be followed.

For example in case of StackOwerflow a notice like this can be used:

</p>
</details>

如果您要添加的代码基于网站（例如 StackOverflow）上的文章、帖子或评论，则应遵循该网站的许可和/或规则。

例如，在 StackOwerflow 的情况下，可以使用这样的通知：

```
/* The original version of this code-snippet was published on StackOverflow.
 * Post: http://stackoverflow.com/questions/12345
 * Author: http://stackoverflow.com/users/12345/username
 * The following parts of the snippet were changed:
 * - Check this or that
 * - Optimize performance here and there
 */
 ... code snippet here ...
```

#### Use MIT licensed code（使用 MIT 许可代码）

<details>
<summary>查看原文</summary>
<p>

As LVGL is MIT licensed, other MIT licensed code can be integrated without issues.
The MIT license requires a copyright notice be added to the derived work. Any derivative work based on MIT licensed code must copy the original work's license file or text.

</p>
</details>

由于 LVGL 是 MIT 许可的，因此可以毫无问题地集成其他 MIT 许可代码。
MIT 许可证要求在衍生作品中添加版权声明。 任何基于 MIT 许可代码的衍生作品必须复制原始作品的许可文件或文本。

#### Use GPL licensed code（使用 GPL 许可代码）

<details>
<summary>查看原文</summary>
<p>

The GPL license is not compatible with the MIT license. Therefore, LVGL can not accept GPL licensed code. 
 
</p>
</details>

GPL 许可证与 MIT 许可证不兼容。因此，LVGL 不能接受 GPL 许可代码。

## Ways to contribute（贡献方式）

<details>
<summary>查看原文</summary>
<p>

Even if you're just getting started with LVGL there are plenty of ways to get your feet wet. 
Most of these options don't even require knowing a single line of LVGL code. 

Below we have collected some opportunities about the ways you can contribute to LVGL.  

</p>
</details>

即使您刚刚开始使用 LVGL，也有很多方法可以让您的脚变湿。
大多数这些选项甚至不需要知道一行 LVGL 代码。

下面我们收集了一些关于您可以为 LVGL 做出贡献的方式的机会。

### Give LVGL a Star（给 LVGL 一颗星）

<details>
<summary>查看原文</summary>
<p>

Show that you like LVGL by giving it star on GitHub!
<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Place this tag where you want the button to render. -->
<a class="github-button" href="https://github.com/lvgl/lvgl" data-icon="octicon-star" data-size="large" data-show-count="true" aria-label="Star lvgl/lvgl on GitHub">Star</a>

This simple click makes LVGL more visible on GitHub and makes it more attractive to other people. 
So with this, you already helped a lot! 

</p>
</details>

通过在 GitHub 上给它 Star 来表明你喜欢 LVGL！
<!-- 将此标签放在您的头脑中或紧贴身体标签之前。 -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- 将此标签放置在您希望按钮呈现的位置。 -->
<a class="github-button" href="https://github.com/lvgl/lvgl" data-icon="octicon-star" data-size="large" data-show-count="true" 咏叹调 -label="Star lvgl/lvgl on GitHub">Star</a>

这个简单的点击使 LVGL 在 GitHub 上更显眼，并使其对其他人更具吸引力。
所以有了这个，你已经帮了很多忙！

### Tell what you have achieved（讲述你的成就）

<details>
<summary>查看原文</summary>
<p>

Have you already started using LVGL in a [Simulator](/get-started/pc-simulator), a development board, or on your custom hardware? 
Was it easy or were there some obstacles? Are you happy with the result? 
Showing your project to others is a win-win situation because it increases your and LVGL's reputation at the same time.

You can post about your project on Twitter, Facebook, LinkedIn, create a YouTube video, and so on. 
Only one thing: On social media don't forget to add a link to `https://lvgl.io` or `https://github.com/lvgl` and use the hashtag `#lvgl`. Thank you! :) 

You can also open a new topic in the [My projects](https://forum.lvgl.io/c/my-projects/10) category of the Forum.

The [LVGL Blog](https://blog.lvgl.io) welcomes posts from anyone. 
It's a good place to talk about a project you created with LVGL, write a tutorial, or share some nice tricks.
The latest blog posts are shown on the [homepage of LVGL](https://lvgl.io) to make your work more visible.

The blog is hosted on GitHub. If you add a post GitHub automatically turns it into a website. 
See the [README](https://github.com/lvgl/blog) of the blog repo to see how to add your post.
 
Any of these help to spread the word and familiarize new developers with LVGL.

If you don't want to speak about your project publicly, feel free to use [Contact form](https://lvgl.io/#contact) on lvgl.io to private message to us. 

</p>
</details>

您是否已经开始在 [模拟器](/get-started/pc-simulator)、开发板或自定义硬件中使用 LVGL？
是容易还是有什么障碍？你对结果满意吗？
向他人展示您的项目是一个双赢的局面，因为它同时增加了您和 LVGL 的声誉。

您可以在 Twitter、Facebook、LinkedIn 上发布您的项目，创建 YouTube 视频等。
只有一件事：在社交媒体上不要忘记添加一个链接到 `https://lvgl.io` 或 `https://github.com/lvgl` 并使用主题标签 `#lvgl`。谢谢！ :)

您也可以在论坛的[我的项目](https://forum.lvgl.io/c/my-projects/10) 类别中打开一个新主题。

[LVGL 博客](https://blog.lvgl.io) 欢迎任何人发帖。
这是谈论您使用 LVGL 创建的项目、编写教程或分享一些不错的技巧的好地方。
最新博文展示在【LVGL首页】(https://lvgl.io)，让你的作品更显眼。

该博客托管在 GitHub 上。如果您添加帖子，GitHub 会自动将其转换为网站。
请参阅博客存储库的 [README](https://github.com/lvgl/blog) 以了解如何添加您的帖子。
 
其中任何一项都有助于传播信息并使新开发人员熟悉 LVGL。

如果您不想公开谈论您的项目，请随时使用 lvgl.io 上的[联系表格](https://lvgl.io/#contact) 私信给我们。

### Write examples（撰写实例）

<details>
<summary>查看原文</summary>
<p>

As you learn LVGL you will probably play with the features of widgets. Why not publish your experiments?

Each widgets' documentation contains examples. For instance, here are the examples of the [Drop-down list](/widgets/core/dropdown#examples) widget. 
The examples are directly loaded from the [lvgl/examples](https://github.com/lvgl/lvgl/tree/master/examples) folder. 

So all you need to do is send a [Pull request](#pull-request) to the [lvgl](https://github.com/lvgl/lvgl) repository and follow some conventions:
- Name the examples like `lv_example_<widget_name>_<index>`.
- Make the example as short and simple as possible.
- Add comments to explain what the example does.
- Use 320x240 resolution.
- Update `index.rst` in the example's folder with your new example. To see how other examples are added, look in the [lvgl/examples/widgets](https://github.com/lvgl/lvgl/tree/master/examples/widgets) folder.

</p>
</details>

当您学习 LVGL 时，您可能会使用小部件的功能。 为什么不发表你的实验？

每个小部件的文档都包含示例。 例如，这里是 [下拉列表](/widgets/core/dropdown#examples) 小部件的示例。
示例直接从 [lvgl/examples](https://github.com/lvgl/lvgl/tree/master/examples) 文件夹加载。

所以你需要做的就是向 [lvgl](https://github.com/lvgl/lvgl) 存储库发送一个 [Pull request](#pull-request) 并遵循一些约定：
- 将示例命名为`lv_example_<widget_name>_<index>`。
- 使示例尽可能简短。
- 添加注释以解释示例的作用。
- 使用 320x240 分辨率。
- 使用您的新示例更新示例文件夹中的 `index.rst`。 要查看其他示例是如何添加的，请查看 [lvgl/examples/widgets](https://github.com/lvgl/lvgl/tree/master/examples/widgets) 文件夹。

### Improve the docs（改进文档）

<details>
<summary>查看原文</summary>
<p>

As you read the documentation you might see some typos or unclear sentences. All the documentation is located in the [lvgl/docs](https://github.com/lvgl/lvgl/tree/master/docs) folder.
For typos and straightforward fixes, you can simply edit the file on GitHub. 

Note that the documentation is also formatted in [Markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet). 

</p>
</details>

当您阅读文档时，您可能会看到一些拼写错误或不清楚的句子。 所有文档都位于 [lvgl/docs](https://github.com/lvgl/lvgl/tree/master/docs) 文件夹中。
对于拼写错误和直接修复，您只需在 GitHub 上编辑文件即可。

请注意，文档的格式也为 [Markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)。

### Report bugs（报告bug）

<details>
<summary>查看原文</summary>
<p>

As you use LVGL you might find bugs. Before reporting them be sure to check the relevant parts of the documentation.

If it really seems like a bug feel free to open an [issue on GitHub](https://github.com/lvgl/lvgl/issues). 

When filing the issue be sure to fill out the template. It helps find the root of the problem while avoiding extensive questions and exchanges with other developers.

</p>
</details>

当您使用 LVGL 时，您可能会发现错误。 在报告它们之前，请务必检查文档的相关部分。

如果它真的看起来像是一个错误，请随时打开 [GitHub 上的问题](https://github.com/lvgl/lvgl/issues)。

提交问题时，请务必填写模板。 它有助于找到问题的根源，同时避免广泛的问题和与其他开发人员的交流。

### Send fixes（提交补丁）

<details>
<summary>查看原文</summary>
<p>

The beauty of open-source software is you can easily dig in to it to understand how it works. You can also fix or adjust it as you wish.

If you found and fixed a bug don't hesitate to send a [Pull request](#pull-request) with the fix.

In your Pull request please also add a line to [`CHANGELOG.md`](https://github.com/lvgl/lvgl/blob/master/CHANGELOG.md).

</p>
</details>

开源软件的美妙之处在于您可以轻松深入了解它的工作原理。 您也可以根据需要修复或调整它。

如果您发现并修复了错误，请毫不犹豫地发送带有修复程序的 [Pull request](#pull-request)。

在您的拉取请求中，还请在 [`CHANGELOG.md`](https://github.com/lvgl/lvgl/blob/master/CHANGELOG.md) 中添加一行。

### Join the conversations in the Forum（参与论坛讨论）

<details>
<summary>查看原文</summary>
<p>

It feels great to know you are not alone if something is not working. It's even better to help others when they struggle with something.

While you were learning LVGL you might have had questions and used the Forum to get answers. As a result, you probably have more knowledge about how LVGL works.

One of the best ways to give back is to use the Forum and answer the questions of newcomers - like you were once.

Just read the titles and if you are familiar with the topic don't hesitate to share your thoughts and suggestions.

Participating in the discussions is one of the best ways to become part of the project and get to know like-minded people!

</p>
</details>

如果某些事情不起作用，知道您并不孤单，这感觉很棒。 在别人遇到困难时帮助他们甚至更好。

当您学习 LVGL 时，您可能会遇到问题并使用论坛来获得答案。 因此，您可能对 LVGL 的工作原理有了更多的了解。

回馈的最佳方式之一是使用论坛并回答新人的问题 - 就像您曾经一样。

只需阅读标题，如果您熟悉该主题，请随时分享您的想法和建议。

参与讨论是成为项目的一部分并结识志同道合的人的最佳方式之一！

### Add features（添加功能）

<details>
<summary>查看原文</summary>
<p>

If you have created a cool widget, or added useful feature to LVGL feel free to open a new PR for it. 
We collect the optional features (a.k.a. plugins) in [lvgl/src/extra](https://github.com/lvgl/lvgl/tree/master/src/extra) folder so if you are interested in adding a new features please use this folder. 
The [README](https://github.com/lvgl/lvgl/blob/master/src/extra/README.md) file describes the basics rules of contribution and and also lists some ideas.

For further ideas take a look at the our [Roadmap](/ROADMAP) page. If you are interested in any of them feel free to share your opinion and/or participate in the the implementation.

Other features which are (still) not on the road map are listed in the [Feature request](https://forum.lvgl.io/c/feature-request/9) category of the Forum. 

When adding a new features the followings also needs to be updated:
- Update [lv_conf_template.h](https://github.com/lvgl/lvgl/blob/master/lv_conf_template.h)
- Add description in the [docs](https://github.com/lvgl/lvgl/tree/master/docs) 
- Add [examples](https://github.com/lvgl/lvgl/tree/master/examples)
- Update the [changelog](https://github.com/lvgl/lvgl/tree/master/docs/CHANGELOG.md)

</p>
</details>

如果您创建了一个很酷的小部件，或者为 LVGL 添加了有用的功能，请随时为它打开一个新的 PR。
我们在 [lvgl/src/extra](https://github.com/lvgl/lvgl/tree/master/src/extra) 文件夹中收集可选功能（又名插件），因此如果您有兴趣添加新功能，请使用这个文件夹。
[README](https://github.com/lvgl/lvgl/blob/master/src/extra/README.md) 文件描述了贡献的基本规则，并列出了一些想法。

有关更多想法，请查看我们的 [Roadmap](/ROADMAP) 页面。如果您对其中任何一个感兴趣，请随时分享您的意见和/或参与实施。

其他（仍然）不在路线图中的功能列在论坛的 [功能请求](https://forum.lvgl.io/c/feature-request/9) 类别中。

添加新功能时，还需要更新以下内容：
- 更新 [lv_conf_template.h](https://github.com/lvgl/lvgl/blob/master/lv_conf_template.h)
- 在 [docs](https://github.com/lvgl/lvgl/tree/master/docs) 中添加说明
- 添加[示例](https://github.com/lvgl/lvgl/tree/master/examples)
- 更新 [变更日志](https://github.com/lvgl/lvgl/tree/master/docs/CHANGELOG.md)


### Become a maintainer（成为维护者）

<details>
<summary>查看原文</summary>
<p>

If you want to become part of the core development team, you can become a maintainer of a repository.

By becoming a maintainer:
- You get write access to that repo:
  - Add code directly without sending a pull request
  - Accept pull requests
  - Close/reopen/edit issues
- Your input has higher impact when we are making decisions

You can become a maintainer by invitation, however the following conditions need to met
1. Have > 50 replies in the Forum. You can look at your stats [here](https://forum.lvgl.io/u?period=all)
2. Send > 5 non-trivial pull requests to the repo where you would like to be a maintainer


If you are interested, just send a message (e.g. from the Forum) to the current maintainers of the repository. They will check if the prerequisites are met. 
Note that meeting the prerequisites is not a guarantee of acceptance, i.e. if the conditions are met you won't automatically become a maintainer. 
It's up to the current maintainers to make the decision.

</p>
</details>

如果您想成为核心开发团队的一员，您可以成为存储库的维护者。

通过成为维护者：
- 您可以对该存储库进行写访问：
   - 无需发送拉取请求，直接添加代码
   - 接受拉取请求
   - 关闭/重新打开/编辑问题
- 当我们做出决定时，您的意见会产生更大的影响

您可以通过邀请成为维护者，但需要满足以下条件
1. 论坛回复超过 50 条。 你可以查看你的统计数据[这里](https://forum.lvgl.io/u?period=all)
2. 向您希望成为维护者的存储库发送 > 5 个重要的拉取请求


如果您有兴趣，只需向存储库的当前维护者发送一条消息（例如来自论坛）。 他们将检查是否满足先决条件。
请注意，满足先决条件并不能保证被接受，即如果满足条件，您将不会自动成为维护者。
由当前的维护者做出决定。

### Move your project repository under LVGL organization（将您的项目库移到LVGL组织下）

<details>
<summary>查看原文</summary>
<p>

Besides the core `lvgl` repository there are other repos for ports to development boards, IDEs or other environment. 
If you ported LVGL to a new platform we can host it under the LVGL organization among the other repos.

This way your project will become part of the whole LVGL project and can get more visibility. 
If you are interested in this opportunity just open an [issue in lvgl repo](https://github.com/lvgl/lvgl/issues) and tell what you have! 

If we agree that your port fit well into the LVGL organization, we will open a repository for your project where you will have admin rights.  

To make this concept sustainable there a few rules to follow:
- You need to add a README to your repo.
- We expect to maintain the repo to some extent:
  - Follow at least the major versions of LVGL 
  - Respond to the issues (in a reasonable time)
- If there is no activity in a repo for 1 year it will be archived

</p>
</details>

除了核心`lvgl` 存储库，还有其他存储库用于开发板、IDE 或其他环境的端口。
如果您将 LVGL 移植到一个新平台，我们可以将它托管在 LVGL 组织下的其他存储库中。

这样您的项目将成为整个 LVGL 项目的一部分，并可以获得更多的可见性。
如果您对这个机会感兴趣，只需打开一个 [问题在 lvgl repo](https://github.com/lvgl/lvgl/issues) 并告诉您有什么！

如果我们同意您的移植非常适合 LVGL 组织，我们将为您的项目打开一个存储库，您将在其中拥有管理员权限。

为了使这个概念可持续，需要遵循一些规则：
- 你需要在你的 repo 中添加一个 README。
- 我们希望在一定程度上维持回购：
   - 至少遵循 LVGL 的主要版本
   - 回应问题（在合理的时间内）
- 如果 1 年内没有任何活动，它将被存档

