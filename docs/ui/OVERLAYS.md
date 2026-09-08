# SCREEN by KLIK — Overlays

**Documento:** `docs/ui/OVERLAYS.md`
**Proyecto:** SCREEN by KLIK
**Categoría:** UI / Overlays
**Estado:** `PLANNED`
**Versión documental:** `0.1.0-alpha`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADA`
**Certificación:** `NO CERTIFICADA`

---

# 1. Propósito

Este documento define el comportamiento conceptual de los overlays de SCREEN by KLIK.

Un overlay es un elemento visual que se presenta sobre el contenido capturado o sobre la interfaz del producto.

---

# 2. Tipos conceptuales

Podrán existir:

```text
OVERLAYS
├── RECORDING CONTROLS
├── STATUS
├── CURSOR EFFECTS
├── ANNOTATIONS
├── GUIDES
└── OTHER VISUAL ELEMENTS
```

La lista definitiva es `TBD`.

---

# 3. Overlay de interfaz vs overlay grabado

Debe distinguirse:

```text
UI OVERLAY
```

de:

```text
RECORDED OVERLAY
```

Un elemento visible en pantalla durante la grabación no necesariamente debe formar parte del archivo resultante.

Esta decisión es `TBD` por funcionalidad.

---

# 4. Estados

Los overlays deberán respetar el estado de la aplicación:

```text
IDLE
STARTING
RECORDING
PAUSED
STOPPING
FINALIZING
COMPLETED
FAILED
CANCELLED
```

---

# 5. Visibilidad

Cada overlay deberá tener una regla clara sobre:

* cuándo aparece;
* cuándo desaparece;
* si puede ocultarse;
* si se graba;
* si se elimina del resultado.

---

# 6. Interacción

Los overlays no deberán interferir accidentalmente con:

* selección;
* captura;
* cursor;
* teclado;
* audio;
* cámara;
* controles principales.

---

# 7. Rendimiento

Deberá evaluarse su impacto sobre:

* CPU;
* GPU;
* memoria;
* FPS;
* latencia;
* estabilidad.

---

# 8. Múltiples monitores

Deberá contemplarse correctamente:

* monitor activo;
* monitor secundario;
* resolución;
* DPI;
* escalado;
* movimiento entre monitores.

---

# 9. Plataformas

El comportamiento deberá validarse por plataforma.

No deberá asumirse que un mecanismo de overlay funciona idénticamente en:

* Windows;
* Linux;
* macOS;
* Android;
* iOS.

---

# 10. Seguridad

Los overlays no deberán utilizarse para obtener acceso no autorizado al contenido del sistema.

---

# 11. Pruebas

Deberán probarse:

* aparición;
* desaparición;
* interacción;
* grabación;
* múltiples monitores;
* escalado;
* rendimiento;
* estados;
* errores.

---

# 12. Estado

```text
DOCUMENTADO:    YES
IMPLEMENTADO:   NO
PROBADO:        NO
VALIDADO:       NO
CERTIFICADO:    NO
```

---

# 13. Gaps

| ID          | Gap                          | Estado  |
| ----------- | ---------------------------- | ------- |
| GAP-OVR-001 | Definir tipos de overlay     | OPEN    |
| GAP-OVR-002 | Separar overlay UI/recorded  | OPEN    |
| GAP-OVR-003 | Definir lifecycle            | OPEN    |
| GAP-OVR-004 | Definir multi-monitor        | OPEN    |
| GAP-OVR-005 | Definir comportamiento móvil | OPEN    |
| GAP-OVR-006 | Crear pruebas                | BLOCKED |

---

# 14. Regla

> Un overlay visible en la interfaz no debe considerarse automáticamente parte de la grabación final.
