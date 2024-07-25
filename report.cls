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

% Other useful packages
\RequirePackage{algorithmic}
\RequirePackage{array}
\RequirePackage{setspace}
\RequirePackage{lipsum}

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
\fancyhead[L]{\name}
\fancyhead[C]{\coursecode}
\fancyhead[R]{\paperdate}

% User-defined colors
\colorlet{LightGray}{White!90!Periwinkle}
\colorlet{LightOrange}{Orange!15}
\colorlet{LightGreen}{Green!15}



\declaretheoremstyle[name=Theorem]{thmsty}
\declaretheorem[style=thmsty,numberwithin=section]{theorem}
\tcolorboxenvironment{theorem}{colback=LightGray}

\declaretheoremstyle[name=Proposition]{prosty}
\declaretheorem[style=prosty,numberlike=theorem]{proposition}
\tcolorboxenvironment{proposition}{colback=LightOrange}

\declaretheoremstyle[name=Principle]{prcpsty}
\declaretheorem[style=prcpsty,numberlike=theorem]{principle}
\tcolorboxenvironment{principle}{colback=LightGreen}

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
        {\huge \textbf{\uppercase{\coursecode \ Project Report}}} \par
        \vspace{0cm}
        \HRule{0.2pt} \par
        \vspace{\vspacefive}
        {\LARGE \textbf{Project Dalek}} \par
        \vspace{\vspacesix}
        \textbf{Author} \par
        \name \ (\idnumber) \par
        \vspace{\vspaceseven}
        \textbf{Date} \par
        \today \par
        \vfill
    \end{titlepage}
}
