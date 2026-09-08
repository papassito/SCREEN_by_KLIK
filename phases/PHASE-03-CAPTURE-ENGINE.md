# FASE 03 — CAPTURE ENGINE

## SCREEN by KLIK

**Proyecto:** SCREEN by KLIK  
**Producto:** Screen Recorder  
**Fase:** PHASE-03  
**Nombre:** CAPTURE ENGINE  
**Tipo:** Motor de captura de video  
**Plataforma inicial:** Windows  
**Lenguaje objetivo:** Go  
**Estado:** `PLANNED`  
**Implementación:** `NOT IMPLEMENTED`  
**Testing:** `NOT EXECUTED`  
**Validation:** `NOT VALIDATED`  
**Certification:** `NOT CERTIFIED`

---

# 1. PROPÓSITO

La FASE 03 implementa el **motor responsable de obtener los frames de video que constituyen una sesión de grabación**.

Este motor representa la frontera entre las fuentes gráficas del sistema operativo y el resto del pipeline de SCREEN.

Su responsabilidad principal es:

```text
SOURCE
   ↓
CAPTURE ENGINE
   ↓
VIDEO FRAMES
   ↓
PROCESSING
   ↓
ENCODING
   ↓
OUTPUT
```

El Capture Engine debe proporcionar una captura estable, temporalmente coherente y controlada, sin asumir responsabilidades que pertenecen a procesamiento, codificación, salida o interfaz de usuario.

---

# 2. OBJETIVO

La fase debe establecer un motor capaz de:

- iniciar una captura;
- detener una captura;
- capturar frames;
- mantener timestamps;
- identificar la fuente capturada;
- manejar la configuración de captura;
- detectar pérdida o discontinuidad de frames;
- controlar recursos nativos;
- comunicar errores;
- soportar backpressure;
- liberar recursos correctamente;
- integrarse con el pipeline posterior;
- operar de manera segura durante sesiones prolongadas.

---

# 3. ALCANCE

## 3.1 Incluido

La fase contempla:

1. Capture Engine.
2. Capture Session.
3. Capture Source.
4. Frame Acquisition.
5. Frame Timing.
6. Frame Metadata.
7. Capture Lifecycle.
8. Resource Ownership.
9. Buffering.
10. Backpressure.
11. Error Handling.
12. Recovery boundaries.
13. Multi-monitor integration.
14. Window capture integration.
15. Region capture integration.
16. Capture diagnostics.
17. Capture tests.
18. Performance measurement.
19. Evidence.

---

# 4. FUERA DE ALCANCE

No corresponde a esta fase implementar como responsabilidad principal:

- encoding;
- codecs;
- containerización;
- escritura definitiva de archivos;
- audio;
- micrófono;
- cámara;
- mezcla A/V;
- sincronización audiovisual completa;
- cursor rendering;
- overlays;
- annotations;
- watermark;
- UI completa;
- hotkeys;
- configuración avanzada;
- edición de video;
- streaming;
- cloud upload;
- publicación automática.

Estas capacidades pertenecen a otras fases.

---

# 5. DOCUMENTOS DE AUTORIDAD

Esta fase debe respetar la siguiente jerarquía:

```text
README.md
   ↓
REQUIREMENTS.md
   ↓
ARCHITECTURE.md
   ↓
CONTRACT.md
   ↓
MODULES.md
   ↓
COMPONENTS.md
   ↓
TECHNICAL DOCUMENTATION
   ↓
PHASE-03
   ↓
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

En caso de conflicto documental, no se debe resolver mediante código improvisado.

Debe aplicarse el procedimiento establecido por el contrato del proyecto.

---

# 6. RELACIÓN CON FASE 02

La FASE 02 — DISPLAY DETECTION identifica y describe las fuentes disponibles.

Conceptualmente:

```text
PHASE-02
DISPLAY DETECTION
       │
       ▼
AVAILABLE SOURCES
       │
       ▼
PHASE-03
CAPTURE ENGINE
```

La FASE 03 no debe duplicar innecesariamente la responsabilidad de detección.

Debe consumir una fuente previamente identificada mediante un contrato definido.

Si ese contrato todavía no existe en implementación:

`BLOCKED / CONTRACT REQUIRED`

No se debe inventar una API únicamente para continuar.

---

# 7. RESPONSABILIDAD DEL CAPTURE ENGINE

El Capture Engine es responsable de transformar una fuente seleccionada en una secuencia de frames.

Conceptualmente:

```text
SELECTED SOURCE
      │
      ▼
CAPTURE
      │
      ▼
FRAME
      │
      ▼
TIMESTAMP
      │
      ▼
FRAME METADATA
      │
      ▼
PROCESSING PIPELINE
```

El motor no debe:

- codificar;
- guardar archivos finales;
- dibujar UI;
- administrar configuración global;
- controlar dispositivos de audio;
- administrar cámara.

---

# 8. CAPTURE SESSION

Cada captura debe pertenecer conceptualmente a una sesión.

Una sesión representa:

```text
CREATE
  ↓
CONFIGURE
  ↓
START
  ↓
CAPTURING
  ↓
STOP
  ↓
RELEASE
```

La sesión debe mantener un contexto controlado para los recursos utilizados durante la captura.

---

# 9. CAPTURE LIFECYCLE

El ciclo de vida conceptual es:

```text
IDLE
 │
 ▼
INITIALIZING
 │
 ▼
READY
 │
 ▼
CAPTURING
 │
 ├──────────────┐
 │              │
 ▼              ▼
ERROR          STOPPING
 │              │
 ▼              ▼
RECOVERY       STOPPED
 │
 ▼
STOPPED
```

Las transiciones definitivas deberán establecerse durante la implementación y pruebas.

---

# 10. START

Al iniciar una captura, el motor debe:

1. validar la configuración recibida;
2. validar la fuente;
3. adquirir los recursos necesarios;
4. inicializar la captura;
5. establecer el contexto temporal;
6. confirmar que la captura está operativa;
7. comenzar la adquisición de frames.

Un `Start` exitoso no debe significar únicamente que se creó un objeto en memoria.

Debe existir evidencia de que la fuente puede producir frames.

---

# 11. FRAME ACQUISITION

Cada frame adquirido debe formar parte de una secuencia temporal.

Conceptualmente:

```text
FRAME N
FRAME N+1
FRAME N+2
FRAME N+3
...
```

Cada frame debe poder asociarse con información temporal suficiente para que el pipeline posterior pueda determinar su posición relativa.

La representación física del frame queda:

`TBD`

No se debe asumir todavía:

- imagen RGB;
- BGRA;
- RGBA;
- YUV;
- textura GPU;
- buffer CPU;
- otro formato.

---

# 12. FRAME TIMING

El timing es crítico.

El Capture Engine debe proporcionar información temporal consistente.

Conceptualmente:

```text
Frame 0 → T0
Frame 1 → T1
Frame 2 → T2
Frame 3 → T3
```

Los timestamps no deben depender exclusivamente del momento en que otro módulo procesa el frame.

Debe distinguirse, cuando sea relevante, entre:

- momento de adquisición;
- momento de entrega;
- duración de procesamiento;
- retraso de cola.

La fuente temporal definitiva queda:

`TBD`

---

# 13. FRAME METADATA

Los frames deberán poder transportar metadatos suficientes para su procesamiento posterior.

Conceptualmente pueden incluir:

- timestamp;
- dimensiones;
- fuente;
- orientación;
- estado;
- información necesaria para procesamiento;
- información necesaria para diagnóstico.

Los campos concretos no se consideran aprobados hasta su definición técnica.

---

# 14. FRAME ORDER

Los frames deben conservar un orden temporal coherente.

Si el sistema detecta:

```text
T0
T2
T1
```

debe existir una estrategia definida para determinar qué hacer.

No se debe asumir automáticamente que los frames pueden reordenarse sin consecuencias.

La política definitiva de reordenamiento queda:

`TBD`

---

# 15. FRAME LOSS

La captura debe poder detectar condiciones como:

- pérdida de frames;
- frames duplicados;
- discontinuidad temporal;
- interrupción de fuente;
- retraso excesivo;
- buffer overflow;
- recurso no disponible.

No todos estos eventos requieren necesariamente detener la grabación.

La política concreta dependerá de la severidad.

---

# 16. BACKPRESSURE

El Capture Engine no debe permitir que una etapa posterior lenta provoque crecimiento ilimitado de memoria.

Conceptualmente:

```text
CAPTURE
   ↓
BUFFER
   ↓
PROCESSING
   ↓
ENCODING
```

Si:

```text
CAPTURE RATE > CONSUMPTION RATE
```

debe existir una estrategia definida.

Posibles estrategias:

- bloqueo controlado;
- reducción controlada;
- descarte explícito;
- señalización de error;
- recuperación;
- detención segura.

La estrategia definitiva queda:

`TBD`

Lo que no se permite es crecimiento ilimitado y silencioso de memoria.

---

# 17. BUFFERING

El sistema debe utilizar buffers únicamente cuando sean necesarios.

Los buffers deberán tener:

- propietario;
- ciclo de vida;
- límites;
- estrategia de liberación;
- comportamiento ante saturación.

No se permiten colas infinitas.

---

# 18. RESOURCE OWNERSHIP

Los recursos de captura deben tener un propietario claramente definido.

Conceptualmente:

```text
Capture Session
      │
      ├── Capture Source
      ├── Native Capture Resources
      ├── Frame Buffers
      └── Capture Lifecycle
```

Al finalizar la sesión:

```text
STOP
 ↓
RELEASE
 ↓
VERIFY
```

Los recursos no deben permanecer abiertos después del cierre normal.

---

# 19. MULTI-MONITOR

SCREEN requiere soporte para múltiples monitores.

La captura deberá poder distinguir conceptualmente:

```text
DISPLAY 1
DISPLAY 2
DISPLAY 3
...
```

La selección del monitor corresponde a la fuente.

La captura corresponde al Capture Engine.

No debe mezclarse:

```text
DISPLAY DETECTION
```

con:

```text
FRAME CAPTURE
```

---

# 20. WINDOW CAPTURE

La arquitectura contempla captura de una ventana.

El motor debe recibir una fuente de ventana válida y producir frames correspondientes a esa fuente.

Deben contemplarse condiciones como:

- ventana cerrada;
- ventana minimizada;
- ventana movida;
- ventana redimensionada;
- ventana parcialmente cubierta;
- pérdida de acceso a la fuente.

La política específica para cada condición queda:

`TBD`

---

# 21. REGION CAPTURE

La captura de región debe permitir trabajar con un área seleccionada.

Conceptualmente:

```text
FULL SOURCE
     │
     ▼
REGION
     │
     ▼
CAPTURE
```

La región debe validarse antes de iniciar la captura.

Deben comprobarse:

- coordenadas;
- dimensiones;
- límites;
- disponibilidad de la fuente;
- cambios de resolución;
- cambios de escala cuando correspondan.

---

# 22. HIGH-DPI Y ESCALADO

Windows puede utilizar escalado de pantalla.

La implementación debe diferenciar correctamente entre:

- coordenadas lógicas;
- coordenadas físicas;
- resolución;
- escala del sistema;
- escala del monitor.

No se debe asumir que:

```text
1 logical pixel = 1 physical pixel
```

La estrategia definitiva deberá validarse en hardware real.

---

# 23. CAMBIOS DURANTE LA CAPTURA

El sistema debe contemplar cambios dinámicos como:

- monitor conectado;
- monitor desconectado;
- resolución modificada;
- escala modificada;
- ventana redimensionada;
- fuente desaparecida;
- cambio de estado de la fuente.

La respuesta debe ser definida antes de certificación.

Posibles resultados:

```text
CONTINUE
RECONFIGURE
PAUSE
RECOVER
STOP
FAIL
```

No se debe implementar comportamiento arbitrario.

---

# 24. CAPTURE API

La API concreta de captura para Windows queda:

`TBD`

La decisión deberá evaluarse considerando:

- estabilidad;
- compatibilidad;
- rendimiento;
- latencia;
- soporte multimonitor;
- captura de ventanas;
- captura de regiones;
- interacción con GPU;
- disponibilidad en Windows objetivo;
- mantenimiento;
- restricciones de distribución.

No se debe seleccionar una tecnología únicamente por popularidad.

---

# 25. CPU / GPU

La captura puede involucrar recursos de CPU y/o GPU.

Debe evitarse una copia innecesaria de datos.

Conceptualmente:

```text
SOURCE
  ↓
CAPTURE
  ↓
FRAME
```

La implementación debe medir:

- consumo de CPU;
- consumo de GPU;
- memoria;
- ancho de banda;
- latencia;
- drops.

No se debe declarar una ruta como "acelerada" sin evidencia.

---

# 26. COPY STRATEGY

Debe evaluarse cuántas copias de memoria ocurren entre:

```text
SOURCE
→ CAPTURE
→ PROCESSING
→ ENCODING
```

Una copia adicional puede tener impacto significativo a altas resoluciones o tasas de frames.

La estrategia final queda:

`TBD`

---

# 27. RESOLUCIÓN

El Capture Engine debe soportar las resoluciones válidas de las fuentes seleccionadas dentro de las capacidades reales de la plataforma.

No se debe establecer artificialmente una resolución máxima sin evidencia.

La capacidad real deberá determinarse mediante pruebas.

---

# 28. FRAME RATE

El sistema debe poder trabajar con la cadencia de captura requerida por la configuración y la fuente.

La capacidad real dependerá de:

- resolución;
- fuente;
- API utilizada;
- hardware;
- GPU;
- CPU;
- carga del sistema;
- procesamiento;
- encoder.

Por tanto:

```text
SUPPORTED FPS = VALIDATION RESULT
```

No una afirmación documental.

---

# 29. PERFORMANCE

La evaluación debe incluir al menos:

- FPS objetivo;
- FPS efectivo;
- frame drops;
- latencia;
- CPU;
- GPU;
- memoria;
- duración;
- estabilidad;
- comportamiento bajo carga.

No se establecerán números de rendimiento definitivos sin medición.

---

# 30. ERROR HANDLING

Los errores deben clasificarse y propagarse de forma coherente.

Ejemplos conceptuales:

```text
SOURCE_UNAVAILABLE
CAPTURE_INIT_FAILED
FRAME_ACQUISITION_FAILED
RESOURCE_FAILURE
BUFFER_OVERFLOW
TIMING_ERROR
SOURCE_DISCONNECTED
UNSUPPORTED_CONFIGURATION
NATIVE_API_ERROR
UNKNOWN_ERROR
```

Los nombres anteriores son categorías conceptuales y no constituyen todavía identificadores de código aprobados.

---

# 31. ERROR RECOVERY

Ante un error recuperable:

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

Ante un error no recuperable:

```text
ERROR
 ↓
STOP SAFELY
 ↓
RELEASE
 ↓
REPORT
```

No debe intentarse una recuperación infinita.

---

# 32. RECOVERY LIMITS

Toda estrategia de recuperación deberá tener límites.

Debe evitarse:

```text
RETRY
 ↓
RETRY
 ↓
RETRY
 ↓
RETRY
 ↓
...
```

La cantidad, intervalo y política de reintentos quedan:

`TBD`

y deberán justificarse mediante comportamiento observado.

---

# 33. CONCURRENCIA

La captura puede requerir ejecución concurrente.

Si se utilizan goroutines, cada una debe tener:

- propietario;
- propósito;
- señal de cancelación;
- condición de salida;
- recuperación ante error;
- cierre controlado.

No deben existir goroutines huérfanas.

---

# 34. CANCELLATION

El Capture Engine debe responder a una orden de cancelación.

Conceptualmente:

```text
CANCEL
  ↓
STOP ACQUISITION
  ↓
DRAIN / DISCARD ACCORDING TO POLICY
  ↓
RELEASE RESOURCES
  ↓
CLOSED
```

La política exacta deberá definirse en implementación.

---

# 35. THREAD SAFETY

Los recursos compartidos deben estar claramente definidos.

Debe evitarse:

- estado mutable global;
- acceso concurrente no protegido;
- ownership ambiguo;
- callbacks sin ciclo de vida;
- cierre concurrente no controlado.

Las condiciones de carrera deben comprobarse mediante testing apropiado.

---

# 36. DIAGNOSTICS

El Capture Engine debe proporcionar información suficiente para determinar:

- qué fuente estaba activa;
- cuándo comenzó;
- cuándo terminó;
- si hubo pérdida de frames;
- si ocurrió una interrupción;
- si hubo error;
- si existió saturación;
- si se realizó recuperación.

No debe registrar información privada innecesaria.

---

# 37. PRIVACIDAD

La captura contiene potencialmente información altamente sensible porque representa contenido visual de la pantalla.

El Capture Engine debe:

- operar localmente;
- no transmitir frames externamente;
- no almacenar capturas temporales fuera del propósito definido;
- liberar buffers correctamente;
- evitar logs que contengan contenido visual;
- evitar almacenar datos innecesarios.

No se debe implementar telemetría de contenido capturado.

---

# 38. SECURITY

La captura debe ejecutarse bajo el principio de mínimo privilegio.

No debe solicitar privilegios administrativos salvo que exista una necesidad técnica real, documentada y validada.

Las APIs nativas deberán utilizarse dentro de sus límites previstos.

No debe existir acceso arbitrario a recursos del sistema sin justificación.

---

# 39. DATA LIFETIME

Los frames deben tener un ciclo de vida explícito:

```text
ACQUIRED
   ↓
OWNED
   ↓
CONSUMED
   ↓
RELEASED
```

No deben existir referencias a buffers después de su liberación.

La gestión de memoria debe ser verificable mediante pruebas.

---

# 40. INTEGRATION WITH PROCESSING

El Capture Engine entrega frames al procesamiento.

```text
CAPTURE
   ↓
FRAME STREAM
   ↓
PROCESSING
```

Processing puede posteriormente aplicar:

- cursor;
- overlays;
- annotations;
- camera composition;
- scaling;
- transformaciones.

El Capture Engine no debe asumir esas responsabilidades.

---

# 41. INTEGRATION WITH ENCODING

El Capture Engine no codifica directamente.

La relación conceptual es:

```text
CAPTURE
   ↓
PROCESSING
   ↓
ENCODING
```

El formato intermedio debe establecerse mediante un contrato.

Actualmente:

`TBD`

---

# 42. INTEGRATION WITH RECORDING ENGINE

Recording Engine controla la sesión general.

Capture Engine proporciona la adquisición de video.

Conceptualmente:

```text
RECORDING ENGINE
       │
       ▼
CAPTURE ENGINE
       │
       ▼
VIDEO FRAMES
```

Recording Engine no debe duplicar internamente la implementación de captura.

---

# 43. STOP

El `Stop` de captura debe:

1. detener adquisición;
2. evitar nuevos frames;
3. resolver buffers pendientes según política;
4. liberar recursos;
5. cerrar recursos nativos;
6. verificar cierre;
7. informar resultado.

Un `Stop` exitoso debe significar que el motor realmente dejó de adquirir recursos de la fuente.

---

# 44. RESOURCE LEAKS

Las pruebas deben buscar:

- handles no liberados;
- recursos gráficos no liberados;
- memoria retenida;
- goroutines activas;
- objetos nativos vivos;
- buffers retenidos;
- recursos de captura abiertos.

Especial atención debe darse a:

```text
START → STOP → START → STOP
```

repetido múltiples veces.

---

# 45. LONG SESSION

Debe probarse el comportamiento durante sesiones prolongadas.

La prueba deberá buscar:

- crecimiento de memoria;
- degradación de FPS;
- acumulación de buffers;
- pérdida progresiva de frames;
- degradación temporal;
- recursos no liberados;
- errores acumulativos.

La duración definitiva de la prueba queda:

`TBD`

---

# 46. TESTING

Las pruebas deberán cubrir al menos:

### Unitarias

- configuración de captura;
- validación de fuentes;
- estados;
- timing;
- errores;
- límites.

### Integración

- fuente real;
- captura real;
- monitor real;
- ventana real;
- región real.

### Stress

- alta resolución;
- alta tasa de frames;
- múltiples monitores;
- sesiones prolongadas;
- carga elevada.

### Recovery

- desconexión de fuente;
- cambios de resolución;
- cambios de monitor;
- cierre de ventana;
- errores de adquisición.

---

# 47. HARDWARE TESTING

No debe considerarse suficiente una prueba exclusivamente sintética.

La validación final debe incluir hardware real compatible con el alcance definido.

Debe contemplarse, según disponibilidad:

- un solo monitor;
- múltiples monitores;
- distintas resoluciones;
- escalado;
- GPU diferente;
- carga de CPU;
- cambios dinámicos.

El inventario real de hardware de prueba queda:

`TBD`

---

# 48. ACCEPTANCE CRITERIA

La fase podrá considerarse técnicamente candidata a cierre cuando exista evidencia de que:

- [ ] una fuente válida puede iniciar captura;
- [ ] se producen frames reales;
- [ ] los frames poseen información temporal válida;
- [ ] los frames mantienen orden coherente;
- [ ] el motor puede detenerse correctamente;
- [ ] los recursos se liberan;
- [ ] no existen pérdidas de memoria conocidas;
- [ ] no existen goroutines huérfanas conocidas;
- [ ] la captura multimonitor ha sido probada;
- [ ] la captura de ventana ha sido probada;
- [ ] la captura de región ha sido probada;
- [ ] los errores relevantes están controlados;
- [ ] existe estrategia ante pérdida de fuente;
- [ ] el buffering está limitado;
- [ ] el backpressure está definido;
- [ ] el comportamiento de larga duración ha sido evaluado;
- [ ] las pruebas críticas fueron ejecutadas;
- [ ] existe evidencia reproducible;
- [ ] la trazabilidad está actualizada.

---

# 49. EVIDENCE REQUIRED

Para cerrar la fase deberá existir evidencia suficiente, como mínimo:

```text
BUILD
TEST RESULTS
CAPTURE TEST RESULTS
PERFORMANCE RESULTS
RESOURCE RESULTS
ERROR/RECOVERY RESULTS
HARDWARE TEST RESULTS
TRACEABILITY
VALIDATION REPORT
```

No se debe completar una casilla simplemente porque "funciona en teoría".

---

# 50. CERTIFICATION

La FASE 03 no se considera certificada por:

- compilar;
- iniciar;
- capturar una imagen;
- pasar una prueba aislada.

La certificación requiere:

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

Cada etapa debe estar respaldada por evidencia.

---

# 51. TRAZABILIDAD

La trazabilidad deberá conectar los requisitos relevantes con:

```text
REQUIREMENT
    ↓
ARCHITECTURE
    ↓
CAPTURE MODULE
    ↓
CAPTURE COMPONENTS
    ↓
PHASE-03
    ↓
IMPLEMENTATION
    ↓
TEST
    ↓
EVIDENCE
    ↓
VALIDATION
```

Los IDs concretos deberán vincularse con `docs/development/TRACEABILITY.md`.

---

# 52. RIESGOS

## RISK-CAP-001 — API Inadecuada

La tecnología seleccionada puede no proporcionar estabilidad o rendimiento suficiente.

**Mitigación:** evaluación técnica y pruebas reales.

## RISK-CAP-002 — Frame Drops

La captura puede perder frames bajo carga.

**Mitigación:** medición, buffering controlado y backpressure.

## RISK-CAP-003 — Memory Growth

Buffers o recursos nativos pueden provocar crecimiento de memoria.

**Mitigación:** límites y pruebas de larga duración.

## RISK-CAP-004 — Platform Scaling

DPI/scaling puede provocar regiones incorrectas.

**Mitigación:** pruebas con diferentes escalas.

## RISK-CAP-005 — Source Loss

Una fuente puede desaparecer durante la sesión.

**Mitigación:** detección y estrategia de recuperación.

## RISK-CAP-006 — GPU Dependency

Una ruta dependiente de GPU puede fallar en hardware determinado.

**Mitigación:** fallback y validación.

---

# 53. DECISIONES

| Decisión | Estado |
|---|---|
| Windows como plataforma inicial | `DECIDED` |
| Captura de pantalla | `REQUIRED` |
| Multimonitor | `REQUIRED` |
| Captura de ventana | `REQUIRED` |
| Captura de región | `REQUIRED` |
| Frames con información temporal | `REQUIRED` |
| Buffering limitado | `REQUIRED` |
| Backpressure | `REQUIRED` |
| Ownership de recursos | `REQUIRED` |
| Recuperación ante pérdida de fuente | `REQUIRED` |
| API de captura Windows | `TBD` |
| Representación interna del frame | `TBD` |
| Estrategia GPU/CPU | `TBD` |
| Política de frame drops | `TBD` |
| Política de recovery | `TBD` |
| Fuente temporal | `TBD` |
| Estrategia de buffering | `TBD` |
| Contrato con Processing | `TBD` |
| Contrato con Recording | `TBD` |

---

# 54. DEPENDENCIAS

Dependencias conceptuales:

```text
PHASE-00 CONTRACT
       ↓
PHASE-01 FOUNDATION
       ↓
PHASE-02 DISPLAY DETECTION
       ↓
PHASE-03 CAPTURE ENGINE
```

Consumidores principales:

```text
PROCESSING
RECORDING
SYNCHRONIZATION
ENCODING
```

Las dependencias físicas y paquetes concretos quedan pendientes de implementación.

---

# 55. ESTADO DE LA FASE

Actualmente:

```text
PHASE             = PHASE-03
NAME              = CAPTURE ENGINE

STATUS            = PLANNED

IMPLEMENTATION    = NOT IMPLEMENTED
TESTING           = NOT EXECUTED
EVIDENCE          = NOT GENERATED
VALIDATION        = NOT VALIDATED
CERTIFICATION     = NOT CERTIFIED
INTEGRATION       = NOT INTEGRATED
```

Este documento describe el trabajo requerido.

No constituye evidencia de que el Capture Engine exista.

---

# 56. CRITERIO DE BLOQUEO

La fase deberá declararse:

`BLOCKED`

si:

- el contrato de fuentes no está definido;
- la API de captura no puede seleccionarse con evidencia suficiente;
- existen incompatibilidades críticas de plataforma;
- la captura real no puede validarse;
- existe pérdida de frames no controlada;
- existen fugas de recursos;
- el timing no es confiable;
- no existe estrategia de backpressure;
- el comportamiento multimonitor no es reproducible;
- la recuperación de errores críticos no está definida;
- falta hardware necesario para una validación requerida.

---

# 57. REPORTE DE CIERRE

Al terminar la fase deberá existir un reporte con:

```text
PHASE:
PHASE-03 CAPTURE ENGINE

STATUS:
...

IMPLEMENTATION:
...

CAPTURE API:
...

SOURCES TESTED:
...

RESOLUTIONS TESTED:
...

FRAME RATES TESTED:
...

FRAME DROPS:
...

CPU:
...

GPU:
...

MEMORY:
...

LONG SESSION:
...

RECOVERY:
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

Los valores deberán ser reales y reproducibles.

---

# 58. REGLA SUPREMA

> **El Capture Engine debe capturar lo que realmente existe en la fuente, mantener la integridad temporal de los frames y liberar correctamente todos sus recursos.**

No se acepta:

```text
FAKE CAPTURE
FAKE FPS
FAKE PERFORMANCE
FAKE COMPATIBILITY
FAKE RECOVERY
FAKE TESTS
FAKE EVIDENCE
FAKE CERTIFICATION
```

La fase sólo avanza mediante:

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

**PHASE-03 CAPTURE ENGINE permanece `PLANNED` hasta que exista implementación real, pruebas reales y evidencia verificable.**