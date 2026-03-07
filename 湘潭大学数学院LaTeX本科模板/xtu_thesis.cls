% ============================================================
% 湘潭大学本科毕业论文LaTeX文档类(v2.4)
% 修复日志：
% 1. 参考文献：不再使用 linespread，而是强制设定 baselineskip=20pt (视觉上的1.5倍)，防止被 zihao 覆盖。
% 2. 再次确认表格标题加粗、页脚边距等细节。
% 3. 免责声明：注意本模板所有格式的设置目的均为尽可能的还原2022级即2026湘潭大学数学院本科毕业生word模板，如有更细致的美观需求如设置chapter等居中章节，请在询问教务处老师后得到可以跳出word模板架构的肯定回复后再进行更改，本模板仅在征得本年教务处老师同意后进行使用，对26年以后的毕业生出现的制度更改或更新要求不负责任。
% ============================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{xtu_thesis}[2026/01/26 v2.4 Xiangtan University Thesis Template author=22级信息与计算科学2班 李煜龙 suanhai.Ethan]
\LoadClass[a4paper,12pt,oneside]{article}

% ==================== 1. 基础宏包 ====================
\RequirePackage[UTF8,scheme=plain,fontset=none]{ctex} 
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{setspace}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{indentfirst}
\RequirePackage{enumitem}
\RequirePackage{fontspec}
\RequirePackage{xurl} 
\RequirePackage{booktabs} 
\usepackage{amsmath}
\usepackage{algorithm}
\usepackage{algpseudocode}
\usepackage{amsmath} % 用于数学符号
\usepackage{booktabs} % 用于三线表
\usepackage{pgfplots}
\usepackage{xcolor}
\usepackage[super]{cite}
% ==================== 2. 字体设置  ====================
\setCJKmainfont[
BoldFont = SimSun, 
BoldFeatures = {FakeBold=4}, 
ItalicFont = KaiTi
]{SimSun}
\setCJKsansfont{SimHei}
\setCJKmonofont{FangSong}
\setmainfont{Times New Roman}

\newcommand{\songti}{\CJKfamily{song}}

% ==================== 3. 全局变量 ====================
\newcommand{\setfixedlinespacing}{
	\setlength{\baselineskip}{20pt}
	\setlength{\parskip}{0pt}
}

% ==================== 4. 页面版式 ====================
\geometry{
	left=3cm, right=2cm, top=3cm, bottom=2.5cm,
	headheight=15pt, 
	headsep=1cm,       
	footskip=0.75cm    % 确保页脚文字底端距离纸张下沿1.75cm
}

% ==================== 5. 页眉页脚 ====================
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\zihao{5}\songti 湘潭大学毕业论文} 
\fancyfoot[C]{\zihao{-5}\thepage} 
\renewcommand{\headrulewidth}{0pt}

% ==================== 6. 标题格式 ====================
\titleformat{\section}{\zihao{3}\bfseries\setfixedlinespacing}{\thesection}{1em}{}
\titlespacing{\section}{0pt}{24pt}{18pt}

\titleformat{\subsection}{\zihao{4}\bfseries\setfixedlinespacing}{\thesubsection}{1em}{}
\titlespacing{\subsection}{0pt}{24pt}{6pt}

\titleformat{\subsubsection}{\zihao{-4}\bfseries\setfixedlinespacing}{\thesubsubsection}{1em}{}
\titlespacing{\subsubsection}{0pt}{12pt}{6pt}

\titleformat{\paragraph}{\zihao{-4}\setfixedlinespacing}{\theparagraph}{1em}{}
\titlespacing{\paragraph}{0pt}{6pt}{6pt}

% ==================== 7. 目录设置 ====================
\setcounter{tocdepth}{3} 
\newcommand{\tableofcontentscustom}{
	\cleardoublepage
	\vspace*{24pt}
	\begin{center}
		{\zihao{3}\bfseries\setfixedlinespacing 目\hspace{2em}录} 
	\end{center}
	\vspace{18pt}
	\@starttoc{toc}
}
\titlecontents{section}[0em]{\zihao{4}\linespread{1.5}\selectfont}{\thecontentslabel\hspace{1em}}{}{\titlerule*[0.5pc]{.}\contentspage}
\titlecontents{subsection}[2em]{\zihao{-4}\linespread{1.5}\selectfont}{\thecontentslabel\hspace{1em}}{}{\titlerule*[0.5pc]{.}\contentspage}
\titlecontents{subsubsection}[4em]{\zihao{-4}\linespread{1.5}\selectfont}{\thecontentslabel\hspace{1em}}{}{\titlerule*[0.5pc]{.}\contentspage}

% ==================== 8. 图表标题 ====================
% 强制单倍行距，且使用加粗
\DeclareCaptionFont{xtucaption}{\zihao{5}\bfseries\linespread{1}\selectfont}
\DeclareCaptionLabelSeparator{space}{\ \ } 
\captionsetup{font={xtucaption}, labelsep=space, singlelinecheck=true}
\captionsetup[table]{skip=6pt, position=top}
\captionsetup[figure]{skip=12pt, position=bottom}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

\numberwithin{table}{section}
\numberwithin{figure}{section}
\numberwithin{equation}{section}

\newcommand{\tablenote}[1]{\vspace{0pt}{\zihao{-5}\setfixedlinespacing\setlength{\parindent}{2em}\noindent #1\par}}
\newcommand{\fignote}[1]{\vspace{6pt}{\zihao{-5}\setfixedlinespacing\setlength{\parindent}{2em}\noindent #1\par}}

% ==================== 9. 摘要与关键词 ====================
\newcommand{\chineseabstract}{
	\cleardoublepage
	\phantomsection
	\addcontentsline{toc}{section}{摘要}
	\begin{center}
		\vspace*{0pt}
		{\zihao{3}\bfseries\setfixedlinespacing 摘\hspace{2em}要}
	\end{center}
}
\newenvironment{abstractcn}{\vspace{0.5\baselineskip}\zihao{5}\setfixedlinespacing\setlength{\parindent}{2em}}{\vspace{0.5\baselineskip}}
\newcommand{\keywordscn}[1]{
	\par \vspace{\baselineskip} \setlength{\parindent}{2em} \indent
	{\zihao{-4}\bfseries 关键词：}{\zihao{5}\setfixedlinespacing #1}\par
}

\newcommand{\englishabstract}{
	\cleardoublepage
	\phantomsection
	\addcontentsline{toc}{section}{Abstract}
	\begin{center}
		\vspace*{0pt}
		{\zihao{3}\bfseries\setfixedlinespacing Abstract}
	\end{center}
}
\newenvironment{abstracten}{\vspace{0.5\baselineskip}\zihao{-4}\setfixedlinespacing\setlength{\parindent}{2em}}{\vspace{0.5\baselineskip}}
\newcommand{\keywordsen}[1]{
	\par \vspace{\baselineskip} \setlength{\parindent}{2em} \indent
	{\zihao{-4}\bfseries Key words:}{\zihao{-4}\setfixedlinespacing #1}\par
}

% ==================== 10. 参考文献 (重点修复) ====================
\newcommand{\references}{
	\cleardoublepage
	\phantomsection
	\addcontentsline{toc}{section}{参考文献}
	\begin{center}
		\vspace*{24pt}
		{\zihao{3}\bfseries\setfixedlinespacing 参考文献}
	\end{center}
	\vspace{18pt}
}

% 【修复】：不使用 linespread，直接强制 baselineskip 为 20pt
% 这等同于五号字的 1.5 倍行距效果 (10.5pt * 1.5 ≈ 16pt，20pt 略宽，视觉更佳且符合习惯)
\newenvironment{referencelist}{
	\zihao{5} % 先设置字号
	\setlength{\baselineskip}{20pt} % 再强制覆盖行距 (绝对值)
	\setlength{\parindent}{0pt}
	\setlength{\parskip}{0pt} 
}{\par}

% 保持悬挂缩进逻辑
\newcommand{\refitem}[2]{\noindent\ifnum#1<10\hangindent=0.6cm [#1]\ #2\par\else\ifnum#1<100\hangindent=0.74cm [#1]\ #2\par\else\hangindent=0.9cm [#1]\ #2\par\fi\fi\vspace{0pt}}

% ==================== 11. 致谢 ====================
\newcommand{\acknowledgement}{
	\cleardoublepage
	\phantomsection
	\addcontentsline{toc}{section}{致谢}
	\begin{center}
		\vspace*{24pt}
		{\zihao{3}\bfseries\setfixedlinespacing 致\hspace{2em}谢}
	\end{center}
	\vspace{18pt}
	\zihao{-4}\setfixedlinespacing\setlength{\parindent}{2em}
}

% ==================== 12. 附录与辅助 ====================
\newcommand{\appendixcustom}[1]{
	\cleardoublepage
	\phantomsection
	\addcontentsline{toc}{section}{#1}
	\vspace*{24pt}
	{\zihao{3}\bfseries\setfixedlinespacing #1} 
	\vspace{18pt}
	\par\zihao{-4}\setfixedlinespacing\setlength{\parindent}{2em}
}

\newcommand{\frontmatter}{\cleardoublepage\pagenumbering{Roman}\setcounter{page}{1}}
\newcommand{\mainmatter}{\cleardoublepage\pagenumbering{arabic}\setcounter{page}{1}\zihao{-4}\setfixedlinespacing}
\allowdisplaybreaks
\everydisplay{\setlength{\abovedisplayskip}{20pt}\setlength{\belowdisplayskip}{20pt}}
\AtBeginDocument{\zihao{-4}\setfixedlinespacing\setlength{\parindent}{2em}}

\endinput