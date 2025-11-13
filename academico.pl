% ===================================================================
% Tarea de Prolog: 2 Base de Datos Académica
% Autor: Alejandra Mármol
% Carnet: 20-10408
% ===================================================================

% Datos de profesores y materias impartidas
dicta(leonardo, ci3661). 
dicta(maria, ci3725).   
dicta(pedro, ci2691).     

% Registro de inscripciones de estudiantes
cursa(ana, ci3661).       
cursa(ana, ci3725).     
cursa(juan, ci3661).     
cursa(elena, ci2691).     
cursa(elena, ci3725).     

% Notas registradas de los estudiantes
nota(ana, ci3661, 88).    % Buen rendimiento
nota(ana, ci3725, 70).    % Aprobado satisfactorio
nota(juan, ci3661, 40).   % Reprobado
nota(elena, ci2691, 51).  % Aprobado en raya
% Elena cursa ci3725 actualmente (sin nota aún)

% Consultas académicas:
% Relación profesor-estudiante por materias cursadas
profesor_de(Prof, Est) :-
    dicta(Prof, Materia),
    cursa(Est, Materia).

% Verifica aprobación con nota mínima de 50
% (Requiere que el estudiante haya cursado la materia)
aprobado(Est, Mat) :-
    cursa(Est, Mat),       % Verifica inscripción
    nota(Est, Mat, N),     % Obtiene calificación
    N >= 50.               % Evalúa aprobación

% Identifica estudiantes con al menos un curso reprobado
aplazado(Est) :-
    nota(Est, _, N),       % Busca cualquier nota
    N < 50.                % Nota reprobatoria


% Detecta materias en curso sin calificación final
cursando_sin_nota(Est, Mat) :-
    cursa(Est, Mat),       % Materia en curso
    \+ nota(Est, Mat, _).  % Sin registro de nota