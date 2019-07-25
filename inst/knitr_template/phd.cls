\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{phd}[2007/05/10]

\typeout{}
\typeout{===============================================================================}
\typeout{BAYLOR UNIVERSITY}
\typeout{Department of Statistical Science}
\typeout{Ph.D. Thesis LaTeX style file}
\typeout{Created and maintained by Stephanie Powers}
\typeout{}
\typeout{Calibrated for the printer in room 233 of the Statistics Department}
\typeout{There are no guarantees that other printers will yield correct results.}
\typeout{===============================================================================}

%%
%% We'll let report handle some of the standard options.
%%

\DeclareOption{fleqn}{ \PassOptionsToClass{fleqn}{report} }
\DeclareOption{leqno}{ \PassOptionsToClass{leqno}{report} }
\DeclareOption{openbib}{ \PassOptionsToClass{openbib}{report} }
\DeclareOption{draft}{ \PassOptionsToClass{draft}{report} }
\DeclareOption{final}{ \PassOptionsToClass{final}{report} }
\DeclareOption{openright}{ \PassOptionsToClass{openright}{report} }
\DeclareOption{openany}{ \PassOptionsToClass{openany}{report} }

%%
%% Most of the usual report options are now illegal.
%%

\DeclareOption{10pt}{\ClassWarning{thesis}{Option '10pt' ignored.}}
\DeclareOption{11pt}{\ClassWarning{thesis}{Option '11pt' ignored.}}
\DeclareOption{12pt}{\ClassWarning{thesis}{Option '12pt' ignored (redundant).}}

\DeclareOption{landscape}{\ClassWarning{thesis}{Option 'landscape' ignored.}}
\DeclareOption{twoside}{\ClassWarning{thesis}{Option 'twoside' ignored.}}
\DeclareOption{twocolumn}{\ClassWarning{thesis}{Option 'twocolumn' ignored.}}
\DeclareOption{legalpaper}{\ClassWarning{thesis}{Option 'legalpaper' ignored.}}
\DeclareOption{executivepaper}{\ClassWarning{thesis}{Option 'executivepaper' ignored.}}
\DeclareOption{letterpaper}{\ClassWarning{thesis}{Option 'letterpaper' ignored (redundant).}}
\DeclareOption{onecolumn}{\ClassWarning{thesis}{Option 'onecolumn' ignored (redundant).}}
\DeclareOption{oneside}{\ClassWarning{thesis}{Option 'oneside' ignored (redundant).}}

% Invalid options - normally used in report.cls and others, but not here:

\DeclareOption{titlepage}{\ClassWarning{thesis}{Title page always generated. Option ignored.}}
\DeclareOption{notitlepage}{\ClassWarning{thesis}{Option 'notitlepage' not available for thesis.}}
\DeclareOption{a4paper}{\ClassWarning{thesis}{Option 'a4paper' not available for this class.}}
\DeclareOption{a5paper}{\ClassWarning{thesis}{Option 'a5paper' not available for this class.}}
\DeclareOption{b5paper}{\ClassWarning{thesis}{Option 'b5paper' not available for this class.}}

% CUSTOM OPTIONS

% Options for no decimal numbering, or decimal number nested over 3 deep:
\newif\if@Section
\@Sectionfalse

%%
%% Thesis style is based on the report style.
%%

\ProcessOptions
\LoadClass[12pt,letterpaper,oneside,onecolumn]{report}[1996/10/31]

% Other required LaTeX2e packages: if your computer doesn't already
% have these, you can copy them to your own directory (URL above):

\RequirePackage{indentfirst}        % indentfirst.sty, 1995/11/23
\RequirePackage{ifthen}         % ifthen.sty, 1996/08/02
\RequirePackage[titles]{tocloft}		% for formatting the table of contents, list of figures, and list of tables
% \RequirePackage[ULforem,normalbf]{ulem}   % ulem.sty, 1995/12/17


% SPECIAL INTERNAL COMMANDS.  Needed by later routines.

% Create a command to be used for default arguments.
\newcommand*{\th@DefArg}{aWfdRvV11f66GL00K5}

% Now create a command to check for the default argument, and call the
% command [in the first arg] appropriately.  Used for section heading
% commands.

\newcommand{\th@ExecChkOptArg}[3]{
\ifthenelse{\equal{\th@DefArg}{#2}}{
    #1{#3}
    }{
    #1[#2]{#3}}
}

% Convert the given number to a corresponding number name.
% modified by Daniel to make it work with Appendix
\newcommand{\arabicText}[1]{
\ifthenelse { \(\not \equal{#1}{A}\) \and \(\not \equal{#1}{B}\) %
        \and \(\not \equal{#1}{C}\) \and \(\not \equal{#1}{D}\)
        \and \(\not \equal{#1}{E}\) \and \(\not \equal{#1}{F}\)
        \and \(\not \equal{#1}{G}\) \and \(\not \equal{#1}{H}\)
        \and \(\not \equal{#1}{I}\) \and \(\not \equal{#1}{J}\)
        \and \(\not \equal{#1}{K}\) \and \(\not \equal{#1}{L}\) } { %
\ifcase #1 %
  ZERO \or ONE \or TWO \or THREE \or FOUR \or FIVE \or %
  SIX \or SEVEN \or EIGHT \or NINE \or TEN \or ELEVEN \or %
  TWELVE \or THIRTEEN \or FOURTEEN \or FIFTEEN \or SIXTEEN \or %
  SEVENTEEN \or EIGHTEEN \or NINETEEN \or TWENTY %
\fi
}
{#1}
}

% Controls the heading styles.  You can change the size to suit your needs.

\newcommand*{\th@ChSz}{\normalsize}
\newcommand*{\th@ScSz}{\normalsize}
\newcommand*{\th@HdFnt}{\normalfont}

% The style commands proper.  Controlled by a flag.

\newif\if@thInHeading
\@thInHeadingfalse
\newcommand*{\th@ChapterStyle}{\normalsize\normalfont}
\newcommand*{\th@SectionStyle}{\if@thInHeading\th@HdFnt\th@ScSz\fi}
\newcommand*{\th@SubSectionStyle}{\if@thInHeading\normalsize\th@HdFnt\fi}
\newcommand*{\th@OtherSecHeadStyles}{\if@thInHeading\normalsize\th@HdFnt\fi}


\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{**************************}
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\rm\thechapter}\rm#1}%
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                 	\addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \@makechapterhead{#2}%
                    \@afterheading
                    }
\def\@makechapterhead#1{
    \vspace*{0.26in} {  \parindent 0pt \centering
     \MakeUppercase{\@chapapp{}} \arabicText{\thechapter}
     \\  #1  \\ \vspace*{0.18in} } } %SPACING BETWEEN CHAPTER HEADING THE CHAPTER BODY ##########


\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{0pt}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }}

% Makes the chapter heading label, putting it in the desired style.
% We need to define it here, since we need it before redefining the
% chapter commands.

\newcommand*{\th@DoChapCenter}{\centering}
\newcommand*{\th@ChapHead}[1]{
    \protect\th@ChapterStyle
    \protect\th@DoChapCenter #1}


% DEFINE DOUBLE-SPACING (THE DEFAULT) AND OTHER SPACING
\def\setspace@size{\ifx\@currsize\normalsize\@normalsize\else\@currsize\fi}
\def\doublespacing{ \ifcase \@ptsize \relax
      \def \baselinestretch {2.004}%    10pt
  \or \def \baselinestretch {1.771}%    11pt
  \or \def \baselinestretch {1.660}%    12pt
  \fi \setspace@size}
\def\singlespacing{\def \baselinestretch {1} \setspace@size \vskip \baselineskip}
\def\setstretch#1{\renewcommand{\baselinestretch}{#1}}
\def\@setsize#1#2#3#4{\@nomath#1
  \let\@currsize#1 \baselineskip #2
  \baselineskip \baselinestretch\baselineskip
  \parskip \baselinestretch\parskip
  \setbox\strutbox \hbox{ \vrule height.7\baselineskip depth.3\baselineskip
  width\z@} \skip\footins \baselinestretch\skip\footins
  \normalbaselineskip\baselineskip#3#4}
%%%%%%%%% floats & footnotes singlespaced %%%%%%%%%
\let\latex@xfloat=\@xfloat
\def\@xfloat #1[#2]{\latex@xfloat #1[#2]
\def\baselinestretch{1}\@normalsize \normalsize}
\long\def\@footnotetext#1{
  \insert\footins{
    \def\baselinestretch {1}
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
    \protected@edef\@currentlabel{
      \csname p@footnote\endcsname\@thefnmark}
    \color@begingroup \@makefntext{
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}
    \color@endgroup}}
\long\def\@mpfootnotetext#1{
  \global\setbox\@mpfootins\vbox{
    \unvbox \@mpfootins
    \def\baselinestretch {1}
    \reset@font\footnotesize
    \hsize\columnwidth \@parboxrestore
    \protected@edef\@currentlabel{
      \csname p@mpfootnote\endcsname\@thefnmark}
    \color@begingroup \@makefntext{
       \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}
   \color@endgroup}}
%%%%%%%% single / double spacing %%%%%%%%%
\def\singlespace{ \vskip \baselineskip \def\baselinestretch {1}
  \setspace@size \vskip -\baselineskip }
\def\endsinglespace{\par}
\def\spacing#1{ \par \begingroup \def\baselinestretch {#1} \setspace@size }
\def\endspacing{ \par \vskip \parskip \vskip \baselineskip
  \endgroup \vskip -\parskip \vskip -\baselineskip }
\def\doublespace{ \ifcase \@ptsize \relax
      \spacing{2.004}%  10pt
  \or \spacing{1.771}%  11pt
  \or \spacing{1.660}%  12pt
  \fi }
\let\enddoublespace=\endspacing

% SET THE OVERALL DOCUMENT PROPERTIES, such as page numbering, margins...
% Initialize several global document properties, but do so *before*
% the beginning of the document to forces these changes.
\AtBeginDocument{
        \let\em\it
    \setlength{\topmargin}{.3in}%moves text and number was .295
    \setlength{\headheight}{0in} %was 0.2
    \setlength{\headsep}{0.40625in}%was 0.138in; moves text only
    \setlength{\topskip}{0in}% first line, down from page number;
                                %moves text only
   \setlength{\textheight}{8.9in}
   %\setlength{\textheight}{8.4375in}
    \setlength{\footskip}{0.345in} %footer page number
                %sets length for bottom page nos was .335
    \setlength{\oddsidemargin}{.255in} %was.55
    \setlength{\evensidemargin}{.155in} %was .55
    \setlength{\parindent}{30pt}    % somewhere between 0.3" and 0.5"
    \setlength{\textwidth}{6.0in} %was 5.92
    \setlength{\leftmargini}{3.5em}
    \setlength{\leftmarginii}{2.2em}
    \setlength{\leftmarginiii}{2.2em}
    \setlength{\leftmarginiv}{2.2em}
    \setlength{\leftmarginv}{2.2em}
    \setlength{\leftmarginvi}{2.2em}
    \setlength{\leftmargin}{\leftmargini}
    \setlength{\labelsep}{.5em}
    \setlength{\labelwidth}{ 1.5em}
    \pagenumbering{arabic}
    \pagestyle{myheadings}
    \markright{}
    \onecolumn
    \raggedbottom
    \normalsize
    \normalfont
    \doublespacing  % footnotes and floats still singlespaced
    \setcounter{tocdepth}{2}
    \setcounter{secnumdepth}{\value{th@SecNum}}


% Set length of hanging indentation for bibliography entries.
%
%\newlength{\bibhang}
%\setlength{\bibhang}{2em}
% Redefine the bibliography command here, just in case someone
% uses a custom *.sty file that redefines bibliography command
% modified by Daniel to include required hanging indentation
\def\thebibliography#1{\newpage\normalfont \normalsize \centering
\vspace*{0.25in} BIBLIOGRAPHY \vspace*{-0.15in}
\addcontentsline{toc}{chapter}{\hspace*{-0.0625in}\bibnameToC}
\singlespace
 \list
 {
 [\arabic{enumi}]} {\settowidth\labelwidth{[#1]}
 \leftmargin\labelwidth
\leftmargin\labelsep
\leftmargin\bibindent
 \itemindent -\bibindent
 \listparindent \itemindent
 %\parsep \z@
% \usecounter{enumi}
}
\def\newblock{\hskip .11em plus .33em minus -.07em}
 \sloppy
 \sfcode`\.=1000\relax
 %\advance\leftmargin\labelsep
 %\usecounter{enumi}} \def\newblock{\hskip .11em plus .33em minus -.07em}
 %\sloppy \sfcode`\.=1000\relax
 }

%\let\endthebibliography=\endlist

%\newenvironment{Bibliography}{
%    \begin{thebibliography}{99}
%     }{\end{thebibliography}}
}



% ADDITIONAL STUFF
\setcounter{tocdepth}{2}
\newcommand*{\@normalsize}{\normalsize}
\doublespacing

%  Figures and Tables
%\setcounter{topnumber}{2}
%\renewcommand*{\topfraction}{.5}
%\setcounter{totalnumber}{1}
%\renewcommand*{\textfraction}{.3}
%\renewcommand*{\floatpagefraction}{.6}
%\setcounter{dbltopnumber}{1}
%\renewcommand*{\dbltopfraction}{.4}
%\renewcommand*{\dblfloatpagefraction}{.3}

\setlength{\textfloatsep}{.42in plus 0.05in minus 0.05in}
\setlength{\intextsep}{.42in plus 0.05in minus 0.05in} % Vertical space above & below [h] floats
\setlength{\floatsep}{.42in plus 0.05in minus 0.05in}

% Re-define some formatting commands to produce lists, labels,
% and numberings that are more to the Grad School's liking.

% Set up some titles on the table of contents page.
\renewcommand*{\figurename}{\small Figure}
\renewcommand*{\tablename}{\small Table}
\newcommand*{\figurenameToC}{\normalsize\th@HdFnt \normalfont}
\newcommand*{\tablenameToC}{\normalsize\th@HdFnt\normalfont}

%was.37 %TOC TOP SPACING
\renewcommand*{\contentsname}{\th@ChapHead{\vspace*{0.37in}TABLE OF CONTENTS\vspace*{-0.70in}}}
\renewcommand*{\listfigurename}{\th@ChapHead{\vspace*{0.37in}LIST OF FIGURES\vspace*{-0.68in}}}
\renewcommand*{\listtablename}{\th@ChapHead{\vspace*{0.37in}LIST OF TABLES\vspace*{-0.65in}}}
\renewcommand*{\appendixname}{\th@ChapHead{\vspace*{-0.26in}APPENDIX}}
\renewcommand*{\bibname}{\th@ChapHead{\vspace*{0.67in}BIBLIOGRAPHY\vspace*{-.80in}}}
\renewcommand*{\chaptername}{\th@ChapHead{CHAPTER}\hspace*{-.1in}} %KT added hspace
\newcommand*{\chapternameToC}{
    \normalsize\th@HdFnt \normalfont}
\newcommand*{\bibnameToC}{
    \normalsize\th@HdFnt\vspace*{-0.01in}BIBLIOGRAPHY\normalfont}
\newcommand*{\appendixnameToC}{
    \normalsize\th@HdFnt APPENDICES\normalfont}

% Adds the appropriate label to the ToC/LoF/LoT

\addtocontents{lof}{\protect\contentsline {part}
    {\protect\figurenameToC}{\protect\relax}}
\addtocontents{lot}{\protect\contentsline {part}
    {\protect\tablenameToC}{\protect\relax}}
\addtocontents{toc}{\protect\contentsline {part}
    {\protect\chapternameToC}{\protect\relax}}



% NUMBERING STYLES, DEFAULT VALUES

% Using macros of the form \th@Def* avoids conflicts with
% LaTeX internals which use \theDef* forms...

\newcounter{th@SecNum}
\setcounter{th@SecNum}{3}
\newcommand*{\th@DefTheChapter}{\arabic{chapter}}
\newcommand*{\th@DefTheSection}{\th@DefTheChapter.\arabic{section}}
\newcommand*{\th@DefTheSubsection}{\th@DefTheSection.\arabic{subsection}}
\newcommand*{\th@DefTheSubsubsection}{\th@DefTheSubsection.\arabic{subsubsection}}

\renewcommand*{\thechapter}{\th@DefTheChapter}
\renewcommand*{\thesection}{\th@DefTheSection}
\renewcommand*{\thesubsection}{\th@DefTheSubsection}
\renewcommand*{\thesubsubsection}{\th@DefTheSubsubsection}

% Enumerated List labels
\renewcommand*{\theenumi}{\arabic{enumi}}
\renewcommand*{\theenumii}{\alph{enumii}}
\renewcommand*{\theenumiii}{\roman{enumiii}}
\renewcommand*{\theenumiv}{\alph{enumiv}}
\renewcommand*{\labelenumi}{(\theenumi)}
\renewcommand*{\labelenumii}{(\theenumii)}
\renewcommand*{\labelenumiii}{(\theenumiii)}
\renewcommand*{\labelenumiv}{(\theenumiii.\theenumiv)}

% Itemized list labels.
\renewcommand*{\labelitemi}{\textbullet}
\renewcommand*{\labelitemii}{\textasteriskcentered}
\renewcommand*{\labelitemiii}{\normalfont \bfseries \textendash}
\renewcommand*{\labelitemiv}{\textperiodcentered}

% Margins for lists
\setlength{\leftmargini}{3.5em}
\setlength{\leftmarginiii}{2.2em}
\setlength{\leftmarginiv}{2.2em}
\setlength{\leftmarginv}{2.2em}
\setlength{\leftmarginvi}{2.2em}
\setlength{\leftmargin}{\leftmargini}
\setlength{\labelwidth}{1.5em}

% Redefine certain commands and environments from report.cls.
% This is where things get messy.  We rename each command we modify,
% then redefine the command using the old version as subset.

% VERSE, QUOTATION, and QUOTE must be single-spaced.
% These rename the internal commands for the \begin{...} and
% \end{...} environment commands.
\let\th@OldVerse\verse
\let\th@OldQuotation\quotation
\let\th@OldQuote\quote
\let\endth@OldVerse\endverse
\let\endth@OldQuotation\endquotation
\let\endth@OldQuote\endquote

% Note - the ``\begin{singlespace}'' and ``\end{singlespace}''
% are defined in setspace.sty.

\renewenvironment*{verse}{\begin{th@OldVerse}\begin{singlespace}}
    {\end{singlespace}\end{th@OldVerse}}

\renewenvironment*{quotation}{\begin{th@OldQuotation} \begin{singlespace}}
    {\end{singlespace}\end{th@OldQuotation}}

\renewenvironment*{quote}{\begin{th@OldQuote} \begin{singlespace}}
    {\end{singlespace} \end{th@OldQuote}}

% Theorems and Axioms:  They must NOT be italicized.  To do this
% robustly, I've needed to use some in-depth TeXnology.  Check out a
% good LaTeX book for info on the \@namedef and \@nameuse commands.

\let\th@OldNewtheorem\newtheorem
% Check for the calling format: \newtheorem{}[]{}
\def\newtheorem#1{ \@ifnextchar[{\th@nuthrmOM{#1}}{\th@newtheoremTwo{#1}}%]
}
% Calling format: \newtheorem{}{}[]; checks for the optional arg at the end.
\def\th@newtheoremTwo#1#2{
    \@ifnextchar[{\th@nuthrmO{#1}{#2}}{\th@nuthrm{#1}{#2}}%]
}
% Standard call.  No optional args.
\def\th@nuthrm#1#2{
    \th@OldNewtheorem{th@#1}{#2}
    \th@correctTheorem{end#1}{#1}{endth@#1}{th@#1}
}
% Optional arg at end.
\def\th@nuthrmO#1#2[#3]{
    \th@OldNewtheorem{th@#1}{#2}[#3]
    \th@correctTheorem{end#1}{#1}{endth@#1}{th@#1}
    }
% Optional arg in the middle.
\def\th@nuthrmOM#1[#2]#3{
    \th@OldNewtheorem{th@#1}[th@#2]{#3}
    \th@correctTheorem{end#1}{#1}{endth@#1}{th@#1}
    }
\def\th@execThrmOpt#1[#2]{
    \@nameuse{#1}[#2] \normalsize\normalfont
}
\newcommand*{\th@correctTheorem}[4]{
    \@namedef{#1}{\@nameuse{#3}}
    \@namedef{#2}{\@ifnextchar[{\th@execThrmOpt{#4}}{ %%}
            \@nameuse{#4} \normalsize\normalfont}
    }
}

% APPENDIX command
%\newcounter{th@SectionSave}
%\let\th@OldAppCmd\appendix
%\renewcommand{\appendix}{
%   \setcounter{th@SectionSave}{\value{section}}
%    \th@OldAppCmd
%    \setcounter{section}{0}%
%    \setcounter{subsection}{0}%
%    \addtocontents{toc}{\protect\contentsline {part}
%        {\protect\hspace*{-0.0625in}\appendixnameToC}{\protect\relax}}
%    \renewcommand*{\th@DefTheChapter}{\Alph{chapter}}
%  }

% BIBLIOGRAPHY: Used to be redefined here.  Moved to permit use
% of different bibliography .sty and .bst files.  It's now in
% the '\AtBeginDocument' command.

% SECTION HEADINGS.
% including several new options

% New if-s
\newif\if@AlwaysFalse
\@AlwaysFalsefalse
\newif\if@CenterHeading
\@CenterHeadingfalse
\newif\if@UseStarCmd
\@UseStarCmdfalse

% GENERAL AND SETUP COMMANDS.

% Makes a heading.
% The optional argument (#1) is a centering flag. The heading gets
% centered if it's present and set to true.
% The second arg is the style command.
% The third arg is the heading proper.
\newcommand*{\th@MakeHeading}[2]{
    \protect #1 \hspace{-0.1in}
    \if@Section\centering #2\else #2 \fi
    \vspace{-5.15in}
    }

% Makes a heading.
% The entire thing is something of a mess.  We want all ToC entries to
% be in normal text.  We also want references in normal text.  But, we
% want the heading numbers to appear in the correct size and font.  To
% get this to happen is a chore.

% The args are, in order:
%    The command to execute (#1),
%    The heading style command (#2),
%    The optional arg passed to the heading command proper (#3).
%    E.g. if you execute a \section[foo]{bigfoo}, #3=="foo".
%    The heading text itself (#4).
%    The name of the current command (#5). E.g. "chapter".
%    The internal command that generates the number label (#6).

% There are also two important flags used by this command.  The first
% is \@UseStarCmd.  Set this to "true" if this is the starred version
% of the command.  The second flag is \@thInHeading.  This gets set
% 'true' inside the section heading commands and turned off at the end
% of the command.

\newcommand*{\th@Heading}[6]{
        \vspace{-0.1in}
    \@thInHeadingtrue
    % Alter the '\the...' command.
    \@namedef{the#5}{\protect#2 #6}
    \if@UseStarCmd
        #1*{\th@MakeHeading{\protect#2}{#4}}
    \else
        \ifthenelse{\equal{\th@DefArg}{#3}}{
            #1[\normalsize\normalfont#4]{
                \th@MakeHeading{\protect#2}{#4}}
        }{
            #1[\normalsize\normalfont#3]{
                \th@MakeHeading{\protect#2}{#4}}
        }
    \fi
% Reset the '\the...' command, but don't enforce
% '\normalsize\normalfont' anywhere, as this messes up
% cross-references in footnotes.
    \@namedef{the#5}{#6}
    \@thInHeadingfalse
    \@CenterHeadingfalse
    \normalsize\normalfont
}

% CHAPTER HEADING

% The chapter command definitely needs some re-defining.  The primary
% purpose is to control numbering in figures, tables, and equations.

% Special if-s; used internally for chapters.
\newif\if@THshortChapter
\@THshortChapterfalse

% SECTION HEADING COMMANDS.  We need to use the starred version and
% add the numbering and toc-entry ourselves.  We need to do this for
% all of the subsequent heading commands.  If we don't we'll get
% weird-looking ToC entries and references.

\let\th@OldSection\section
\renewcommand*{\section}{\@ifstar{\th@SectionS}{\th@Section}}

\newcommand*{\th@Section}[2][\th@DefArg]{
        \@Sectiontrue
    \@UseStarCmdfalse
    \@CenterHeadingtrue\@Sectiontrue
    \th@Heading{\th@OldSection}{\th@SectionStyle}{#1}
    {{\it #2}}
        {section}{\th@DefTheSection}
    \normalsize\normalfont
}
\newcommand*{\th@SectionS}[1]{
    \@UseStarCmdtrue
    \@CenterHeadingtrue
    \th@Heading{\th@OldSection}{\th@SectionStyle}{\th@DefArg}
        {#1}{section}{\th@DefTheSection}
    \@UseStarCmdfalse
    \normalsize\normalfont
}

% SUBSECTION HEADING COMMANDS.

\let\th@OldSubSection\subsection
\renewcommand*{\subsection}{
    \@ifstar{\th@SubSectionS}{\th@SubSection}
}
\newcommand*{\th@SubSection}[2][\th@DefArg]{
     \@Sectionfalse
    \@UseStarCmdfalse
    \@CenterHeadingfalse
    \th@Heading{\th@OldSubSection}{\th@SubSectionStyle}
        {#1}{{\it #2}}{subsection}{\th@DefTheSubsection}
    \normalsize\normalfont
}
\newcommand*{\th@SubSectionS}[1]{
    \@UseStarCmdtrue
    \@CenterHeadingfalse
    \th@Heading{\th@OldSubSection}{\th@SubSectionStyle}
        {\th@DefArg}{#1}{subsection}{\th@DefTheSubsection}
    \@UseStarCmdfalse
    \normalsize\normalfont
}

% SUBSUBSECTION HEADING COMMANDS.  No starred version permitted.
% No ToC entry.  We also need to check and see if we should number
% it or not and if we should inline it or not.

\let\th@OldSubSubSection\subsubsection
\newlength{\th@SubSubSecSpc}

\renewcommand*{\thesubsubsection}{\th@DefTheSubsubsection}
\newcommand*{\th@PreSubsubsecCmd}{\@UseStarCmdfalse}
\setcounter{th@SecNum}{4}
\setlength{\th@SubSubSecSpc}{0.5em}

%\renewcommand*{\subsubsection}[2][\th@DefArg]{
%    \refstepcounter{subsubsection}
%    \vspace{4\parsep}
%    \@thInHeadingtrue\th@OtherSecHeadStyles
%    \vspace{0.26in}
%    \thesubsubsection\hspace{\th@SubSubSecSpc}{\it #2}\hspace{2mm}
%    \ignorespaces\normalsize\normalfont
%    }
\renewcommand{\subsubsection}{\@startsection {subsubsection}{3}{\parindent}%
{2.8ex plus 0ex minus 0ex}% switched from 5ex to 2.8ex
{-1.5ex plus -0.2ex minus 0ex}%
{\normalfont\itshape\normalsize}}

\renewcommand{\section}{\@startsection {section}{1}{0pt}%
	{2.5ex plus 0ex minus 0ex}%
	{0.001ex plus 0ex minus 0ex}%
	{\vspace{0.01in}\centering\normalfont\itshape\normalsize}} %LEVEL 1 HEADER ###################
\renewcommand{\subsection}{\@startsection {subsection}{2}{0pt}%
	{2.5ex plus 0ex minus 0ex}%
	{0.001ex plus 0ex minus 0ex}%
	{\vspace{0.01in}\normalfont\itshape\normalsize}}



%%
%% Style guidelines don't seem to permit named paragraphs and
%% subparagraphs, so we'll disable them.
%%
\renewcommand*{\paragraph}[2][\th@DefArg]{
    \ClassError{thesis}{Named paragraphs are not allowed in a thesis}{}
}
\renewcommand*{\subparagraph}[2][\th@DefArg]{
    \ClassError{thesis}{Named subparagraphs are not allowed in a thesis}{}
}

% NEW COMMANDS DEFINED FOR THIS CLASS

% Unavailable commands
\renewcommand*{\theindex}{\ClassWarning{thesis}
   {Indexing not available in this class.}}
\renewcommand*{\twocolumn}{\ClassWarning{thesis}
    {Twocolumn not available in this class.}}
\renewcommand*{\thepart}{\ClassWarning{thesis}
    {``thepart'' not available in this class.}}
\renewcommand*{\part}{\ClassWarning{thesis}
    {``thepart'' not available in this class.}}


% NEW COMMANDS.
% This forces a page number on the first page of a chapter, etc.
\newcommand*{\forcepageno}{\thispagestyle{myheadings}}
\newcommand*{\OnePageChapter}{\forcepageno}

% THESIS PROLOGUE PAGES.
% Stores the second arg in the command specified by the first arg.
\newcommand{\th@StoreIn}[2]{ \gdef#1{#2} }

% Default values of storage variables.  Emits an error message.
% This part of the class is long...

\newcommand*{\thesisAuthorName}{
    \ClassError{thesis}{You must give your name using \protect\author{}}
}
\newcommand*{\thesisTitle}{
    \ClassError{thesis}{You must give a title using \protect\title{}}
}
\newcommand*{\thesisReader}{
    \ClassError{thesis}{You must give a reader using \protect\reader{}}
}

%%
%% Give default values for optional parameters.
%%
\newcommand*{\th@readerThree}{none}
\newcommand*{\th@readerFour}{none}
\newcommand*{\th@readerFive}{none}
%%\newcommand*{\th@readerSix}{none}

\newcommand{\th@abstractStash}{
    \ClassError{thesis}{
        You must specify an abstract!}
    {Use the \protect\abstractpage[]{} command in the \MessageBreak
        preamble.  If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}
%by Daniel

\newcommand*{\th@signature}[1]{
        \begin{center}
        \normalsize
        \vspace*{2.5ex}
        \vrule width 80mm height 0.2mm
        \\
        #1
        \end{center}
}

\newcommand*{\th@dateline}{
    \vspace*{9mm}
    \begin{flushright}
        Date~{\vrule width 35mm height 0.2mm}
    \end{flushright}
}
\newcommand{\th@AbstractPageStyle}{\relax}
\newcommand{\th@dedicationStash}{\relax}
\newcommand{\th@dedicationTitleStash}{\relax}
\newcommand{\th@acknowledgementsStash}{\relax}
\newif\if@shortLoF
\newif\if@shortLoT
\newif\if@shortToC
\newif\if@makenoLoF
\newif\if@makenoLoT
\newif\if@makeDedication
\newif\if@makeAcknowledgements
\newif\if@makePrologue
\newif\if@makeThesisCopyrightPage
\@shortLoFfalse
\@shortLoTfalse
\@shortToCfalse
\@makenoLoFfalse
\@makenoLoTfalse
\@makeThesisCopyrightPagefalse
\@makeDedicationfalse
\@makeAcknowledgementsfalse
\@makeProloguetrue

% The base commands that make all of the prologue pages.

\newcommand{\th@Abstractpage}{
        \enlargethispage{-.75in}
   \pagestyle{empty}
        \doublespacing
        \vspace*{1.08in} % modified by John was .995
    \begin{center}
                ABSTRACT
                \ \\
        \singlespacing
        \thesisTitle
                \ \\
         \doublespacing
                \thesisAuthorName, Ph.D.
                \ \\
       Chairperson: \thesisMentor
    %\end{list}
        \vspace*{0.07in}
        \end{center}
        %\doublespacing
    \th@abstract    % finally, the actual abstract

}

%\newcommand*{\thesisTitlePage}{
%        \thispagestyle{empty}
%    \doublespacing
%        \pagenumbering{roman}
%        \vspace*{1.055in} %modified by John
%    \begin{center} \thesisTitle \end{center}
%        \vspace*{1.33in}%modified by Daniel
%    \begin{center} A Dissertation Submitted  to the Graduate Faculty of\\
%    Baylor University\\
%        in Partial Fulfillment of the\\
%        Requirements for the Degree\\
%        of\\
%    Doctor of Philosophy\\
%        \vspace*{0.75in}%modified by Daniel
%    By\\
%        \thesisAuthorName\\
%        \vspace{1.35in}%modified by Daniel
%    Waco, Texas\\
%    \thesisConfDate
%        \end{center}
%        \pagebreak
%}



%%
%% Make the signature page modified by John
\newcommand*{\thesisMakeSignaturePage}{
%    \enlargethispage{1in}% creates .75" from bottom of dean name to page bottom
%                         % and 15/16" = .9375" from bottom of sig line to page bottom
    \enlargethispage{.5in}% creates .75" from bottom of dean name to page bottom
                         % and 15/16" = .9375" from bottom of sig line to page bottom
        \thispagestyle{empty}
    \singlespacing
    \begin{center}
\doublespacing
        \singlespacing
        \vspace*{0in}
        \thesisTitle
        \ \\
       \doublespacing by
        \ \\
        \thesisAuthorName, \yourDegrees
        \ \\
        A Dissertation
        \ \\
        Approved by the Department of Statistical Science

 \singlespacing

    \th@signature{\thesisDeptChair , Chairperson}

        Submitted to the Graduate Faculty of\\
        Baylor University in Partial Fulfillment of the\\
        Requirements for the Degree\\
        of\\
        Doctor of Philosophy
    \end{center}
        \vspace*{0.40in}
    \begin{flushleft}
\hspace*{0.4in}
\begin{tabular*}{80mm}[t]{c}
        Approved by the Dissertation Committee  \\
        \\
\\ \hline
    \thesisMentor , Chairperson \\ % Co-Chairperson \\
    \\
%KT Removed because just have one chair\\ \hline
%    \thesisReader  \\ % REQUIRED.
%    \\
\\ \hline
    \th@readerThree \\ % optional
    \\
\\ \hline
    \th@readerFour \\ % optional
    \\
\\ \hline
    \th@readerFive \\ % optional
        \\
\\
\end{tabular*}
    \end{flushleft}
    %\vspace*{.0000000025in}
    \vfill

    \begin{flushright}
\begin{tabular*}{65mm}{c}
        Accepted by the Graduate School \\
        \thesisConfDate \\
\\
\\ \hline
        \thesisGraduateDean , Dean
\end{tabular*}
    \end{flushright}
    \vspace*{.10in}
    \begin{center}
%\begin{tabular*}{50mm}[b]{c}
    \scriptsize{\it {Page bearing signatures is kept on file in the Graduate School.}}
%\end{tabular*}
\end{center}
        \thispagestyle{empty}
        \pagebreak
}




% Make a copyright page for this thesis.

\newcommand*{\thesisCopyrightPage}{
        \thispagestyle{empty}
    \if@makeThesisCopyrightPage
      \vspace*{8.05in} %modified by John
      %next line modified by Daniel
      \begin{center}
      Copyright \copyright \ \the\year\ by \thesisAuthorName \\
          \vspace{0.1in}
      All rights reserved
      \end{center}
        \else
          % Force a blank page
          \vspace*{0.1in}
          \relax
        \fi
    \pagebreak
}



%
% Make the signature page
% modified by Daniel
%\newcommand*{\thesisMakeSignaturePage}{
   %     \thispagestyle{empty}
    %\singlespacing
    %    \vspace*{1.20625in}%modified by John
    %\begin{center}
     %   Approved by the Department of Mathematics:

    %\th@signature{\thesisDeptChair , Chairperson}

     %   \vspace*{1.7in}
      %  Approved by the Dissertation Committee:

    %\th@signature{\thesisMentor , Chairperson}

    %\th@signature{\thesisReader}% REQUIRED.

    %\ifthenelse{\equal{\th@readerThree}{none}}{\relax}
     %           {\th@signature{\th@readerThree}} % optional

    %\ifthenelse{\equal{\th@readerFour}{none}}{\relax}
     %           {\th@signature{\th@readerFour}} % optional

   % \ifthenelse{\equal{\th@readerFive}{none}}{\relax}
               % {\th@signature{\th@readerFive}} % optional
       % \vspace*{1.3in}%modified by John
        %Approved by the Graduate School:

        %\th@signature{\thesisGraduateDean , Dean}
    %\end{center}
     %   \thispagestyle{empty}
      %  \pagebreak
%}



\newcommand{\th@Acknowledgementpage}{
     \thispagestyle{plain}
    \if@makeAcknowledgements
                %modified by Daniel
        \addcontentsline{toc}{part}{\normalfont\normalsize  \vskip -0.35in ACKNOWLEDGMENTS\vspace*{-.35in}}
        \vspace*{0.24in}
        \normalfont\normalsize \begin{center} ACKNOWLEDGMENTS
\end{center} \vspace{0.07in}
        \doublespacing
        \th@acknowledgementsStash
    \fi
}

\newcommand{\th@Dedicationpage}{
    \clearpage
        \thispagestyle{plain}
        \if@makeDedication
        \addcontentsline{toc}{part}{\normalfont\normalsize \vskip.17in DEDICATION\vspace*{0in}}
        \vspace*{0.06in}
        \normalfont\normalsize \begin{center} DEDICATION
\end{center} \vspace{0.8in}
        \doublespacing
        \begin{center}
       \th@dedicationStash
       \end{center}
         \ifthenelse{\equal{\th@DefArg}{\th@dedicationTitleStash}
            }{\vfill}{\relax}
    \fi
}


\newcommand{\th@ToCpage}{
    \@THshortChapterfalse
    \if@shortToC
        \@THshortChaptertrue
        \typeout{Making Short ToC...}
    \fi
    \@thInHeadingfalse
    {\singlespacing
    \setlength{\cftbeforechapskip}{26pt}
    \setlength{\cftbeforesecskip}{10pt}
	\setlength{\cftbeforesubsecskip}{10pt}
	\setlength{\cftbeforesubsubsecskip}{10pt}
\renewcommand{\cftchappagefont}{}
\renewcommand{\cftpartpagefont}{}
 \renewcommand{\@tocrmarg}{2.9em plus1fil}
 \renewcommand{\cftdotsep}{2}
        \tableofcontents
        }
}


\newcommand{\th@LoFpage}{
         \singlespacing
    \addcontentsline{toc}{part}{\normalsize\hspace*{-0.0625in}
    \vspace*{-0.45in}\listfigurename\normalfont \vspace*{.8in}}
 \setlength{\cftbeforefigskip}{10pt}
 \setlength{\cftfigindent}{0.0in}
 \renewcommand{\@tocrmarg}{2.5em plus1fil}
    \listoffigures
}

\newcommand{\th@LoTpage}{
    \typeout{Making Short LoT...}
    \singlespacing
     \addcontentsline{toc}{part}{\normalsize\hspace*{-0.0625in}
    \vspace*{-0.45in}\listtablename\normalfont\vspace*{0.9in}}
 \setlength{\cftbeforetabskip}{10pt}
  \setlength{\cfttabindent}{0.0in}
   \renewcommand{\@tocrmarg}{2.5em plus1fil}
    \listoftables
}



% This performs the actual generation of the prologue

\newcounter{th@storepage}
\newcommand{\th@MakeThesisPrologue}{
\if@makePrologue
        \pagenumbering{roman}
        \th@Abstractpage
                \pagebreak
        \thesisMakeSignaturePage
       % \thesisTitlePage
        \thesisCopyrightPage
         %\addtocounter{page}{-1}
         \setcounter{th@storepage}{\value{page}}
                \pagestyle{plain}
        \th@ToCpage
        \pagebreak
                \pagestyle{plain}
        \if@makenoLoF
          \relax
        \else
         \th@LoFpage
                \pagebreak
                \pagestyle{plain}
                \fi
        \if@makenoLoT
          \relax
        \else
          \th@LoTpage
                  \pagebreak
          \fi
        \th@Acknowledgementpage

        \th@Dedicationpage

    \fi

    \pagestyle{plain}
}

%%
%% Run some special commands when the document first starts.
%%
\let\th@OldBeginDocument\document
\renewcommand*{\document}{
    \th@OldBeginDocument
    \th@MakeThesisPrologue
    \doublespacing
    \clearpage
    \pagenumbering{arabic}
    \@THshortChapterfalse
}

%%
%% Parameters expected in the prologue:
%%

\renewcommand*{\title}[1]{\th@StoreIn{\thesisTitle}{#1}}
\newcommand*{\mentor}[1]{\th@StoreIn{\thesisMentor}{#1}}
\newcommand*{\reader}[1]{\th@StoreIn{\thesisReader}{#1}}
\newcommand*{\deptChair}[1]{\th@StoreIn{\thesisDeptChair}{#1}}
\newcommand*{\graduateDean}[1]{\th@StoreIn{\thesisGraduateDean}{#1}}
\newcommand*{\confDate}[1]{\th@StoreIn{\thesisConfDate}{#1}}

\newcommand*{\readerThree}[1]{\th@StoreIn{\th@readerThree}{#1}}
\newcommand*{\readerFour}[1]{\th@StoreIn{\th@readerFour}{#1}}
\newcommand*{\readerFive}[1]{\th@StoreIn{\th@readerFive}{#1}}
% \newcommand*{\readerSix}[1]{\th@StoreIn{\th@readerSix}{#1}}

\newcommand{\acknowledgements}[1]{
    \@makeAcknowledgementstrue
    \th@StoreIn{\th@acknowledgementsStash}{\hspace*{0.42in}#1}
}

\newcommand{\dedication}[2][\th@DefArg]{
    \@makeDedicationtrue
    \th@StoreIn{\th@dedicationTitleStash}{#1}
    \th@StoreIn{\th@dedicationStash}{#2}
}

\renewcommand*{\author}[1]{
    \th@StoreIn{\thesisAuthorName}{#1}
}

\newcommand*{\degrees}[1]{
    \th@StoreIn{\yourDegrees}{#1}
}

\renewcommand{\abstract}[1]{
    \th@StoreIn{\th@abstract}{\hspace*{0.42in}#1}
}

\newcommand*{\SuspendPrologue}{
    \@makeProloguefalse
    \typeout{No prologue pages printed.}
}

\newcommand*{\makeCopyrightPage}{
    \@makeThesisCopyrightPagetrue
    \typeout{Copyright page will be printed.}
}

\newcommand*{\emptyLoF}{
    \@makenoLoFtrue
    \typeout{No LoF printed}
}

\newcommand*{\emptyLoT}{
    \@makenoLoTtrue
    \typeout{No LoT printed}
}

\newcommand*{\ToCisShort}{
    \@shortToCtrue
    \typeout{Putting page number on short ToC}
}

\newcommand*{\LoFisShort}{
    \@shortLoFtrue
    \typeout{Putting page number on short LoF}
}

\newcommand*{\LoTisShort}{
    \@shortLoTtrue
    \typeout{Putting page number on short LoT}
}
%From here on, is all modified by Daniel

%redefinition of the caption,
%it should not have a colon after the figure number,
%instead it should have a point
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1. #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
\vskip\belowcaptionskip}



\endinput
%% End of file ``phd.cls''
