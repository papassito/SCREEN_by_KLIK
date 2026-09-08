# VIDEO-FORMATS.md

# SCREEN by KLIK — Video Formats

**Ruta:** `docs/technical/VIDEO-FORMATS.md`
**Versión documental:** `0.1.0-alpha`
**Estado:** `PLANNED`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADO`
**Certificación:** `NO CERTIFICADO`

---

## 1. Propósito

Este documento define el marco técnico para seleccionar, describir, validar y certificar los formatos de video utilizados por SCREEN by KLIK.

Debe separar claramente:

```text
VIDEO FORMAT
CODEC
ENCODER
CONTAINER
FILE EXTENSION
```

Estos conceptos no son intercambiables.

---

## 2. Alcance

Deberá contemplarse:

* codecs;
* containers;
* perfiles;
* niveles;
* pixel formats;
* resolución;
* frame rate;
* bitrate;
* audio relationship;
* metadata;
* compatibilidad;
* hardware acceleration;
* software encoding;
* validación;
* interoperabilidad.

Los formatos concretos permanecen `TBD`.

---

## 3. Modelo conceptual

```text
CAPTURE
   ↓
RAW / INTERNAL REPRESENTATION
   ↓
PROCESSING
   ↓
VIDEO CODEC
   ↓
ENCODER
   ↓
ENCODED VIDEO STREAM
   ↓
CONTAINER
   ↓
FILE FORMAT
```

---

## 4. Codec

El codec define cómo se representa/comprime el video.

La lista de codecs soportados permanece:

**`TBD`**

No se deberá aprobar un codec únicamente por popularidad.

---

## 5. Encoder

El encoder es la implementación que produce el stream codificado.

Debe distinguirse:

```text
CODEC
   ↓
ENCODER IMPLEMENTATION
   ├── SOFTWARE
   └── HARDWARE
```

La implementación concreta permanece `TBD`.

---

## 6. Container

El contenedor deberá permitir integrar los streams necesarios.

Deberá evaluarse:

* video;
* audio;
* timestamps;
* metadata;
* duración;
* finalización;
* recuperación;
* compatibilidad.

La lista definitiva permanece `TBD`.

---

## 7. Extensión

La extensión deberá reflejar el contenedor real.

No deberá utilizarse una extensión incorrecta para aparentar compatibilidad.

---

## 8. Resolución

La resolución deberá definirse en función de:

* fuente;
* configuración;
* encoder;
* plataforma;
* rendimiento;
* formato.

No se establece todavía una lista obligatoria.

---

## 9. Frame Rate

El frame rate deberá tratarse como parámetro técnico verificable.

Deberán contemplarse:

* tasa configurada;
* tasa efectiva;
* frames perdidos;
* variaciones;
* timestamps.

Una configuración de `X FPS` no significa que la captura real haya mantenido `X FPS`.

---

## 10. Bitrate

El bitrate podrá depender de:

* resolución;
* frame rate;
* codec;
* calidad;
* contenido;
* encoder.

Los modos concretos permanecen `TBD`.

---

## 11. Pixel Format

Deberán definirse posteriormente:

* formato de píxel;
* profundidad;
* espacio de color;
* chroma subsampling;
* compatibilidad con encoder.

No se fija un formato todavía.

---

## 12. Perfil y nivel

Cuando el codec seleccionado los utilice, deberán documentarse:

* profile;
* level;
* restricciones;
* compatibilidad.

No se deberán fijar valores antes de seleccionar y probar los codecs.

---

## 13. Audio

El formato final podrá incluir:

```text
VIDEO STREAM
+
AUDIO STREAM
```

La compatibilidad audiovisual deberá validarse como conjunto.

`AUDIO.md` y `ENCODING.md` contienen los detalles de los pipelines respectivos.

---

## 14. Sincronización

El formato final deberá conservar información temporal suficiente para:

* duración;
* orden;
* sincronización;
* pausas;
* discontinuidades;
* finalización.

---

## 15. Compatibilidad

Deberá evaluarse por combinación:

```text
PLATFORM
+
CPU/GPU
+
ENCODER
+
CODEC
+
CONTAINER
+
RESOLUTION
+
FRAME RATE
+
AUDIO
```

La certificación deberá corresponder a configuraciones reales.

---

## 16. Interoperabilidad

Un archivo generado deberá validarse con los consumidores relevantes que se definan posteriormente.

No deberá afirmarse:

> "compatible con todos los reproductores"

sin una matriz de evidencia que lo respalde.

---

## 17. Hardware Encoding

Cuando exista hardware encoding:

```text
HARDWARE AVAILABLE
       ≠
HARDWARE ENCODER AVAILABLE
       ≠
HARDWARE ENCODER COMPATIBLE
       ≠
CERTIFIED
```

La documentación transversal se encuentra en:

`docs/platform/TRANSVERSAL/HARDWARE-ACCELERATION.md`

---

## 18. Calidad

La evaluación deberá considerar:

* calidad visual;
* tamaño;
* rendimiento;
* estabilidad;
* latencia;
* compatibilidad.

No deberán utilizarse adjetivos como "alta calidad" como sustituto de mediciones.

---

## 19. Rendimiento

Deberán medirse:

* CPU;
* GPU;
* memoria;
* throughput;
* frames procesados;
* frames perdidos;
* tiempo de encoding;
* tamaño final.

---

## 20. Integridad

Un archivo de video deberá validarse según:

* container;
* streams;
* codec;
* timestamps;
* duración;
* legibilidad;
* finalización.

Un archivo que simplemente tenga la extensión correcta no se considera válido.

---

## 21. Seguridad y privacidad

Los formatos y bibliotecas utilizados deberán evaluarse considerando:

* vulnerabilidades conocidas;
* parsing;
* dependencias;
* archivos malformados;
* consumo excesivo de recursos;
* exposición de metadata.

Las grabaciones deberán tratarse como datos potencialmente sensibles.

---

## 22. Pruebas

Deberán contemplarse:

* resolución;
* frame rate;
* codec;
* container;
* audio + video;
* cámara + pantalla;
* software encoding;
* hardware encoding;
* fallback;
* archivos prolongados;
* archivos grandes;
* interrupciones;
* finalización;
* interoperabilidad;
* archivos malformados.

---

## 23. Matriz futura

| Variable          | Estado |
| ----------------- | ------ |
| Codec             | `TBD`  |
| Encoder           | `TBD`  |
| Container         | `TBD`  |
| Extension         | `TBD`  |
| Resolution        | `TBD`  |
| Frame Rate        | `TBD`  |
| Bitrate           | `TBD`  |
| Pixel Format      | `TBD`  |
| Profile           | `TBD`  |
| Level             | `TBD`  |
| Audio Codec       | `TBD`  |
| Hardware Encoding | `TBD`  |

---

## 24. Gaps

| ID           | Gap                      |
| ------------ | ------------------------ |
| GAP-VFMT-001 | Codec selection          |
| GAP-VFMT-002 | Container selection      |
| GAP-VFMT-003 | Encoder selection        |
| GAP-VFMT-004 | Resolution matrix        |
| GAP-VFMT-005 | Frame-rate matrix        |
| GAP-VFMT-006 | Pixel formats            |
| GAP-VFMT-007 | Profile/level            |
| GAP-VFMT-008 | Audio/video combinations |
| GAP-VFMT-009 | Interoperability         |
| GAP-VFMT-010 | Certification matrix     |

---

## 25. Estado actual

| Elemento       | Estado            |
| -------------- | ----------------- |
| Documentación  | `DOCUMENTED`      |
| Diseño         | `PLANNED`         |
| Implementación | `NO IMPLEMENTADA` |
| Pruebas        | `NO EJECUTADAS`   |
| Evidencia      | `NO DISPONIBLE`   |
| Validación     | `NO VALIDADO`     |
| Certificación  | `NO CERTIFICADO`  |

---

## 26. Evolución

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
SUPPORTED
```

---

## 27. Regla de integridad

> **Un formato solamente debe declararse soportado cuando codec, encoder, contenedor, configuración y resultado hayan sido verificados mediante evidencia.**

La extensión del archivo, por sí sola, nunca constituye prueba de compatibilidad.
