%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV
% LaTeX Class
% Version 3.0 (December 17, 2022)
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\ProvidesClass{resume}[2022/12/17 v3.0 Resume class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{article} % Load the base class

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES AND MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\usepackage[parfill]{parskip} % Remove paragraph indentation

\usepackage{array} % Required for bold tabular columns

\usepackage{ifthen} % Required for ifthenelse statements

\usepackage{graphicx} % Required for including images

\pagestyle{empty} % Suppress headers and footers on all pages

%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------

\usepackage{geometry} % Required for adjusting page dimensions and margins

\geometry{
	top=3em, % Top margin
	bottom=3em, % Bottom margin
	left=3em, % Left margin
	right=3em, % Right margin
	%showframe, % Uncomment to show how the type block is set on the page
}

%----------------------------------------------------------------------------------------
%	HEADER COMMANDS (positional)
%----------------------------------------------------------------------------------------

\newcommand{\leftinfo}[1]{\renewcommand{\leftinfo}{#1}}
\newcommand{\centertop}[1]{\renewcommand{\centertop}{#1}}
\newcommand{\centerbottom}[1]{\renewcommand{\centerbottom}{#1}}
\newcommand{\rightinfo}[1]{\renewcommand{\rightinfo}{#1}}

% \printHeader outputs the 3-column header
\newcommand{\printHeader}{%
	\vbox{%
		\hbox to \textwidth{%
			\begin{minipage}[t]{0.25\textwidth}%
				\raggedright\leftinfo%
			\end{minipage}%
			\hfil%
			\begin{minipage}[t]{0.48\textwidth}%
				\centering
				{\huge\bfseries\centertop}\\[1em]
				\centerbottom
			\end{minipage}%
			\hfil%
			\begin{minipage}[t]{0.25\textwidth}%
				\raggedleft\rightinfo%
			\end{minipage}%
		}%
	}%
	\vskip\bigskipamount
}

%----------------------------------------------------------------------------------------
%	OUTPUT THE HEADER AUTOMATICALLY
%----------------------------------------------------------------------------------------

\let\ori@document=\document % Store the original \document command
\renewcommand{\document}{
	\ori@document % Output the original \document command but add to it below
	\printHeader % Output the 3-column header
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the major sections within the CV
\newenvironment{rSection}[1]{ % The single parameter is for the section title
	\medskip % Vertical whitespace
	\MakeUppercase{\textbf{#1}} % Section title
	\medskip % Vertical whitespace
	\hrule % Horizontal rule
}{
	
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 parameters: company name, year(s) employed, job title and location
	\noindent\begin{tabular*}{\linewidth}{@{}l@{\extracolsep{\fill}}r@{}}
		\textbf{#1} & \textbf{#2}\\[-0.2em]
		\ifthenelse{\equal{#3}{}}{}{\textit{#3} & \textit{#4}\\}
	\end{tabular*}%
	\smallskip % Vertical whitespace
	\begin{list}{\$}{\leftmargin=1em} % \cdot used for bullets, no indentation
		\setlength{\itemsep}{-0.5em} \vspace{-0.5em} % Reduce vertical spacing between items in the list for a tighter look
}{
	\end{list}
	\vspace{0.5em} % Vertical whitespace after the end of the list
}
