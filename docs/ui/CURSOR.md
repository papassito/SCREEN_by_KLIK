# SCREEN by KLIK — Cursor

**Documento:** `docs/ui/CURSOR.md`
**Proyecto:** SCREEN by KLIK
**Categoría:** UI / Cursor
**Estado:** `PLANNED`
**Versión documental:** `0.1.0-alpha`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADA`
**Certificación:** `NO CERTIFICADA`

---

# 1. Propósito

Este documento define los requisitos conceptuales para el tratamiento visual del cursor durante la grabación.

---

# 2. Alcance

El sistema podrá contemplar:

* visibilidad del cursor;
* representación visual;
* resaltado;
* indicadores de interacción;
* personalización.

Las capacidades definitivas son `TBD`.

---

# 3. Principio fundamental

El cursor capturado debe representar correctamente la interacción del usuario sin introducir artefactos innecesarios.

---

# 4. Modos conceptuales

Podrán existir:

```text
CURSOR VISIBLE
CURSOR HIDDEN
CURSOR HIGHLIGHTED
CUSTOMIZED
```

Los modos definitivos son `TBD`.

---

# 5. Posición

La representación deberá mantener correspondencia con la posición real del cursor.

Deberá considerarse:

* resolución;
* escalado;
* DPI;
* múltiples monitores;
* orientación;
* cambios de pantalla.

---

# 6. Clicks

Podrá contemplarse una representación visual de:

* click izquierdo;
* click derecho;
* otras interacciones.

La funcionalidad definitiva es `TBD`.

---

# 7. Rendering

Debe definirse si el cursor:

```text
CAPTURED NATIVELY
```

o:

```text
RENDERED AS OVERLAY
```

o utiliza una combinación de mecanismos.

Decisión: `TBD`.

---

# 8. Rendimiento

El procesamiento del cursor no deberá introducir:

* latencia visible;
* pérdida significativa de frames;
* consumo innecesario de CPU/GPU.

---

# 9. Plataformas

El comportamiento deberá validarse individualmente en:

* Windows;
* Linux;
* macOS;
* Android;
* iOS.

No debe asumirse equivalencia entre plataformas.

---

# 10. Pruebas

Deberán contemplarse:

* movimiento;
* posición;
* múltiples monitores;
* DPI;
* escalado;
* visibilidad;
* clicks;
* grabación;
* rendimiento.

---

# 11. Seguridad

El sistema de cursor no debe ampliar innecesariamente los permisos de SCREEN.

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

| ID          | Gap                         | Estado  |
| ----------- | --------------------------- | ------- |
| GAP-CUR-001 | Definir representación      | OPEN    |
| GAP-CUR-002 | Definir click indicators    | OPEN    |
| GAP-CUR-003 | Definir comportamiento DPI  | OPEN    |
| GAP-CUR-004 | Definir multi-monitor       | OPEN    |
| GAP-CUR-005 | Definir diferencias móviles | OPEN    |
| GAP-CUR-006 | Crear pruebas               | BLOCKED |

---

# 14. Regla

> La representación visual del cursor debe corresponder con la captura real y debe validarse por plataforma.
