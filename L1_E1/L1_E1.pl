% Facts
temVarinha(hermione).
temVarinha(harry).
temVassoura(harry).
% Rules
jogadorQuadribol(X) :- temVassoura(X).
bruxo(X) :- temVassoura(X), temVarinha(X).
% Query
a) bruxo(ron).
b) bruxo(hermione).
c) bruxo(harry).
d) bruxo(Y).

a) false
b) false
c) true
d) Y=harry
