% ===================================================================
% Tarea de Prolog: El Árbol de Prelaciones
% Autor: Alejandra Mármol
% Carnet: 20-10408
% ===================================================================

% Para cursar Materia, se requiere haber aprobado Prelacion

prela(ci2691, ci3661).  % ci2691 es requisito para ci3661
prela(ci2525, ci2691).
prela(ci2691, ci3641). 
prela(ci3641, ci3725). 
prela(ci3725, ci3825). 
prela(ma1111, ci2525). 

% Verdadero si A es una prelación directa de B. (Se aprueba A para poder cursar B)
prelacion_directa(A, B) :- prela(A, B).

% Verdadero si A es una prelación (directa o indirecta) de B.
% Se define recursivamente
prelacion_total(A, B) :- prelacion_total(A, B, []).

prelacion_total(A, B, _) :-
   prela(A, B).

prelacion_total(A, B, Visitados) :-
   prela(A, X),
   \+ member(X, Visitados),  % Evita ciclos
   prelacion_total(X, B, [A|Visitados]).