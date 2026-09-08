# SCREEN by KLIK

## Screen Recorder for Windows

**SCREEN by KLIK** es una aplicación de escritorio profesional para **captura y grabación de pantalla**, desarrollada para el ecosistema **KLIK**.

Su objetivo es permitir al usuario grabar de forma sencilla, estable y controlada:

* La pantalla completa.
* Un monitor específico.
* Una ventana específica.
* Una región seleccionada.
* La pantalla junto con audio del sistema.
* La pantalla junto con micrófono.
* La pantalla junto con cámara.
* Combinaciones configurables de estas fuentes.

SCREEN by KLIK está diseñado como un **grabador de pantalla nativo de escritorio**, no como una aplicación de acceso remoto, videoconferencia ni servicio de streaming.

---

# 1. Identidad del proyecto

**Nombre:** SCREEN by KLIK

**Categoría:** Screen Recorder / Desktop Capture

**Producto:** Aplicación de escritorio

**Plataforma inicial:** Windows

**Lenguaje principal:** Go

**Tipo de aplicación:** Desktop Application

**Propietario del producto:** KLIK

---

# 2. Propósito

SCREEN by KLIK debe proporcionar una herramienta profesional para crear grabaciones de pantalla de forma rápida y confiable.

El usuario debe poder:

1. Seleccionar qué desea grabar.
2. Configurar audio y vídeo.
3. Iniciar la grabación.
4. Controlar la grabación.
5. Pausar o detenerla cuando corresponda.
6. Procesar y codificar el contenido.
7. Guardar el resultado.
8. Abrir o administrar la grabación generada.

La aplicación debe priorizar:

* simplicidad;
* estabilidad;
* rendimiento;
* calidad;
* control del usuario;
* bajo consumo innecesario de recursos;
* comportamiento predecible.

---

# 3. Qué es SCREEN

SCREEN es principalmente un **grabador de pantalla**.

Su función central es:

```text
CAPTURAR
   ↓
PROCESAR
   ↓
CODIFICAR
   ↓
GUARDAR
```

El producto puede incorporar funcionalidades adicionales relacionadas directamente con la grabación, pero todas ellas deben mantener una relación clara con el objetivo principal.

---

# 4. Qué NO es SCREEN

SCREEN by KLIK **NO es**:

* un software de acceso remoto;
* un escritorio remoto;
* una herramienta de administración remota;
* un servidor de control remoto;
* un sistema de videoconferencia;
* una plataforma de streaming;
* un editor de vídeo completo;
* un sistema de vigilancia;
* un sistema de monitoreo remoto;
* un servicio SaaS obligatorio;
* una aplicación que dependa de una cuenta en la nube para funcionar.

Cualquier funcionalidad futura que pertenezca a esas categorías debe tratarse como otro producto o proyecto.

---

# 5. Visión del producto

SCREEN by KLIK debe evolucionar hacia un grabador de pantalla de escritorio profesional capaz de competir funcionalmente con herramientas comerciales de captura de pantalla.

La aplicación debe permitir diferentes niveles de uso:

### Grabación rápida

El usuario selecciona una fuente y comienza a grabar inmediatamente.

### Grabación configurada

El usuario puede establecer:

* fuente;
* resolución;
* FPS;
* calidad;
* codec;
* audio;
* micrófono;
* cámara;
* cursor;
* destino;
* teclas rápidas;
* opciones visuales.

### Grabación profesional

El sistema debe permitir combinar múltiples fuentes y opciones de captura sin sacrificar estabilidad.

---

# 6. Fuentes de captura

SCREEN debe contemplar como fuentes principales:

## 6.1 Pantalla completa

Captura todo el escritorio correspondiente al monitor seleccionado.

## 6.2 Monitor específico

Permite seleccionar uno de los monitores detectados por el sistema.

## 6.3 Ventana

Permite seleccionar una ventana concreta para grabarla.

## 6.4 Región

Permite seleccionar manualmente un rectángulo de captura.

La selección debe permitir establecer:

* posición;
* tamaño;
* resolución efectiva;
* relación con el escritorio;
* comportamiento ante cambios de resolución.

---

# 7. Audio

SCREEN debe soportar fuentes de audio configurables.

Como mínimo:

* audio del sistema;
* micrófono;
* combinación de audio del sistema y micrófono.

La arquitectura de audio debe mantener separadas las etapas de:

```text
AUDIO SOURCE
     ↓
CAPTURE
     ↓
PROCESSING
     ↓
SYNCHRONIZATION
     ↓
ENCODING
     ↓
OUTPUT
```

La sincronización entre audio y vídeo es un requisito fundamental.

---

# 8. Cámara

SCREEN debe poder incorporar una cámara durante una grabación cuando el hardware y el sistema operativo lo permitan.

La cámara debe poder funcionar como:

* fuente secundaria;
* overlay;
* imagen dentro de la grabación.

La implementación debe mantener separada la captura de cámara del motor principal de captura de pantalla.

---

# 9. Cursor

El sistema debe contemplar el cursor como elemento configurable.

Opciones previstas:

* mostrar cursor;
* ocultar cursor;
* capturar posición;
* resaltar cursor;
* representar clics cuando esté habilitado.

Estas funcionalidades deberán definirse técnicamente en `CURSOR.md`.

---

# 10. Grabación

El motor de grabación será responsable de coordinar:

```text
Screen Capture
       +
Audio Capture
       +
Microphone
       +
Camera
       +
Cursor
       ↓
Recording Pipeline
       ↓
Encoder
       ↓
Output File
```

El motor debe controlar correctamente:

* inicio;
* pausa;
* reanudación;
* finalización;
* errores;
* sincronización;
* flush de datos;
* cierre seguro del archivo.

Una interrupción inesperada no debe provocar, cuando técnicamente sea posible evitarlo, la pérdida completa de una grabación.

---

# 11. Codificación

La arquitectura debe separar:

```text
CAPTURE
   ≠
ENCODING
   ≠
FILE OUTPUT
```

El motor de captura no debe estar acoplado innecesariamente a un único formato o codec.

La arquitectura debe permitir seleccionar posteriormente diferentes tecnologías de codificación sin rediseñar todo el sistema.

Las decisiones definitivas de codecs, contenedores y parámetros se establecerán en:

`ENCODING.md`

y

`VIDEO-FORMATS.md`.

---

# 12. Formatos de salida

SCREEN debe generar archivos de vídeo utilizables por aplicaciones comunes.

El formato principal y los formatos adicionales serán definidos en:

`VIDEO-FORMATS.md`

La aplicación debe evitar producir archivos incompletos o corruptos como consecuencia de un cierre normal.

El cierre correcto de una grabación debe incluir el proceso necesario para finalizar el contenedor y liberar todos los recursos.

---

# 13. Interfaz de usuario

La interfaz debe ser clara y orientada a la grabación.

El usuario debe poder identificar rápidamente:

* qué va a grabar;
* qué audio está activo;
* si la cámara está activa;
* dónde se guardará;
* cuándo está grabando;
* cuánto tiempo lleva grabando;
* cómo detener la grabación.

La interfaz no debe obligar al usuario a navegar por configuraciones complejas para realizar una grabación básica.

---

# 14. Flujo principal

El flujo principal del producto será:

```text
APPLICATION START
       ↓
SOURCE SELECTION
       ↓
RECORDING CONFIGURATION
       ↓
READY
       ↓
RECORD
       ↓
PAUSE / RESUME
       ↓
STOP
       ↓
FINALIZE
       ↓
SAVE
       ↓
RECORDING AVAILABLE
```

---

# 15. Arquitectura conceptual

SCREEN debe utilizar una arquitectura modular.

Conceptualmente:

```text
                 SCREEN by KLIK
                       │
        ┌──────────────┼──────────────┐
        │              │              │
       UI           CONTROL        SETTINGS
        │              │              │
        └──────────────┼──────────────┘
                       │
                RECORDING ENGINE
                       │
        ┌──────────────┼──────────────┐
        │              │              │
     CAPTURE          AUDIO         CAMERA
        │              │              │
        └──────────────┼──────────────┘
                       │
                    PROCESS
                       │
                   ENCODING
                       │
                    OUTPUT
```

Los componentes concretos y sus interfaces se definirán posteriormente en:

* `ARCHITECTURE.md`
* `COMPONENTS.md`
* `MODULES.md`
* `FUNCTIONS.md`

---

# 16. Principios de arquitectura

SCREEN debe respetar los siguientes principios:

### 16.1 Separación de responsabilidades

Cada módulo debe tener una responsabilidad claramente definida.

### 16.2 Bajo acoplamiento

Los componentes de captura no deben depender directamente de la interfaz gráfica.

### 16.3 Interfaces

Las capacidades que puedan variar entre plataformas, APIs o tecnologías deben abstraerse mediante interfaces apropiadas.

### 16.4 Testabilidad

Los componentes deben poder probarse individualmente siempre que sea técnicamente posible.

### 16.5 Extensibilidad

La incorporación de nuevas fuentes, codecs o funcionalidades no debe requerir una reescritura completa del sistema.

### 16.6 Seguridad

La aplicación debe ejecutarse con los privilegios mínimos necesarios.

### 16.7 Rendimiento

La captura debe diseñarse considerando especialmente:

* CPU;
* GPU;
* memoria;
* almacenamiento;
* ancho de banda interno;
* latencia del pipeline.

---

# 17. Tecnología

El lenguaje principal del proyecto será:

**Go**

La arquitectura debe evitar dependencias innecesarias y mantener claramente identificadas las integraciones con APIs nativas del sistema operativo.

Las tecnologías concretas de:

* captura;
* audio;
* cámara;
* codecs;
* aceleración;
* interfaz;

serán definidas en los documentos técnicos correspondientes.

No se debe seleccionar una tecnología únicamente por conveniencia de implementación.

Debe evaluarse:

* estabilidad;
* rendimiento;
* mantenimiento;
* compatibilidad;
* licencia;
* integración con Windows;
* soporte de hardware.

---

# 18. Dependencias externas

Las dependencias externas deben mantenerse bajo control.

Cada dependencia deberá tener una justificación técnica.

No se permitirá introducir una dependencia:

* duplicada;
* innecesaria;
* abandonada;
* incompatible con la licencia del proyecto;
* utilizada solamente para resolver una tarea trivial que pueda resolverse adecuadamente dentro de la arquitectura.

Las dependencias críticas deberán documentarse.

---

# 19. Privacidad

SCREEN debe ser un producto local-first.

La grabación debe procesarse localmente en el equipo del usuario.

El sistema no debe enviar automáticamente las grabaciones a servidores externos.

No se debe introducir telemetría obligatoria sin que exista una especificación explícita para ello.

La privacidad será desarrollada en:

`PRIVACY.md`

---

# 20. Seguridad

La aplicación debe seguir principios de seguridad desde el comienzo del proyecto.

Como mínimo:

* privilegios mínimos;
* validación de rutas;
* protección contra escritura accidental fuera del destino;
* validación de configuración;
* manejo seguro de archivos temporales;
* limpieza de recursos;
* protección de procesos;
* manejo seguro de errores;
* ausencia de secretos embebidos.

Los requisitos completos estarán en:

`SECURITY.md`

---

# 21. Rendimiento

El rendimiento es una característica fundamental.

SCREEN debe diseñarse para evitar:

* pérdidas innecesarias de frames;
* bloqueos de interfaz;
* consumo excesivo de memoria;
* crecimiento incontrolado de buffers;
* bloqueos durante la escritura;
* desincronización audio/vídeo.

La captura y codificación deben utilizar pipelines apropiados para mantener la interfaz responsiva.

---

# 22. Hardware acceleration

Cuando sea compatible con el hardware y el sistema operativo, SCREEN debe poder aprovechar aceleración por hardware.

La arquitectura debe permitir utilizar capacidades disponibles de:

* GPU;
* codificadores hardware;
* APIs multimedia del sistema.

La aceleración no debe ser un requisito absoluto para que la aplicación funcione.

Debe existir un camino de software cuando sea viable.

Las decisiones técnicas se documentarán en:

`HARDWARE-ACCELERATION.md`.

---

# 23. Compatibilidad

La primera plataforma objetivo será:

**Windows**

La compatibilidad concreta con versiones de Windows deberá quedar definida en:

`COMPATIBILITY.md`.

La aplicación debe detectar de forma controlada capacidades no disponibles y presentar errores comprensibles al usuario.

---

# 24. Configuración

Las preferencias del usuario deben estar centralizadas.

Entre ellas:

* fuente de captura;
* resolución;
* FPS;
* calidad;
* codec;
* formato;
* destino;
* audio;
* micrófono;
* cámara;
* cursor;
* hotkeys;
* overlays;
* opciones visuales.

La configuración debe estar separada de la lógica de captura.

---

# 25. Hotkeys

SCREEN debe soportar teclas rápidas configurables para operaciones como:

* iniciar grabación;
* detener;
* pausar;
* reanudar.

El sistema debe evitar conflictos peligrosos con combinaciones del sistema operativo.

La especificación completa estará en:

`HOTKEYS.md`.

---

# 26. Manejo de errores

Los errores deben clasificarse.

Como mínimo:

```text
CONFIGURATION ERROR
CAPTURE ERROR
AUDIO ERROR
CAMERA ERROR
ENCODER ERROR
OUTPUT ERROR
DEVICE ERROR
RESOURCE ERROR
SYSTEM ERROR
```

Cada error debe proporcionar información suficiente para:

* diagnosticarlo;
* registrarlo;
* mostrar un mensaje apropiado;
* determinar si la operación puede continuar.

---

# 27. Logging

SCREEN debe disponer de logging estructurado.

Los logs deben servir para:

* diagnóstico;
* soporte;
* desarrollo;
* análisis de errores;
* validación.

Los logs no deben contener innecesariamente información privada del usuario.

La especificación estará en:

`LOGGING.md`.

---

# 28. Testing

Ninguna fase debe considerarse terminada únicamente porque el código compile.

La validación debe incluir, cuando corresponda:

```text
BUILD
  ↓
UNIT TESTS
  ↓
INTEGRATION TESTS
  ↓
FUNCTIONAL TESTS
  ↓
PERFORMANCE TESTS
  ↓
REAL CAPTURE
  ↓
OUTPUT VALIDATION
```

El sistema deberá demostrar que una grabación real:

1. inicia;
2. captura;
3. mantiene sincronización;
4. finaliza;
5. genera un archivo;
6. produce un archivo reproducible;
7. libera correctamente los recursos.

---

# 29. Code Assist

Code Assist será utilizado como herramienta de implementación.

Sin embargo, la documentación del proyecto constituye la autoridad técnica.

Code Assist deberá:

1. Leer `README.md`.
2. Leer `REQUIREMENTS.md`.
3. Leer la documentación específica de la fase.
4. Respetar la arquitectura.
5. Implementar únicamente el alcance autorizado.
6. Ejecutar las pruebas correspondientes.
7. Resolver errores de compilación.
8. Verificar los criterios de aceptación.
9. Informar exactamente qué fue implementado.
10. No declarar terminada una fase sin evidencia.

Code Assist **no debe inventar requisitos**.

Code Assist **no debe cambiar unilateralmente la arquitectura**.

Code Assist **no debe eliminar funcionalidades existentes para solucionar un problema**.

Las reglas completas estarán en:

`CODE-ASSIST-CONTRACT.md`.

---

# 30. Trazabilidad

Cada requisito deberá poder relacionarse con:

```text
REQUIREMENT
     ↓
COMPONENT
     ↓
MODULE
     ↓
FUNCTION
     ↓
PHASE
     ↓
TEST
```

Esta relación será mantenida en:

`TRACEABILITY.md`.

---

# 31. Desarrollo por fases

SCREEN se desarrollará de forma incremental.

Ninguna fase deberá depender de funcionalidades futuras no especificadas.

Cada fase tendrá:

* objetivo;
* alcance;
* requisitos;
* módulos;
* funciones;
* dependencias;
* pruebas;
* criterios de aceptación;
* entregables;
* exclusiones.

---

# 32. Regla de cambios

Los cambios importantes deberán reflejarse primero en la documentación maestra.

Si una modificación cambia:

* comportamiento;
* arquitectura;
* interfaz;
* protocolo;
* requisitos;
* dependencias;
* almacenamiento;
* seguridad;

la documentación correspondiente deberá actualizarse antes o junto con la implementación.

No se permitirá que el código se convierta silenciosamente en la nueva especificación.

---

# 33. Estado del proyecto

Estado inicial:

**GREENFIELD / STARTING FROM ZERO**

Este repositorio se considera una nueva implementación de SCREEN by KLIK.

No se debe asumir que existe código heredado que deba conservarse.

No se debe diseñar la arquitectura alrededor de código inexistente.

La implementación debe comenzar a partir de los contratos definidos en esta documentación.

---

# 34. Estructura documental

La documentación oficial del proyecto será:

```text
README.md
REQUIREMENTS.md
ARCHITECTURE.md
COMPONENTS.md
MODULES.md
FUNCTIONS.md

RECORDING.md
CAPTURE.md
AUDIO.md
CAMERA.md
SCREEN-SOURCES.md
WINDOWS.md
REGION-SELECTOR.md

ENCODING.md
VIDEO-FORMATS.md
OUTPUT.md
FILES.md

HOTKEYS.md
OVERLAYS.md
CURSOR.md
ANNOTATIONS.md
WATERMARK.md

UI.md
UX-FLOWS.md
SETTINGS.md

SECURITY.md
PRIVACY.md
LOGGING.md
ERROR-HANDLING.md

PERFORMANCE.md
COMPATIBILITY.md
HARDWARE-ACCELERATION.md

TESTING.md
BUILD.md
INSTALLATION.md
RELEASE.md

CODE-ASSIST-CONTRACT.md
TRACEABILITY.md
ROADMAP.md
CHANGELOG.md
```

---

# 35. Fuente de verdad

La documentación oficial constituye la **fuente de verdad del proyecto**.

En caso de discrepancia:

```text
REQUIREMENTS
      ↓
ARCHITECTURE
      ↓
SPECIALIZED SPECIFICATION
      ↓
PHASE CONTRACT
      ↓
IMPLEMENTATION
```

El código no podrá contradecir deliberadamente un requisito aprobado.

Si existe una contradicción, debe identificarse y resolverse mediante actualización documental controlada.

---

# 36. Objetivo final

El objetivo de SCREEN by KLIK es entregar un grabador de pantalla de escritorio:

* profesional;
* estable;
* rápido;
* modular;
* mantenible;
* local;
* seguro;
* extensible;
* con buena calidad de grabación;
* con control completo de las fuentes;
* preparado para diferentes configuraciones de hardware;
* y construido mediante contratos técnicos verificables.

La meta no es simplemente producir un programa que "grabe la pantalla".

La meta es construir correctamente el **motor de captura y grabación SCREEN by KLIK**, con una arquitectura capaz de evolucionar sin convertirse en un conjunto de parches.

---

# 37. Regla fundamental del proyecto

> **Primero se define. Después se diseña. Después se implementa. Después se prueba.**

Nunca al revés.

```text
DOCUMENTACIÓN
      ↓
ARQUITECTURA
      ↓
CONTRATO
      ↓
IMPLEMENTACIÓN
      ↓
TEST
      ↓
VALIDACIÓN
      ↓
RELEASE
```

**SCREEN by KLIK**

**Desktop Screen Recorder**

**KLIK**
