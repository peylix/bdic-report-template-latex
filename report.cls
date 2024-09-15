\NeedsTeXFormat{LaTeX2e}
\LoadClassWithOptions{article}
\ProvidesPackage{report}[report template for various BDIC courses]

% Packages for text and input
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}

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
\RequirePackage{tcolorbox}
\usepackage{amsthm}

% Other useful packages
\RequirePackage{algorithmic}
\RequirePackage{array}
\RequirePackage{setspace}
\RequirePackage{lipsum}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{bookmark}


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

% User-defined colors
\definecolor{UCDGreen}{rgb}{0.5, 0.71, 0.31}
\definecolor{UCDBlue}{rgb}{0, 0.55, 0.77}
\definecolor{UCDYellow}{rgb}{0.95, 0.76, 0.18}

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

% Define the number of items in the list
\newcounter{totalnames}
\newcommand{\countnames}{
    \setcounter{totalnames}{0} % Reset counter
    \foreach \name in \namelist {
        \stepcounter{totalnames}
    }
}

\newcommand{\makenewtitlepage}{
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
}
