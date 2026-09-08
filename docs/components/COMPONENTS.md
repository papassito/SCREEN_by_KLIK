# SCREEN by KLIK — Components

## 1. Propósito

Este documento define el modelo conceptual de componentes de **SCREEN by KLIK**.

Su objetivo es establecer:

* responsabilidades;
* límites;
* relaciones;
* ownership;
* dependencias;
* lifecycle;
* entradas;
* salidas;
* errores;
* criterios de validación.

Un componente deberá existir porque representa una responsabilidad real dentro del sistema.

La documentación de un componente no implica que éste exista físicamente en el repositorio.

```text
DOCUMENTED
    ≠
IMPLEMENTED
    ≠
TESTED
    ≠
VALIDATED
    ≠
CERTIFIED
```

**Estado general: `PLANNED`**

---

# 2. Principio de Realidad

Los componentes deberán determinarse a partir de:

1. arquitectura aprobada;
2. requisitos;
3. contratos;
4. responsabilidades funcionales;
5. repositorio real;
6. implementación existente;
7. evidencia de validación.

No deberán crearse componentes artificiales únicamente para completar un árbol arquitectónico.

Cuando un componente esté contemplado arquitectónicamente pero todavía no exista en la implementación:

```text
STATUS
PLANNED
```

Cuando una capacidad requerida no tenga componente correspondiente:

```text
IMPLEMENTATION GAP
```

---

# 3. Clasificación Conceptual

La arquitectura contempla inicialmente las siguientes categorías conceptuales:

```text
Application
Configuration
Capture
Audio
Camera
Recording
Processing
Encoding
Output
Recovery
Diagnostics
Library
Platform
UI
```

Esta clasificación no constituye por sí misma una afirmación de que todas estas piezas existan físicamente.

Cada componente deberá confirmarse contra la arquitectura y el repositorio antes de declararse implementado.

---

# 4. Application

## Responsabilidad

El componente `Application` representa la coordinación general de la aplicación.

Responsabilidades conceptuales:

* inicialización;
* composición de componentes;
* lifecycle general;
* coordinación;
* configuración inicial;
* shutdown;
* propagación de estados relevantes.

## Límites

`Application` no deberá convertirse en un contenedor de lógica funcional no relacionada.

No deberá asumir directamente responsabilidades detalladas de:

* captura;
* procesamiento;
* encoding;
* persistencia;
* interfaz.

## Estado

```text
PLANNED
```

---

# 5. Configuration

## Responsabilidad

El componente `Configuration` representa la carga, validación y disponibilidad de la configuración necesaria para ejecutar SCREEN.

Podrá contemplar conceptualmente:

* configuración de aplicación;
* preferencias;
* parámetros de captura;
* parámetros de audio;
* parámetros de salida;
* opciones de diagnóstico.

## Requisitos

La configuración deberá:

* validarse;
* tener valores claramente definidos;
* distinguir configuración válida de configuración ausente;
* evitar secretos expuestos;
* evitar valores ambiguos.

## Estado

```text
PLANNED
```

La ubicación física y el formato de configuración permanecen:

```text
TBD
```

---

# 6. Capture

## Responsabilidad

`Capture` representa la adquisición de la imagen o superficie que será registrada.

Responsabilidades conceptuales:

* descubrimiento de fuentes;
* selección de fuente;
* adquisición;
* timestamps;
* lifecycle;
* detección de errores;
* comunicación del estado de captura.

## Límites

`Capture` no deberá encargarse directamente de:

* crear el archivo final;
* administrar el contenedor final;
* definir la política completa de encoding;
* gestionar la interfaz de usuario.

## Estado

```text
PLANNED
```

El mecanismo concreto de adquisición queda:

```text
TBD
```

---

# 7. Audio

## Responsabilidad

`Audio` representa la adquisición de fuentes de audio.

Responsabilidades conceptuales:

* descubrimiento de dispositivos;
* selección de fuente;
* captura;
* timestamps;
* buffers;
* lifecycle;
* detección de errores;
* estado de disponibilidad.

## Límites

`Audio` no deberá encargarse directamente de:

* crear el archivo final;
* definir el contenedor;
* gestionar la interfaz;
* asumir responsabilidades de encoding que correspondan a `Encoding`.

## Estado

```text
PLANNED
```

El mecanismo concreto de captura de audio queda:

```text
TBD
```

---

# 8. Camera

## Responsabilidad

`Camera` representa una fuente de cámara cuando ésta sea utilizada.

Responsabilidades conceptuales:

* descubrimiento;
* selección;
* adquisición;
* configuración;
* lifecycle;
* disponibilidad;
* errores.

## Regla

La cámara deberá ser una capacidad opcional de SCREEN.

La ausencia de cámara no deberá impedir una sesión de grabación que no la requiera.

## Estado

```text
PLANNED
```

La tecnología y el mecanismo concreto quedan:

```text
TBD
```

---

# 9. Recording

## Responsabilidad

`Recording` representa el lifecycle lógico de una sesión de grabación.

Responsabilidades conceptuales:

* creación de sesión;
* inicio;
* pausa;
* reanudación;
* detención;
* cancelación;
* coordinación de fuentes;
* estado de sesión;
* finalización controlada.

## Estados conceptuales

La máquina de estados definitiva deberá definirse mediante el contrato correspondiente.

Como referencia conceptual:

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
COMPLETED
```

También deberán contemplarse estados de fallo y cancelación.

Los estados definitivos quedan:

```text
TBD
```

## Límites

`Recording` no deberá absorber responsabilidades específicas de:

* captura;
* encoding;
* filesystem;
* interfaz;
* diagnóstico.

---

# 10. Processing

## Responsabilidad

`Processing` representa las transformaciones realizadas sobre los datos capturados antes de su codificación o salida.

Podrá contemplar, cuando sean capacidades aprobadas:

* transformación;
* composición;
* overlays;
* cursor;
* anotaciones;
* preparación de frames.

## Regla

Ninguna capacidad deberá considerarse disponible únicamente por estar enumerada aquí.

Cada capacidad deberá tener:

* requisito;
* contrato;
* definición;
* implementación;
* validación.

## Estado

```text
PLANNED
```

Las capacidades concretas quedan:

```text
TBD
```

---

# 11. Encoding

## Responsabilidad

`Encoding` representa la transformación de datos de captura en una representación codificada adecuada para la salida.

Responsabilidades conceptuales:

* configuración del encoding;
* selección del mecanismo de codificación;
* procesamiento de vídeo;
* procesamiento de audio cuando corresponda;
* parámetros;
* manejo de errores;
* lifecycle.

## Hardware Acceleration

La utilización de aceleración por hardware queda:

```text
PLANNED / TBD
```

Su disponibilidad dependerá de:

* plataforma;
* hardware;
* drivers;
* capacidades reales;
* implementación;
* validación.

No deberá afirmarse que una determinada aceleración existe sin evidencia.

## Fallback

Cualquier mecanismo de fallback deberá estar definido explícitamente.

No deberá utilizarse un fallback silencioso que altere de forma significativa el comportamiento esperado sin registrarlo o comunicarlo cuando corresponda.

---

# 12. Output

## Responsabilidad

`Output` representa la generación y finalización del resultado de una sesión de grabación.

Responsabilidades conceptuales:

* preparación de salida;
* escritura;
* finalización;
* verificación;
* gestión de errores;
* transición de estado temporal a resultado final cuando corresponda.

## Integridad

Un archivo no deberá considerarse resultado final válido únicamente porque exista físicamente.

Deberá existir evidencia suficiente de que:

```text
CAPTURE
  ↓
PROCESSING
  ↓
ENCODING
  ↓
OUTPUT
  ↓
FINALIZATION
  ↓
VALID RESULT
```

La definición exacta de validación queda:

```text
TBD
```

---

# 13. Recovery

## Responsabilidad

`Recovery` representa los mecanismos destinados a tratar sesiones o resultados incompletos.

Podrá contemplar:

* detección de sesiones incompletas;
* detección de resultados incompletos;
* recuperación cuando sea técnicamente posible;
* limpieza controlada;
* clasificación del resultado;
* prevención de falsos resultados finales.

## Regla de integridad

Recovery no deberá convertir un resultado incompleto en un resultado aparentemente válido sin evidencia suficiente.

Los estados posibles deberán distinguir, cuando corresponda:

```text
COMPLETE
PARTIAL
FAILED
RECOVERED
UNRECOVERABLE
```

La semántica definitiva queda:

```text
TBD
```

---

# 14. Diagnostics

## Responsabilidad

`Diagnostics` representa las capacidades destinadas al diagnóstico técnico y observabilidad del sistema.

Podrá contemplar:

* logging;
* información diagnóstica;
* métricas técnicas;
* estados operativos;
* información de errores;
* información necesaria para soporte.

## Límites

`Diagnostics` no deberá contener lógica funcional de:

* captura;
* grabación;
* encoding;
* procesamiento;
* generación de archivos.

## Relación con Logging

La estrategia de logging se encuentra definida en:

```text
LOGGING.md
```

Logging no deberá utilizarse como sustituto de:

* manejo de errores;
* auditoría;
* validación;
* evidencia funcional.

## Estado

```text
PLANNED
```

---

# 15. Library

## Responsabilidad

`Library` representa capacidades reutilizables que no pertenecen exclusivamente a un flujo funcional específico.

Podrá contener conceptualmente:

* utilidades;
* abstracciones compartidas;
* tipos comunes;
* mecanismos auxiliares;
* componentes reutilizables.

## Regla

`Library` no deberá convertirse en un contenedor genérico de cualquier funcionalidad.

Una capacidad deberá pertenecer a `Library` únicamente cuando exista una justificación clara de reutilización o responsabilidad transversal.

## Estado

```text
PLANNED
```

---

# 16. Platform

## Responsabilidad

`Platform` representa las capacidades específicas de la plataforma de ejecución.

Para la plataforma objetivo inicial, podrán existir responsabilidades relacionadas con:

* dispositivos;
* captura;
* audio;
* ventanas;
* filesystem;
* integración con el sistema operativo;
* recursos nativos;
* capacidades específicas de hardware.

## Principio

Las capas superiores deberán depender de abstracciones cuando ello sea apropiado.

No deberá propagarse innecesariamente lógica específica de plataforma hacia componentes superiores.

## Regla

No se establece mediante este documento una API nativa concreta.

Tecnologías específicas:

```text
TBD
```

---

# 17. UI

## Responsabilidad

`UI` representa la interfaz mediante la cual el usuario controla y observa SCREEN.

Podrá contemplar conceptualmente:

* configuración;
* selección de fuentes;
* controles de grabación;
* estado;
* errores;
* progreso;
* preferencias;
* información de sesión.

## Límites

La interfaz no deberá convertirse en propietaria de la lógica funcional central.

La UI deberá comunicarse con las capacidades del sistema mediante contratos definidos.

## Tecnología

La tecnología de interfaz queda:

```text
TBD
```

## Estado

```text
PLANNED
```

---

# 18. Relaciones Conceptuales

La relación conceptual inicial entre componentes podrá representarse como:

```text
                    APPLICATION
                         │
             ┌───────────┼───────────┐
             │           │           │
       CONFIGURATION     UI      DIAGNOSTICS
             │
             ▼
        RECORDING
        │    │    │
        │    │    └──────── CAMERA
        │    └───────────── AUDIO
        └────────────────── CAPTURE
                 │
                 ▼
             PROCESSING
                 │
                 ▼
              ENCODING
                 │
                 ▼
               OUTPUT
                 │
                 ▼
              RECOVERY
```

`PLATFORM` proporciona las capacidades específicas necesarias para los componentes que dependan de ellas.

`LIBRARY` proporciona capacidades reutilizables únicamente cuando su responsabilidad transversal esté justificada.

Este diagrama es conceptual.

No representa todavía una estructura física del repositorio.

---

# 19. Ownership

Cada componente deberá tener un propietario funcional o técnico claramente definido.

Conceptualmente:

```text
COMPONENT
   ↓
OWNER
   ↓
RESOURCES
   ↓
LIFECYCLE
   ↓
DEPENDENCIES
   ↓
FAILURE HANDLING
```

No deberá existir un recurso cuyo ownership sea ambiguo.

Esto incluye:

* dispositivos;
* archivos;
* buffers;
* sesiones;
* procesos;
* conexiones;
* recursos nativos;
* memoria.

---

# 20. Dependencias

Las dependencias entre componentes deberán ser explícitas.

Deberá evitarse:

* dependencia circular;
* acoplamiento innecesario;
* acceso directo a internals de otro componente;
* duplicación de responsabilidades;
* conocimiento indebido de detalles internos.

Conceptualmente:

```text
HIGHER LEVEL
     ↓
CONTRACT
     ↓
LOWER LEVEL
```

Los detalles concretos de interfaces y dependencias quedan definidos por los contratos correspondientes.

---

# 21. Lifecycle

Cada componente deberá definir su ciclo de vida.

Como mínimo deberá poder determinarse:

```text
CREATE
  ↓
INITIALIZE
  ↓
READY
  ↓
ACTIVE
  ↓
STOPPING
  ↓
STOPPED
```

No todos los componentes necesariamente utilizarán todos estos estados.

La máquina de estados definitiva deberá establecerse por componente cuando sea necesaria.

---

# 22. Errores

Cada componente deberá definir cómo maneja sus errores.

Deberá poder determinarse:

* qué errores puede producir;
* cuáles puede recuperar;
* cuáles debe propagar;
* cuáles requieren detener la operación;
* cuáles deben registrarse;
* cuáles requieren intervención superior.

El comportamiento deberá mantenerse alineado con:

```text
ERROR-HANDLING.md
```

Un componente no deberá ocultar errores relevantes para hacer que una operación parezca exitosa.

---

# 23. Recursos

Cada componente que adquiera recursos deberá definir:

```text
ACQUIRE
   ↓
USE
   ↓
RELEASE
```

Los recursos no deberán quedar abandonados durante:

* ejecución normal;
* error;
* cancelación;
* shutdown;
* recuperación.

Esto es especialmente importante para:

* dispositivos;
* archivos;
* buffers;
* procesos;
* memoria;
* sesiones;
* encoders;
* recursos nativos.

---

# 24. Validación de Componentes

Cada componente implementado deberá poder validarse de acuerdo con su responsabilidad.

Como mínimo deberá determinarse:

```text
COMPONENT
    ↓
RESPONSIBILITY
    ↓
INPUT
    ↓
PROCESSING
    ↓
OUTPUT
    ↓
ERROR
    ↓
TEST
    ↓
EVIDENCE
```

No deberá declararse un componente:

```text
VALIDATED
```

sin evidencia de validación.

---

# 25. Criterios Mínimos de Definición

Antes de considerar suficientemente definido un componente deberán poder responderse estas preguntas:

1. ¿Qué responsabilidad tiene?
2. ¿Qué no es responsable de hacer?
3. ¿Qué datos recibe?
4. ¿Qué datos produce?
5. ¿Quién es su propietario?
6. ¿Qué recursos utiliza?
7. ¿Qué dependencias tiene?
8. ¿Cómo inicia?
9. ¿Cómo termina?
10. ¿Cómo maneja errores?
11. ¿Cómo se valida?
12. ¿Qué evidencia demuestra su funcionamiento?

Si varias de estas respuestas permanecen indefinidas y afectan el diseño, el componente deberá considerarse incompleto.

---

# 26. Estados de los Componentes

Los componentes deberán utilizar estados explícitos:

```text
PLANNED
PROPOSED
IMPLEMENTED
PARTIAL
TESTED
VALIDATED
CERTIFIED
DEPRECATED
REMOVED
BLOCKED
```

No deberá utilizarse `IMPLEMENTED`, `VALIDATED` o `CERTIFIED` únicamente porque exista documentación correspondiente.

---

# 27. Regla de No Invención

No deberá inventarse:

* un componente;
* una implementación;
* una interfaz;
* una dependencia;
* una tecnología;
* un mecanismo de comunicación;
* una capacidad;
* un resultado de prueba.

Cuando la arquitectura requiera algo que no exista:

```text
COMPONENT GAP
```

Cuando la documentación y el repositorio contradigan la definición:

```text
COMPONENT CONFLICT
```

La discrepancia deberá reportarse antes de modificar la arquitectura o la implementación.

---

# 28. Relación con la Arquitectura

`COMPONENTS.md` se encuentra subordinado a la arquitectura oficial.

La relación conceptual es:

```text
README / MANIFESTO / MAP
            ↓
       ARCHITECTURE
            ↓
       REQUIREMENTS
            ↓
        CONTRACTS
            ↓
        COMPONENTS
            ↓
          MODULES
            ↓
      IMPLEMENTATION
            ↓
           TESTS
            ↓
         EVIDENCE
            ↓
       CERTIFICATION
```

`COMPONENTS.md` no podrá redefinir silenciosamente decisiones tomadas en niveles superiores.

---

# 29. Estado Actual de SCREEN

Al momento de este documento:

```text
COMPONENT MODEL
---------------
DOCUMENTED       YES
IMPLEMENTED      NO
TESTED           NO
VALIDATED        NO
CERTIFIED        NO
```

La existencia de esta especificación no implica que los componentes descritos existan físicamente.

El estado real deberá determinarse mediante inspección del repositorio y evidencia de implementación.

---

# 30. Evolución

El ciclo esperado de un componente será:

```text
CONCEPT
   ↓
PROPOSED
   ↓
APPROVED
   ↓
IMPLEMENTED
   ↓
TESTED
   ↓
VALIDATED
   ↓
CERTIFIED
   ↓
INTEGRATED
```

No deberá saltarse una transición crítica sin evidencia o autorización correspondiente.

---

# 31. Regla Suprema

> **Un componente existe porque posee una responsabilidad real, límites claros, ownership definido, lifecycle controlado y evidencia verificable de su comportamiento.**

La documentación puede definir un componente.

La arquitectura puede aprobarlo.

La implementación puede materializarlo.

Las pruebas pueden verificarlo.

La evidencia puede demostrarlo.

La certificación puede autorizar su integración.

Pero:

```text
DOCUMENTED ≠ EXISTING
PROPOSED ≠ APPROVED
APPROVED ≠ IMPLEMENTED
IMPLEMENTED ≠ VALIDATED
VALIDATED ≠ CERTIFIED
```

Por lo tanto:

> **SCREEN by KLIK nunca deberá aparentar tener más componentes, capacidades o madurez arquitectónica de los que realmente existen.**

**Estado del documento: `PLANNED`**
