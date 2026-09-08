# SCREEN by KLIK — Watermark

**Documento:** `docs/ui/WATERMARK.md`
**Proyecto:** SCREEN by KLIK
**Categoría:** UI / Watermark
**Estado:** `PLANNED`
**Versión documental:** `0.1.0-alpha`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADA`
**Certificación:** `NO CERTIFICADA`

---

# 1. Propósito

Este documento define el comportamiento conceptual de las marcas de agua que SCREEN by KLIK pudiera incorporar a una grabación.

La existencia y alcance de esta función todavía deberán ser aprobados.

---

# 2. Estado de la funcionalidad

```text
WATERMARK FEATURE: TBD
```

Este documento no implica que exista actualmente una función de watermark.

---

# 3. Tipos conceptuales

Una marca de agua podría ser:

* texto;
* imagen;
* identificación visual;
* elemento configurable.

El conjunto definitivo es `TBD`.

---

# 4. Aplicación

Debe definirse si la marca de agua se aplica:

```text
DURING PREVIEW
```

o:

```text
DURING RECORDING
```

o:

```text
DURING FINALIZATION
```

o mediante una combinación.

Decisión: `TBD`.

---

# 5. Posición

Podrían contemplarse posiciones como:

* esquinas;
* centro;
* posición configurable.

La configuración definitiva es `TBD`.

---

# 6. Propiedades

Podrán existir:

* contenido;
* tamaño;
* transparencia;
* posición;
* escala;
* duración.

No se considera aprobada ninguna propiedad concreta.

---

# 7. Permanencia

Debe distinguirse:

```text
TEMPORARY
```

de:

```text
PERSISTENT
```

La política definitiva es `TBD`.

---

# 8. UI

La interfaz deberá permitir configurar la función solamente si forma parte del alcance aprobado.

---

# 9. Rendimiento

El watermark no deberá producir degradación injustificada de:

* FPS;
* CPU;
* GPU;
* memoria;
* tamaño del archivo;
* tiempo de finalización.

---

# 10. Integridad

La aplicación de una marca de agua no deberá corromper ni invalidar el archivo de salida.

Debe comprobarse mediante pruebas de output.

---

# 11. Privacidad

La marca de agua no deberá incorporar información personal o identificadores sin una finalidad definida y autorización correspondiente.

---

# 12. Plataformas

Deberá validarse por:

```text
WINDOWS
LINUX
MACOS
ANDROID
IOS
```

La compatibilidad no se presume.

---

# 13. Pruebas

Deberán contemplarse:

* activación;
* desactivación;
* configuración;
* posición;
* escalado;
* transparencia;
* grabación;
* output;
* reproducción;
* rendimiento;
* compatibilidad.

---

# 14. Estado

```text
DOCUMENTADO:    YES
IMPLEMENTADO:   NO
PROBADO:        NO
VALIDADO:       NO
CERTIFICADO:    NO
```

---

# 15. Gaps

| ID         | Gap                                   | Estado  |
| ---------- | ------------------------------------- | ------- |
| GAP-WM-001 | Aprobar o descartar watermark         | OPEN    |
| GAP-WM-002 | Definir tipos                         | BLOCKED |
| GAP-WM-003 | Definir configuración                 | BLOCKED |
| GAP-WM-004 | Definir aplicación                    | BLOCKED |
| GAP-WM-005 | Definir comportamiento por plataforma | BLOCKED |
| GAP-WM-006 | Crear pruebas                         | BLOCKED |

---

# 16. Regla

> Documentar una capacidad no significa aprobarla como funcionalidad del producto.

La marca de agua solamente deberá existir en el producto final si forma parte del alcance aprobado y puede implementarse, probarse y validarse correctamente.
