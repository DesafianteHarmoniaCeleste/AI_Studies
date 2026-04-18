Uma Base de Dados (BD) pode ser representada em Prolog como um conjunto de fatos. A partir desses
fatos pode ser obtida informações e por meio de relações conhecimento ser representado e manipulado.
Por exemplo, uma BD sobre alunos pode ser representada tal que cada aluno é descrito por uma cláusula.
Considerar que cada aluno tem os seguintes componentes: nome, endereço, telefone, data de nascimento,
t1, p1, t2, p2, sub, rec, freq. Por exemplo:

aluno(“Carlos Silva”, “Rua das Orquideas, 32”, “016966666666”, “05/05/1955”,
t1,p1,t2,p2,sub,rec,freq).

I. Desenvolva programas que informem:

A. a média de prova de um aluno, tendo a p1 peso 2 e a p2 peso 3 e considerando
a possibilidade da sub.

media_prova(Nome, Media) :-
    aluno(Nome, _, _, _, _, P1, _, P2, Sub, _, _),

    % trata substitutiva
    (
        Sub >= P1, P1 =< P2 -> P1n = Sub, P2n = P2 ;
        Sub >= P2, P2 < P1  -> P2n = Sub, P1n = P1 ;
        P1n = P1, P2n = P2
    ),

    Media is (P1n*2 + P2n*3) / 5.

B. a média de trabalho de um aluno, tendo o t1 peso 1 e o t2 peso 3.

media_trabalho(Nome, Media) :-
    aluno(Nome, _, _, _, T1, _, T2, _, _, _, _),
    Media is (T1 + 3*T2) / 4.

C. a média final de um aluno, considerando a situação antes da rec.

media_final(Nome, MediaFinal) :-
    media_prova(Nome, MP),
    media_trabalho(Nome, MT),
    MediaFinal is (MP + MT) / 2.

D. se o aluno foi aprovado ou reprovado, considerando a situação antes da rec.

situacao(Nome, aprovado) :-
    media_final(Nome, MF),
    aluno(Nome, _, _, _, _, _, _, _, _, _, Freq),
    MF >= 5,
    Freq >= 75.

situacao(Nome, reprovado) :-
    media_final(Nome, MF),
    aluno(Nome, _, _, _, _, _, _, _, _, _, Freq),
    (MF < 5 ; Freq < 75).

II. Mostre as interrogações (e os resultados) para determinar:

A. Quem tirou 10 na p1 e na p2?

?- aluno(Nome, _, _, _, _, 10, _, 10, _, _, _).

B. Quem tirou 10 no t1 e no t2?

?- aluno(Nome, _, _, _, 10, _, 10, _, _, _, _).

C. Quem ficou com nota abaixo da média (abaixo de 5), nas duas provas? (p1<5 e
p2<5).

?- aluno(Nome, _, _, _, _, P1, _, P2, _, _, _),
   P1 < 5,
   P2 < 5.

D. Quem ficou com presença abaixo de 70%?

?- aluno(Nome, _, _, _, _, _, _, _, _, _, Freq),
   Freq < 70.
   
E. Quais foram os alunos reprovados?

?- situacao(Nome, reprovado).

F. Quais foram os alunos aprovados?

?- situacao(Nome, aprovado).

III. Indique as alterações necessárias na estrutura aluno para que seja possível fazer as
seguintes interrogações:
A. Quais são as informações dos alunos cujo primeiro nome é X?
B. Quais são as informações dos alunos cujo sobrenome é X?
C. Quem são os alunos nascidos no ano X?
D. Quem são os alunos cujo CEP é X?
E. Qual o número da casa do aluno X?

% Para melhor visualizar os dados, devemos estruturar os dados, pois todos estao com formato string, vamos separar o nome em primeiro nome e segundo nome,
% separar a data em dia mes e ano, separar o endereço em rua, numero e cep. 
% considerando essa mudança temos:

aluno(
    nome(Primeiro_nome, Sobrenome),
    endereco(Rua, Numero, CEP),
    Telefone,
    data(Dia, Mes, Ano),
    T1, P1, T2, P2, Sub, Rec, Freq
).
