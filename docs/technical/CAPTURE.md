# SCREEN by KLIK — Capture

**Documento:** `docs/technical/CAPTURE.md`
**Proyecto:** SCREEN by KLIK
**Categoría:** Technical / Capture
**Estado:** `PLANNED`
**Versión documental:** `0.1.0-alpha`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADA`
**Certificación:** `NO CERTIFICADA`

---

# 1. Propósito

Este documento define la arquitectura técnica conceptual del subsistema de captura de pantalla de SCREEN by KLIK.

La captura constituye una de las funciones fundamentales del producto.

Su responsabilidad es adquirir contenido visual desde una fuente autorizada y entregarlo al pipeline de procesamiento y grabación.

---

# 2. Responsabilidad

El subsistema de captura es responsable conceptualmente de:

* descubrir fuentes;
* seleccionar una fuente;
* inicializar la captura;
* adquirir frames;
* generar timestamps;
* entregar frames;
* manejar errores;
* detenerse correctamente;
* liberar recursos.

No es responsable de:

* encoding final;
* escritura definitiva del archivo;
* UI completa;
* distribución del producto.

---

# 3. Fuentes

Las fuentes potenciales incluyen conceptualmente:

```text
CAPTURE SOURCES
├── FULL SCREEN
├── WINDOW
├── REGION
└── OTHER SUPPORTED SOURCE
```

La lista definitiva dependerá del alcance aprobado.

---

# 4. Descubrimiento

El sistema deberá identificar las fuentes disponibles.

Debe poder diferenciar:

```text
AVAILABLE
UNAVAILABLE
INVALID
UNKNOWN
```

---

# 5. Selección

La fuente deberá ser seleccionada explícitamente.

```text
DISCOVER
   ↓
SELECT
   ↓
VALIDATE
   ↓
INITIALIZE
```

---

# 6. Inicialización

Antes de comenzar deberá validarse:

* fuente;
* resolución;
* región;
* permisos;
* recursos;
* configuración;
* compatibilidad.

---

# 7. Frames

La captura deberá producir unidades visuales que puedan procesarse posteriormente.

Cada frame deberá mantener información temporal suficiente para permitir sincronización.

---

# 8. Timestamps

Los timestamps son fundamentales para:

* orden;
* sincronización;
* detección de pérdida;
* pausas;
* reanudaciones;
* encoding.

La estrategia concreta de reloj es `TBD`.

---

# 9. Frame Rate

El frame rate soportado será determinado mediante:

* requisitos;
* capacidades de plataforma;
* hardware;
* rendimiento;
* pruebas.

No se fija un valor universal en este documento.

---

# 10. Resolución

La resolución deberá respetar las capacidades reales de:

* fuente;
* monitor;
* plataforma;
* pipeline;
* encoder;
* output.

---

# 11. Región

Si la región de captura forma parte del alcance, deberá existir una representación consistente entre:

```text
USER SELECTED REGION
        ↓
CAPTURE REGION
        ↓
OUTPUT FRAME
```

---

# 12. Window Capture

La captura de una ventana deberá manejar correctamente situaciones como:

* ventana no disponible;
* minimización;
* movimiento;
* cambio de tamaño;
* cambio de monitor;
* cambio de escala.

El comportamiento exacto es `TBD`.

---

# 13. Multi-monitor

Debe contemplarse:

* múltiples pantallas;
* resoluciones diferentes;
* DPI diferentes;
* escalado;
* orientación;
* movimiento de ventanas;
* monitor desconectado.

---

# 14. DPI y Scaling

La captura deberá diferenciar:

```text
PHYSICAL PIXELS
≠
LOGICAL COORDINATES
```

La estrategia definitiva para cada plataforma deberá definirse y probarse.

---

# 15. Cursor

El cursor puede formar parte del resultado o ser tratado separadamente.

La decisión técnica deberá coordinarse con:

`docs/ui/CURSOR.md`

---

# 16. Annotations

Las anotaciones pueden incorporarse antes o durante la composición.

La estrategia deberá coordinarse con:

`docs/ui/ANNOTATIONS.md`

---

# 17. Overlays

Los overlays deberán diferenciarse entre:

```text
UI OVERLAY
```

y:

```text
RECORDED OVERLAY
```

La composición final es `TBD`.

---

# 18. Buffering

El pipeline deberá manejar diferencias de velocidad entre:

```text
CAPTURE
   ↓
PROCESSING
   ↓
ENCODING
```

Debe evitarse el crecimiento ilimitado de buffers.

---

# 19. Backpressure

Cuando el procesamiento sea más lento que la captura deberá existir una estrategia definida.

Posibilidades conceptuales:

* bloquear;
* descartar;
* degradar;
* reducir carga;
* aplicar backpressure.

La estrategia definitiva es `TBD`.

---

# 20. Frames descartados

Los frames descartados deberán ser detectables.

No deben convertirse en una pérdida silenciosa que impida diagnosticar degradación.

---

# 21. Pérdida de fuente

Si la fuente desaparece:

```text
SOURCE LOST
    ↓
DETECT
    ↓
HANDLE
    ↓
RECOVER / FAIL
```

La recuperación automática solamente podrá existir después de ser diseñada y validada.

---

# 22. Pausa

Durante `PAUSED` deberán existir reglas explícitas sobre:

* captura;
* buffers;
* timestamps;
* recursos;
* audio;
* cámara.

---

# 23. Reanudación

Al pasar nuevamente a `RECORDING` deberá preservarse la coherencia temporal.

---

# 24. Stop

La detención deberá producir:

```text
STOP
 ↓
CAPTURE TERMINATION
 ↓
RESOURCE RELEASE
 ↓
FINALIZATION
```

No debe dejar procesos ni recursos activos innecesariamente.

---

# 25. Cancelación

La cancelación deberá distinguirse de una finalización normal.

```text
COMPLETED
≠
CANCELLED
```

---

# 26. Errores

Deberán contemplarse:

* fuente inválida;
* permiso denegado;
* dispositivo no disponible;
* error de captura;
* frame inválido;
* timestamp inválido;
* buffer failure;
* resource exhaustion;
* pipeline failure.

---

# 27. Rendimiento

Deberán medirse:

* FPS;
* dropped frames;
* CPU;
* GPU;
* memoria;
* latencia;
* throughput;
* estabilidad.

---

# 28. Recursos

El subsistema debe administrar correctamente:

* buffers;
* memoria;
* handles;
* dispositivos;
* recursos gráficos;
* procesos asociados.

---

# 29. Seguridad

La captura solamente deberá acceder a fuentes autorizadas.

No deberá ampliar innecesariamente los privilegios del proceso.

---

# 30. Privacidad

El contenido de pantalla puede contener:

* información personal;
* documentos;
* credenciales;
* comunicaciones;
* información empresarial.

La captura deberá considerarse potencialmente sensible.

Relacionamiento:

`docs/security/PRIVACY.md`

---

# 31. Plataformas

El subsistema deberá validarse individualmente en:

```text
DESKTOP
├── WINDOWS
├── LINUX
└── MACOS

MOBILE
├── ANDROID
└── IOS
```

---

# 32. Compatibilidad

La compatibilidad deberá evaluarse considerando:

* versión del sistema;
* arquitectura;
* GPU;
* drivers;
* configuración gráfica;
* monitores;
* permisos;
* restricciones de plataforma.

Referencia:

`docs/platform/COMPATIBILITY.md`

---

# 33. Hardware Acceleration

La captura puede interactuar con recursos de GPU y mecanismos de aceleración.

Debe diferenciarse:

```text
GPU AVAILABLE
      ≠
CAPTURE ACCELERATION AVAILABLE
      ≠
CAPTURE ACCELERATION USABLE
```

Referencia:

`docs/platform/TRANSVERSAL/HARDWARE-ACCELERATION.md`

---

# 34. Pruebas

Deberán contemplarse:

* pantalla completa;
* ventana;
* región;
* múltiples monitores;
* diferentes resoluciones;
* DPI;
* scaling;
* fuente inexistente;
* permisos;
* desconexión;
* pausa;
* reanudación;
* cancelación;
* grabación prolongada;
* alta carga.

---

# 35. Pruebas negativas

Deberán comprobarse escenarios como:

```text
NO SOURCE
INVALID SOURCE
PERMISSION DENIED
RESOURCE FAILURE
BUFFER OVERFLOW
ENCODER UNAVAILABLE
DEVICE LOST
```

---

# 36. Integridad

El subsistema debe garantizar que los frames entregados al pipeline mantengan la información necesaria para generar un resultado válido.

---

# 37. Evidencia

La evidencia deberá demostrar:

```text
SOURCE SELECTED
      ↓
CAPTURE INITIALIZED
      ↓
FRAMES ACQUIRED
      ↓
TIMESTAMPS VALID
      ↓
FRAMES DELIVERED
      ↓
CAPTURE STOPPED
      ↓
RESOURCES RELEASED
```

---

# 38. Gaps

| ID          | Gap                                          | Estado  |
| ----------- | -------------------------------------------- | ------- |
| GAP-CAP-001 | Definir fuentes definitivas                  | OPEN    |
| GAP-CAP-002 | Definir estrategia de captura por plataforma | OPEN    |
| GAP-CAP-003 | Definir timestamps                           | OPEN    |
| GAP-CAP-004 | Definir frame rate                           | OPEN    |
| GAP-CAP-005 | Definir buffering                            | OPEN    |
| GAP-CAP-006 | Definir backpressure                         | OPEN    |
| GAP-CAP-007 | Definir multi-monitor                        | OPEN    |
| GAP-CAP-008 | Definir DPI/scaling                          | OPEN    |
| GAP-CAP-009 | Crear pruebas                                | BLOCKED |
| GAP-CAP-010 | Certificación                                | BLOCKED |

---

# 39. Estado

```text
DOCUMENTADO:    YES
IMPLEMENTADO:   NO
PROBADO:        NO
VALIDADO:       NO
CERTIFICADO:    NO
```

---

# 40. Regla suprema

> CAPTURE debe adquirir únicamente el contenido autorizado, mantener su integridad temporal y entregar datos verificables al pipeline, sin asumir responsabilidades que pertenecen a procesamiento, encoding u output.
