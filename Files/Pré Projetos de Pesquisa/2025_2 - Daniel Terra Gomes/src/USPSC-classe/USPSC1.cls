%% USPSC1.cls v3.2
%% A Classe USPSC 16/06/2016 é uma derivada da abntex2.cls, v-1.9.5 para as Unidades do %% Campus USP de São Carlos:
%% EESC - Escola de Engenharia de São Carlos
%% IAU - Instituto de Arquitetura e Urbanismo
%% ICMC - Instituto de Ciências Matemáticas e de Computação
%% IFSC - Instituto de Física de São Carlos
%% IQSC - Instituto de Química de São Carlos
%%
%% A classe USPSC consiste dos arquivos USPSC.cls e USPSC1.cls, integra o 
%% Pacote USPSC que é mantido pela seguinte equipe:
%% Programação:
%%   - Marilza Aparecida Rodrigues Tognetti - marilza@sc.usp.br (PUSP-SC)
%%   - Ana Paula Aparecida Calabrez - aninha@sc.usp.br (PUSP-SC)
%% Normalização:
%%   - Brianda de Oliveira Ordonho Sigolo - brianda@usp.br (IAU)
%%   - Eduardo Graziosi Silva - edu.gs@sc.usp.br (EESC)
%%   - Eliana de Cássia Aquareli Cordeiro - eliana@iqsc.usp.br (IQSC)
%%   - Flávia Helena Cassin - cassinp@sc.usp.br (EESC)
%%   - Maria Cristina Cavarette Dziabas - mcdziaba@ifsc.usp.br (IFSC)
%%   - Regina Célia Vidal Medeiros - rcvmat@icmc.usp.br (ICMC)
%%
%% Sobre a classe abntex2.cls:
%% abntex2.cls, v-1.9.5 laurocesar
%% Copyright 2012-2015 by abnTeX2 group at https://www.abntex.net.br/ 
%%

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Declaracao da classe USPSC como uma extensao da classe memoir (extensão da abntex2)
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{USPSC-classe/USPSC}[01/06/2021 v3.1 USPSC]
\RequirePackage{ifthen}
%
% Captura as options article e twocolumn
%
\providecommand{\ABNTEXisarticle}{false}
\DeclareOption{article}{
	\renewcommand{\ABNTEXisarticle}{true}
	\PassOptionsToClass{article}{memoir}%}
}
\providecommand{\ABNTEXistwocolumn}{false}
\DeclareOption{twocolumn}{
\renewcommand{\ABNTEXistwocolumn}{true}
\PassOptionsToClass{twocolumn}{memoir}%}
}
%	
% Opcoes chapter=TITLE, section=TITLE, subsection=TITLE e
% subsubsection=TITLE: titulos em letras maiusculas
% 
\newboolean{ABNTEXupperchapter}     %true=titles of chapter/appendix in uppercase
\newboolean{ABNTEXuppersection}     %true=titles of sections in uppercase
\newboolean{ABNTEXuppersubsection}  %true=titles of subsections in uppercase
\newboolean{ABNTEXuppersubsubsection}  %true=titles of subsubsections in uppercase
\newboolean{ABNTEXuppersubsubsubsection}  %true=titles of subsubsubsections in uppercase
\setboolean{ABNTEXupperchapter}{false}
\setboolean{ABNTEXuppersection}{false}
\setboolean{ABNTEXuppersubsection}{false}
\setboolean{ABNTEXuppersubsubsection}{false}
\setboolean{ABNTEXuppersubsubsubsection}{false}
\DeclareOption{chapter=TITLE}{\setboolean{ABNTEXupperchapter}{true}}
\DeclareOption{section=TITLE}{\setboolean{ABNTEXuppersection}{true}}
\DeclareOption{subsection=TITLE}{\setboolean{ABNTEXuppersubsection}{true}}
\DeclareOption{subsubsection=TITLE}{\setboolean{ABNTEXuppersubsubsection}{true}}
\DeclareOption{subsubsubsection=TITLE}{\setboolean{ABNTEXuppersubsubsubsection}{true}}
%
% Opções de diagramação de sumários
% sumario=tradicional    : Sumário tradicional do LaTeX/Memoir
% sumario=abnt-6027-2012 : Sumário conforme recomendação da ABNT NBR 6027:2012
\newboolean{ABNTEXsumario-tradicional}     %true=titles of chapter/appendix in uppercase
\newboolean{ABNTEXsumario-abnt-6027-2012} 
\setboolean{ABNTEXsumario-tradicional}{false}
\setboolean{ABNTEXsumario-abnt-6027-2012}{true}
\DeclareOption{sumario=tradicional}{%
\setboolean{ABNTEXsumario-tradicional}{true}%
\setboolean{ABNTEXsumario-abnt-6027-2012}{false}}
\DeclareOption{sumario=abnt-6027-2012}{%
\setboolean{ABNTEXsumario-abnt-6027-2012}{true}
\setboolean{ABNTEXsumario-tradicional}{false}}
%
% Repassa demais opcoes a memoir	
%
\DeclareOption*{%
\PassOptionsToClass{\CurrentOption}{memoir}%
}
\ProcessOptions\relax
\LoadClass{memoir}

% sumario=abnt-6027-2012 : Sumário conforme recomendação da ABNT NBR 6027:2012, que
%    só pode ser usado com memoir v3.6k ou superior
%    \settocpreprocessor \changes{v3.6k}{2012/09/18}{Added}
\ifdefined\settocpreprocessor
\else
\setboolean{ABNTEXsumario-tradicional}{true}
\setboolean{ABNTEXsumario-abnt-6027-2012}{false}
\fi


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos para tratamento de opcoes proprias
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
%---
% cor para capa ICMC
\RequirePackage{color, xcolor}  % Controle das cores
\definecolor{capa-azul}{RGB}{16,62,93}
%---

% ---
% Comandos para controlar as opcoes de titulos com letras maiusculas 
% ---

% pacote que prove \MakeTextUppercase
\RequirePackage{textcase}

\newcommand{\ABNTEXchapterupperifneeded}[1]{\ifthenelse{\boolean{ABNTEXupperchapter}}{\MakeTextUppercase{#1}}{#1}}
\newcommand{\ABNTEXsectionupperifneeded}{\ifthenelse{\boolean{ABNTEXuppersection}}{\MakeTextUppercase}{}}
\newcommand{\ABNTEXsubsectionupperifneeded}{\ifthenelse{\boolean{ABNTEXuppersubsection}}{\MakeTextUppercase}{}}
\newcommand{\ABNTEXsubsubsectionupperifneeded}{\ifthenelse{\boolean{ABNTEXuppersubsubsection}}{\MakeTextUppercase}{}}
\newcommand{\ABNTEXsubsubsubsectionupperifneeded}{\ifthenelse{\boolean{ABNTEXuppersubsubsubsection}}{\MakeTextUppercase}{}}
% ---

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Pacotes adicionais e customizacoes gerais do memoir
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Do pacote de if/them/else
\newcommand{\abntex@ifnotempty}[2]{\ifthenelse{\not\equal{#1}{}}{#2}{}}
% ---

% ---
% Controla as referencias internas do PDF
\RequirePackage{hyperref}
\pdfstringdefDisableCommands{\def\\{, }\def\and{; }}
% ---

% ---
% Controla os bookmarks do PDF
\RequirePackage{bookmark}   			
% ---

% ---
% Hifenizacao e caracteres especiais portugues-brasil por padrao
% ---
\RequirePackage[brazil]{babel}
%
% Nomes constantes do abnTeX2 em portugues (definicoes padroes)
\newcommand{\folhaderostoname}{Folha de rosto}
\newcommand{\folhaderostonamem}{Folha de rosto}
\newcommand{\folhaderostoadicname}{Folha de rosto adicional}
\newcommand{\folharostocarname}{Folha de rosto com carimbo}
\newcommand{\folharostocarnamem}{Folha de rosto com carimbo}
\newcommand{\folhaderostoaltname}{Folha de rosto alternativa}
\newcommand{\folhaderostoaltnamem}{Folha de rosto alternativa}
\newcommand{\epigraphname}{Ep\'igrafe}
\newcommand{\dedicatorianame}{Dedicat\'oria}
\newcommand{\errataname}{Errata}
\newcommand{\agradecimentosname}{Agradecimentos}
\newcommand{\anexoname}{ANEXO}
\newcommand{\anexosname}{ANEXOS}
\newcommand{\apendicename}{AP\^ENDICE}
\newcommand{\apendicesname}{AP\^ENDICES}
\newcommand{\orientadorname}{Orientador:}
\newcommand{\coorientadorname}{Coorientador:}
\newcommand{\areaname}{\'Area de concentra\c{c}\~ao:}
\newcommand{\opcaoname}{Op\c{c}\~ao:}
\newcommand{\folhadeaprovacaoname}{Folha de aprova\c{c}\~ao}
\newcommand{\resumoname}{Resumo} 
\newcommand{\listadesiglasname}{Lista de abreviaturas e siglas}
\newcommand{\listadesimbolosname}{Lista de s\'imbolos}
\newcommand{\fontename}{Fonte}
\newcommand{\notaname}{Nota}
%
\addto\captionsbrazil{% portugues-brasil
%% ajusta nomes padroes do babel
\renewcommand{\bibname}{Refer\^encias}
%\renewcommand{\indexname}{\'Indice}
\renewcommand{\indexname}{\'INDICE}
\renewcommand{\listfigurename}{Lista de figuras}
\renewcommand{\listtablename}{Lista de tabelas}
%% ajusta nomes usados com a macro \autoref
\renewcommand{\pageautorefname}{p\'agina}
\renewcommand{\sectionautorefname}{se{\c c}\~ao}
\renewcommand{\subsectionautorefname}{subse{\c c}\~ao}
\renewcommand{\subsubsectionautorefname}{subse{\c c}\~ao}
\renewcommand{\paragraphautorefname}{subse{\c c}\~ao}
}

% ---
\addto\captionsenglish{% ingles
%% adjusts names from abnTeX2 
\renewcommand{\bibname}{References}
\renewcommand{\folhaderostoname}{Title page}
\renewcommand{\folhaderostonamem}{Title page}
\renewcommand{\folhaderostoaltname}{Title page}
%\renewcommand{\folhaderostoaltnamem}{Title page}
\renewcommand{\folhaderostoadicname}{Title page additional}
\renewcommand{\epigraphname}{Epigraph}
\renewcommand{\dedicatorianame}{Dedication}
\renewcommand{\errataname}{Errata}
\renewcommand{\agradecimentosname}{Acknowledgements}
\renewcommand{\indexname}{INDEX}
\renewcommand{\anexoname}{ANNEX}
\renewcommand{\anexosname}{ANNEX}
\renewcommand{\apendicename}{APPENDIX}
\renewcommand{\apendicesname}{APPENDIX}
\renewcommand{\orientadorname}{Advisor:}
\renewcommand{\coorientadorname}{Coadvisor:}
\renewcommand{\folhadeaprovacaoname}{Approval}
%\renewcommand{\resumoname}{Abstract} 
\renewcommand{\resumoname}{Resumo} 
\renewcommand{\listadesiglasname}{List of abbreviations and acronyms}
\renewcommand{\listadesimbolosname}{List of symbols}
\renewcommand{\quadroname}{Frame}
\renewcommand{\listofquadroname}{List of frames}
\renewcommand{\fontename}{Source}
\renewcommand{\notaname}{Note}
%% adjusts names used by \autoref
\renewcommand{\pageautorefname}{page}
\renewcommand{\sectionautorefname}{section}
\renewcommand{\subsectionautorefname}{subsection}
\renewcommand{\subsubsectionautorefname}{subsubsection}
\renewcommand{\paragraphautorefname}{subsubsubsection}
}
% ---

% ---
%Constantes USPSC
%
% Comando para definição da autor abreviado
\providecommand{\imprimirautorabr}{}
\newcommand{\autorabr}[1]{\renewcommand{\imprimirautorabr}{#1}}

% Comando para definição da autor abreviado
\providecommand{\imprimirautorficha}{}
\newcommand{\autorficha}[1]{\renewcommand{\imprimirautorficha}{#1}}

% Comando para definição da autor abreviado
\providecommand{\imprimircutter}{}
\newcommand{\cutter}[1]{\renewcommand{\imprimircutter}{#1}}

% Comando para definição do idioma do texto
%\providecommand{\imprimiridiomatexto}{}
%\newcommand{\idiomatexto}[1]{\renewcommand{\imprimiridiomatexto}{#1}}

% Comando para definição da Unidade
\providecommand{\imprimirunidade}{}
\newcommand{\unidade}[1]{\renewcommand{\imprimirunidade}{#1}}

% Comando para definição da Unidade
\providecommand{\imprimirunidademin}{}
\newcommand{\unidademin}[1]{\renewcommand{\imprimirunidademin}{#1}}

% Comando para definição da Unidade
%\providecommand{\imprimirsiglaunidade}{}
%\newcommand{\siglaunidade}[1]{\renewcommand{\imprimirsiglaunidade}{#1}}


% Comando para definição da Universidade
\providecommand{\imprimiruniversidade}{}
\newcommand{\universidade}[1]{\renewcommand{\imprimiruniversidade}{#1}}

% Comando para definição da Universidade
\providecommand{\imprimiruniversidademin}{}
\newcommand{\universidademin}[1]{\renewcommand{\imprimiruniversidademin}{#1}}

% ---
% Título em português para o resumo
\providecommand{\imprimirtituloresumo}{}
\newcommand{\tituloresumo}[1]{\renewcommand{\imprimirtituloresumo}{#1}}

% Tipotrabalho em inglês (para o abstract)
\providecommand{\imprimirtipotrabalhoabs}{}
\newcommand{\tipotrabalhoabs}[1]{\renewcommand{\imprimirtipotrabalhoabs}{#1}}

% Comando para definição da notafolharosto
\providecommand{\imprimirnotafolharosto}{}
\newcommand{\notafolharosto}[1]{\renewcommand{\imprimirnotafolharosto}{#1}}

% ---
% Folha de rosto adicional
%\newcommand{\folhaderostoadicname}{FolhaAdicional}

% ---
% Título para página de rosto adicional
\providecommand{\imprimirtituloadic}{}
\newcommand{\tituloadic}[1]{\renewcommand{\imprimirtituloadic}{#1}}

% ---
% 22/02/2017 - Título para página de rosto adicional 
\providecommand{\imprimirpreambuloadic}{}
\newcommand{\preambuloadic}[1]{\renewcommand{\imprimirpreambuloadic}{#1}}

% ---
% 28/03/2017 - Orientador para página de rosto adicional
\providecommand{\imprimirorientadoradic}{}
\newcommand{\orientadoradic}[1]{\renewcommand{\imprimirorientadoradic}{#1}}

% ---
% 27/02/2024 - Coorientador para página de rosto adicional
\providecommand{\imprimircoorientadoradic}{}
\newcommand{\coorientadoradic}[1]{\renewcommand{\imprimircoorientadoradic}{#1}}

% ---
% 28/03/2017 - Área de concentração para página de rosto adicional
\providecommand{\imprimirareaadic}{}
\newcommand{\areaadic}[1]{\renewcommand{\imprimirareaadic}{#1}}

% ---
% 28/03/2017 - Opção para página de rosto adicional
\providecommand{\imprimiropcaoadic}{}
\newcommand{\opcaoadic}[1]{\renewcommand{\imprimiropcaoadic}{#1}}

% ---
% 28/03/2017 - Opção para página de rosto adicional
\providecommand{\imprimirnotafolharostoadic}{}
\newcommand{\notafolharostoadic}[1]{\renewcommand{\imprimirnotafolharostoadic}{#1}}

% ---% 26/03/2021
% Comando para definição da notacapaicmc
\providecommand{\imprimirnotacapaicmc}{}
\newcommand{\notacapaicmc}[1]{\renewcommand{\imprimirnotacapaicmc}{#1}}

% 20/05/2021
% Comando para definição de setorpos
\providecommand{\imprimirsetorpos}{}
\newcommand{\setorpos}[1]{\renewcommand{\imprimirsetorpos}{#1}}

% Comando para definição da disciplina para o preâmbulo dos relatórios
\providecommand{\imprimirdisciplina}{}
\newcommand{\disciplina}[1]{\renewcommand{\imprimirdisciplina}{#1}}

% Background da capa do ICMC
% 26/03/2021 ----------------
\newcommand\BackgroundPic{
\put(0,0){
\parbox[b][\paperheight]{\paperwidth}{
	\vfill
	\centering
	\includegraphics[width=\paperwidth,height=\paperheight,keepaspectratio]{USPSC-img/CapaICMC.jpg}
	\vfill
}}}
\makeatother
% Background branco
% 26/03/2021 ----------------
\newcommand\BackgroundBranco{
\put(0,0){
\parbox[b][\paperheight]{\paperwidth}{
	\vfill
	\centering
	\includegraphics[width=\paperwidth,height=\paperheight,keepaspectratio]{USPSC-img/USPSC-PaginaEmBranco.jpg}
	\vfill
}}}		
\makeatother				
% Customiza listas
\RequirePackage{enumitem}
% ---

% ---
% Pacote que permite realizar operacoes matematicas no codigo TeX
\RequirePackage{calc}
% ---

% ---
% Margens - NBR 14724/2011 - 5.1 Formato
% ---
\setlrmarginsandblock{3cm}{2cm}{*}
\setulmarginsandblock{3cm}{2cm}{*}
\checkandfixthelayout
% ---

% ---
% Espacamento entre linhas - NBR 14724/2011 - 5.2 Espacamento
% ---
\OnehalfSpacing
% ---

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos publicos
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% ``Tamanho menor e uniforme'' ditada pela NBR 14724/2011 - 5.1
% ---
\newcommand{\ABNTEXfontereduzida}{\footnotesize}
% ---

% ---
% abnTeX2 name
\newcommand{\abnTeX}{abn\TeX2}
% ---

% ---
% Fontes padroes de part, chapter, section, subsection e subsubsection 
\newcommand{\ABNTEXchapterfont}{\sffamily}
\newcommand{\ABNTEXchapterfontsize}{\Huge}

\newcommand{\ABNTEXpartfont}{\ABNTEXchapterfont}
\newcommand{\ABNTEXpartfontsize}{\ABNTEXchapterfontsize}

\newcommand{\ABNTEXsectionfont}{\ABNTEXchapterfont}
\newcommand{\ABNTEXsectionfontsize}{\Large}

\newcommand{\ABNTEXsubsectionfont}{\ABNTEXsectionfont}
\newcommand{\ABNTEXsubsectionfontsize}{\large}

\newcommand{\ABNTEXsubsubsectionfont}{\ABNTEXsubsectionfont}
\newcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}

\newcommand{\ABNTEXsubsubsubsectionfont}{\ABNTEXsubsectionfont}
\newcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}

\newcommand{\carimbofont}{\ABNTEXsubsectionfont}
\newcommand{\carimbofontsize}{\fontsize{8}{12}\normalfont}


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos e variaveis privados
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Comando para registro do bookmark interno
% ---
\newcounter{abntex@bookmarkcounter}
\setcounter{abntex@bookmarkcounter}{0}
\newcommand{\PRIVATEbookmarkthis}[1]{%
\addtocounter{abntex@bookmarkcounter}{1}%
\phantomsection\pdfbookmark[0]{#1}{chapterb\arabic{abntex@bookmarkcounter}}
}
% ---

% ---
% Comando que cria capitulos nao numerados ja com bookmark anotado
% ---
\newcommand{\pretextualchapter}[1]{%
\addtocounter{abntex@bookmarkcounter}{1}%
\PRIVATEbookmarkthis{#1}%
\chapter*[#1]{#1}%
}
\provideboolean{abntex@apendiceousecao}
\setboolean{abntex@apendiceousecao}{false}
% ---

% ---
% cleardoublepage se este documento nao for article
% ---
\newcommand{\PRIVATEclearpageifneeded}{%
\ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
%
}{ % else
\cleardoublepage%
}
}  

% Comandos utilizados para referenciar corpos flutuantes no texto - 21/09/2015
\newcommand{\qref}[1]{\quadrorefname~\ref{#1}}      % Quadro X
\newcommand{\aref}[1]{\algoritmorefname~\ref{#1}}   % Algoritmo X
\newcommand{\cref}[1]{\codigorefname~\ref{#1}}      % Código X
\newcommand{\ifequals}[3]{\ifthenelse{\equal{#1}{#2}}{#3}{}}
\newcommand{\case}[2]{#1 #2} % Dummy, so \renewcommand has something to overwrite...
\newenvironment{switch}[1]{\renewcommand{\case}{\ifequals{#1}}}{}


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Configuracoes de layout
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Notas de rodape - NBR 14724/2011 - 5.2.1 
\makeatletter
\renewcommand\@makefntext[1]{\hangindent=1.2em\leftskip=0.4em\hskip-0.4em\@makefnmark\hskip1.2em\relax#1}
%\renewcommand\@makefntext[1]{\leftskip=0.7cm\hskip-0.15cm\@makefnmark#1}
\makeatother
\renewcommand{\foottextfont}{\ABNTEXfontereduzida}

% Virgula em footnote consecutiva
\let\oldFootnote\footnote
\newcommand\nextToken\relax
\renewcommand\footnote[1]{%
\oldFootnote{#1}\futurelet\nextToken\isFootnote}
\newcommand\isFootnote{%
\ifx\footnote\nextToken\textsuperscript{,}\fi}
% ---

% ---
% Numeracao continua das figuras
\ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
\counterwithout{section}{chapter}
\counterwithout{figure}{section}
\counterwithout{table}{section}
}{%else
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
}
% ---

% ---
% Estilos de caption
\hangcaption
\captiondelim{~\textendash~}
% alteração 22/08/2017
\newcommand{\ABNTEXcaptiondelim}{~\textendash~}
\newcommand{\ABNTEXcaptionfontedelim}{:~}
% fim da alteração 22/08/2017
%\captionnamefont{\ABNTEXfontereduzida}
%\captiontitlefont{\ABNTEXfontereduzida}

% Para uso com pacotes subfig e caption dentro do memoir se estes forem carregados ou não.
% É necessário para que os comandos \IBGEtab e \fonte funcionem 
% independente do carregamento de pacotes externos ao memoir que tratam captions.
\newcommand{\IBGEtabfontsize}{\ABNTEXfontereduzida}
\AtBeginDocument{%
% comandos auxiliares para manipular os captions dentro do comando \IBGEtab.
\newcommand{\configurecaptions}{\captionstyle[\raggedright]{}}
\newcommand{\configureseparator}{\captiondelim{\ABNTEXcaptiondelim}}
% Para fonte, nota, anotações
%\newcommand{\configureseparator}{\captiondelim{: }}


% Define o comando \IBGEtab{}{}{} com caption e legenda da largura do conteúdo tabular, tabular*, etc
% Parece funcionar com qualque pacote
\newsavebox{\myptabbox}
\newlength{\myptabboxwidth}
\newcommand{\IBGEtab}[3]{%
\savebox{\myptabbox}{{\IBGEtabfontsize #2}}%
\settowidth{\myptabboxwidth}{\usebox{\myptabbox}}%
\centering%
\parbox{\myptabboxwidth}{%
	\configurecaptions
	#1%
	\par%
	{\IBGEtabfontsize%
		#2%
	}%
	\par%
	#3}%
}
\let\ibgetab\IBGEtab  
}



% Define o comando \fonte que respeita as configurações de caption do memoir ou do caption
\makeatletter
\newcommand{\fonte}[2][\fontename]{%
\M@gettitle{#2}%
\memlegendinfo{#2}%
\par
\begingroup
\@parboxrestore
\if@minipage
\@setminipage
\fi
\ABNTEXfontereduzida
%\configureseparator
\captiondelim{\ABNTEXcaptionfontedelim}
\@makecaption{\ABNTEXfontereduzida #1}{\ignorespaces\ABNTEXfontereduzida #2}\par
\endgroup}
\makeatother

% Define o comando \notas que respeita as configurações de caption do memoir ou do caption
\makeatletter
\newcommand{\nota}[2][\notaname]{\fonte[#1]{#2}}
\makeatother

% Altera os comandos \configurecaptions e \configureseparator para trabalhar com 
% o pacote caption e amigos.
\AtEndPackage{caption}{
\AtBeginDocument{%
\DeclareCaptionLabelSeparator{barr}{\ABNTEXcaptiondelim}
\DeclareCaptionFont{ABNTEXfontereduzida}{\ABNTEXfontereduzida}
\captionsetup{format=hang,
	labelseparator=barr,
	%labelfont=ABNTEXfontereduzida,
	%font=ABNTEXfontereduzida
}
\renewcommand{\configurecaptions}{%
	\captionsetup{justification=justified,%
		singlelinecheck=false}}
\renewcommand{\configureseparator}{\captionsetup{labelsep=colon}}
}
}

\AtBeginDocument{
\captiondelim{\ABNTEXcaptiondelim}
}
% ---


% -----
% Configuracoes do TOC
% -----
% nivel de profundidade (implementa o quinto nivel - subsubsubsection)
\setsecnumdepth{paragraph}
\settocdepth{paragraph}
\setcounter{tocdepth}{5}
\setcounter{secnumdepth}{5}
\maxsecnumdepth{paragraph}

% redefine os comandos *paragraph* para *subsubsubsection* ****
\newcommand{\subsubsubsection}{\paragraph}
\newcommand{\cftbeforesubsubsubsectionskip}{\cftbeforeparagraphskip}
\newcommand{\cftsubsubsubsectionfont}{\cftparagraphfont}
\newcommand{\setsubsubsubsecheadstyle}{\setparaheadstyle}

\setafterparaskip{1.0\onelineskip plus 0.5\onelineskip minus 0.2\onelineskip}
\setparaheadstyle{\normalfont\sffamily\raggedright}%

% lista de ilustracoes
\renewcommand{\cftfigurename}{\figurename\space} 
\renewcommand*{\cftfigureaftersnum}{\hfill\textendash\hfill}

% lista de tabelas  
%\renewcommand{\cfttablename}{\tablename\space}
%\renewcommand*{\cfttableaftersnum}{\hfill\textendash\hfill}	
\renewcommand{\cfttablename}{\tablename\space}
\renewcommand*{\cfttableaftersnum}{\hfill\textendash\hfill}

% lista de quadros  - 23/05/2016
\newcommand{\quadroname}{Quadro}
\newcommand{\listofquadroname}{Lista de quadros}

\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadro}{loq}{\listofquadroname}
\newlistentry{quadro}{loq}{0}


% configurações para atender às regras da ABNT
\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space} 
\renewcommand*{\cftquadroaftersnum}{\hfill--\hfill}
% Fim lista de quadros  - 23/05/2016

% fonte das partes e do capitulo do TOC
\renewcommand{\tocheadstart}{\ABNTEXchapterfont}

% leaders para os capitulos
\renewcommand*{\cftchapterdotsep}{\cftdotsep}

% suprime espaço entre os itens de listings de diferentes capítulos 
\setlength{\cftbeforechapterskip}{0pt plus 0pt}
\renewcommand*{\insertchapterspace}{}

% macros para configurar o Sumário conforme 6027-2012 ou tradicional cft
\cftinsertcode{A}{}

\newlength{\cftlastnumwidth}
\setlength{\cftlastnumwidth}{\cftsubsubsectionnumwidth}
\addtolength{\cftlastnumwidth}{1em}

\newcommand{\tocprintchapter}{}
\newcommand{\tocinnonumchapter}{}
\newcommand{\tocprintchapternonum}{}
\newcommand{\tocpartapendices}{}
\newcommand{\tocpartanexos}{}



% insere o hifen no anexo/apendice do toc
\cftinsertcode{A}{\renewcommand{\cftchapteraftersnum}{\hfill\textendash\hfill}}

% No caso de Sumario (TOC) tradicional
\ifthenelse{\boolean{ABNTEXsumario-tradicional}}{}{} % essa linha não faz nada,
% mas se houver necessidade de alterar o comportamento
% do sumário tradicional altere aqui.

% No caso de Sumario (TOC) especifico da ABNT-6027-2012

\makeatletter
\ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{
\settocpreprocessor{chapter}{%
\let\tempf@rtoc\f@rtoc%
\def\f@rtoc{%
	\texorpdfstring{\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%
}
\settocpreprocessor{part}{%
\let\tempf@rtoc\f@rtoc%
\def\f@rtoc{%
	\texorpdfstring{\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%
}
}{}
\makeatother
%
\ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{%

\cftsetindents{part}{0em}{\cftlastnumwidth}
\cftsetindents{chapter}{0em}{\cftlastnumwidth}
\cftsetindents{section}{0em}{\cftlastnumwidth}
\cftsetindents{subsection}{0em}{\cftlastnumwidth}
\cftsetindents{subsubsection}{0em}{\cftlastnumwidth}
\cftsetindents{paragraph}{0em}{\cftlastnumwidth}
\cftsetindents{subparagraph}{0em}{\cftlastnumwidth}
%
\renewcommand{\tocprintchapter}{%
\addtocontents{toc}{\cftsetindents{chapter}{0em}{\cftlastnumwidth}}}
%
\renewcommand{\tocinnonumchapter}{%
\addtocontents{toc}{\cftsetindents{chapter}{\cftlastnumwidth}{2em}}%
\cftinserthook{toc}{A}}
%
\renewcommand{\tocprintchapternonum}{%
\addtocontents{toc}{\cftsetindents{chapter}{\cftlastnumwidth}{2em}}}
%
\renewcommand{\tocpartapendices}{%
\addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
\cftinserthook{toc}{A}}
%
\renewcommand{\tocpartanexos}{%
\addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
\cftinserthook{toc}{A}}
%
\setlength{\cftbeforechapterskip}{1em}
%
% Fontes das entradas do sumario
%
\renewcommand{\cftpartfont}{\fontsize{12}{12}\bfseries}
%
\renewcommand{\cftchapterfont}{\fontsize{12}{12}\bfseries}
\renewcommand{\cftchapterpagefont}{\normalsize\cftchapterfont}
%
\renewcommand{\cftsectionfont}{\fontsize{12}{12}\bfseries}
\renewcommand{\cftsectionpagefont}{\cftsectionfont}
%
\renewcommand{\cftsubsectionfont}{\fontsize{12}{12}\normalsize}
\renewcommand{\cftsubsectionpagefont}{\cftsubsectionfont}
%
\renewcommand{\cftsubsubsectionfont}{\fontsize{12}{12}\normalsize}
\renewcommand{\cftsubsubsectionpagefont}{\cftsubsubsectionfont}
%
\renewcommand{\cftparagraphfont}{\fontsize{12}{12}\normalsize}
\renewcommand{\cftparagraphpagefont}{\cftparagraphfont}
%
% Ajusta entrada Referencias
%
\renewcommand{\bibsection}{%
\chapter*{\bibname}
\bibmark
\ifnobibintoc\else
\phantomsection
\addcontentsline{toc}{chapter}{\uppercase{\bibname}}
\fi
\prebibhook
}

}{}

% Comando que simula a finalizacao de uma parte no bookmark e
% adiciona espaco de \part no sumario
\newcommand{\phantompart}{%
\bookmarksetup{startatroot}%
\phantomsection%
\ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{%
\addtocontents{toc}{\vspace{\cftbeforechapterskip}}}{%
\addtocontents{toc}{\vspace{\cftbeforepartskip}}}%
}
% -----

% ---
% Configuracao dos titulos dos capitulos
% Novo estido do memoir 
% ABNT NBR 14724-2011 - 5.2.2-5.2.4; ABNT NBR 6024-2003 - 3.1-3.8
\provideboolean{abntex@innonumchapter}
\setboolean{abntex@innonumchapter}{true}
\makechapterstyle{abnt}{%
\renewcommand{\chapterheadstart}{} 

\ifx \chapternamenumlength \undefined
\newlength{\chapternamenumlength}
\fi

% tamanhos de fontes de chapter e part	
\ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
\setlength\beforechapskip{\baselineskip}
\renewcommand{\chaptitlefont}{\ABNTEXsectionfont\ABNTEXsectionfontsize}
}{%else
\setlength{\beforechapskip}{0pt}
\renewcommand{\chaptitlefont}{\ABNTEXchapterfont\ABNTEXchapterfontsize}
}

\renewcommand{\chapnumfont}{\chaptitlefont}
\renewcommand{\parttitlefont}{\ABNTEXpartfont\ABNTEXpartfontsize}
\renewcommand{\partnumfont}{\ABNTEXpartfont\ABNTEXpartfontsize}
\renewcommand{\partnamefont}{\ABNTEXpartfont\ABNTEXpartfontsize}

% tamanhos de fontes de section, subsection, subsubsection e subsubsubsection
\setsecheadstyle{\ABNTEXsectionfont\ABNTEXsectionfontsize\ABNTEXsectionupperifneeded}
\setsubsecheadstyle{\ABNTEXsubsectionfont\ABNTEXsubsectionfontsize\ABNTEXsubsectionupperifneeded}
\setsubsubsecheadstyle{\ABNTEXsubsubsectionfont\ABNTEXsubsubsectionfontsize\ABNTEXsubsubsectionupperifneeded}
\setsubsubsubsecheadstyle{\ABNTEXsubsubsubsectionfont\ABNTEXsubsubsubsectionfontsize\ABNTEXsubsubsubsectionupperifneeded}

% impressao do numero do capitulo
\renewcommand{\chapternamenum}{}

% impressao do nome do capitulo
\renewcommand{\printchaptername}{%
\chaptitlefont
\ifthenelse{\boolean{abntex@apendiceousecao}}{\appendixname}{}%
}

% impressao do titulo do capitulo
\def\printchaptertitle##1{%
\chaptitlefont%
\ifthenelse{\boolean{abntex@innonumchapter}}{\centering\ABNTEXchapterupperifneeded{##1}}{%
	\ifthenelse{\boolean{abntex@apendiceousecao}}{%
		\centering%
		\settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
		\ABNTEXchapterupperifneeded{##1}%
	}{%
		\settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
		\parbox[t]{\columnwidth-\chapternamenumlength}{\ABNTEXchapterupperifneeded{##1}}}%
}    
}

% impressao do numero do capitulo     	
\renewcommand{\printchapternum}{%
\tocprintchapter
\setboolean{abntex@innonumchapter}{false}
\chapnumfont%
\space\thechapter\space%
\ifthenelse{\boolean{abntex@apendiceousecao}}{%
	\tocinnonumchapter
	~\textendash~%
}{} % else
}
\renewcommand{\afterchapternum}{}

% impressao do capitulo nao numerado
\renewcommand\printchapternonum{%
\tocprintchapternonum
\setboolean{abntex@innonumchapter}{true}%
}
}
\chapterstyle{abnt}
% ---

% -----
% Declaracoes de cabecalhos 
% -----
% Cabecalho padrao
\makepagestyle{abntheadings}
%Cabeçalho contendo apenas o número da página
%\makeevenhead{abntheadings}{\ABNTEXfontereduzida\thepage}{}{}
%\makeoddhead{abntheadings}{}{}{\ABNTEXfontereduzida\thepage}

%Cabeçalho com a seções ou subseções  e o número da página nas páginas ímpares
%Cabeçalho com o o número da página e o título do capítulo e nas páginas pares
%Tira o ponto depois do Capítulo
\renewcommand{\chaptermark}[1]{\markboth{\chaptername\ \thechapter \ #1}{}} % 
%Tira o ponto depois da Seção
\renewcommand{\sectionmark}[1]{\markright{\thesection \ #1}} 
%
\makeevenhead{abntheadings}{\ABNTEXfontereduzida\thepage}{}{\ABNTEXfontereduzida\textit\leftmark}
\makeoddhead{abntheadings}{\ABNTEXfontereduzida\textit\rightmark}{}{\ABNTEXfontereduzida\thepage}
\makeheadrule{abntheadings}{\textwidth}{\normalrulethickness}

% Cabecalho do inicio do capitulo
\makepagestyle{abntchapfirst}
\makeoddhead{abntchapfirst}{}{}{\ABNTEXfontereduzida\thepage}
% ---

% ---
% Configura layout para elementos pre-textuais
\newcommand{\pretextual}{%
	\aliaspagestyle{chapter}{empty}% customizing chapter pagestyle
	\pagestyle{empty}
	\aliaspagestyle{cleared}{empty}
	\aliaspagestyle{part}{empty}
}
\renewcommand{\frontmatter}{\pretextual} 

% por default, inicializa o documento com elementos \pretextuais
\AtBeginDocument{\pretextual}
% ---

% ---
% Configura layout para elementos textuais
\newcommand{\textual}{%
	\ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
		\pagestyle{plain}%
	}{%else  
		\pagestyle{abntheadings}%
		\aliaspagestyle{chapter}{abntchapfirst}% customizing chapter pagestyle
	}  
	\nouppercaseheads%
	\bookmarksetup{startatroot}% 
}
\renewcommand{\mainmatter}{\textual}
% ---

% ---
% Configura layout para elementos pos-textuais
\newcommand{\postextual}{\phantompart}
\renewcommand{\backmatter}{\postextual}
% -----

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos de dados para CAPA e FOLHA DE ROSTO
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% Comandos de dados - titulo do documento
\newcommand{\titulo}[1]{\title{#1}}
\newcommand{\imprimirtitulo}{\thetitle}

% Comandos de dados - titulo em outra língua
\providecommand{\imprimirtitleabstract}{}
\newcommand{\titleabstract}[1]{\renewcommand{\imprimirtitleabstract}{#1}}

% Comandos de dados - autor (use \and para multiplos autores)
\newcommand{\autor}[1]{\author{#1}}
\newcommand{\imprimirautor}{\theauthor}

% Comandos de dados - data
\let\olddate\date
\renewcommand{\date}[1]{\AtBeginDocument{\olddate{#1}}}
\newcommand{\data}[1]{\date{#1}}
\newcommand{\imprimirdata}{\thedate}

% Comandos de dados - instituicao
\providecommand{\imprimirinstituicao}{}
\newcommand{\instituicao}[1]{\renewcommand{\imprimirinstituicao}{#1}}

% Comandos de dados - local
\providecommand{\imprimirlocal}{}
\newcommand{\local}[1]{\renewcommand{\imprimirlocal}{#1}}

% Comandos de dados - preambulo
\providecommand{\imprimirpreambulo}{}
\newcommand{\preambulo}[1]{\renewcommand{\imprimirpreambulo}{#1}}

% Comandos de dados - areaconcentracao
\providecommand{\imprimirareaRotulo}{}
\providecommand{\imprimirarea}{}
\newcommand{\area}[2][\areaname]%
{\renewcommand{\imprimirareaRotulo}{#1}%
	\renewcommand{\imprimirarea}{#2}}

% Comandos de dados - opção
\providecommand{\imprimiropcaoRotulo}{}
\providecommand{\imprimiropcao}{}
\newcommand{\opcao}[2][\opcaoname]%
{\renewcommand{\imprimiropcaoRotulo}{#1}%
	\renewcommand{\imprimiropcao}{#2}}

% Comandos de dados - orientador
\providecommand{\imprimirorientadorRotulo}{}
\providecommand{\imprimirorientador}{}
\newcommand{\orientador}[2][\orientadorname]%
{\renewcommand{\imprimirorientadorRotulo}{#1}%
	\renewcommand{\imprimirorientador}{#2}}

% Comandos de dados - orientadorficha
\providecommand{\imprimirorientadorficha}{}
\newcommand{\orientadorficha}[1]{\renewcommand{\imprimirorientadorficha}{#1}}

% Comandos de dados - orientadorcorpoficha
\providecommand{\imprimirorientadorcorpoficha}{}
\newcommand{\orientadorcorpoficha}[1]{\renewcommand{\imprimirorientadorcorpoficha}{#1}}

% Comandos de dados - notaautorizacao
\providecommand{\imprimirnotaautorizacao}{}
\newcommand{\notaautorizacao}[1]{\renewcommand{\imprimirnotaautorizacao}{#1}}

% Comandos de dados - notaficha
\providecommand{\imprimirnotaficha}{}
\newcommand{\notaficha}[1]{\renewcommand{\imprimirnotaficha}{#1}}

% Comandos de dados - notabib
\providecommand{\imprimirnotabib}{}
\newcommand{\notabib}[1]{\renewcommand{\imprimirnotabib}{#1}}

% Comandos de dados - coorientador
\providecommand{\imprimircoorientadorRotulo}{}
\providecommand{\imprimircoorientador}{}
\providecommand{\imprimircoorientadoradic}{}
\newcommand{\coorientador}[2][\coorientadorname]%
{\renewcommand{\imprimircoorientadorRotulo}{#1}%
	\renewcommand{\imprimircoorientador}{#2}}

% Comandos de dados - tipo de trabalho
\providecommand{\imprimirtipotrabalho}{}
\newcommand{\tipotrabalho}[1]{\renewcommand{\imprimirtipotrabalho}{#1}}

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos e ambientes de editoracao PRE-TEXTUAIS
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Ambiente para definicao da Capa
\newenvironment{capa}{\begin{titlingpage}}{\end{titlingpage}\cleardoublepage}
% ---

% ---
% Ambiente para definicao da Capam
\newenvironment{capam}{\begin{titlingpage}}{\end{titlingpage}\cleardoublepage}
% ---

% ---
% Ficha catalografica (Dados internacionais de
% catalogação-na-publicacao)
\newenvironment{fichacatalografica}{%
	\thispagestyle{empty}
	\begin{SingleSpacing}
		\ABNTEXfontereduzida
	}{%   
	\end{SingleSpacing}%
}%
% ---

% ---
% Errata
\newenvironment{errata}[1][\errataname]{%
	\pretextualchapter{#1}
}{\PRIVATEclearpageifneeded}
% ---

% ---
% Folha de aprovacao - NBR 14724/2011 - 4.2.1.3
\newenvironment{folhadeaprovacao}[1][\folhadeaprovacaoname]{%
	\clearpage%
	\PRIVATEbookmarkthis{#1}%
	\begin{Spacing}{1.0}
	}{\end{Spacing}\PRIVATEclearpageifneeded}   
% ---

% ---
% Dedicatoria
\newenvironment{dedicatoria}[1][]{%
	\ifthenelse{\equal{#1}{}}{%
		\PRIVATEbookmarkthis{\dedicatorianame}
	}{\pretextualchapter{#1}}
}{\PRIVATEclearpageifneeded}
% ---

% ---
% Agradecimentos
\newenvironment{agradecimentos}[1][\agradecimentosname]{%
	\pretextualchapter{#1}
}{\PRIVATEclearpageifneeded}
% ---

% ---
% Epigrafe
\newenvironment{epigrafe}[1][]{%
	\ifthenelse{\equal{#1}{}}{%
		\PRIVATEbookmarkthis{\epigraphname}
	}{\pretextualchapter{#1}}
}{\PRIVATEclearpageifneeded}
% ---

% ---
% Resumo e abstracts em diferentes idiomas - NBR 14724/2011

% altera as margens padrões do memoir para abstract caso nao seja article
\ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
	% em artigos, margens e fontes são as mesmas de memoir
}{ % else
	% Ajusta as margens para serem a mesma do documento
	\setlength\absleftindent{0cm}
	\setlength\absrightindent{0cm}
	% Garante que a fonte do texto do abstract será a mesma do documento, pois
	% na classe memoir está \small
	\renewcommand{\abstracttextfont}{\normalfont\normalsize}
}

% A norma não diz nada sobre identação e separação entre parágrafos no abstract,
% porém o uso mostra que muitos abstracts são montados sem identação.
\AtBeginDocument{%
	\setlength{\absparindent}{0pt}
}

\newenvironment{resumo}[1][\resumoname]{%
	\PRIVATEbookmarkthis{#1}
	\renewcommand{\abstractnamefont}{\chaptitlefont}
	\renewcommand{\abstractname}{\ABNTEXchapterupperifneeded{#1}}
	\begin{abstract}
	}{\end{abstract}\PRIVATEclearpageifneeded}

\newenvironment{resumoumacoluna}[1][\resumoname]{%
	\PRIVATEbookmarkthis{#1}
	\renewcommand{\abstractnamefont}{\chaptitlefont}
	\renewcommand{\abstractname}{\ABNTEXchapterupperifneeded{#1}}
	\begin{onecolabstract}
	}{\end{onecolabstract}\PRIVATEclearpageifneeded}
% ---

% ---
% Lista de abreviaturas e siglas
\newenvironment{siglas}{%
	\pretextualchapter{\listadesiglasname}
	\begin{symbols}
	}{%
	\end{symbols}
	\cleardoublepage
}
% ---

% ---
% Lista de simbolos
\newenvironment{simbolos}{%
	\pretextualchapter{\listadesimbolosname}
	\begin{symbols}
	}{%
	\end{symbols}
	\cleardoublepage
}
% ---

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos e ambientes de editoracao APENDICES e ANEXOS
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Definicoes compartilhadas entre Apendices e Anexos
% ---
\makeatletter
\newcommand\@switch[1]{ \@writefile{toc}{\renewcommand*{\cftappendixname}{#1 \space}} }
\newcommand{\switchchapname}[1]{ \protected@write \@auxout {}{\string\@switch{#1} }}
\makeatother

\newcommand{\PRIVATEapendiceconfig}[2]{%
	\setboolean{abntex@apendiceousecao}{true}%
	\renewcommand{\appendixname}{#1}
	\ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{
		\renewcommand{\appendixtocname}{\uppercase{#2}}
	}{%
		\renewcommand{\appendixtocname}{#2}} 
	\renewcommand{\appendixpagename}{#2}
	\switchchapname{#1}% Corrected from \switchapname -> \switchchapname
	\renewcommand*{\cftappendixname}{#1 \space}
}
% ---

% ---
% Apendices - comando 
\newcommand{\apendices}{%
	\PRIVATEapendiceconfig{\apendicename}{\apendicesname}
	\appendix
}
% Apendices - ambiente
\newenvironment{apendicesenv}{%
	\PRIVATEapendiceconfig{\apendicename}{\apendicesname}
	\begin{appendix}
	}{
	\end{appendix}
	\setboolean{abntex@apendiceousecao}{false}
	\bookmarksetup{startatroot}
}
% ---

% ---
% Anexos - comando
\newcommand{\anexos}{%
	\cftinserthook{toc}{AAA}
	
	\PRIVATEapendiceconfig{\anexoname}{\anexosname}
	\appendix
	\renewcommand\theHchapter{anexochapback.\arabic{chapter}}
}
% Anexos - ambiente
\newenvironment{anexosenv}{%
	\cftinserthook{toc}{AAA}
	
	\PRIVATEapendiceconfig{\anexoname}{\anexosname}
	\begin{appendix}
		\renewcommand\theHchapter{anexochapback.\arabic{chapter}}
	}{
	\end{appendix}
	\setboolean{abntex@apendiceousecao}{false}
	\bookmarksetup{startatroot}
}
% ---

% ---
% Imprime uma pagina de divisao no estilo parte
\newcommand{\partpage}{%
	\cleardoublepage
	\phantomsection
	\addcontentsline{toc}{part}{\appendixtocname}%
	\appendixpage*
}

% atalhos para \partpage ou \appendixpage* 
\makeatletter
\newcommand{\partapendices}{%
	\tocpartapendices%
	\@ifstar{\appendixpage*}{\partpage}}

\newcommand{\partanexos}{%
	\tocpartanexos%
	\@ifstar{\appendixpage*}{\partpage}}
\makeatother
% ---


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos e ambientes de editoracao CITACAO, ALINEA, INCISO, ASSINATURA
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Citacao direta com mais de 3 linhas - ABNT NBR 10520/2002 - 5.3
\newlength{\ABNTEXcitacaorecuo}% recuo de 4 cm da margem esquerda
\ifthenelse{\equal{\ABNTEXistwocolumn}{true}}{%
	\setlength{\ABNTEXcitacaorecuo}{1.8cm}
}{% else
	\setlength{\ABNTEXcitacaorecuo}{4cm}
}
\newenvironment*{citacao}[1][default]{%
	\list{}%
	\ABNTEXfontereduzida%
	\addtolength{\leftskip}{\ABNTEXcitacaorecuo}%
	\item[]%
	\begin{SingleSpace}%
		\ifthenelse{\not\equal{#1}{default}}{\itshape\selectlanguage{#1}}{}%
	}{%
	\end{SingleSpace}%
	\endlist}%
% ---

% ---
% Ambiente para alineas e e subalineas (incisos)
% ABNT NBR 6024/2012 - 4.2 e 4.3
\newlist{alineas}{enumerate}{2}
\setlist[alineas,1]{label={\alph*)},topsep=0pt,itemsep=0pt,leftmargin=\parindent+\labelwidth-\labelsep}%
\setlist[alineas,2]{label={--},topsep=0pt,itemsep=0pt,leftmargin=*}
\newlist{subalineas}{enumerate}{1}
\setlist[subalineas,1]{label={--},topsep=0pt,itemsep=0pt,leftmargin=*}%
\newlist{incisos}{enumerate}{1}
\setlist[incisos,1]{label={--},topsep=0pt,itemsep=0pt,leftmargin=*}%
% ---

% ---
% Comando \assinatura for signature
% width of the line and text under the line
\newlength{\ABNTEXsignwidth}
\setlength{\ABNTEXsignwidth}{8cm}
% thickness of the line
\newlength{\ABNTEXsignthickness}
\setlength{\ABNTEXsignthickness}{1pt}
% ammount of space left between previous text and th signature line
\newlength{\ABNTEXsignskip}
\setlength{\ABNTEXsignskip}{0.7cm}
% \assinatura{name} -> types a line with name under the line, centralized
% \assinatura*{name} -> Creates the box with the line and name under
%     it, but the box has no position assigned. However the line and the
%     name are centralized with respect to each other.
\makeatletter
\newcommand{\assinatura}{\@ifstar{\ABNTEXsign}{\ABNTEXcsign}}
\makeatother
% assinatura com estrela
\newcommand{\ABNTEXsign}[1]{%
	\parbox[t]{\ABNTEXsignwidth}{\SingleSpacing\vspace*{\ABNTEXsignskip}\centering%
		\rule{\ABNTEXsignwidth}{\ABNTEXsignthickness}\\%
		\nopagebreak #1\par}%
}
% assinatura sem estrela
\newcommand{\ABNTEXcsign}[1]%
{\begingroup\par\centering\ABNTEXsign{#1}\par\endgroup}  
% ---

% Chamanda para dados pre-textuais
\include{USPSC-unidades}  
%

% ------------------------------------------------------------------------
% IMPRESSOES PADROES DE CAPA E FOLHA DE ROSTO de Trabalhos Acadêmiocos
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Impressão da Capa de Trabalhos Acadêmiocos
\newcommand{\imprimircapa}{%
	\begin{capa}%
		\center
		\ABNTEXchapterfont\bfseries\large\imprimiruniversidade \\
		\ABNTEXchapterfont\bfseries\large\imprimirunidade \\
		%\vfill
		\vspace*{5,5cm}
		\ABNTEXchapterfont\bfseries\large\imprimirautor
		
		%\vfill
		\vspace*{1cm}
		\begin{center}
			\ABNTEXchapterfont\bfseries\Large\imprimirtitulo
			
		\end{center}
		\vfill
		
		%\large\imprimirlocal
		\imprimirlocal
		
		%\large\imprimirdata
		\imprimirdata
		
		\vspace*{0,5cm}
	\end{capa}
}
% ---

% ---
% Folha de rosto com carimbo de Trabalhos Acadêmicos
%   usar \imprimirfolhaderostocarimbo* casodeseje imprimir algo no verso da
%   página no caso de estar no modo twoside. Util para imprimir a Ficha
%   Bibliografica. Porem, se estiver no modo oneside, a versao sem estrela
%   é identica.
% 23/03/2021
\newenvironment{folharostocar}[1][\folharostocarname]{\clearpage\PRIVATEbookmarkthis{#1}}{\cleardoublepage}
\newenvironment{folharostocar*}[1][\folharostocarname]{\clearpage\PRIVATEbookmarkthis{#1}}{\newpage}
% ---
% Conteudo padrao da Folha de Rosto com carimbo
% Carimbo do Serviço de Pós-Graduação

\makeatletter
\newcommand{\folharostocarcontent}{
	\begin{center}
		\hspace{.49\textwidth}
		\begin{minipage}{.5\textwidth}
			\SingleSpacing
			\begin{tabular}{|l|c|} \hline
				\carimbofontsize
				\imprimirsetorpos
				\\ \\
				\carimbofontsize\bfseries
				Data de Depósito: \\ \\
				\carimbofontsize\bfseries
				Assinatura: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_  \\ \hline
			\end{tabular}
		\end{minipage}%		
	\end{center}
	\begin{center}		
		{\ABNTEXchapterfont\bfseries\large\imprimirautor}
		\vfill
		{\nohyphens{\ABNTEXchapterfont\bfseries\Large\imprimirtitulo}}
		\vfill
	\end{center}
	%\vspace*{\fill}
	\begin{center}
		\hspace{.45\textwidth}
		\begin{minipage}{.5\textwidth}
			\SingleSpacing
			% Se no arquivo USPSC-modelo.tex a fonte for \usepackage{lmodern}	
			{\nohyphens{{\vspace*{0,5cm}\imprimirpreambulo\par}}}
			% Se no arquivo USPSC-modelo.tex a fonte for \usepackage{times}	
			% insira uma % no início do comando acima e tire a % do comando abaixo
			%\ABNTEXchapterfont\small\imprimirpreambulo	
			%\vspace*{\fill}
			{\vspace*{0,3cm}\nohyphens{\imprimirareaRotulo~\imprimirarea\par}}
			\abntex@ifnotempty{\imprimiropcao}{%
				{\nohyphens{{\vspace*{0,3cm}\imprimiropcaoRotulo~\imprimiropcao\par}}}
			}%
			\vspace*{\fill}
			{\nohyphens{{\vspace*{0,3cm}\imprimirorientadorRotulo~\imprimirorientador\par}}}
			\vspace*{\fill}
			{\nohyphens{{\vspace*{0,3cm}\imprimircoorientadorRotulo~\imprimircoorientador\par}}}
		\end{minipage}%	
	\end{center}
	\vspace*{\fill}
	\begin{center}
		{\ABNTEXchapterfont\bfseries\large\imprimirnotafolharosto\par\par} 
		\vspace*{\fill}
		{\ABNTEXchapterfont\bfseries\large\imprimirlocal}
		\par
		{\ABNTEXchapterfont\bfseries\large\imprimirdata}
		%\vspace*{0,5cm}
	\end{center}
}
\makeatother
\makeatletter
\newcommand{\imprimirfolharostocarstar}[1]{%
	\begin{folharostocar*}{#1}
		\folharostocarcontent
\end{folharostocar*}}

\newcommand{\imprimirfolharostocarnostar}[1]{%
	\begin{folharostocar}{#1}
		\folharostocarcontent
\end{folharostocar}}

\makeatletter
\newcommand{\imprimirfolharostocar}[1][\folharostoccarname]{%
	\@ifstar
	\imprimirfolharostocarstar  
	\imprimirfolharostocarnostar
}
\makeatother
% ---

% ---
% Folha de rosto de Trabalhos Acadêmicos
%   usar \imprimirfolhaderosto* casodeseje imprimir algo no verso da
%   página no caso de estar no modo twoside. Util para imprimir a Ficha
%   Bibliografica. Porem, se estiver no modo oneside, a versao sem estrela
%   é identica.
\newenvironment{folhaderosto}[1][\folhaderostoname]{\clearpage\PRIVATEbookmarkthis{#1}}{\cleardoublepage}
\newenvironment{folhaderosto*}[1][\folhaderostoname]{\clearpage\PRIVATEbookmarkthis{#1}}{\newpage}%

% ---
% Conteudo padrao da Folha de Rosto
\makeatletter
\newcommand{\folhaderostocontent}{
	\begin{center}		
		{\ABNTEXchapterfont\bfseries\large\imprimirautor}
		\vfill
		{\nohyphens{\ABNTEXchapterfont\bfseries\Large\imprimirtitulo}}
		\vfill
	\end{center}
	\begin{center}
		\hspace{.45\textwidth}
		\begin{minipage}{.5\textwidth}
			\SingleSpacing
			% Se no arquivo USPSC-modelo.tex a fonte for \usepackage{lmodern}	
			{\nohyphens{{\vspace*{0,5cm}\imprimirpreambulo\par}}}
			% Se no arquivo USPSC-modelo.tex a fonte for \usepackage{times}	
			% insira uma % no início do comando acima e tire a % do comando abaixo
			%\ABNTEXchapterfont\small\imprimirpreambulo	
			%\vspace*{\fill}
			{\vspace*{0,3cm}\nohyphens{\imprimirareaRotulo~\imprimirarea\par}}
			\abntex@ifnotempty{\imprimiropcao}{%
				{\nohyphens{{\vspace*{0,3cm}\imprimiropcaoRotulo~\imprimiropcao\par}}}
			}%
			\vspace*{\fill}
			{\nohyphens{{\vspace*{0,3cm}\imprimirorientadorRotulo~\imprimirorientador\par}}}
			\vspace*{\fill}
			{\nohyphens{{\vspace*{0,3cm}\imprimircoorientadorRotulo~\imprimircoorientador\par}}}
		\end{minipage}%	
	\end{center}
	\vspace*{\fill}
	\begin{center}
		{\ABNTEXchapterfont\bfseries\large\imprimirnotafolharosto\par\par} 
		\vspace*{\fill}
		{\ABNTEXchapterfont\bfseries\large\imprimirlocal}
		\par
		{\ABNTEXchapterfont\bfseries\large\imprimirdata}
		%\vspace*{0,5cm}
	\end{center}
}
\makeatother
\makeatletter
\newcommand{\imprimirfolhaderostostar}[1]{%
	\begin{folhaderosto*}{#1}
		\folhaderostocontent
\end{folhaderosto*}}

\newcommand{\imprimirfolhaderostonostar}[1]{%
	\begin{folhaderosto}{#1}
		\folhaderostocontent
\end{folhaderosto}}

\makeatletter
\newcommand{\imprimirfolhaderosto}[1][\folhaderostoname]{%
	\@ifstar
	\imprimirfolhaderostostar  
	\imprimirfolhaderostonostar
}
\makeatother
% ---
% ---
% Folha de rosto adicional
%   usar \imprimirfolhaderostoadic* caso deseje imprimir algo no verso da
%   página no caso de estar no modo twoside. Util para imprimir a Ficha
%   Bibliografica. Porem, se estiver no modo oneside, a versao sem estrela
%   é identica.
\newenvironment{folhaderostoadic}[1][\folhaderostoadicname]{\clearpage\PRIVATEbookmarkthis{#1}}{\cleardoublepage}
\newenvironment{folhaderostoadic*}[1][\folhaderostoadicname]{\clearpage\PRIVATEbookmarkthis{#1}}{\newpage}%

% ---
% Conteudo padrao da Folha de Rosto Adicional
\makeatletter
\newcommand{\folhaderostoadiccontent}{
	\begin{center}		
		%\vspace*{1cm}
		{\ABNTEXchapterfont\bfseries\large\imprimirautor}
		%\vspace*{\fill}\vspace*{\fill}
		\vfill
		{\nohyphens{\ABNTEXchapterfont\bfseries\Large\imprimirtituloadic}}
		\vfill
	\end{center}
	\begin{center}
		\hspace{.45\textwidth}
		\begin{minipage}{.5\textwidth}
			\SingleSpacing
			% Se no arquivo USPSC-modelo.tex a fonte for \usepackage{lmodern}	
			{\nohyphens{{\vspace*{0,5cm}\imprimirpreambuloadic\par}}}
			% Se no arquivo USPSC-modelo.tex a fonte for \usepackage{times}	
			% insira uma % no início do comando acima e tire a % do comando abaixo
			%\ABNTEXchapterfont\small\imprimirpreambulo	
			%\vspace*{\fill}
			{\vspace*{0,3cm}\nohyphens{\imprimirareaadic\par}}
			\abntex@ifnotempty{\imprimiropcaoadic}{%
				{\nohyphens{{\vspace*{0,3cm}\imprimiropcaoadic\par}}}
			}%
			\vspace*{\fill}
			{\nohyphens{{\vspace*{0,3cm}\imprimirorientadoradic\par}}}
			\vspace*{\fill}
			{\nohyphens{{\vspace*{0,3cm}\imprimircoorientadoradic\par}}}
		\end{minipage}%	
	\end{center}
	\vspace*{\fill}
	\begin{center}
		{\ABNTEXchapterfont\bfseries\large\imprimirnotafolharostoadic\par\par} 
		\vspace*{\fill}
		{\ABNTEXchapterfont\bfseries\large\imprimirlocal}
		\par
		{\ABNTEXchapterfont\bfseries\large\imprimirdata}
		%\vspace*{0,5cm}
	\end{center}
}
\makeatother
\makeatletter	
\newcommand{\imprimirfolhaderostoadicstar}[1]{%
	\begin{folhaderostoadic*}{#1}
		\folhaderostoadiccontent
\end{folhaderostoadic*}}

\newcommand{\imprimirfolhaderostoadicnostar}[1]{%
	\begin{folhaderostoadic}{#1}
		\folhaderostoadiccontent
\end{folhaderostoadic}}

\makeatletter
\newcommand{\imprimirfolhaderostoadic}[1][\folhaderostoadicname]{%
	\@ifstar
	\imprimirfolhaderostoadicstar  
	\imprimirfolhaderostoadicnostar
}
\makeatother
% ------------------------------------------------------------------------
% IMPRESSOES PADROES DE CAPA E FOLHA DE ROSTO de Monografias (Livros, tutoriais, etc.)
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Impressão da Capa de Monografias (Livros, tutoriais, etc.)
\newcommand{\imprimircapam}{%
	\begin{capam}%
		\begin{center}
			%\footnotesize\bfseries\tiny\imprimirunidade \\
			\ABNTEXchapterfont\bfseries\imprimirunidade \\
		\end{center}
		%\vfill
		\vspace*{5,5cm}
		%\ABNTEXchapterfont\bfseries\large\imprimirautor
		
		%\vfill
		\vspace*{1cm}
		\begin{center}
			\ABNTEXchapterfont\bfseries\Large\imprimirtitulo
		\end{center}
		\vfill
		\vfill
		\begin{center}
			\ABNTEXchapterfont\bfseries\large\imprimirlocal \\
			\ABNTEXchapterfont\bfseries\large\imprimiruniversidademin \\
			\ABNTEXchapterfont\large\imprimirdata
			\vspace*{0,5cm}			
		\end{center}
		
	\end{capam}
}
% ---

% ---
% Folha de rosto de Monografias (Livros, tutoriais, etc.)
%   usar \imprimirfolhaderosto* casodeseje imprimir algo no verso da
%   página no caso de estar no modo twoside. Util para imprimir a Ficha
%   Bibliografica. Porem, se estiver no modo oneside, a versao sem estrela
%   é identica.
\newenvironment{folhaderostom}[1][\folhaderostonamem]{\clearpage\PRIVATEbookmarkthis{#1}}{\cleardoublepage}
\newenvironment{folhaderostom*}[1][\folhaderostonamem]{\clearpage\PRIVATEbookmarkthis{#1}}{\newpage}%

% ---
% Conteudo padrao da Folha de Rosto de Monografias (Livros, tutoriais, etc.)
\makeatletter
\newcommand{\folhaderostocontentm}{
	\begin{center}
		%\footnotesize\bfseries\tiny\imprimirunidade \\
		\ABNTEXchapterfont\bfseries\imprimirunidade \\
	\end{center}	
	\vspace*{\fill}\vspace*{\fill}
	\begin{center}
		\ABNTEXchapterfont\bfseries\Large\imprimirtitulo
	\end{center}
	\vspace*{\fill}
	
	\begin{flushright}
		\abntex@ifnotempty{\imprimirpreambulo}{%
			\hspace{.45\textwidth}
			\begin{minipage}{.6\textwidth}
				\SingleSpacing
				% Se no arquivo USPSC-modelo.tex a fonte for \usepackage{lmodern}
				\imprimirpreambulo
				% Se no arquivo USPSC-modelo.tex a fonte for \usepackage{times}	
				% insira uma % no início do comando acima e tire a % do comando abaixo
				%\ABNTEXchapterfont\small\imprimirpreambulo				
			\end{minipage}%
			\vspace*{\fill}
		}%
	\end{flushright}	
	\begin{center}
		{\ABNTEXchapterfont\bfseries\large\imprimirlocal}
		\par
		{\ABNTEXchapterfont\bfseries\large\imprimiruniversidademin}
		\par
		{\ABNTEXchapterfont\bfseries\large\imprimirdata}
		%\vspace*{0,5cm}
	\end{center}
}
\makeatother
\makeatletter
\newcommand{\imprimirfolhaderostostarm}[1]{%
	\begin{folhaderostom*}{#1}
		\folhaderostocontentm
\end{folhaderostom*}}

\newcommand{\imprimirfolhaderostonostarm}[1]{%
	\begin{folhaderostom}{#1}
		\folhaderostocontentm
\end{folhaderostom}}

\makeatletter
\newcommand{\imprimirfolhaderostom}[1][\folhaderostonamem]{%
	\@ifstar
	\imprimirfolhaderostostarm  
	\imprimirfolhaderostonostarm
}
\makeatother

%%%%%
% ---
% ---
% Folha de Rosto Alternativa para Relatório
%   usar \imprimirfolhaderostoalt* caso deseje imprimir algo no verso da
%   página no caso de estar no modo twoside. Util para imprimir a Ficha
%   Bibliografica. Porem, se estiver no modo oneside, a versao sem estrela
%   é identica.
\newenvironment{folhaderostoalt}[1][\folhaderostoaltname]{\clearpage\PRIVATEbookmarkthis{#1}}{\cleardoublepage}
\newenvironment{folhaderostoalt*}[1][\folhaderostoaltname]{\clearpage\PRIVATEbookmarkthis{#1}}{\newpage}%

% Conteudo padrao da Folha de Rosto Alternativa para Relatório
\makeatletter
\newcommand{\folhaderostoaltcontent}{
	\begin{center}		
		%\vspace*{1cm}
		\ABNTEXchapterfont\bfseries\large\imprimiruniversidade \\
		\ABNTEXchapterfont\bfseries\large\imprimirunidade\\
		\vspace*{\fill}\vspace*{\fill}
		\ABNTEXchapterfont\bfseries\Large\imprimirtitulo
		\vspace*{\fill}
		\vfill
		{\ABNTEXchapterfont\bfseries\large\imprimirautor}
		\vfill
	\end{center}
	\begin{center}
		\hspace{.45\textwidth}
		\begin{minipage}{.5\textwidth}
			\SingleSpacing
			% Se no arquivo USPSC-modelo.tex a fonte for \usepackage{lmodern}	
			{\nohyphens{{\vspace*{0,5cm}\imprimirpreambulo\par}}}
			% Se no arquivo USPSC-modelo.tex a fonte for \usepackage{times}	
			% insira uma % no início do comando acima e tire a % do comando abaixo
			%\ABNTEXchapterfont\small\imprimirpreambulo	
			%\vspace*{\fill}
		\end{minipage}%	
	\end{center}
	\vspace*{\fill}
	\begin{center}
		{\ABNTEXchapterfont\bfseries\large\imprimirnotafolharosto\par\par} 
		\vspace*{\fill}
		{\ABNTEXchapterfont\bfseries\large\imprimirlocal}
		\par
		{\ABNTEXchapterfont\bfseries\large\imprimirdata}
		%\vspace*{0,5cm}
	\end{center}
}
\makeatother
\makeatletter	
\newcommand{\imprimirfolhaderostoaltstar}[1]{%
	\begin{folhaderostoalt*}{#1}
		\folhaderostoaltcontent
\end{folhaderostoalt*}}

\newcommand{\imprimirfolhaderostoaltnostar}[1]{%
	\begin{folhaderostoalt}{#1}
		\folhaderostoaltcontent
\end{folhaderostoalt}}

\makeatletter
\newcommand{\imprimirfolhaderostoalt}[1][\folhaderostoaltname]{%
	\@ifstar
	\imprimirfolhaderostoaltstar  
	\imprimirfolhaderostoaltnostar
}
\makeatother
%%%%%
%\bibliographystyle{USPSC-classe/abntex2-num-USPSC}
%\makeatother
