# HOTKEYS.md

# SCREEN by KLIK — Hotkeys

**Ruta:** `docs/technical/HOTKEYS.md`
**Versión documental:** `0.1.0-alpha`
**Estado:** `PLANNED`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADO`
**Certificación:** `NO CERTIFICADO`

---

## 1. Propósito

Este documento define las bases técnicas del sistema de **atajos de teclado** de SCREEN by KLIK.

Su responsabilidad será transformar eventos de teclado válidos en acciones internas de la aplicación.

La especificación de interacción de usuario se complementa con:

`docs/ui/HOTKEYS.md`

Este documento se concentra en el comportamiento técnico.

---

## 2. Alcance

El sistema deberá contemplar conceptualmente:

* definición de acciones;
* combinación de teclas;
* registro;
* detección;
* desregistro;
* conflictos;
* eventos;
* lifecycle;
* activación;
* desactivación;
* errores;
* plataformas;
* permisos;
* seguridad;
* concurrencia.

Las acciones concretas permanecen `TBD`.

---

## 3. Arquitectura conceptual

```text
KEYBOARD EVENT
      ↓
EVENT NORMALIZATION
      ↓
HOTKEY MATCHING
      ↓
CONFLICT / VALIDATION
      ↓
ACTION RESOLUTION
      ↓
APPLICATION ACTION
```

El sistema operativo puede imponer restricciones diferentes según plataforma.

---

## 4. Hotkey vs Shortcut

Debe distinguirse entre:

```text
LOCAL SHORTCUT
```

y

```text
GLOBAL HOTKEY
```

Un shortcut puede depender de que SCREEN tenga foco.

Un hotkey global puede requerir capacidades adicionales del sistema operativo.

La disponibilidad de hotkeys globales será determinada por plataforma.

---

## 5. Acciones

Las acciones disponibles deberán definirse mediante un contrato explícito.

Ejemplos conceptuales:

* iniciar grabación;
* detener;
* pausar;
* reanudar;
* mostrar interfaz;
* ejecutar otra acción aprobada.

Estos ejemplos **no constituyen todavía una lista oficial**.

---

## 6. Configuración

Cada asignación deberá contemplar conceptualmente:

```text
ACTION
KEY COMBINATION
SCOPE
ENABLED
CONFLICT STATE
```

El almacenamiento físico de esta configuración permanece `TBD`.

---

## 7. Normalización

Los eventos deberán normalizarse para manejar diferencias entre:

* teclas;
* modificadores;
* layouts;
* sistemas operativos;
* dispositivos;
* representación física/lógica.

La estrategia concreta permanece `TBD`.

---

## 8. Conflictos

El sistema deberá detectar conflictos:

```text
HOTKEY A
     │
     ├── APPLICATION CONFLICT
     ├── DUPLICATE ASSIGNMENT
     ├── OS RESERVED
     ├── PLATFORM UNSUPPORTED
     └── PERMISSION RESTRICTION
```

No deberá registrar silenciosamente una combinación inválida.

---

## 9. Registro

Cuando sea necesario registrar un hotkey global, el sistema deberá:

1. validar la combinación;
2. comprobar disponibilidad;
3. registrar;
4. verificar resultado;
5. informar estado.

Si el registro falla, deberá existir un estado explícito.

---

## 10. Lifecycle

```text
UNCONFIGURED
     ↓
VALIDATING
     ↓
REGISTERING
     ↓
REGISTERED
     ↓
ACTIVE
     ↓
DISABLED
     ↓
UNREGISTERED
```

También deberán contemplarse:

* `FAILED`
* `UNSUPPORTED`
* `BLOCKED`

---

## 11. Errores

Posibles categorías:

* combinación inválida;
* conflicto;
* hotkey reservado;
* permiso insuficiente;
* plataforma incompatible;
* registro fallido;
* evento inválido;
* desregistro fallido;
* aplicación no disponible.

Los errores deberán propagarse sin ocultar la causa relevante.

---

## 12. Concurrencia

Los eventos de hotkeys pueden coincidir con:

* inicio;
* detención;
* pausa;
* cierre;
* cambio de configuración;
* cambio de estado de grabación.

La transición de estado deberá permanecer consistente.

---

## 13. Seguridad

El sistema de hotkeys no deberá convertirse en un mecanismo para ejecutar operaciones no autorizadas.

Debe existir una separación clara entre:

```text
KEY EVENT
      ↓
VALIDATED ACTION
      ↓
AUTHORIZED APPLICATION OPERATION
```

La UI no deberá considerarse la única barrera de seguridad.

---

## 14. Privacidad

Los eventos de teclado no deberán registrarse indiscriminadamente.

Los logs no deberán almacenar:

* contenido completo del teclado;
* secuencias innecesarias;
* información sensible.

Deberá registrarse únicamente información técnica necesaria.

---

## 15. Plataformas

El comportamiento deberá validarse individualmente para:

* Windows;
* Linux;
* macOS;
* Android;
* iOS.

No se deberá asumir que un mecanismo global de escritorio existe en plataformas móviles.

---

## 16. Rendimiento

La detección de hotkeys deberá tener impacto mínimo sobre:

* captura;
* encoding;
* UI;
* audio;
* consumo energético.

Especialmente en sesiones prolongadas y dispositivos móviles.

---

## 17. Pruebas

Deberán contemplarse:

* hotkey válido;
* hotkey inválido;
* conflicto;
* duplicado;
* tecla reservada;
* registro;
* desregistro;
* cambio de configuración;
* aplicación en segundo plano;
* foco;
* inicio/detención;
* pausa/reanudación;
* cierre;
* plataforma no compatible.

---

## 18. Gaps

| ID         | Gap                       |
| ---------- | ------------------------- |
| GAP-HK-001 | Lista oficial de acciones |
| GAP-HK-002 | Formato de combinación    |
| GAP-HK-003 | Global vs local           |
| GAP-HK-004 | Persistencia              |
| GAP-HK-005 | Detección de conflictos   |
| GAP-HK-006 | APIs por plataforma       |
| GAP-HK-007 | Permisos                  |
| GAP-HK-008 | Lifecycle                 |
| GAP-HK-009 | Mobile behavior           |
| GAP-HK-010 | Testing matrix            |

---

## 19. Estado actual

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

## 20. Regla de integridad

> **Un hotkey configurado no implica que esté registrado, activo o soportado por la plataforma.**

Cada estado deberá estar respaldado por evidencia técnica.
