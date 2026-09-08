# SCREEN-SOURCES.md

# SCREEN by KLIK — Screen Sources

**Ruta:** `docs/technical/SCREEN-SOURCES.md`
**Versión documental:** `0.1.0-alpha`
**Estado:** `PLANNED`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADO`
**Certificación:** `NO CERTIFICADO`

---

## 1. Propósito

Este documento define el modelo técnico para descubrir, identificar, describir y seleccionar las **fuentes de pantalla** disponibles para captura.

Es complementario a:

`docs/technical/CAPTURE.md`

La separación fundamental es:

```text
SCREEN-SOURCES
    ↓
¿QUÉ PUEDO CAPTURAR?
    ↓
CAPTURE
    ↓
¿CÓMO CAPTURO LO SELECCIONADO?
```

---

## 2. Fuentes conceptuales

La arquitectura contempla inicialmente:

```text
FULL SCREEN
WINDOW
REGION
OTHER SUPPORTED SOURCE
```

La lista definitiva permanece `TBD`.

---

## 3. Descubrimiento

El descubrimiento deberá identificar las fuentes disponibles en el entorno actual.

Una fuente podrá estar:

* `AVAILABLE`
* `UNAVAILABLE`
* `INVALID`
* `UNKNOWN`

No deberá confundirse una fuente visible con una fuente técnicamente capturable.

---

## 4. Identidad

Cada fuente deberá tener una identidad suficiente para diferenciarla de otras fuentes.

Los atributos concretos permanecen `TBD`.

Podrán requerirse conceptualmente:

```text
SOURCE TYPE
SOURCE ID
DISPLAY CONTEXT
WINDOW CONTEXT
GEOMETRY
CAPABILITIES
STATE
```

---

## 5. Displays

En entornos con múltiples displays deberán distinguirse:

* identidad;
* resolución;
* posición;
* escala;
* orientación;
* disponibilidad.

Los atributos concretos serán determinados por plataforma.

---

## 6. Windows

Cuando se soporte captura de ventana, deberán contemplarse:

* identificación;
* ventana visible;
* ventana minimizada;
* ventana cerrada;
* cambios de tamaño;
* cambios de posición;
* múltiples ventanas;
* ventanas protegidas.

El comportamiento exacto permanece `TBD`.

---

## 7. Región

Una región no necesariamente constituye una fuente física independiente.

Conceptualmente:

```text
DISPLAY / SCREEN SOURCE
        ↓
REGION DEFINITION
        ↓
CAPTURE AREA
```

La definición técnica pertenece a `REGION-SELECTOR.md`.

---

## 8. Capacidades

Cada fuente podrá tener capacidades diferentes.

Conceptualmente:

```text
SOURCE
 ├── CAPTURABLE
 ├── RESOLUTION
 ├── FRAME RATE
 ├── AUDIO RELATION
 ├── CURSOR
 └── OTHER CAPABILITIES
```

No se deberá asumir que todas las fuentes ofrecen las mismas capacidades.

---

## 9. Selección

La selección deberá:

1. descubrir;
2. presentar fuentes válidas al nivel correspondiente;
3. recibir selección;
4. verificar que sigue disponible;
5. entregar la definición a `CAPTURE`.

Una fuente puede desaparecer entre descubrimiento y captura.

---

## 10. Cambios dinámicos

El sistema deberá contemplar:

* monitor conectado;
* monitor desconectado;
* ventana cerrada;
* ventana movida;
* ventana redimensionada;
* cambio de escala;
* cambio de sesión.

El comportamiento exacto permanece `TBD`.

---

## 11. Fuente perdida

Una fuente seleccionada puede pasar:

```text
AVAILABLE
   ↓
LOST
   ↓
RECOVERY / DEGRADED / FAILED
```

No deberá sustituirse silenciosamente por otra fuente.

---

## 12. Seguridad

La enumeración y selección deberán respetar las capacidades y permisos de la plataforma.

No deberá asumirse acceso universal a cualquier contenido visible.

---

## 13. Privacidad

La enumeración de ventanas y fuentes puede revelar información sensible.

Deberá minimizarse:

* almacenamiento;
* logging;
* exposición de nombres;
* persistencia innecesaria.

Los nombres de ventanas no deberán aparecer en logs salvo que exista una justificación técnica.

---

## 14. Compatibilidad

La disponibilidad de fuentes depende de:

* sistema operativo;
* sesión gráfica;
* compositor;
* permisos;
* drivers;
* tipo de display;
* aplicación objetivo.

La compatibilidad deberá validarse por plataforma.

---

## 15. Rendimiento

El descubrimiento no deberá ejecutarse innecesariamente durante toda la grabación.

Deberán considerarse:

* frecuencia de refresh;
* coste de enumeración;
* cambios dinámicos;
* impacto de polling;
* eventos del sistema.

La estrategia concreta permanece `TBD`.

---

## 16. Pruebas

Deberán contemplarse:

* un display;
* múltiples displays;
* ventana válida;
* ventana cerrada;
* ventana redimensionada;
* monitor desconectado;
* scaling;
* fuente no disponible;
* permisos;
* cambio dinámico;
* selección inválida.

---

## 17. Evidencia

La evidencia deberá demostrar:

* fuentes descubiertas;
* capacidades;
* plataforma;
* configuración;
* selección;
* resultado;
* comportamiento ante cambios.

---

## 18. Gaps

| ID          | Gap                  |
| ----------- | -------------------- |
| GAP-SRC-001 | Source identity      |
| GAP-SRC-002 | Source types         |
| GAP-SRC-003 | Display discovery    |
| GAP-SRC-004 | Window discovery     |
| GAP-SRC-005 | Capability model     |
| GAP-SRC-006 | Dynamic changes      |
| GAP-SRC-007 | Source loss          |
| GAP-SRC-008 | Permissions          |
| GAP-SRC-009 | Platform differences |
| GAP-SRC-010 | Testing matrix       |

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

> **Una fuente descubierta no equivale a una fuente capturable, y una fuente capturable no equivale a una fuente certificada.**
