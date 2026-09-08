# FASE 04 — AUDIO

## SCREEN by KLIK

**Proyecto:** SCREEN by KLIK  
**Producto:** Screen Recorder  
**Fase:** PHASE-04  
**Nombre:** AUDIO  
**Tipo:** Captura y gestión de audio del sistema  
**Plataforma inicial:** Windows  
**Lenguaje objetivo:** Go  
**Estado:** `PLANNED`  
**Implementación:** `NOT IMPLEMENTED`  
**Testing:** `NOT EXECUTED`  
**Validation:** `NOT VALIDATED`  
**Certification:** `NOT CERTIFIED`

---

# 1. PROPÓSITO

La FASE 04 establece la capacidad de SCREEN by KLIK para **capturar audio asociado a una sesión de grabación**, comenzando por el audio producido por el sistema operativo.

El objetivo es incorporar audio al pipeline de SCREEN sin comprometer:

- estabilidad;
- sincronización;
- rendimiento;
- privacidad;
- integridad;
- recuperación;
- compatibilidad.

La responsabilidad conceptual es:

```text
WINDOWS AUDIO SOURCE
        ↓
AUDIO CAPTURE
        ↓
AUDIO FRAMES / SAMPLES
        ↓
TIMESTAMP
        ↓
AUDIO PIPELINE
        ↓
SYNCHRONIZATION
        ↓
ENCODING
        ↓
OUTPUT
```

Esta fase se concentra en **captura de audio del sistema**.

La captura de micrófono se encuentra documentada por separado y deberá coordinarse con esta fase cuando corresponda.

---

# 2. OBJETIVO

La fase debe establecer una capacidad verificable para:

- detectar una fuente de audio del sistema;
- inicializar la captura;
- capturar audio;
- mantener información temporal;
- representar correctamente los datos capturados;
- detectar interrupciones;
- manejar cambios de dispositivo;
- controlar buffers;
- aplicar backpressure;
- liberar recursos;
- informar errores;
- integrarse con sincronización;
- integrarse con encoding;
- operar durante sesiones prolongadas.

---

# 3. ALCANCE

## 3.1 Incluido

La fase contempla:

1. System Audio Capture.
2. Audio Source Detection.
3. Audio Device State.
4. Audio Session.
5. Audio Frame Acquisition.
6. Audio Timing.
7. Audio Metadata.
8. Buffer Management.
9. Backpressure.
10. Device Changes.
11. Error Handling.
12. Recovery Boundaries.
13. Diagnostics.
14. Performance.
15. Long-session behavior.
16. Testing.
17. Hardware Validation.
18. Evidence.

---

# 4. FUERA DE ALCANCE

No pertenece directamente a esta fase:

- captura de pantalla;
- detección de displays;
- captura de ventanas;
- captura de regiones;
- codificación final;
- selección definitiva del codec;
- contenedor final;
- edición de audio;
- mezcla avanzada;
- efectos;
- normalización avanzada;
- cámara;
- overlays;
- annotations;
- cursor;
- watermark;
- UI completa;
- streaming;
- cloud;
- publicación automática.

La captura de micrófono se encuentra documentada en:

`docs/technical/MICROPHONE.md`

---

# 5. DOCUMENTOS RELACIONADOS

```text
README.md
docs/requirements/REQUIREMENTS.md
docs/architecture/ARCHITECTURE.md
docs/development/CONTRACT.md
docs/development/MODULES.md
docs/components/COMPONENTS.md
docs/technical/AUDIO.md
docs/technical/MICROPHONE.md
docs/technical/ENCODING.md
docs/technical/RECORDING.md
docs/platform/DESKTOP/WINDOWS.md
docs/testing/TESTING.md
```

---

# 6. RELACIÓN CON LAS FASES ANTERIORES

La secuencia conceptual es:

```text
PHASE-01 FOUNDATION
        ↓
PHASE-02 DISPLAY DETECTION
        ↓
PHASE-03 CAPTURE ENGINE
        ↓
PHASE-04 AUDIO
```

La FASE 04 no depende de que la captura de video esté implementada internamente para poder diseñar su propio contrato, pero la integración final deberá coordinarse con el Recording Engine y Synchronization.

---

# 7. RESPONSABILIDAD DEL AUDIO MODULE

El módulo de audio debe encargarse de obtener datos de audio desde una fuente válida.

Conceptualmente:

```text
AUDIO SOURCE
     ↓
AUDIO CAPTURE
     ↓
AUDIO DATA
```

No debe encargarse de:

```text
VIDEO CAPTURE
ENCODING POLICY
FILE OUTPUT
UI
```

---

# 8. SYSTEM AUDIO

El objetivo inicial es capturar el audio que el sistema reproduce y que el usuario haya configurado para incluir en la grabación.

La capacidad concreta depende de las APIs y mecanismos disponibles en Windows.

La tecnología definitiva queda:

`TBD`

---

# 9. AUDIO SOURCE

Debe existir una representación conceptual de una fuente de audio.

Puede incluir información como:

- identidad;
- nombre;
- estado;
- disponibilidad;
- formato;
- frecuencia de muestreo;
- canales;
- características necesarias para captura.

Los campos definitivos quedan:

`TBD`

---

# 10. SOURCE DETECTION

Antes de iniciar captura debe comprobarse que la fuente de audio requerida existe y está disponible.

Conceptualmente:

```text
DETECT
  ↓
VALIDATE
  ↓
AVAILABLE
  ↓
CAPTURE
```

No debe iniciarse una captura contra una fuente que ya fue identificada como inválida.

---

# 11. AUDIO SESSION

Cada captura de audio debe pertenecer a una sesión.

Conceptualmente:

```text
CREATE
  ↓
INITIALIZE
  ↓
READY
  ↓
CAPTURING
  ↓
STOPPING
  ↓
RELEASE
```

La sesión debe controlar los recursos asociados.

---

# 12. AUDIO LIFECYCLE

Estados conceptuales:

```text
IDLE
 ↓
INITIALIZING
 ↓
READY
 ↓
CAPTURING
 ↓
STOPPING
 ↓
STOPPED
```

Errores:

```text
INITIALIZING
      ↓
    FAILED
```

y:

```text
CAPTURING
    ↓
   ERROR
    ↓
RECOVERY / STOP
```

Los estados definitivos serán validados durante implementación.

---

# 13. START

El inicio debe:

1. validar configuración;
2. validar fuente;
3. adquirir recursos;
4. inicializar captura;
5. determinar el formato efectivo;
6. establecer referencia temporal;
7. confirmar disponibilidad;
8. comenzar adquisición.

Un `Start` exitoso debe implicar capacidad real de producir datos.

---

# 14. AUDIO FORMAT

El formato real puede incluir:

- frecuencia de muestreo;
- número de canales;
- profundidad;
- representación de muestras;
- interleaving;
- timestamps.

Los valores definitivos no se fijan en esta fase documental.

---

# 15. SAMPLE FORMAT

No se debe asumir prematuramente:

```text
PCM
FLOAT
INTEGER
INTERLEAVED
PLANAR
```

La representación definitiva deberá determinarse mediante la API seleccionada y el contrato de procesamiento.

---

# 16. SAMPLE RATE

La frecuencia de muestreo debe ser conocida y consistente.

Ejemplos comunes pueden existir en la plataforma, pero SCREEN no debe declarar uno como requisito definitivo sin justificación.

La política de:

```text
NATIVE SAMPLE RATE
```

frente a:

```text
RESAMPLING
```

queda:

`TBD`

---

# 17. CHANNELS

Debe conocerse el número de canales de la fuente.

Ejemplos conceptuales:

```text
MONO
STEREO
MULTI-CHANNEL
```

La configuración definitiva queda pendiente de validación.

---

# 18. TIMING

El audio requiere información temporal confiable.

Conceptualmente:

```text
AUDIO BLOCK 0 → T0
AUDIO BLOCK 1 → T1
AUDIO BLOCK 2 → T2
```

Los timestamps deberán permitir que Synchronization pueda relacionar audio y video.

---

# 19. CLOCK DOMAIN

Debe determinarse qué reloj se utiliza para:

- captura de audio;
- captura de video;
- sincronización.

No debe asumirse que todos los subsistemas utilizan exactamente el mismo reloj.

La estrategia de clock synchronization queda:

`TBD`

---

# 20. AUDIO/VIDEO SYNCHRONIZATION

La sincronización A/V se implementará conceptualmente mediante:

```text
VIDEO TIMESTAMP
       +
AUDIO TIMESTAMP
       ↓
SYNCHRONIZATION
```

La responsabilidad principal de sincronización pertenece al módulo correspondiente, no al Capture Engine de audio.

La estrategia definitiva queda:

`TBD`

---

# 21. LATENCY

Debe evaluarse:

- latencia de adquisición;
- latencia de buffers;
- latencia de entrega;
- latencia de procesamiento.

No se debe confundir:

```text
CAPTURE LATENCY
```

con:

```text
PROCESSING LATENCY
```

ni con:

```text
ENCODING LATENCY
```

---

# 22. BUFFERING

La captura de audio requiere buffers controlados.

Los buffers deben tener:

- propietario;
- tamaño;
- límite;
- estrategia de consumo;
- estrategia de saturación;
- liberación.

No se permiten buffers infinitos.

---

# 23. BACKPRESSURE

Debe existir una estrategia cuando el consumidor no procesa los datos suficientemente rápido.

Conceptualmente:

```text
AUDIO CAPTURE
      ↓
BUFFER
      ↓
CONSUMER
```

Si:

```text
PRODUCTION RATE > CONSUMPTION RATE
```

debe existir comportamiento definido.

Posibilidades:

```text
BLOCK
DROP
RECOVER
STOP
```

La política definitiva queda:

`TBD`

---

# 24. DATA LOSS

La pérdida de audio debe poder detectarse.

Debe distinguirse entre:

- pérdida de bloques;
- discontinuidad temporal;
- silencio legítimo;
- fuente desconectada;
- error de captura.

No se debe interpretar automáticamente el silencio como pérdida de audio.

---

# 25. SILENCE

Un segmento sin señal no necesariamente constituye un error.

Debe diferenciarse:

```text
NO AUDIO SIGNAL
```

de:

```text
AUDIO CAPTURE FAILURE
```

La detección de actividad de audio no debe utilizarse como sustituto de la validación del pipeline.

---

# 26. DEVICE CHANGES

Debe contemplarse que el dispositivo de audio pueda cambiar durante una sesión.

Ejemplos:

- dispositivo desconectado;
- dispositivo deshabilitado;
- cambio de dispositivo predeterminado;
- cambio de configuración;
- cambio de formato.

La política exacta queda:

`TBD`

---

# 27. DEVICE DISCONNECTION

Conceptualmente:

```text
AVAILABLE
    ↓
DISCONNECTED
    ↓
RECOVERY / STOP
```

La aplicación debe evitar continuar indefinidamente suponiendo que el dispositivo todavía existe.

---

# 28. DEFAULT DEVICE

El concepto de dispositivo predeterminado de Windows no debe confundirse con una identidad permanente.

El sistema debe registrar qué fuente se utilizó realmente durante la sesión.

La política de selección queda:

`TBD`

---

# 29. RESOURCE OWNERSHIP

Los recursos de audio deben tener ownership explícito.

Conceptualmente:

```text
Audio Session
     │
     ├── Audio Source
     ├── Native Audio Resources
     ├── Buffers
     └── Capture Lifecycle
```

Al finalizar:

```text
STOP
 ↓
RELEASE
 ↓
VERIFY
```

---

# 30. PLATFORM BOUNDARY

Los detalles específicos de Windows deben permanecer aislados.

Conceptualmente:

```text
AUDIO MODULE
     ↓
PLATFORM AUDIO BOUNDARY
     ↓
WINDOWS AUDIO SYSTEM
```

El resto de SCREEN no debe depender directamente de detalles nativos innecesarios.

---

# 31. WINDOWS AUDIO API

La API definitiva queda:

`TBD`

La selección debe considerar:

- captura de audio del sistema;
- estabilidad;
- latencia;
- formatos;
- compatibilidad;
- cambios de dispositivo;
- consumo;
- interacción con futuras capacidades de micrófono;
- mantenimiento;
- distribución.

---

# 32. MICROPHONE BOUNDARY

La captura del micrófono se mantiene separada conceptualmente:

```text
SYSTEM AUDIO
     │
     ▼
AUDIO PIPELINE

MICROPHONE
     │
     ▼
AUDIO PIPELINE
```

Posteriormente ambas fuentes pueden participar en una composición/mix definida por el Recording/Synchronization/Audio architecture.

No deben mezclarse prematuramente.

---

# 33. MIXING

La mezcla entre:

- system audio;
- microphone;

no forma parte necesariamente de la captura básica.

La política de mezcla queda:

`TBD`

La captura debe preservar la separación de fuentes mientras el diseño lo requiera.

---

# 34. AUDIO QUALITY

La calidad debe evaluarse mediante:

- continuidad;
- ausencia de artefactos;
- ausencia de interrupciones;
- estabilidad;
- sincronización;
- formato correcto;
- comportamiento bajo carga.

No se debe declarar "calidad profesional" sin pruebas objetivas.

---

# 35. ERROR HANDLING

Categorías conceptuales:

```text
AUDIO_SOURCE_UNAVAILABLE
AUDIO_INIT_FAILED
AUDIO_CAPTURE_FAILED
AUDIO_DEVICE_DISCONNECTED
AUDIO_FORMAT_UNSUPPORTED
AUDIO_BUFFER_OVERFLOW
AUDIO_TIMING_ERROR
AUDIO_RESOURCE_FAILURE
AUDIO_RECOVERY_FAILED
UNKNOWN_AUDIO_ERROR
```

Son categorías documentales y no nombres definitivos de código.

---

# 36. RECOVERY

Un error recuperable podrá seguir:

```text
ERROR
 ↓
CLASSIFY
 ↓
RECOVER
 ↓
VERIFY
 ↓
CONTINUE
```

Un error no recuperable:

```text
ERROR
 ↓
STOP SAFELY
 ↓
RELEASE
 ↓
REPORT
```

No se permiten ciclos de recuperación infinitos.

---

# 37. CANCELLATION

La captura debe poder cancelarse.

Conceptualmente:

```text
CANCEL
 ↓
STOP ACQUISITION
 ↓
RELEASE BUFFERS
 ↓
RELEASE DEVICE
 ↓
CLOSED
```

La implementación debe garantizar que las operaciones bloqueantes tengan una estrategia de salida.

---

# 38. CONCURRENCIA

Si la captura utiliza goroutines u otros mecanismos concurrentes:

cada unidad concurrente debe tener:

- propósito;
- propietario;
- cancelación;
- condición de salida;
- manejo de error;
- cierre.

No deben existir workers huérfanos.

---

# 39. MEMORY MANAGEMENT

Debe evitarse:

- crecimiento ilimitado;
- buffers retenidos;
- referencias después de liberación;
- duplicación innecesaria;
- acumulación de audio pendiente.

Las pruebas deberán observar memoria durante sesiones prolongadas.

---

# 40. PERFORMANCE

La fase deberá medir:

```text
CPU
MEMORY
LATENCY
BUFFER DEPTH
DROP RATE
TIMING STABILITY
SESSION DURATION
```

Los valores reales serán obtenidos durante testing.

---

# 41. LONG SESSION

Debe evaluarse el comportamiento durante sesiones prolongadas.

Se debe buscar:

- memory growth;
- audio discontinuity;
- drift;
- buffer accumulation;
- device instability;
- CPU growth;
- degradation.

La duración definitiva de la prueba queda:

`TBD`

---

# 42. DIAGNOSTICS

Los diagnósticos deben permitir conocer:

- fuente utilizada;
- estado;
- formato efectivo;
- inicio;
- finalización;
- errores;
- interrupciones;
- cambios de dispositivo;
- pérdidas;
- recuperación.

No deben registrarse datos de audio como contenido de diagnóstico.

---

# 43. PRIVACY

El audio capturado puede contener conversaciones y otra información sensible.

Por ello:

- la captura debe permanecer local;
- no debe transmitirse audio externamente;
- no debe registrarse contenido de audio en logs;
- los buffers deben tener ciclo de vida controlado;
- los archivos temporales deben limitarse al propósito de la grabación.

---

# 44. SECURITY

La captura debe operar con mínimo privilegio.

No debe requerir privilegios administrativos salvo necesidad técnica demostrada.

Las APIs de Windows deben utilizarse conforme a sus mecanismos legítimos de acceso.

---

# 45. TESTING

Las pruebas deberán incluir:

## Source

- [ ] fuente válida;
- [ ] fuente inexistente;
- [ ] fuente no disponible.

## Capture

- [ ] inicio;
- [ ] captura continua;
- [ ] stop;
- [ ] reinicio.

## Format

- [ ] frecuencia de muestreo;
- [ ] canales;
- [ ] formato real.

## Timing

- [ ] timestamps;
- [ ] continuidad;
- [ ] estabilidad.

## Failure

- [ ] desconexión;
- [ ] cambio de dispositivo;
- [ ] error de captura;
- [ ] buffer saturation.

---

# 46. HARDWARE TESTING

Cuando sea posible deberán utilizarse diferentes configuraciones reales:

- audio integrado;
- dispositivo externo;
- auriculares;
- HDMI/DisplayPort audio cuando corresponda;
- diferentes configuraciones de salida.

El inventario real queda:

`TBD`

---

# 47. TESTING CON MICRÓFONO

Aunque el micrófono tenga documentación separada, la integración deberá probarse posteriormente para garantizar que:

```text
SYSTEM AUDIO
+
MICROPHONE
```

puedan coexistir sin corrupción de timing.

La prueba integrada corresponde a una etapa posterior de integración.

---

# 48. ACCEPTANCE CRITERIA

La fase podrá considerarse candidata a cierre cuando exista evidencia de que:

- [ ] una fuente de audio válida puede detectarse;
- [ ] la captura puede inicializarse;
- [ ] se producen datos reales;
- [ ] el formato es conocido;
- [ ] timestamps son coherentes;
- [ ] el audio mantiene continuidad;
- [ ] los buffers están limitados;
- [ ] existe estrategia de backpressure;
- [ ] la desconexión puede detectarse;
- [ ] los errores son controlados;
- [ ] los recursos se liberan;
- [ ] no existen fugas conocidas;
- [ ] las sesiones prolongadas fueron evaluadas;
- [ ] existe información suficiente para sincronización;
- [ ] se realizaron pruebas de hardware;
- [ ] existe evidencia reproducible;
- [ ] la trazabilidad fue actualizada.

---

# 49. EVIDENCE REQUIRED

El cierre deberá incluir evidencia de:

```text
AUDIO SOURCE
AUDIO CAPTURE
FORMAT
TIMING
CONTINUITY
DEVICE CHANGE
ERROR HANDLING
RECOVERY
BUFFERING
PERFORMANCE
LONG SESSION
HARDWARE
TRACEABILITY
VALIDATION
```

---

# 50. TRACEABILITY

La relación deberá seguir:

```text
REQUIREMENT
    ↓
ARCHITECTURE
    ↓
AUDIO MODULE
    ↓
AUDIO COMPONENT
    ↓
PHASE-04
    ↓
IMPLEMENTATION
    ↓
TEST
    ↓
EVIDENCE
    ↓
VALIDATION
```

La matriz se mantiene en:

`docs/development/TRACEABILITY.md`

---

# 51. RIESGOS

## RISK-AUDIO-001 — API Limitations

La API seleccionada puede no satisfacer los requisitos.

**Mitigación:** evaluación previa y pruebas reales.

## RISK-AUDIO-002 — Device Disconnection

El dispositivo puede desaparecer durante la sesión.

**Mitigación:** detección y recuperación controlada.

## RISK-AUDIO-003 — Audio Drift

Audio y video pueden derivar temporalmente.

**Mitigación:** timestamps y Synchronization.

## RISK-AUDIO-004 — Buffer Overflow

El consumidor puede no mantener el ritmo.

**Mitigación:** buffers limitados y backpressure.

## RISK-AUDIO-005 — Format Incompatibility

El formato nativo puede no ser adecuado para el pipeline.

**Mitigación:** contrato de formato y conversión controlada cuando sea necesaria.

## RISK-AUDIO-006 — Memory Growth

Buffers pueden acumular datos.

**Mitigación:** límites y pruebas prolongadas.

---

# 52. DECISIONES

| Decisión | Estado |
|---|---|
| Captura de system audio | `REQUIRED` |
| Windows como plataforma inicial | `DECIDED` |
| Captura local | `DECIDED` |
| Timestamps | `REQUIRED` |
| Buffering limitado | `REQUIRED` |
| Backpressure | `REQUIRED` |
| Device change detection | `REQUIRED` |
| Recovery | `REQUIRED` |
| Micrófono separado conceptualmente | `DECIDED` |
| Windows Audio API | `TBD` |
| Sample format | `TBD` |
| Sample rate | `TBD` |
| Channel policy | `TBD` |
| Clock source | `TBD` |
| Resampling | `TBD` |
| Mixing policy | `TBD` |
| Drop policy | `TBD` |
| Recovery policy | `TBD` |

---

# 53. DEPENDENCIAS

### Entrada

```text
PHASE-01 FOUNDATION
```

### Documentación

```text
REQUIREMENTS
ARCHITECTURE
MODULES
COMPONENTS
AUDIO
MICROPHONE
WINDOWS PLATFORM
```

### Consumidores

```text
SYNCHRONIZATION
ENCODING
RECORDING
OUTPUT
```

---

# 54. CRITERIOS DE BLOQUEO

La fase deberá declararse:

`BLOCKED`

si:

- no existe una fuente de audio válida;
- la API no permite captura adecuada;
- el formato no puede determinarse;
- los timestamps no son confiables;
- existe pérdida de audio no controlada;
- la desconexión del dispositivo no puede detectarse;
- existen fugas de recursos;
- la memoria crece sin límite;
- la sincronización futura queda imposibilitada;
- no existe hardware suficiente para validar un requisito obligatorio.

---

# 55. ARTEFACTOS ESPERADOS

Al implementar esta fase deberán existir:

- implementación de captura;
- pruebas;
- resultados;
- evidencia;
- documentación actualizada;
- trazabilidad;
- resultados de validación.

Los nombres físicos de paquetes y tipos quedan pendientes de implementación.

---

# 56. ESTADO ACTUAL

```text
PHASE             = PHASE-04
NAME              = AUDIO

STATUS            = PLANNED

IMPLEMENTATION    = NOT IMPLEMENTED
TESTING           = NOT EXECUTED
EVIDENCE          = NOT GENERATED
VALIDATION        = NOT VALIDATED
CERTIFICATION     = NOT CERTIFIED
INTEGRATION       = NOT INTEGRATED
```

La existencia de este documento no constituye evidencia de implementación.

---

# 57. REPORTE DE CIERRE

Cuando la fase sea ejecutada deberá documentarse:

```text
PHASE:
PHASE-04 AUDIO

STATUS:
...

AUDIO API:
...

SOURCE TESTED:
...

SAMPLE RATE:
...

CHANNELS:
...

FORMAT:
...

TIMING:
...

LATENCY:
...

BUFFERING:
...

DEVICE CHANGES:
...

RECOVERY:
...

CPU:
...

MEMORY:
...

LONG SESSION:
...

HARDWARE:
...

TEST RESULTS:
...

EVIDENCE:
...

KNOWN ISSUES:
...

TRACEABILITY:
...

VALIDATION:
...

CERTIFICATION:
...

INTEGRATION:
...
```

Todos los valores deberán provenir de pruebas reales.

---

# 58. REGLA SUPREMA

> **El audio debe capturarse de forma íntegra, temporalmente coherente, controlada y recuperable, sin inventar capacidades ni ocultar pérdidas.**

Por tanto:

```text
NO FAKE AUDIO
NO FAKE TIMING
NO FAKE QUALITY
NO FAKE COMPATIBILITY
NO FAKE PERFORMANCE
NO FAKE RECOVERY
NO FAKE TESTS
NO FAKE EVIDENCE
NO FAKE CERTIFICATION
```

La progresión correcta es:

```text
DESIGN
   ↓
IMPLEMENT
   ↓
TEST
   ↓
MEASURE
   ↓
VALIDATE
   ↓
CERTIFY
   ↓
DOCUMENT
   ↓
INTEGRATE
```

**PHASE-04 AUDIO permanece `PLANNED` hasta que exista implementación real, pruebas reales y evidencia verificable.**