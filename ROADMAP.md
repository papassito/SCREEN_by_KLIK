# SCREEN by KLIK — Roadmap

## 1. Propósito

Este documento define la evolución prevista de **SCREEN by KLIK** desde la definición contractual hasta la certificación final del producto.

El roadmap establece:

- orden de trabajo;
- objetivos de cada fase;
- alcance conceptual;
- criterios de salida;
- relación entre implementación y validación;
- progresión hacia release.

> **El roadmap no constituye evidencia de implementación.**

La existencia de una fase documentada no significa que dicha fase haya sido ejecutada.

---

# 2. Estado general

```text
PROJECT STATUS
ARCHITECTURE / PLANNING

IMPLEMENTATION
NOT IMPLEMENTED

TESTING
NOT EXECUTED

VALIDATION
NOT VALIDATED

CERTIFICATION
NOT CERTIFIED
```

Los estados deberán actualizarse únicamente mediante evidencia verificable.

---

# 3. Principio de progresión

Una fase no deberá considerarse completada únicamente porque:

- exista código;
- compile;
- exista documentación;
- exista una estructura de archivos;
- exista una prueba escrita;
- exista una intención de implementación.

La progresión deberá seguir:

```text
REQUIREMENTS
     ↓
DESIGN
     ↓
IMPLEMENTATION
     ↓
TESTING
     ↓
EVIDENCE
     ↓
VALIDATION
     ↓
DOCUMENTATION
     ↓
CERTIFICATION
     ↓
INTEGRATION
```

---

# 4. Estados de fase

Cada fase podrá utilizar los siguientes estados:

```text
PLANNED
IN PROGRESS
IMPLEMENTED
TESTED
VALIDATED
CERTIFIED
BLOCKED
DEFERRED
DEPRECATED
```

El estado deberá reflejar la realidad comprobable.

No deberá saltarse directamente de:

```text
PLANNED
```

a:

```text
CERTIFIED
```

sin evidencia intermedia.

---

# 5. FASE 00 — CONTRACT

Archivo previsto:

```text
phases/PHASE-00-CONTRACT/README.md
```

## Objetivo

Establecer las reglas de gobierno técnico del proyecto.

## Alcance

Incluye la definición y alineación de:

- README;
- requisitos;
- arquitectura;
- contrato de desarrollo;
- reglas de integridad;
- reglas de no invención;
- criterios generales de calidad;
- trazabilidad;
- reglas de validación;
- reglas de certificación.

## Resultado esperado

SCREEN dispone de una base documental coherente que permita comenzar el desarrollo sin contradicciones fundamentales.

## Criterio de salida

Debe existir coherencia entre:

```text
README
REQUIREMENTS
ARCHITECTURE
CONTRACT
MODULES
COMPONENTS
```

y sus relaciones deben estar suficientemente definidas para iniciar implementación.

## Estado

```text
PLANNED
```

---

# 6. FASE 01 — FOUNDATION

Archivo:

```text
phases/PHASE-01-FOUNDATION.md
```

## Objetivo

Establecer la base ejecutable del producto.

## Alcance conceptual

- entrypoint;
- configuración;
- lifecycle;
- shutdown controlado;
- logging;
- diagnóstico;
- manejo inicial de errores;
- estructura base necesaria.

## Criterio de salida

SCREEN deberá:

- iniciar correctamente;
- mantener un lifecycle controlado;
- finalizar correctamente;
- manejar errores básicos de inicialización;
- liberar recursos bajo las condiciones aplicables.

La estructura física deberá corresponder a la arquitectura realmente aprobada.

## Estado

```text
PLANNED
```

---

# 7. FASE 02 — DISPLAY DETECTION

Archivo:

```text
phases/PHASE-02-DISPLAY-DETECTION.md
```

## Objetivo

Detectar y representar las fuentes de pantalla disponibles en Windows.

## Alcance conceptual

- monitores;
- identificación;
- resolución;
- dimensiones;
- posición;
- características relevantes;
- selección.

## Criterio de salida

SCREEN deberá poder identificar de forma verificable las pantallas disponibles en los escenarios de prueba definidos.

Las capacidades no soportadas deberán detectarse y reportarse explícitamente.

## Estado

```text
PLANNED
```

---

# 8. FASE 03 — CAPTURE ENGINE

Archivo:

```text
phases/PHASE-03-CAPTURE-ENGINE.md
```

## Objetivo

Implementar el motor real de captura de pantalla.

## Alcance conceptual

- captura de monitor;
- captura de pantalla;
- captura estable;
- timestamps;
- lifecycle;
- errores;
- gestión de recursos.

La captura de ventana y región deberá implementarse de acuerdo con los contratos y decisiones técnicas aprobadas.

## Criterio de salida

Debe existir captura real verificable bajo Windows.

La salida deberá permitir demostrar:

- adquisición de frames;
- timestamps válidos;
- estabilidad;
- manejo de errores;
- liberación de recursos.

## Estado

```text
PLANNED
```

---

# 9. FASE 04 — AUDIO

Archivo:

```text
phases/PHASE-04-AUDIO.md
```

## Objetivo

Implementar la captura de audio.

## Alcance conceptual

- audio del sistema;
- micrófono;
- selección de dispositivo;
- timestamps;
- ausencia de dispositivos;
- errores;
- lifecycle.

## Criterio de salida

Debe demostrarse la captura de las fuentes soportadas en los escenarios de prueba correspondientes.

Cuando exista audio y vídeo simultáneamente, deberá existir una estrategia verificable de sincronización.

## Estado

```text
PLANNED
```

---

# 10. FASE 05 — ENCODING

Archivo:

```text
phases/PHASE-05-ENCODING.md
```

## Objetivo

Implementar el subsistema de codificación.

## Alcance conceptual

- entrada de vídeo;
- entrada de audio;
- configuración;
- encoder;
- hardware acceleration;
- software fallback;
- errores;
- lifecycle.

## Decisiones pendientes

Los siguientes elementos deberán determinarse mediante evaluación técnica:

- codec;
- encoder;
- contenedor;
- bibliotecas;
- APIs;
- estrategia de hardware;
- estrategia de fallback.

## Criterio de salida

Los streams soportados deberán poder codificarse correctamente bajo los escenarios validados.

## Estado

```text
PLANNED
```

---

# 11. FASE 06 — RECORDING ENGINE

Archivo:

```text
phases/PHASE-06-RECORDING-ENGINE.md
```

## Objetivo

Integrar los subsistemas principales en una sesión de grabación controlada.

## Alcance conceptual

- Start;
- Pause;
- Resume;
- Stop;
- Cancel;
- lifecycle;
- sincronización;
- errores;
- coordinación de recursos.

## Ciclo conceptual

```text
IDLE
 ↓
STARTING
 ↓
RECORDING
 ↕
PAUSED
 ↓
STOPPING
 ↓
FINALIZING
 ↓
VALIDATING
 ↓
COMPLETED
```

## Criterio de salida

Debe poder realizarse una grabación completa de extremo a extremo bajo un escenario controlado y verificable.

## Estado

```text
PLANNED
```

---

# 12. FASE 07 — CURSOR

Archivo:

```text
phases/PHASE-07-CURSOR.md
```

## Objetivo

Incorporar el comportamiento del cursor de acuerdo con la estrategia técnica aprobada.

## Alcance conceptual

- detección;
- representación;
- visibilidad;
- configuración;
- integración con el procesamiento.

## Criterio de salida

El comportamiento del cursor deberá ser consistente y verificable en los escenarios soportados.

## Estado

```text
PLANNED
```

---

# 13. FASE 08 — CAMERA

Archivo:

```text
phases/PHASE-08-CAMERA.md
```

## Objetivo

Incorporar la cámara como fuente opcional.

## Alcance conceptual

- detección;
- selección;
- captura;
- lifecycle;
- sincronización;
- errores.

## Criterio de salida

La cámara deberá poder incorporarse a una sesión cuando exista hardware compatible y la capacidad haya sido validada.

La ausencia o fallo de la cámara no deberá comprometer innecesariamente la grabación principal.

## Estado

```text
PLANNED
```

---

# 14. FASE 09 — OVERLAYS

Archivo:

```text
phases/PHASE-09-OVERLAYS.md
```

## Objetivo

Incorporar elementos visuales superpuestos cuando la arquitectura de procesamiento lo permita.

## Alcance conceptual

- definición de overlays;
- composición;
- lifecycle;
- configuración;
- impacto sobre rendimiento.

## Criterio de salida

Los overlays implementados deberán integrarse sin comprometer la estabilidad del pipeline principal.

## Estado

```text
PLANNED
```

---

# 15. FASE 10 — ANNOTATIONS

Archivo:

```text
phases/PHASE-10-ANNOTATIONS.md
```

## Objetivo

Incorporar anotaciones durante la captura cuando la arquitectura lo permita.

## Alcance conceptual

- anotaciones;
- composición;
- interacción;
- lifecycle;
- rendimiento.

## Criterio de salida

Las anotaciones soportadas deberán funcionar de forma verificable sin comprometer el núcleo de grabación.

## Estado

```text
PLANNED
```

---

# 16. FASE 11 — HOTKEYS

Archivo:

```text
phases/PHASE-11-HOTKEYS.md
```

## Objetivo

Implementar control mediante teclado.

## Alcance conceptual

- start;
- pause;
- resume;
- stop;
- cancel;
- screenshot;
- configuración;
- conflictos;
- activación;
- desactivación.

## Criterio de salida

Los hotkeys soportados deberán:

- ejecutar la acción correcta;
- respetar el estado de la sesión;
- manejar conflictos;
- no producir transiciones inválidas.

## Estado

```text
PLANNED
```

---

# 17. FASE 12 — UI

Archivo:

```text
phases/PHASE-12-UI.md
```

## Objetivo

Construir la interfaz de usuario funcional.

## Alcance conceptual

- selección de fuente;
- configuración;
- audio;
- salida;
- controles de sesión;
- estado;
- errores;
- interacción con hotkeys;
- notificaciones.

## Regla

La UI deberá consumir contratos de aplicación y no acceder directamente a implementaciones internas de:

- captura;
- audio;
- procesamiento;
- encoding;
- almacenamiento.

## Criterio de salida

El usuario deberá poder controlar las funciones soportadas mediante una interfaz coherente y verificable.

## Estado

```text
PLANNED
```

---

# 18. FASE 13 — OUTPUT

Archivo:

```text
phases/PHASE-13-OUTPUT.md
```

## Objetivo

Completar el proceso de generación, finalización y validación del archivo de salida.

## Alcance conceptual

- archivos temporales;
- finalización;
- muxing cuando corresponda;
- naming;
- almacenamiento;
- validación;
- detección de corrupción;
- prevención de sobrescritura.

## Flujo conceptual

```text
TEMPORARY OUTPUT
       ↓
FINALIZATION
       ↓
VALIDATION
       ↓
FINAL OUTPUT
```

## Criterio de salida

Una sesión completada correctamente deberá producir un archivo final válido y verificable.

No deberá declararse éxito si la salida no puede validarse.

## Estado

```text
PLANNED
```

---

# 19. FASE 14 — SETTINGS

Archivo:

```text
phases/PHASE-14-SETTINGS.md
```

## Objetivo

Implementar la configuración persistente del producto.

## Alcance conceptual

- preferencias;
- configuración de vídeo;
- configuración de audio;
- salida;
- hotkeys;
- opciones de comportamiento;
- validación;
- recuperación de configuración.

## Criterio de salida

La configuración soportada deberá persistirse y recuperarse correctamente sin introducir configuraciones inválidas.

## Estado

```text
PLANNED
```

---

# 20. FASE 15 — PERFORMANCE

Archivo:

```text
phases/PHASE-15-PERFORMANCE.md
```

## Objetivo

Medir y optimizar el rendimiento utilizando evidencia real.

## Métricas

Deberán evaluarse, según corresponda:

- CPU;
- GPU;
- memoria;
- FPS;
- dropped frames;
- latencia;
- throughput;
- buffers;
- almacenamiento;
- tamaño de archivo.

## Principio

> **No optimizar por intuición cuando pueda medirse.**

Las optimizaciones deberán estar justificadas por mediciones reproducibles.

## Criterio de salida

Debe existir evidencia de comportamiento estable bajo los escenarios de rendimiento definidos.

## Estado

```text
PLANNED
```

---

# 21. FASE 16 — INTEGRATION TESTING

Archivo:

```text
phases/PHASE-16-INTEGRATION-TESTING.md
```

## Objetivo

Validar la interacción entre los principales subsistemas.

## Alcance

- capture;
- audio;
- camera;
- processing;
- synchronization;
- encoding;
- output;
- UI;
- configuration;
- recovery.

## Escenarios

Deberán contemplarse, según corresponda:

- grabación completa;
- pausa;
- reanudación;
- cancelación;
- múltiples monitores;
- audio;
- cámara;
- errores;
- almacenamiento;
- sesiones prolongadas.

## Criterio de salida

Las integraciones críticas deberán contar con pruebas y evidencia reproducible.

## Estado

```text
PLANNED
```

---

# 22. FASE 17 — RELIABILITY

Archivo:

```text
phases/PHASE-17-RELIABILITY.md
```

## Objetivo

Validar estabilidad, recuperación y comportamiento ante condiciones anormales.

## Alcance

- fallos de captura;
- fallos de audio;
- fallos del encoder;
- falta de almacenamiento;
- interrupción del proceso;
- cancelación;
- shutdown;
- recuperación;
- limpieza de temporales;
- sesiones prolongadas.

## Criterio de salida

SCREEN deberá demostrar un comportamiento controlado ante los escenarios críticos definidos.

No deberá declararse recuperación exitosa cuando el resultado no pueda verificarse.

## Estado

```text
PLANNED
```

---

# 23. FASE 18 — PACKAGING

Archivo:

```text
phases/PHASE-18-PACKAGING.md
```

## Objetivo

Preparar los artefactos distribuibles del producto.

## Alcance conceptual

- build;
- artefactos;
- instalación;
- configuración;
- versionado;
- integridad;
- documentación;
- distribución.

Los mecanismos concretos de instalación, firma y distribución deberán determinarse antes de su implementación.

## Criterio de salida

Debe existir un artefacto de distribución reproducible, verificable y coherente con la versión declarada.

## Estado

```text
PLANNED
```

---

# 24. FASE 19 — RELEASE CANDIDATE

Archivo:

```text
phases/PHASE-19-RELEASE-CANDIDATE.md
```

## Objetivo

Preparar una versión candidata para evaluación final.

## Alcance

- build final candidato;
- pruebas de regresión;
- compatibilidad;
- rendimiento;
- seguridad;
- privacidad;
- instalación;
- desinstalación;
- documentación;
- integridad del artefacto.

## Criterio de salida

Debe existir un Release Candidate cuya funcionalidad y documentación puedan ser auditadas mediante evidencia.

## Estado

```text
PLANNED
```

---

# 25. FASE 20 — FINAL CERTIFICATION

Archivo:

```text
phases/PHASE-20-FINAL-CERTIFICATION.md
```

## Objetivo

Determinar si SCREEN cumple los criterios necesarios para certificación.

## La certificación deberá verificar

- requisitos críticos;
- arquitectura;
- implementación;
- pruebas;
- integración;
- compatibilidad;
- rendimiento;
- seguridad;
- privacidad;
- recuperación;
- integridad de archivos;
- instalación;
- documentación;
- trazabilidad.

## Cadena de certificación

```text
REQUIREMENT
     ↓
IMPLEMENTATION
     ↓
TEST
     ↓
EVIDENCE
     ↓
VALIDATION
     ↓
CERTIFICATION

Una vez que una fase se considera completada y certificada, el criterio de cierre finaliza con la creación de un **checkpoint (backup)**. Este punto de control sella el estado validado y sirve como línea base segura antes de iniciar la siguiente fase.
```

## Criterio de salida

SCREEN solamente podrá declararse certificado cuando exista evidencia suficiente y reproducible que respalde los criterios de certificación definidos.

## Estado

```text
NOT REACHED
```

---

# 26. Release final

Después de completar la certificación, SCREEN podrá avanzar al proceso formal de release.

## Criterios mínimos

La versión candidata deberá demostrar:

- captura real;
- selección de fuente;
- lifecycle completo;
- audio cuando esté habilitado;
- sincronización;
- encoding;
- output;
- integridad del archivo;
- manejo de errores;
- recuperación aplicable;
- estabilidad;
- pruebas críticas;
- instalación;
- documentación coherente.

La existencia de una función no implica automáticamente que forme parte de la versión certificada.

---

# 27. Dependencias entre fases

Las fases no deberán considerarse completamente independientes cuando exista una dependencia técnica real.

Flujo conceptual:

```text
PHASE 00
   ↓
PHASE 01
   ↓
PHASE 02
   ↓
PHASE 03
   ↓
PHASE 04
   ↓
PHASE 05
   ↓
PHASE 06
   ↓
PHASE 07 ──┐
PHASE 08 ──┤
PHASE 09 ──┤
PHASE 10 ──┤
PHASE 11 ──┤
PHASE 12 ──┤
PHASE 13 ──┤
PHASE 14 ──┘
      ↓
PHASE 15
      ↓
PHASE 16
      ↓
PHASE 17
      ↓
PHASE 18
      ↓
PHASE 19
      ↓
PHASE 20
```

Este diagrama representa el flujo de gobierno general y no significa que todas las fases deban ejecutarse estrictamente de manera lineal.

Cuando una fase dependa de otra, dicha dependencia deberá documentarse.

---

# 28. Desarrollo paralelo controlado

Algunas fases podrán desarrollarse en paralelo cuando:

- sus contratos estén definidos;
- no exista dependencia bloqueante;
- sus pruebas puedan aislarse;
- sus recursos estén claramente definidos;
- no se comprometa la integridad arquitectónica.

Ejemplos potenciales:

```text
CURSOR
CAMERA
OVERLAYS
ANNOTATIONS
HOTKEYS
UI
SETTINGS
```

La posibilidad de trabajo paralelo no elimina la necesidad de validación.

---

# 29. Criterio general de cierre de fase

Una fase deberá considerarse completada únicamente cuando:

```text
IMPLEMENTATION
      +
TESTING
      +
EVIDENCE
      +
VALIDATION
      +
DOCUMENTATION
```

sean coherentes con:

```text
REQUIREMENTS
ARCHITECTURE
CONTRACT
```

Cuando aplique certificación de fase:

```text
IMPLEMENTATION
      ↓
TESTING
      ↓
EVIDENCE
      ↓
VALIDATION
      ↓
CERTIFICATION
```

---

# 30. Fases bloqueadas

Una fase deberá marcarse:

```text
BLOCKED
```

cuando exista un impedimento real, por ejemplo:

- requisito ambiguo;
- decisión arquitectónica pendiente;
- dependencia no evaluada;
- API no disponible;
- hardware requerido no disponible;
- prueba imposible de ejecutar;
- contradicción documental;
- fallo crítico sin resolver.

Un bloqueo no deberá ocultarse modificando artificialmente el estado de la fase.

---

# 31. Trazabilidad

Cada fase deberá poder relacionarse con:

```text
REQUISITOS
   ↓
ARQUITECTURA
   ↓
MÓDULOS
   ↓
COMPONENTES
   ↓
ESPECIFICACIONES TÉCNICAS
   ↓
FASE
   ↓
IMPLEMENTACIÓN
   ↓
PRUEBAS
   ↓
EVIDENCIA
   ↓
VALIDACIÓN
```

La trazabilidad deberá mantenerse durante todo el ciclo de vida.

---

# 32. Regla de evidencia

No se aceptará como evidencia:

- código que no fue ejecutado;
- tests que no fueron ejecutados;
- resultados inventados;
- métricas estimadas como si fueran medidas;
- compatibilidad asumida;
- hardware supuesto;
- capturas no verificadas;
- archivos generados sin validación;
- documentación que contradiga la implementación.

La evidencia deberá ser:

- real;
- reproducible;
- identificable;
- relacionada con el requisito;
- suficiente para la conclusión obtenida.

---

# 33. Regla de no certificación prematura

No deberá utilizarse lenguaje como:

```text
CERTIFIED
STABLE
PRODUCTION READY
FULLY COMPATIBLE
PRODUCTION READY
```

mientras no exista evidencia suficiente para respaldarlo.

El estado documental deberá mantenerse separado del estado real del software.

---

# 34. Inventario de fases

| Fase | Nombre | Estado |
|---|---|---|
| 00 | CONTRACT | PLANNED |
| 01 | FOUNDATION | PLANNED |
| 02 | DISPLAY DETECTION | PLANNED |
| 03 | CAPTURE ENGINE | PLANNED |
| 04 | AUDIO | PLANNED |
| 05 | ENCODING | PLANNED |
| 06 | RECORDING ENGINE | PLANNED |
| 07 | CURSOR | PLANNED |
| 08 | CAMERA | PLANNED |
| 09 | OVERLAYS | PLANNED |
| 10 | ANNOTATIONS | PLANNED |
| 11 | HOTKEYS | PLANNED |
| 12 | UI | PLANNED |
| 13 | OUTPUT | PLANNED |
| 14 | SETTINGS | PLANNED |
| 15 | PERFORMANCE | PLANNED |
| 16 | INTEGRATION TESTING | PLANNED |
| 17 | RELIABILITY | PLANNED |
| 18 | PACKAGING | PLANNED |
| 19 | RELEASE CANDIDATE | PLANNED |
| 20 | FINAL CERTIFICATION | NOT REACHED |

---

# 35. Regla suprema del roadmap

> **Una fase no está terminada porque exista. Está terminada cuando existe evidencia de que cumple su propósito.**

El roadmap guía el desarrollo.

Los requisitos determinan qué debe hacer SCREEN.

La arquitectura determina cómo debe organizarse.

Los contratos protegen la integridad del desarrollo.

Las pruebas generan evidencia.

La validación determina cumplimiento.

La certificación determina si existe evidencia suficiente para declarar el producto apto para el estado correspondiente.

> **No avanzar por apariencia de progreso. Avanzar por evidencia.**