\documentclass[a4paper]{article}
\usepackage[a4paper,left=3cm,right=2cm,top=2.5cm,bottom=2.5cm]{geometry}
\usepackage{palatino}
\usepackage[colorlinks=true,linkcolor=blue,citecolor=blue]{hyperref}
\usepackage{graphicx}
\usepackage{cp1920t}
\usepackage{subcaption}
\usepackage{adjustbox}
\usepackage{color}
%================= local x=====================================================%
\def\getGif#1{\includegraphics[width=0.3\textwidth]{cp1920t_media/#1.png}}
\let\uk=\emph
\def\aspas#1{``#1"}
%================= lhs2tex=====================================================%
%include polycode.fmt 
%format (div (x)(y)) = x "\div " y
%format succ = "\succ "
%format ==> = "\Longrightarrow "
%format map = "\map "
%format length = "\length "
%format fst = "\p1"
%format p1  = "\p1"
%format snd = "\p2"
%format p2  = "\p2"
%format Left = "i_1"
%format Right = "i_2"
%format i1 = "i_1"
%format i2 = "i_2"
%format >< = "\times"
%format >|<  = "\bowtie "
%format |-> = "\mapsto"
%format . = "\comp "
%format (kcomp (f)(g)) = f "\kcomp " g
%format -|- = "+"
%format conc = "\mathsf{conc}"
%format summation = "{\sum}"
%format (either (a) (b)) = "\alt{" a "}{" b "}"
%format (frac (a) (b)) = "\frac{" a "}{" b "}"
%format (uncurry f) = "\uncurry{" f "}"
%format (const f) = "\underline{" f "}"
%format TLTree = "\mathsf{TLTree}"
%format (lcbr (x)(y)) = "\begin{lcbr}" x "\\" y "\end{lcbr}"
%format (split (x) (y)) = "\conj{" x "}{" y "}"
%format (for (f) (i)) = "\for{" f "}\ {" i "}"
%format B_tree = "\mathsf{B}\mbox{-}\mathsf{tree} "
\def\ana#1{\mathopen{[\!(}#1\mathclose{)\!]}}
%format (cataA (f) (g)) = "\cata{" f "~" g "}_A"
%format (anaA (f) (g)) = "\ana{" f "~" g "}_A"
%format (cataB (f) (g)) = "\cata{" f "~" g "}_B"
%format (anaB (f) (g)) = "\ana{" f "~" g "}_B"
%format Either a b = a "+" b 
%format fmap = "\mathsf{fmap}"
%format NA   = "\textsc{na}"
%format NB   = "\textsc{nb}"
%format inT = "\mathsf{in}"
%format outT = "\mathsf{out}"
%format Null = "1"
%format (Prod (a) (b)) = a >< b
%format fF = "\fun F "
%format e1 = "e_1 "
%format e2 = "e_2 "
%format Dist = "\fun{Dist}"
%format IO = "\fun{IO}"
%format BTree = "\fun{BTree} "
%format LTree = "\mathsf{LTree}"
%format inNat = "\mathsf{in}"
%format (cataNat (g)) = "\cata{" g "}"
%format Nat0 = "\N_0"
%format muB = "\mu "
%format (frac (n)(m)) = "\frac{" n "}{" m "}"
%format (fac (n)) = "{" n "!}"
%format (underbrace (t) (p)) = "\underbrace{" t "}_{" p "}"
%format matrix = "matrix"
%format (bin (n) (k)) = "\Big(\vcenter{\xymatrix@R=1pt{" n "\\" k "}}\Big)"
%format `ominus` = "\mathbin{\ominus}"
%format % = "\mathbin{/}"
%format <-> = "{\,\leftrightarrow\,}"
%format <|> = "{\,\updownarrow\,}"
%format `minusNat`= "\mathbin{-}"
%format ==> = "\Rightarrow"
%format .==>. = "\Rightarrow"
%format .<==>. = "\Leftrightarrow"
%format .==. = "\equiv"
%format .<=. = "\leq"
%format .&&&. = "\wedge"
%format cdots = "\cdots "
%format pi = "\pi "

%---------------------------------------------------------------------------

\title{
       	    Cálculo de Programas
\\
       	Trabalho Prático
\\
       	MiEI+LCC --- 2019/20
}

\author{
       	\dium
\\
       	Universidade do Minho
}


\date\mydate

\makeindex
\newcommand{\rn}[1]{\textcolor{red}{#1}}
\begin{document}

\maketitle

\begin{center}\large
\begin{tabular}{ll}
\textbf{Grupo} nr. & 37
\\\hline
a79751 & Diogo Alves
\\
a82568 & Ricardo Ferreira
\\
a81919 & Ricardo Milhazes
\end{tabular}
\end{center}

\section{Preâmbulo}

A disciplina de \CP\ tem como objectivo principal ensinar
a progra\-mação de computadores como uma disciplina científica. Para isso
parte-se de um repertório de \emph{combinadores} que formam uma álgebra da
programação (conjunto de leis universais e seus corolários) e usam-se esses
combinadores para construir programas \emph{composicionalmente}, isto é,
agregando programas já existentes.
  
Na sequência pedagógica dos planos de estudo dos dois cursos que têm
esta disciplina, restringe-se a aplicação deste método à programação
funcional em \Haskell. Assim, o presente trabalho prático coloca os
alunos perante problemas concretos que deverão ser implementados em
\Haskell.  Há ainda um outro objectivo: o de ensinar a documentar
programas, validá-los, e a produzir textos técnico-científicos de
qualidade.

\section{Documentação} Para cumprir de forma integrada os objectivos
enunciados acima vamos recorrer a uma técnica de programa\-ção dita
``\litp{literária}'' \cite{Kn92}, cujo princípio base é o seguinte:
\begin{quote}\em Um programa e a sua documentação devem coincidir.
\end{quote} Por outras palavras, o código fonte e a documentação de um
programa deverão estar no mesmo ficheiro.

O ficheiro \texttt{cp1920t.pdf} que está a ler é já um exemplo de \litp{programação
literária}: foi gerado a partir do texto fonte \texttt{cp1920t.lhs}\footnote{O
suffixo `lhs' quer dizer \emph{\lhaskell{literate Haskell}}.} que encontrará
no \MaterialPedagogico\ desta disciplina descompactando o ficheiro \texttt{cp1920t.zip}
e executando
\begin{Verbatim}[fontsize=\small]
    $ lhs2TeX cp1920t.lhs > cp1920t.tex
    $ pdflatex cp1920t
\end{Verbatim}
em que \href{https://hackage.haskell.org/package/lhs2tex}{\texttt\LhsToTeX} é
um pre-processador que faz ``pretty printing''
de código Haskell em \Latex\ e que deve desde já instalar executando
\begin{Verbatim}[fontsize=\small]
    $ cabal install lhs2tex
\end{Verbatim}
Por outro lado, o mesmo ficheiro \texttt{cp1920t.lhs} é executável e contém
o ``kit'' básico, escrito em \Haskell, para realizar o trabalho. Basta executar
\begin{Verbatim}[fontsize=\small]
    $ ghci cp1920t.lhs
\end{Verbatim}

%if False
\begin{code}
{-# OPTIONS_GHC -XNPlusKPatterns #-}
{-# LANGUAGE GeneralizedNewtypeDeriving, DeriveDataTypeable, FlexibleInstances #-}
--module Cp1920t where 
import Cp
import List  hiding (fac)
import Nat
import BTree
import LTree
import Probability
import ListUtils
import Show
import Data.List hiding (find)
import Test.QuickCheck hiding ((><),choose,collect)
import qualified Test.QuickCheck as QuickCheck
import System.Random  hiding (split)
import System.Process
import GHC.IO.Exception
import Graphics.Gloss
import Control.Monad
import Control.Applicative hiding ((<|>))
import Exp
\end{code}
%endif

\noindent Abra o ficheiro \texttt{cp1920t.lhs} no seu editor de texto preferido
e verifique que assim é: todo o texto que se encontra dentro do ambiente
\begin{quote}\small\tt
\verb!\begin{code}!
\\ ... \\
\verb!\end{code}!
\end{quote}
vai ser seleccionado pelo \GHCi\ para ser executado.

\section{Como realizar o trabalho}
Este trabalho teórico-prático deve ser realizado por grupos de três alunos.
Os detalhes da avaliação (datas para submissão do relatório e sua defesa
oral) são os que forem publicados na \cp{página da disciplina} na \emph{internet}.

Recomenda-se uma abordagem participativa dos membros do grupo
de trabalho por forma a poderem responder às questões que serão colocadas
na \emph{defesa oral} do relatório.

Em que consiste, então, o \emph{relatório} a que se refere o parágrafo anterior?
É a edição do texto que está a ser lido, preenchendo o anexo \ref{sec:resolucao}
com as respostas. O relatório deverá conter ainda a identificação dos membros
do grupo de trabalho, no local respectivo da folha de rosto.

Para gerar o PDF integral do relatório deve-se ainda correr os comando seguintes,
que actualizam a bibliografia (com \Bibtex) e o índice remissivo (com \Makeindex),
\begin{Verbatim}[fontsize=\small]
    $ bibtex cp1920t.aux
    $ makeindex cp1920t.idx
\end{Verbatim}
e recompilar o texto como acima se indicou. Dever-se-á ainda instalar o utilitário
\QuickCheck,
que ajuda a validar programas em \Haskell\ e a biblioteca \gloss{Gloss} para
geração de gráficos 2D:
\begin{Verbatim}[fontsize=\small]
    $ cabal install QuickCheck gloss
\end{Verbatim}
Para testar uma propriedade \QuickCheck~|prop|, basta invocá-la com o comando:
\begin{verbatim}
    > quickCheck prop
    +++ OK, passed 100 tests.
\end{verbatim}
Pode mesmo controlar o número de casos de teste e sua complexidade utilizando
o comando:
\begin{verbatim}
    > quickCheckWith stdArgs { maxSuccess = 200, maxSize = 10 } prop
    +++ OK, passed 200 tests.
\end{verbatim}
Qualquer programador tem, na vida real, de ler e analisar (muito!) código
escrito por outros. No anexo \ref{sec:codigo} disponibiliza-se algum
código \Haskell\ relativo aos problemas que se seguem. Esse anexo deverá
ser consultado e analisado à medida que isso for necessário.

\Problema

Pretende-se implementar um sistema de manutenção e utilização de um dicionário.
Este terá uma estrutura muito peculiar em memória. Será construída
uma árvore em que cada nodo terá apenas uma letra da palavra e cada
folha da respectiva árvore terá a respectiva tradução (um ou mais sinónimos).
Deverá ser possível:
\begin{itemize}
\item
|dic_rd| --- procurar traduções para uma determinada palavra
\item	
|dic_in| --- inserir palavras novas (palavra e tradução)
\item
|dic_imp| --- importar dicionários do formato ``lista de pares palavra-tradução"
\item
|dic_exp| --- exportar dicionários para o formato ``lista de pares palavra-tradução".
\end{itemize}
A implementação deve ser baseada no módulo \textbf{Exp.hs} que está incluído no material deste trabalho prático,
que deve ser estudado com atenção antes de abordar este problema.

    \begin{figure}          
    \includegraphics[scale=0.15]{images/dic.png}
    \caption{Representação em memória do dicionário dado para testes.}
    \label{fig:dic}          
    \end{figure}

No anexo \ref{sec:codigo} é dado um dicionário para testes, que corresponde à figura \ref{fig:dic}.
A implementação proposta deverá garantir as seguintes propriedades:
\begin{propriedade}
Se um dicionário estiver normalizado (ver apêndice \ref{sec:codigo}) então
não perdemos informação quando o representamos em memória:
\begin{code}
prop_dic_rep x = let d = dic_norm x in (dic_exp . dic_imp) d == d
\end{code}
\end{propriedade}
\begin{propriedade}
Se um significado |s| de uma palavra |p| já existe num dicionário então adicioná-lo
em memória não altera nada:
\begin{code}
prop_dic_red p s d
   | dic_red p s d = dic_imp d == dic_in p s (dic_imp d)
   | otherwise = True
\end{code}
\end{propriedade}
\begin{propriedade}
A operação |dic_rd| implementa a procura na correspondente exportação do dicionário:
\begin{code}
prop_dic_rd (p,t) = dic_rd  p t == lookup p (dic_exp t)
\end{code}
\end{propriedade}

\Problema

Árvores binárias (elementos do tipo \BTree) são
    frequentemente usadas no armazenamento e procura de dados, porque
    suportam um vasto conjunto de ferramentas para procuras
    eficientes. Um exemplo de destaque é o caso das
    \href{https://en.wikipedia.org/wiki/Binary_search_tree}{árvores
    binárias de procura}, \emph{i.e.} árvores que seguem o
    princípio de \emph{ordenação}: para todos os nós,
    o filho à esquerda tem um
    valor menor ou igual que o valor no próprio nó; e de forma
     análoga, o filho à direita
    tem um valor maior ou igual que o valor no próprio nó.
    A Figura~\ref{fig:ex} apresenta dois exemplos de árvores binárias de procura.\footnote{
    As imagens foram geradas com recurso à função |dotBt| (disponível
    neste documento). Recomenda-se o
    uso desta função para efeitos de teste e ilustração.}

    \begin{figure}          
    \includegraphics[scale=0.26]{images/example1.png}
    \includegraphics[scale=0.26]{images/example2.png}
    \caption{Duas árvores binárias de procura; a da esquerda vai ser designada
    por $t_1$ e a da direita por $t_2$.}
    \label{fig:ex}          
    \end{figure}
  Note que tais árvores permitem reduzir \emph{significativamente}
  o espaço de procura, dado que ao procurar um valor podemos sempre
  \emph{reduzir a procura a um ramo} ao longo de cada nó visitado. Por
  exemplo, ao procurar o valor $7$ na primeira árvore ($t_1$), sabemos que nos
  podemos restringir ao ramo da direita do nó com o valor $5$ e assim
  sucessivamente. Como complemento a esta explicação, consulte
  também os \href{http://www4.di.uminho.pt/~jno/media/}{vídeos das aulas teóricas} (capítulo `pesquisa binária').

  Para verificar se uma árvore binária está ordenada,
  é útil ter em conta  a seguinte
  propriedade: considere uma árvore binária cuja raíz tem o valor
  $a$, um filho $s_1$ à esquerda e um filho $s_2$ à direita.
  Assuma que os dois filhos estão ordenados; que o elemento
  \emph{mais à direita} de $t_1$ é menor ou igual a $a$; e que o
  elemento \emph{mais à esquerda} de $t_2$ é maior ou igual a $a$.
  Então a árvore binária está ordenada. Dada esta informação,
  implemente as seguintes funções como catamorfismos de árvores binárias.
\begin{code}
maisEsq :: BTree a -> Maybe a
maisDir :: BTree a -> Maybe a
\end{code}
  Seguem alguns exemplos dos resultados que se esperam ao aplicar
  estas funções à árvore da esquerda ($t1$) e à árvore da direita ($t2$)
  da Figura~\ref{fig:ex}.
  \begin{Verbatim}[fontsize=\small]
   *Splay> maisDir t1
    Just 16
   *Splay> maisEsq t1
    Just 1
   *Splay> maisDir t2
    Just 8
   *Splay> maisEsq t2
    Just 0
  \end{Verbatim}
  \begin{propriedade}
  As funções |maisEsq| e |maisDir| são determinadas unicamente
  pela propriedade
\begin{code}
prop_inv :: BTree String -> Bool
prop_inv = maisEsq .==. maisDir . invBTree
\end{code}
  \end{propriedade}
  \begin{propriedade}
    O elemento mais à esquerda de uma árvore está presente no ramo da
    esquerda, a não ser que esse ramo esteja vazio:
\begin{code}
propEsq Empty = property Discard
propEsq x@(Node(a,(t,s))) = (maisEsq t) /= Nothing ==> (maisEsq x) == maisEsq t
\end{code}
\end{propriedade}
  A próxima tarefa deste problema consiste na implementação de uma função
  que insere um novo elemento numa árvore
  binária \emph{preservando} o princípio de ordenação,
\begin{code}
insOrd :: (Ord a) => a -> BTree a -> BTree a
\end{code}
  e de uma função que verifica se uma dada árvore binária está ordenada,
\begin{code}
isOrd :: (Ord a) => BTree a -> Bool
\end{code}
Para ambas as funções deve utilizar o que aprendeu sobre \emph{catamorfismos e
recursividade mútua}.

\noindent
\textbf{Sugestão:} Se tiver problemas em implementar
com base em catamorfismos  estas duas últimas
funções, tente implementar (com base em catamorfismos) as funções auxiliares
\begin{code}
insOrd' :: (Ord a) => a -> BTree a -> (BTree a, BTree a)
isOrd' :: (Ord a) => BTree a -> (Bool, BTree a)
\end{code}
tais que
$insOrd' \> x = \langle insOrd \> x, id \rangle$ para todo o elemento $x$
do tipo $a$
e
$isOrd' = \langle isOrd, id \rangle$.
  \begin{propriedade}
   Inserir uma sucessão de elementos numa árvore vazia gera uma árvore
   ordenada.
\begin{code}
prop_ord :: [Int] -> Bool
prop_ord = isOrd . (foldr insOrd Empty)
\end{code}
\end{propriedade}

\smallskip
  \noindent
    As árvores binárias providenciam uma boa maneira de reduzir o espaço
    de procura. Mas podemos fazer ainda melhor: podemos aproximar da
    raíz os elementos da árvore que são mais acedidos, reduzindo assim
    o espaço de procura na \emph{dimensão vertical}\footnote{Note que
    nas árvores de binária de procura a redução é feita na dimensão
    horizontal.}. Esta operação é geralmente
    referida como
    \href{https://en.wikipedia.org/wiki/Splay_tree}{\emph{splaying}} e
    é implementada com base naquilo a que chamamos
    \href{https://en.wikipedia.org/wiki/Tree_rotation}{\emph{rotações à esquerda
    e à direita de uma  árvore}}.

    Intuitivamente, a rotação à direita de uma árvore move todos os
    nós "\emph{uma casa para a sua direita}". Formalmente,
    esta operação define-se da seguinte maneira:
    \begin{enumerate}
       \item Considere uma árvore binária e designe a sua
       raíz pela letra $r$. Se $r$ não tem filhos à esquerda então simplesmente
       retornamos a árvore dada à entrada. Caso contrário,
       \item designe o filho à esquerda pela letra $l$. A árvore
       que vamos retornar tem $l$ na raíz, que mantém o filho à esquerda
       e adopta $r$ como o filho à direita. O orfão (\emph{i.e.} o anterior
       filho à direita de $l$) passa a ser o filho à esquerda de $r$.
    \end{enumerate}
    A rotação à esquerda é definida de forma análoga. As
       Figuras~\ref{exrot:fig} e \ref{exrot2:fig} apresentam dois
       exemplos de rotações à direita. Note que em ambos os casos o
       valor $2$ subiu um nível na árvore correspodente. De facto,
       podemos sempre aplicar uma \emph{sequência} de rotações numa
       árvore de forma a mover um dado nó para a raíz (dando origem
       portanto à referida operação de splaying).

    \begin{figure}
    \includegraphics[scale=0.27]{images/example1.png}
    \includegraphics[scale=0.27]{images/example3.png}
    \caption{Exemplo de uma rotação à direita. A árvore da esquerda
    é a árvore original; a árvore da direita representa a rotação à direita
    correspondente.}
    \label{exrot:fig}
    \end{figure}

    \begin{figure}
    \includegraphics[scale=0.25]{images/example2.png}
    \includegraphics[scale=0.25]{images/example4.png}
    \caption{Exemplo de uma rotação à direita. A árvore da esquerda
    é a árvore original; a árvore da direita representa a rotação à direita
    correspondente.}
    \label{exrot2:fig}
    \end{figure}

    Começe então por implementar as funções   
\begin{code}
rrot :: BTree a -> BTree a
lrot :: BTree a -> BTree a
\end{code}
    de rotação à direita e à esquerda.
    \begin{propriedade}
       As rotações à esquerda e à direita preservam a ordenação
       das árvores.
\begin{code}
prop_ord_pres_esq = forAll orderedBTree (isOrd . lrot)
prop_ord_pres_dir = forAll orderedBTree (isOrd . rrot)
\end{code}
    \end{propriedade}
De seguida implemente a operação de splaying
\begin{code}
splay :: [Bool] -> (BTree a -> BTree a)
\end{code}
como um catamorfismo de listas. O argumento |[Bool]|
representa um caminho ao longo de uma árvore, em que o valor |True|
representa "seguir pelo ramo da esquerda" e o valor |False|
representa "seguir pelo ramo da direita". O caminho ao longo de uma árvore serve
para \emph{identificar} unicamente um nó dessa árvore.
\begin{propriedade}
A operação de splay preserva a ordenação de uma árvore.
\begin{code}
prop_ord_pres_splay :: [Bool] -> Property
prop_ord_pres_splay path = forAll orderedBTree (isOrd . (splay path))
\end{code}
\end{propriedade}

\Problema

\emph{Árvores de decisão binárias} são estruturas de dados usadas na
 área de
 \href{https://www.xoriant.com/blog/product-engineering/decision-trees-machine-learning-algorithm.html}{machine
 learning} para codificar processos de decisão. Geralmente, tais
 árvores são geradas por computadores com base num vasto conjunto de
 dados e reflectem o que o computador "aprendeu" ao processar esses
 mesmos dados. Segue-se um exemplo muito simples de uma árvore de decisão
 binária:

\[
  \xymatrix{ & \text{chuva na ida?} \ar[dl]_{\text{sim}} \ar[dr]^{\text{não}} & &\\
  \text{precisa} & & \text{chuva no regresso?} \ar[dl]^{\text{sim}}
  \ar[dr]^{\text{não}} & \\
  & \text{precisa} & & \text{não precisa}
  }
\]

Esta árvore representa o processo de decisão relativo a ser preciso ou
    não levar um guarda-chuva para uma viagem, dependendo das
    condições climatéricas. Essencialmente, o processo de decisão é
    efectuado ao "percorrer" a árvore, escolhendo o ramo da esquerda ou
    da direita de acordo com a resposta à pergunta correspondente. Por
    exemplo, começando da raiz da árvore, responder |["não", "não"]|
    leva-nos à decisão |"não precisa"| e responder |["não", "sim"]|
    leva-nos à decisão |"precisa"|.

Árvores de decisão binárias podem ser codificadas em \Haskell\ usando
o seguinte tipo de dados:
\begin{code}
data Bdt a = Dec a | Query (String, (Bdt a, Bdt a)) deriving Show
\end{code}

Note que o tipo de dados |Bdt| é parametrizado por um tipo de dados
 |a|.  Isto é necessário, porque as decisões podem ser de diferentes
 tipos: por exemplo, respostas do tipo "sim ou não" (como apresentado
 acima), a escolha de números, ou
 \href{http://jkurokawa.com/2018/02/09/machine-learning-part-ii-decision-trees}{classificações}.

De forma a conseguirmos processar árvores de decisão binárias em \Haskell,
deve, antes de tudo, resolver as seguintes alíneas:
\begin{enumerate}
  \item Definir as funções |inBdt|, |outBdt|, |baseBdt|, |cataBdt|, e |anaBdt|.
  \item Apresentar no relatório o diagrama de |anaBdt|.
\end{enumerate}
Para tomar uma decisão com base numa árvore de decisão binária |t|, o
computador precisa apenas da estrutura de |t| (\emph{i.e.} pode esquecer
a informação nos nós da árvore) e de uma lista de respostas "sim ou não" (para
que possa percorrer a árvore da forma desejada). Implemente então as seguintes
funções na forma de \emph{catamorfismos}:
\begin{enumerate}
\item |extLTree : Bdt a -> LTree a| (esquece a informação presente
nos nós de uma dada árvore de decisão binária).
\begin{propriedade}
  A função |extLTree| preserva as folhas da árvore de origem.
\begin{code}
prop_pres_tips :: Bdt Int -> Bool
prop_pres_tips = tipsBdt .==. tipsLTree . extLTree
\end{code}
\end{propriedade}
\item |navLTree : LTree a -> ([Bool] -> LTree a)| (navega um elemento de
|LTree|
de acordo com uma sequência de respostas "sim ou não". Esta função deve
ser implementada como um catamorfismo de |LTree|. Neste contexto,
elementos de |[Bool]| representam sequências de respostas: o valor |True| corresponde a "sim" e portanto a "segue pelo ramo da esquerda"; o valor
|False| corresponde a "não" e portanto a "segue pelo ramo da direita".

Seguem
alguns exemplos dos resultados que se esperam ao aplicar |navLTree| a
|(extLTree bdtGC)|, em que |bdtGC| é a  àrvore de decisão binária acima descrita,
e a uma
sequência de respostas.
   \begin{Verbatim}[fontsize=\small]
    *ML> navLTree (extLTree bdtGC) []
    Fork (Leaf "Precisa",Fork (Leaf "Precisa",Leaf "N precisa"))
    *ML> navLTree (extLTree bdtGC) [False]
    Fork (Leaf "Precisa",Leaf "N precisa")
    *ML> navLTree (extLTree bdtGC) [False,True]
    Leaf "Precisa"
    *ML> navLTree (extLTree bdtGC) [False,True,True]
    Leaf "Precisa"
    *ML> navLTree (extLTree bdtGC) [False,True,True,True]
    Leaf "Precisa"
   \end{Verbatim}
\end{enumerate}
\begin{propriedade}
  Percorrer uma árvore ao longo de um caminho é equivalente a percorrer
a árvore inversa ao longo do caminho inverso.
\begin{code}
prop_inv_nav :: Bdt Int -> [Bool] -> Bool
prop_inv_nav t l = let t' = extLTree t in
  invLTree (navLTree t' l) == navLTree (invLTree t') (fmap not l)
\end{code}
\end{propriedade}
\begin{propriedade}
  Quanto mais longo for o caminho menos alternativas de fim irão existir.
\begin{code}
prop_af :: Bdt Int -> ([Bool],[Bool]) -> Property
prop_af t (l1,l2) = let t' = extLTree t
                        f = length . tipsLTree . (navLTree t')
                    in isPrefixOf l1 l2 ==> (f l1 >= f l2)
\end{code}
\end{propriedade}

\Problema

%format B = "\mathit B"
%format C = "\mathit C"
Mónades são functores com propriedades adicionais que nos permitem obter
efeitos especiais em progra\-mação. Por exemplo, a biblioteca \Probability\
oferece um mónade para abordar problemas de probabilidades. Nesta biblioteca,
o conceito de distribuição estatística é captado pelo tipo
\begin{eqnarray}
	|newtype Dist a = D {unD :: [(a, ProbRep)]}|
	\label{eq:Dist}
\end{eqnarray}
em que |ProbRep| é um real de |0| a |1|, equivalente a uma escala de $0$ a
$100 \%$.

Cada par |(a,p)| numa distribuição |d::Dist a| indica que a probabilidade
de |a| é |p|, devendo ser garantida a propriedade de  que todas as probabilidades
de |d| somam $100\%$.
Por exemplo, a seguinte distribuição de classificações por escalões de $A$ a $E$,
\[
\begin{array}{ll}
A & \rule{2mm}{3pt}\ 2\%\\
B & \rule{12mm}{3pt}\ 12\%\\
C & \rule{29mm}{3pt}\ 29\%\\
D & \rule{35mm}{3pt}\ 35\%\\
E & \rule{22mm}{3pt}\ 22\%\\
\end{array}
\]
será representada pela distribuição
\begin{code}
d1 :: Dist Char
d1 = D [('A',0.02),('B',0.12),('C',0.29),('D',0.35),('E',0.22)]
\end{code}
que o \GHCi\ mostrará assim:
\begin{Verbatim}[fontsize=\small]
'D'  35.0%
'C'  29.0%
'E'  22.0%
'B'  12.0%
'A'   2.0%
\end{Verbatim}
É possível definir geradores de distribuições, por exemplo distribuições \emph{uniformes},
\begin{code}
d2 = uniform (words "Uma frase de cinco palavras")
\end{code}
isto é
\begin{Verbatim}[fontsize=\small]
     "Uma"  20.0%
   "cinco"  20.0%
      "de"  20.0%
   "frase"  20.0%
"palavras"  20.0%
\end{Verbatim}
distribuição \emph{normais}, eg.\
\begin{code}
d3 = normal [10..20]
\end{code}
etc.\footnote{Para mais detalhes ver o código fonte de \Probability, que é uma adaptação da
biblioteca \PFP\ (``Probabilistic Functional Programming''). Para quem quiser souber mais
recomenda-se a leitura do artigo \cite{EK06}.}
|Dist| forma um \textbf{mónade} cuja unidade é |return a = D [(a,1)]| e cuja composição de Kleisli
é (simplificando a notação)
\begin{spec}
  ((kcomp f g)) a = [(y,q*p) | (x,p) <- g a, (y,q) <- f x]
\end{spec}
em que |g: A -> Dist B| e |f: B -> Dist C| são funções \textbf{monádicas} que representam
\emph{computações probabilísticas}.
Este mónade é adequado à resolução de problemas de
 \emph{probabilidades e estatística} usando programação funcional, de
 forma elegante e como caso particular da programação
 monádica. Vamos estudar a aplicação
 deste mónade ao exercício anterior, tendo em conta o facto de que nem
 sempre podemos responder com 100\% de certeza a perguntas presentes
 em árvores de decisão.


Considere a seguinte situação: a Anita vai
 trabalhar no dia seguinte
e quer saber se precisa de levar guarda-chuva.  Na verdade,
 ela tem autocarro de porta de casa até ao trabalho, e portanto
 as condições meteorológicas não são muito significativas; a não ser
 que seja segunda-feira...Às segundas é dia de feira e o autocarro vai
 sempre lotado! Nesses dias, ela prefere fazer a pé o caminho de casa
 ao trabalho, o que a obriga a levar guarda-chuva (nos dias de
 chuva). Abaixo está apresentada a árvore de decisão respectiva a este problema.

 \[
     \xymatrix{
     && \text{2a-feira?} \ar[dl]_{\text{sim}} \ar[dr]^{\text{não}} & \\
     & \text{chuva na ida?} \ar[dl]_{\text{sim}} \ar[dr]^{\text{não}}
      && \text{não precisa} \\
     \text{precisa} && \text{chuva no regresso?}
    \ar[dl]_{\text{sim}} \ar[dr]^{\text{não}} & \\
     &\text{precisa} && \text{não precisa}
     }
  \]

Assuma que a Anita não sabe em que dia está, e que a previsão da
   chuva para a ida é de 80\% enquanto que a previsão de chuva para o
   regresso é de 60\%. \emph{A Anita deve
  levar guarda-chuva?}
  Para responder a esta questão, iremos tirar partido do que se aprendeu
  no exercício anterior. De facto, a maior diferença é que agora as
  respostas ("sim" ou "não") são dadas na forma de uma distribuição sobre o tipo de dados
  |Bool|. Implemente como um catamorfismo de |LTree| a função
\begin{code}
bnavLTree :: LTree a -> ((BTree Bool) -> LTree a)
\end{code}
que percorre uma árvore dado um caminho, \emph{não} do tipo |[Bool]|, mas
do tipo |BTree Bool|. O tipo |BTree Bool| é necessário
na presença de incerteza, porque neste contexto não sabemos sempre
       qual a próxima pergunta a responder. Teremos portanto
que ter resposta para todas as perguntas na árvore de decisão.

Seguem alguns exemplos dos resultados que se esperam
       ao aplicar |bnavLTree| a |(extLTree anita)|, em que |anita| é a
       árvore de decisão acima descrita, e a uma árvore
      binária de respostas.
     \begin{Verbatim}[fontsize=\small]
      *ML> bnavLTree (extLTree anita) (Node(True, (Empty,Empty)))
      Fork (Leaf "Precisa",Fork (Leaf "Precisa",Leaf "N precisa"))
      *ML> bnavLTree (extLTree anita) (Node(True, (Node(True,(Empty,Empty)),Empty)))
      Leaf "Precisa"
      *ML> bnavLTree (extLTree anita) (Node(False, (Empty,Empty)))
      Leaf "N precisa"
     \end{Verbatim}
Por fim, implemente como um catamorfismo de |LTree| a função
\begin{code}
pbnavLTree :: LTree a -> ((BTree (Dist Bool)) -> Dist(LTree a))
\end{code}
que deverá consiste na "monadificação" da função |bnavLTree| via a mónade das
probabilidades. Use esta última implementação para responder se a Anita deve
levar guarda-chuva ou não dada a situação acima descrita.
\Problema

Os \truchet{mosaicos de Truchet} são padrões que se obtêm gerando aleatoriamente
combinações bidimensionais de ladrilhos básicos. Os que se mostram na figura
\ref{fig:tiles} são conhecidos por ladrilhos de Truchet-Smith.
A figura \ref{fig:truchet} mostra um exemplo de mosaico produzido por uma
combinação aleatória de 10x10 ladrilhos |a| e |b| (cf.\ figura
\ref{fig:tiles}).

Neste problema pretende-se programar a geração aleatória de mosaicos de
Truchet-Smith usando o mónade \random{Random} e a biblioteca \gloss{Gloss}
para produção do resultado. Para uniformização das respostas, deverão ser
seguidas as seguintes condições:
\begin{itemize}
\item	Cada ladrilho deverá ter as dimensões 80x80
\item	O programa deverá gerar mosaicos de quaisquer dimensões, mas deverá ser apresentado como figura no relatório o mosaico de 10x10 ladrilhos.
\item	Valorizar-se-ão respostas elegantes e com menos linhas de código \Haskell.
\end{itemize} 
No anexo \ref{sec:codigo} é dada uma implementação da operação de permuta aleatória de uma lista que pode ser útil para resolver este exercício.

    \begin{figure}\centering
    \includegraphics[scale=0.20]{images/tiles.png}
    \caption{Os dois ladrilhos de Truchet-Smith.}
    \label{fig:tiles}
    \end{figure}

    \begin{figure}\centering
    \includegraphics[scale=0.20]{images/truchet.png}
    \caption{Um mosaico de Truchet-Smith.}
    \label{fig:truchet}
    \end{figure}

%----------------- Programa, bibliotecas e código auxiliar --------------------%

\newpage

\part*{Anexos}

\appendix

\section{Como exprimir cálculos e diagramas em LaTeX/lhs2tex}
Estudar o texto fonte deste trabalho para obter o efeito:\footnote{Exemplos tirados de \cite{Ol18}.} 
\begin{eqnarray*}
\start
	|id = split f g|
%
\just\equiv{ universal property }
%
        |lcbr(
		p1 . id = f
	)(
		p2 . id = g
	)|
%
\just\equiv{ identity }
%
        |lcbr(
		p1 = f
	)(
		p2 = g
	)|
\qed
\end{eqnarray*}

Os diagramas podem ser produzidos recorrendo à \emph{package} \LaTeX\ 
\href{https://ctan.org/pkg/xymatrix}{xymatrix}, por exemplo: 
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Nat0|
           \ar[d]_-{|cataNat g|}
&
    |1 + Nat0|
           \ar[d]^{|id + (cataNat g)|}
           \ar[l]_-{|inNat|}
\\
     |B|
&
     |1 + B|
           \ar[l]^-{|g|}
}
\end{eqnarray*}


\section{Código fornecido}\label{sec:codigo}

\subsection*{Problema 1}
Função de representação de um dicionário:
\begin{code}
dic_imp :: [(String,[String])] -> Dict
dic_imp = Term "" . map (bmap  id singl) . untar . discollect
\end{code}
onde
\begin{code}
type Dict = Exp String String
\end{code}
Dicionário para testes:
\begin{code}
-- Primeiro é a palavra, e depois é uma lista de possiveis traduções
d :: [(String, [String])]
d =  [ ("ABA",["BRIM"]),
       ("ABALO",["SHOCK"]),
       ("AMIGO",["FRIEND"]),
       ("AMOR",["LOVE"]),
       ("MEDO",["FEAR"]),
       ("MUDO",["DUMB","MUTE"]),
       ("PE",["FOOT"]),
       ("PEDRA",["STONE"]),
       ("POBRE",["POOR"]),
       ("PODRE",["ROTTEN"])]
\end{code}
Normalização de um dicionário (remoção de entradas vazias):
\begin{code}
-- Dicionario normalizado
dic_norm = collect . filter p . discollect where
   p(a,b)= a > "" && b > ""
\end{code}
Teste de redundância de um significado |s| para uma palavra |p|:
\begin{code}
--Teste de redundancia de um significado s para uma palavra p
dic_red p s d = (p,s) `elem` discollect d
\end{code}

\subsection*{Problema 2}

Árvores usadas no texto:
\begin{code}
emp x = Node(x,(Empty,Empty))

t7 = emp 7
t16 = emp 16
t7_10_16 = Node(10,(t7,t16))
t1_2_nil = Node(2,(emp 1, Empty)) 
t' = Node(5,(t1_2_nil, t7_10_16))

t0_2_1 = Node(2, (emp 0, emp 3))
t5_6_8 = Node(6, (emp 5, emp 8))
t2 = Node(4, (t0_2_1, t5_6_8))

dotBt :: (Show a) => BTree a -> IO ExitCode
dotBt = dotpict . bmap Just Just . cBTree2Exp . (fmap show)
\end{code}

\subsection*{Problema 3}
Funções usadas para efeitos de teste:
\begin{code}
tipsBdt :: Bdt a -> [a]
tipsBdt = cataBdt (either singl ((uncurry (++)) . p2))
tipsLTree = tips
\end{code}

\subsection*{Problema 5}
Função de permutação aleatória de uma lista:
\begin{code}
permuta [] = return []
permuta x = do { (h,t) <- getR x; t' <- permuta t; return (h:t') } where
      getR x = do { i <- getStdRandom (randomR (0,length x-1)); return (x!!i,retira i x) }
      retira i x = take i x ++ drop (i+1) x
\end{code}

\subsection*{QuickCheck}
Código para geração de testes:
\begin{code}
instance Arbitrary a => Arbitrary (BTree a) where
    arbitrary = sized genbt  where
              genbt 0 = return (inBTree $ i1 ())
              genbt n = oneof [(liftM2 $ curry (inBTree . i2))
                QuickCheck.arbitrary (liftM2 (,) (genbt (n-1)) (genbt (n-1))),
                (liftM2 $ curry (inBTree . i2))
                QuickCheck.arbitrary (liftM2 (,) (genbt (n-1)) (genbt 0)),
                (liftM2 $ curry (inBTree . i2))
                QuickCheck.arbitrary (liftM2 (,) (genbt 0) (genbt (n-1)))]               

instance (Arbitrary v, Arbitrary o) => Arbitrary (Exp v o) where
    arbitrary = (genExp 10)  where
              genExp 0 = liftM (inExp . i1) QuickCheck.arbitrary
              genExp n = oneof [liftM (inExp . i2 . (\a -> (a,[]))) QuickCheck.arbitrary,
                         liftM (inExp . i1) QuickCheck.arbitrary,
                         liftM (inExp . i2 . (\(a,(b,c)) -> (a,[b,c])))
                         $ (liftM2 (,) QuickCheck.arbitrary (liftM2 (,)
                                                             (genExp (n-1)) (genExp (n-1)))),
                         liftM (inExp . i2 . (\(a,(b,c,d)) -> (a,[b,c,d])))
                         $ (liftM2 (,) QuickCheck.arbitrary (liftM3 (,,)
                                                             (genExp (n-1)) (genExp (n-1)) (genExp (n-1))))        
                      ]

orderedBTree :: Gen (BTree Int)
orderedBTree = liftM (foldr insOrd Empty) (QuickCheck.arbitrary :: Gen [Int])

instance (Arbitrary a) => Arbitrary (Bdt a) where
    arbitrary = sized genbt  where
              genbt 0 = liftM Dec QuickCheck.arbitrary
              genbt n = oneof [(liftM2 $ curry Query)
                QuickCheck.arbitrary (liftM2 (,) (genbt (n-1)) (genbt (n-1))),
                (liftM2 $ curry (Query))
                QuickCheck.arbitrary (liftM2 (,) (genbt (n-1)) (genbt 0)),
                (liftM2 $ curry (Query))
                QuickCheck.arbitrary (liftM2 (,) (genbt 0) (genbt (n-1)))]      


\end{code}

\subsection*{Outras funções auxiliares}
%----------------- Outras definições auxiliares -------------------------------------------%
Lógicas:
\begin{code}
infixr 0 .==>.
(.==>.) :: (Testable prop) => (a -> Bool) -> (a -> prop) -> a -> Property
p .==>. f = \a -> p a ==> f a

infixr 0 .<==>.
(.<==>.) :: (a -> Bool) -> (a -> Bool) -> a -> Property
p .<==>. f = \a -> (p a ==> property (f a)) .&&. (f a ==> property (p a))

infixr 4 .==.
(.==.) :: Eq b => (a -> b) -> (a -> b) -> (a -> Bool)
f .==. g = \a -> f a == g a

infixr 4 .<=.
(.<=.) :: Ord b => (a -> b) -> (a -> b) -> (a -> Bool)
f .<=. g = \a -> f a <= g a

infixr 4 .&&&.
(.&&&.) :: (a -> Bool) -> (a -> Bool) -> (a -> Bool)
f .&&&. g = \a -> ((f a) && (g a))
\end{code}
Compilação e execução dentro do interpretador:\footnote{Pode ser útil em testes
envolvendo \gloss{Gloss}. Nesse caso, o teste em causa deve fazer parte de uma função
|main|.}
\begin{code}

run = do { system "ghc cp1920t" ; system "./cp1920t" }
\end{code}

\newpage

%----------------- Soluções dos alunos -----------------------------------------%

\section{Soluções dos alunos}\label{sec:resolucao}
Os alunos devem colocar neste anexo as suas soluções aos exercícios
propostos, de acordo com o "layout" que se fornece. Não podem ser
alterados os nomes ou tipos das funções dadas, mas pode ser adicionado texto e/ou 
outras funções auxiliares que sejam necessárias.

\begin{code}

valid t = t == (dic_imp . dic_norm . dic_exp) t

\end{code}

\begin{propriedade}

Se um significado |s| de uma palavra |p| já existe num dicionário normalizado então adicioná-lo
em memória não altera nada:

\begin{code}

prop_dic_red1 p s d
   | d /= dic_norm d = True  
   | dic_red p s d = dic_imp d == dic_in p s (dic_imp d)
   | otherwise = True

\end{code}

\end{propriedade}

\begin{propriedade}

A operação |dic_rd| implementa a procura na correspondente exportação de um dicionário normalizado:

\begin{code}

prop_dic_rd1 (p,t)
   | valid t     = dic_rd  p t == lookup p (dic_exp t)
   | otherwise = True

\end{code}

\end{propriedade}

\newpage

\subsection*{Problema 1}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |[(String,[String])]|
           \ar[d]_-{|cataNat discollect|}
&
    |1 + ((String,[String]) >< [(String,[String])])|
           \ar[d]^{|id + (id >< (cataNat discollect))|}
           \ar[l]_-{|inList|}
\\
     |[(String,String)]|
&
     |1 + ((String,[String]) >< [(String,String)])|
           \ar[l]^-{|discollect|}
           \ar[d]^{|id + (discollectOnePair >< id)|}
\\
&
     |1 + ([(String,String)] >< [(String,String)]|
           \ar[ul]^-{|[nil,conc]|}
}
\end{eqnarray*}

\begin{code}

discollect :: (Ord b, Ord a) => [(b, [a])] -> [(b, a)]
discollect = cataList g where
  g = either nil (conc . (discollectOnePair >< id))

\end{code}

\begin{code}

discollectOnePair :: (Ord b, Ord a) => (b,[a]) -> [(b,a)]
discollectOnePair (x,[]) = []
discollectOnePair (x,(h:t)) = (x,h) : discollectOnePair (x,t)

\end{code}

Para a função \texttt{discollect}, o nosso método de pensamento foi o seguinte:

\begin{itemize}
	\item Para cada par \textbf{(palavra, traduções)} criar n pares \textbf{(palavra, tradução)}, em que n representa o tamanho da lista.
	\item Concatenar os n pares \textbf{(palavra, tradução)} com o resultado da chamada recursiva.
\end{itemize}

\begin{code}

dic_exp :: Dict -> [(String,[String])]
dic_exp = collect . tar

\end{code}

%format (Seq (a)) = a"^{*}"

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Dict|
           \ar[d]_-{|cataNat tar|}
&
    |String + (String >< Seq(Dict))|
           \ar[d]^{|id + (id >< (map (cataNat tar)))|}
           \ar[l]_-{|inExp|}
\\
     |[(String,String)]|
&
     |String + String >< [[(String,String)]])|
           \ar[l]^-{|tar|}
           \ar[d]^{|createPair + (id >< concLists)|}
\\
&
     |[(String,String)] + (String >< [(String,String)]|
           \ar[ul]^-{|[id,concLetter]|}
}
\end{eqnarray*}

\begin{code}

tar = cataExp g where
  g = either createPair (concLetter . (id >< concLists))

\end{code}

\begin{code}

createPair s = [("",s)]

concLetter (s,[]) = []
concLetter (s,((s1,s2):t)) = (s ++ s1, s2) : concLetter (s,t)

concLists [] = []
concLists (h:t) = h ++ concLists t  

\end{code}

\newpage

Para a função \texttt{tar}, o nosso método de pensamento foi o seguinte:

\begin{itemize}
	\item Para o resultado do \texttt{map} da chamada recursiva, é importante concatenar as listas de pares para obter, numa só lista, todos os pares \textbf{(palavra, tradução)} do dicionário. Daí a utilização da função \texttt{concLists}.
	\item De seguida, é necessário colocar a letra correspondente à posição onde estamos na árvore como prefixo de todas as palavras dessa mesma árvore. Utilizámos então a função \texttt{concLetter} para este efeito.
	\item Finalmente, quando tratámos das traduções, é necessário criar um par \textbf{([], tradução)} para que a \texttt{String} do lado esquerdo possa ser preenchida pela função recursiva.
\end{itemize}

\begin{eqnarray*}
\resizebox{\displaywidth}{!}{%
\xymatrix@@C=1cm{
    |Maybe [String]|
&&
    |1 + (Exp String String >< Maybe [String])|
           \ar[ll]^-{| either Nothing (either (Just . cons . takeValueFromExp >< takeValueFromMaybe) p2) . (checkTranslation . p1)? |}
\\
    |[Exp String String]|
           \ar[u]^-{| cataNat g |}
&&
    |1 + (Exp String String >< [Exp String String])|
           \ar[ll]_-{|inList = either nil cons|}
           \ar[u]^-{| id + (id >< cataNat g)|}
\\
     |String >< [Exp String String]|
           \ar[u]^-{|[( h )]|}
           \ar[r]_-{|distr . (id >< outList)|} 
&
     |String >< 1 + String >< (Exp String String >< [Exp String String])|
           \ar[r]_-{|nil + checkFirstLetter_rd|}
&
     |1 + (Exp String String >< (String >< [Exp String String]))|
           \ar[u]^-{|id + (id >< [( h )])|}
}}
\end{eqnarray*}

\begin{code}

dic_rd p t = dic_rd_aux (p, getExpList t)

dic_rd_aux = hyloList g h
  where h = (nil -|- checkFirstLetter_rd) . distr . (id >< outList)
        g = either (const Nothing) (Cp.cond (checkTranslations . p1) 
        	(Just . (cons . (takeValueFromExp >< takeValueFromMaybe))) (p2))

\end{code}

\begin{code}

getExpList :: Dict -> [Exp String String]
getExpList (Var a) = [Var a]
getExpList (Term o l) = [Term o l]

takeValueFromExp :: Exp String String -> String
takeValueFromExp (Var o) = o

takeValueFromMaybe :: Maybe [String] -> [String]
takeValueFromMaybe Nothing = []
takeValueFromMaybe (Just a) = a
 
checkTranslations :: Exp String String -> Bool
checkTranslations (Var o) = True
checkTranslations (Term o l) = False

\end{code}

\begin{code}

checkFirstLetter_rd :: (String, (Exp String String, [Exp String String])) 
						-> (Exp String String, (String, [Exp String String]))
checkFirstLetter_rd ( [], ((Term o l),t) ) = ((Term o []), ([], t))
checkFirstLetter_rd ( [], ((Var o),t) ) = ((Var o), ([], t))
checkFirstLetter_rd ( s, ((Var o),t) ) = ((Term o []), (s, t))
checkFirstLetter_rd ( s, ((Term [] l),t) ) = ((Term [] []), (s,l))
checkFirstLetter_rd ( (x:xs), ((Term o l),t) ) = if x == head(o) 
												 	then ((Term o []), (xs, l)) 
													else ((Term o []), ((x:xs), t))

\end{code}

\newpage

Para a função \texttt{dic\_rd}, o nosso método de pensamento foi o seguinte:

\begin{itemize}
  \item Inicialmente, foi necessário pensar numa estrutura que permitisse realizar recursividade horizontal sem saber, exatamente, quantas listas de expressões temos. Assim, a única estrutra conhecida que nos dá esta funcionalidade são as listas.
  \item Para nos ajudar, criámos uma função auxiliar que recebe a lista de expressões do dicionário e a palavra a pesquisar, a função \texttt{dic\_rd\_aux}. Esta função é um hilomorfismo em que o seu anamorfismo vai percorrer o dicionário até chegar ao local onde se encontra a tradução/traduções da palavra, guardando o caminho que percorre.
  \item O catamorfismo simplesmente pega no caminho resultante do anamorfismo e cria uma lista com as expressões \texttt{Var} desse caminho, já que estas representam as traduções.
  \item Para garantirmos que as expressões \texttt{Var} presentes no caminho representam a tradução da palavra pesquisada, todos os outros \texttt{Var} são transformados em \texttt{Term}.
\end{itemize} 

\begin{code}

dic_in p s t = undefined

\end{code}

\subsection*{Problema 2}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |BTree A|
           \ar[d]_-{|cataNat maisDir|}
&
    |1 + (A >< (BTree A >< BTree A))|
           \ar[d]^{|id + (id >< (cataNat maisDir >< cataNat maisDir))|}
           \ar[l]_-{|inBTree|}
\\
     |Maybe A|
&
     |1 + (A >< (Maybe A >< Maybe A))|
           \ar[l]^-{|maisDir|}
           \ar[d]^{|id + maisDirAux|}
\\
&
     |1 + Maybe A|
           \ar[ul]^-{|[Nothing,id]|}
}
\end{eqnarray*}

\begin{code}

maisDir = cataBTree g
  where g = either (const Nothing) maisDirAux

\end{code}

\begin{code}

maisDirAux (root, (l,Nothing)) = Just root
maisDirAux (root, (l,r)) = r

\end{code}

Para a função \texttt{maisDir}, o nosso método de pensamento foi muito simples. Enquanto a chamada recursiva retonar um valor à direita, escolhemos sempre esse valor e, dessa forma, seguimos sempre pela direita. Quando a chamada recursiva retornar \texttt{Nothing} do lado direito, é sinal que a árvore do lado direito é \texttt{Empty} logo, o elemento mais à direita é o atual.

\newpage

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |BTree A|
           \ar[d]_-{|cataNat maisEsq|}
&
    |1 + (A >< (BTree A >< BTree A))|
           \ar[d]^{|id + (id >< (cataNat maisEsq >< cataNat maisEsq))|}
           \ar[l]_-{|inBTree|}
\\
     |Maybe A|
&
     |1 + (A >< (Maybe A >< Maybe A))|
           \ar[l]^-{|maisDir|}
           \ar[d]^{|id + maisEsqAux|}
\\
&
     |1 + Maybe A|
           \ar[ul]^-{|[Nothing,id]|}
}
\end{eqnarray*}

\begin{code}

maisEsq = cataBTree g
  where g = either (const Nothing) maisEsqAux

\end{code}

\begin{code}

maisEsqAux (root, (Nothing,r)) = Just root
maisEsqAux (root, (l,r)) = l

\end{code}

Para a função \texttt{maisEsq}, o nosso método de pensamento foi exatamente o mesmo para a função anterior. Apenas invertemos o caminho que queremos seguir (pela esquerda e não pela direita).

\begin{code}

insOrd' x = undefined

insOrd a x = insOrd_aux a x

insOrd_aux :: Ord a => a -> BTree a -> BTree a
insOrd_aux x Empty = Node(x,(Empty,Empty))
insOrd_aux x (Node(x1,(l,r))) | x <= x1 = Node(x1,((insOrd_aux x l), r))
                              | otherwise = Node(x1,(l,(insOrd_aux x r)))

\end{code}

Infelizmente, não conseguimos produzir a função insOrd como um catamorfirsmo com recursividade mútua e, daí, criamos a função recursiva que faz a inserção de um elemente de forma ordenada na árvore.

\begin{eqnarray*}
\resizebox{\displaywidth}{!}{%
\xymatrix@@C=2cm{
    |BTree A|
           \ar[d]_-{|cataNat isOrd'|}
&
    |1 + (A >< (BTree A >< BTree A))|
           \ar[d]^{|id + (id >< (map (cataNat tar)))|}
           \ar[l]_-{|inExp|}
\\
     |Bool x BTree A|
&
     |1 + (A >< ((Bool >< BTree A) >< (Bool >< BTree A)))|
           \ar[l]^-{|isOrd'|}
           \ar[d]^{|id + < <verificaIsOrdEsq . (id >< p1), verificaIsOrdDir . (id >< p2) >
           			, criaBTree . (id >< p2 >< p2) >|}
\\
&
     |1 + (Bool >< Bool) >< BTree A|
           \ar[ul]^-{|[<True,Empty>,uncurry (&&)]|}
}}
\end{eqnarray*}

\begin{code}

isOrd' = cataBTree g
  where g = either (split (const True) (const Empty)) 
  			(split (uncurry (&&) . (split (verificaIsOrdEsq . ( id >< p1 )) (verificaIsOrdDir . ( id >< p2 )))) (criaBTree . ( id >< (p2 >< p2))))
 
isOrd = p1 . isOrd'

\end{code}

\begin{code}

criaBTree :: (a, (BTree a, BTree a)) -> BTree a
criaBTree (a, (t1, t2)) = Node(a, (t1,t2))

verificaIsOrdEsq :: Ord a => (a, (Bool, BTree a)) -> Bool
verificaIsOrdEsq (a, (b1, Empty)) = True
verificaIsOrdEsq (a, (b1, (Node (x1, (t1, t2))))) = if ((a >= x1) && (b1 == True)) 
													then verificaIsOrdEsq (a,(b1,t1)) && verificaIsOrdEsq (a,(b1,t2)) 
													else False

verificaIsOrdDir :: Ord a => (a, (Bool, BTree a)) -> Bool
verificaIsOrdDir (a, (b1, Empty)) = True
verificaIsOrdDir (a, (b1, (Node (x1, (t1, t2))))) = if ((a < x1) && (b1 == True)) 
													then verificaIsOrdDir (a,(b1,t1)) && verificaIsOrdDir (a,(b1,t2)) 
													else False

\end{code}

\newpage

Para a função \texttt{isOrd}, o nosso método de pensamento foi o seguinte:

\begin{itemize}
  \item Em primeiro lugar, era necessário verificar se o nodo atual estava ordenado comparado com o que estava à esquerda e à direita dele. Optamos por fazer duas funções auxiliares que verificam exatamente isso:
  \begin{itemize}
    \item A função \texttt{verificaIsOrdEsq} verifica se todos os elementos à esquerda do nodo são valores inferiores ou iguais a este. Isto é feito através da comparação do nodo atual com a raiz da árvore esquerda e através da observação do valor \texttt{Boolean} resultante da chamada recursiva.
    \item A função \texttt{verificaIsOrdEsq} verifica se todos os elementos à direita do nodo são valores maiores do que este. O algoritmo é o mesmo que o apresentado acima, apenas altera a árvore utilizada sendo, neste caso, utilizada a árvore direita. 
  \end{itemize}
  \item O resultado destas duas funções é um \texttt{Boolean}, o que indica a necessidade de conjugar estes dois resultados e retornar o \texttt{Boolean} resultante desta operação.
  \item Finalmente, é aplicada a recursividade mútua, porque não só realizamos a operação descrita acima como também juntamos o resultado desta à árvore ao qual este está associado.
\end{itemize}

\begin{code}

rrot = inBTree . (id -|- rrotAux) . outBTree

rrotAux :: (a,(BTree a, BTree a)) -> (a,(BTree a, BTree a))
rrotAux (a, (Empty, r)) = (a, (Empty, r))
rrotAux (a, ((Node (x1, (t1, t2))), r)) = (x1, (t1, (Node(a, (t2, r)))))

\end{code}

Para a função \texttt{rrot}, o nosso método de pensamento foi o seguinte:

\begin{itemize}
  \item Em primeiro lugar, vamos aplicar o \texttt{outBTree} à estrutura para podermos observar com mais facilidade o valor da raiz e das suas árvores descendentes.
  \item Após esta transformação vamos proceder à rotação:
  \begin{itemize}
    \item Sabemos que se a árvore do lado esquerdo for vazia, não será possível rodar a árvore. Sendo assim, retornamos a própria árvore.
    \item Caso seja possível realizar a rotação, vamos colocar o nodo filho da esquerda como a raiz da árvore transformada, a árvore à esquerda desse filho como a árvore à esquerda da raiz e, finalmente, criar uma árvore do lado direito que tenha como raiz a raiz original da árvore principal, como seu filho à esquerda a árvore à direita da raiz da árvore transformada e como seu filho à direita a árvore correspondente ao filho à direita da raiz original.
  \end{itemize}
  \item Finalmente, aplicamos \texttt{inTree} para a criação da árvore.
\end{itemize}

\newpage

\begin{code}

lrot = inBTree . (id -|- lrotAux) . outBTree

lrotAux :: (a,(BTree a, BTree a)) -> (a,(BTree a, BTree a))
lrotAux (a, (l, Empty)) = (a, (l, Empty))
lrotAux (a, (l, (Node (x1, (t1, t2))))) = (x1, ((Node(a, (l, t1))), t2))

\end{code}

Para a função \texttt{lrot}, o nosso método de pensamento foi o seguinte:

\begin{itemize}
  \item Em primeiro lugar, vamos aplicar o \texttt{outBTree} à estrutura para podermos observar com mais facilidade o valor da raiz e das suas árvores descendentes.
  \item Após esta transformação vamos proceder à rotação:
  \begin{itemize}
    \item Sabemos que se a árvore do lado direito for vazia, não será possível rodar a árvore. Sendo assim, retornamos a própria árvore.
    \item Caso seja possível realizar a rotação, vamos colocar o nodo filho da direita como a raiz da árvore transformada, a árvore à direita desse filho como a árvore à direita da raiz e, finalmente, criar uma árvore do lado esquerdo que tenha como raiz a raiz original da árvore principal, como seu filho à direita a árvore à esquerda da raiz da árvore transformada e como seu filho à esquerda a árvore correspondente ao filho à esquerda da raiz original.
  \end{itemize}
  \item Finalmente, aplicamos \texttt{inTree} para a criação da árvore.
\end{itemize}

%format (expn (a) (n)) = "{" a "}^{" n "}"

\begin{eqnarray*}
\xymatrix@@C=4cm{
    |BTree A|
           \ar[d]_-{|cataNat splay|}
&
    |1 + (A >< (BTree A >< BTree A))|
           \ar[d]^{|id + (id >< (cataNat splay >< cataNat splay))|}
           \ar[l]_-{|inBTree|}
\\
     |(expn (BTreeA) (Bool))|
&
     |1 + (A >< ((expn (BTree A) (Bool)) ><(expn (BTree A) (Bool))))|
           \ar[l]^-{|splay = either fSplay1 fSplay2|}
}
\end{eqnarray*}

\begin{code}
 
splay = flip (cataBTree g)
  where g = either fSplay1 fSplay2

\end{code}

\begin{code}

fSplay1 t l = Empty

fSplay2 (a,(l,r)) [] = Node (a,(l [], r[]))
fSplay2 (a,(l,r)) (h:t) = (p2p (l,r) h) t

\end{code}

\newpage

\subsection*{Problema 3}

\begin{code}

inBdt = either inBdt1 inBdt2
inBdt1 a = Dec a
inBdt2 (s,(t1,t2)) = Query (s,(t1,t2))

\end{code}

\begin{code}

outBdt (Dec a) = i1 a
outBdt (Query (s,(t1,t2))) = i2 (s,(t1,t2))

\end{code}

\begin{code}

baseBdt f g = f -|- (id >< (g >< g))

recBdt g = baseBdt id g

cataBdt g = g . (recBdt (cataBdt g)) . outBdt

\end{code}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Bdt A|
&&
    |A + (String >< (Bdt A >< Bdt A))|
           \ar[ll]_-{|inBdt|}
\\
\\
     |C|
           \ar[uu]^-{|k = [(g)]|}
           \ar[rr]^-{|g|} 
&&
     |A + (String >< (C >< C))|
           \ar[uu]^-{|id + (id >< (k >< k))|}
}
\end{eqnarray*}

\begin{code}

anaBdt g = inBdt . (recBdt (anaBdt g)) . g

\end{code}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Bdt A|
           \ar[d]_-{|cataNat extLTree|}
&
    |A + (String >< (Bdt A >< Bdt A))|
           \ar[d]^{|id + (id >< (cataNat extLTree >< cataNat extLTree))|}
           \ar[l]_-{|inBdt|}
\\
     |LTree A|
&
     |A + (String >< (LTree A >< LTree A))|
           \ar[l]^-{|extLTree|}
           \ar[d]^{|id + p2|}
\\
&
     |A + (LTree A >< LTree A)|
           \ar[ul]^-{|inLTree|}
}
\end{eqnarray*}

\begin{code}

extLTree :: Bdt a -> LTree a
extLTree = cataBdt g where
  g = inLTree . (id -|- p2)

\end{code}

Para a função \texttt{LTree}, o processo foi muito simples. Ignoramos toda a informação contida nos nodos e, de seguida, criamos, através da função \texttt{inLTree}, a \texttt{LTree} pretendida.

\begin{eqnarray*}
\xymatrix@@C=4cm{
    |LTree A|
           \ar[d]_-{|cataNat navLTree|}
&
    |A + (LTree A >< LTree A)|
           \ar[d]^{|id + (cataNat navLTree >< cataNat navLTree)|}
           \ar[l]_-{|inLTree|}
\\
     |(expn (LTree A) (Bool))|
&
     |1 + ((expn (LTree A) (Bool)) ><(expn (LTree A) (Bool)))|
           \ar[l]^-{|navLTree = either (const . Leaf) fNav|}
}
\end{eqnarray*}

\begin{code}

navLTree :: LTree a -> ([Bool] -> LTree a)
navLTree = cataLTree g 
  where g = either (const . Leaf) fNav

fNav (l,r) [] = Fork (l [], r [])
fNav (l,r) (h:t) = (p2p (l,r) h) t

\end{code}


\subsection*{Problema 4}

\begin{eqnarray*}
\xymatrix@@C=4cm{
    |LTree A|
           \ar[d]_-{|cataNat bnavLTree|}
&
    |A + (LTree A >< LTree A)|
           \ar[d]^{|id + (cataNat bnavLTree >< cataNat bnavLTree)|}
           \ar[l]_-{|inLTree|}
\\
     |(expn (LTree A) (BTree Bool))|
&
     |1 + ((expn (LTree A) (BTree Bool)) ><(expn (LTree A) (BTree Bool)))|
           \ar[l]^-{|navLTree = either (const . Leaf) fbNav|}
}
\end{eqnarray*}

\begin{code}

bnavLTree = cataLTree g
  where g = either (const . Leaf) fbNav

fbNav (l,r) Empty = Fork (l Empty, r Empty)
fbNav (l,r) (Node(b,(esq,dir))) = (p2p (l,r) b) (p2p (esq,dir) b)

\end{code}



\begin{code}

pbnavLTree = cataLTree g
  where g = undefined

\end{code}

\subsection*{Problema 5}

\begin{code}

truchet1 = Pictures [ put (0,80) (Arc (-90) 0 40), put (80,0) (Arc 90 180 40) ]

truchet2 = Pictures [ put (0,0) (Arc 0 90 40), put (80,80) (Arc 180 (-90) 40) ]

--- janela para visualizar:

janela = InWindow
             "Truchet"        -- window title
             (800, 800)       -- window size
             (100,100)        -- window position

----- defs auxiliares -------------

put  = uncurry Translate 

-------------------------------------------------
\end{code}

%----------------- Fim do anexo com soluções dos alunos ------------------------%

%----------------- Índice remissivo (exige makeindex) -------------------------%

\printindex

%----------------- Bibliografia (exige bibtex) --------------------------------%

\bibliographystyle{plain}
\bibliography{cp1920t}

%----------------- Fim do documento -------------------------------------------%
\end{document}
