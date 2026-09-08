# FASE 06 — RECORDING ENGINE

## SCREEN by KLIK

**Producto:** SCREEN by KLIK  
**Fase:** PHASE-06  
**Nombre:** RECORDING ENGINE  
**Propósito:** Orquestación integral de una sesión de grabación  
**Plataforma inicial:** Windows  
**Lenguaje objetivo:** Go  
**Estado:** PLANNED  
**Implementación:** NOT IMPLEMENTED  
**Pruebas:** NOT EXECUTED  
**Validación:** NOT VALIDATED  
**Certificación:** NOT CERTIFIED  

---

# 1. PROPÓSITO

La FASE 06 define el **Recording Engine**, responsable de coordinar una sesión completa de grabación.

El Recording Engine no debe convertirse en dueño de todas las tecnologías de captura.

Su responsabilidad principal será **orquestar el ciclo de vida de la sesión y coordinar los subsistemas especializados**.

---

# 2. OBJETIVO

Una sesión debe poder recorrer de manera controlada:

```text
IDLE
 ↓
STARTING
 ↓
RECORDING
 ↓
PAUSED ↔ RECORDING
 ↓
STOPPING
 ↓
FINALIZING
 ↓
VALIDATING
 ↓
COMPLETED
```

Y contemplar rutas anormales:

```text
FAILED
CANCELLED
RECOVERY
```

---

# 3. RESPONSABILIDADES

El Recording Engine deberá coordinar conceptualmente:

- configuración efectiva;
- selección de fuentes;
- Capture;
- Audio;
- Camera cuando corresponda;
- Processing;
- Synchronization;
- Encoding;
- Output;
- Recovery;
- Diagnostics.

No deberá absorber responsabilidades especializadas innecesariamente.

---

# 4. FUERA DE ALCANCE

No corresponde directamente:

- implementación del capture API;
- detección de displays;
- implementación del encoder;
- procesamiento visual;
- captura de audio;
- captura de micrófono;
- implementación de cámara;
- UI;
- hotkeys;
- selector de región;
- overlays;
- anotaciones;
- packaging.

---

# 5. PRINCIPIO DE ORQUESTACIÓN

Conceptualmente:

```text
             APPLICATION
                  │
                  ▼
          RECORDING ENGINE
          /       |       \
         /        |        \
   CAPTURE      AUDIO     CAMERA
         \        |        /
          \       |       /
           ▼      ▼      ▼
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

El Recording Engine coordina.

Los subsistemas especializados ejecutan sus responsabilidades.

---

# 6. ESTADOS

## 6.1 IDLE

No existe una sesión activa.

## 6.2 STARTING

Se preparan recursos.

## 6.3 RECORDING

La sesión está activa.

## 6.4 PAUSED

La grabación está pausada conforme a la política definida.

## 6.5 STOPPING

Se detiene la adquisición.

## 6.6 FINALIZING

Se drenan y finalizan los componentes pendientes.

## 6.7 VALIDATING

Se verifica el resultado.

## 6.8 COMPLETED

La sesión finalizó correctamente.

---

# 7. ESTADOS ANORMALES

### FAILED

Existe un error que impide continuar normalmente.

### CANCELLED

La sesión fue cancelada explícitamente.

### RECOVERY

Existe una situación que requiere recuperación o finalización controlada.

---

# 8. TRANSICIONES

No deberán existir transiciones arbitrarias.

Ejemplo:

```text
IDLE → STARTING
STARTING → RECORDING
STARTING → FAILED

RECORDING → PAUSED
RECORDING → STOPPING
RECORDING → FAILED

PAUSED → RECORDING
PAUSED → STOPPING
PAUSED → FAILED

STOPPING → FINALIZING
FINALIZING → VALIDATING
FINALIZING → FAILED

VALIDATING → COMPLETED
VALIDATING → FAILED
```

Las transiciones exactas deberán validarse durante implementación.

---

# 9. START

El inicio debe seguir una secuencia controlada:

```text
REQUEST
  ↓
VALIDATE CONFIGURATION
  ↓
VALIDATE SOURCES
  ↓
INITIALIZE COMPONENTS
  ↓
START PIPELINE
  ↓
CONFIRM ACTIVE STATE
```

No deberá reportarse `RECORDING` antes de que los componentes críticos estén realmente activos.

---

# 10. STOP

El cierre deberá distinguir:

```text
STOP REQUEST
     ↓
STOP ACQUISITION
     ↓
DRAIN PIPELINE
     ↓
FLUSH ENCODING
     ↓
FINALIZE OUTPUT
     ↓
VALIDATE RESULT
```

---

# 11. PAUSE / RESUME

La pausa deberá respetar:

- audio;
- video;
- timestamps;
- encoder;
- estado de sesión;
- recursos;
- output.

La estrategia exacta de pausa queda:

**TBD**

No se asumirá que pausar significa simplemente detener todos los threads.

---

# 12. SINCRONIZACIÓN

Recording Engine debe coordinar la disponibilidad de:

- video;
- system audio;
- microphone;
- camera.

No debe implementar por sí mismo la lógica especializada de sincronización.

Debe garantizar que el pipeline reciba la información temporal requerida.

---

# 13. ENCODING

Recording Engine deberá controlar conceptualmente:

```text
INPUT READY
   ↓
ENCODER ACTIVE
   ↓
DATA FLOW
   ↓
STOP INPUT
   ↓
FLUSH
   ↓
DRAIN
```

No debe cerrar prematuramente el encoder.

---

# 14. OUTPUT

El Recording Engine coordina el cierre, pero Output mantiene la responsabilidad sobre:

- archivos temporales;
- escritura;
- finalización;
- validación;
- resultado final.

---

# 15. RECOVERY

La recuperación deberá contemplar:

- fallo durante inicio;
- fallo durante recording;
- fallo durante pause;
- fallo durante stop;
- fallo de encoder;
- fallo de output;
- pérdida de dispositivo;
- cancelación;
- cierre inesperado.

No se deberá garantizar recuperación de un escenario que no haya sido probado.

---

# 16. RECURSOS

El Recording Engine debe conocer qué recursos existen y quién es responsable de liberarlos.

Principio:

```text
CREATOR / OWNER
       ↓
RESOURCE LIFECYCLE
       ↓
RELEASE
```

Debe evitarse:

- doble liberación;
- recursos huérfanos;
- sesiones parcialmente activas;
- procesos persistentes;
- handles abiertos.

---

# 17. CONCURRENCIA

Debe existir un único modelo coherente para las transiciones de estado.

Debe protegerse:

- estado de sesión;
- cancelación;
- stop;
- pause/resume;
- errores concurrentes;
- finalización.

Debe evitarse:

- race conditions;
- deadlocks;
- double stop;
- double finalize;
- finalización concurrente.

---

# 18. BACKPRESSURE

El Recording Engine deberá coordinar el comportamiento ante:

```text
CAPTURE > PROCESSING
PROCESSING > ENCODING
ENCODING > OUTPUT
```

Las políticas concretas quedan:

**TBD**

No deberá permitirse crecimiento indefinido de memoria.

---

# 19. ERRORES

Todo error relevante deberá conservar:

- contexto;
- componente;
- operación;
- estado de sesión;
- severidad;
- posibilidad de recuperación.

Los errores críticos deben provocar una transición definida.

---

# 20. CANCELACIÓN

La cancelación debe:

1. detener producción;
2. impedir nuevas operaciones;
3. cerrar el pipeline;
4. liberar recursos;
5. determinar si existe resultado recuperable;
6. reportar estado final.

---

# 21. DIAGNÓSTICOS

El Recording Engine debe poder responder:

- ¿hay sesión activa?
- ¿en qué estado está?
- ¿qué fuente está activa?
- ¿qué componentes están activos?
- ¿ocurrió fallback?
- ¿existen errores?
- ¿está finalizando?
- ¿el resultado fue validado?

---

# 22. SEGURIDAD

No deberá permitirse:

- iniciar una fuente no autorizada por configuración;
- escribir fuera de las rutas permitidas;
- transmitir contenido;
- utilizar recursos sin validación;
- ocultar errores críticos.

---

# 23. PRIVACIDAD

El Recording Engine controla contenido potencialmente sensible.

Debe respetar:

- captura explícita;
- configuración explícita;
- almacenamiento local;
- ausencia de transmisión automática;
- diagnóstico sin exposición innecesaria del contenido.

---

# 24. PRUEBAS

Se deberán probar como mínimo:

### Lifecycle

- start;
- record;
- pause;
- resume;
- stop;
- cancel;
- failure.

### Pipeline

- video;
- audio;
- camera;
- processing;
- sync;
- encoding;
- output.

### Recovery

- fallo de captura;
- fallo de audio;
- fallo de encoder;
- fallo de output;
- dispositivo desconectado;
- cancelación.

### Stability

- sesiones prolongadas;
- repetición de start/stop;
- repetición de pause/resume.

---

# 25. INTEGRACIÓN

Esta fase constituye un punto fundamental de integración entre múltiples fases.

```text
PHASE 02 → DISPLAY
PHASE 03 → CAPTURE
PHASE 04 → AUDIO
PHASE 05 → ENCODING
PHASE 06 → RECORDING ENGINE
```

Las fases posteriores dependerán progresivamente de este motor.

---

# 26. CRITERIOS DE ENTRADA

- Phase 01 foundation disponible;
- contratos de componentes disponibles;
- Phase 03 capture disponible cuando corresponda;
- Phase 04 audio disponible cuando corresponda;
- Phase 05 encoding disponible;
- Output definido;
- Synchronization definido;
- Recovery definido conceptualmente.

---

# 27. CRITERIOS DE SALIDA

La fase requiere:

- lifecycle implementado;
- estados validados;
- start validado;
- stop validado;
- pause/resume validado;
- cancelación validada;
- errores validados;
- recovery probado;
- integración con componentes críticos;
- finalización correcta;
- resultado validado;
- evidencia reproducible.

---

# 28. EVIDENCIA

Debe existir evidencia de:

- cada transición crítica;
- sesiones exitosas;
- sesiones fallidas;
- cancelación;
- pausa/resume;
- finalización;
- recuperación;
- integridad del resultado.

---

# 29. TRAZABILIDAD

```text
REQUIREMENT
   ↓
ARCHITECTURE
   ↓
MODULE
   ↓
COMPONENT
   ↓
PHASE-06
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

# 30. RIESGOS

- complejidad excesiva del orquestador;
- lifecycle inconsistente;
- race conditions;
- deadlocks;
- finalización incompleta;
- pérdida de datos;
- errores ocultos;
- recovery insuficiente;
- dependencia excesiva entre módulos.

---

# 31. DECISIONES

| Decisión | Estado |
|---|---|
| Recording Engine como orquestador | DEFINIDO |
| Lifecycle explícito | REQUIRED |
| State machine | REQUIRED |
| Pause/resume | REQUIRED |
| Cancellation | REQUIRED |
| Recovery | REQUIRED |
| Encoding ownership | DELEGATED |
| Output ownership | DELEGATED |
| Capture ownership | DELEGATED |
| Audio ownership | DELEGATED |
| UI ownership | NOT ALLOWED |
| Concrete implementation | TBD |

---

# 32. ESTADO ACTUAL

**FASE 06 — PLANNED**

No existe evidencia para declarar implementación, pruebas, validación o certificación.

---

# 33. REGLA SUPREMA

> **El Recording Engine coordina la grabación; no debe convertirse en un contenedor monolítico de toda la aplicación.**