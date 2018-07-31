% vim: ft=tex ts=4 sw=4 et

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UoBThesis}[2018/08/01 University of Bristol PhD Thesis Class]

\newif\ifuob@cclicense\uob@cclicensefalse
\DeclareOption{cclicense}{\uob@cclicensetrue}
\newif\ifuob@minted\uob@mintedfalse
\DeclareOption{minted}{\uob@mintedtrue}
\ProcessOptions\relax

\RequirePackage{ifpdf,ifxetex,ifluatex}
\ifluatex
	\pdfvariable minorversion 7
	\pdfvariable pageattr {/Group << /S /Transparency /I true /CS /DeviceRGB>>}
    \pdfextension catalog{%
        /OutputIntents [ <<
        /Type /OutputIntent
        /S/GTS_PDFA2
        /DestOutputProfile \the\numexpr\pdffeedback lastobj\relax\space 0 R
        /OutputConditionIdentifier (eciRGB v2)
        /Info(eciRGB v2)
        >> ]
    }
    %\RequirePackage[2015/01/01]{latexrelease}

\else\ifpdf
	\pdfminorversion 7
	\pdfpageattr {/Group << /S /Transparency /I true /CS /DeviceRGB>>}
\fi\fi

%% PRELIMINARY DECLARATIONS
\LoadClass{scrbook}


\RequirePackage{scrhack}
\RequirePackage{scrlayer-scrpage}
\RequirePackage{amsmath}
%\PassOptionsToPackage{pdfa}{hyperref}
\AfterPackage!{hyperref}{\RequirePackage{hyperxmp}}
\AfterPackage!{hyperref}{\RequirePackage[nameinlink]{cleveref}}
\AfterPackage!{hyperref}{\RequirePackage{bookmark}}

\ifluatex
% Loading LuaTeX spefic packages
    \RequirePackage {fontspec,microtype}
    \defaultfontfeatures{Ligatures = {TeX}, Scale = {MatchLowercase}}
    \setmainfont {Libertinus Serif}[
        Numbers = {Proportional,OldStyle},
        BoldFont= * bold ]
    \setsansfont {LibertinusSans}[
        Numbers = {Proportional,OldStyle} ]
    \setmonofont {Inconsolata zi4}[
        ItalicFont = *,
        ItalicFeatures = FakeSlant,
        RawFeature = -tlig;-trep,
        StylisticSet={1,3} ]
    \newfontfamily\libertinelf{Libertinus Serif}[
        Numbers = {Proportional,Lining},
        Ligatures = {TeX},
        Scale = {MatchLowercase} ]
    \RequirePackage[math-style=TeX]{unicode-math}
    \setmathfont{Libertinus Math}

    \RequirePackage {polyglossia}
    \setdefaultlanguage[variant=british]{english}
    \RequirePackage [english]{selnolig}
    \RequirePackage {luatextra}
%
\else\ifxetex
% Loading XeTeX specific packages
    \RequirePackage {fontspec,microtype}
    \defaultfontfeatures{Ligatures = {TeX}, Scale = {MatchLowercase}}
    \setmainfont {Libertinus Serif}[
        Numbers = {Proportional,OldStyle},
        BoldFont= * bold ]
    \setsansfont {Libertinus Sans}[
        Numbers = {Proportional,OldStyle} ]
    \setmonofont {Inconsolata zi4}[
        ItalicFont = *,
        ItalicFeatures = FakeSlant,
        RawFeature = -tlig;-trep,
        StylisticSet={1,3} ]
    \newfontfamily\libertinelf{Libertinus Serif}[
        Numbers = {Proportional,Lining},
        Ligatures = {TeX},
        Scale = {MatchLowercase} ]
    \RequirePackage[math-style=TeX]{unicode-math}
    \setmathfont{Libertinus Math}

    \RequirePackage {polyglossia}
    \setdefaultlanguage[variant=british]{english}
\else
   \RequirePackage [T1]{fontenc}
   \RequirePackage [utf8]{inputenc}
   \RequirePackage {libertine}
   \RequirePackage {libertinust1math}
   \RequirePackage [narrow,varqu,varl]{inconsolata}
   \RequirePackage [british]{babel}
\fi\fi

%\RequirePackage [protrusion=true,expansion]{microtype}
\RequirePackage {typearea,geometry}
\RequirePackage {needspace}

\RequirePackage {graphicx}
\graphicspath{{Images}}
\DeclareGraphicsExtensions{.pdf,.png,.jpg}
\RequirePackage [nodisplayskipstretch]{setspace} %onehalfspacing or doublespacing are the options here
%\setstretch{1.20}
\RequirePackage {xcolor}
\RequirePackage [final]{changes}
\RequirePackage {multicol}
\RequirePackage {multirow}
\RequirePackage {booktabs}
%\RequirePackage [begintext={``} , endtext={''},vskip={\topsep}]{quoting}
\RequirePackage {quoting}
\RequirePackage {tabu}
\PassOptionsToPackage{hyphens,obeyspaces,spaces}{url}
\RequirePackage {etoolbox}
\RequirePackage [version=4]{mhchem}
\RequirePackage {siunitx,numprint}
\ExplSyntaxOn
\cs_new_eq:NN \siunitx_table_collect_begin:Nn \__siunitx_table_collect_begin:Nn
\ExplSyntaxOff
\RequirePackage [inline]{enumitem}
\setlist{nosep}
\RequirePackage {varwidth}
%\RequirePackage [multiple]{footmisc} % added to allow proper formation of multiple consecutive footnote %incompatible with hyperref

\RequirePackage {float}
\RequirePackage {hyphenat}

\RequirePackage[mode=tex]{standalone}
\RequirePackage{xstring}

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

\RequirePackage {xfrac}

\RequirePackage [british,calc]{datetime2}
\DTMlangsetup[en-GB]{ord=raise}
\RequirePackage [autostyle,english=british]{csquotes}
\RequirePackage {caption,subcaption}
\RequirePackage {verse}
%\RequirePackage [british,iso]{isodate}

%\captionsetup[subfigure]{subrefformat=simple,labelformat=simple,listofformat=subsimple}
%\renewcommand\thesubfigure{(\alph{subfigure})}
\captionsetup{
	format        = hang,
	justification = centerlast,
    font          = small,
}
\captionsetup[listing]{skip=10pt}
\RequirePackage{xcolor} 
%\RequirePackage{titlesec,scalefnt}
\RequirePackage{scalefnt}
\RequirePackage{bytefield}
\RequirePackage{ragged2e}
\RequirePackage{relsize}
%\RequirePackage [smaller]{acronym}

\newcommand\TODO{{\color{red}\bfseries TODO}}
\RequirePackage{flafter} % places floats after they are first mentioned if possible
%\RequirePackage [draft]{hyperref}
\RequirePackage {hyperref}
\RequirePackage {algorithm}
\RequirePackage {algorithmicx}
\RequirePackage {algpseudocode} 
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


%\RequirePackage{bookmark}
%\RequirePackage{titlesec}
%\RequirePackage{interfaces-base}
%\LoadInterface{titlesec,bookmark}

\RequirePackage{pgfplotstable}
%\RequirePackage{tikz}
\pgfplotsset{compat=newest}
\usetikzlibrary{external,arrows,calc}
\ifluatex
\tikzset{external/system call={lualatex \tikzexternalcheckshellescape -shell-escape -halt-on-error -interaction=batchmode -jobname "\image" "\texsource"}}
\fi
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
    listof        = totoc,
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
%	pdfdate            = {2015-01-06},
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

\RequirePackage[
    type          = {CC},
    modifier      = {by},
    imagemodifier = {-eu},
    version       = {4.0},
]{doclicense}

\sisetup{
	group-separator = {,},
	group-digits = integer,
	detect-all = true,
	range-units = single,
}
\ifluatex
    \sisetup{
        number-text-rm = \libertinelf,
        unit-text-rm = \libertinelf,
        text-rm = \libertinelf,
    }
\fi


\RequirePackage[backend=biber,natbib=true]{biblatex}
\ExecuteBibliographyOptions{
    sorting      = none,
    backref      = true,
    alldates     = comp,
    giveninits   = true,
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
\RequirePackage {accsupp}
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

\ifx\uob@minted {
    \RequirePackage {minted}
    \BeforeBeginEnvironment{minted}{\begin{singlespace}}
    \AfterEndEnvironment{minted}{\end{singlespace}}
    \renewcommand{\theFancyVerbLine}{
    \ifluatex
        \fontspec[Numbers = {Lining,Monospaced}]{Libertinus Serif}
    \fi
    \color[rgb]{0.5,0.5,0.5}\scriptsize\squelch{\arabic{FancyVerbLine}}
    }

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
}
\fi

\g@addto@macro{\UrlBreaks}{\UrlOrds}
\g@addto@macro\UrlSpecials{%
  \do\`{\mbox{\UrlFont\char`\`}}%
  \do\'{\mbox{\UrlFont\char`\'}}%
  \do\"{\mbox{\UrlFont\char`\"}}%
  \do\l{\mbox{\UrlFont\char`\l}}%
  \do\0{\mbox{\UrlFont\char`\0}}%
}

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

\let\oldfrontmatter\frontmatter
\renewcommand\frontmatter{\oldfrontmatter \singlespacing}
\let\oldmainmatter\mainmatter
\renewcommand\mainmatter{\oldmainmatter \onehalfspacing}
\let\oldbackmatter\backmatter
\renewcommand\backmatter{\oldbackmatter \singlespacing}

\setkomafont{title}{\fontsize{25}{25}\sffamily\bfseries}
\newcommand{\@supervisor}{}
\newcommand{\supervisor}[1]{\gdef\@supervisor{#1}}
\newkomafont{supervisor}{\normalfont\normalsize}
%
\newcommand{\@degree}{}
\newcommand{\Degree}[1]{\gdef\@degree{#1}}
\newkomafont{degree}{\normalfont\bfseries\normalsize}
%
\newcommand{\@faculty}{}
\newcommand{\faculty}[1]{\gdef\@faculty{#1}}
\newkomafont{faculty}{\normalfont\normalsize}
%
\newcommand{\@school}{}
\newcommand{\school}[1]{\gdef\@school{#1}}
\newkomafont{school}{\normalfont\normalsize}
%
\newcommand*{\@submitted}{}
\newcommand*{\submitted}[1]{\gdef\@submitted{#1}}
\newkomafont{submitted}{\normalfont\bfseries\large}
%
\newcommand*{\@wordcount}{}
\newcommand*{\wordcount}[1]{\gdef\@wordcount{#1}}
\newkomafont{wordcount}{\normalfont\normalsize}
%
%\newcommand*{\@thanksnote}{}
%\newcommand*{\thanksnote}[1]{\gdef\@thanksnote{#1}}
%\newkomafont{thanksnote}{\small\itshape}
%\newcommand{\@@thanksnote}{\begin{minipage}{\linewidth}
%\usekomafont{thanksnote}\@thanksnote\par\end{minipage}\par}
\newcommand*{\@abstract}{}
\newcommand*{\abstract}[1]{\gdef\@abstract{#1}}
\newkomafont{abstract}{\normalfont\normalsize}

\newcommand*{\@acknowledgements}{}
\newcommand*{\acknowledgements}[1]{\gdef\@acknowledgements{#1}}
\newkomafont{acknowledgements}{\normalfont\normalsize}

\renewcommand{\maketitle}{%
    \begin{titlepage}
        \newgeometry{textwidth=.80\textwidth}
%\begin{ddcenter}
% Title
        \centering
        \vspace*{2cm} 

        \begin{varwidth}{\textwidth}
            \centering
            \usekomafont{title}\@title\par
        \end{varwidth}

        \vspace{1cm}
        {\usekomafont{author}\centering \@author\par}
%
%
%% University Crest
\vspace{3cm}
{\centering\includegraphics[width=.5\textwidth]{Images/Bristol-uni-logo-colour}}
\vspace{3cm}

%% Declaration
A dissertation submitted to the \mbox{University of Bristol} in accordance with the
requirements for award of the degree of {\usekomafont{degree}\@degree} in the
\mbox{\@faculty}, \mbox{\@school}.

% Date of submission
\vspace{1cm}
\ifx\@submitted\@empty
    {\usekomafont{submitted}\today\par}
\else
    {\usekomafont{submitted}\DTMdate{\@submitted}\par}
\fi

\ifx\@wordcount\@empty \else 
    \vspace*{\fill}
    {\usekomafont{wordcount}\raggedleft Word count: \num{\@wordcount} words\par}
    %%\input{wordcount/wordcount} words
\fi
%%\end{center}
%\vspace*{\fill}
\end{titlepage}
\restoregeometry
%
\ifuob@cclicense
    \newpage
    \vspace*{\fill}
    \doclicenseThis
\fi

\ifx\@abstract\@empty \else {
    \chapter{Abstract}

    \@abstract\par
}
\fi

% Taken from the PGR code annex 4: http://www.bristol.ac.uk/academic-quality/pg/pgrcode/annex4/
\chapter{Author's Declaration}

I declare that the work in this thesis was carried out in accordance with the
requirements of the University's \textit{Regulations and Code of Practice for
Research Degree Programmes} and that it has not been submitted for any other
academic award.

Except where indicated by specific reference in the text, the work is the
candidate's own work. Work done in collaboration with, or with the assistance
of, others, is indicated as such.

Any views expressed in the thesis are those of the author.

\vspace{3\parskip}
\@author\par
\vspace{4\parskip}

SIGNED:~\makebox[55mm]{\dotfill}\hfill DATE:~\makebox[55mm]{\dotfill}
% End of author's declaration


% Place acknowledgements in its own chapter if it is defined
\ifx\@acknowledgements\@empty \else {
    \chapter{Acknowledgements}

    \@acknowledgements\par
}
\fi

}

