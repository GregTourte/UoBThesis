%
% UoB-Thesis/UoBThesis.cls
%
% Developed by Greg Tourte <artourter@gmail.com>
% Copyright (c) 2018 The University of Bristol
% All rights reserved.
%
% Changelog:
% 30/07/2018 - created
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UoBThesis}[2018/08/01 University of Bristol PhD Thesis Class]


\RequirePackage{iftex,ifpdf,ifxetex,ifluatex}
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

\else\ifpdf
    \pdfminorversion 7
    \pdfpageattr {/Group << /S /Transparency /I true /CS /DeviceRGB>>}
\fi\fi

%% PRELIMINARY DECLARATIONS
\LoadClass[version=last]{scrbook}

\input{UoBThesis.inc}

\ifuob@print
    \ifluatex
        \pdfvariable minorversion 4
    \else\ifpdf
        \pdfminorversion 4
    \fi\fi
\fi

    
\RequirePackage{scrhack}
\RequirePackage{scrlayer-scrpage}
\RequirePackage{mathtools}
%\PassOptionsToPackage{pdfa}{hyperref}
\ifuob@print\else
    \AfterPackage!{hyperref}{\RequirePackage{bookmark}}
    \AfterPackage!{hyperref}{\RequirePackage{hyperxmp}}
\fi
\AfterPackage!{hyperref}{\RequirePackage[nameinlink]{cleveref}}

\ifluatex
% Loading LuaTeX spefic packages
    \RequirePackage {fontspec,microtype}
    \defaultfontfeatures{Ligatures = {TeX}, Scale = {MatchLowercase}}
    \ifuob@minionthree
        \setmainfont {Minion 3}[
            Numbers      = {Proportional,OldStyle},
            SizeFeatures = {
                { Size   = -9, Font = Minion 3 Caption},
                { Size   = 9-14 },
                { Size   = 14-24, Font = Minion 3 Subhead},
                { Size   = 24-, Font = Minion 3 Display},
            },
            BoldFont     = * Semibold,
            ItalicFont   = * Italic,
        ]
        \newfontfamily\liningroman{Minion3}[
            Numbers = {Proportional,Lining},
            Ligatures = {TeX},
            Scale = {MatchLowercase} ]
    \else\ifuob@minion
        \setmainfont {Minion Pro}[
            Numbers = {Proportional,OldStyle},
            BoldFont= * bold,
        ]
        \newfontfamily\liningroman{Minion Pro}[
            Numbers = {Proportional,Lining},
            Ligatures = {TeX},
            Scale = {MatchLowercase} ]
    \else
        \setmainfont {Libertinus Serif}[
            Numbers = {Proportional,OldStyle},
            BoldFont= * bold ]
        \newfontfamily\liningroman{Libertinus Serif}[
            Numbers = {Proportional,Lining},
            Ligatures = {TeX},
            Scale = {MatchLowercase} ]
    \fi\fi
    \setsansfont {LibertinusSans}[
        Numbers = {Proportional,OldStyle} ]
    \setmonofont {InconsolataN}[
        ItalicFont = *,
        ItalicFeatures = FakeSlant,
        RawFeature = -tlig;-trep,
        StylisticSet={1,3} ]
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
    \setmonofont {InconsolataN}[
        ItalicFont = *,
        ItalicFeatures = FakeSlant,
        RawFeature = -tlig;-trep,
        StylisticSet={1,3} ]
    \newfontfamily\liningroman{Libertinus Serif}[
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

\RequirePackage {needspace}

\RequirePackage {graphicx}
\graphicspath{{Images}}
\DeclareGraphicsExtensions{.pdf,.png,.jpg}
\RequirePackage [nodisplayskipstretch]{setspace} %onehalfspacing or doublespacing are the options here
%\setstretch{1.20}
\RequirePackage {xcolor}
%\RequirePackage [final]{changes}
\RequirePackage {multicol}
\RequirePackage {multirow}
\RequirePackage {booktabs}
%\RequirePackage [begintext={``} , endtext={''},vskip={\topsep}]{quoting}
\RequirePackage {quoting}
\RequirePackage {tabu}
\PassOptionsToPackage{hyphens,obeyspaces,spaces}{url}
\RequirePackage {etoolbox}
\RequirePackage [version=4]{mhchem}
\ifPDFTeX\else 
    \mhchemoptions{%
        textfontcommand = \addfontfeature{Numbers = {Lining, Monospaced}, RawFeature = {-onum,-pnum,+tnum}},%
    }
\fi

\RequirePackage {siunitx}
\ExplSyntaxOn
\cs_new_eq:NN \siunitx_table_collect_begin:Nn \__siunitx_table_collect_begin:Nn
\ExplSyntaxOff
\RequirePackage [inline]{enumitem}
\setlist{nosep}
\RequirePackage {varwidth}

\RequirePackage {float}

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

%\captionsetup[subfigure]{subrefformat=simple,labelformat=simple,listofformat=subsimple}
%\renewcommand\thesubfigure{(\alph{subfigure})}
\captionsetup{
    format        = hang,
%   justification = centerlast,
    font          = small,
    width         = .75\linewidth,
}
\captionsetup[listing]{skip=10pt}
\RequirePackage{ragged2e}
\RequirePackage{relsize}

% Load glossaries package and our custom glossaries style.
\RequirePackage[acronyms,shortcuts,hyperfirst=false,nomain,toc,section=section]{glossaries}
\RequirePackage{glossaries-UoB}

\newcommand\TODO{{\color{red}\bfseries TODO}}
\RequirePackage{flafter} % places floats after they are first mentioned if possible
\ifuob@print
    \RequirePackage [bookmarks=false]{hyperref}
\else
    \RequirePackage {hyperref}
\fi
\RequirePackage {algorithm}
\RequirePackage {algorithmicx}
\RequirePackage {algpseudocode} 
%\setmathfont{cambria-math}

\RequirePackage{pgfplotstable}
\pgfplotsset{compat=newest}
\usetikzlibrary{external,arrows,calc}
\ifluatex
\tikzset{external/system call={lualatex \tikzexternalcheckshellescape -shell-escape -halt-on-error -interaction=batchmode -jobname "\image" "\texsource"}}
\fi
%\tikzexternalize[prefix=figures/]

\KOMAoptions{
    fontsize      = 12pt,
    numbers       = noendperiod,
    parskip       = half-,
    twoside       = semi,
    %draft,
    captions      = tableheading,
%   toc           = listofnumbered,
    listof        = leveldown,
    listof        = totoc,
    chapterprefix = true,
    DIV           = 11,
%   BCOR          = 7mm,
    titlepage     = firstiscover,
    footinclude   = false,
    headinclude   = false,
}

\recalctypearea
\ofoot[]{}
\cfoot[\pagemark]{\pagemark}
\pagestyle{scrheadings}
\setuptoc{toc}{numbered}
%\setcounter{secnumdepth}{3}

% customize dictum format:
\setkomafont{dictumtext}{\itshape\small}
\setkomafont{dictumauthor}{\normalfont}
\renewcommand*\dictumwidth{.8\linewidth}
\renewcommand*\dictumauthorformat[1]{--- #1}
\renewcommand*\dictumrule{}

\ifuob@print\else
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
\fi

{
    \DTMsetstyle{pdf}
    \ifx\@submitted\@empty
        \protected@edef\uob@pdfdate{\today 120000}
    \else
        \protected@edef\uob@pdfdate{\DTMdate{\@submitted}120000}
    \fi
}
\hypersetup {
    hidelinks,
    breaklinks,
    linktocpage        = true,
    unicode            = true,
%   hyperfootnotes     = true,
    bookmarksnumbered  = true,
    bookmarksopen      = true,
    pdfdisplaydoctitle = true,
%   pdfpagelabels      = false,
    plainpages         = false,
%   pdfusetitle,
    pdfauthor          = {\@author},
    pdftitle           = {\@title},
    pdfsubject         = {PhD Thesis},
    pdfkeywords        = {},
    pdflang            = en-GB,
    pdfencoding        = auto,
    pdfduplex          = DuplexFlipLongEdge,
    pdfprintscaling    = None,
%   draft,
%   pdflicenseurl      = {http://creativecommons.org/licenses/by-nc-nd/4.0/},
%   pdfcopyright       = {Copyright (C) 2015, Emma L. Tonkin},
%    pdfinfo            = {
%        CreationDate    = {\uob@pdfdate},
%    }
}
\ifuob@print\hypersetup{draft}\fi

\ifuob@print\else
\bookmarksetup{%
    open,
    addtohook={%
        \ifnum\bookmarkget{level}=0 %chapter
            \bookmarksetup{bold}
        \fi
%       \ifnum\bookmarkget{level}=1 %section
%           \bookmarksetup{}
%       \fi
        \ifnum\bookmarkget{level}=2 %subsection
            \bookmarksetup{italic}
        \fi
%       \ifnum\bookmarkget{level}=3 %subsubsection
%           \bookmarksetup{italic}
%       \fi
    }
}
\fi

\RequirePackage[
    type          = {CC},
    modifier      = {by},
    imagemodifier = {-eu},
    version       = {4.0},
]{doclicense}

\sisetup{
%   group-separator = {,},
    group-digits = integer,
    detect-all   = true,
    range-units  = single,
}
\ifluatex
    \sisetup{
        number-text-rm = \liningroman,
        unit-text-rm   = \liningroman,
        text-rm        = \liningroman,
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
%\defbibenvironment{nolabelbib}
%  {\list
%     {}
%     {\setlength{\leftmargin}{\bibhang}%
%      \setlength{\itemindent}{-\leftmargin}%
%      \setlength{\itemsep}{\bibitemsep}%
%      \setlength{\parsep}{\bibparsep}}}
%  {\endlist}
%  {\item}
%\setlength{\oddsidemargin}{0.9in}
%\setlength{\evensidemargin}{0in}

\ifluatex\RequirePackage{realscripts}\fi
% Add accessibility functions with pdf (>v1.5)
\RequirePackage {accsupp}
% declare function to hide text from selection in pdf, used for the draft
% watermark and linenos in listing
\DeclareRobustCommand\squelch[1]{%
  \BeginAccSupp{method=plain,ActualText={}}#1\EndAccSupp{}%
}


%\renewcommand{\em}{\itshape}
%\newcommand*\ac[1]{\textsmaller{#1}}
%\AtBeginEnvironment{tabu}{%
%  \liningroman}
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
    %   gobble       = 2,
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

% to allow multiple consecutive footnotes
% as described in http://tex.stackexchange.com/a/62091/24263
\let\oldFootnote\footnote
\newcommand\nextToken\relax

\renewcommand\footnote[1]{%
    \oldFootnote{#1}\futurelet\nextToken\isFootnote}

\newcommand\isFootnote{%
    \ifx\footnote\nextToken\textsuperscript{,}\fi}
%

\let\oldfrontmatter\frontmatter
\renewcommand\frontmatter{\oldfrontmatter \singlespacing}
\let\oldmainmatter\mainmatter
\renewcommand\mainmatter{\oldmainmatter \onehalfspacing}
\let\oldbackmatter\backmatter
\renewcommand\backmatter{\oldbackmatter \singlespacing}

\setlength{\uobtitlecoverwidth}{\textwidth}

\renewcommand{\maketitle}{%
    \begin{titlepage}
        \setlength{\parindent}{\z@}
        \setlength{\parskip}{\z@}
        \enlargethispage{17mm}

% Title
        \centering
        \vglue 3cm 

        \begin{varwidth}{\uobtitlecoverwidth}
            \centering
            \usekomafont{title}\@title
        \end{varwidth}

        \vskip 2cm
        {\usekomafont{author}\@author}
%
%
%% University Crest
        \vskip \fill
        {\centering\includegraphics[width=5cm]{Images/Bristol-uni-logo-colour}}
        \vskip \fill

%% Declaration
        \begin{varwidth}{.8\textwidth}
            \centering
            \uob@front@declaration@text
        \end{varwidth}

% Date of submission
        \vskip 1cm
        {\usekomafont{submitted}\DTMlangsetup{showdayofmonth=false}%
            \ifx\@submitted\@empty
                \DTMtoday
            \else
                \DTMdate{\@submitted}
            \fi
        }

        \vskip 3cm
        \ifx\@wordcount\@empty
            \mbox{}
        \else 
            {\usekomafont{wordcount}\raggedleft Word count: \num{\@wordcount} words\par}
            %%\input{wordcount/wordcount} words
        \fi
    \end{titlepage}

% Placing CC license if requested on verso of titlepage
    \ifuob@cclicense
        \newpage
        \enlargethispage{2cm}
        \thispagestyle{empty}
        \vglue \fill
        \doclicenseThis
    \fi


%
% Abstract
%
    \ifx\@abstract\@empty \else {
        \chapter{Abstract}

        \@abstract
    }
    \fi

% Taken from the PGR code annex 4: http://www.bristol.ac.uk/academic-quality/pg/pgrcode/annex4/
\chapter{Author's Declaration}

\uob@author@declaration@text

\vskip 10mm
\@author
\vskip 15mm

\textsc{signed}:~\makebox[60mm]{\dotfill}\hfill\textsc{date}:~\makebox[60mm]{\dotfill}
\cleardoublepage
% End of author's declaration


% Place acknowledgements in its own chapter if it is defined
\ifx\@acknowledgements\@empty \else {
    \chapter{Acknowledgements}

    \@acknowledgements\par
}
\fi

}

%
% Chapter title formatting
%
\renewcommand*{\chapterformat}{%
    \mbox{~\resizebox{!}{2cm}{\rotatebox{90}{\chapapp}} \resizebox{!}{2cm}{\liningnums{\thechapter}\autodot}}%
}

\renewcommand\chapterlinesformat[3]{%
    \parskip=0pt%
    \lineskip=0pt%
    \parindent=0pt%
    \topskip=0pt%
    \baselineskip=0pt%
%    \ifstr{#2}{}%
%       {\hrule\par\vskip 1.25ex\nobreak}%
%        {}
        {\hrulefill\smash{#2}\par\vskip 1ex\nobreak}%
    \parbox[b]{\textwidth}{\singlespace\raggedright#3}\par\nobreak\vskip 1ex%\bigskip
    \hrule%
}

\RedeclareSectionCommand[afterskip=2\baselineskip, beforeskip=5cm, innerskip=0pt]{chapter}
%
% End of Chapter title formatting
%

\setkomafont{disposition}{\sffamily\mdseries}
\addtokomafont{chapterentry}{\bfseries}

% vim: ft=tex ts=4 sw=4 et
% vim600: fdl=0 fdm=marker fdc=3 spl=en_gb spell
