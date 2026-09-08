# FASE 05 — ENCODING

## SCREEN by KLIK

**Producto:** SCREEN by KLIK  
**Fase:** PHASE-05  
**Nombre:** ENCODING  
**Propósito:** Definición e implementación controlada del subsistema de codificación de video y audio  
**Plataforma inicial:** Windows  
**Lenguaje objetivo:** Go  
**Estado:** PLANNED  
**Implementación:** NOT IMPLEMENTED  
**Pruebas:** NOT EXECUTED  
**Validación:** NOT VALIDATED  
**Certificación:** NOT CERTIFIED  

---

## 1. PROPÓSITO

La FASE 05 establece el subsistema responsable de transformar los datos audiovisuales preparados por las etapas anteriores en un flujo codificado apto para su posterior escritura y finalización.

Esta fase debe definir y validar:

- arquitectura de codificación;
- entrada al encoder;
- salida codificada;
- timestamps;
- orden temporal;
- codec;
- encoder;
- parámetros de calidad;
- bitrate;
- control de tasa;
- keyframes;
- formatos de entrada;
- formatos de salida;
- aceleración por hardware;
- fallback por software;
- buffering;
- backpressure;
- errores;
- finalización;
- liberación de recursos;
- integración con Recording Engine y Output.

La fase **no autoriza asumir un codec, API, biblioteca, encoder de hardware o contenedor concreto sin evaluación y validación**.

---

# 2. OBJETIVO

Construir un subsistema de encoding que pueda recibir datos audiovisuales válidos y producir datos codificados de forma:

- determinista;
- estable;
- verificable;
- recuperable;
- eficiente;
- compatible con la arquitectura;
- preparada para sesiones prolongadas.

El encoder debe ser tratado como un componente especializado dentro del pipeline, no como responsable de la grabación completa.

---

# 3. POSICIÓN EN LA ARQUITECTURA

Conceptualmente:

```text
CAPTURE
   │
   ▼
PROCESSING
   │
   ▼
SYNCHRONIZATION
   │
   ▼
ENCODING
   │
   ▼
OUTPUT
```

El audio seguirá su propio camino hasta llegar al punto de sincronización/codificación correspondiente.

```text
VIDEO ───────┐
             ├──► SYNCHRONIZATION ─► ENCODING ─► OUTPUT
AUDIO ───────┘
```

La arquitectura física de paquetes o directorios queda fuera de esta fase.

---

# 4. ALCANCE

## 4.1 Incluido

- arquitectura del pipeline de encoding;
- recepción de frames;
- recepción de audio;
- timestamps;
- codec;
- encoder;
- parámetros;
- calidad;
- bitrate;
- control de tasa;
- keyframes;
- formatos;
- pixel formats;
- aceleración;
- fallback;
- buffers;
- backpressure;
- flushing;
- finalización;
- errores;
- recuperación;
- cancelación;
- liberación de recursos;
- diagnósticos;
- medición de rendimiento;
- pruebas;
- evidencia;
- validación.

---

# 5. FUERA DE ALCANCE

No pertenece directamente a esta fase:

- captura de pantalla;
- detección de monitores;
- selección de ventanas;
- selector de región;
- captura de audio;
- captura de micrófono;
- captura de cámara;
- interfaz gráfica;
- hotkeys;
- anotaciones;
- cursor;
- overlays;
- escritura final de archivos;
- instalación;
- packaging;
- distribución;
- actualizaciones.

Estas capacidades pertenecen a otras fases.

---

# 6. PRINCIPIO FUNDAMENTAL

Debe distinguirse claramente:

```text
DATOS CAPTURADOS
        ≠
DATOS PROCESADOS
        ≠
DATOS CODIFICADOS
        ≠
ARCHIVO FINAL
```

El encoding no puede considerar que una sesión está finalizada simplemente porque recibió el último frame.

Debe existir una secuencia controlada:

```text
INPUT
  ↓
ENCODE
  ↓
FLUSH
  ↓
DRAIN
  ↓
FINALIZE
  ↓
VALIDATE
```

---

# 7. SELECCIÓN DEL CODEC

El codec concreto queda:

**TBD**

La selección deberá considerar como mínimo:

- calidad;
- eficiencia;
- compatibilidad;
- disponibilidad en Windows;
- soporte de hardware;
- soporte de software;
- latencia;
- complejidad;
- estabilidad;
- licencia;
- distribución;
- mantenimiento;
- comportamiento en sesiones largas.

No se deberá seleccionar un codec únicamente por popularidad.

---

# 8. SELECCIÓN DEL ENCODER

El encoder concreto queda:

**TBD**

Podrá existir conceptualmente más de una estrategia:

```text
ENCODER
├── HARDWARE
└── SOFTWARE FALLBACK
```

Pero la existencia de una GPU no implica automáticamente:

- encoder disponible;
- encoder compatible;
- encoder utilizable;
- encoder estable;
- encoder eficiente;
- encoder validado.

Cada condición deberá verificarse independientemente.

---

# 9. ACELERACIÓN POR HARDWARE

La arquitectura deberá permitir aceleración por hardware cuando sea viable.

Estados conceptuales:

```text
HARDWARE DETECTED
        ↓
ENCODER AVAILABLE
        ↓
ENCODER COMPATIBLE
        ↓
ENCODER INITIALIZED
        ↓
ENCODER VALIDATED
        ↓
USE HARDWARE
```

Si alguna condición crítica falla:

```text
HARDWARE
   ↓
FAILED / UNSUITABLE
   ↓
SOFTWARE FALLBACK
```

No deberá existir dependencia obligatoria de una GPU.

---

# 10. FALLBACK

El fallback deberá ser explícito.

No deberá ocurrir una caída silenciosa de hardware a software.

Debe poder determinarse:

- qué estrategia fue seleccionada;
- por qué fue seleccionada;
- si ocurrió fallback;
- por qué ocurrió;
- si el resultado continúa siendo válido.

---

# 11. PARÁMETROS DE CODIFICACIÓN

Los siguientes parámetros deberán formar parte del modelo conceptual de configuración:

- resolución;
- frame rate;
- pixel format;
- codec;
- encoder;
- bitrate;
- control de tasa;
- calidad;
- GOP;
- keyframe interval;
- perfil;
- nivel;
- parámetros específicos del encoder;
- audio codec;
- audio bitrate;
- sample rate;
- channels.

Los valores concretos permanecen:

**TBD**

No deben congelarse antes de las pruebas correspondientes.

---

# 12. TIMESTAMPS

El encoding debe preservar correctamente la información temporal.

Debe garantizarse:

- monotonía cuando corresponda;
- orden temporal;
- ausencia de timestamps inválidos;
- manejo de discontinuidades;
- coherencia entre audio y video;
- compatibilidad con el siguiente componente.

La sincronización A/V pertenece arquitectónicamente al subsistema de Synchronization.

Encoding debe respetar el contrato temporal recibido.

---

# 13. KEYFRAMES

La política de keyframes queda:

**TBD**

Debe evaluarse su impacto sobre:

- calidad;
- tamaño;
- seeking;
- recuperación;
- pausas;
- finalización;
- compatibilidad;
- rendimiento.

No deberá introducirse una política arbitraria.

---

# 14. BUFFERING

El encoder deberá utilizar mecanismos de buffering controlados.

Principios:

- límites explícitos;
- memoria acotada;
- backpressure;
- detección de saturación;
- comportamiento ante productor lento;
- comportamiento ante consumidor lento;
- liberación correcta.

No se permitirá crecimiento ilimitado de memoria.

---

# 15. BACKPRESSURE

El pipeline debe contemplar:

```text
CAPTURE
   ↓
PROCESSING
   ↓
ENCODING
```

Si Encoding no puede mantener el ritmo:

```text
ENCODING SLOW
      ↓
BACKPRESSURE
      ↓
DEFINED POLICY
```

La política concreta queda:

**TBD**

Deberá definirse qué ocurre ante:

- retraso;
- saturación;
- pérdida de frames;
- pérdida de audio;
- bloqueo del encoder;
- recuperación.

---

# 16. AUDIO ENCODING

El audio deberá mantenerse separado conceptualmente del video hasta el punto de integración correspondiente.

Debe preservarse:

- timestamps;
- orden;
- continuidad;
- duración;
- sincronización;
- metadatos necesarios.

Codec y parámetros:

**TBD**

---

# 17. FINALIZACIÓN

La finalización debe ser explícita.

Proceso conceptual:

```text
STOP REQUEST
     ↓
STOP INPUT
     ↓
FLUSH ENCODER
     ↓
DRAIN OUTPUT
     ↓
RELEASE ENCODER
     ↓
REPORT RESULT
```

Nunca debe considerarse exitoso un encoding cuyo encoder haya sido cerrado antes de consumir correctamente sus datos pendientes.

---

# 18. CANCELACIÓN

La cancelación debe diferenciarse de una finalización normal.

Estados conceptuales:

```text
NORMAL FINALIZATION
CANCELLED
FAILED
RECOVERY REQUIRED
```

Una cancelación no debe dejar recursos activos.

---

# 19. ERRORES

Categorías mínimas:

- configuración inválida;
- codec no disponible;
- encoder no disponible;
- incompatibilidad;
- inicialización fallida;
- input inválido;
- timestamp inválido;
- buffer saturado;
- encoder bloqueado;
- hardware failure;
- software encoder failure;
- flush failure;
- finalization failure;
- cancellation;
- resource failure.

Los errores deben conservar contexto técnico suficiente para diagnóstico.

---

# 20. RECUPERACIÓN

Encoding debe poder comunicar al sistema superior:

- fallo recuperable;
- fallo no recuperable;
- posibilidad de fallback;
- necesidad de abortar;
- estado de finalización.

No debe ocultar errores críticos.

---

# 21. RECURSOS

El encoder puede consumir:

- memoria;
- CPU;
- GPU;
- memoria gráfica;
- buffers;
- handles;
- recursos nativos.

Todos deberán tener ownership explícito.

Debe evitarse:

- memory leaks;
- resource leaks;
- double release;
- uso después de liberación;
- recursos abandonados tras error.

---

# 22. CONCURRENCIA

Debe definirse claramente:

- quién produce;
- quién consume;
- quién detiene;
- quién cancela;
- quién libera;
- cómo se sincronizan los recursos.

La implementación deberá evitar:

- carreras;
- deadlocks;
- condiciones de carrera;
- cierre concurrente inseguro;
- acceso a recursos liberados.

---

# 23. DIAGNÓSTICOS

Debe poder diagnosticarse como mínimo:

- encoder seleccionado;
- estrategia hardware/software;
- configuración efectiva;
- frames recibidos;
- frames codificados;
- frames descartados;
- errores;
- duración;
- throughput;
- latencia relevante;
- fallback.

Los diagnósticos no deben convertirse automáticamente en telemetría externa.

---

# 24. SEGURIDAD Y PRIVACIDAD

Encoding deberá respetar el modelo local-first.

No debe:

- transmitir contenido;
- subir grabaciones;
- requerir servicios externos;
- incorporar conexiones externas innecesarias.

Las grabaciones se consideran contenido potencialmente sensible.

---

# 25. RENDIMIENTO

Se deberán medir, cuando corresponda:

- CPU;
- GPU;
- memoria;
- throughput;
- tiempo de procesamiento;
- latencia;
- frames dropped;
- audio dropped;
- tamaño resultante;
- estabilidad en sesiones prolongadas.

No se deberán declarar cifras de rendimiento sin evidencia.

---

# 26. PRUEBAS

Se deberán contemplar pruebas de:

### Codec

- disponibilidad;
- inicialización;
- configuración;
- encoding;
- finalización.

### Hardware

- hardware disponible;
- hardware no disponible;
- hardware incompatible;
- fallback.

### Timing

- timestamps;
- monotonicidad;
- discontinuidades;
- A/V.

### Buffering

- flujo normal;
- saturación;
- backpressure;
- recuperación.

### Sesiones

- corta;
- media;
- prolongada.

### Errores

- inicialización;
- encoding;
- flush;
- finalización;
- cancelación.

---

# 27. VALIDACIÓN EN HARDWARE REAL

La validación no podrá basarse únicamente en una máquina de desarrollo.

Deberá contemplarse hardware representativo.

Matriz exacta:

**TBD**

No se declarará compatibilidad universal sin evidencia.

---

# 28. CRITERIOS DE ENTRADA

La fase podrá comenzar cuando:

- Phase 01 esté disponible según sus criterios;
- Phase 02 esté disponible cuando sea necesaria;
- Phase 03 esté disponible cuando sea necesaria;
- Phase 04 esté disponible para audio;
- los contratos de entrada estén definidos;
- no exista conflicto documental bloqueante.

---

# 29. CRITERIOS DE SALIDA

La fase podrá considerarse cerrada únicamente cuando:

- encoding esté implementado;
- configuración esté validada;
- codec/encoder estén definidos;
- fallback esté probado;
- timestamps estén validados;
- buffering esté validado;
- finalización esté probada;
- errores estén probados;
- recursos estén correctamente liberados;
- pruebas críticas hayan pasado;
- exista evidencia reproducible;
- documentación esté sincronizada.

---

# 30. EVIDENCIA

La evidencia deberá incluir, como mínimo:

- configuración utilizada;
- entorno de prueba;
- encoder utilizado;
- hardware utilizado;
- resultados;
- errores encontrados;
- resultados de fallback;
- artefactos producidos;
- integridad de resultados.

Sin evidencia:

**NO CERTIFICADO**

---

# 31. TRAZABILIDAD

La relación deberá mantenerse:

```text
REQUIREMENT
   ↓
ARCHITECTURE
   ↓
MODULE
   ↓
COMPONENT
   ↓
PHASE-05
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
```

---

# 32. RIESGOS

Riesgos principales:

- dependencia excesiva de hardware;
- incompatibilidad de encoder;
- diferencias entre GPUs;
- pérdida de frames;
- desincronización;
- buffers ilimitados;
- memory leaks;
- fallos de finalización;
- parámetros incompatibles;
- rendimiento insuficiente.

---

# 33. DECISIONES

| Decisión | Estado |
|---|---|
| Encoding independiente | DEFINIDO |
| Hardware acceleration | ARCHITECTURALLY SUPPORTED |
| Software fallback | REQUIRED |
| Codec | TBD |
| Encoder API | TBD |
| Hardware API | TBD |
| Bitrate strategy | TBD |
| Keyframe strategy | TBD |
| Pixel format | TBD |
| Audio codec | TBD |
| Container | TBD |

---

# 34. ESTADO ACTUAL

**FASE 05 — PLANNED**

No existe evidencia en este documento que permita afirmar:

- implementación terminada;
- pruebas ejecutadas;
- compatibilidad;
- rendimiento;
- encoding funcional;
- fallback funcional;
- certificación.

---

# 35. REGLA SUPREMA

> **Ningún encoder, codec, acelerador, parámetro, rendimiento o compatibilidad se considerará real hasta que exista implementación, prueba, evidencia y validación correspondientes.**