# ENCODING.md

# SCREEN by KLIK — Encoding

**Ruta:** `docs/technical/ENCODING.md`
**Versión documental:** `0.1.0-alpha`
**Estado:** `PLANNED`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADO`
**Certificación:** `NO CERTIFICADO`

---

## 1. Propósito

Este documento define las bases técnicas del subsistema de **codificación de video y audio** de SCREEN by KLIK.

El subsistema `ENCODING` será responsable de transformar los datos audiovisuales procesados en una representación codificada apta para integrarse en el archivo final de grabación.

Su responsabilidad deberá mantenerse separada de:

* captura de pantalla;
* captura de audio;
* captura de cámara;
* composición;
* selección de fuentes;
* interfaz de usuario;
* escritura final del archivo;
* administración general del ciclo de grabación.

La implementación concreta permanece pendiente de definición y validación.

---

## 2. Alcance

El subsistema deberá contemplar conceptualmente:

* recepción de video;
* recepción de audio;
* timestamps;
* sincronización;
* configuración del encoder;
* selección de codec;
* procesamiento;
* codificación;
* control de calidad;
* gestión de errores;
* control de recursos;
* aceleración por hardware cuando corresponda;
* fallback;
* finalización;
* comunicación con `OUTPUT`.

No se establece todavía:

* codec obligatorio;
* encoder concreto;
* biblioteca;
* API;
* contenedor;
* parámetros de calidad;
* bitrate;
* perfil;
* nivel;
* implementación de hardware acceleration.

Todos esos elementos permanecen `TBD`.

---

## 3. Principio fundamental

La existencia de una capacidad de codificación en un sistema operativo o dispositivo **no implica que SCREEN sea compatible con ella**.

Debe distinguirse:

```text
CODEC DISPONIBLE
      ↓
ENCODER DISPONIBLE
      ↓
ENCODER UTILIZABLE
      ↓
CONFIGURACIÓN VÁLIDA
      ↓
CODIFICACIÓN CORRECTA
      ↓
SALIDA VÁLIDA
      ↓
COMPATIBILIDAD VERIFICADA
      ↓
CERTIFICACIÓN
```

---

## 4. Flujo conceptual

```text
VIDEO FRAMES
      │
      ▼
TIMESTAMPS
      │
      ▼
PROCESSING / COMPOSITION
      │
      ▼
VIDEO ENCODER
      │
      ├──────────────┐
      │              │
      ▼              ▼
VIDEO DATA       ENCODING EVENTS
      │
      │
AUDIO SAMPLES
      │
      ▼
AUDIO ENCODER
      │
      ▼
ENCODED STREAMS
      │
      ▼
OUTPUT / MUXING
      │
      ▼
FINAL RECORDING
```

La arquitectura definitiva podrá modificar este flujo cuando existan decisiones aprobadas.

---

## 5. Entrada de video

El encoder podrá recibir:

* frames de pantalla;
* frames de cámara;
* frames procesados;
* frames compuestos.

La entrada deberá preservar información temporal suficiente para mantener continuidad y sincronización.

Deberá definirse:

* resolución;
* frame rate;
* formato de píxel;
* espacio de color;
* timestamps;
* orden temporal;
* comportamiento ante frames perdidos.

Estos parámetros son `TBD`.

---

## 6. Entrada de audio

La codificación de audio deberá recibir muestras provenientes del subsistema de audio.

Debe preservarse:

* orden temporal;
* timestamps;
* continuidad;
* sincronización;
* comportamiento ante pérdida de muestras;
* finalización correcta.

La especificación detallada de adquisición de audio pertenece a `AUDIO.md`.

---

## 7. Sincronización audiovisual

La codificación no deberá destruir la relación temporal entre:

* video;
* audio del sistema;
* micrófono;
* cámara;
* otros flujos soportados.

Debe contemplarse:

* timestamps;
* clock source;
* drift;
* buffering;
* pausas;
* reanudaciones;
* frames descartados;
* muestras perdidas;
* finalización.

Una grabación técnicamente codificada pero temporalmente incorrecta deberá considerarse defectuosa.

---

## 8. Codec

La selección de codecs permanece:

**`TBD`**

No se deberá asumir que un codec es obligatorio únicamente por ser común o ampliamente utilizado.

La selección deberá considerar:

* compatibilidad;
* calidad;
* rendimiento;
* tamaño;
* disponibilidad;
* aceleración;
* licenciamiento;
* plataformas;
* interoperabilidad;
* estabilidad;
* soporte del contenedor seleccionado.

---

## 9. Encoder

La arquitectura deberá permitir separar conceptualmente:

```text
ENCODING CONTRACT
       │
       ├── SOFTWARE ENCODER
       │
       └── HARDWARE ENCODER
```

La implementación concreta queda pendiente.

No se aprobará una dependencia específica sin evaluación técnica.

---

## 10. Hardware Acceleration

La aceleración por hardware se encuentra definida transversalmente en:

`docs/platform/TRANSVERSAL/HARDWARE-ACCELERATION.md`

Debe mantenerse la distinción:

```text
GPU PRESENTE
≠
HARDWARE ACCELERATION DISPONIBLE
≠
ENCODER HARDWARE DISPONIBLE
≠
ENCODER HARDWARE UTILIZABLE
≠
MEJOR RENDIMIENTO
≠
CERTIFICADO
```

El encoder deberá poder comunicar de forma verificable cuando una capacidad:

* no existe;
* no está disponible;
* no puede inicializarse;
* falla;
* requiere fallback.

---

## 11. Fallback

Cuando el modo preferido de codificación no esté disponible, deberá existir un comportamiento explícito.

Conceptualmente:

```text
ENCODER PREFERIDO
      │
      ├── OK ───────► CONTINUE
      │
      └── FAILURE
             │
             ▼
       FALLBACK POLICY
             │
             ├── ALTERNATIVE ENCODER
             ├── SOFTWARE PATH
             └── FAIL
```

La política concreta será definida posteriormente.

Nunca deberá ocultarse un fallback relevante al usuario o a los diagnósticos técnicos.

---

## 12. Calidad

La calidad de codificación deberá evaluarse mediante parámetros medibles.

Podrán contemplarse:

* resolución;
* frame rate;
* bitrate;
* calidad perceptual;
* tamaño;
* latencia;
* estabilidad;
* carga de CPU/GPU.

Los valores concretos permanecen `TBD`.

No deberán utilizarse estimaciones como resultados de calidad.

---

## 13. Rendimiento

La codificación puede convertirse en uno de los principales consumidores de recursos.

Deberá medirse:

* CPU;
* GPU;
* memoria;
* throughput;
* frames procesados;
* frames descartados;
* latencia;
* tiempo de finalización;
* estabilidad durante sesiones prolongadas.

Las métricas reales pertenecen a la evidencia de pruebas y no a esta especificación.

---

## 14. Backpressure

El encoder deberá formar parte de una arquitectura capaz de controlar diferencias de velocidad entre:

```text
CAPTURE
   ↓
PROCESSING
   ↓
ENCODING
   ↓
OUTPUT
```

No deberá permitirse crecimiento indefinido de buffers.

Las políticas concretas de:

* bloqueo;
* descarte;
* reducción;
* pausa;
* degradación;

permanecen `TBD`.

---

## 15. Errores

Los errores deberán distinguir al menos conceptualmente:

* configuración inválida;
* codec no disponible;
* encoder no disponible;
* inicialización fallida;
* entrada inválida;
* pérdida de recursos;
* saturación;
* hardware failure;
* timeout;
* cancelación;
* finalización incompleta;
* corrupción de salida.

Un error de encoding no deberá convertirse silenciosamente en una grabación aparentemente correcta.

---

## 16. Cancelación

Una cancelación deberá:

1. detener nuevas entradas;
2. procesar o descartar datos pendientes según política;
3. finalizar recursos;
4. informar el estado;
5. determinar si existe un resultado recuperable;
6. evitar fugas de recursos.

El comportamiento exacto será definido durante implementación.

---

## 17. Finalización

La finalización deberá distinguir:

```text
ENCODING FINISHED
        ≠
FILE VALID
        ≠
RECORDING COMPLETE
```

El resultado deberá ser entregado a `OUTPUT` para su validación y finalización.

---

## 18. Seguridad

El encoder deberá considerar:

* entradas no válidas;
* límites de recursos;
* memoria;
* archivos temporales;
* dependencias externas;
* librerías de terceros;
* fallos nativos;
* aislamiento cuando sea necesario.

Las interfaces nativas y dependencias de bajo nivel deberán tratarse como límites de confianza cuando corresponda.

---

## 19. Privacidad

El encoder procesará información potencialmente sensible.

No deberá:

* transmitir contenido sin autorización;
* generar telemetría no aprobada;
* registrar frames;
* registrar audio;
* escribir contenido audiovisual en logs.

La política completa se encuentra en:

* `docs/security/PRIVACY.md`
* `docs/security/SECURITY.md`

---

## 20. Compatibilidad

La codificación deberá validarse por combinación real de:

* sistema operativo;
* arquitectura;
* CPU;
* GPU;
* drivers;
* encoder;
* codec;
* configuración;
* resolución;
* frame rate;
* duración;
* salida.

La compatibilidad teórica no constituye certificación.

---

## 21. Pruebas

Deberán contemplarse posteriormente:

* encoding básico;
* diferentes resoluciones;
* diferentes frame rates;
* audio + video;
* cámara + pantalla;
* pausas;
* reanudaciones;
* cancelación;
* pérdida de encoder;
* fallback;
* saturación;
* sesiones prolongadas;
* salida inválida;
* hardware acceleration;
* software fallback;
* regresión.

Cada resultado deberá tener evidencia.

---

## 22. Evidencia

La evidencia podrá incluir, cuando exista:

* configuración utilizada;
* plataforma;
* hardware;
* versión;
* codec;
* encoder;
* métricas;
* resultado;
* logs técnicos;
* archivo producido;
* validación del archivo;
* prueba reproducible.

No deberán inventarse resultados.

---

## 23. Gaps

| ID          | Gap                   |
| ----------- | --------------------- |
| GAP-ENC-001 | Codec(s) soportados   |
| GAP-ENC-002 | Encoder abstraction   |
| GAP-ENC-003 | Parámetros de calidad |
| GAP-ENC-004 | Audio encoding        |
| GAP-ENC-005 | Video encoding        |
| GAP-ENC-006 | Hardware encoding     |
| GAP-ENC-007 | Software fallback     |
| GAP-ENC-008 | Backpressure policy   |
| GAP-ENC-009 | Output integration    |
| GAP-ENC-010 | Compatibility matrix  |

---

## 24. Estado actual

| Elemento          | Estado            |
| ----------------- | ----------------- |
| Documentación     | `DOCUMENTED`      |
| Diseño conceptual | `PLANNED`         |
| Implementación    | `NO IMPLEMENTADA` |
| Pruebas           | `NO EJECUTADAS`   |
| Evidencia         | `NO DISPONIBLE`   |
| Validación        | `NO VALIDADO`     |
| Certificación     | `NO CERTIFICADO`  |

---

## 25. Evolución

```text
PLANNED
   ↓
DESIGNED
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

---

## 26. Regla de integridad

> **ENCODING no deberá considerarse funcional por el simple hecho de producir bytes.**

La codificación deberá producir una salida técnicamente válida, verificable, reproducible y compatible con el contrato de grabación.

**SCREEN by KLIK no deberá declarar soporte de encoding sin evidencia.**
