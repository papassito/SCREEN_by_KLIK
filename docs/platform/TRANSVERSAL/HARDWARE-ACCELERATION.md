# SCREEN by KLIK — Hardware Acceleration

**Documento:** `docs/platform/TRANSVERSAL/HARDWARE-ACCELERATION.md`
**Categoría:** Transversal
**Estado:** `PLANNED`
**Versión documental:** `0.1.0-alpha`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADA`
**Certificación:** `NO CERTIFICADA`

---

# 1. Propósito

Este documento define la estrategia transversal para la utilización de aceleración por hardware en SCREEN by KLIK.

La aceleración debe considerarse una capacidad opcional que depende de:

* plataforma;
* GPU;
* driver;
* dispositivo;
* codec;
* encoder;
* configuración;
* recursos;
* estabilidad.

---

# 2. Distinciones fundamentales

SCREEN by KLIK debe distinguir:

```text
GPU PRESENTE
      ≠
HARDWARE ACCELERATION AVAILABLE
      ≠
HARDWARE ACCELERATION USABLE
      ≠
HARDWARE ENCODING AVAILABLE
      ≠
HARDWARE ENCODING BENEFICIAL
      ≠
HARDWARE ENCODING CERTIFIED
```

---

# 3. Alcance

Este documento contempla:

* detección;
* capacidades;
* selección;
* inicialización;
* procesamiento;
* encoding;
* fallback;
* errores;
* diagnóstico;
* rendimiento;
* compatibilidad;
* certificación.

---

# 4. Tipos de aceleración

Conceptualmente pueden existir:

1. aceleración de procesamiento;
2. aceleración de composición;
3. aceleración de conversión;
4. hardware encoding;
5. otras capacidades específicas de plataforma.

Las capacidades exactas serán definidas durante la implementación.

---

# 5. Detección

La aplicación deberá determinar si existe una capacidad realmente utilizable.

La detección debe diferenciar:

```text
DETECTED
AVAILABLE
INITIALIZED
USABLE
ACTIVE
```

No debe declararse `ACTIVE` únicamente porque el hardware exista.

---

# 6. Capability Matrix

La implementación deberá poder representar conceptualmente:

| Plataforma | GPU | Driver | Encoder | Capability | Estado  |
| ---------- | --- | ------ | ------- | ---------- | ------- |
| Windows    | TBD | TBD    | TBD     | TBD        | UNKNOWN |
| Linux      | TBD | TBD    | TBD     | TBD        | UNKNOWN |
| macOS      | TBD | TBD    | TBD     | TBD        | UNKNOWN |
| Android    | TBD | TBD    | TBD     | TBD        | UNKNOWN |
| iOS        | TBD | TBD    | TBD     | TBD        | UNKNOWN |

---

# 7. Selección

La estrategia de selección deberá considerar:

* disponibilidad;
* compatibilidad;
* rendimiento;
* estabilidad;
* calidad;
* consumo;
* configuración del usuario;
* fallos previos.

La política concreta será `TBD`.

---

# 8. Modos

Podrán contemplarse conceptualmente:

```text
AUTO
HARDWARE
SOFTWARE
```

Pero estos modos no constituyen todavía una interfaz aprobada.

Estado: `PROPOSED`.

---

# 9. Hardware encoding

El encoder hardware deberá evaluarse por:

* codec;
* resolución;
* bitrate;
* profile;
* framerate;
* calidad;
* latencia;
* estabilidad;
* consumo.

---

# 10. Software fallback

Cuando el hardware encoding no sea utilizable, podrá contemplarse:

```text
HARDWARE ENCODING
       │
       ├── SUCCESS
       │
       └── FAILURE
              ↓
       SOFTWARE ENCODING
```

El fallback solamente será válido cuando:

* sea compatible;
* no comprometa integridad;
* sea suficientemente estable;
* esté permitido por la configuración;
* haya sido validado.

---

# 11. Fallos durante la sesión

Debe contemplarse:

* pérdida del dispositivo;
* driver failure;
* encoder failure;
* memoria insuficiente;
* incompatibilidad;
* corrupción de estado;
* error de inicialización.

No debe producirse una transición silenciosa que oculte el fallo.

---

# 12. Inicialización

Conceptualmente:

```text
DETECT
  ↓
CHECK CAPABILITY
  ↓
INITIALIZE
  ↓
VERIFY
  ↓
ACTIVATE
```

Si cualquier etapa falla, el estado debe reflejarlo.

---

# 13. Multi-GPU

Debe contemplarse:

* GPU integrada;
* GPU dedicada;
* múltiples GPUs;
* cambio de GPU;
* selección incorrecta;
* disponibilidad desigual;
* memoria compartida.

---

# 14. Drivers

La aceleración puede depender de drivers y versiones específicas.

Debe registrarse suficiente información para diagnosticar incompatibilidades sin registrar información innecesaria o sensible.

---

# 15. Transferencia de memoria

Debe evaluarse:

* CPU → GPU;
* GPU → CPU;
* buffers;
* copias;
* sincronización;
* latencia;
* consumo de memoria.

El uso de técnicas específicas de zero-copy queda `TBD`.

---

# 16. Sincronización

Debe evitarse:

* carreras;
* frames fuera de orden;
* timestamps inconsistentes;
* bloqueo indefinido;
* buffers no liberados;
* pérdida silenciosa.

---

# 17. Backpressure

La aceleración debe integrarse con la estrategia de backpressure del sistema.

Debe contemplarse:

```text
CAPTURE
   ↓
PROCESSING
   ↓
ENCODING
```

Cuando una etapa sea más lenta que la anterior, el sistema deberá tener una política explícita.

---

# 18. Rendimiento

Deben medirse al menos:

* CPU;
* GPU;
* RAM;
* VRAM cuando corresponda;
* FPS;
* dropped frames;
* encoding FPS;
* latencia;
* throughput;
* temperatura;
* consumo.

---

# 19. Comparación hardware/software

Una medición válida debe permitir comparar:

```text
SOFTWARE PATH
        VS
HARDWARE PATH
```

bajo condiciones comparables.

No debe afirmarse que hardware encoding es mejor sin evidencia.

---

# 20. Calidad

La aceleración no debe comprometer:

* calidad;
* sincronización;
* integridad;
* estabilidad;
* formato;
* compatibilidad.

---

# 21. Degradación controlada

Cuando la aceleración no esté disponible:

```text
HARDWARE
   ↓
UNAVAILABLE
   ↓
DEGRADED MODE
   ↓
SOFTWARE
```

si el software fallback es válido.

---

# 22. Seguridad

La utilización de aceleración debe respetar:

* mínimo privilegio;
* drivers confiables;
* memoria correctamente gestionada;
* no exposición de datos;
* manejo seguro de errores.

---

# 23. Diagnóstico

Los eventos deben poder distinguir:

* GPU detectada;
* capability disponible;
* initialization failure;
* encoder unavailable;
* fallback;
* hardware active;
* hardware failure;
* software fallback active.

---

# 24. Privacidad

No debe registrarse:

* contenido de pantalla;
* audio;
* vídeo;
* datos personales innecesarios;
* secretos.

La telemetría técnica debe minimizarse.

---

# 25. Compatibilidad

La aceleración debe probarse por configuración:

```text
PLATFORM
+ VERSION
+ CPU
+ GPU
+ DRIVER
+ CODEC
+ RESOLUTION
+ CONFIGURATION
```

---

# 26. Pruebas negativas

Deben incluir:

* GPU ausente;
* GPU incompatible;
* encoder inexistente;
* driver incompatible;
* inicialización fallida;
* encoder que falla durante sesión;
* memoria insuficiente;
* pérdida de dispositivo;
* fallback.

---

# 27. Certificación

La certificación deberá identificar:

* plataforma;
* versión;
* hardware;
* driver;
* codec;
* encoder;
* configuración;
* resultado;
* evidencia.

Una certificación no debe extrapolarse a hardware no probado.

---

# 28. Gaps

| ID          | Gap                             | Estado  |
| ----------- | ------------------------------- | ------- |
| GAP-HWA-001 | Definir capacidades objetivo    | OPEN    |
| GAP-HWA-002 | Definir estrategia de detección | OPEN    |
| GAP-HWA-003 | Seleccionar backends            | OPEN    |
| GAP-HWA-004 | Definir codecs                  | OPEN    |
| GAP-HWA-005 | Definir encoders hardware       | OPEN    |
| GAP-HWA-006 | Definir fallback                | OPEN    |
| GAP-HWA-007 | Definir política multi-GPU      | OPEN    |
| GAP-HWA-008 | Definir métricas                | OPEN    |
| GAP-HWA-009 | Crear matriz hardware           | OPEN    |
| GAP-HWA-010 | Ejecutar pruebas                | BLOCKED |

---

# 29. Relación con plataformas

```text
HARDWARE-ACCELERATION
          │
 ┌────────┼────────┬────────┬────────┐
 ▼        ▼        ▼        ▼        ▼
WINDOWS  LINUX    MACOS   ANDROID   IOS
```

El documento define principios comunes.

Cada plataforma determina cómo se materializan.

---

# 30. Estado actual

```text
DOCUMENTADO:    YES
IMPLEMENTADO:   NO
PROBADO:        NO
VALIDADO:       NO
CERTIFICADO:    NO
```

---

# 31. Evolución

```text
PLANNED
   ↓
DESIGNED
   ↓
IMPLEMENTED
   ↓
TESTED
   ↓
MEASURED
   ↓
VALIDATED
   ↓
CERTIFIED
```

---

# 32. Regla suprema

> SCREEN by KLIK nunca debe declarar que está utilizando aceleración por hardware simplemente porque existe una GPU.

Debe demostrar:

```text
DETECTED
→ AVAILABLE
→ INITIALIZED
→ USABLE
→ ACTIVE
→ MEASURED
→ VALIDATED
→ CERTIFIED
```

La aceleración es una optimización y una capacidad técnica; **no es un sustituto de la corrección, estabilidad, seguridad ni evidencia.**
