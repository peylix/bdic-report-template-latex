\NeedsTeXFormat{LaTeX2e}
\LoadClassWithOptions{article}
\ProvidesPackage{report}[report template for various BDIC courses]

% Packages for text and input
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{lmodern}
\RequirePackage{DejaVuSansMono}

% Packages for math and theorems
\RequirePackage{amsmath, amsthm, amssymb, amsfonts}
\RequirePackage{thmtools}

% Packages for tables and figures
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage[caption=false,font=footnotesize]{subfig}

% Packages for page layout and hyperlinks
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{hyperref}

% Packages for colors and boxes
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{framed}
\RequirePackage[most]{tcolorbox}

% Other useful packages
\RequirePackage{algorithmic}
\RequirePackage{array}
\RequirePackage{setspace}
\RequirePackage{lipsum}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{bookmark}
\RequirePackage{listings}


% Set font for texttt
\renewcommand{\ttdefault}{lmtt}


% Page layout configuration
\geometry{
    textheight=9in,
    textwidth=6.5in,
    top=1in,
    headheight=12pt,
    headsep=25pt,
    footskip=30pt
}
\setstretch{1.2}

% Header and footer configuration
\pagestyle{fancy}
\newlength\FHoffset
\setlength\FHoffset{0.1cm}
\addtolength\headwidth{2\FHoffset}
\fancyhead[L]{\authorname}
\fancyhead[C]{\coursecode}
\fancyhead[R]{\paperdate}

% Paragraph and line spacing configuration
\setlength{\parskip}{1em}
\setlength{\parindent}{0pt}

% Reduce the space between the title and the text
\makeatletter
\renewcommand{\section}{\@startsection{section}{1}{0pt}{10pt}{5pt}{\normalfont\Large\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{0pt}{8pt}{3pt}{\normalfont\large\bfseries}}
\makeatother


% Colors for the boxes and listings
\definecolor{UCDGreen}{rgb}{0.5, 0.71, 0.31}
\definecolor{UCDBlue}{rgb}{0, 0.55, 0.77}
\definecolor{UCDYellow}{rgb}{0.95, 0.76, 0.18}
\definecolor{backcolour}{rgb}{0.95, 0.95, 0.92}
\definecolor{codegreen}{rgb}{0, 0.6, 0}
\definecolor{codegray}{rgb}{0.5, 0.5, 0.5}
\definecolor{codepurple}{rgb}{0.58, 0, 0.82}
\definecolor{keywordcolor}{rgb}{0.9, 0.3, 0.1}
\definecolor{bordercolor}{rgb}{0.7, 0.7, 0.7}
\definecolor{linenumberbg}{rgb}{0.95, 0.95, 0.95}



% Abstract Box Style
\newtcolorbox[auto counter, number within=section]{colorfulabstract}[1][]{
    title={\bfseries \abstractname},
    enhanced,
    drop shadow={black!50!white},
    coltitle=black,
    top=0.2in,
    bottom=0.15in,
    attach boxed title to top left={xshift=1.5em, yshift=-\tcboxedtitleheight/2},
    boxed title style={size=small, colback=white!40!UCDGreen},
    colback=white,
    colframe=black!50,
    width=\textwidth,
    arc=4mm,
    auto outer arc,
    sharp corners=all,
    #1 % Allow additional customization via arguments
}

\newtcolorbox[auto counter, number within=section]{monochromeabstract}[1][]{
    title={\bfseries \abstractname},
    enhanced,
    coltitle=black,
    top=0.2in,
    bottom=0.15in,
    attach boxed title to top left={xshift=1.5em, yshift=-\tcboxedtitleheight/2},
    boxed title style={size=small, colback=white, boxrule=0.2mm},
    colback=white,
    colframe=black,
    boxrule=0.2mm,
    width=\textwidth,
    arc=4mm,
    auto outer arc,
    sharp corners=all,
    #1 % Allow additional customization via arguments
}


\tcbset {
    base/.style={
        arc=0mm,
        bottomtitle=0.5mm,
        boxrule=0mm,
        colbacktitle=black!10!white,
        coltitle=black,
        fonttitle=\bfseries,
        left=2.5mm,
        leftrule=1mm,
        right=3.5mm,
        title={#1},
        toptitle=0.75mm,
    }
}

\newtcolorbox{greenbox}[1]{
    colframe=UCDGreen, 
    base={#1}
}

\newtcolorbox{bluebox}[1]{
    colframe=UCDBlue,
    base={#1}
}

\newtcolorbox{yellowbox}[1]{
    colframe=UCDYellow,
    base={#1}
}

\newtcolorbox{subbox}[1]{
    colframe=black!30!white,
    base={#1}
}


\declaretheoremstyle[name=Theorem]{thmsty}
\declaretheorem[style=thmsty,numberwithin=section]{theorem}
\tcolorboxenvironment{theorem}{colframe=UCDGreen}

\declaretheoremstyle[name=Proposition]{prosty}
\declaretheorem[style=prosty,numberlike=theorem]{proposition}
\tcolorboxenvironment{proposition}{colframe=UCDBlue}

\declaretheoremstyle[name=Principle]{prcpsty}
\declaretheorem[style=prcpsty,numberlike=theorem]{principle}
\tcolorboxenvironment{principle}{colframe=UCDYellow}


% Listing configuration
\lstdefinestyle{elegantstyle}{
    backgroundcolor=\color{backcolour},
    commentstyle=\color{codegreen}\textit,
    keywordstyle=\color{keywordcolor}\bfseries,
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    numbersep=10pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=4,
    frame=shadowbox,
    framerule=1pt,
    rulecolor=\color{bordercolor},
    frameround=tttt,
    xleftmargin=10pt,
    xrightmargin=10pt,
    basicstyle=\fontfamily{txtt}\selectfont\footnotesize
}

\lstset{style=elegantstyle}


% Calculate the number of authors
\newcounter{totalnames}
\newcommand{\countnames}{
    \setcounter{totalnames}{0} % Reset counter
    \foreach \name in \namelist {
        \stepcounter{totalnames}
    }
}

% Title page layout and spacing configuration
\newcommand{\makenewtitlepage}{
    \begingroup
    \setlength{\parskip}{1pt}
    \begin{titlepage}
        \centering
        \vspace*{\vspaceone}
        \includegraphics[width=0.1\textwidth]{images/UCD_Logo.pdf} \hspace{0.5cm}
        \includegraphics[width=0.15\textwidth]{images/BJUT_Logo.pdf} \par
        \vspace{\vspacetwo}
        {\Large \textsc{Beijing-Dublin International College}} \par
        \vspace{\vspacethree}
        \HRule{0.2pt} \par
        \vspace{\vspacefour}
        \setstretch{1.0}
        {\huge \textbf{\uppercase{\coursecode \ \reporttitle}}} \par
        \vspace{0cm}
        \HRule{0.2pt} \par
        \vspace{\vspacefive}
        {\LARGE \textbf{\projecttitle}} \par
        \vspace{\vspacesix}
        % if there is more than one author, use "Authors", otherwise use "Author"
        \countnames
        \textbf{
            \ifthenelse{\value{totalnames} > 1}
            {Authors}
            {Author}
        } \par
        \vspace{0.1cm}
        \foreach \name in \namelist {
            \name \par
            \vspace{0.1cm}
        }
        % \name \ (\idnumber) \par
        \vspace{\vspaceseven}
        \textbf{Date} \par
        \vspace{0.1cm}
        \today \par
        \vfill
    \end{titlepage}
    \endgroup
}

% Create a compact title at the top of the first page
\newcommand{\makecompacttitle}{
    \begingroup
    \setlength{\parskip}{0pt}
    
    % Create a centered header with logos, college name, and course info
    \begin{center}
        % \includegraphics[width=0.08\textwidth]{images/UCD_Logo.pdf} \hspace{6cm}
        % \includegraphics[width=0.12\textwidth]{images/BJUT_Logo.pdf} \par
        % \vspace{0.3cm}
        {\normalsize \textsc{Beijing-Dublin International College}} \par
        \vspace{0.3cm}
        \vspace{0.2cm}
        {\Large \textbf{\uppercase{\coursecode \ \reporttitle}}} \par
        \vspace{0.2cm}
        {\large \textbf{\projecttitle}} \par
        \vspace{0.3cm}
        
        % Authors section
        \countnames

        % Print all author names inline with commas between
        \begingroup
        \newcounter{namecount}
        \setcounter{namecount}{0}
        \foreach \name in \namelist {
            \stepcounter{namecount}
            \name
            \ifthenelse{\value{namecount} < \value{totalnames}}{, }{}
        }
        \endgroup
        \par
        \vspace{0.1cm}
        \textbf{Date:} \today
        \vspace{0.3cm}
    \end{center}
    \endgroup
}