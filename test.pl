% test.pl:
% prueba prelaciones.pl y academico.pl de la tarea de prolog

:- [prelaciones].
:- [academico].

% Pruebas: (etiqueta, consulta, resultado_esperado)
prueba([
    % Prelaciones
    ('prelacion_total(ci2525, ci3661)', prelacion_total(ci2525, ci3661), true),
    ('prelacion_total(ma1111, ci3825)', prelacion_total(ma1111, ci3825), true),
    ('prelacion_total(ci3661, ci3725)', prelacion_total(ci3661, ci3725), false),
    % Académico
    ('cursando_sin_nota(elena, ci3725)', cursando_sin_nota(elena, ci3725), true),
    ('cursando_sin_nota(ana, ci3661)', cursando_sin_nota(ana, ci3661), false)
]).

% Ejecuta todas las pruebas
:- writeln('Ejecutando las pruebas...'),
   prueba(Pruebas),
   forall(
       member((Desc, Cons, Esp), Pruebas),
       (   (Cons, !, Result = true ; Result = false),
           (   Result = Esp
           ->  format('~s~n', [Desc])
           ;   format('Falla: ~s~n   Esperado: ~w~n   Obtenido: ~w~n',
                       [Desc, Esp, Result]),
               halt(1)
           )
       )
   ),
   writeln('Todas las pruebas pasaron sin problemas.').