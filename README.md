# 长沙理工大学全日制专业硕士论文模板（精简版）

本模板依据长沙理工大学2023年研究生学位论文撰写规范编写，当前仅支持**全日制专业硕士**，属于非官方模板。其他学位类型需另行调整，不能只改封面名称后直接套用。

推荐使用 [TeXPage](https://www.texpage.com/console/) 在线进行论文编写，主文件选择 `main.tex`，编译器选择 **XeLaTeX**。本示例已在 TeXPage 使用 XeLaTeX 编译验证。

## 1. 快速开始

1. 上传本目录的文件和子目录，保持原有相对路径。线上编译不需要 `compile.command`，可以不上传。
2. 将 `main.tex` 设为主文件，选择 XeLaTeX，先编译未经修改的示例。
3. 修改 `thesis-info.tex` 中的个人信息、题目和关键词。
4. 修改 `chapters/abstracts.tex` 中的中英文摘要，以及各章节文件中的正文。
5. 将自己的插图放入 `figures/`，文献条目写入 `references.bib`。
6. 修改 `chapters/backmatter.tex` 中的致谢、研究成果和项目，重新编译并检查目录、图表和文献引用。

示例姓名、学号、论文文字、数据和成果均为占位内容，正式使用前应替换或删除。编译成功表示依赖与语法可用，提交前仍需核对个人信息、全文排版及学院的具体要求。

## 2. 文件用途

| 文件或目录 | 用途 | 日常操作 |
| --- | --- | --- |
| `main.tex` | 主文件，控制整篇论文的组成和章节顺序 | 增删章节时修改 |
| `thesis-info.tex` | 中英文题目、个人信息、导师、日期、关键词、校徽路径 | 填写自己的信息 |
| `csustthesis.cls` | 文档类，统一管理封面、字体、字号、行距、页边距、页眉页码和题注等 | 通常保留原设置 |
| `declaration.tex` | 原创性声明与版权使用授权书 | 保留声明文字，按学校要求签名 |
| `chapters/abstracts.tex` | 中英文摘要正文 | 替换两个摘要环境内的示例文字 |
| `chapters/01-introduction.tex` | 第一章示例：绪论 | 替换为自己的正文 |
| `chapters/02-examples.tex` | 第二章示例：公式、表格、子图、跨页表格 | 可参考命令用法，再替换内容 |
| `chapters/03-conclusion.tex` | 第三章示例：结论与展望 | 替换或按论文结构增删 |
| `chapters/backmatter.tex` | 致谢、攻读学位期间的研究成果和项目 | 按真实情况填写 |
| `references.bib` | BibTeX 文献数据库 | 添加有可靠来源的文献条目 |
| `figures/` | 校徽与论文插图 | 放入 PNG、JPG、PDF 图片 |
| `compile.command` | Mac 本地编译快捷入口 | 线上使用时可删除 |
| `README.md` | 使用与来源说明 | 不参与论文编译 |

学校规范 PDF 如保存在本目录中，仅供查阅，不参与编译。

## 3. 个人信息与配置字段

在 `thesis-info.tex` 的 `\csustsetup{...}` 中填写，保留字段名和外层结构；值写在花括号内，字段之间用逗号分隔。中文和英文信息分别填写，模板不会自动翻译。

| 字段 | 含义 |
| --- | --- |
| `title` / `title-en` | 中文 / 英文论文题目 |
| `author` / `author-en` | 中文 / 英文作者姓名 |
| `student-id` | 学号 |
| `classification` | 中图分类号，按论文所属学科核实填写 |
| `confidentiality` | 密级，按实际审批情况填写 |
| `school` | 所在学院全称 |
| `degree-category` | 专业学位类别，按学籍信息填写 |
| `field` / `field-en` | 专业学位领域及其英文名称 |
| `degree-en` | 英文专业学位名称，按实际授予学位填写 |
| `supervisor` / `supervisor-en` | 校内导师姓名与职称及其英文写法 |
| `co-supervisor` / `co-supervisor-en` | 校外导师姓名与职称及其英文写法 |
| `previous-degree-en` | 已获学位、毕业学校和年份的英文信息，不是本次申请的学位 |
| `submit-date` / `submit-date-en` | 论文提交日期及其英文写法 |
| `defense-date` | 论文答辩日期 |
| `chair` | 答辩委员会主席姓名与职称 |
| `keywords` / `keywords-en` | 中英文关键词，分别用中文 / 英文分号分隔，末尾不加分号 |
| `logo` | 校徽图片的相对路径，默认 `figures/csust-mark.pdf` |

不要把“专业学位类别”“专业学位领域”等占位文字直接保留，也不要根据导师姓名猜测职称、学位或日期。缺少资料时应向作者核实。

中文长题目可以在合适位置用 `\\` 换行；题目会同时用于外封面和中文内封，两处相同是正常现象。学校代号 `10536` 由文档类统一设置。

中英文摘要分别写在 `cnabstract` 和 `enabstract` 环境内；关键词由配置自动输出，无须在摘要文件中再写一遍。

## 4. 正文结构与增删章节

每个正文文件直接从 `\chapter{章标题}` 开始，不再写 `\documentclass`、`\begin{document}` 或 `\end{document}`。

```latex
\chapter{研究方法}\label{chap:method}
\section{总体框架}
正文内容。

\subsection{模块设计}
正文内容。

\subsubsection{实现细节}
正文内容。
```

新增一章时，例如创建 `chapters/04-experiments.tex`，在 `main.tex` 的正文区域增加：

```latex
\include{chapters/04-experiments}
```

所有正文的 `\include` 放在 `\csustmainmatter` 之后、`\csustbibliography{references}` 之前；顺序决定章节编号。删除一章时，同步删除它的 `\include`。不要手工在章标题中写“第4章”，也不要手工编页码或目录。

`main.tex` 中各入口依次负责：

```latex
\maketitle                         % 外封面、中英文内封与声明
\input{chapters/abstracts}          % 中英文摘要
\csustmakecontents                 % 目录、插图索引、附表索引
\csustmainmatter                   % 切换到正文与阿拉伯数字页码
% 在这里按顺序 include 各章
\csustbibliography{references}      % 参考文献
\input{chapters/backmatter}         % 致谢、研究成果与项目
```

`backmatter.tex` 中三个环境分别为 `acknowledgements`、`publications`、`projects`。其中的“附录A/B”名称由模板生成，当前用来列研究成果与项目，不能当作空白技术附录随意覆盖；如果论文另需推导、代码等附录，应结合学院要求另行安排结构。

## 5. 插图、表格和公式

图片放到 `figures/`，建议使用不带空格的英文文件名。下面示例需先上传自己的 `figures/result.png` 才能编译：

```latex
\begin{figure}[htbp]
  \centering
  \includegraphics[clip,width=0.8\textwidth]{figures/result.png}
  \caption{实验结果}\label{fig:result}
\end{figure}

如图\ref{fig:result}所示，……
```

保留图片的 `clip` 选项，防止部分 PDF 图片的越界绘制影响页眉。图题置于图下，表题置于表上；`\label` 放在 `\caption` 后，每个标签必须唯一。浮动体的位置由 LaTeX 排版决定，不一定紧邻源代码。

普通三线表可按下面的方式编写，字体和线宽由模板控制：

```latex
\begin{table}[htbp]
  \centering
  \caption{实验参数}\label{tab:parameters-new}
  \begin{tabular}{lr}
    \toprule
    参数 & 数值 \\
    \midrule
    样本数 & 100 \\
    \bottomrule
  \end{tabular}
\end{table}
```

跨页表使用 `longtable`，不要嵌入 `table` 浮动体；重复表头、续表标记和子图的完整写法见 `chapters/02-examples.tex`。

行内公式用 `$...$`；编号公式使用 `equation`，连续推导用 `align`，不手工编公式号：

```latex
\begin{equation}\label{eq:energy}
  E=mc^2.
\end{equation}

由式\eqref{eq:energy}可知，……
```

普通文字中的 `%`、`&`、`_`、`#` 等特殊符号需按 LaTeX 语法转义，例如 `\%`、`\&`、`\_`、`\#`；数学表达式中的用法另按数学语法处理。

## 6. 参考文献

把真实文献信息写入 `references.bib`，每条文献使用唯一的引用键。现有的 `lamport1994` 是可运行示例：

```latex
已有研究指出……\cite{lamport1994}       % 上标编号引用
文献\inlinecite{lamport1994}介绍了……   % 行文中的普通编号引用
```

不要手工写 `[1]`，不要直接修改编译生成的 `.bbl`。文献列表由 BibTeX 与发行版提供的 `gbt7714-numerical` 样式生成，通常只列出正文中已引用的条目。新增文献后需重新运行 BibTeX 并完成后续编译；出现 `?` 或未定义引用时，先检查引用键和编译流程。

## 7. 编译与字体

### 线上编译

保持目录结构，选择 `main.tex` 和 XeLaTeX。平台还需具有模板依赖的宏包及字体；本次 TeXPage 示例编译已验证可用，不代表所有线上环境都具备相同字体。

### 本地编译

安装 TeX Live/MacTeX，需包含 ctex、fontspec、mathspec、caption/subcaption、gbt7714 等依赖。Mac 可在模板目录的终端运行 `sh compile.command`；首次下载后如需双击运行，先执行 `chmod +x compile.command`。脚本会使用 latexmk 自动处理多轮编译，生成根目录的 `main.pdf`，中间文件集中到隐藏的 `.build/`。脚本也支持通过 `CSUST_TEX_BIN` 指定 TeX 工具的 bin 目录。

使用编辑器时，编译顺序为 **XeLaTeX → BibTeX → XeLaTeX → XeLaTeX**；BibTeX 的任务名为 `main`，不是 `references`。模板使用 BibTeX，不使用 Biber。

### 字体要求

正式模式使用 Times New Roman，以及 Windows 的 SimSun/SimHei 或 macOS 的 Songti SC/Heiti SC。字体缺失会报错，不会自动把正式版替换为其他字体。

若系统没有字体，可以合法取得后自行创建 `fonts/`，放入以下文件：

```text
fonts/
  times.ttf
  timesbd.ttf
  timesi.ttf
  timesbi.ttf
  simsun.ttc
  simhei.ttf
```

模板不附带商业字体，公开仓库也不应随意捆绑这些字体。文档类的 `preview` 选项仅供缺字体时预览，会添加预览标识；不能把这种输出当作正式提交文件。

默认插入的空白背页用于单面印刷封面、内封和声明，并使正文从奇数页开始，属于预期行为。仅需连续电子阅读时可使用 `\documentclass[digital]{csustthesis}`；打印或提交时是否省去这些空白页应按学校要求确定。

## 8. 给 AI 辅助写作工具的说明

1. 先阅读本 README，再检查 `main.tex`、`thesis-info.tex` 和需要修改的章节文件；以实际代码为准，不猜测接口或不存在的文件。
2. 个人信息和关键词只在 `thesis-info.tex` 中修改；摘要、正文、文献和后置部分分别放到对应文件，新增章节时同步维护 `main.tex`。
3. 保留文档类对字体、字号、行距、页边距、题注、引用、页眉页码的统一设置。不要在正文中为凑页数加入全局 `\setstretch`、`\fontsize`、`\geometry` 等覆盖命令，也不要重写整套导言区。
4. 正文当前为小四12磅，1.5倍行距的实际基线距离为23.4磅，与学校规范中的正文示例一致；目录固定20磅。不要将1.5倍行距误改为12×1.5＝18磅。
5. 使用 `\chapter`、`\section` 等结构命令和 `\label`、`\ref`、`\eqref`、`\cite` 管理编号。保留声明原文及必要的前置页面，不因为封面和内封题目相同就删掉其中一页。
6. 仅使用作者提供或已核实的个人信息、研究结果、图片与文献；不得虚构实验数据、成果、导师信息或文献元数据。缺少必要信息时明确标记并询问作者。
7. 修改后如具备编译条件，应编译并检查错误、未定义引用、溢出和实际 PDF；没有编译验证时应如实说明，不声称已经通过检查。
8. 如作者明确要求修复格式，先对照学校规范定位原因，再调整 `csustthesis.cls`，并说明调整范围与验证结果。


## 9. 来源、依赖与资产说明

### 本项目代码

本项目按长沙理工大学2023年研究生学位论文撰写规范，重新组织为独立文档类与配置接口。首版仅面向全日制专业硕士。模板代码和新写的教学示例采用MIT许可。

本项目的发展参考了[CSUSTthesis历史模板](https://github.com/kangxiatao/CSUSTthesis)及其上游社区的使用经验。历史仓库未见明确开源许可证，因此本项目不直接搬运旧仓库的格式文件、论文正文或私人插图，也不将历史代码重新宣称为MIT许可。

### 校徽、校名与声明文字

`figures/csust-mark.pdf`为长沙理工大学校徽与校名组合图，来自原CSUSTthesis模板的`figures/cslglogo.pdf`视觉资产；校徽、校名的权利归相关权利人所有，不属于本项目MIT许可范围。其用途是展示学位论文封面，不代表学校为本项目背书。使用者应按学校要求使用该资产。

`declaration.tex`根据用户提供的学校2023年规范附件10录入；声明文字不被重新许可为本项目原创内容。正式论文中应按学校要求原样使用并手写签名。

### 依赖

- `gbt7714`样式使用TeX发行版中安装的[GB/T 7714 BibTeX Style](https://github.com/zepinglee/gbt7714-bibtex-style)，原项目采用LPPL。此仓库不附带或修改其BST文件。
- ctex、fontspec、mathspec、caption等宏包由TeX发行版提供，各自保留其许可；不随本仓库捆绑TeX运行时。
- 不分发Times New Roman、SimSun、SimHei等商业字体文件。本精简版不附带字体文件。

### 当前状态

本仓库为全日制专业硕士模板首版，依据2023年规范，已在 TeXPage 使用 XeLaTeX 编译验证。学校如更新规范，应重新核对相应版式。

### 原创代码许可

MIT License

Copyright (c) 2026 CSUST Thesis contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Scope: this license covers the original template code and instructional text.
University marks and university-provided declaration text are excluded; see
README.md. Dependencies retain their respective licenses.
