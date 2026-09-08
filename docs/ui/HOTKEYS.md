# SCREEN by KLIK — UI Hotkeys

**Documento:** `docs/ui/HOTKEYS.md`
**Proyecto:** SCREEN by KLIK
**Categoría:** UI / Hotkeys
**Estado:** `PLANNED`
**Versión documental:** `0.1.0-alpha`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADA`
**Certificación:** `NO CERTIFICADA`

---

# 1. Propósito

Este documento define el comportamiento de las teclas rápidas desde la perspectiva de usuario e interfaz.

La implementación técnica del sistema de hotkeys deberá documentarse en:

`docs/technical/HOTKEYS.md`

---

# 2. Principio

Las teclas rápidas deberán permitir ejecutar acciones frecuentes de forma rápida y predecible.

---

# 3. Acciones potenciales

Podrán existir hotkeys para:

* iniciar grabación;
* detener;
* pausar;
* reanudar;
* cancelar;
* mostrar/ocultar controles;
* activar herramientas.

La lista definitiva es `TBD`.

---

# 4. Configuración

El usuario podrá, si el alcance lo contempla:

* consultar asignaciones;
* modificar asignaciones;
* restaurar valores;
* detectar conflictos.

---

# 5. Conflictos

Debe detectarse cuando una combinación:

* ya esté asignada;
* entre en conflicto con otra acción;
* sea inválida;
* no pueda utilizarse en una plataforma.

---

# 6. Feedback

La UI deberá proporcionar una respuesta comprensible cuando una acción haya sido:

* aceptada;
* rechazada;
* bloqueada;
* no disponible.

---

# 7. Plataforma

El comportamiento de hotkeys puede variar entre:

* Windows;
* Linux;
* macOS;
* Android;
* iOS.

Las diferencias deberán documentarse.

---

# 8. Seguridad

Las hotkeys no deberán permitir saltarse controles de seguridad o permisos.

---

# 9. Pruebas

Deberán probarse:

* asignación;
* modificación;
* eliminación;
* conflictos;
* acciones durante grabación;
* acciones durante pausa;
* acciones durante finalización;
* combinaciones inválidas;
* comportamiento por plataforma.

---

# 10. Relación técnica

```text
UI HOTKEYS
    ↓
USER CONFIGURATION
    ↓
HOTKEY ENGINE
```

El contrato técnico pertenece a:

`docs/technical/HOTKEYS.md`

---

# 11. Estado

```text
DOCUMENTADO:    YES
IMPLEMENTADO:   NO
PROBADO:        NO
VALIDADO:       NO
CERTIFICADO:    NO
```

---

# 12. Gaps

| ID           | Gap                             | Estado  |
| ------------ | ------------------------------- | ------- |
| GAP-UIHK-001 | Definir acciones                | OPEN    |
| GAP-UIHK-002 | Definir valores predeterminados | OPEN    |
| GAP-UIHK-003 | Definir configuración           | OPEN    |
| GAP-UIHK-004 | Definir conflictos              | OPEN    |
| GAP-UIHK-005 | Definir comportamiento móvil    | OPEN    |
| GAP-UIHK-006 | Crear pruebas                   | BLOCKED |

---

# 13. Regla

> `ui/HOTKEYS.md` define la experiencia y configuración de usuario; `technical/HOTKEYS.md` define el comportamiento técnico.
