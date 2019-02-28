%
% UoB-Thesis/UoBThesis.inc
%
% Developed by Greg Tourte <artourter@gmail.com>
% Copyright (c) 2018 The University of Bristol
% All rights reserved.
%
% Changelog:
% 30/07/2018 - created
%
\RequirePackage{xkeyval}

\define@boolkey[uob]{uobthesis}{cclicense}[true]{}
\setkeys[uob]{uobthesis}{cclicense=false}

\define@choicekey*[uob]{uobthesis}{logo}[\val\logonr]{none,full,crest}[full]{\def\uobthesis@logo{\logonr}}
\setkeys[uob]{uobthesis}{logo=full}

\define@choicekey*[uob]{uobthesis}{spacing}[\val\spacingnr]{single,onehalf,double}[double]{\def\uobthesis@spacing{\spacingnr}}
\setkeys[uob]{uobthesis}{spacing=double}

\define@boolkey[uob]{uobthesis}{minted}[true]{}
\setkeys[uob]{uobthesis}{minted=false}

\define@boolkey[uob]{uobthesis}{print}[true]{}
\setkeys[uob]{uobthesis}{print=false}

\define@boolkey[uob]{uobthesis}{minion}[true]{}
\setkeys[uob]{uobthesis}{minion=false}

\define@boolkey[uob]{uobthesis}{minionthree}[true]{}
\setkeys[uob]{uobthesis}{minionthree=false}

\define@boolkey[uob]{uobthesis}{notitle}[true]{}
\setkeys[uob]{uobthesis}{notitle=false}

\DeclareOptionX*{
    \ClassError{UoBThesis}{Unknown option ‘\CurrentOption’}%
}

\ProcessOptionsX[uob]<uobthesis>

\setkomafont{title}{\sffamily\Huge\bfseries}
\newlength{\uobtitlecoverwidth}

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
%\newcommand*{\@dedication}{}
%\newcommand*{\dedication}[1]{\gdef\@dedication{#1}}
%\newkomafont{dedication}{\normalfont\normalsize}
%
\newcommand*{\@abstract}{}
\newcommand*{\abstract}[1]{\gdef\@abstract{#1}}
\newkomafont{abstract}{\normalfont\normalsize}

\newcommand*{\@acknowledgements}{}
\newcommand*{\acknowledgements}[1]{\gdef\@acknowledgements{#1}}
\newkomafont{acknowledgements}{\normalfont\normalsize}

\newcommand{\uob@front@declaration@text}{%
A dissertation submitted to the \mbox{University of Bristol} in accordance with
the requirements for award of the degree of {\usekomafont{degree}\@degree} in
the Faculty of \mbox{\@faculty}, \@school.%
}

\newcommand{\uob@author@declaration@text}{%
I declare that the work in this thesis was carried out in accordance with the
requirements of the University's \textit{Regulations and Code of Practice for
Research Degree Programmes} and that it has not been submitted for any other
academic award.

Except where indicated by specific reference in the text, the work is the
candidate's own work. Work done in collaboration with, or with the assistance
of, others, is indicated as such.

Any views expressed in the thesis are those of the author.%
}

% vim: ft=tex ts=4 sw=4 et
% vim600: fdl=0 fdm=marker fdc=3 spl=en_gb spell
