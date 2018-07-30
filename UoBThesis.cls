\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UoBThesis}[2018/08/01 University of Bristol PhD Thesis Class]

\RequriePackage{ifpdf,ifxetex,ifluatex}
\iflualatex
	\pdfvariable minorversion 7
	\pdfvariable pageattr {/Group << /S /Transparency /I true /CS /DeviceRGB>>}
\else\ifpdf
	\pdfminorversion 7
	\pdfpageattr {/Group << /S /Transparency /I true /CS /DeviceRGB>>}
\fi\fi

%% PRELIMINARY DECLARATIONS
\LoadClass[11pt,paper=a4]{scrbook}


\usepackage{scrhack}
\usepackage{scrlayer-scrpage}
\usepackage{amsmath}
%\PassOptionsToPackage{pdfa}{hyperref}
\AfterPackage!{hyperref}{\usepackage{hyperxmp}}
\AfterPackage!{hyperref}{\usepackage[nameinlink]{cleveref}}
\AfterPackage!{hyperref}{\usepackage{bookmark}}

\ifluatex
   \RequirePackage {fontspec,microtype}
\else\ifxetex
   \RequirePackage {fontspec,microtype}
\else
   \RequirePackage [T1]{fontenc}
   \RequirePackage [utf8]{inputenc}
   \RequirePackage {libertinus}
   \RequirePackage [narrow]{Inconsolata}
\fi\fi

%\usepackage [protrusion=true,expansion]{microtype}
\usepackage {typearea,geometry}
\usepackage {needspace}

\usepackage {graphicx}
\DeclareGraphicsExtensions{.pdf,.png,.jpg}
\usepackage [nodisplayskipstretch]{setspace} %onehalfspacing or doublespacing are the options here
\setstretch{1.20}
\usepackage {xcolor}
\usepackage [final]{changes}
\usepackage {luatextra}
\usepackage {multicol}
\usepackage {multirow}
\usepackage {booktabs}
%\usepackage [begintext={``} , endtext={''},vskip={\topsep}]{quoting}
\usepackage {quoting}
\usepackage {tabu}
\PassOptionsToPackage{hyphens,obeyspaces,spaces}{url}
\usepackage {minted}
\usepackage {etoolbox}
\usepackage [version=4]{mhchem}
\usepackage {siunitx,numprint}
\ExplSyntaxOn
\cs_new_eq:NN \siunitx_table_collect_begin:Nn \__siunitx_table_collect_begin:Nn
\ExplSyntaxOff
\usepackage {enumitem}
\setlist{nosep}
\usepackage {varwidth}
%\usepackage [multiple]{footmisc} % added to allow proper formation of multiple consecutive footnote %incompatible with hyperref

\usepackage {float}
\usepackage {hyphenat}

\usepackage[mode=tex]{standalone}
\usepackage{xstring}

\newcommand{\includestandalonewithpath}[2][]{%
    \begingroup%
    \StrCount{#2}{/}[\matches]%
    \StrBefore[\matches]{#2}{/}[\datapath]%
    \includestandalone[#1]{#2}%
    \endgroup%
}

\floatplacement{figure}{t!}
\floatplacement{table}{t!}
\floatplacement{listing}{t!}

\usepackage {polyglossia}
\setdefaultlanguage[variant=british]{english}

\usepackage [english]{selnolig}
\usepackage [british,calc]{datetime2}
\DTMlangsetup[en-GB]{ord=raise}
\usepackage [autostyle,english=british]{csquotes}
\usepackage {caption,subcaption}
\usepackage {verse}
%\usepackage [british,iso]{isodate}

%\captionsetup[subfigure]{subrefformat=simple,labelformat=simple,listofformat=subsimple}
%\renewcommand\thesubfigure{(\alph{subfigure})}
\captionsetup{
	format        = hang,
	justification = centerlast,
    font          = small,
}
\captionsetup[listing]{skip=10pt}
\usepackage{xcolor} 
%\usepackage{titlesec,scalefnt}
\usepackage{scalefnt}
\usepackage{bytefield}
\usepackage{ragged2e}
\usepackage{relsize}
%\usepackage [smaller]{acronym}

\newcommand\TODO{{\color{red}\bfseries TODO}}
\usepackage{flafter} % places floats after they are first mentioned if possible
%\usepackage [draft]{hyperref}
\usepackage {hyperref}
\usepackage {algorithm}
\usepackage {algorithmicx}
\usepackage {algpseudocode} 
\defaultfontfeatures{Ligatures = {TeX}, Scale = {MatchLowercase}}
%\newfontfeature{Microtype}{protrusion=default;expansion=default;}
\setmainfont [Numbers = {Proportional,OldStyle}, BoldFont= * bold]{Minion Pro}
\setsansfont[Numbers = {Proportional,OldStyle}]{LibertinusSans}
\setmonofont[ItalicFont = *, ItalicFeatures = FakeSlant, RawFeature = -tlig;-trep, StylisticSet={1,3}]{Inconsolata zi4}
\usepackage {xfrac}
\newfontfamily\libertinelf{Minion Pro}[Numbers = {Proportional,Lining}, Ligatures = {TeX}, Scale = {MatchLowercase}]
\usepackage[math-style=TeX]{unicode-math}
%\setmathfont{Asana Math}
%\setmathfont{xits-math}
\setmathfont{Libertinus Math}
%\setmathfont{cambria-math}
% from http://tex.stackexchange.com/questions/47139/what-free-math-font-could-should-accompany-linux-libertine-and-linux-biolinum
% use Libertine for the letters
%\setmathfont[range=\mathit/{latin,Latin,num,Greek,greek}]{Libertinus Serif Italic}
%\setmathfont[range=\mathbfit/{latin,Latin,num,Greek,greek}]{Libertinus Serif Bold Italic}
%\setmathfont[range=\mathup/{latin,Latin,num,Greek,greek}, Numbers = {Proportional,Lining}]{Libertinus Serif}
%\setmathfont[range=\mathbfup/{latin,Latin,num,Greek,greek}]{Libertinus Serif Bold}
%\setmathfont[range={"2202}]{Linux Libertine O}% "02202 = \partial % doesn't work
%\setmathfont[range={"221E}]{Linux Libertine O}% "0221E = \infty
% etc. (list should be completed depending on needs)


%\usepackage{bookmark}
%\usepackage{titlesec}
%\usepackage{interfaces-base}
%\LoadInterface{titlesec,bookmark}

\usepackage{pgfplotstable}
%\usepackage{tikz}
\pgfplotsset{compat=newest}
\usetikzlibrary{external,arrows,calc}
\tikzset{external/system call={lualatex \tikzexternalcheckshellescape -shell-escape -halt-on-error -interaction=batchmode -jobname "\image" "\texsource"}}
%\tikzexternalize[prefix=figures/]

\KOMAoptions{
    fontsize      = 11pt,
    numbers       = noendperiod,
    parskip       = half-,
    twoside,
	%draft,
	captions      = tableheading,
%	toc           = listofnumbered,
	listof        = leveldown,
	chapterprefix = true,
%	DIV           = calc,
	BCOR          = 7mm,
}
\recalctypearea
\pagestyle{scrheadings}
%\ofoot{}
\ofoot{\pagemark}
\setuptoc{toc}{numbered}
%\setcounter{secnumdepth}{3}
% customize dictum format:
\setkomafont{dictumtext}{\itshape\small}
\setkomafont{dictumauthor}{\normalfont}
\renewcommand*\dictumwidth{.8\linewidth}
\renewcommand*\dictumauthorformat[1]{--- #1}
\renewcommand*\dictumrule{}

%\crefname{algocf}{alg.}{algs.}
%\Crefname{algocf}{Algorithm}{Algorithms}

\renewcommand*{\hyxmp@pdfa@id@schema}{%
  \ifHy@pdfa
    \hyxmp@add@to@xml{%
______<rdf:Description rdf:about=""^^J%
____________xmlns:pdfaid="http://www.aiim.org/pdfa/ns/id/">^^J%
    }%
    \hyxmp@add@simple{pdfaid:part}{2}%
    \hyxmp@add@simple{pdfaid:conformance}{B}%
    \hyxmp@add@to@xml{%
______</rdf:Description>^^J%
    }%
  \fi
}

\hypersetup {
	hidelinks,
	breaklinks,
	linktocpage        = true,
	unicode            = true,
%	hyperfootnotes     = true,
	bookmarksnumbered  = true,
	bookmarksopen      = true,
	pdfdisplaydoctitle = true,
%	pdfpagelabels      = false,
	plainpages         = false,
%	pdfusetitle,
	pdfauthor          = {\@author},
	pdftitle           = {\@title},
	pdfsubject         = {PhD Thesis},
	pdfkeywords        = {},
	pdflang            = en-GB,
	pdfencoding        = auto,
	pdfduplex          = DuplexFlipLongEdge,
	pdfprintscaling    = None,
%	draft,
%	pdflicenseurl      = {http://creativecommons.org/licenses/by-nc-nd/4.0/},
%	pdfcopyright       = {Copyright (C) 2015, Emma L. Tonkin},
	pdfdate            = {2015-01-06},
}

\bookmarksetup{%
	open,
	addtohook={%
		\ifnum\bookmarkget{level}=0 %chapter
			\bookmarksetup{bold}
		\fi
%		\ifnum\bookmarkget{level}=1 %section
%			\bookmarksetup{}
%		\fi
		\ifnum\bookmarkget{level}=2 %subsection
			\bookmarksetup{italic}
		\fi
%		\ifnum\bookmarkget{level}=3 %subsubsection
%			\bookmarksetup{italic}
%		\fi
	}
}

\usepackage[
    type          = {CC},
    modifier      = {by},
    imagemodifier = {-eu},
    version       = {4.0},
]{doclicense}

\sisetup{
	group-separator = {,},
	group-digits = integer,
	detect-all = true,
	number-text-rm = \libertinelf,
	unit-text-rm = \libertinelf,
	text-rm = \libertinelf,
	range-units = single,
}


\usepackage[backend=biber,natbib=true]{biblatex}
\ExecuteBibliographyOptions{
    sorting      = none,
    backref      = true,
    alldates     = comp,
    firstinits   = true,
    uniquename   = init,
%   dashed       = false,
    maxnames     = 1,
    minnames     = 1,
    maxbibnames  = 4,
    minbibnames  = 2,
	ibidtracker  = true,
	block        = space,
	eprint       = false,
	defernumbers = true,
}
\DeclareNameAlias{default}{last-first}
\setcounter{biburlnumpenalty}{100}
\addto\bibfont{\smaller} % makes bibliography font smalled as per typography guidelines
\addbibresource{bibliography.bib}
\addbibresource{mypublications.bib}
\DeclareSourcemap{
  \maps[datatype=bibtex]{
     \map{
        \step[fieldsource=doi,final]
        \step[fieldset=url,null]
        }
      }
}
% The following definition is copied from authortitle.bbx/authoryear.bbx
\defbibenvironment{nolabelbib}
  {\list
     {}
     {\setlength{\leftmargin}{\bibhang}%
      \setlength{\itemindent}{-\leftmargin}%
      \setlength{\itemsep}{\bibitemsep}%
      \setlength{\parsep}{\bibparsep}}}
  {\endlist}
  {\item}
%\setlength{\oddsidemargin}{0.9in}
%\setlength{\evensidemargin}{0in}


% Add accessibility functions with pdf (>v1.5)
\usepackage {accsupp}
% declare function to hide text from selection in pdf, used for the draft
% watermark and linenos in listing
\DeclareRobustCommand\squelch[1]{%
  \BeginAccSupp{method=plain,ActualText={}}#1\EndAccSupp{}%
}


%\renewcommand{\em}{\itshape}
\newcommand*\ac[1]{\textsmaller{#1}}
%\AtBeginEnvironment{tabu}{%
%  \libertinelf}
 %\addfontfeature{Numbers={Monospaced,Lining}}
 %}

\BeforeBeginEnvironment{minted}{\begin{singlespace}}
\AfterEndEnvironment{minted}{\end{singlespace}}
\renewcommand{\theFancyVerbLine}{
  \fontspec[Numbers = {Lining,Monospaced}]{Libertinus Serif}\color[rgb]{0.5,0.5,0.5}\scriptsize\squelch{\arabic{FancyVerbLine}}}

\usemintedstyle{bw}

\setminted{
	frame        = lines,
	framesep     = 2mm,
	linenos      = true,
	numbersep    = 5pt,
%	gobble       = 2,
	fontsize     = \footnotesize,
	xleftmargin  = 20pt,
	xrightmargin = 20pt,
	tabsize      = 3
}

\makeatletter
\g@addto@macro{\UrlBreaks}{\UrlOrds}
\g@addto@macro\UrlSpecials{%
  \do\`{\mbox{\UrlFont\char`\`}}%
  \do\'{\mbox{\UrlFont\char`\'}}%
  \do\"{\mbox{\UrlFont\char`\"}}%
  \do\l{\mbox{\UrlFont\char`\l}}%
  \do\0{\mbox{\UrlFont\char`\0}}%
}
\makeatother

%\patchcmd{\@afterheading}%
%    {\clubpenalty \@M}{\clubpenalties 3 \@M \@M 0}{}{}
%\patchcmd{\@afterheading}%
%    {\clubpenalty \@clubpenalty}{\clubpenalties 2 \@clubpenalty 0}{}{}
%

\let\slashold\slash
\def\slash{\texorpdfstring{\slashold }{/}}

% defining \lb command to emulate the gb4e package command
% use as \lb{label} word]
\newcommand\lb[1]{\hskip 0pt plus 1pt[\textsubscript{\tiny #1}}

%\everymath{\displaystyle}

% to allow multiple consecutive footnotes
% as described in http://tex.stackexchange.com/a/62091/24263

\let\oldFootnote\footnote
\newcommand\nextToken\relax

\renewcommand\footnote[1]{%
    \oldFootnote{#1}\futurelet\nextToken\isFootnote}

\newcommand\isFootnote{%
    \ifx\footnote\nextToken\textsuperscript{,}\fi}


