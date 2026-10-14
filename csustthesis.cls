%% SPDX-License-Identifier: MIT
%% CSUST Thesis contributors, 2026. Full-time professional master's edition.
\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\ProvidesClass{csustthesis}[2026/10/15 v0.1.0 CSUST professional master's thesis]
\newif\ifcsustpreview
\newif\ifcsustprint\csustprinttrue
\DeclareOption{preview}{\csustpreviewtrue}
\DeclareOption{digital}{\csustprintfalse}
\DeclareOption*{\ClassError{csustthesis}{Unknown option: \CurrentOption}{Supported options: preview, digital.}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt,twoside,openany]{book}
\RequirePackage{iftex}
\RequireXeTeX
\RequirePackage[UTF8,fontset=none]{ctex}
\RequirePackage{geometry}
\geometry{margin=25mm,headheight=5mm,headsep=5mm,footskip=10mm}
\RequirePackage{graphicx,float}
\RequirePackage{amsmath,amssymb,mathrsfs}
\RequirePackage{mathspec}
\RequirePackage{setspace}
\RequirePackage{titlesec,titletoc,fancyhdr}
\RequirePackage{booktabs,longtable,tabularx,multirow}
\RequirePackage{caption,subcaption}
\RequirePackage[sort&compress,numbers]{natbib}
\RequirePackage{enumitem,etoolbox,indentfirst}
\RequirePackage[unicode,hidelinks,bookmarksnumbered]{hyperref}
\pdfstringdefDisableCommands{\def\\{ }\def\quad{ }}

% Metadata is separate from typesetting. No personal data is stored in this class.
\ExplSyntaxOn
\prop_new:N \g_csust_metadata_prop
\keys_define:nn { csust }
  {
    title .code:n = \prop_gput:Nnn \g_csust_metadata_prop {title}{#1},
    title-en .code:n = \prop_gput:Nnn \g_csust_metadata_prop {title-en}{#1},
    author .code:n = \prop_gput:Nnn \g_csust_metadata_prop {author}{#1},
    author-en .code:n = \prop_gput:Nnn \g_csust_metadata_prop {author-en}{#1},
    student-id .code:n = \prop_gput:Nnn \g_csust_metadata_prop {student-id}{#1},
    classification .code:n = \prop_gput:Nnn \g_csust_metadata_prop {classification}{#1},
    confidentiality .code:n = \prop_gput:Nnn \g_csust_metadata_prop {confidentiality}{#1},
    school .code:n = \prop_gput:Nnn \g_csust_metadata_prop {school}{#1},
    degree-category .code:n = \prop_gput:Nnn \g_csust_metadata_prop {degree-category}{#1},
    degree-en .code:n = \prop_gput:Nnn \g_csust_metadata_prop {degree-en}{#1},
    field .code:n = \prop_gput:Nnn \g_csust_metadata_prop {field}{#1},
    field-en .code:n = \prop_gput:Nnn \g_csust_metadata_prop {field-en}{#1},
    supervisor .code:n = \prop_gput:Nnn \g_csust_metadata_prop {supervisor}{#1},
    supervisor-en .code:n = \prop_gput:Nnn \g_csust_metadata_prop {supervisor-en}{#1},
    co-supervisor .code:n = \prop_gput:Nnn \g_csust_metadata_prop {co-supervisor}{#1},
    co-supervisor-en .code:n = \prop_gput:Nnn \g_csust_metadata_prop {co-supervisor-en}{#1},
    previous-degree-en .code:n = \prop_gput:Nnn \g_csust_metadata_prop {previous-degree-en}{#1},
    submit-date .code:n = \prop_gput:Nnn \g_csust_metadata_prop {submit-date}{#1},
    submit-date-en .code:n = \prop_gput:Nnn \g_csust_metadata_prop {submit-date-en}{#1},
    defense-date .code:n = \prop_gput:Nnn \g_csust_metadata_prop {defense-date}{#1},
    chair .code:n = \prop_gput:Nnn \g_csust_metadata_prop {chair}{#1},
    keywords .code:n = \prop_gput:Nnn \g_csust_metadata_prop {keywords}{#1},
    keywords-en .code:n = \prop_gput:Nnn \g_csust_metadata_prop {keywords-en}{#1},
    logo .code:n = \prop_gput:Nnn \g_csust_metadata_prop {logo}{#1}
  }
\NewDocumentCommand \csustsetup {m} {\keys_set:nn {csust}{#1}}
\NewExpandableDocumentCommand \csustvalue {m} {\prop_item:Nn \g_csust_metadata_prop {#1}}
\keys_set:nn {csust}
  {title={学位论文题目},title-en={Thesis Title},author={姓名},author-en={NAME},
   student-id={},classification={},confidentiality={公开},school={学院名称},
   degree-category={专业学位类别},degree-en={Professional Degree},field={专业学位领域},
   field-en={Discipline},supervisor={},supervisor-en={},co-supervisor={},co-supervisor-en={},
   previous-degree-en={},submit-date={},submit-date-en={},defense-date={},chair={},
   keywords={},keywords-en={},logo={figures/csust-mark.pdf}}
\ExplSyntaxOff

% Strict mode uses named school-required font families. Preview is deliberately separate.
\newcommand\csust@missingfont[1]{\ClassError{csustthesis}{Required font missing: #1}{Install licensed fonts; see README.md. Use class option preview only for a non-submission preview.}}
\newcommand\csust@latin[2]{%
  \setmainfont[#1]{#2}\setsansfont[#1]{#2}%
  \def\csust@mathsetup{\setmathsfont(Digits,Latin,Greek)[#1]{#2}\setmathrm[#1]{#2}}}
\ifcsustpreview
  \csust@latin{BoldFont=texgyretermes-bold.otf,ItalicFont=texgyretermes-italic.otf,BoldItalicFont=texgyretermes-bolditalic.otf}{texgyretermes-regular.otf}
  \setCJKmainfont[BoldFont=FandolSong-Bold.otf]{FandolSong-Regular.otf}
  \setCJKsansfont[BoldFont=FandolHei-Bold.otf]{FandolHei-Regular.otf}
  \setCJKfamilyfont{zhsong}[BoldFont=FandolSong-Bold.otf]{FandolSong-Regular.otf}
  \setCJKfamilyfont{zhhei}[BoldFont=FandolHei-Bold.otf]{FandolHei-Regular.otf}
  \ClassWarningNoLine{csustthesis}{PREVIEW FONTS ACTIVE. This PDF is not a submission-font specimen}
\else
  \IfFileExists{fonts/times.ttf}{%
    \IfFileExists{fonts/timesbd.ttf}{}{\csust@missingfont{timesbd.ttf}}
    \IfFileExists{fonts/timesi.ttf}{}{\csust@missingfont{timesi.ttf}}
    \IfFileExists{fonts/timesbi.ttf}{}{\csust@missingfont{timesbi.ttf}}
    \csust@latin{Path=fonts/,BoldFont=timesbd.ttf,ItalicFont=timesi.ttf,BoldItalicFont=timesbi.ttf}{times.ttf}
  }{\IfFontExistsTF{Times New Roman}{\csust@latin{}{Times New Roman}}{\csust@missingfont{Times New Roman}}}
  \IfFileExists{fonts/simsun.ttc}{%
    \IfFileExists{fonts/simhei.ttf}{}{\csust@missingfont{simhei.ttf}}
    \setCJKmainfont[Path=fonts/,FontIndex=0,AutoFakeBold=2]{simsun.ttc}
    \setCJKsansfont[Path=fonts/,AutoFakeBold=2]{simhei.ttf}
    \setCJKfamilyfont{zhsong}[Path=fonts/,FontIndex=0,AutoFakeBold=2]{simsun.ttc}
    \setCJKfamilyfont{zhhei}[Path=fonts/,AutoFakeBold=2]{simhei.ttf}
  }{\IfFontExistsTF{SimSun}{%
    \IfFontExistsTF{SimHei}{}{\csust@missingfont{SimHei}}
    \setCJKmainfont[AutoFakeBold=2]{SimSun}\setCJKsansfont[AutoFakeBold=2]{SimHei}
    \setCJKfamilyfont{zhsong}[AutoFakeBold=2]{SimSun}\setCJKfamilyfont{zhhei}[AutoFakeBold=2]{SimHei}
  }{\IfFontExistsTF{Songti SC}{%
    \IfFontExistsTF{Heiti SC}{}{\csust@missingfont{Heiti SC}}
    \setCJKmainfont[BoldFont={Songti SC Bold}]{Songti SC}\setCJKsansfont[AutoFakeBold=2]{Heiti SC}
    \setCJKfamilyfont{zhsong}[BoldFont={Songti SC Bold}]{Songti SC}\setCJKfamilyfont{zhhei}[AutoFakeBold=2]{Heiti SC}
  }{\csust@missingfont{SimSun/SimHei or Songti SC/Heiti SC}}}}
\fi
\setmonofont{texgyrecursor-regular.otf}
\providecommand\songti{\CJKfamily{zhsong}}
\providecommand\heiti{\CJKfamily{zhhei}}
% mathspec must be configured after all text/CJK fonts to avoid mutable fontspec aliases.
\csust@mathsetup
\DeclareFontFamily{U}{rsfs}{\skewchar\font127 }
\DeclareFontShape{U}{rsfs}{m}{n}{<-> rsfs10}{}

% bp is the PDF/Word point, not TeX's slightly smaller pt.
\newcommand\csust@size[2]{\fontsize{#1bp}{#2bp}\selectfont}
\renewcommand\normalsize{\@setfontsize\normalsize{12bp}{15.6bp}%
  \abovedisplayskip=6bp plus 2bp minus 2bp \belowdisplayskip=6bp plus 2bp minus 2bp
  \abovedisplayshortskip=6bp \belowdisplayshortskip=6bp}
\newcommand\csust@bodyfont{\normalfont\songti\setstretch{1.5}\normalsize}
\newcommand\csust@smallfont{\normalfont\songti\setstretch{1}\csust@size{10.5}{13.65}}
\newcommand\csust@bibfont{\normalfont\songti\setstretch{1.5}\csust@size{10.5}{13.65}}
\setlength\parindent{24bp}\setlength\parskip{0bp}
\setlength\emergencystretch{2em}\clubpenalty=10000\widowpenalty=10000
\setcounter{secnumdepth}{3}\setcounter{tocdepth}{2}
\setlist{itemsep=0bp,parsep=0bp,topsep=6bp}
\titleformat{\chapter}{\centering\normalfont\heiti\setstretch{1}\csust@size{14}{14}}{第\thechapter 章}{1em}{}
\titlespacing*{\chapter}{0bp}{14bp}{14bp}
\titleformat{name=\chapter,numberless}{\centering\normalfont\heiti\setstretch{1}\csust@size{14}{14}}{}{0bp}{}
\titleformat{\section}{\normalfont\heiti\setstretch{1}\csust@size{12}{15.6}}{\thesection}{1em}{}
\titlespacing*{\section}{0bp}{12bp}{12bp}
\titleformat{\subsection}{\normalfont\heiti\setstretch{1}\csust@size{12}{15.6}}{\thesubsection}{1em}{}
\titlespacing*{\subsection}{0bp}{6bp}{6bp}
\titleformat{\subsubsection}{\normalfont\heiti\setstretch{1}\csust@size{12}{15.6}}{\thesubsubsection}{1em}{}
\titlespacing*{\subsubsection}{0bp}{6bp}{6bp}
\renewcommand\contentsname{目\quad 录}
\renewcommand\listfigurename{插图索引}\renewcommand\listtablename{附表索引}
\newcommand\csust@tocfont{\normalfont\setstretch{1}\csust@size{12}{20}}
\titlecontents{chapter}[0bp]{\csust@tocfont\heiti}{第\thecontentslabel 章\quad}{}{\titlerule*[5bp]{.}\contentspage}
\titlecontents{section}[2em]{\csust@tocfont\songti}{\thecontentslabel\quad}{}{\titlerule*[5bp]{.}\contentspage}
\titlecontents{subsection}[4em]{\csust@tocfont\songti}{\thecontentslabel\quad}{}{\titlerule*[5bp]{.}\contentspage}
\titlecontents{figure}[0bp]{\csust@tocfont\songti}{图\thecontentslabel\quad}{}{\titlerule*[5bp]{.}\contentspage}
\titlecontents{table}[0bp]{\csust@tocfont\songti}{表\thecontentslabel\quad}{}{\titlerule*[5bp]{.}\contentspage}

% Caption and float initialization each own their font settings.
\DeclareCaptionFont{csust}{\csust@smallfont}
\captionsetup{font=csust,labelfont=normalfont,textfont=normalfont,labelsep=quad,justification=centering,singlelinecheck=false,aboveskip=6bp,belowskip=6bp}
\captionsetup[subfigure]{font=csust,labelformat=simple,labelsep=space,justification=centering,singlelinecheck=false}
\renewcommand\thesubfigure{\alph{subfigure})}
\renewcommand\thefigure{\thechapter.\arabic{figure}}
\renewcommand\thetable{\thechapter.\arabic{table}}
\renewcommand\theequation{\thechapter.\arabic{equation}}
\setlength\heavyrulewidth{1.5bp}\setlength\lightrulewidth{.75bp}
\newcommand\csust@tablefont{\csust@smallfont}
\apptocmd{\@xfloat}{\ifdefstring{\@captype}{table}{\csust@tablefont}{}}{}{\ClassError{csustthesis}{Cannot initialize table fonts}{Check the float packages.}}
\BeforeBeginEnvironment{longtable}{\par\begingroup\csust@tablefont}
\AfterEndEnvironment{longtable}{\endgroup}
\newcommand\figurenote[1]{\par\begingroup\csust@smallfont\noindent #1\par\endgroup}
\newcommand\csust@displaybegin{\par\begingroup\csust@smallfont
  \abovedisplayskip=4bp plus 2bp minus 1bp \belowdisplayskip=4bp plus 2bp minus 1bp
  \abovedisplayshortskip=4bp \belowdisplayshortskip=4bp}
\newcommand\csust@displayhook[1]{\BeforeBeginEnvironment{#1}{\csust@displaybegin}\AfterEndEnvironment{#1}{\endgroup}}
\forcsvlist{\csust@displayhook}{equation,equation*,align,align*,gather,gather*,multline,multline*,flalign,flalign*,alignat,alignat*}
\bibpunct{[}{]}{,}{s}{}{,}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa
  \if*#2*\else#2\NAT@spacechar\fi
  \unskip\kern\p@\raisebox{.65ex}{\normalfont\csust@size{12}{12}\NAT@@open#1\NAT@@close}%
  \if*#3*\else\NAT@spacechar#3\fi\else #1\fi\endgroup}
\newcommand\inlinecite[1]{{\setcitestyle{numbers}\citep{#1}}}
\renewcommand\bibfont{\csust@bibfont}\setlength\bibsep{0bp}\setlength\bibhang{2em}
\renewcommand\bibname{参考文献}
\renewcommand\bibsection{\chapter*{参考文献}\phantomsection\addcontentsline{toc}{chapter}{参考文献}}

\newcommand\csust@foot{\csust@smallfont\thepage}
\fancypagestyle{csustfront}{\fancyhf{}\fancyfoot[C]{\csust@foot}\renewcommand\headrulewidth{0bp}}
\fancypagestyle{csustbody}{\fancyhf{}\fancyhead[CO]{\csust@smallfont\leftmark}\fancyhead[CE]{\csust@smallfont 硕士学位论文}\fancyfoot[C]{\csust@foot}\renewcommand\headrulewidth{1.5bp}}
\fancypagestyle{plain}{\fancyhf{}\fancyhead[CO]{\csust@smallfont\leftmark}\fancyhead[CE]{\csust@smallfont 硕士学位论文}\fancyfoot[C]{\csust@foot}\renewcommand\headrulewidth{1.5bp}}
\renewcommand\headrule{{\vskip\dimexpr\headsep-\headrulewidth\relax\hrule height\headrulewidth width\headwidth\vskip-\headsep}}
\renewcommand\chaptermark[1]{\markboth{第\thechapter 章\quad #1}{}}
\newcommand\csust@backstyle{\pagestyle{csustfront}\fancypagestyle{plain}{\fancyhf{}\fancyfoot[C]{\csust@foot}\renewcommand\headrulewidth{0bp}}}
\newcommand\csust@backpage{\clearpage\ifcsustprint\thispagestyle{empty}\null\newpage\fi}
\newcommand\csust@row[2]{\makebox[4cm][s]{#1}&\underline{\makebox[6cm][c]{#2}}\\[4bp]}
\newcommand\csust@signature[1]{\noindent #1：\hspace{30mm}日期：\quad 年\quad 月\quad 日\par}
\newcommand\csust@fronttitle[2]{\clearpage\begingroup
  \titleformat{name=\chapter,numberless}{\centering\setstretch{1.5}#1}{}{0bp}{}
  \titlespacing*{\chapter}{0bp}{31.2bp}{15.6bp}\chapter*{#2}\endgroup
  \thispagestyle{csustfront}}
\renewcommand\maketitle{\hypersetup{pageanchor=false}\pagestyle{empty}\csust@bodyfont
  \begingroup\centering
  {\heiti\begin{tabular*}{\textwidth}{@{}l@{\quad}l@{\extracolsep{\fill}}l@{\quad}l@{}}
  学校代号&\underline{\makebox[25mm]{10536}}&学\quad 号&\underline{\makebox[35mm]{\csustvalue{student-id}}}\\
  分类号&\underline{\makebox[25mm]{\csustvalue{classification}}}&密\quad 级&\underline{\makebox[35mm]{\csustvalue{confidentiality}}}\end{tabular*}\par}
  \vspace{13mm}\IfFileExists{\csustvalue{logo}}{\includegraphics[clip,width=65mm]{\csustvalue{logo}}}{\ClassWarning{csustthesis}{University mark missing}\heiti\csust@size{22}{28.6}长沙理工大学}\par
  \vspace{8mm}{\heiti\csust@size{22}{28.6}硕士学位论文\par}
  \vspace{10mm}{\heiti\csust@size{22}{28.6}\csustvalue{title}\par}\vspace{16mm}
  {\songti\begin{tabular}{@{}ll@{}}
  \csust@row{学位申请人姓名}{\csustvalue{author}}
  \csust@row{所在学院}{\csustvalue{school}}
  \csust@row{专业学位类别}{\csustvalue{degree-category}}
  \csust@row{专业学位专业领域}{\csustvalue{field}}
  \csust@row{校内导师姓名及职称}{\csustvalue{supervisor}}
  \csust@row{校外导师姓名及职称}{\csustvalue{co-supervisor}}
  \csust@row{论文提交日期}{\csustvalue{submit-date}}
  \end{tabular}\par}\endgroup\csust@backpage
  {\heiti 学校代号：10536\par 学号：\csustvalue{student-id}\par 密级：\csustvalue{confidentiality}\par}
  \vspace{30bp}\begin{center}
  {\heiti\csust@size{18}{23.4}长沙理工大学专业硕士学位论文\par}
  \vspace{30bp}{\heiti\csust@size{22}{28.6}\csustvalue{title}\par}\vspace{36bp}
  \begin{tabular}{@{}ll@{}}
  \csust@row{学位申请人姓名}{\csustvalue{author}}
  \csust@row{所在学院}{\csustvalue{school}}
  \csust@row{校内导师姓名及职称}{\csustvalue{supervisor}}
  \csust@row{校外导师姓名及职称}{\csustvalue{co-supervisor}}
  \csust@row{专业学位专业领域}{\csustvalue{field}}
  \csust@row{论文提交日期}{\csustvalue{submit-date}}
  \csust@row{论文答辩日期}{\csustvalue{defense-date}}
  \csust@row{答辩委员会主席}{\csustvalue{chair}}
  \end{tabular}\end{center}\csust@backpage
  \begin{center}\vspace*{31.2bp}
  {\csust@size{15}{19.5}\csustvalue{title-en}\par}\vspace{19.5bp}
  by\par\csustvalue{author-en}\par\vspace{15.6bp}\csustvalue{previous-degree-en}\par\vspace{15.6bp}
  A thesis submitted in partial satisfaction of the\par
  Requirements for the professional degree of\par\csustvalue{degree-en}\par
  in\par\csustvalue{field-en}\par in\par Changsha University of Science \& Technology\par
  \vspace{31.2bp}Supervisor\par\csustvalue{supervisor-en}\par
  Associate Supervisor: \csustvalue{co-supervisor-en}\par\vspace{23.4bp}\csustvalue{submit-date-en}\par
  \end{center}\csust@backpage
  \input{declaration.tex}\csust@backpage
  \pagenumbering{Roman}\hypersetup{pageanchor=true}\pagestyle{csustfront}}
\NewDocumentEnvironment{cnabstract}{}{\csust@fronttitle{\normalfont\heiti\csust@size{18}{23.4}}{摘\quad 要}\phantomsection\addcontentsline{toc}{chapter}{摘\quad 要}\csust@bodyfont}{\par\vspace{\baselineskip}\noindent{\heiti{\bfseries 关键词：}\csustvalue{keywords}}\par\clearpage}
\NewDocumentEnvironment{enabstract}{}{\csust@fronttitle{\normalfont\bfseries\csust@size{18}{23.4}}{ABSTRACT}\phantomsection\addcontentsline{toc}{chapter}{ABSTRACT}\csust@bodyfont\parindent=0bp\parskip=\baselineskip}{\par\noindent{\bfseries Key Words: \csustvalue{keywords-en}}\par\clearpage}
\newcommand\csustmakecontents{\begingroup\csust@tocfont\pagestyle{csustfront}
  \titleformat{name=\chapter,numberless}{\centering\heiti\csust@size{16}{20.8}}{}{0bp}{}
  \tableofcontents\thispagestyle{csustfront}\clearpage
  \phantomsection\addcontentsline{toc}{chapter}{插图索引}\listoffigures\thispagestyle{csustfront}\clearpage
  \phantomsection\addcontentsline{toc}{chapter}{附表索引}\listoftables\thispagestyle{csustfront}\clearpage\endgroup}
\newcommand\csustmainmatter{\clearpage\ifcsustprint\ifodd\value{page}\else\thispagestyle{empty}\null\newpage\fi\fi\pagenumbering{arabic}\csust@bodyfont\pagestyle{csustbody}}
\newcommand\csustbibliography[1]{\clearpage\csust@backstyle\bibliographystyle{gbt7714-numerical}\bibliography{#1}}
\NewDocumentEnvironment{acknowledgements}{}{\clearpage\csust@backstyle\chapter*{致\quad 谢}\phantomsection\addcontentsline{toc}{chapter}{致\quad 谢}\csust@bodyfont}{\par}
\NewDocumentEnvironment{publications}{}{\clearpage\csust@backstyle\chapter*{附录A\quad 攻读学位期间的主要研究成果}\phantomsection\addcontentsline{toc}{chapter}{附录A\quad 攻读学位期间的主要研究成果}\csust@bibfont}{\par}
\NewDocumentEnvironment{projects}{}{\clearpage\csust@backstyle\chapter*{附录B\quad 攻读学位期间主持（参与）的科研（实践）项目}\phantomsection\addcontentsline{toc}{chapter}{附录B\quad 攻读学位期间主持（参与）的科研（实践）项目}\csust@bodyfont}{\par}
\AtBeginDocument{\csust@bodyfont\raggedbottom
  \hypersetup{pdftitle={\csustvalue{title-en}},pdfauthor={\csustvalue{author}},pdfsubject={CSUST full-time professional master's template}}
  \ifcsustpreview\AddToHook{shipout/foreground}{\put(0,-18){\makebox[\paperwidth]{\normalfont\fontsize{9bp}{11bp}\selectfont PREVIEW FONTS --- NOT FOR SUBMISSION}}}\fi}
\endinput
