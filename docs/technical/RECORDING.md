# RECORDING.md

# SCREEN by KLIK — Recording

**Ruta:** `docs/technical/RECORDING.md`
**Versión documental:** `0.1.0-alpha`
**Estado:** `PLANNED`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADO`
**Certificación:** `NO CERTIFICADO`

---

## 1. Propósito

`RECORDING` define el ciclo de vida técnico de una grabación.

Es el subsistema que coordina conceptualmente:

* inicio;
* preparación;
* captura;
* procesamiento;
* encoding;
* pausa;
* reanudación;
* detención;
* finalización;
* cancelación;
* recuperación;
* resultado.

No sustituye las responsabilidades especializadas de `CAPTURE`, `AUDIO`, `CAMERA`, `ENCODING` u `OUTPUT`.

---

## 2. Principio

La grabación debe considerarse un **proceso con estado**, no simplemente una función `start/stop`.

```text
USER INTENT
    ↓
RECORDING STATE MACHINE
    ↓
CAPTURE + AUDIO + CAMERA
    ↓
PROCESSING
    ↓
ENCODING
    ↓
OUTPUT
    ↓
RESULT
```

---

## 3. Estados

El flujo conceptual es:

```text
IDLE
 ↓
STARTING
 ↓
RECORDING
 ↓
PAUSED
 ↓
RECORDING
 ↓
STOPPING
 ↓
FINALIZING
 ↓
COMPLETED
```

Estados alternativos:

```text
STARTING → FAILED
RECORDING → FAILED
RECORDING → CANCELLED
STOPPING → FAILED
FINALIZING → PARTIAL
FINALIZING → FAILED
```

La máquina de estados definitiva deberá validarse durante implementación.

---

## 4. IDLE

No existe una grabación activa.

El sistema puede:

* aceptar configuración;
* preparar recursos;
* validar disponibilidad.

No debe existir un pipeline de captura activo salvo que una futura especificación lo autorice.

---

## 5. STARTING

Durante `STARTING` deberán validarse y preparar:

* fuente;
* región;
* audio;
* micrófono;
* cámara;
* encoder;
* salida;
* permisos;
* recursos.

Si una dependencia obligatoria no puede inicializarse, el estado deberá reflejar el fallo.

---

## 6. RECORDING

Durante `RECORDING` deberán mantenerse:

* adquisición;
* timestamps;
* sincronización;
* procesamiento;
* encoding;
* escritura.

La sesión deberá mantener límites de recursos.

---

## 7. PAUSED

Una pausa deberá ser una transición explícita.

Debe preservarse la coherencia temporal.

Las decisiones sobre si:

* se detienen dispositivos;
* se mantienen abiertos;
* se liberan recursos;
* se insertan discontinuidades;

permanecen `TBD`.

---

## 8. STOPPING

`STOPPING` significa que no deben aceptarse nuevas entradas normales de captura.

Debe iniciarse el cierre ordenado del pipeline.

---

## 9. FINALIZING

Durante `FINALIZING`:

```text
STOP INPUT
   ↓
DRAIN / FLUSH
   ↓
ENCODER FINALIZATION
   ↓
OUTPUT FINALIZATION
   ↓
VALIDATION
```

La política exacta depende de los contratos de los subsistemas.

---

## 10. COMPLETED

Solo deberá alcanzarse `COMPLETED` cuando el resultado cumpla los criterios de finalización establecidos.

No significa simplemente:

* el usuario pulsó Stop;
* el encoder dejó de recibir datos;
* existe un archivo.

Debe existir evidencia de resultado válido.

---

## 11. CANCELLED

Una cancelación deberá diferenciarse de:

* fallo;
* detención normal.

Deberá determinarse el tratamiento de los datos ya capturados.

---

## 12. FAILED

Un fallo deberá incluir contexto suficiente para diagnóstico sin exponer información sensible.

El sistema deberá determinar:

* etapa;
* causa;
* recursos afectados;
* si existe resultado parcial;
* si puede recuperarse.

---

## 13. Recovery

La recuperación dependerá del punto exacto del fallo.

```text
CAPTURE FAILURE
AUDIO FAILURE
CAMERA FAILURE
ENCODING FAILURE
OUTPUT FAILURE
STORAGE FAILURE
APPLICATION FAILURE
```

No todas las fallas deben recuperarse de la misma manera.

---

## 14. Concurrencia

Una grabación puede tener operaciones concurrentes relacionadas con:

* captura;
* audio;
* cámara;
* encoding;
* escritura;
* UI;
* hotkeys;
* diagnóstico.

Las transiciones de estado deberán permanecer consistentes.

---

## 15. Cancelación segura

Una cancelación no deberá:

* dejar recursos abiertos;
* dejar procesos indefinidos;
* presentar resultados falsos;
* producir crecimiento infinito de buffers.

---

## 16. Recursos

La sesión deberá controlar:

* CPU;
* GPU;
* memoria;
* buffers;
* dispositivos;
* archivos;
* threads/tasks;
* handles;
* temporales.

Todo recurso adquirido deberá tener una ruta de liberación.

---

## 17. Errores

Los errores deberán distinguir:

* configuración;
* permisos;
* captura;
* audio;
* cámara;
* encoding;
* almacenamiento;
* recursos;
* plataforma;
* cancelación;
* timeout;
* finalización.

---

## 18. Integridad temporal

La grabación deberá preservar, en la medida permitida por el diseño:

* orden temporal;
* timestamps;
* sincronización;
* duración;
* continuidad.

Los datos perdidos deberán reflejarse como pérdida real, no ser reemplazados por datos inventados.

---

## 19. Seguridad

La máquina de estados deberá impedir transiciones no autorizadas.

Conceptualmente:

```text
VALID STATE
     ↓
VALID TRANSITION
     ↓
AUTHORIZED OPERATION
```

La interfaz no deberá ser la única barrera.

---

## 20. Privacidad

El lifecycle deberá respetar:

* autorización de captura;
* autorización de audio;
* autorización de cámara;
* almacenamiento;
* eliminación;
* estado visible al usuario.

---

## 21. Pruebas

Deberán probarse:

* cada transición;
* transición inválida;
* start;
* stop;
* pause;
* resume;
* cancel;
* fallo durante start;
* fallo durante recording;
* fallo durante encoding;
* fallo durante output;
* recuperación;
* sesión prolongada;
* cierre inesperado.

---

## 22. Evidencia

Cada estado crítico deberá poder demostrarse mediante:

* logs;
* métricas;
* eventos;
* resultados;
* archivos;
* pruebas reproducibles.

---

## 23. Gaps

| ID          | Gap                   |
| ----------- | --------------------- |
| GAP-REC-001 | State machine final   |
| GAP-REC-002 | Start contract        |
| GAP-REC-003 | Pause semantics       |
| GAP-REC-004 | Resume semantics      |
| GAP-REC-005 | Stop contract         |
| GAP-REC-006 | Cancellation policy   |
| GAP-REC-007 | Recovery policy       |
| GAP-REC-008 | Resource ownership    |
| GAP-REC-009 | Failure transitions   |
| GAP-REC-010 | Long-session behavior |

---

## 24. Estado actual

| Elemento          | Estado            |
| ----------------- | ----------------- |
| Documentación     | `DOCUMENTED`      |
| Diseño conceptual | `PLANNED`         |
| Implementación    | `NO IMPLEMENTADA` |
| Pruebas           | `NO EJECUTADAS`   |
| Evidencia         | `NO DISPONIBLE`   |
| Validación        | `NO VALIDADO`     |
| Certificación     | `NO CERTIFICADO`  |

---

## 25. Regla de integridad

> **Una grabación es un lifecycle verificable, no simplemente un archivo producido.**
