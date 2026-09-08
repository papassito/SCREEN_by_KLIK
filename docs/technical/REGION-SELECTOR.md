# REGION-SELECTOR.md

# SCREEN by KLIK — Region Selector

**Ruta:** `docs/technical/REGION-SELECTOR.md`
**Versión documental:** `0.1.0-alpha`
**Estado:** `PLANNED`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADO`
**Certificación:** `NO CERTIFICADO`

---

## 1. Propósito

Este documento define las bases técnicas para seleccionar una región rectangular de captura.

El selector deberá producir una definición inequívoca de la región que será entregada al subsistema `CAPTURE`.

---

## 2. Alcance

Incluye conceptualmente:

* inicio de selección;
* coordenadas;
* dimensiones;
* displays;
* DPI/scaling;
* límites;
* validación;
* cancelación;
* confirmación;
* transformación de coordenadas;
* integración con `CAPTURE`.

No define la interfaz visual concreta.

---

## 3. Flujo

```text
SCREEN SOURCES
      ↓
DISPLAY / COORDINATE SPACE
      ↓
REGION SELECTION
      ↓
NORMALIZATION
      ↓
VALIDATION
      ↓
REGION DEFINITION
      ↓
CAPTURE
```

---

## 4. Región

Una región deberá poder representarse conceptualmente mediante:

```text
X
Y
WIDTH
HEIGHT
COORDINATE SPACE
SOURCE / DISPLAY CONTEXT
```

El formato físico del contrato permanece `TBD`.

---

## 5. Coordenadas

Deberán distinguirse:

* coordenadas de pantalla;
* coordenadas de ventana;
* coordenadas físicas;
* coordenadas lógicas;
* coordenadas escaladas.

No deberá asumirse que un píxel lógico equivale siempre a un píxel físico.

---

## 6. DPI y Scaling

El selector deberá considerar:

* DPI;
* scaling;
* displays con diferentes escalas;
* coordenadas virtuales;
* cambios de configuración.

La implementación depende de la plataforma.

---

## 7. Multi-monitor

Deberá contemplarse:

* selección en un monitor;
* región que cruza monitores;
* displays con resoluciones diferentes;
* displays con escalas diferentes;
* displays agregados/desconectados.

La política para regiones que atraviesen displays permanece `TBD`.

---

## 8. Validación

Una región deberá validarse antes de enviarse a captura.

Debe comprobarse:

* dimensiones válidas;
* coordenadas válidas;
* fuente disponible;
* límites;
* escala;
* compatibilidad de captura.

---

## 9. Regiones inválidas

Ejemplos conceptuales:

```text
WIDTH <= 0
HEIGHT <= 0
OUT OF BOUNDS
INVALID COORDINATE SPACE
SOURCE UNAVAILABLE
DISPLAY DISCONNECTED
```

Deben rechazarse explícitamente.

---

## 10. Cancelación

El usuario deberá poder cancelar la selección sin iniciar una captura inválida.

```text
SELECTING
   ├── CONFIRM → VALIDATE → ACCEPT
   └── CANCEL  → ABORT
```

---

## 11. Integración con CAPTURE

`REGION-SELECTOR` define **qué región** capturar.

`CAPTURE` define **cómo adquirir** los frames.

```text
REGION-SELECTOR
       ↓
REGION DEFINITION
       ↓
CAPTURE
```

El selector no deberá asumir responsabilidades de adquisición.

---

## 12. Seguridad

Las coordenadas no deberán permitir acceso a recursos fuera de las fuentes autorizadas.

Deberá validarse toda entrada.

---

## 13. Rendimiento

La selección deberá ser ligera y no interferir con el pipeline de grabación.

El selector no deberá mantenerse activo innecesariamente durante la captura.

---

## 14. Plataformas

Deberá validarse individualmente en:

* Windows;
* Linux;
* macOS;
* Android;
* iOS.

Las plataformas móviles pueden requerir un modelo diferente de selección.

---

## 15. Pruebas

Deberán contemplarse:

* región válida;
* región mínima;
* región máxima;
* fuera de límites;
* DPI;
* scaling;
* multi-monitor;
* display desconectado;
* cancelación;
* cambio de display;
* coordenadas inválidas;
* integración con capture.

---

## 16. Gaps

| ID          | Gap                     |
| ----------- | ----------------------- |
| GAP-REG-001 | Coordinate model        |
| GAP-REG-002 | Physical/logical pixels |
| GAP-REG-003 | DPI handling            |
| GAP-REG-004 | Multi-monitor policy    |
| GAP-REG-005 | Cross-display region    |
| GAP-REG-006 | Mobile selection model  |
| GAP-REG-007 | Validation contract     |
| GAP-REG-008 | Capture integration     |
| GAP-REG-009 | UI integration          |
| GAP-REG-010 | Testing matrix          |

---

## 17. Estado actual

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

## 18. Regla de integridad

> **Una región seleccionada solo es válida cuando sus coordenadas, espacio de coordenadas, fuente y límites han sido validados.**
