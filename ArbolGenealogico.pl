% Autor: David Cabezas Berrido
% DNI: 20079906 D
% Fecha: 12/01/2017

/* Hombres */
hombre(adan).
hombre(cain).
hombre(abel).
hombre(boris).
hombre(dmitri).
hombre(vladimir).
hombre(amadeo).
hombre(toro_sentado).
hombre(stephanopoulos).
hombre(donatello).
hombre(rafael).
hombre(miguel_angel).
hombre(leonardo).
hombre(li).
hombre(federico).
hombre(papa).

/* Mujeres */
mujer(eva).
mujer(perica).
mujer(bonifacia).
mujer(calista).
mujer(celina).
mujer(elicia).
mujer(demetria).
mujer(gracia).
mujer(gregoria).
mujer(hilaria).
mujer(maxima).
mujer(teodosia).
mujer(simplicia).
mujer(mama).

/* Progenitores.
   A la derecha de cada pareja, he incluido un número que indica los años que se
   lleva la persona con su hijo/a, cuando no usemos este dato, colocaremos en dicha
   posición la variable anónima "_" */

/* Padres */
progenitor(adan,cain,24).
progenitor(adan,abel,26).
progenitor(cain,li,31).
progenitor(cain,boris,28).
progenitor(cain,bonifacia,22).
progenitor(li,amadeo,29).
progenitor(li,celina,32).
progenitor(boris,demetria,41).
progenitor(dmitri,vladimir,38).
progenitor(toro_sentado,stephanopoulos,27).
progenitor(toro_sentado,gregoria,19).
progenitor(amadeo,miguel_angel,30).
progenitor(amadeo,teodosia,20).
progenitor(amadeo,maxima,34).
progenitor(rafael,donatello,46).
progenitor(leonardo,federico,21).
progenitor(federico,mama,23).
progenitor(papa,yo,27).

/* Madres */
progenitor(eva,cain,24).
progenitor(eva,abel,26).
progenitor(perica,li,33).
progenitor(perica,boris,30).
progenitor(perica,bonifacia,24).
progenitor(calista,amadeo,30).
progenitor(calista,celina,33).
progenitor(elicia,demetria,29).
progenitor(bonifacia,vladimir,41).
progenitor(hilaria,miguel_angel,29).
progenitor(hilaria,maxima,33).
progenitor(hilaria,teodosia,19).
progenitor(demetria,gregoria,21).
progenitor(demetria,stephanopoulos,29).
progenitor(gregoria,federico,23).
progenitor(teodosia,donatello,24).
progenitor(simplicia,mama,31).
progenitor(mama,yo,26).

/* Funciones */
padre(X,Y):- progenitor(X,Y,_),hombre(X).       % Verdadero si X es padre de Y

madre(X,Y):- progenitor(X,Y,_),mujer(X).        % Verdadero si X es madre de Y

hermanos(X,Y):- progenitor(Z,X,_),progenitor(Z,Y,_).  % Verdadero si X e y son hermanos/as

tio(X,Y):- hermanos(X,Z),progenitor(Z,Y,_).     % Verdadero si X es tío/a de Y

sobrino(X,Y):- tio(Y,X).        % Verdadero si X es sobrino de Y

abuelo(X,Y):- progenitor(X,Z,_), progenitor(Z,Y,_).   % Verdadero si X es abuelo/a de Y

nieto(X,Y):- abuelo(Y,X).    % Verdadero si X es nieto de Y

antepasado(X,Y):- progenitor(X,Y,_).                    % Verdadero si X es progenitor de Y
antepasado(X,Y):- progenitor(X,Z,_),antepasado(Z,Y).    % O progenitor de algún Z antepasado de Y

descendiente(X,Y):- antepasado(Y,X).         % Verdadero si X es descendiente de Y

antepasadoComun(X,Y):- antepasado(Z,X),antepasado(Z,Y).  % Verdadero si X e y tienen algún antepasado común

antepasadoComun(X,Y,Z):- antepasado(Z,X),antepasado(Z,Y). % Verdadero si Z es antepasado de X y de Y

/* Devuelve la diferencia de años entre un antepasado y un descendiente,
   para llamar a la función, hay que introducir la variable en la que queramos
   que se almacene el resultado. */
diferenciaAnios(X,Y,A):- progenitor(X,Y,A).
diferenciaAnios(X,Y,A):- progenitor(X,Z,A1), diferenciaAnios(Z,Y,A2), A is A1+A2.

/* Ahora para que también funciones introduciendo primero el descendiente. */
diferenciaAnios(X,Y,A):- progenitor(Y,X,A).
diferenciaAnios(X,Y,A):- progenitor(Y,Z,A1), diferenciaAnios(X,Z,A2), A is A1+A2.