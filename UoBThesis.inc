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

\newif\ifuob@cclicense\uob@cclicensefalse
\DeclareOption{cclicense}{\uob@cclicensetrue}

\newif\ifuob@minted\uob@mintedfalse
\DeclareOption{minted}{\uob@mintedtrue}

\newif\ifuob@minion\uob@minionfalse
\DeclareOption{minion}{\uob@miniontrue}

\newif\ifuob@minionthree\uob@minionthreefalse
\DeclareOption{minion3}{\uob@minionthreetrue}

\newif\ifuob@print\uob@printfalse
\DeclareOption{print}{\uob@printtrue}

\ProcessOptions\relax

\RequirePackage{pgfkeys}
\RequirePackage{pgfopts}


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
