# FASE 02 — DISPLAY DETECTION

## SCREEN by KLIK

**Proyecto:** SCREEN by KLIK  
**Producto:** Screen Recorder  
**Fase:** PHASE-02  
**Nombre:** DISPLAY DETECTION  
**Tipo:** Detección e inventario de fuentes de pantalla  
**Plataforma inicial:** Windows  
**Lenguaje objetivo:** Go  
**Estado:** `PLANNED`  
**Implementación:** `NOT IMPLEMENTED`  
**Testing:** `NOT EXECUTED`  
**Validation:** `NOT VALIDATED`  
**Certification:** `NOT CERTIFIED`

---

# 1. PROPÓSITO

La FASE 02 establece la capacidad de SCREEN by KLIK para **detectar, identificar, describir y mantener actualizado el inventario de fuentes de pantalla disponibles en el sistema**.

Esta fase constituye el puente entre la fundación de la aplicación y el futuro motor de captura.

La responsabilidad principal es:

```text
WINDOWS
   ↓
DISPLAY / WINDOW SOURCES
   ↓
DETECTION
   ↓
SOURCE INVENTORY
   ↓
SOURCE SELECTION
   ↓
PHASE-03 CAPTURE ENGINE
```

Esta fase **no captura video**.

Su trabajo consiste en conocer qué fuentes existen y proporcionar información confiable para que otra parte del sistema pueda seleccionar una fuente válida.

---

# 2. OBJETIVO

La fase debe establecer una capacidad verificable para:

- detectar monitores;
- identificar displays;
- obtener sus características relevantes;
- distinguir fuentes;
- detectar cambios en el entorno de displays;
- representar fuentes de manera consistente;
- detectar disponibilidad;
- detectar desaparición de fuentes;
- soportar múltiples monitores;
- proporcionar información para selección posterior;
- mantener separación entre detección y captura;
- proporcionar un contrato claro para `PHASE-03`.

---

# 3. ALCANCE

## 3.1 Incluido

La fase contempla:

1. Display Detection.
2. Display Enumeration.
3. Display Identification.
4. Display Metadata.
5. Resolution Detection.
6. Position Detection.
7. Primary Display Detection.
8. Multi-monitor Detection.
9. Display Availability.
10. Display Changes.
11. Source Inventory.
12. Source Identity.
13. Source Validation.
14. Detection Diagnostics.
15. Error Handling.
16. Platform Boundary.
17. Testing.
18. Hardware Validation.
19. Evidence.

---

# 4. FUERA DE ALCANCE

Esta fase no implementa como responsabilidad principal:

- captura de frames;
- grabación de video;
- encoding;
- codecs;
- audio;
- micrófono;
- cámara;
- procesamiento de imagen;
- composición;
- cursor;
- overlays;
- annotations;
- watermark;
- escritura del video;
- exportación;
- streaming;
- cloud;
- publicación;
- UI completa.

La captura pertenece a:

`PHASE-03-CAPTURE-ENGINE`

---

# 5. DOCUMENTOS RELACIONADOS

Documentos principales:

```text
README.md
docs/requirements/REQUIREMENTS.md
docs/architecture/ARCHITECTURE.md
docs/development/CONTRACT.md
docs/development/MODULES.md
docs/components/COMPONENTS.md
docs/technical/CAPTURE.md
docs/technical/SCREEN-SOURCES.md
docs/technical/REGION-SELECTOR.md
docs/platform/DESKTOP/WINDOWS.md
docs/testing/TESTING.md
```

La documentación técnica no puede contradecir los requisitos ni la arquitectura superior.

---

# 6. RELACIÓN CON FASE 01

La dependencia conceptual es:

```text
PHASE-01 FOUNDATION
        ↓
PHASE-02 DISPLAY DETECTION
        ↓
PHASE-03 CAPTURE ENGINE
```

La FASE 01 proporciona:

- ciclo de vida;
- configuración;
- errores;
- diagnóstico;
- boundary de plataforma.

La FASE 02 utiliza esa fundación para realizar detección controlada de fuentes.

---

# 7. RELACIÓN CON FASE 03

La FASE 02 produce información que será consumida por el Capture Engine.

Conceptualmente:

```text
PHASE-02
DISPLAY DETECTION
       │
       ▼
SOURCE INVENTORY
       │
       ▼
SOURCE SELECTION
       │
       ▼
PHASE-03
CAPTURE ENGINE
```

La FASE 02 no debe asumir que detectar una fuente implica que puede capturarse.

Estas son condiciones distintas:

```text
DETECTED
   ≠
AVAILABLE
   ≠
CAPTURABLE
   ≠
VALIDATED
```

---

# 8. PRINCIPIO FUNDAMENTAL

El sistema debe diferenciar entre:

### Detección

"El sistema operativo reporta que esta fuente existe."

### Disponibilidad

"La fuente está actualmente disponible para ser utilizada."

### Capturabilidad

"La tecnología de captura seleccionada puede utilizarla."

### Validación

"Se ha demostrado mediante pruebas que la captura funciona."

No deben mezclarse estos estados.

---

# 9. DISPLAY ENUMERATION

La aplicación debe poder enumerar los displays disponibles.

Conceptualmente:

```text
DISPLAY INVENTORY

DISPLAY 1
DISPLAY 2
DISPLAY 3
...
```

La enumeración debe ser reproducible dentro de las condiciones del sistema probado.

El mecanismo específico de Windows queda:

`TBD`

---

# 10. DISPLAY IDENTITY

Cada display debe poder distinguirse de los demás.

La identidad debe evitar depender exclusivamente de:

- posición;
- resolución;
- nombre visible;
- orden de enumeración.

La estrategia de identidad persistente queda:

`TBD`

Debe considerarse que el orden de enumeración puede cambiar.

---

# 11. DISPLAY METADATA

El inventario debe poder representar información relevante del display.

Dependiendo de las capacidades reales de la plataforma, podrá incluir:

- identificador;
- nombre;
- posición;
- ancho;
- alto;
- resolución;
- orientación;
- display primario;
- escala;
- disponibilidad;
- características necesarias para captura.

Los campos definitivos serán establecidos durante implementación.

---

# 12. RESOLUTION

La detección debe obtener la resolución efectiva reportada por el sistema.

Conceptualmente:

```text
WIDTH
HEIGHT
```

No se debe confundir:

- resolución física;
- área de trabajo;
- coordenadas virtuales;
- escala DPI.

La representación exacta debe definirse mediante el contrato técnico de plataforma.

---

# 13. VIRTUAL DESKTOP

En configuraciones multimonitor, Windows puede representar los displays dentro de un espacio virtual.

Conceptualmente:

```text
                DISPLAY 2
             ┌──────────────┐
             │              │
             │              │
┌────────────┴──────────────┤
│ DISPLAY 1                 │
│                           │
│                           │
└───────────────────────────┘
```

La aplicación debe poder representar posiciones que no necesariamente comienzan en `(0,0)`.

Debe contemplarse:

- monitores a la izquierda;
- monitores a la derecha;
- monitores encima;
- monitores debajo;
- configuraciones asimétricas.

---

# 14. MULTI-MONITOR

El soporte multimonitor es requisito de SCREEN.

La detección debe poder identificar:

```text
N = número de displays detectados
```

y representar cada display individualmente.

Debe comprobarse:

- uno;
- dos;
- tres o más cuando el hardware de prueba lo permita.

La capacidad real máxima validada deberá registrarse como evidencia.

---

# 15. PRIMARY DISPLAY

Debe identificarse cuál display está configurado como primario.

Conceptualmente:

```text
DISPLAY A → PRIMARY
DISPLAY B → SECONDARY
DISPLAY C → SECONDARY
```

La aplicación no debe asumir que el primer display enumerado es el primario.

---

# 16. DISPLAY POSITION

La posición debe formar parte del inventario cuando sea necesaria para selección y captura.

Debe contemplarse:

```text
X
Y
WIDTH
HEIGHT
```

Los valores pueden incluir coordenadas negativas en un escritorio virtual.

Por tanto:

```text
X < 0
```

no debe interpretarse automáticamente como error.

---

# 17. ORIENTATION

La orientación del display debe detectarse cuando la plataforma lo permita.

Ejemplos:

```text
LANDSCAPE
PORTRAIT
ROTATED
```

Los estados concretos dependen de la API utilizada.

La aplicación no debe inventar una orientación si Windows no proporciona información suficiente.

---

# 18. DPI Y SCALING

La detección debe considerar el impacto del escalado de Windows.

Debe distinguirse entre:

```text
LOGICAL COORDINATES
```

y:

```text
PHYSICAL COORDINATES
```

cuando corresponda.

Este aspecto es crítico para:

- selección de región;
- captura;
- posicionamiento;
- UI;
- múltiples monitores con diferentes escalas.

La estrategia exacta queda:

`TBD`

---

# 19. DISPLAY AVAILABILITY

Una fuente detectada debe tener un estado de disponibilidad.

Conceptualmente:

```text
DETECTED
AVAILABLE
UNAVAILABLE
REMOVED
UNKNOWN
```

Los estados definitivos deberán establecerse durante implementación.

---

# 20. HOT-PLUG

La arquitectura debe contemplar cambios dinámicos:

```text
DISPLAY CONNECTED
DISPLAY DISCONNECTED
DISPLAY CHANGED
```

Ejemplos:

- conectar monitor;
- desconectar monitor;
- cambiar resolución;
- cambiar orientación;
- cambiar escala;
- modificar configuración de escritorio.

La política de actualización del inventario queda:

`TBD`

---

# 21. REFRESH

El inventario debe poder actualizarse cuando corresponda.

La actualización podrá ser:

- explícita;
- provocada por eventos;
- solicitada por la aplicación;
- realizada al iniciar una sesión;
- realizada cuando cambie el entorno.

No debe implementarse polling continuo sin justificar su necesidad.

---

# 22. EVENT-DRIVEN VS POLLING

Debe evaluarse:

```text
EVENT-DRIVEN
```

frente a:

```text
POLLING
```

La decisión debe considerar:

- confiabilidad;
- complejidad;
- consumo;
- latencia;
- comportamiento ante cambios;
- compatibilidad con Windows.

Estado actual:

`TBD`

---

# 23. SOURCE INVENTORY

El inventario representa el estado conocido de las fuentes.

Conceptualmente:

```text
SOURCE INVENTORY
│
├── DISPLAY 1
├── DISPLAY 2
├── DISPLAY 3
└── ...
```

Debe existir una diferencia clara entre:

```text
CURRENT INVENTORY
```

y:

```text
HISTORICAL / LOGGED INFORMATION
```

El inventario no debe convertirse en un sistema histórico innecesario.

---

# 24. SOURCE TYPES

La arquitectura general contempla distintas fuentes potenciales.

Como mínimo, el proyecto deberá diferenciar conceptualmente:

```text
DISPLAY
WINDOW
REGION
```

Sin embargo, esta fase se centra principalmente en la detección de displays.

La detección de ventanas podrá requerir mecanismos adicionales y será coordinada con los documentos técnicos correspondientes.

---

# 25. WINDOW DETECTION BOUNDARY

La captura de ventanas no debe confundirse con detección de displays.

Conceptualmente:

```text
DISPLAY DETECTION
        │
        └── DISPLAY SOURCES

WINDOW SOURCE DETECTION
        │
        └── WINDOW SOURCES
```

Si la detección de ventanas requiere una capacidad independiente, deberá quedar explícitamente definida.

No debe introducirse en esta fase por simple conveniencia.

---

# 26. REGION SOURCE

Una región normalmente depende de otra fuente.

Conceptualmente:

```text
DISPLAY / WINDOW
      ↓
REGION
```

Por ello, la FASE 02 debe proporcionar información espacial suficientemente confiable para que el selector de regiones pueda operar posteriormente.

---

# 27. SOURCE VALIDATION

Antes de entregar una fuente al siguiente módulo, debe verificarse que la información mínima requerida esté disponible.

Conceptualmente:

```text
DETECTED
   ↓
VALIDATE
   ↓
AVAILABLE
```

Una fuente inválida debe producir un estado explícito.

---

# 28. SOURCE DISAPPEARANCE

Si una fuente desaparece:

```text
AVAILABLE
    ↓
DISAPPEARED
```

el sistema debe poder detectarlo.

La FASE 02 debe comunicar la condición a la capa superior.

La decisión de qué hacer durante una grabación corresponde principalmente a:

`PHASE-03`

y posteriormente al Recording Engine.

---

# 29. CHANGE DETECTION

Debe ser posible detectar cambios relevantes.

Ejemplos:

```text
RESOLUTION_CHANGED
POSITION_CHANGED
ORIENTATION_CHANGED
SCALE_CHANGED
DISPLAY_ADDED
DISPLAY_REMOVED
```

Los identificadores anteriores son categorías conceptuales y no constituyen nombres de código aprobados.

---

# 30. STABILITY

El inventario debe mantener consistencia durante su ciclo de vida.

No debe ocurrir que una misma fuente aparezca simultáneamente como:

```text
AVAILABLE
```

y:

```text
REMOVED
```

sin una explicación temporal o de sincronización.

---

# 31. CONCURRENCIA

Si el inventario puede ser consultado mientras se actualiza, debe existir una estrategia segura de concurrencia.

Debe evitarse:

- lectura inconsistente;
- escritura concurrente sin protección;
- estado global mutable;
- referencias inválidas;
- inventarios parcialmente actualizados.

La estrategia concreta queda:

`TBD`

---

# 32. RESOURCE OWNERSHIP

La detección debe dejar claro quién es propietario de:

- handles;
- recursos nativos;
- callbacks;
- estructuras de plataforma;
- listeners de eventos;
- caches temporales.

Todo recurso debe tener ciclo de vida definido.

---

# 33. PLATFORM BOUNDARY

Las APIs específicas de Windows deben mantenerse dentro del boundary de plataforma.

Conceptualmente:

```text
APPLICATION
     │
     ▼
DISPLAY DETECTION
     │
     ▼
PLATFORM BOUNDARY
     │
     ▼
WINDOWS
```

El resto de la aplicación no debería depender directamente de detalles nativos innecesarios.

---

# 34. WINDOWS API

La API concreta de Windows para enumeración de displays queda:

`TBD`

Debe evaluarse considerando:

- soporte del sistema objetivo;
- estabilidad;
- información disponible;
- DPI;
- multimonitor;
- orientación;
- cambios dinámicos;
- compatibilidad con futura captura.

No se debe seleccionar una API antes de completar su evaluación.

---

# 35. PERFORMANCE

La detección de displays debe tener un impacto reducido sobre el sistema.

Deben evaluarse:

- tiempo de enumeración;
- consumo de CPU;
- consumo de memoria;
- frecuencia de actualización;
- impacto de eventos;
- comportamiento con múltiples displays.

No se establecen cifras de rendimiento antes de medirlas.

---

# 36. ERROR HANDLING

Deben contemplarse errores como:

```text
DETECTION_FAILED
PLATFORM_QUERY_FAILED
INVALID_DISPLAY_DATA
DISPLAY_UNAVAILABLE
INVENTORY_UPDATE_FAILED
SOURCE_STATE_UNKNOWN
```

Son categorías conceptuales.

Los identificadores definitivos quedan pendientes.

---

# 37. FAILURE POLICY

Si no puede determinarse correctamente el inventario:

```text
DETECTION FAILURE
       ↓
REPORT
       ↓
SAFE STATE
```

No se debe devolver información falsa para permitir que la aplicación continúe.

---

# 38. DIAGNOSTICS

Los diagnósticos deberán poder informar, cuando corresponda:

- número de displays detectados;
- cambios detectados;
- fallos de enumeración;
- fuente seleccionada;
- fuente desaparecida;
- problemas de información;
- estado del inventario.

No se debe registrar información innecesaria.

---

# 39. PRIVACY

La detección de displays debe operar localmente.

No requiere:

- Internet;
- cloud;
- cuenta externa;
- transmisión de información.

Los datos de inventario deben utilizarse únicamente para las funciones necesarias de SCREEN.

---

# 40. SECURITY

La detección debe ejecutarse con el mínimo privilegio necesario.

No debe solicitar:

- privilegios administrativos;
- acceso innecesario;
- servicios externos.

Las APIs nativas deben utilizarse de manera controlada.

---

# 41. TESTING

Las pruebas deben comprobar:

### Single Display

- [ ] un display es detectado;
- [ ] sus características básicas son coherentes;
- [ ] puede identificarse el display primario.

### Multi Display

- [ ] dos displays;
- [ ] tres o más cuando sea posible;
- [ ] posiciones diferentes;
- [ ] resoluciones diferentes;
- [ ] escalas diferentes.

### Dynamic Changes

- [ ] conexión de display;
- [ ] desconexión;
- [ ] cambio de resolución;
- [ ] cambio de orientación;
- [ ] cambio de escala.

---

# 42. DPI TESTING

Debe probarse al menos una configuración con escalado distinto de 100%.

Cuando sea posible, deberá probarse una configuración donde distintos monitores utilicen escalas diferentes.

El objetivo es verificar que las coordenadas y dimensiones no se interpreten incorrectamente.

---

# 43. NEGATIVE TESTING

Debe probarse el comportamiento cuando:

- no existe información válida;
- una consulta nativa falla;
- un display desaparece;
- los datos recibidos son inconsistentes;
- cambia el entorno durante una consulta.

El sistema debe fallar de forma segura.

---

# 44. HARDWARE TESTING

La validación real debe utilizar hardware físico cuando sea necesario.

La matriz exacta de hardware queda:

`TBD`

Debe registrar:

- número de displays;
- resolución;
- orientación;
- escala;
- GPU;
- sistema operativo;
- resultado;
- evidencia.

---

# 45. PERFORMANCE TESTING

La prueba debe medir al menos:

```text
ENUMERATION TIME
CPU IMPACT
MEMORY IMPACT
REFRESH COST
CHANGE DETECTION LATENCY
```

Los valores reales se obtendrán durante ejecución.

---

# 46. ACCEPTANCE CRITERIA

La fase podrá considerarse candidata a cierre cuando exista evidencia de que:

- [ ] los displays pueden enumerarse;
- [ ] cada display puede distinguirse;
- [ ] el display primario puede identificarse;
- [ ] posición y dimensiones son coherentes;
- [ ] resolución es coherente;
- [ ] configuraciones multimonitor funcionan;
- [ ] coordenadas negativas son soportadas cuando corresponda;
- [ ] DPI/scaling ha sido probado;
- [ ] cambios de configuración son detectables;
- [ ] conexión/desconexión ha sido evaluada;
- [ ] errores de plataforma están controlados;
- [ ] no existen fuentes ficticias;
- [ ] el inventario es consistente;
- [ ] existe un contrato claro para PHASE-03;
- [ ] las pruebas fueron ejecutadas;
- [ ] existe evidencia;
- [ ] la trazabilidad fue actualizada.

---

# 47. EVIDENCE REQUIRED

El cierre requiere evidencia de:

```text
DISPLAY ENUMERATION
DISPLAY IDENTIFICATION
MULTI-MONITOR
RESOLUTION
POSITION
PRIMARY DISPLAY
DPI / SCALING
DYNAMIC CHANGES
ERROR HANDLING
PERFORMANCE
HARDWARE
TRACEABILITY
VALIDATION
```

La evidencia debe ser real y reproducible.

---

# 48. TRACEABILITY

La fase debe relacionarse con los requisitos correspondientes mediante:

```text
REQUIREMENT
    ↓
ARCHITECTURE
    ↓
MODULE
    ↓
COMPONENT
    ↓
PHASE-02
    ↓
IMPLEMENTATION
    ↓
TEST
    ↓
EVIDENCE
    ↓
VALIDATION
```

La matriz definitiva se mantiene en:

`docs/development/TRACEABILITY.md`

---

# 49. RIESGOS

## RISK-DISPLAY-001 — Incorrect Coordinates

Las coordenadas pueden interpretarse incorrectamente debido a DPI/scaling.

**Mitigación:** pruebas físicas y validación de coordenadas.

## RISK-DISPLAY-002 — Unstable Identity

La identidad puede cambiar entre enumeraciones.

**Mitigación:** definir estrategia de identidad antes de certificación.

## RISK-DISPLAY-003 — Hot-Plug Race

Un display puede desaparecer durante la detección.

**Mitigación:** estados explícitos y actualización segura.

## RISK-DISPLAY-004 — API Limitations

La API seleccionada puede no proporcionar toda la información requerida.

**Mitigación:** evaluación técnica previa.

## RISK-DISPLAY-005 — Platform Leakage

Los detalles de Windows pueden contaminar capas superiores.

**Mitigación:** platform boundary.

---

# 50. DECISIONES

| Decisión | Estado |
|---|---|
| Windows como plataforma inicial | `DECIDED` |
| Detección de displays | `REQUIRED` |
| Soporte multimonitor | `REQUIRED` |
| Identificación de display primario | `REQUIRED` |
| Resolución | `REQUIRED` |
| Posición | `REQUIRED` |
| DPI/scaling | `REQUIRED` |
| Detección de cambios | `REQUIRED` |
| Detección de desconexión | `REQUIRED` |
| API Windows | `TBD` |
| Estrategia de identidad | `TBD` |
| Event-driven vs polling | `TBD` |
| Modelo de actualización | `TBD` |
| Representación física del inventario | `TBD` |
| Contrato definitivo con Capture Engine | `TBD` |

---

# 51. DEPENDENCIAS

### Entrada

```text
PHASE-00 CONTRACT
        ↓
PHASE-01 FOUNDATION
```

### Documentación

```text
REQUIREMENTS
ARCHITECTURE
MODULES
COMPONENTS
SCREEN-SOURCES
CAPTURE
WINDOWS PLATFORM
```

### Salida

```text
SOURCE INVENTORY
        ↓
PHASE-03 CAPTURE ENGINE
```

---

# 52. CRITERIOS DE BLOQUEO

La fase debe declararse:

`BLOCKED`

si:

- la plataforma no permite obtener información suficiente;
- la identidad de fuentes no puede definirse;
- DPI/scaling produce información no confiable;
- multimonitor no puede validarse;
- no existe contrato con Capture Engine;
- existen inconsistencias graves en el inventario;
- los cambios dinámicos no pueden manejarse de forma segura;
- la API seleccionada presenta limitaciones críticas;
- falta hardware necesario para validar un requisito obligatorio.

---

# 53. ARTEFACTOS ESPERADOS

Cuando se implemente la fase deberá producir:

- implementación de detección;
- pruebas;
- resultados;
- evidencia;
- información de validación;
- actualización de trazabilidad;
- documentación sincronizada.

Los nombres físicos de paquetes, archivos y tipos se definirán durante implementación.

---

# 54. ESTADO ACTUAL

```text
PHASE             = PHASE-02
NAME              = DISPLAY DETECTION

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

# 55. REPORTE DE CIERRE

Al finalizar la fase deberá existir un reporte con:

```text
PHASE:
PHASE-02 DISPLAY DETECTION

STATUS:
...

WINDOWS VERSION:
...

DISPLAYS TESTED:
...

RESOLUTIONS TESTED:
...

ORIENTATIONS TESTED:
...

SCALING TESTED:
...

MULTI-MONITOR:
...

HOT-PLUG:
...

PERFORMANCE:
...

ERROR TESTS:
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

Los valores deberán provenir de pruebas reales.

---

# 56. REGLA SUPREMA

> **DISPLAY DETECTION debe describir con precisión las fuentes que realmente existen; nunca debe inventar una fuente, una capacidad o una compatibilidad que no haya sido verificada.**

Por tanto:

```text
DETECTED ≠ CAPTURED
DETECTED ≠ CAPTURABLE
DETECTED ≠ VALIDATED
VALIDATED ≠ CERTIFIED
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

**PHASE-02 DISPLAY DETECTION permanece `PLANNED` hasta que exista implementación real, pruebas reales y evidencia verificable.**