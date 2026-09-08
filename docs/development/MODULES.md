# SCREEN by KLIK — Modules

## 1. Propósito

Este documento define la organización modular prevista para **SCREEN by KLIK**.

Su finalidad es establecer:

- responsabilidades modulares;
- límites;
- ownership;
- dependencias;
- ciclo de vida;
- interacción entre módulos;
- relación con componentes;
- relación con la plataforma;
- relación con las fases de implementación;
- estado real de cada módulo.

Este documento describe la **organización modular arquitectónica prevista**.

No constituye evidencia de que los módulos existan físicamente.

---

# 2. Autoridad del documento

Este documento está subordinado a:

```text
docs/requirements/REQUIREMENTS.md
        ↓
docs/architecture/ARCHITECTURE.md
        ↓
docs/contracts/CONTRACT.md
        ↓
MODULES.md
```

Por tanto:

- `REQUIREMENTS.md` define qué debe cumplir SCREEN.
- `ARCHITECTURE.md` define la organización arquitectónica.
- `CONTRACT.md` establece las reglas obligatorias de integridad e implementación.
- `MODULES.md` define la descomposición modular prevista.

Un módulo no podrá introducir una responsabilidad que contradiga un requisito o una decisión arquitectónica aprobada.

---

# 3. Estado general

```text
DOCUMENT: MODULES.md
PRODUCT: SCREEN by KLIK

STATE:
PLANNED

IMPLEMENTATION:
NOT IMPLEMENTED

TESTING:
NOT EXECUTED

VALIDATION:
NOT VALIDATED

CERTIFICATION:
NOT CERTIFIED
```

Los módulos descritos son conceptuales.

Las ubicaciones físicas, nombres definitivos de paquetes, interfaces y dependencias concretas deberán confirmarse durante la implementación.

---

# 4. Principios de modularidad

## 4.1 Responsabilidad única

Cada módulo deberá tener una responsabilidad principal claramente definida.

Un módulo no deberá convertirse en un contenedor general de responsabilidades ajenas.

---

## 4.2 Alta cohesión

Las responsabilidades relacionadas deberán permanecer agrupadas cuando ello mejore:

- comprensión;
- mantenimiento;
- testabilidad;
- aislamiento;
- evolución.

---

## 4.3 Bajo acoplamiento

Los módulos deberán comunicarse mediante contratos claros.

No deberán depender innecesariamente de detalles internos de otros módulos.

---

## 4.4 Aislamiento de plataforma

Las APIs y mecanismos específicos del sistema operativo deberán permanecer aislados en los límites correspondientes.

Los módulos superiores no deberán depender directamente de detalles nativos cuando una abstracción arquitectónica sea suficiente.

---

## 4.5 Ownership explícito

Todo recurso administrado deberá tener un propietario claramente identificable.

```text
RESOURCE
   ↓
OWNER
   ↓
LIFECYCLE
   ↓
RELEASE
```

No deberá existir ownership ambiguo sobre recursos críticos.

---

## 4.6 Lifecycle explícito

Los módulos que administren recursos deberán definir conceptualmente:

```text
CREATE
   ↓
INITIALIZE
   ↓
RUN
   ↓
STOP
   ↓
RELEASE
```

No todos los módulos requerirán todas las etapas.

---

## 4.7 Realidad antes que documentación

La presencia de un módulo en este documento no significa que exista.

```text
DOCUMENTED
    ≠
CREATED
    ≠
IMPLEMENTED
    ≠
TESTED
    ≠
VALIDATED
    ≠
CERTIFIED
```

---

# 5. Mapa modular conceptual

La organización modular prevista deberá reflejar la arquitectura aprobada.

```text
                         SCREEN
                           │
                           ▼
                     APPLICATION
                           │
          ┌────────────────┼────────────────┐
          │                │                │
          ▼                ▼                ▼
    CONFIGURATION          UI          DIAGNOSTICS
          │
          └───────────────┐
                          ▼
                      RECORDING
                          │
          ┌───────────────┼───────────────┐
          │               │               │
          ▼               ▼               ▼
       CAPTURE          AUDIO           CAMERA
          │               │               │
          └───────────────┼───────────────┘
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
                          │
                          ▼
                      VALIDATION
                          │
                          ▼
                    FINAL RESULT

                    RECOVERY
                       ↕
              flujo transversal de fallo

                    PLATFORM
                       ↕
        capacidades específicas del sistema
```

Este esquema es conceptual.

No establece todavía nombres físicos definitivos de paquetes o directorios.

---

# 6. Distinción entre módulos y componentes

SCREEN deberá distinguir entre:

```text
ARCHITECTURE
    ↓
MODULES
    ↓
COMPONENTS
    ↓
IMPLEMENTATION
```

Un **módulo** representa un límite de responsabilidad dentro de la organización del sistema.

Un **componente** representa una unidad funcional o técnica dentro de ese límite.

Por tanto, no todos los conceptos arquitectónicos necesitan convertirse automáticamente en un paquete físico independiente.

Ejemplo:

```text
MODULE
  ↓
CAPTURE
  ├── Monitor Capture
  ├── Window Capture
  ├── Region Capture
  └── Multi-monitor Support
```

La estructura física definitiva deberá establecerse durante la implementación.

---

# 7. Módulo `application`

## Responsabilidad

Coordinar el funcionamiento general de SCREEN.

Debe actuar como capa de coordinación y composición, no como propietario de toda la lógica funcional.

Podrá coordinar:

- configuración;
- UI;
- recording;
- diagnostics;
- lifecycle global;
- inicialización;
- cierre.

No deberá absorber la responsabilidad interna de:

- captura;
- audio;
- encoding;
- output;
- procesamiento.

## Ownership

Será responsable de la coordinación global de la aplicación.

El ownership de recursos específicos permanecerá en los módulos correspondientes.

## Entradas

Conceptualmente:

- configuración;
- comandos;
- eventos;
- señales de lifecycle.

## Salidas

Conceptualmente:

- cambios de estado;
- resultados;
- eventos;
- errores.

## Estado

```text
PLANNED
```

---

# 8. Módulo `configuration`

## Responsabilidad

Gestionar la configuración de SCREEN y separar:

```text
CONFIGURED
DEFAULT
VALIDATED
EFFECTIVE
```

Podrá incluir configuración relacionada con:

- fuente;
- monitor;
- ventana;
- región;
- resolución;
- FPS;
- calidad;
- bitrate;
- audio;
- micrófono;
- cámara;
- cursor;
- destino;
- hotkeys;
- preferencias.

## Regla

La configuración solicitada por el usuario no deberá considerarse automáticamente configuración efectiva.

Deberá existir validación cuando corresponda.

## Ownership

Responsable de la representación y ciclo de vida de la configuración bajo los contratos correspondientes.

## Estado

```text
PLANNED
```

---

# 9. Módulo `capture`

## Responsabilidad

Gestionar la adquisición de vídeo.

Incluye conceptualmente:

- descubrimiento de fuentes;
- selección de fuente;
- monitor;
- ventana;
- región;
- multimonitor;
- adquisición de frames;
- timestamps;
- detección de pérdida de frames;
- errores;
- lifecycle de captura.

## No responsabilidad

No deberá asumir:

- encoding;
- almacenamiento final;
- UI;
- configuración global;
- administración de toda la sesión.

## Ownership

Responsable de los recursos específicos utilizados durante la captura.

## Lifecycle

```text
CREATE
   ↓
INITIALIZE
   ↓
CAPTURE
   ↓
STOP
   ↓
RELEASE
```

## Estado

```text
PLANNED
```

---

# 10. Módulo `audio`

## Responsabilidad

Gestionar la adquisición de audio.

Deberá contemplar conceptualmente:

```text
SYSTEM AUDIO
MICROPHONE
```

como fuentes diferenciables.

Podrá incluir:

- descubrimiento;
- selección;
- inicialización;
- captura;
- timestamps;
- errores;
- lifecycle.

## No responsabilidad

No deberá asumir:

- encoding;
- output;
- UI;
- coordinación global de sesión.

## Ownership

Responsable de los recursos de adquisición de audio.

## Estado

```text
PLANNED
```

---

# 11. Módulo `camera`

## Responsabilidad

Gestionar la cámara como capacidad opcional.

Deberá distinguir entre:

```text
DETECTED
AVAILABLE
INITIALIZED
ACTIVE
FAILED
VALIDATED
```

cuando corresponda.

La cámara deberá permanecer desacoplada de la captura principal de pantalla.

## Ownership

Responsable de los recursos de cámara.

## Estado

```text
PLANNED
```

---

# 12. Módulo `recording`

## Responsabilidad

Gestionar el ciclo de vida de una sesión de grabación.

Estados conceptuales:

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

Estados de excepción:

```text
FAILED
CANCELLED
RECOVERY
```

## Responsabilidades

Podrá coordinar:

- captura;
- audio;
- cámara;
- procesamiento;
- sincronización;
- encoding;
- output;
- recuperación.

## Regla

`recording` coordina la sesión.

No deberá absorber la implementación interna de cada subsistema.

## Ownership

Será responsable del lifecycle de la sesión.

Los recursos específicos deberán continuar bajo ownership de sus respectivos módulos.

## Estado

```text
PLANNED
```

---

# 13. Módulo `processing`

## Responsabilidad

Gestionar transformaciones aplicadas al material antes de la codificación.

Podrá incluir:

- composición;
- escalado;
- cursor;
- overlays;
- anotaciones;
- composición de cámara;
- preparación de frames;
- transformación de streams.

## Regla

Processing no deberá convertirse en:

- capture;
- encoder;
- output;
- UI.

## Estado

```text
PLANNED
```

---

# 14. Módulo `synchronization`

## Responsabilidad

Gestionar la relación temporal entre:

```text
VIDEO
AUDIO
CAMERA
```

cuando estén activos.

Deberá trabajar con información temporal verificable.

Podrá contemplar:

- timestamps;
- time base;
- continuidad;
- pausa;
- reanudación;
- diferencias temporales;
- condiciones de pérdida de frames;
- sesiones prolongadas.

## Regla

No deberá declarar sincronización correcta sin evidencia.

## Estado

```text
PLANNED
```

---

# 15. Módulo `encoding`

## Responsabilidad

Transformar los datos preparados en una representación codificada compatible con la salida seleccionada.

Podrá gestionar:

- selección de encoder;
- parámetros;
- calidad;
- rendimiento;
- hardware acceleration;
- software fallback;
- flush;
- finalización;
- errores.

## Regla de hardware

La arquitectura deberá permitir:

```text
HARDWARE ENCODING
        ↓
FALLBACK
        ↓
SOFTWARE ENCODING
```

La implementación concreta permanece pendiente de decisión técnica.

## Estado

```text
PLANNED
```

---

# 16. Módulo `output`

## Responsabilidad

Gestionar la generación del resultado final.

Deberá contemplar conceptualmente:

```text
TEMPORARY OUTPUT
        ↓
FINALIZATION
        ↓
VALIDATION
        ↓
FINAL OUTPUT
```

Podrá gestionar:

- escritura;
- contenedor;
- archivos temporales;
- nombres;
- destino;
- cierre;
- integridad;
- resultado final.

## Regla

La creación de un archivo no implica que sea un resultado válido.

Deberán distinguirse:

```text
FILE CREATED
FILE FINALIZED
FILE VALIDATED
FILE PLAYABLE
FINAL RESULT
```

## Estado

```text
PLANNED
```

---

# 17. Módulo `recovery`

## Responsabilidad

Gestionar condiciones anormales que afecten la continuidad o finalización segura de una sesión.

Podrá intervenir ante:

- fallo de captura;
- fallo de audio;
- fallo de cámara;
- fallo de encoder;
- fallo de almacenamiento;
- pérdida de recursos;
- cancelación;
- errores irrecuperables.

## Principios

Recovery deberá priorizar:

1. preservar trabajo cuando sea posible;
2. mantener integridad;
3. liberar recursos;
4. evitar falsa finalización;
5. producir estados explícitos.

## Regla

Evitar un crash no equivale automáticamente a recuperación exitosa.

## Estado

```text
PLANNED
```

---

# 18. Módulo `platform`

## Responsabilidad

Aislar capacidades dependientes de la plataforma.

Para la primera implementación:

```text
TARGET PLATFORM
WINDOWS
```

Podrá proporcionar capacidades relacionadas con:

- captura;
- ventanas;
- monitores;
- audio;
- cámara;
- dispositivos;
- recursos nativos;
- hardware acceleration;
- filesystem;
- hotkeys;
- capacidades del sistema.

## Regla

Los detalles específicos de Windows deberán permanecer aislados de las capas superiores.

Las tecnologías concretas todavía no quedan congeladas.

## Futuro

Podrá extenderse posteriormente a:

```text
WINDOWS
LINUX
MACOS
```

sin asumir que dichas plataformas ya están implementadas.

## Estado

```text
PLANNED
```

---

# 19. Módulo `ui`

## Responsabilidad

Representar la interacción del usuario con SCREEN.

Podrá proporcionar:

- selección de fuente;
- configuración;
- controles de grabación;
- pausa;
- reanudación;
- stop;
- cancelación;
- estado;
- errores;
- preferencias;
- resultados.

## Regla crítica

La UI no deberá poseer directamente:

- recursos de captura;
- encoder;
- almacenamiento;
- pipeline de grabación.

La UI deberá comunicarse mediante los contratos correspondientes.

## Tecnología

La tecnología concreta de UI permanece:

```text
TBD
```

## Estado

```text
PLANNED
```

---

# 20. Módulo `diagnostics`

## Responsabilidad

Proporcionar información operacional y diagnóstica.

Podrá contemplar:

- estado de componentes;
- errores;
- disponibilidad;
- recursos;
- condiciones de fallo;
- eventos relevantes.

## Distinción

Diagnostics no equivale a:

```text
LOGGING
AUDIT
TELEMETRY
```

Cada mecanismo deberá conservar su responsabilidad específica.

## Estado

```text
PLANNED
```

---

# 21. Módulo `application entrypoint`

El punto de entrada de la aplicación deberá considerarse una responsabilidad de arranque, no un módulo funcional de negocio.

Conceptualmente deberá:

```text
START
  ↓
INITIALIZE
  ↓
COMPOSE
  ↓
RUN
  ↓
SHUTDOWN
```

No deberá contener lógica perteneciente a:

- capture;
- audio;
- recording;
- encoding;
- output;
- processing.

## Ubicación física

La ubicación concreta permanece:

```text
PROPOSED
```

No deberá asumirse que:

```text
cmd/screen/
```

existe actualmente.

## Estado

```text
PLANNED
```

---

# 22. Relaciones modulares

La relación conceptual principal será:

```text
APPLICATION
    │
    ├── CONFIGURATION
    ├── UI
    └── DIAGNOSTICS
            │
            ▼
        RECORDING
            │
    ┌───────┼────────┐
    │       │        │
 CAPTURE  AUDIO    CAMERA
    │       │        │
    └───────┼────────┘
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
            │
            ▼
        VALIDATION
            │
            ▼
       FINAL RESULT
```

`RECOVERY` actúa sobre los caminos de fallo.

`PLATFORM` proporciona capacidades específicas de plataforma a los módulos que las necesiten.

---

# 23. Dirección de dependencias

Las dependencias deberán orientarse para evitar acoplamiento innecesario.

Conceptualmente:

```text
HIGH LEVEL
    ↓
ABSTRACTIONS / CONTRACTS
    ↓
CAPABILITIES
    ↓
PLATFORM DETAILS
```

No deberá permitirse dependencia circular sin justificación arquitectónica.

Ejemplo prohibido:

```text
A → B
B → C
C → A
```

cuando ello pueda evitarse mediante una mejor separación de responsabilidades.

---

# 24. Regla de ownership

El ownership deberá ser explícito.

Ejemplo conceptual:

```text
Recording
    owns
    SESSION LIFECYCLE

Capture
    owns
    CAPTURE RESOURCES

Audio
    owns
    AUDIO RESOURCES

Camera
    owns
    CAMERA RESOURCES

Encoder
    owns
    ENCODER RESOURCES

Output
    owns
    OUTPUT RESOURCES
```

El ownership global de una sesión no implica ownership físico de todos sus recursos.

---

# 25. Comunicación entre módulos

La comunicación deberá producirse mediante contratos definidos.

No deberá depender innecesariamente de:

- variables globales;
- estado mutable compartido;
- acceso directo a estructuras internas;
- dependencias circulares;
- side effects ocultos.

Los mecanismos concretos de comunicación permanecen pendientes de implementación.

---

# 26. Concurrencia

Los módulos que requieran ejecución concurrente deberán definir:

- ownership;
- lifecycle;
- cancelación;
- terminación;
- errores;
- liberación de recursos;
- comportamiento ante cierre de sesión.

No deberá introducirse concurrencia únicamente para ocultar problemas de diseño.

---

# 27. Backpressure

Los módulos que produzcan o consuman streams deberán considerar explícitamente:

```text
PRODUCER
   ↓
BUFFER
   ↓
CONSUMER
```

La estrategia deberá contemplar:

- buffers acotados;
- saturación;
- frames descartados;
- audio discontinuo;
- bloqueo;
- degradación;
- cancelación.

La estrategia concreta permanece:

```text
TBD
```

hasta que sea definida y validada.

---

# 28. Errores modulares

Cada módulo deberá comunicar errores de manera que el nivel superior pueda:

- identificar el origen;
- clasificar la condición;
- decidir recuperación;
- informar al usuario cuando corresponda;
- registrar diagnóstico seguro.

No deberá ocultarse un error para producir artificialmente un estado positivo.

---

# 29. Lifecycle modular

Cada módulo deberá tener un lifecycle coherente con su responsabilidad.

Conceptualmente:

```text
CREATE
   ↓
INITIALIZE
   ↓
READY
   ↓
RUNNING
   ↓
STOPPING
   ↓
STOPPED
   ↓
RELEASED
```

No todos los módulos deberán implementar literalmente todos estos estados.

El lifecycle definitivo dependerá del contrato de cada módulo.

---

# 30. Estado de módulos

Los estados permitidos son:

```text
PLANNED
APPROVED
IMPLEMENTED
PARTIAL
TESTED
VALIDATED
CERTIFIED
BLOCKED
DEPRECATED
REMOVED
```

La transición deberá estar sustentada por evidencia correspondiente.

No deberá utilizarse `IMPLEMENTED` únicamente porque exista código.

No deberá utilizarse `VALIDATED` únicamente porque compile.

No deberá utilizarse `CERTIFIED` únicamente porque pase una prueba.

---

# 31. Inventario conceptual actual

| Módulo | Estado | Implementación |
|---|---|---|
| `application` | `PLANNED` | `NOT IMPLEMENTED` |
| `configuration` | `PLANNED` | `NOT IMPLEMENTED` |
| `capture` | `PLANNED` | `NOT IMPLEMENTED` |
| `audio` | `PLANNED` | `NOT IMPLEMENTED` |
| `camera` | `PLANNED` | `NOT IMPLEMENTED` |
| `recording` | `PLANNED` | `NOT IMPLEMENTED` |
| `processing` | `PLANNED` | `NOT IMPLEMENTED` |
| `synchronization` | `PLANNED` | `NOT IMPLEMENTED` |
| `encoding` | `PLANNED` | `NOT IMPLEMENTED` |
| `output` | `PLANNED` | `NOT IMPLEMENTED` |
| `recovery` | `PLANNED` | `NOT IMPLEMENTED` |
| `platform` | `PLANNED` | `NOT IMPLEMENTED` |
| `ui` | `PLANNED` | `NOT IMPLEMENTED` |
| `diagnostics` | `PLANNED` | `NOT IMPLEMENTED` |
| `application entrypoint` | `PLANNED` | `NOT IMPLEMENTED` |

```text
MODULES IMPLEMENTED:
0

MODULES TESTED:
0

MODULES VALIDATED:
0

MODULES CERTIFIED:
0
```

---

# 32. Relación con componentes

Los componentes deberán quedar definidos en:

```text
docs/components/COMPONENTS.md
```

La relación conceptual será:

```text
MODULE
   ↓
COMPONENT
   ↓
IMPLEMENTATION
```

Un módulo podrá contener varios componentes.

Un componente no deberá asumir responsabilidades pertenecientes a otro módulo sin una decisión arquitectónica explícita.

---

# 33. Relación con especificaciones técnicas

Los detalles técnicos deberán permanecer en los documentos correspondientes.

Ejemplos:

```text
CAPTURE
    → docs/technical/CAPTURE.md

AUDIO
    → docs/technical/AUDIO.md

ENCODING
    → docs/technical/ENCODING.md

OUTPUT
    → docs/technical/OUTPUT.md

RECORDING
    → docs/technical/RECORDING.md
```

`MODULES.md` no deberá duplicar innecesariamente las especificaciones técnicas.

---

# 34. Relación con fases

Las fases deberán implementar progresivamente los módulos definidos.

Conceptualmente:

```text
REQUIREMENTS
      ↓
ARCHITECTURE
      ↓
CONTRACT
      ↓
MODULES
      ↓
COMPONENTS
      ↓
TECHNICAL SPECS
      ↓
PHASE
      ↓
IMPLEMENTATION
      ↓
TEST
      ↓
VALIDATION
      ↓
CERTIFICATION
```

Una fase podrá afectar uno o varios módulos.

Un módulo podrá desarrollarse progresivamente a través de varias fases.

---

# 35. Regla para desarrollo independiente

Cuando un módulo sea desarrollado fuera de la integración principal, deberá conservar como mínimo:

- alcance;
- responsabilidades;
- requisitos relacionados;
- contrato;
- dependencias;
- pruebas;
- evidencia;
- estado;
- criterios de validación;
- criterios de certificación.

El desarrollo externo no elimina la obligación de trazabilidad.

---

# 36. Decisiones todavía abiertas

Las siguientes decisiones permanecen abiertas cuando no exista documentación aprobada que las cierre:

```text
UI FRAMEWORK
TBD

CAPTURE API
TBD

AUDIO API
TBD

CAMERA IMPLEMENTATION
TBD

CODEC
TBD

ENCODER
TBD

CONTAINER
TBD

SYNCHRONIZATION STRATEGY
TBD

CONFIGURATION PERSISTENCE
TBD

LOGGING BACKEND
TBD

INSTALLER
TBD

PORTABLE DISTRIBUTION
TBD

SIGNING
TBD

UPDATE MECHANISM
TBD
```

Estas decisiones no podrán convertirse unilateralmente en decisiones definitivas durante la implementación.

---

# 37. Gaps actuales

Los siguientes gaps permanecen abiertos:

```text
GAP-MOD-001
Physical package structure not implemented.

GAP-MOD-002
Module interfaces not yet defined.

GAP-MOD-003
Concrete dependency graph not yet implemented.

GAP-MOD-004
Ownership contracts not yet implemented.

GAP-MOD-005
Lifecycle contracts not yet implemented.

GAP-MOD-006
Platform abstraction not yet implemented.

GAP-MOD-007
Processing boundaries not yet implemented.

GAP-MOD-008
Synchronization contract not yet implemented.

GAP-MOD-009
Recovery contract not yet implemented.

GAP-MOD-010
Module-level test suites not yet implemented.
```

Estos gaps representan trabajo pendiente.

No constituyen defectos de una implementación inexistente.

---

# 38. Regla de realidad

Este documento define una organización modular prevista.

No demuestra que exista código.

Por tanto:

```text
MODULE DOCUMENTED
        ≠
MODULE CREATED
        ≠
MODULE IMPLEMENTED
        ≠
MODULE TESTED
        ≠
MODULE VALIDATED
        ≠
MODULE CERTIFIED
```

Cada transición deberá sustentarse mediante evidencia.

---

# 39. Regla Suprema

> **Los módulos de SCREEN by KLIK deberán representar responsabilidades reales, límites claros y dependencias controladas.**

La arquitectura define.

Los requisitos establecen lo que debe cumplirse.

Los contratos delimitan las reglas.

Los módulos organizan responsabilidades.

Los componentes materializan unidades funcionales.

La implementación construye.

Las pruebas verifican.

La evidencia demuestra.

La validación confirma.

La certificación autoriza la integración.

**Estado actual:**

```text
MODULE ARCHITECTURE
PLANNED

IMPLEMENTATION
NOT IMPLEMENTED

TESTING
NOT EXECUTED

VALIDATION
NOT VALIDATED

CERTIFICATION
NOT CERTIFIED
```

> **La documentación no deberá utilizarse jamás para aparentar una implementación que todavía no existe.**