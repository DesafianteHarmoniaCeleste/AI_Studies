% Segundo a tabela a seguir, o par (Origem, Destino) de cidades que possuem o campo da relação
% marcados com um X possuem ônibus direto de uma para a outra. Por exemplo: Há ônibus direto de
% Araraquara para São Carlos, mas não há ônibus direto de Araraquara para Barretos e nem ônibus direto de
% volta de São Carlos para Araraquara.

% a)Considere as estruturas de dados que você aprendeu no decorrer do curso de
% graduação. Qual você utilizaria para resolver esse problema? Explique e dê pelo menos um
% exemplo de como isso seria possível.

Daria para usar grafos, com os nos da raiz sendo as cidades que o onibus ta chegando, onde o vertice é dado valor infinito caso ja tenha passado ( nao ir e voltar ) 
assim fazer uma busca de tentativa e erro ( exaustiva ) até encontrar um possivel caminho. Dessa forma podemos definir o caminho que passa por menos cidades e/ou o menos custoso 

% b) Construa uma base de conhecimento no Prolog que represente a Tabela 1 acima.

% caminho( Saida, Chegada )
caminho( araraquara, ribeirao_preto ).
caminho( bauru, marilia ).
caminho( bauru, sao_carlos ).
caminho( botucatu, bauru ).
caminho( franca, barretos ).
caminho( ribeirao_preto, franca ).
caminho( sao_carlos, araraquara ).
caminho( sorocaba, botucatu ).



% c) A base de conhecimento gerada no exercício a) possui fatos sobre cidades que
% possuem ônibus direto entre elas. Fazendo conexões é possível viajar entre duas cidades
% distantes. Por exemplo: De Barretos até Araraquara uma rota possível seria [Barretos ->Franca -> Ribeirão Preto -> Araraquara]. Faça um programa em Prolog capaz de dizer se
% existe uma rota entre duas cidades. Exemplo: ao ser questionado viagemEntre(barretos,
% araraquara) seu programa deve retornar yes.

viagemEntre(X, Y) :-
    direto(X, Y).

viagemEntre(X, Y) :-
    direto(X, Z),
    viagemEntre(Z, Y).

% d) Agora considere que a empresa de ônibus decidiu oferecer não apenas a ida como
% viagem direta, mas também a volta. Por exemplo: São Carlos para Araraquara passa a ser
% possível porque Araraquara para São Carlos é uma viagem direta já oferecida pela empresa.
% Modifique apenas as regras de seu programa, de modo que, também reponda yes para a
% viagem de volta. Por exemplo: O programa deve retornar yes tanto para
% viagemEntre(araraquara, barretos) quanto para viagemEntre(barretos, araraquara). Você
% precisa utilizar o corte (!)? Se positivo, explique o motivo.
