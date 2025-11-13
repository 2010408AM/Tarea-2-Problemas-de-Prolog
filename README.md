# Tarea 2: Problemas de Prolog  
**Realizado por Alejandra Mármol — Carnet: 20-10408**

## Descripción
Este repositorio contiene la solución a los problemas de la **Tarea 2** del curso **CI3661 (Lenguajes de Programación)**, trimestre Sep.–Dic. 2025.

Se modelan relaciones académicas mediante programación lógica en Prolog, aplicando conceptos fundamentales como:
- **Recursión** (para cadenas de prelaciones indirectas),
- **Unificación** (para vincular entidades: profesores, estudiantes, materias),
- **Negación como fallo** (para detectar materias en curso sin nota registrada).

## Estructura del repositorio
Los archivos entregados son:

- **`prelaciones.pl`**:  
  Modela el árbol de prelaciones del pensum. Define las relaciones directas (`prela/2`) e implementa:
  - `prelacion_directa/2`: verifica dependencia inmediata.
  - `prelacion_total/2`: verifica dependencia directa o indirecta (mediante recursión acíclica).

- **`academico.pl`**:  
  Base de datos académica con hechos sobre profesores, estudiantes y notas. Implementa:
  - `profesor_de/2`, `aprobado/2`, `aplazado/1`, `cursando_sin_nota/2`.
  - Uso de `\+` (negación como fallo) en `cursando_sin_nota/2`.

- **`test.pl`** *(archivo opcional de verificación)*:  
  Script que ejecuta todas las consultas del enunciado y confirma su correcto funcionamiento.  
  (Ver sección **Ejecución de pruebas** abajo)

## Ejecución de pruebas
Para verificar automáticamente la solución:

```bash
swipl -s test.pl
```
