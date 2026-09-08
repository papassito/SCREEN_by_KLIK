# SCREEN by KLIK

## Professional Screen Recorder

**SCREEN by KLIK** es un software de escritorio profesional para **capturar, grabar, editar y exportar la actividad de la pantalla de una computadora**.

Su propósito es ofrecer una alternativa propia, moderna y eficiente a herramientas como Movavi Screen Recorder, enfocada inicialmente en Windows y diseñada bajo una filosofía **local-first, autónoma, privada y sin dependencia obligatoria de servicios en la nube**.

---

## 1. Visión del producto

SCREEN by KLIK permite al usuario:

> **Seleccionar qué grabar → grabar → detener → editar → exportar.**

El producto debe mantener una experiencia sencilla para usuarios normales, pero proporcionar capacidades avanzadas para usuarios profesionales.

SCREEN no es un sistema de acceso remoto.

SCREEN no es una plataforma de vigilancia.

SCREEN no es un servicio de streaming.

SCREEN no requiere una cuenta en la nube para funcionar.

SCREEN es un **grabador de pantalla profesional y autónomo**.

---

# 2. Objetivos

## Objetivo principal

Crear un grabador de pantalla profesional capaz de capturar:

* Pantalla completa.
* Monitor específico.
* Región personalizada.
* Ventana específica.
* Audio del sistema.
* Micrófono.
* Cámara web opcional.
* Cursor.
* Clics.
* Teclas.
* Video sincronizado con audio.

El resultado debe poder almacenarse y exportarse como un archivo multimedia estándar.

---

# 3. Principios fundamentales

SCREEN by KLIK se desarrollará bajo los siguientes principios.

### 3.1 Local-first

Las grabaciones pertenecen al usuario y permanecen localmente en su equipo salvo que el propio usuario decida exportarlas o transferirlas.

### 3.2 Sin nube obligatoria

El funcionamiento principal de SCREEN no dependerá de:

* Google.
* Microsoft Cloud.
* AWS.
* Azure.
* APIs externas.
* Servicios SaaS.
* Plataformas de almacenamiento remoto.

### 3.3 Autónomo

SCREEN debe poder instalarse y utilizarse como producto independiente.

### 3.4 KLIK OS opcional

La integración con KLIK OS podrá existir, pero SCREEN no debe depender de KLIK OS para realizar su función principal.

```text
SCREEN
│
├── Standalone
│      └── Funcionamiento completo
│
└── KLIK OS Integration
       └── Capacidades adicionales
```

### 3.5 Privacidad

SCREEN no debe enviar automáticamente:

* Grabaciones.
* Audio.
* Capturas.
* Datos de pantalla.
* Datos del micrófono.
* Datos de cámara.

### 3.6 Transparencia

Mientras exista una grabación activa, el usuario debe poder identificar claramente que SCREEN está grabando.

---

# 4. Plataforma inicial

## Primera plataforma

**Windows**

La primera versión estará optimizada para equipos Windows modernos.

La arquitectura deberá evitar quedar innecesariamente acoplada a Windows en las capas superiores para permitir futuras implementaciones.

Posibles plataformas futuras:

* Windows.
* Linux.
* macOS.

Estas plataformas futuras no forman parte del MVP inicial.

---

# 5. Funciones principales

## 5.1 Captura

SCREEN debe soportar:

### Pantalla completa

Grabar todo el escritorio.

### Monitor

Seleccionar un monitor específico.

### Región

Seleccionar manualmente una zona rectangular de la pantalla.

### Ventana

Seleccionar una ventana o aplicación concreta.

### Multi-monitor

Detectar correctamente configuraciones con múltiples monitores.

---

# 6. Recording Engine

El Recording Engine será responsable de administrar la sesión de grabación.

Funciones:

* Inicio.
* Pausa.
* Reanudación.
* Detención.
* Cancelación.
* Cuenta regresiva.
* Temporizador.
* Grabación programada.
* Duración configurable.
* Atajos de teclado.
* Estado de sesión.
* Recuperación ante fallos.

El sistema debe mantener sincronizados todos los componentes de la sesión.

```text
VIDEO
  +
SYSTEM AUDIO
  +
MICROPHONE
  +
CAMERA
  +
OVERLAYS
       │
       ▼
RECORDING SESSION
```

---

# 7. Audio

SCREEN deberá permitir seleccionar y administrar:

## Audio del sistema

Captura del audio reproducido por el equipo.

## Micrófono

Captura de voz mediante el dispositivo seleccionado.

## Mezcla

El usuario podrá grabar:

* Solo sistema.
* Solo micrófono.
* Sistema + micrófono.
* Ninguno.

La arquitectura debe mantener el audio separado internamente cuando sea conveniente para facilitar edición, diagnóstico y sincronización.

---

# 8. Cámara web

La cámara será opcional.

SCREEN podrá incorporar la cámara dentro de la grabación como overlay.

Funciones previstas:

* Activar/desactivar.
* Selección de cámara.
* Resolución.
* Tamaño.
* Posición.
* Forma.
* Borde.
* Transparencia.

La cámara no debe ser obligatoria para grabar pantalla.

---

# 9. Cursor

SCREEN podrá mostrar el cursor dentro de la grabación.

Opciones previstas:

* Mostrar/ocultar cursor.
* Resaltado.
* Tamaño.
* Efectos visuales.
* Identificación de clic izquierdo.
* Identificación de clic derecho.

El sistema deberá evitar que estos efectos degraden innecesariamente el rendimiento de captura.

---

# 10. Teclas

Como función opcional, SCREEN podrá mostrar las teclas presionadas durante una grabación.

Ejemplo:

```text
CTRL + C
ALT + TAB
ENTER
ESC
```

Esta función estará orientada principalmente a:

* Tutoriales.
* Cursos.
* Capacitación.
* Soporte técnico.
* Documentación.

---

# 11. Atajos

SCREEN tendrá atajos configurables.

Ejemplo inicial:

```text
CTRL + SHIFT + R
    Iniciar / detener

CTRL + SHIFT + P
    Pausar / reanudar

ESC
    Cancelar selección
```

Los valores definitivos podrán modificarse durante el desarrollo.

---

# 12. Recording Profiles

SCREEN deberá permitir perfiles de grabación.

Ejemplos:

```text
Quick Record
Tutorial
Gaming
Support
Presentation
Custom
```

Cada perfil podrá definir:

* Resolución.
* FPS.
* Encoder.
* Bitrate.
* Audio.
* Micrófono.
* Cámara.
* Cursor.
* Carpeta de salida.

---

# 13. Encoding

La arquitectura separará:

```text
CAPTURE
   ↓
FRAME PIPELINE
   ↓
ENCODER
   ↓
MUXER / CONTAINER
   ↓
FILE
```

La aplicación deberá aprovechar aceleración por hardware cuando esté disponible.

Encoders previstos:

* H.264.
* H.265 / HEVC.
* AV1.

El soporte efectivo dependerá de las capacidades del sistema y del hardware disponible.

---

# 14. Hardware Encoding

SCREEN deberá detectar y utilizar aceleración disponible cuando sea apropiado.

Se contemplará soporte para tecnologías como:

* NVIDIA NVENC.
* AMD hardware encoding.
* Intel Quick Sync.
* APIs nativas disponibles.

La selección deberá ser transparente para usuarios normales y configurable para usuarios avanzados.

---

# 15. Formatos

El formato principal inicial será:

**MP4**

También se contempla:

**WebM**

La arquitectura debe permitir incorporar posteriormente otros contenedores sin modificar el núcleo de captura.

---

# 16. Resolución

SCREEN deberá permitir:

* Original.
* 720p.
* 1080p.
* 1440p.
* 4K.

La disponibilidad dependerá de la fuente de captura y del hardware.

---

# 17. FPS

Se contemplarán:

* 24 FPS.
* 30 FPS.
* 60 FPS.

Valores superiores podrán incorporarse cuando la captura y el hardware lo permitan.

---

# 18. Biblioteca

SCREEN tendrá una biblioteca local de grabaciones.

Debe permitir:

* Ver grabaciones.
* Reproducir.
* Renombrar.
* Eliminar.
* Abrir ubicación.
* Consultar información.
* Buscar.
* Ordenar.
* Exportar.

Metadatos previstos:

```text
Nombre
Fecha
Duración
Resolución
FPS
Formato
Codec
Tamaño
Ubicación
```

---

# 19. Editor

SCREEN incluirá inicialmente un editor sencillo.

El objetivo no es competir con un editor profesional completo.

El editor inicial deberá permitir:

* Recortar inicio.
* Recortar final.
* Cortar segmentos.
* Eliminar segmentos.
* Unir segmentos.
* Vista previa.
* Exportación.

La edición deberá conservar el archivo original hasta que el usuario confirme la operación destructiva o genere una nueva versión.

---

# 20. Recovery System

Las grabaciones largas deben estar protegidas contra pérdidas provocadas por:

* Crash.
* Cierre inesperado.
* Fallo de aplicación.
* Interrupción del proceso.
* Problemas durante la finalización del archivo.

SCREEN deberá mantener información suficiente para intentar recuperar una sesión incompleta.

Flujo previsto:

```text
START RECORDING
       ↓
RECORDING SESSION
       ↓
CHECKPOINTS / TEMP DATA
       ↓
FINALIZATION
       ↓
FINAL FILE
```

Si se detecta una sesión recuperable:

```text
Se encontró una grabación recuperable.

[ RECUPERAR ]

[ ELIMINAR ]
```

---

# 21. Rendimiento

El rendimiento será una prioridad de arquitectura.

SCREEN debe minimizar:

* Uso de CPU.
* Uso de memoria.
* Copias innecesarias de frames.
* Latencia.
* Consumo de almacenamiento temporal.

Debe utilizar:

* Buffers controlados.
* Backpressure.
* Procesamiento concurrente.
* Hardware encoding cuando esté disponible.
* Gestión eficiente de memoria.

Una grabación no debe paralizar innecesariamente el equipo del usuario.

---

# 22. Arquitectura general

La arquitectura conceptual será:

```text
                    SCREEN by KLIK
                           │
             ┌─────────────┴─────────────┐
             │                           │
          UI LAYER                  GO CORE
                                         │
              ┌──────────────────────────┼──────────────────────┐
              │                          │                      │
          Capture                    Audio                  Camera
              │                          │                      │
              └──────────────────────────┼──────────────────────┘
                                         │
                                Recording Engine
                                         │
                                  Media Engine
                                         │
                               Encoder / Muxer
                                         │
                              ┌──────────┴──────────┐
                              │                     │
                           Library                Editor
                              │                     │
                              └──────────┬──────────┘
                                         │
                                      Export
```

---

# 23. Go

Go será el lenguaje principal del núcleo de aplicación.

Responsabilidades previstas:

* Orquestación.
* Estado.
* Configuración.
* Recording sessions.
* Jobs.
* Biblioteca.
* Exportación.
* IPC.
* Logging.
* Diagnóstico.
* Recovery.
* Integración con KLIK OS.

No se intentará implementar en Go puro todo el procesamiento multimedia de bajo nivel.

---

# 24. Native Layer

Las funciones dependientes del sistema operativo estarán encapsuladas.

En Windows:

```text
native/windows/
│
├── capture/
├── audio/
├── camera/
├── input/
├── monitor/
└── hardware/
```

El Core de Go se comunicará con estas capacidades mediante interfaces bien definidas.

---

# 25. Media Engine

La arquitectura multimedia deberá permanecer abstraída.

```text
Media Engine
│
├── Capture
├── Encode
├── Decode
├── Mux
├── Demux
├── Trim
├── Export
└── Probe
```

Si se utiliza FFmpeg u otro componente multimedia, su integración deberá permanecer encapsulada.

El resto de SCREEN no debe depender directamente de implementaciones específicas.

---

# 26. IPC

Los componentes que necesiten comunicarse fuera del proceso principal utilizarán IPC.

Objetivos:

* Aislamiento.
* Estabilidad.
* Control.
* Diagnóstico.
* Recuperación.

La tecnología concreta de IPC se definirá durante la fase de arquitectura técnica.

---

# 27. Interfaz

La interfaz deberá priorizar simplicidad.

Pantalla principal conceptual:

```text
┌─────────────────────────────────────────────┐
│              SCREEN by KLIK                 │
├─────────────────────────────────────────────┤
│                                             │
│                  ● GRABAR                   │
│                                             │
│     Pantalla     Ventana     Región         │
│                                             │
│     🔊 Sistema    🎙 Micrófono              │
│     🎥 Cámara     🖱 Cursor                 │
│                                             │
├─────────────────────────────────────────────┤
│ RECENT                                      │
│                                             │
│ Tutorial.mp4                  12:34         │
│ Demo.mp4                       08:21         │
│                                             │
└─────────────────────────────────────────────┘
```

La interfaz final podrá cambiar, pero debe conservar el principio de **mínima fricción**.

---

# 28. Quick Record

SCREEN tendrá un modo de grabación rápida.

El usuario debe poder comenzar una grabación con mínima configuración.

Configuración predeterminada:

```text
Pantalla principal
+
Audio del sistema
+
Micrófono opcional
+
30 FPS
+
H.264
+
MP4
```

Los valores definitivos serán configurables.

---

# 29. Configuración avanzada

Los usuarios avanzados tendrán acceso a:

```text
VIDEO
├── Resolution
├── FPS
├── Bitrate
├── Encoder
├── Hardware Encoder
└── Keyframe

AUDIO
├── Devices
├── Sample Rate
├── Channels
└── Bitrate

CAPTURE
├── Monitor
├── Window
├── Region
└── Cursor

CAMERA
├── Device
├── Resolution
├── Position
└── Size

OUTPUT
├── Format
├── Folder
├── Naming
└── Organization
```

---

# 30. Organización de archivos

SCREEN debe utilizar una estructura local organizada.

Ejemplo:

```text
SCREEN Recordings/
│
├── 2026/
│   └── 09/
│       └── 07/
│           ├── Recording_001.mp4
│           ├── Recording_002.mp4
│           └── Recording_003.mp4
│
└── Projects/
```

La ubicación deberá poder configurarse.

---

# 31. Nombres automáticos

SCREEN deberá poder generar nombres automáticamente.

Ejemplo:

```text
Screen_2026-09-07_18-30-42.mp4
```

El usuario podrá establecer patrones personalizados.

---

# 32. Seguridad

SCREEN debe aplicar principios de seguridad desde el comienzo.

Debe evitar:

* Ejecución innecesaria de privilegios elevados.
* Exposición de servicios de red innecesarios.
* Comunicación externa no autorizada.
* Acceso innecesario a archivos.
* Telemetría invasiva.

La aplicación debe funcionar con los privilegios mínimos necesarios.

---

# 33. Red

La funcionalidad principal de SCREEN **no requiere conexión a Internet**.

La aplicación no debe depender de una conexión para:

* Grabar.
* Pausar.
* Detener.
* Guardar.
* Editar.
* Exportar.

Cualquier función futura que utilice red deberá estar claramente separada del núcleo.

---

# 34. Integración KLIK

SCREEN podrá integrar posteriormente con el ecosistema KLIK.

Posibles integraciones:

* KLIK OS.
* Identidad.
* Configuración centralizada.
* Auditoría.
* Actualizaciones.
* Administración empresarial.

Pero:

> **SCREEN debe seguir funcionando completamente como aplicación independiente.**

---

# 35. Estructura conceptual del proyecto

```text
screen-by-klik/
│
├── cmd/
│   └── screen/
│
├── internal/
│   ├── app/
│   ├── capture/
│   ├── audio/
│   ├── camera/
│   ├── recording/
│   ├── encoding/
│   ├── media/
│   ├── editor/
│   ├── export/
│   ├── library/
│   ├── recovery/
│   ├── shortcuts/
│   ├── configuration/
│   ├── ipc/
│   ├── security/
│   └── diagnostics/
│
├── native/
│   └── windows/
│       ├── capture/
│       ├── audio/
│       ├── camera/
│       ├── input/
│       └── hardware/
│
├── ui/
│
├── assets/
│
├── tests/
│
├── docs/
│
└── build/
```

Esta estructura es conceptual y podrá ajustarse después de la auditoría técnica inicial.

---

# 36. Fases del proyecto

## FASE 0 — Product Definition

Definir y congelar:

* Alcance.
* Principios.
* Límites.
* MVP.
* Plataforma inicial.
* Requisitos funcionales.

**No desarrollar todavía.**

---

## FASE 1 — Foundation

* Proyecto.
* Build.
* Configuración.
* Logging.
* Diagnóstico.
* UI base.
* Core.

---

## FASE 2 — Capture Engine

* Desktop.
* Monitor.
* Región.
* Ventana.
* Multi-monitor.

---

## FASE 3 — Recording Engine

* Frames.
* Timing.
* Buffers.
* Sessions.
* Pause.
* Resume.
* Stop.
* Recovery.

---

## FASE 4 — Audio Engine

* System audio.
* Microphone.
* Mixing.
* Synchronization.

---

## FASE 5 — Encoding

* H.264.
* MP4.
* Hardware encoding.
* Bitrate.
* FPS.
* Resolución.

---

## FASE 6 — Camera

* Webcam.
* Overlay.
* Posición.
* Tamaño.

---

## FASE 7 — Effects

* Cursor.
* Click effects.
* Keystrokes.
* Overlays.

---

## FASE 8 — Library

* Grabaciones.
* Metadatos.
* Organización.
* Búsqueda.
* Reproducción.

---

## FASE 9 — Editor

* Timeline.
* Trim.
* Cut.
* Join.
* Preview.

---

## FASE 10 — Export

* Presets.
* Resolución.
* FPS.
* Codec.
* Container.

---

## FASE 11 — Hardening

Pruebas de:

* Grabaciones largas.
* Alta resolución.
* Multi-monitor.
* Alta carga de CPU.
* Baja memoria.
* Audio/video synchronization.
* Hardware encoding.
* Crash recovery.
* Archivos corruptos.
* Dispositivos desconectados.
* Cambio de resolución.
* Suspensión/reanudación del equipo.

---

## FASE 12 — Release

```text
Development
     ↓
Internal Build
     ↓
Alpha
     ↓
Beta
     ↓
Release Candidate
     ↓
Production
```

---

# 37. MVP

El MVP de SCREEN by KLIK deberá concentrarse exclusivamente en realizar perfectamente la función principal.

### MVP obligatorio

* Windows.
* Pantalla completa.
* Monitor específico.
* Región.
* Ventana.
* Audio del sistema.
* Micrófono.
* Pausa.
* Reanudación.
* Detención.
* Cursor.
* H.264.
* MP4.
* Hardware encoding cuando sea posible.
* Biblioteca básica.
* Recovery básico.

### Fuera del MVP

Inicialmente quedarán fuera:

* Editor avanzado.
* Efectos complejos.
* Streaming.
* Cloud.
* Colaboración.
* IA.
* Publicación automática.
* Integraciones externas innecesarias.

---

# 38. Criterio de calidad

SCREEN no se considerará terminado simplemente porque:

```text
"graba pantalla"
```

Debe cumplir simultáneamente:

```text
CAPTURA CORRECTA
        +
AUDIO SINCRONIZADO
        +
VIDEO ESTABLE
        +
BUEN RENDIMIENTO
        +
RECOVERY
        +
ARCHIVO VÁLIDO
        +
UX SIMPLE
        +
PRIVACIDAD
```

---

# 39. Criterio de aceptación del MVP

Una versión MVP será considerada funcional cuando pueda:

1. Abrirse correctamente.
2. Detectar los monitores.
3. Seleccionar una fuente de captura.
4. Seleccionar audio.
5. Iniciar grabación.
6. Mantener captura estable.
7. Pausar.
8. Reanudar.
9. Detener.
10. Finalizar correctamente el archivo.
11. Generar un MP4 reproducible.
12. Mantener audio y video sincronizados.
13. Recuperar una sesión cuando sea técnicamente posible.
14. Mostrar la grabación en la biblioteca.
15. Funcionar sin Internet.

---

# 40. Regla de arquitectura

Ningún módulo deberá asumir que otro módulo siempre estará disponible.

Las dependencias deberán establecerse mediante interfaces claras.

Especialmente:

```text
UI
 ↓
Application
 ↓
Domain
 ↓
Interfaces
 ↓
Implementations
```

La implementación concreta de captura, audio, cámara y multimedia deberá permanecer aislada.

---

# 41. Regla contra el crecimiento descontrolado

SCREEN no debe convertirse en un proyecto monolítico que intente hacer:

* Remote Desktop.
* Video conferencing.
* Streaming.
* Cloud storage.
* Social network.
* Video editor profesional.
* Sistema de vigilancia.

El producto debe permanecer enfocado.

> **SCREEN = Screen Recording.**

Las funcionalidades adicionales solamente podrán incorporarse cuando tengan relación directa con el flujo:

**CAPTURAR → GRABAR → EDITAR → EXPORTAR.**

---

# 42. Estado del proyecto

**STATUS: PRODUCT DEFINITION**

El proyecto se encuentra en etapa de definición.

No se considera iniciado el desarrollo hasta completar la especificación técnica correspondiente.

```text
[✓] Nombre
[✓] Propósito
[✓] Visión
[✓] Principios
[✓] Alcance inicial
[✓] MVP conceptual
[✓] Arquitectura conceptual
[ ] Arquitectura técnica definitiva
[ ] Selección definitiva de APIs nativas
[ ] Selección definitiva del Media Engine
[ ] Diseño UI definitivo
[ ] Implementación
[ ] Testing
[ ] Release
```

---

# 43. Regla principal del proyecto

> **Primero definir. Después diseñar. Después implementar.**

No se deberá comenzar a generar código de producción hasta que la arquitectura técnica haya sido revisada y aprobada.

---

# 44. Identidad

**Producto:** SCREEN by KLIK

**Categoría:** Screen Recorder

**Plataforma inicial:** Windows

**Core:** Go

**Modelo:** Desktop / Local-first

**Dependencia de Internet:** No requerida

**Cloud obligatorio:** No

**KLIK OS:** Integración opcional

**Estado:** Product Definition

---

## SCREEN by KLIK

### Capture. Record. Edit. Export.

**Un grabador de pantalla propio del ecosistema KLIK.**
