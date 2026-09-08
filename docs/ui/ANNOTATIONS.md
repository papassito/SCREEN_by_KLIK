# SCREEN by KLIK — Annotations

**Documento:** `docs/ui/ANNOTATIONS.md`
**Proyecto:** SCREEN by KLIK
**Categoría:** UI / Annotations
**Estado:** `PLANNED`
**Versión documental:** `0.1.0-alpha`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADA`
**Certificación:** `NO CERTIFICADA`

---

# 1. Propósito

Este documento define el comportamiento conceptual de las anotaciones visuales de SCREEN by KLIK.

Las anotaciones permitirán, si forman parte del alcance aprobado, incorporar elementos visuales destinados a explicar, señalar o destacar contenido durante una grabación.

---

# 2. Alcance

Las anotaciones podrán contemplar conceptualmente:

* indicadores;
* flechas;
* líneas;
* formas;
* resaltados;
* texto;
* marcadores;
* elementos temporales.

La lista definitiva de herramientas es `TBD`.

---

# 3. Principio fundamental

Una anotación debe ser un elemento visual controlado.

Debe existir una separación clara entre:

```text
CAPTURED CONTENT
       +
ANNOTATION
       ↓
RECORDED RESULT
```

La anotación no debe alterar accidentalmente el contenido capturado de manera irreversible antes de la etapa correspondiente.

---

# 4. Ciclo de vida

Conceptualmente:

```text
SELECT TOOL
    ↓
CONFIGURE
    ↓
CREATE
    ↓
DISPLAY
    ↓
UPDATE
    ↓
REMOVE / COMMIT
```

El comportamiento exacto dependerá de la arquitectura de composición y encoding.

---

# 5. Herramientas

La arquitectura podrá soportar una colección extensible de herramientas.

Ejemplo conceptual:

```text
ANNOTATIONS
├── POINTER
├── ARROW
├── LINE
├── SHAPE
├── HIGHLIGHT
└── TEXT
```

No se considera aprobada ninguna lista definitiva.

---

# 6. Propiedades

Una anotación podrá requerir propiedades como:

* posición;
* tamaño;
* orientación;
* duración;
* contenido;
* grosor;
* estilo;
* visibilidad.

Los valores y controles definitivos son `TBD`.

---

# 7. Interacción

La interacción deberá evitar interferencias accidentales con:

* selección de región;
* captura;
* cursor;
* controles de grabación;
* overlays.

---

# 8. Rendimiento

Las anotaciones no deberán producir degradación desproporcionada de:

* FPS;
* latencia;
* CPU;
* GPU;
* memoria.

Su impacto deberá medirse antes de certificación.

---

# 9. Grabación

Debe definirse si una anotación:

```text
VISIBLE ONLY IN UI
```

o:

```text
COMPOSITED INTO RECORDING
```

o puede funcionar bajo ambas modalidades.

Decisión: `TBD`.

---

# 10. Cancelación

La cancelación de una operación deberá evitar dejar estados visuales inconsistentes.

---

# 11. Accesibilidad

La interfaz deberá considerar:

* tamaño;
* legibilidad;
* contraste;
* interacción;
* teclado;
* escalado.

Los criterios definitivos son `TBD`.

---

# 12. Plataformas

La disponibilidad podrá variar entre:

* Windows;
* Linux;
* macOS;
* Android;
* iOS.

La compatibilidad definitiva deberá verificarse mediante:

`docs/platform/COMPATIBILITY.md`

---

# 13. Seguridad

Las anotaciones no deberán permitir:

* ejecución de código;
* acceso no autorizado;
* modificación arbitraria de archivos;
* acceso fuera de los recursos permitidos.

---

# 14. Pruebas

Deberán contemplarse:

* creación;
* edición;
* eliminación;
* múltiples anotaciones;
* duración;
* cancelación;
* grabación;
* rendimiento;
* compatibilidad.

---

# 15. Estado

```text
DOCUMENTADO:    YES
IMPLEMENTADO:   NO
PROBADO:        NO
VALIDADO:       NO
CERTIFICADO:    NO
```

---

# 16. Gaps

| ID          | Gap                                   | Estado  |
| ----------- | ------------------------------------- | ------- |
| GAP-ANN-001 | Definir herramientas definitivas      | OPEN    |
| GAP-ANN-002 | Definir modelo de composición         | OPEN    |
| GAP-ANN-003 | Definir interacción                   | OPEN    |
| GAP-ANN-004 | Definir propiedades                   | OPEN    |
| GAP-ANN-005 | Definir comportamiento por plataforma | OPEN    |
| GAP-ANN-006 | Crear pruebas                         | BLOCKED |

---

# 17. Regla

> Una anotación documentada no implica que la herramienta exista o esté implementada.
