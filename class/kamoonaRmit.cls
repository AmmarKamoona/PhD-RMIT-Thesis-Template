%kamoonaRmit.cls
%
% Copyright 2021 Ammar Kamoona <ammarkamoona.2012@gmail.com>
% 
% Licensed under the GNU GPL version 3.0 or later.
% See http://www.gnu.org/licenses/gpl.html
%
% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kamoonaRmit}[2021/01/16 v0.1 
		PhD Thesis Class, Faculty of Engineering, Royal Melbourne Institute of Technology]

%\ExecuteOptions{12pt,a4paper,onecolumn, twoside, openright}
%\ProcessOptions\relax
%\LoadClass{report}
\LoadClass[12pt,a4paper,onecolumn,twoside,openright]{report}

% margins
% use showframe in parameters if you want to check the margins
\RequirePackage[left=2.5cm,right=2.5cm,top=3cm,bottom=3cm, bindingoffset=1cm]{geometry}

% Fonts! needs XeTeX
\RequirePackage{ifxetex}
\makeatletter
% for textbullets
\usepackage{textcomp}

   \ifxetex
		\usepackage[no-math]{fontspec}
	 	\setmainfont{TeX Gyre Termes}
	   	\setsansfont{TeX Gyre Heros}
    \setmonofont{TeX Gyre Cursor}
	\else
		\ClassWarning{kamoonaRmit}{Use XeTeX for better fonts!}		
		\usepackage[T1]{fontenc}
		\usepackage{qtxmath}	
		\usepackage{tgtermes}
		\usepackage{tgheros}
		%\usepackage{tgcursor}

%		\InputIfFileExists{garamond.sty}{\AtBeginDocument{\garamond}}{%
%			\ClassError{kamoonaRmit}{Missing garamond.sty. Unpack the zip from http://gael-varoquaux.info/computers/garamond/index.html in your source directory.}{}}
	
			
	\fi
\makeatother

% fancy headers, footers
\RequirePackage{fancyhdr}
\makeatletter
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}{}}
\fancyhf{}
\fancyhead[LE]{\footnotesize{\textsc{\leftmark}}}
\fancyhead[RO]{\footnotesize{\textsc{\rightmark}}}
\fancyfoot[LE,RO]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}

\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
%  \renewcommand{\footrulewidth}{0pt}
}
\makeatother

% Title page
\RequirePackage{titling}

\makeatletter
    % custom commands
	\newcommand{\affiliation}[1]{\def \@affiliation {#1}}
	\newcommand{\affilogo}[1]{\def \@affilogo {#1}}
	\newcommand{\affiliations}[2]{\def \@firstaffiliation {#1}  \def \@secondaffiliation {#2}}
	\newcommand{\affilogos}[2]{\def \@firstaffilogo {#1}  \def \@secondaffilogo {#2}}
	\newcommand{\location}[1]{\def \@location {#1}}
	\newcommand{\subtitle}[1]{\def \@subtitle {#1}}
	\newcommand{\thesisDec}[1]{\def \@thesisDec {#1}}
	\newcommand{\TypeOfDocument}[1]{\def \@TypeOfDocument {#1}}
    
	\affiliation{}
	\affilogo{}
	\affiliations{}{}
	\location{}
	\subtitle{}
	\thesisDec{}
    \TypeOfDocument{}
	% COVER PAGE for the title page
	\pretitle{\vspace{-5cm}\begin{center}\includegraphics[scale=0.6,keepaspectratio]{\@affilogo}\noindent\end{center}\begin{center} \Huge}
	\posttitle{\par \vskip 0.5em \ifx \@subtitle \empty \vskip 1em \else {\Large\@subtitle} \fi \end{center}\noindent\vskip 0.5em}
	\preauthor{\begin{center}\large \lineskip 0.5em \begin{tabular}[t]{c}}
    \postauthor{\end{tabular} \vskip 2em \@affiliation \\ Royal Melbourne Institute of Technology \par \end{center}}
	\predate{\vskip 2em \large \begin{center} \@TypeOfDocument \\ 
    \large \@location \vfill}
	\postdate{\vskip 5em \vskip 5em   \Large \end{center}}
\makeatother


% Sections and captions
\RequirePackage{titlesec}
\makeatletter
	\titleformat{\chapter}[display]{\normalfont\huge\bfseries}
	{\chaptertitlename\ \thechapter}{10pt}{\Huge}[\vspace{2cm}\hrulefill]
	\titleformat{\section}[block]{\normalfont\LARGE\bfseries\sffamily}{\thesection}{15pt}{\LARGE}
	\titleformat{\subsection}[block]{\normalfont\Large\bfseries\sffamily}{\thesubsection}{15pt}{\Large}
	\titleformat{\subsubsection}[block]{\normalfont\large\bfseries\sffamily}{\thesubsubsection}{15pt}{\large}
	\titleformat{\paragraph}[block]{\normalfont\normalsize\bfseries\sffamily}{\paragraph}{15pt}{\normalsize}
	\titleformat{\subparagraph}[block]{\normalfont\normalsize\bfseries\sffamily}{\subparagraph}{15pt}{\normalsize}
\makeatother


% captions for figures and tables
\RequirePackage{caption}
\makeatletter
	\renewcommand{\captionlabelfont}{\normalsize\bfseries}
	\renewcommand{\captiontextfont}{\small}
	\setlength{\captionmargin}{1.3cm}
\makeatother

% takes care of the abstract and aknowledgements
\RequirePackage{abstract}

\makeatletter

\newcommand{\keywords}[1]{\def \@keywords {#1}}
\newcommand{\theabstract}[1]{\def \@theabstract {#1}}
\newcommand{\acknowledgements}[1]{\def \@acknowledgements {#1}}
\newcommand{\declaration}[1]{\def \@declaration {#1}}

\keywords{}
\theabstract{}
\acknowledgements{}
\declaration{}

\include{Intro/abstract}
\include{Intro/acknowledgements}
\include{Intro/declaration}

% indent the abstract properly
\setlength{\absrightindent}{1cm}
\setlength{\absleftindent}{1cm}

% makes everything in the begining of the document
\newcommand{\makefrontmatter}{

    %% Roman numbers until Chapter 1
    \pagenumbering{roman}
	\maketitle

	% make the abstract and keywords
	\ifx \@theabstract \@empty
		\ClassWarning{kamoonaRmit}{The abstract is missing. Use \protect\theabstract{text}.}
	\else
		% empty page		
		\pagestyle{empty}
		% make sure the abstract is on a right-hand side
		\cleardoublepage
		\begin{abstract}
        \setcounter{page}{3}
		\noindent
		\@theabstract		
		\ifx \@keywords \@empty
			\ClassWarning{kamoonaRmit}{Keywords are missing. Use \protect\keywords{words}.}
		\else
			\vspace{2cm}\par\noindent {\small{\bf Keywords\/}: \@keywords}
		\fi
		\end{abstract}
	\fi
	
	
	\pagestyle{fancy}

	% add acknowledgement if any
	\ifx \@acknowledgements \@empty
			\relax
	\else
			\chapter*{Acknowledgements}
			\@acknowledgements
	\fi

	% add declaration if any
	\ifx \@declaration \@empty
			\relax
	\else
			\chapter*{Declaration}
			\@declaration
			\vspace{0.05cm}\par 
            \begin{flushright} 
                \@author \\
                \@date
            \end{flushright} 
	\fi

	\tableofcontents

}	
\makeatother


% make the bibliography
\makeatletter
\newcommand{\makebibliography}[1]{
	\cleardoublepage
	\phantomsection
	\addcontentsline{toc}{chapter}{Bibliography}
	\bibliographystyle{plain}
	\bibliography{#1}
}
\makeatother
