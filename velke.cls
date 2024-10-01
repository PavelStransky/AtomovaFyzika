\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{velke}[v0.5 -- 2022/10/27 -- XeLaTeX class pro studenty s postizenim zraku]
% PROSBA: Drazí kolegové, prosím, neprovádějte větší modifikace tohoto balíčku a už vůbec je nešiřte. Návrhy na změny řešte přímo se mnou a já se je případně budu snažit implementovat (nebo začlením Váš vlastní kód). Nerad bych, aby vznikl nekontrolovatelný chaos různých verzí. Do tvorby tohoto balíčku, byť není zdaleka dokonalý, jsem investoval dost času a rád bych si ho udržel pod kontrolou. Předem děkuji všem uživatelům za respektování této prosby a přeji pohodlné používání.
% POZNAMKA: Zatim jde o velmi predbeznou verzi. Podle casovych moznosti to postupne udelam ponekud profesionalneji.
%
% POZOR: projekty pouzivajici tento class je potreba sazet pouzitim XeLaTeX kvuli pouzitym fontum (zejmena dobre citelne Calibri pro hlavni text). XeLaTeX je standardni soucasti distribuce MikTeX, nemelo by tedy byt potreba instalovat nic noveho. V nekterych editorech lze snadno prepinat mezi kompilatory.
% POZOR: Pouziva papir formatu A6, diky cemuz jsou jednoduse pouzitelne velikosti fontu 8-20pt (viz nize) dostatecne velke vzhledem k papiru.
% TISK  VYSTUPU: nutno nastavit vhodne nastavit tiskarnu, aby vyuzila celou plochu papiru (tj. roztahla pdf v A6 na celou A4, na kterou tisknete).
%
% PRIKLAD VOLANI BALICKU: \documentclass[A6,NaSirku,17pt,UzkyOkraj,CislaStr,StylVet]{velke}
%
% OPTIONS - volby ktere lze pouzit pri volani balicku:
% A4, A5, A6 - pro opravdu velkou sazbu volte napriklad A6,17pt s tím, že to roztahnete na celou A4 pri tisku. Je to "nouzove reseni", protoze vetsich fontu nez 20pt se neda "snadno" docilit
% 8pt, 9pt, 10pt, 11pt, 12pt, 14pt, 17pt, and 20pt - pripustne velikosti textu, napr 15pt nefunguje;
% NaSirku - sazba na sirku - napr. pro velikost 17pt je uz jeden radek na papiru A6 opravdu prilis kratky a landscape je tedy nutnost.
% CislaStr - vysazi i cisla stranek (pri vynechani teto volby se cisla vubec neobjevi)
% StylVet - deklaruje styl sazby definic a vet (cesky), ktery doporucuji; nize je mozno zmenit nazvy, napr. misto "veta" pouzivat "thm" apod.
% ZarovnatVpravo - Nedoporucuji! Default je \raggedright, tj. radky nemusi byt stejne dlouhe, a to z dobreho duvodu: vsechny mezery mezi slovy jsou tak stejne dlouhe a nedochazi k deleni slov (oboji ztezuje cteni). Pri pouziti volby ZarovnatVpravo bude sazba zarovnana vpravo, tj. vsechny raddky pokud mozno az po pravy okraj (jak je to bezne). Krome uz uvedenuch nedostatku to u velmi velkych fontu proste nevypada dobre.
% SirokyOkraj - default je opravdu uzky okraj kvuli lepsimu vyuziti papiru pri velkem fontu. Touto volbou lze okraj ponekud rozsirit.
% UzkyOkraj - toto je implicitni nastaveni s velmi uzkymi okraji; lze zmenit volbou vyse
% en - pro pouziti v anglictine - pouze nezavola \RequirePackage[czech]{babel}
%
% DEFAULT volby: A4,UzkyOkraj, na vysku, bez cisel stranek, velikost fontu 10pt
%
% JINE JAZYKY: samozrejme lze v balicku babel (volanem nize) nastavit take jine jazyky - nutno editovat kod nize
%
% POZOR na predefinovana prostredi equation a equation*, ktera se nyni snazi zalamovat radky v pripade preteceni. Nektere komplikovanejsi konstrukce v techto prostredich nemusi fungovat.
%
% Veskera kurziva je odstranena kvuli horsi citelnosti. Je nahrazena rovnym nebo tucnym textem. To plati i pro sazbu math mode. Vsechny fonty jsou bezpatkove kvuli citelnosti.
%
%
% AUTOR: Martin Rmoutil (KDM MFF UK), e-mail: rmoutil@karlin.mff.cuni.cz
%
\makeatletter%
\newlength{\ACtyriOkraj}
\newlength{\APetOkraj}
\newlength{\ASestOkraj}
\newif\if@CislaStr%
\newif\if@NaSirku%
\newif\if@ACtyriPapir%
\newif\if@APetPapir%
\newif\if@ASestPapir%
\newif\if@ZarovnatVpravo%
\newif\if@StylVet%
\newif\if@Anglicky%
\DeclareOption{twoside}{\OptionNotUsed}%
\DeclareOption{NaSirku}{\@NaSirkutrue}%
\DeclareOption{CislaStr}{\@CislaStrtrue}%
\DeclareOption{ZarovnatVpravo}{\@ZarovnatVpravotrue}%
\DeclareOption{A4}{\@ACtyriPapirtrue\@APetPapirfalse\@ASestPapirfalse}%
\DeclareOption{A5}{\@APetPapirtrue\@ACtyriPapirfalse\@ASestPapirfalse}%
\DeclareOption{A6}{\@ASestPapirtrue\@ACtyriPapirfalse\@APetPapirfalse}%
\DeclareOption{SirokyOkraj}{\setlength{\ASestOkraj}{7mm}\setlength{\APetOkraj}{10mm}\setlength{\ACtyriOkraj}{14mm}}
\DeclareOption{UzkyOkraj}{\setlength{\ASestOkraj}{4mm}\setlength{\APetOkraj}{5.6mm}\setlength{\ACtyriOkraj}{8mm}}
\DeclareOption{StylVet}{\@StylVettrue}%
\DeclareOption{en}{\@Anglickytrue}%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extbook}}%
%
\ExecuteOptions{A4,UzkyOkraj}
%
\ProcessOptions\relax%
\LoadClass[oneside,openany]{extbook}%
%
%\RequirePackage[T1]{fontenc}%
%\RequirePackage[utf8]{inputenc}%
\if@Anglicky%
  \relax%
\else%
  \RequirePackage[czech]{babel}%
\fi
\RequirePackage[x11names]{xcolor}%  potreba i jinde nez v nasl. volbe
\definecolor{TmaveZelena}{rgb}{0.,0.6,0.}%
%
\RequirePackage[nocheck]{fancyhdr}%
\renewcommand{\headrulewidth}{0pt}%
\renewcommand{\footrulewidth}{0pt}%
%
\if@CislaStr%
  \newcommand{\@cisloStrStyl}[1]{%
    {%
      \setlength\fboxrule{1.2pt}%
      \setlength\fboxsep{2pt}%
      \boxed{\textcolor{TmaveZelena}{\textup{\textbf{#1}}}}%
    }%
  }%
  \if@NaSirku%
    \if@ASestPapir%
      \RequirePackage[a6paper,landscape,includefoot,left=\ASestOkraj,right=\ASestOkraj,top=\ASestOkraj,bottom=\ASestOkraj,footskip=2.2ex]{geometry}%
      \pagestyle{fancy}%
      \fancyhead[L,C,R]{}%
      \fancyfoot[L,C]{}%
      \fancyfoot[R]{\@cisloStrStyl{\thepage}}%
    \else\fi%
    \if@APetPapir%
      \RequirePackage[a5paper,landscape,includefoot,left=\APetOkraj,right=\APetOkraj,top=\APetOkraj,bottom=\APetOkraj,footskip=2.2ex]{geometry}%
      \pagestyle{fancy}%
      \fancyhead[L,C,R]{}%
      \fancyfoot[L,C]{}%
      \fancyfoot[R]{\@cisloStrStyl{\thepage}}%
    \else\fi%
    \if@ACtyriPapir%
      \RequirePackage[a4paper,landscape,includefoot,left=\ACtyriOkraj,right=\ACtyriOkraj,top=\ACtyriOkraj,bottom=\ACtyriOkraj,footskip=2.2ex]{geometry}%
      \pagestyle{fancy}%
      \fancyhead[L,C,R]{}%
      \fancyfoot[L,C]{}%
      \fancyfoot[R]{\@cisloStrStyl{\thepage}}%
    \else\fi%
  \else%
    \if@ASestPapir%
      \RequirePackage[a6paper,includefoot,left=\ASestOkraj,right=\ASestOkraj,top=\ASestOkraj,bottom=\ASestOkraj,footskip=2.2ex]{geometry}%
      \pagestyle{fancy}%
      \fancyhead[L,C,R]{}%
      \fancyfoot[L,C]{}%
      \fancyfoot[R]{\@cisloStrStyl{\thepage}}%
    \else\fi%
    \if@APetPapir%
      \RequirePackage[a5paper,includefoot,left=\APetOkraj,right=\APetOkraj,top=\APetOkraj,bottom=\APetOkraj,footskip=2.2ex]{geometry}%
      \pagestyle{fancy}%
      \fancyhead[L,C,R]{}%
      \fancyfoot[L,C]{}%
      \fancyfoot[R]{\@cisloStrStyl{\thepage}}%
    \else\fi%
    \if@ACtyriPapir%
      \RequirePackage[a4paper,includefoot,left=\ACtyriOkraj,right=\ACtyriOkraj,top=\ACtyriOkraj,bottom=\ACtyriOkraj,footskip=2.2ex]{geometry}%
      \pagestyle{fancy}%
      \fancyhead[L,C,R]{}%
      \fancyfoot[L,C]{}%
      \fancyfoot[R]{\@cisloStrStyl{\thepage}}%
    \else\fi%
  \fi%
\else%
  \if@NaSirku%
    \if@ASestPapir%
      \RequirePackage[a6paper,landscape,left=\ASestOkraj,right=\ASestOkraj,top=\ASestOkraj,bottom=\ASestOkraj]{geometry}%
      \pagestyle{fancy}%
      \fancyhead[L,C,R]{}%
      \fancyfoot[L,C,R]{}%
    \else\fi%
    \if@APetPapir%
      \RequirePackage[a5paper,landscape,left=\APetOkraj,right=\APetOkraj,top=\APetOkraj,bottom=\APetOkraj]{geometry}%
      \pagestyle{fancy}%
      \fancyhead[L,C,R]{}%
      \fancyfoot[L,C,R]{}%
    \else\fi%
    \if@ACtyriPapir%
      \RequirePackage[a4paper,landscape,left=\ACtyriOkraj,right=\ACtyriOkraj,top=\ACtyriOkraj,bottom=\ACtyriOkraj]{geometry}%
      \pagestyle{fancy}%
      \fancyhead[L,C,R]{}%
      \fancyfoot[L,C,R]{}%
    \else\fi%
  \else%
    \if@ASestPapir%
      \RequirePackage[a6paper,left=\ASestOkraj,right=\ASestOkraj,top=\ASestOkraj,bottom=\ASestOkraj]{geometry}%
      \pagestyle{fancy}%
      \fancyhead[L,C,R]{}%
      \fancyfoot[L,C,R]{}%
    \else\fi
    \if@APetPapir%
      \RequirePackage[a5paper,left=\APetOkraj,right=\APetOkraj,top=\APetOkraj,bottom=\APetOkraj]{geometry}%
      \pagestyle{fancy}%
      \fancyhead[L,C,R]{}%
      \fancyfoot[L,C,R]{}%
    \else\fi%
    \if@ACtyriPapir%
      \RequirePackage[a4paper,left=\ACtyriOkraj,right=\ACtyriOkraj,top=\ACtyriOkraj,bottom=\ACtyriOkraj]{geometry}%
      \pagestyle{fancy}%
      \fancyhead[L,C,R]{}%
      \fancyfoot[L,C,R]{}%
    \else\fi%
  \fi%
\fi%
%
\makeatother%
%
%
\RequirePackage{mathtools}% (prikaz \newtagform - nize pod hyperref)
%
\RequirePackage[no-math]{fontspec}% umoznuje uzivat systemove fonty; cena je pouziti xeLatex (nebo Lua)
\setmainfont{Calibri}%
%
\makeatletter%
\if@ZarovnatVpravo%
  \relax
\else
  \raggedright% text je zarovnán pouze vlevo => mezery mezi slovy stějně dlouhé
  \vfuzz0.2ex% Don't report over-full v-boxes if over-edge is small
  \hfuzz0.2ex% Don't report over-full h-boxes if over-edge is small
\fi%
\makeatother%
\setlength{\parindent}{2ex}% volba \raggedright výše vynuluje \parindent, což nechceme
%
\fontdimen2\font=0.3em%
% o chlup delší mezery mezi slovy pro lepší čitelnost
%
\RequirePackage[symbolgreek, noequal]{mathastext}%
% matematická sazba není kurzívou (která se hůře čte)
%
\MTSymbolScale{0.95}%
% option=symbolkgreek dava moc velka recka pismena; toto je zmensi
%
\MTforallskip{2mu}%     delsi mezery za kvantifikatory (1mu = em/18)
\MTexistsskip{2mu}%
\MTprimeskip{2mu}%
% carka (napr. derivace funkce) neni nalepena primo na pismenko
%
\RequirePackage{bm}% tučné symboly
%
\RequirePackage{amsthm}%
\RequirePackage{amssymb}%
\RequirePackage{amsfonts}%
% tyto balíčky by měly být volány až po volbě fontu (výše - Calibri)
%
\RequirePackage[shortlabels,inline]{enumitem}%
\setlist{align=left, parsep=0ex, listparindent=\parindent}%
\setlist[enumerate]{labelindent=0ex, labelwidth=3ex, labelsep=1ex, itemindent=4ex, leftmargin=0ex, font=\color{enumeratecolor}}%
\renewcommand\labelitemi{$\blacktriangleright$}
\setlist[itemize]{labelindent=0ex, labelwidth=2.5ex, labelsep=0ex, itemindent=2.5ex, leftmargin=0ex, font=\color{itemizecolor}}%
% cislovane seznamy nemaji hlubsi odsazeni nez okolni text
%
\newcommand{\tagBarva}{RoyalBlue3}%
\newcommand{\vetaBarva}{TmaveZelena}%
\newcommand{\dukazBarva}{RoyalBlue3}%
\newcommand{\nadpisBarva}{TmaveZelena}%
\colorlet{itemizecolor}{\tagBarva}% Default colour for \item in itemize; timto prikazem lze menit i prubezne v textu
\colorlet{enumeratecolor}{\tagBarva}% Default colour for \item in enumerate
%
%\setlist[description]{font=\bfseries\color{descriptioncolor}}%
%\colorlet{descriptioncolor}{blue}% Default colour for \item[.] in description
%
\RequirePackage[unicode, colorlinks=true]{hyperref}% hyperref pokud možno volat jako poslední
%
\let\cleardoublepage\clearpage% Hack na odstraneni prazdnych stran na zac. kap.
%
\newtagform{blue}{\color{\tagBarva}(}{)}%
%\newtagform{redandblue}[\textcolor{RoyalBlue3}]{\color{red}(}{)}
\usetagform{blue}%
%
%%%%% Jiný font a barva slova "Důkaz" na začátku důkazů.
\newcommand{\prooffont}{\scshape\color{\dukazBarva}}%
\RequirePackage{xpatch}%
\tracingpatches%
\xpatchcmd{\proof}{\itshape}{\prooffont}{}{}%
%
%
%
%%%%%%%%%%%%%%%%% AUTOMATICKÉ ZALAMOVÁNÍ ROVNIC %%%%%%%%%%%%%%%%%
% Známé problémy: občas nelze používat prostředí split, nelze
% používat \tag{...}, nekonzistentní spacing nad a pod rovnicí
\renewenvironment{equation*}%
  {\begin{center}\(\displaystyle}%
  {\)\end{center}}%
%
\let\Equation\equation%
\let\endEquation\endequation%
\renewenvironment{equation}%
  {\par\bigskip\noindent\begin{minipage}{0.85\textwidth}\begin{center}\refstepcounter{equation}\(\displaystyle}%
  {\)\end{center}\end{minipage}\hfill\textcolor{\tagBarva}{(\theequation)}\newline\mbox{}\par\noindent}%
%%%%%%%%%%%%%% AUTOMATICKÉ ZALAMOVÁNÍ ROVNIC - KONEC %%%%%%%%%%%%
%
\let\epsilon\varepsilon%
%
\newcommand{\Emph}{}%
\let\Emph\emph%
\renewcommand{\emph}[1]{\textbf{#1}}%
%
\newcommand{\Textit}{}%
\let\Textit\textit%
\renewcommand{\textit}[1]{\textbf{#1}}%
% zdůrazňování tučným textem místo kurzívy (nyní lze kurzívy docílit pomocí \Emph nebo \Textit)
%
\let\footnotesize\small%
% větší poznámky pod čarou, ale stále menší než hl. text pro odlišení
%
\renewcommand{\qedsymbol}{$\blacksquare$}% konec důkazu: plný černý čtvereček je lépe vidět
\renewcommand{\boxtimes}{\blacksquare}%
%
%
%%%%%%%%%%%%%%%%% NADPISY KAPITOL, SEKCÍ A SUBSEKCÍ %%%%%%%%%%%%%%%%%
\RequirePackage{etoolbox}%
%
%\makeatletter
%\patchcmd{\@maketitle}{\vskip 2em}{\vskip 1em}{}{}
%\makeatother
%
\RequirePackage[small,compact]{titlesec}%
\patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{fancy}}{}{}%
\titleformat{\chapter}[display]{%
    \normalfont%
    \Large% %change this size to your needs for the first line
    \bfseries%
    \color{\nadpisBarva}%
  }{%
    \chaptertitlename\; \thechapter}{30pt}{%
    \Large% %change this size to your needs for the second line
  }%
\titleformat{\section}{%
    \normalfont%
    \large%
    \bfseries%
    \color{\nadpisBarva}%
  }{%
    \thesection}{15pt}{%
    \large%
  }%
\titleformat{\subsection}{%
    \normalfont%
    \normalsize%
    \bfseries%
    \color{\nadpisBarva}%
  }{%
    \thesubsection}{12pt}{%
    \normalsize%
  }%
%%%%%%%%%%%%% NADPISY KAPITOL, SEKCÍ A SUBSEKCÍ - KONEC %%%%%%%%%%%%%
%
%
%
%%%%%%%%%%%%%%%%%%%% VĚTY, LEMMATA, DEFINICE ATD. %%%%%%%%%%%%%%%%%%%%%%%%%%%
% vše definition style nebo remark style, aby to nebylo kurzivou (hůře čitelná).
%
%
\makeatletter%
\if@StylVet%
  \newtheoremstyle{Vveta}% 〈name〉
  {0.5\baselineskip}%  Space above
  {0.5\baselineskip}%  Space below
  {\upshape}% Body font
  {}% Indent amount
  {\scshape\color{\vetaBarva}}% Theorem head font
  {.}% Punctuation after theorem head
  {.5em}% Space after theorem head
  {}% Theorem head spec (can be left empty, meaning ‘normal’)
%
  \swapnumbers%
  \theoremstyle{Vveta}%
%
  \newtheorem{veta}{ Věta}[chapter]%
  \newtheorem*{veta*}{ Věta}%
  \newtheorem{lemma}[veta]{ Lemma}%
  \newtheorem*{lemma*}{ Lemma}%
  \newtheorem{tvrzeni}[veta]{ Tvrzení}%
  \newtheorem*{tvrzeni*}{ Tvrzení}%
  \newtheorem{dusledek}[veta]{ Důsledek}%
  \newtheorem*{dusledek*}{ Důsledek}%
  \newtheorem{pozorovani}[veta]{ Pozorování}%
  \newtheorem*{pozorovani*}{ Pozorování}%
  \newtheorem{cviceni}[veta]{ Cvičení}%
  \newtheorem*{cviceni*}{ Cvičení}%
  \newtheorem{defn}[veta]{ Definice}%
  \newtheorem*{defn*}{ Definice}%
  \newtheorem{metoda}[veta]{ Metoda}%
  \newtheorem*{metoda*}{ Metoda}%
  \newtheorem{otazka}[veta]{ Otázka}%
  \newtheorem*{otazka*}{ Otázka}%
  \newtheorem{pozn}[veta]{ Poznámka}%
  \newtheorem*{pozn*}{ Poznámka}%
  \newtheorem{uloha}[veta]{ Úloha}%
  \newtheorem*{uloha*}{ Úloha}%
  \newtheorem{umluva}[veta]{ Úmluva}%
  \newtheorem*{umluva*}{ Úmluva}%
  \newtheorem{znaceni}[veta]{ Značení}%
  \newtheorem*{znaceni*}{ Značení}%
  \newtheorem{prikladx}[veta]{ Příklad}% bez QED symbolu
  \newtheorem{prikladx*}{ Příklad}% bez QED symbolu
%
  \newenvironment{priklad}% číslovaný příklad zakončený černým kosočtvercem
    {\pushQED{\qed}\renewcommand{\qedsymbol}{$\blacklozenge$}\prikladx}%
    {\popQED\endprikladx}%
  \newtheorem*{prikladxx}{ Příklad}%
  \newenvironment{priklad*}% nečíslovaný příklad zakončený černým kosočtvercem
    {\pushQED{\qed}\renewcommand{\qedsymbol}{$\blacklozenge$}\prikladxx}%
    {\popQED\endprikladxx}%
%
\else\fi%
\makeatother%
%
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%% TUCNE ZNAKY %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\RequirePackage{bbm}%
\renewcommand{\mathbb}[1]{\mathbbmss{#1}}%
%
\newcommand\Varnothing{}%
\let\Varnothing\varnothing%
\newcommand{\boldvarnothing}{\pmb{\Varnothing}}%
\let\emptyset\boldvarnothing%
\let\varnothing\boldvarnothing%
%
\newcommand\Forall{}%
\let\Forall\forall%
\newcommand{\boldforall}{\pmb{\Forall}}%
\let\forall\boldforall%
%
\newcommand\Exists{}%
\let\Exists\exists%
\newcommand{\boldexists}{\pmb{\Exists}}%
\let\exists\boldexists%
%
\newcommand\Oleqslant{}%
\let\Oleqslant\leqslant%
\newcommand{\boldleqslant}{\pmb{\Oleqslant}}%
\let\leqslant\boldleqslant%
%
\newcommand\Ogeqslant{}%
\let\Ogeqslant\geqslant%
\newcommand{\boldgeqslant}{\pmb{\Ogeqslant}}%
\let\geqslant\boldgeqslant%
%
\newcommand\Ocup{}%
\let\Ocup\cup%
\newcommand{\boldcup}{\pmb{\Ocup}}%
\let\cup\boldcup%
%
\newcommand\Ocap{}%
\let\Ocap\cap%
\newcommand{\boldcap}{\pmb{\Ocap}}%
\let\cap\boldcap%
%
\newcommand\Osubseteq{}%
\let\Osubseteq\subseteq%
\newcommand{\boldsubseteq}{\pmb{\Osubseteq}}%
\let\subseteq\boldsubseteq%
%
\newcommand\Osupseteq{}%
\let\Osupseteq\supseteq%
\newcommand{\boldsupseteq}{\pmb{\Osupseteq}}%
\let\supseteq\boldsupseteq%
%
\newcommand\Osubset{}%
\let\Osubset\subset%
\newcommand{\boldsubset}{\pmb{\Osubset}}%
\let\subset\boldsubset%
%
\newcommand\Osupset{}%
\let\Osupset\supset%
\newcommand{\boldsupset}{\pmb{\Osupset}}%
\let\supset\boldsupset%
%
\newcommand\Oland{}%
\let\Oland\land%
\newcommand{\boldland}{\pmb{\Oland}}%
\let\land\boldland%
%
\newcommand\Olor{}%
\let\Olor\lor%
\newcommand{\boldlor}{\pmb{\Olor}}%
\let\lor\boldlor%
%
%\newcommand\OLongrightarrow{}%   ŠIPKY NEFUNGUJÍ
%\let\OLongrightarrow\Longrightarrow%
%\newcommand{\boldLongrightarrow}{{\bm{\OLongrightarrow}}}%
%\let\Longrightarrow\boldLongrightarrow%
%%
%\newcommand\OLongrightarrow{}%
%\let\OLongrightarrow\Longrightarrow%
%\newcommand{\boldLongrightarrow}{{\bm{\OLongrightarrow}}}%
%\let\Longrightarrow\boldLongrightarrow%
%%
\newcommand\Oin{}%
\let\Oin\in%
\newcommand{\boldin}{\pmb{\Oin}}%
\let\in\boldin%
%
\newcommand\Oinfty{}%
\let\Oinfty\infty%
\newcommand{\boldinfty}{{\bm{\Oinfty}}}%
\let\infty\boldinfty%
%
\newcommand\Oto{}%
\let\Oto\to%
\newcommand{\boldto}{{\bm{\Oto}}}%
\let\to\boldto%
%
\newcommand\Oneg{}%
\let\Oneg\neg%
\newcommand{\boldneg}{{\bm{\Oneg}}}%
\let\neg\boldneg%
