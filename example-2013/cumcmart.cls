%% This class is based on the class "ctexart" with options a4paper, oneside and 12pt.
%% The draft mode is defined, in which the package refcheck will take effect.
%% No more options are allowed.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cumcmart}
\newif\if@withoutcover%
\@withoutcovertrue%
\LoadClass[c4size,openany,UTF8]{ctexart}
\DeclareOption{nocover}{\@withoutcoverfalse}
\ProcessOptions

\RequirePackage{bbding}
\RequirePackage{url}
\RequirePackage{fancyhdr,booktabs}
\RequirePackage{graphicx,paralist}
\RequirePackage{amsmath,amssymb}
\RequirePackage{fancybox,ifpdf}
\RequirePackage[dvipsnames,svgnames,x11names]{xcolor}
\allowdisplaybreaks[4]

\ifpdf
    \RequirePackage{CJKpunct}
	\punctstyle{kaiming}
\else
    \RequirePackage{CJKpunct}
	\punctstyle{kaiming}
\fi

\newtoks\xuanti
\newtoks\numbers
\newtoks\school
\newtoks\authorone
\newtoks\authortwo
\newtoks\authorthree
\newtoks\advisor
\newtoks\theday

\renewcommand\contentsname{\centering \ziju{2}目录}

%------------------------ Page layout ----------------------------------

%\topmargin=-15.4mm
%\oddsidemargin=-0.4mm
%\evensidemargin=-0.4mm
%\textwidth=160mm
%\textheight=247mm

\RequirePackage[a4paper,left=2.5cm,top=2.5cm,bottom=2.5cm,right=2.5cm]{geometry}
\def\maketitle{%
  \null%
  \leavevmode
  \if@withoutcover%
  \input{declaration}
  \newpage%
  \fi%
  \null%
  \thispagestyle{empty}%
  \setcounter{page}{1}%
  \begin{center}%
     {\heiti\zihao{-2} \@title \par}%
  \end{center}%
  \vspace{2em}\par
  }

%------------------------ Abstract & Keywords -------------------------
\newcommand\cnabstractname{\ziju{2}摘要}
\newcommand\enabstractname{ABSTRACT}
\newcommand\cnkeywords[1]{\bigskip\noindent{\heiti\zihao{-4}\cnkeywordsname：\ #1}}
\newcommand\cnkeywordsname{关键词}
\newcommand\enkeywords[1]{\bigskip\noindent{\bfseries\zihao{-4}\enkeywordsname：#1}}
\newcommand\enkeywordsname{Key words}

\newenvironment{cnabstract}{%
    \begin{center}{\zihao{4}\heiti \cnabstractname}\end{center}\vspace{.5em}
    \songti\zihao{-4}%
    \@afterheading}
    {\par}

%------------------------ sections -------------------------

\renewcommand\section{\renewcommand{\@seccntformat}[1]{%
   \zihao{4}\csname thesection\endcsname \hspace{0.8em}}
   \@startsection{section}{2}{\z@}%  {name}{depth}{}
                {3.5ex \@plus 1ex \@minus .2ex}% positive->leave parindent
                {2.3ex \@plus.2ex}%
                {\reset@font\fontsize{13.75pt}{\baselineskip}\sectionformat}}
\renewcommand\thesection{\chinese{section}}
\newcommand\sectionformat{\zihao{4}\bfseries\selectfont\centering}

%----------------------subsection---------------------------
\renewcommand\subsection{\renewcommand{\@seccntformat}[1]{%
   \zihao{-4}\heiti\csname thesubsection\endcsname \hspace{0.5em}}
\@startsection
{subsection}{2}{\z@}% {name}{depth}{}
{1.75ex \@plus.5ex \@minus .1ex}% leave parindent
{1.15ex \@plus.1ex}%
{\reset@font\normalsize\bfseries\subsectionformat}}
\renewcommand\thesubsection{\arabic{section}.\arabic{subsection}}
\newcommand\subsectionformat{\zihao{4}\bfseries\selectfont}

\renewcommand\subsubsection{\renewcommand{\@seccntformat}[1]{%
   \zihao{-4}\heiti\csname thesubsubsection\endcsname \hspace{0.5em}}
\@startsection{subsubsection}{2}{\z@}% {name}{depth}{}
{1.75ex \@plus.5ex \@minus .1ex}% leave parindent
{1.15ex \@plus.1ex}%
{\reset@font\normalsize\bfseries\subsubsectionformat}}
\renewcommand\thesubsubsection{\thesubsection.\arabic{subsubsection}}
\newcommand\subsubsectionformat{\zihao{-4}\bfseries\selectfont}


%----------------------heading---------------------------
\fancypagestyle{plain}{%
\fancyhf{} %clear all header and footer fields
\fancyfoot[C]{\thepage} % except the center
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}}
%----------------------- Theorems ---------------------------
\newtheorem{theorem}{{定理}}
\newtheorem{proposition}{{命题}}
\newtheorem{lemma}{{引理}}
\newtheorem{corollary}{{推论}}[theorem]
\newtheorem{definition}{{定义}}
\newtheorem{example}{{例}}
\AtBeginDocument{%
   \pagestyle{plain}%
   }
\endlinechar `\^^M
\endinput
