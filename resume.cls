% Intro Options
\ProvidesClass{resume}[2022/05/12 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

% Package Imports
\usepackage[lmargin=1.5cm, vmargin=0.85cm, rmargin=1.5cm]{geometry}
\usepackage[hidelinks]{hyperref}
\usepackage{enumitem}
\usepackage{graphicx}
\usepackage{pifont}
\usepackage[document]{ragged2e}
\usepackage{anyfontsize}


% Publications
\usepackage{cite}
\renewcommand\refname{\vskip -1.5cm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Color Definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Color definitions
\usepackage[usenames,dvipsnames]{xcolor}
\definecolor{date}{HTML}{666666}
\definecolor{title}{HTML}{1e76e2}
\definecolor{primary}{HTML}{2b2b2b}
\definecolor{headings}{HTML}{6a6a6a}
\definecolor{subheadings}{HTML}{333333}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Font Definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main Title
% Used for Name and Section Headings
\def \pathtitlefont {fonts/oxygen/} 
\def \firstnamefont {Oxygen-Bold}
\def \secondnamefont {Oxygen-light}
\def \titlefont {\firstnamefont}
\def \namefontsize {9.5}

% Main Font Definitions
\def \pathmainfont {fonts/opensans/}
\def \mainfont {OpenSans-light}
\def \mainfontbold {OpenSans-semibold}
% \def \mainbolditalicfont {}
% \def \mainitalicfont {}
\def \mainfontsize {9.5}
\def \mainsansfont {OpenSans-light}

%M ain Subheading Font Definitions
% Used for company name and sub-skills
\def \pathsubheadingfont {\pathtitlefont}
\def \subheadingfont {\titlefont}
\def \subheadingsize {12}

% Main Job Descriptor and Location Font Definitions
% Used for company name and sub-skills
\def \pathdescriptorfont {\pathsubheadingfont}
\def \descriptorfont {\secondnamefont}
\def \descriptorsize {10}
\def \pathlocationfont {\pathsubheadingfont}
\def \locationfont {\subheadingfont}
\def \locationsize {8pt}

% Main Monospace Font Definitions 
% Used for Job Title and Contact Line 
\def \pathmonofont {fonts/officecodeprod/}
\def \monofont {OfficeCodeProD-Light}

% Set main fonts
\usepackage{fontspec}
\setmainfont[
    Color = primary,
    Path = \pathmainfont,
    BoldFont=\mainfontbold,
    UprightFeatures={SizeFeatures={Size=\mainfontsize}},
    BoldFeatures={SizeFeatures={Size=\mainfontsize}}
]{\mainfont}
\setsansfont[
    Scale = MatchLowercase,
    Mapping = tex-text,
    Path = \pathmainfont,
    UprightFeatures={SizeFeatures={Size=\mainfontsize}}
]{\mainsansfont}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Command Definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Date command
% \usepackage[absolute]{textpos}
% \usepackage[UKenglish]{isodate}
% \setlength{\TPHorizModule}{1mm}
% \setlength{\TPVertModule}{1mm}
% \newcommand{\lastupdated}{\begin{textblock}{60}(155,5)
% \color{date}\fontspec[Path = \pathmainfont]{\mainfont}\fontsize{8pt}{10pt}\selectfont 
% Last Updated on \today
% \end{textblock}}


% Title Section
\newcommand{\namesection}[3]{
    \begin{minipage}{0.6\textwidth} 
        \RaggedRight{
        \color{title}
        \fontsize{35pt}{40pt}
        \fontspec[Path = \pathtitlefont]{\firstnamefont}\selectfont #1 
        \fontspec[Path = \pathtitlefont]{\secondnamefont}\selectfont #2
        } \\[5pt]
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.35\textwidth} 
        \RaggedRight{\fontspec[Path = \pathmonofont]{\monofont}\fontsize{10pt}{10pt}\selectfont #3}
    \end{minipage}       

    % \noindent\makebox[\linewidth]{\color{title}\rule{\paperwidth}{0pt}}
    % \vspace{-15pt}

    % \RaggedRight{\fontspec[Path = \pathmonofont]{\monofont}\fontsize{14pt}{14pt}\selectfont #3}

    % \noindent\makebox[\linewidth]{\color{title}\rule{\paperwidth}{0pt}}
    % \vspace{-15pt}
}

% Contact Line
\newcommand{\contactline}[3]{
    \begingroup
    \setbox0=\vbox{
        \vcenteredinclude{icons/main/github.png}{#1} \\
        \vcenteredinclude{icons/main/mail.png}{#2} \\
        \vcenteredinclude{icons/main/phone.png}{#3}
    }\parbox{\wd0}{\box0}
    \endgroup
}

% Variable for logo scaling
\def \logoScale{0.2}
% Inline Centered Logo
\newcommand{\vcenteredinclude}[1]{
    \begingroup
    \setbox0=\hbox{\includegraphics[scale=\logoScale]{#1}}
    \parbox{\wd0}{\box0}
    \endgroup
}

% Section separators
\usepackage{titlesec}
\titlespacing{\section}{0pt}{5pt}{5pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\newcommand{\sectionsep}{\vspace{5pt}}

% Headings command
\titleformat{\section}{\color{title}
\scshape\fontspec[Path = \pathtitlefont]{\titlefont}\fontsize{14pt}{16pt}\selectfont \raggedright}{}{0em}{}

% Subheadings command
\titleformat{\subsection}{
\color{subheadings}\fontspec[Path = \pathsubheadingfont ]{\subheadingfont}\fontsize{\subheadingsize}{12pt}\selectfont\bfseries\uppercase}{}{0em}{}

%Subheadings on the right
\newcommand{\runsubsection}[1]{
\color{subheadings}\fontspec[Path = \pathsubheadingfont ]{\subheadingfont}\fontsize{\subheadingsize}{12pt}\selectfont\bfseries\uppercase {#1} \normalfont}

% Descriptors command
\newcommand{\descript}[1]{
\color{subheadings}\raggedright\scshape\fontspec[Path = \pathdescriptorfont]{\descriptorfont}\fontsize{\descriptorsize}{12pt}\selectfont {#1 \\} \normalfont}

% Location command
\newcommand{\location}[1]{
\color{headings}\raggedright\fontspec[Path = \pathlocationfont]{\locationfont}\fontsize{\locationsize}{11pt}\selectfont {#1\\} \normalfont}


% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{
\vspace{-\topsep}\begin{itemize}[label=\ding{212}]\itemsep1pt \parskip0pt \parsep0pt}
{\end{itemize}\vspace{-\topsep}}

