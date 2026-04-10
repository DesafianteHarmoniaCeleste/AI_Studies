%Explique o que o seguinte programa faz, em seguida adicione cortes verdes para melhorá-lo

classe(Numero, positivo) :- Numero > 0.
classe(0, zero).
classe(Numero, negativo) :- Numero < 0.

% O codigo acima diz se um dado numero é positivo, negativo ou zero

% adicionando cortes 

classe(Numero, positivo) :- Numero > 0, !.

classe(0, zero) :- !.

classe(Numero, negativo) :- Numero < 0.
