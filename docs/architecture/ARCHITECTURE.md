# SCREEN by KLIK — Architecture

> **Estado:** APPROVED FOR ARCHITECTURAL DEVELOPMENT  
> **Tipo:** Documento arquitectónico maestro  
> **Proyecto:** SCREEN by KLIK  
> **Versión documental:** 0.1.0-alpha  
> **Implementación:** NOT IMPLEMENTED  
> **Pruebas:** NOT EXECUTED  
> **Validación:** NOT VALIDATED  
> **Certificación:** NOT CERTIFIED  

---

# 1. Propósito

Este documento define la arquitectura conceptual y estructural de **SCREEN by KLIK**.

Su propósito es establecer:

- límites del sistema;
- responsabilidades arquitectónicas;
- separación de componentes;
- dirección de dependencias;
- flujo de datos;
- flujo de control;
- ciclo de vida de una sesión de grabación;
- gestión de recursos;
- concurrencia;
- backpressure;
- manejo de errores;
- recuperación;
- aislamiento de plataforma;
- procesamiento;
- codificación;
- generación y validación del resultado;
- observabilidad;
- seguridad;
- privacidad;
- extensibilidad;
- trazabilidad;
- criterios de evolución.

Este documento define **CÓMO se organiza conceptualmente el sistema**.

Los requisitos definen **QUÉ debe cumplir el sistema**.

Por tanto:

```text
REQUIREMENTS
      ↓
ARCHITECTURE
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
VALIDATION
      ↓
CERTIFICATION
```

La existencia de este documento no constituye evidencia de implementación.

---

# 2. Autoridad y relación documental

La arquitectura debe permanecer alineada con los requisitos aprobados.

Fuente principal de requisitos:

```text
docs/requirements/REQUIREMENTS.md
```

Documentos relacionados:

```text
README.md
MANIFESTO.md
MAP.md
      ↓
docs/requirements/REQUIREMENTS.md
      ↓
ARCHITECTURE.md
      ↓
docs/contracts/CONTRACT.md
      ↓
docs/components/COMPONENTS.md
      ↓
docs/development/MODULES.md
      ↓
docs/development/FUNCTIONS.md
      ↓
TECHNICAL DOCUMENTATION
      ↓
PHASES
      ↓
IMPLEMENTATION
      ↓
TESTING
      ↓
EVIDENCE
      ↓
CERTIFICATION
```

Cuando exista conflicto entre arquitectura y requisitos:

```text
REQUIREMENTS
      ↓
ARCHITECTURAL REVIEW
      ↓
DECISION
      ↓
DOCUMENT UPDATE
```

La implementación no debe resolver unilateralmente una contradicción documental.

---

# 3. Estado de realidad

El estado actual del proyecto es documental y arquitectónico.

| Elemento | Estado |
|---|---|
| Requisitos | DOCUMENTED |
| Arquitectura | DOCUMENTED |
| Componentes | DOCUMENTED |
| Especificaciones técnicas | DOCUMENTED |
| Implementación | NOT IMPLEMENTED |
| Pruebas | NOT EXECUTED |
| Evidencia | MISSING |
| Validación | NOT VALIDATED |
| Certificación | NOT CERTIFIED |
| Release | NOT RELEASED |

La documentación no constituye evidencia de funcionamiento.

---

# 4. Alcance arquitectónico

La arquitectura contempla inicialmente una aplicación de escritorio para **Windows** orientada a grabación local de pantalla.

La arquitectura cubre conceptualmente:

- captura de pantalla;
- captura de monitor;
- captura multimonitor;
- captura de ventana;
- captura de región;
- captura de audio del sistema;
- captura de micrófono;
- captura opcional de cámara;
- cursor;
- procesamiento;
- overlays;
- anotaciones futuras;
- sincronización;
- codificación;
- salida;
- validación;
- recuperación;
- configuración;
- UI;
- hotkeys;
- diagnóstico;
- seguridad;
- privacidad.

La arquitectura no convierte automáticamente las capacidades futuras en funcionalidades obligatorias de la primera versión.

---

# 5. Principios arquitectónicos

## 5.1 Separación de responsabilidades

Cada componente debe poseer una responsabilidad definida.

No debe existir un componente que concentre indiscriminadamente:

- UI;
- captura;
- audio;
- cámara;
- procesamiento;
- codificación;
- almacenamiento;
- configuración;
- diagnóstico;
- recuperación.

La separación debe permitir:

- pruebas;
- sustitución;
- mantenimiento;
- evolución;
- aislamiento de errores;
- evolución multiplataforma futura.

---

## 5.2 Dependencias dirigidas

Las dependencias deben tener una dirección arquitectónica clara.

Conceptualmente:

```text
UI
 ↓
APPLICATION
 ↓
RECORDING
 ↓
CAPABILITIES
 ↓
PROCESSING
 ↓
ENCODING
 ↓
OUTPUT
```

Las dependencias concretas podrán refinarse durante el diseño detallado, pero no deben crear ciclos.

---

## 5.3 Abstracción de plataforma

Las capacidades específicas de Windows deben permanecer aisladas de la lógica independiente de plataforma.

Conceptualmente:

```text
APPLICATION
    ↓
RECORDING
    ↓
ABSTRACT CAPABILITY
    ↓
PLATFORM ADAPTER
    ↓
OPERATING SYSTEM
```

La arquitectura no debe permitir que una API nativa de Windows se convierta accidentalmente en una dependencia transversal del sistema.

---

## 5.4 Recursos controlados

Los siguientes recursos deben tener propietario y ciclo de vida:

- memoria;
- buffers;
- CPU;
- GPU;
- dispositivos;
- archivos;
- almacenamiento;
- handles;
- procesos;
- mecanismos concurrentes;
- streams;
- encoders;
- fuentes de captura.

Todo recurso adquirido debe disponer de una estrategia de liberación.

---

## 5.5 Fallos explícitos

La arquitectura debe distinguir entre operación correcta, operación parcial, cancelación y fallo.

Estados conceptuales:

```text
COMPLETED
PARTIAL
FAILED
CANCELLED
RECOVERED
UNAVAILABLE
UNKNOWN
UNDETERMINED
```

Los estados definitivos de cada componente deberán establecerse mediante contratos.

---

## 5.6 Evidencia primero

Debe existir una separación estricta:

```text
DESIGNED
    ↓
IMPLEMENTED
    ↓
TESTED
    ↓
VALIDATED
    ↓
CERTIFIED
```

Diseñar una capacidad no demuestra que funcione.

Implementarla tampoco demuestra que esté validada.

Una prueba exitosa tampoco constituye automáticamente certificación.

---

# 6. Modelo arquitectónico general

El modelo conceptual de SCREEN by KLIK es:

```text
                         SCREEN by KLIK
                                │
                         APPLICATION
                                │
             ┌──────────────────┼──────────────────┐
             │                  │                  │
       CONFIGURATION            UI            DIAGNOSTICS
             │                  │                  │
             └──────────────────┼──────────────────┘
                                │
                           RECORDING
                                │
             ┌──────────────────┼──────────────────┐
             │                  │                  │
           CAPTURE             AUDIO             CAMERA
             │                  │                  │
             └──────────────────┼──────────────────┘
                                │
                           PROCESSING
                                │
                            ENCODING
                                │
                             OUTPUT
                                │
                           VALIDATION
                                │
                         FINAL RESULT
                                │
                           RECOVERY
```

Esta representación es conceptual.

No establece automáticamente:

- paquetes;
- archivos;
- interfaces;
- funciones;
- APIs;
- bibliotecas;
- bindings;
- protocolos;
- algoritmos concretos.

---

# 7. Application

`Application` representa la coordinación superior de la aplicación.

Responsabilidades conceptuales:

- inicialización;
- composición de dependencias;
- configuración inicial;
- coordinación;
- ciclo de vida;
- propagación de cancelación;
- propagación de errores;
- coordinación del cierre;
- integración de UI y servicios internos.

`Application` no debe convertirse en propietario de:

- captura;
- audio;
- cámara;
- procesamiento;
- encoding;
- escritura de archivos.

---

# 8. Configuration

`Configuration` representa los parámetros utilizados para configurar la aplicación y las sesiones.

Puede contemplar:

- fuente de captura;
- monitor;
- región;
- resolución;
- frecuencia de frames;
- calidad;
- bitrate;
- audio;
- micrófono;
- cámara;
- cursor;
- destino;
- hotkeys;
- preferencias.

Debe distinguir:

```text
CONFIGURED VALUE
DEFAULT VALUE
VALIDATED VALUE
EFFECTIVE VALUE
```

Un valor configurado no demuestra que haya sido efectivamente utilizado.

El mecanismo físico de persistencia permanece sujeto al diseño detallado.

---

# 9. UI

La UI es la superficie de interacción con el usuario.

Debe permitir conceptualmente:

- seleccionar fuente;
- seleccionar audio;
- configurar micrófono;
- iniciar;
- pausar;
- reanudar;
- detener;
- cancelar;
- consultar estado;
- consultar errores;
- acceder a configuración;
- consultar el resultado.

La UI:

- no debe controlar directamente APIs nativas de captura;
- no debe implementar el pipeline de grabación;
- no debe ser propietaria de recursos de captura;
- no debe asumir éxito sin confirmación del subsistema correspondiente.

Flujo:

```text
USER
 ↓
UI
 ↓
APPLICATION
 ↓
RECORDING
```

La tecnología gráfica concreta deberá definirse durante el diseño de implementación.

---

# 10. Recording

`Recording` es el coordinador de una sesión de grabación.

Es responsable conceptualmente de:

- crear la sesión;
- validar condiciones iniciales;
- iniciar capacidades;
- coordinar captura;
- coordinar audio;
- coordinar cámara;
- coordinar procesamiento;
- coordinar encoding;
- coordinar output;
- controlar pausa;
- controlar reanudación;
- controlar cancelación;
- controlar finalización;
- determinar el resultado.

No debe implementar internamente las responsabilidades especializadas.

---

# 11. Máquina de estados de Recording

El ciclo de vida conceptual es:

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
VALIDATING
 ↓
COMPLETED
```

Rutas alternativas:

```text
STARTING
   ↓
FAILED
```

```text
RECORDING
   ↓
CANCELLED
```

```text
RECORDING
   ↓
FAILED
   ↓
RECOVERY
```

```text
FINALIZING
   ↓
FAILED
   ↓
RECOVERY
```

No todas las transiciones son válidas desde todos los estados.

Las transiciones definitivas deberán formalizarse en `CONTRACT.md`.

---

# 12. Capture

`Capture` representa la adquisición de contenido visual.

Responsabilidades:

- descubrir fuentes;
- seleccionar fuente;
- inicializar fuente;
- adquirir frames;
- proporcionar información temporal;
- detectar pérdida de frames;
- informar errores;
- detener adquisición;
- liberar recursos.

Fuentes contempladas:

```text
MONITOR
WINDOW
REGION
MULTI-MONITOR CONFIGURATION
```

El mecanismo concreto depende de la plataforma y de las decisiones técnicas aprobadas.

---

# 13. Audio

`Audio` representa la adquisición de audio.

Debe distinguirse:

```text
SYSTEM AUDIO CAPTURE
MICROPHONE CAPTURE
```

y posteriormente:

```text
AUDIO PROCESSING
      ↓
AUDIO ENCODING
```

Responsabilidades conceptuales:

- enumeración;
- selección;
- inicialización;
- captura;
- temporalidad;
- buffering;
- errores;
- finalización;
- liberación.

La ausencia de audio no debe provocar el fallo de una grabación que explícitamente no lo requiere.

---

# 14. Camera

`Camera` representa una fuente audiovisual adicional.

La cámara es opcional.

La arquitectura debe permitir:

```text
SCREEN
   +
CAMERA
   ↓
PROCESSING / COMPOSITION
```

sin convertir la cámara en dependencia obligatoria del flujo principal.

Un fallo de cámara no debe detener automáticamente la grabación principal cuando el contrato de la sesión permita continuar sin ella.

---

# 15. Processing

`Processing` representa transformaciones realizadas antes de la codificación.

Puede contemplar:

- composición;
- escalado;
- transformación;
- cursor;
- overlays;
- anotaciones;
- composición de cámara;
- sincronización;
- preparación de streams.

Las transformaciones deben existir únicamente cuando estén justificadas por requisitos o capacidades aprobadas.

No deben introducirse operaciones artificiales para aumentar la complejidad.

---

# 16. Encoding

`Encoding` convierte los datos preparados en streams destinados a la salida.

Responsabilidades:

- configuración;
- codificación de vídeo;
- codificación de audio;
- parámetros de calidad;
- bitrate;
- gestión de timestamps;
- finalización;
- errores.

La arquitectura debe permitir estrategias diferentes:

```text
ENCODER
 ├── HARDWARE
 └── SOFTWARE
```

La existencia de ambas posibilidades arquitectónicas no significa que ambas estén implementadas.

Los codecs y mecanismos concretos deberán corresponder a los requisitos y decisiones técnicas aprobadas.

---

# 17. Hardware acceleration

La arquitectura debe separar:

```text
GPU PRESENT
      ≠
ENCODER AVAILABLE
      ≠
ENCODER USABLE
      ≠
ENCODER COMPATIBLE
      ≠
ENCODER BENEFICIAL
      ≠
ENCODER VALIDATED
```

El sistema deberá poder determinar la capacidad disponible antes de utilizarla.

Conceptualmente:

```text
DETECT
  ↓
CAPABILITY CHECK
  ↓
SELECT
  ↓
INITIALIZE
  ↓
ENCODE
  ↓
MONITOR
```

Si la configuración de hardware no es utilizable:

```text
HARDWARE ENCODER
       ↓
     FAILURE
       ↓
SOFTWARE FALLBACK
```

siempre que la configuración y los contratos lo permitan.

---

# 18. Synchronization

La sincronización audiovisual es responsabilidad transversal del pipeline, pero debe tener límites claros.

Conceptualmente:

```text
VIDEO TIMESTAMP
       +
AUDIO TIMESTAMP
       +
SESSION TIME BASE
       ↓
SYNCHRONIZATION
```

Los timestamps deben permitir:

- ordenar datos;
- relacionar audio y vídeo;
- manejar pausa;
- manejar reanudación;
- detectar desviaciones;
- producir un resultado temporalmente coherente.

La estrategia matemática concreta de sincronización queda sujeta al diseño técnico.

---

# 19. Output

`Output` representa la generación del resultado persistente.

Responsabilidades:

- preparar destino;
- crear archivo temporal;
- escribir;
- finalizar;
- cerrar correctamente;
- validar;
- mover o renombrar a resultado definitivo;
- manejar errores de almacenamiento.

Flujo conceptual:

```text
TEMPORARY OUTPUT
      ↓
FINALIZE
      ↓
VALIDATE
      ↓
FINAL OUTPUT
```

Un archivo existente no implica que sea válido.

---

# 20. Integridad del resultado

El resultado debe pasar por una cadena explícita:

```text
CAPTURE
   ↓
PROCESS
   ↓
ENCODE
   ↓
WRITE
   ↓
FINALIZE
   ↓
VALIDATE
   ↓
VALID RESULT
```

Si la validación falla:

```text
VALID RESULT
      ↓
NOT CONFIRMED
```

El sistema no debe convertir artificialmente:

```text
UNKNOWN
```

en:

```text
VALID
```

---

# 21. Recovery

`Recovery` trata sesiones que no terminaron normalmente.

Casos potenciales:

- cierre inesperado;
- fallo de almacenamiento;
- fallo del encoder;
- pérdida de dispositivo;
- falta de recursos;
- interrupción del proceso;
- finalización anormal.

Conceptualmente:

```text
ABNORMAL TERMINATION
        ↓
DETECT
        ↓
CLASSIFY
        ↓
RECOVER / PRESERVE / DISCARD
        ↓
RESULT STATE
```

Posibles estados:

```text
RECOVERED
PARTIAL
UNRECOVERABLE
DISCARDED
UNKNOWN
```

La estrategia concreta de recuperación será definida en la especificación correspondiente.

---

# 22. Screenshots

Las screenshots forman parte de la capacidad funcional del producto.

Conceptualmente:

```text
SCREEN SOURCE
      ↓
SCREENSHOT CAPTURE
      ↓
LOCAL OUTPUT
      ↓
VALIDATED IMAGE
```

El mecanismo debe reutilizar, cuando sea apropiado:

- descubrimiento de fuentes;
- coordenadas;
- selección de región;
- validación de rutas;
- reglas de nombres;
- almacenamiento local.

La implementación concreta queda pendiente.

---

# 23. Cursor

El cursor debe tratarse como una capacidad de captura/procesamiento independiente.

Conceptualmente:

```text
CAPTURE
   ↓
CURSOR POLICY
   ↓
PROCESSING
   ↓
ENCODING
```

La configuración debe permitir determinar si el cursor se incorpora al resultado.

La implementación concreta dependerá de la fuente y plataforma.

---

# 24. Overlays y anotaciones

La arquitectura debe permitir incorporar en el futuro:

- overlays;
- anotaciones;
- indicadores;
- elementos visuales adicionales;
- composición de cámara.

Estas capacidades no deben obligar a reestructurar el pipeline principal.

Conceptualmente:

```text
CAPTURE
   ↓
PROCESSING
   ├── CURSOR
   ├── CAMERA
   ├── OVERLAYS
   └── ANNOTATIONS
   ↓
ENCODING
```

Su implementación será activada por las fases correspondientes.

---

# 25. Hotkeys

Los hotkeys deben comunicarse con la coordinación de la sesión.

Conceptualmente:

```text
GLOBAL HOTKEY
      ↓
UI / APPLICATION
      ↓
RECORDING COMMAND
```

No deben manipular directamente:

- captura;
- encoder;
- archivos;
- dispositivos.

Deben contemplar:

- inicio;
- parada;
- pausa;
- reanudación;
- configuración;
- conflictos;
- disponibilidad.

---

# 26. Diagnostics

`Diagnostics` representa la observabilidad técnica.

Debe poder proporcionar información sobre:

- estado;
- errores;
- eventos;
- recursos;
- rendimiento;
- transiciones;
- fallos;
- recuperación.

Debe permanecer separado de la lógica funcional.

Debe respetar:

```text
OBSERVABILITY
      ≠
LOGGING
      ≠
AUDIT
      ≠
TELEMETRY
```

El logging está especificado en:

```text
docs/development/LOGGING.md
```

---

# 27. Platform

`Platform` representa la frontera entre SCREEN y el sistema operativo/hardware.

En la primera plataforma:

```text
SCREEN
   ↓
PLATFORM ABSTRACTION
   ↓
WINDOWS
```

Puede proporcionar capacidades relacionadas con:

- pantalla;
- ventanas;
- audio;
- micrófono;
- cámara;
- GPU;
- dispositivos;
- filesystem;
- hotkeys;
- permisos;
- integración con Windows.

Las APIs concretas deberán definirse durante la implementación.

El código dependiente de Windows deberá permanecer aislado de la lógica independiente de plataforma.

---

# 28. Portabilidad futura

Windows es la plataforma inicial.

La arquitectura debe evitar impedir futuras implementaciones para:

- macOS;
- Linux.

Esto no significa:

```text
SUPPORTED
```

ni:

```text
IMPLEMENTED
```

para esas plataformas.

La condición actual es:

```text
WINDOWS = INITIAL TARGET
macOS    = FUTURE
Linux    = FUTURE
```

La compatibilidad futura deberá demostrarse mediante implementación y pruebas específicas.

---

# 29. Library y dependencias

La arquitectura no presupone bibliotecas concretas.

Toda dependencia deberá evaluarse considerando:

- necesidad funcional;
- seguridad;
- licencia;
- mantenimiento;
- compatibilidad;
- rendimiento;
- tamaño;
- reproducibilidad;
- distribución;
- soporte.

No se deberá introducir una dependencia únicamente para resolver un problema local cuando exista una alternativa arquitectónicamente apropiada.

---

# 30. Flujo principal de datos

El flujo conceptual es:

```text
SCREEN SOURCE
      │
      ▼
CAPTURE
      │
      ├──────────────┐
      ▼              ▼
   VIDEO           AUDIO
      │              │
      └──────┬───────┘
             │
             ▼
          CAMERA
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
             │
             ▼
          FINALIZE
             │
             ▼
          VALIDATE
             │
             ▼
        FINAL RESULT
```

`RECORDING` coordina el flujo.

---

# 31. Flujo de control

```text
USER
 │
 ▼
UI / HOTKEY
 │
 ▼
APPLICATION
 │
 ▼
RECORDING
 │
 ├── CAPTURE
 ├── AUDIO
 ├── CAMERA
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
 │
 ▼
VALIDATION
 │
 ▼
RESULT
```

Los errores deben subir hasta el nivel que tenga autoridad para decidir entre:

- continuar;
- reintentar;
- degradar;
- cancelar;
- recuperar;
- finalizar;
- informar.

---

# 32. Cancelación

La cancelación debe propagarse desde la sesión.

```text
CANCEL REQUEST
      ↓
RECORDING
      │
      ├── STOP CAPTURE
      ├── STOP AUDIO
      ├── STOP CAMERA
      ├── STOP PROCESSING
      ├── STOP ENCODING
      ├── FINALIZE / DISCARD
      └── RELEASE RESOURCES
      │
      ▼
CANCELLED / PARTIAL / RECOVERED
```

La cancelación no debe producir falsos resultados de éxito.

---

# 33. Concurrencia

La concurrencia debe diseñarse explícitamente.

Cada mecanismo concurrente deberá tener:

- propietario;
- propósito;
- ciclo de vida;
- inicio;
- cancelación;
- propagación de errores;
- terminación;
- liberación.

No se deben introducir mecanismos concurrentes únicamente para fragmentar código.

La estrategia concreta queda pendiente de implementación y validación.

---

# 34. Backpressure

El pipeline puede producir datos a una velocidad superior a la capacidad de procesamiento.

Conceptualmente:

```text
PRODUCER
   ↓
BOUNDED BUFFER
   ↓
PROCESSOR
   ↓
ENCODER
   ↓
OUTPUT
```

Los buffers deberán estar limitados.

No se permite crecimiento ilimitado de memoria debido a acumulación de datos.

Ante saturación deberá existir una estrategia definida.

Posibles estrategias:

- bloquear;
- descartar;
- degradar;
- reducir frecuencia;
- detener;
- recuperar.

La estrategia definitiva dependerá del componente y del contrato correspondiente.

---

# 35. Rendimiento

El rendimiento es una propiedad arquitectónica.

Deben considerarse:

- FPS;
- frames perdidos;
- CPU;
- GPU;
- memoria;
- buffers;
- throughput;
- latencia;
- almacenamiento;
- duración de sesión;
- sincronización;
- copias de memoria;
- presión de recursos.

La arquitectura no fija valores cuantitativos que no estén establecidos por requisitos o pruebas.

Los criterios detallados se mantienen en:

```text
docs/development/PERFORMANCE.md
```

---

# 36. Seguridad

La arquitectura debe aplicar:

- mínimo privilegio;
- validación de entradas;
- protección de archivos;
- control de rutas;
- protección de configuración;
- protección de secretos;
- separación de responsabilidades;
- manejo seguro de errores;
- control de recursos;
- reducción de superficie de ataque.

No deben registrarse innecesariamente:

- contraseñas;
- tokens;
- claves;
- secretos;
- contenido de pantalla;
- audio;
- vídeo;
- datos privados.

La seguridad no se considera demostrada por documentación.

Debe validarse mediante pruebas y evidencia.

---

# 37. Privacidad

El contenido capturado puede contener información sensible.

La arquitectura establece:

```text
LOCAL-FIRST
```

y:

```text
NO EXTERNAL TRANSMISSION BY DEFAULT
```

El funcionamiento principal no debe depender de Internet.

No deben realizarse automáticamente:

- cargas;
- transmisiones;
- sincronizaciones externas;
- análisis externos;
- publicación externa.

Si una futura capacidad requiere comunicación externa, deberá existir una especificación explícita y consentimiento apropiado.

---

# 38. Telemetría

La telemetría no forma parte del funcionamiento obligatorio inicial.

Si se incorpora posteriormente deberá ser:

- explícitamente definida;
- opcional;
- transparente;
- minimizada;
- separada del contenido grabado;
- compatible con los requisitos de privacidad.

No se debe introducir telemetría silenciosa bajo la apariencia de diagnóstico.

---

# 39. Gestión del ciclo de vida

La aplicación debe contemplar:

```text
INITIALIZE
    ↓
CONFIGURE
    ↓
READY
    ↓
START
    ↓
RUNNING
    ↓
STOP / CANCEL / FAIL
    ↓
FINALIZE / RECOVER
    ↓
SHUTDOWN
```

Cada transición relevante debe:

- validar condiciones;
- actualizar estado;
- manejar errores;
- controlar recursos;
- permitir diagnóstico.

---

# 40. Principio de sustitución

Una capacidad podrá disponer de diferentes implementaciones cuando exista una razón real para ello.

Ejemplo:

```text
ENCODER
 ├── HARDWARE
 └── SOFTWARE
```

Ejemplo:

```text
CAPTURE
 ├── PLATFORM IMPLEMENTATION
 └── FUTURE PLATFORM IMPLEMENTATION
```

La arquitectura no obliga a implementar múltiples variantes.

La sustitución debe mantener el contrato de la capacidad correspondiente.

---

# 41. Límites arquitectónicos

Cada componente debe poder responder:

1. ¿Qué responsabilidad posee?
2. ¿Qué recibe?
3. ¿Qué produce?
4. ¿Quién lo controla?
5. ¿Qué dependencias tiene?
6. ¿Cómo inicia?
7. ¿Cómo termina?
8. ¿Cómo se cancela?
9. ¿Cómo falla?
10. ¿Cómo se valida?

Si estas preguntas no pueden responderse claramente, el límite requiere revisión.

---

# 42. Reglas de dependencia

La dirección conceptual es:

```text
UI
 ↓
APPLICATION
 ↓
RECORDING
 ↓
CAPABILITIES
 ↓
PROCESSING
 ↓
ENCODING
 ↓
OUTPUT
```

Con:

```text
PLATFORM
```

como frontera para capacidades dependientes del sistema operativo.

Y:

```text
DIAGNOSTICS
```

como capacidad transversal de observabilidad, sin convertirse en propietario de la lógica funcional.

Las dependencias concretas deben mantener:

- dirección clara;
- responsabilidad única;
- bajo acoplamiento;
- ausencia de ciclos;
- contratos verificables.

---

# 43. Relación con COMPONENTS.md

`COMPONENTS.md` define las responsabilidades de los componentes.

`ARCHITECTURE.md` define cómo se relacionan.

Conceptualmente:

```text
ARCHITECTURE
      ↓
COMPONENT BOUNDARIES
      ↓
MODULE ORGANIZATION
```

Un componente documentado no implica que exista una implementación.

---

# 44. Relación con MODULES.md

`MODULES.md` define la organización modular prevista.

La arquitectura tiene prioridad sobre la organización física del código.

Una estructura de directorios no puede modificar silenciosamente una responsabilidad arquitectónica.

Si la implementación revela una necesidad de cambio:

```text
IMPLEMENTATION FINDING
        ↓
ARCHITECTURAL REVIEW
        ↓
DOCUMENT UPDATE
        ↓
APPROVAL
        ↓
IMPLEMENTATION
```

---

# 45. Relación con fases

Las fases representan el camino de construcción y validación.

Conceptualmente:

```text
PHASE
 ↓
REQUIREMENTS
 ↓
DESIGN
 ↓
IMPLEMENTATION
 ↓
TEST
 ↓
EVIDENCE
 ↓
VALIDATION
```

Una fase no puede declararse completada solamente porque su documento exista.

La finalización de cada fase deberá basarse en evidencia.

---

# 46. Relación con TRACEABILITY.md

Cada requisito relevante debe poder rastrearse mediante:

```text
REQUIREMENT
      ↓
ARCHITECTURE
      ↓
COMPONENT
      ↓
MODULE
      ↓
PHASE
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

La matriz maestra se mantiene en:

```text
docs/development/TRACEABILITY.md
```

Ahora que existe una especificación formal de requisitos, la matriz puede comenzar a poblarse.

---

# 47. Decisiones arquitectónicas actuales

| Tema | Estado |
|---|---|
| Plataforma inicial | WINDOWS |
| Lenguaje principal | GO |
| Modelo | DESKTOP / LOCAL-FIRST |
| Captura de pantalla | REQUIRED |
| Multimonitor | REQUIRED |
| Captura de ventana | REQUIRED |
| Captura de región | REQUIRED |
| Audio del sistema | OPTIONAL CAPABILITY |
| Micrófono | OPTIONAL CAPABILITY |
| Cámara | OPTIONAL CAPABILITY |
| Cursor | CONFIGURABLE |
| Screenshots | REQUIRED |
| Hotkeys | REQUIRED |
| Hardware encoding | ARCHITECTURALLY SUPPORTED |
| Software fallback | REQUIRED |
| Internet para operación principal | NOT REQUIRED |
| Transmisión externa automática | NOT ALLOWED |
| Telemetría | FUTURE / OPTIONAL |
| macOS | FUTURE |
| Linux | FUTURE |

---

# 48. Decisiones todavía abiertas

Las siguientes decisiones requieren diseño técnico posterior:

| Tema | Estado |
|---|---|
| Framework concreto de UI | TBD |
| API concreta de captura | TBD / PLATFORM DESIGN |
| API concreta de audio | TBD / PLATFORM DESIGN |
| Implementación de cámara | TBD |
| Codec concreto | TBD |
| Encoder concreto | TBD |
| Contenedor concreto | TBD |
| Estrategia exacta de sincronización | TBD |
| Estrategia exacta de recuperación | TBD |
| Persistencia física de configuración | TBD |
| Backend concreto de logging | TBD |
| Rotación de logs | TBD |
| Instalador | TBD |
| Portable | TBD |
| Firma de binarios | TBD |
| Actualización automática | TBD |
| Distribución | TBD |

Estas decisiones no deben inventarse durante la implementación.

---

# 49. Restricciones arquitectónicas

No está permitido:

- introducir componentes sin responsabilidad real;
- crear módulos artificiales;
- duplicar responsabilidades;
- crear dependencias circulares;
- ocultar errores;
- convertir fallos en éxitos;
- registrar contenido capturado innecesariamente;
- transmitir contenido sin autorización;
- asumir compatibilidad sin evidencia;
- asumir hardware acceleration sin verificar;
- presentar archivos incompletos como finales;
- introducir dependencias sin justificación;
- convertir una capacidad futura en requisito obligatorio sin aprobación;
- declarar certificación sin evidencia.

---

# 50. Evolución arquitectónica

Las modificaciones significativas deberán seguir:

```text
PROPOSED
   ↓
REVIEWED
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
```

La arquitectura puede cambiar cuando:

- cambian los requisitos;
- una decisión técnica resulta inviable;
- una prueba revela una limitación;
- una plataforma requiere otro mecanismo;
- se detecta una vulnerabilidad;
- aparece un conflicto arquitectónico;
- una dependencia deja de ser apropiada.

Los cambios deben conservar trazabilidad.

---

# 51. Criterios mínimos de validación arquitectónica

La arquitectura podrá considerarse validada únicamente cuando exista evidencia suficiente de que:

- las responsabilidades están separadas;
- las dependencias son coherentes;
- no existen ciclos arquitectónicos no justificados;
- los límites de plataforma están respetados;
- los ciclos de vida están definidos;
- los recursos tienen propietario;
- la cancelación funciona correctamente;
- los errores tienen tratamiento;
- el pipeline puede finalizar;
- los resultados pueden validarse;
- los fallos no generan falsos éxitos;
- el comportamiento de recuperación es verificable;
- la observabilidad no expone contenido innecesario;
- las capacidades críticas cumplen los requisitos;
- la implementación real corresponde a la arquitectura aprobada.

---

# 52. Criterios de certificación

La existencia de `ARCHITECTURE.md` no constituye certificación.

La certificación arquitectónica requiere evidencia de:

1. cumplimiento de requisitos;
2. coherencia de componentes;
3. coherencia de módulos;
4. límites verificables;
5. dependencias justificadas;
6. ciclo de vida consistente;
7. gestión de errores;
8. control de recursos;
9. aislamiento de plataforma;
10. pruebas correspondientes;
11. evidencia reproducible;
12. ausencia de contradicciones críticas conocidas.

---

# 53. Gaps arquitectónicos actuales

Los siguientes puntos permanecen abiertos:

```text
GAP-ARCH-001
Definición detallada de la implementación Windows.

GAP-ARCH-002
Selección concreta del mecanismo de captura.

GAP-ARCH-003
Selección concreta del mecanismo de audio del sistema.

GAP-ARCH-004
Selección concreta del mecanismo de micrófono.

GAP-ARCH-005
Definición detallada del pipeline de procesamiento.

GAP-ARCH-006
Selección de codecs y encoder.

GAP-ARCH-007
Selección del contenedor de salida.

GAP-ARCH-008
Definición detallada de sincronización A/V.

GAP-ARCH-009
Definición detallada de recuperación.

GAP-ARCH-010
Definición de persistencia de configuración.

GAP-ARCH-011
Definición de UI y tecnología gráfica.

GAP-ARCH-012
Definición de distribución e instalación.

GAP-ARCH-013
Definición de estrategia de firma.

GAP-ARCH-014
Definición de estrategia de actualización.

GAP-ARCH-015
Validación mediante hardware Windows real.
```

Estos GAP no son errores de implementación.

Representan decisiones técnicas, diseño pendiente o evidencia aún inexistente.

---

# 54. Regla de realidad arquitectónica

Debe mantenerse estrictamente:

```text
ARCHITECTURE DESIGNED
        ≠
ARCHITECTURE IMPLEMENTED
        ≠
ARCHITECTURE TESTED
        ≠
ARCHITECTURE VALIDATED
        ≠
ARCHITECTURE CERTIFIED
```

La documentación no sustituye la evidencia.

---

# 55. Regla de no invención

No se deben inventar:

- módulos;
- paquetes;
- archivos;
- interfaces;
- funciones;
- APIs;
- dependencias;
- tecnologías;
- protocolos;
- algoritmos;
- resultados;
- pruebas;
- métricas;
- certificaciones.

Cuando una decisión todavía no exista:

```text
TBD
```

Cuando exista como propuesta:

```text
PROPOSED
```

Cuando no exista evidencia:

```text
UNKNOWN
UNDETERMINED
NOT EXECUTED
MISSING
```

---

# 56. Estado documental

| Área | Estado |
|---|---|
| Requirements | DOCUMENTED |
| Architecture | DOCUMENTED |
| Components | DOCUMENTED |
| Modules | DOCUMENTED |
| Technical specifications | DOCUMENTED |
| UI specifications | DOCUMENTED |
| Security | DOCUMENTED |
| Privacy | DOCUMENTED |
| Testing strategy | DOCUMENTED |
| Implementation | NOT IMPLEMENTED |
| Tests | NOT EXECUTED |
| Evidence | MISSING |
| Validation | NOT VALIDATED |
| Certification | NOT CERTIFIED |
| Integration | NOT INTEGRATED |
| Release | NOT RELEASED |

---

# 57. Regla suprema

> **SCREEN by KLIK nunca debe aparentar estar más avanzado, más completo, más compatible, más seguro, más funcional, más probado o más certificado de lo que la evidencia real permita demostrar.**

Por lo tanto:

```text
NO INVENTAR
NO OCULTAR
NO PARCHEAR
NO CONFUNDIR REQUISITOS CON IMPLEMENTACIÓN
NO CONFUNDIR DISEÑO CON FUNCIONAMIENTO
NO CONFUNDIR TEST CON VALIDACIÓN
NO CONFUNDIR VALIDACIÓN CON CERTIFICACIÓN
NO CONFUNDIR DOCUMENTACIÓN CON EVIDENCIA
NO CERTIFICAR SIN PRUEBAS
```

La arquitectura existe para proporcionar una estructura verificable sobre la cual SCREEN by KLIK pueda construirse, probarse, validarse y certificarse de forma controlada.