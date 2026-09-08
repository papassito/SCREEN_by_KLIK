# SCREEN by KLIK — Changelog

Todos los cambios notables realizados en **SCREEN by KLIK** deberán registrarse en este archivo.

El historial de cambios tiene como finalidad proporcionar una referencia clara, ordenada y verificable de la evolución del proyecto.

El formato utilizado sigue las convenciones de [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) y la evolución de versiones utiliza [Semantic Versioning](https://semver.org/spec/v2.0.0.html) como referencia.

---

## Nota sobre el historial

Este `CHANGELOG.md` se establece a partir del estado actual de **SCREEN by KLIK**.

No se ha podido reconstruir un historial anterior que pueda considerarse completamente verificable. Por esta razón, `0.1.0-alpha` se establece como la **línea base documental inicial** del proyecto.

Esta versión no implica necesariamente una publicación comercial ni una versión final del producto.

Representa únicamente el punto a partir del cual comienza el historial verificable de evolución del proyecto.

A partir de esta línea base, todo cambio relevante deberá registrarse de manera explícita y verificable.

---

# [Unreleased]

Esta sección registra las modificaciones, reorganizaciones y correcciones físicas ejecutadas durante la fase de cierre documental para lograr el estado oficial "Listo para Código" (Ready for Code).

## Added

- Creación de `MAP.md` como mapa maestro de la estructura documental del proyecto.
- Creación de `docs/contracts/CONTRACT.md` en su ruta definitiva de gobierno técnico.

## Changed

- Reorganización de la topología de archivos del repositorio, moviendo físicamente documentos de la raíz de `docs/` a subdirectorios especializados (`architecture/`, `components/`, `development/`, `requirements/` y `legal/`).
- Reestructuración física de la carpeta `phases/`, convirtiendo los archivos planos obsoletos en módulos documentales autónomos con formato de directorio `phases/PHASE-XX-NAME/README.md`.
- Desbloqueo y población real y honesta de la matriz de trazabilidad en `docs/development/TRACEABILITY.md` vinculando las 244 firmas de requisitos de la fuente oficial.

## Fixed

- Eliminación de la duplicación de contenido y limpieza estructural de encabezados en el documento de la `PHASE-11` (`phases/PHASE-11-HOTKEYS/README.md`).
- Corrección de enlaces y rutas internas relativas rotas dentro de los 64 archivos Markdown para alinearlos con la nueva topología.

## Removed

- N/A

## Security

- N/A

## Documentation

- Sincronización completa de toda la suite documental con las nuevas rutas relativas y estados honestos correspondientes.

---

# [0.1.0-alpha] — Línea base documental inicial

## Added

- Definición inicial de **SCREEN by KLIK** como producto.
- Definición conceptual del propósito y alcance del proyecto.
- Estructura documental inicial.
- Definición conceptual de la arquitectura.
- Identificación inicial de componentes funcionales.
- Identificación inicial de módulos.
- Definición inicial de fases de evolución.
- Establecimiento de la estructura documental prevista para la matriz de trazabilidad.

## Changed

- N/A

## Fixed

- N/A

## Removed

- N/A

## Security

- N/A

## Documentation

Se establece la documentación inicial que sirvió como punto de partida (línea base original):

- `README.md` — definición general, propósito y visión del producto.
- `ROADMAP.md` — fases y evolución planificada del proyecto.
- `MANIFESTO.md` — principios fundamentales y gobierno documental del proyecto.
- `docs/README.md` — índice original de la documentación.
- `docs/requirements/REQUIREMENTS.md` — requisitos oficiales del proyecto.
- `docs/ARCHITECTURE.md` — principios arquitectónicos (ruta original en la raíz de `docs/`).
- `docs/COMPONENTS.md` — identificación y organización de componentes (ruta original).
- `docs/MODULES.md` — definición y organización de módulos (ruta original).
- `docs/FUNCTIONS.md` — espacio reservado para especificación de funciones (ruta original).
- `docs/CHANGELOG.md` — historial oficial de cambios (ruta original).
- `docs/TRACEABILITY.md` — matriz de trazabilidad estructural, bloqueada para población (`BLOCKED_FOR_POPULATION`) (ruta original).
- Archivos planos de fases originales bajo la ruta `phases/PHASE-XX-*.md`.

---

# Reglas del CHANGELOG

## 1. Registro verificable

Todo cambio registrado debe corresponder a una modificación real del proyecto.

No deberán registrarse como realizados cambios que únicamente hayan sido propuestos, imaginados, planificados o discutidos.

---

## 2. Separación entre realidad y planificación

Las funcionalidades futuras deberán permanecer diferenciadas de las funcionalidades realmente implementadas.

Una característica planificada no debe registrarse como `Added` hasta que exista evidencia de su implementación y validación.

---

## 3. Evidencia

El historial debe representar el estado real del proyecto.

No deberán utilizarse como evidencia:

- resultados hipotéticos;
- resultados simulados;
- pruebas no ejecutadas;
- capacidades no verificadas;
- componentes inexistentes;
- integraciones no realizadas;
- estados asumidos.

---

## 4. Documentación

Los cambios exclusivamente documentales deberán registrarse bajo:

```text
Documentation
```

No deberán clasificarse como cambios funcionales cuando únicamente hayan modificado documentación.

---

## 5. Seguridad

Todo cambio que afecte directa o indirectamente a la seguridad deberá registrarse bajo:

```text
Security
```

Cuando corresponda, deberá indicarse claramente qué componente, mecanismo o política fue afectado.

---

## 6. Versionado

Las versiones deberán seguir una evolución coherente con Semantic Versioning.

La asignación de una nueva versión deberá realizarse únicamente cuando exista una base suficiente para considerar que el estado del proyecto corresponde a dicha versión.

---

## 7. Integridad histórica

Una entrada histórica no deberá modificarse para ocultar errores, reemplazar resultados reales o alterar retrospectivamente el estado del proyecto.

Si una entrada anterior contiene un error, deberá corregirse de forma explícita y conservarse la trazabilidad de la corrección cuando sea relevante.

---

# Principio fundamental

> **El CHANGELOG registra la realidad histórica de SCREEN by KLIK, no la intención futura del proyecto.**

Por lo tanto:

```text
PROPUESTA ≠ IMPLEMENTACIÓN

IMPLEMENTACIÓN ≠ VALIDACIÓN

VALIDACIÓN ≠ CERTIFICACIÓN

CERTIFICACIÓN ≠ PUBLICACIÓN
```

Cada estado deberá registrarse de acuerdo con su condición real.

---

# Estado actual

**Versión base:** `0.1.0-alpha`

**Estado:** Línea base documental inicial.

**Historial previo:** No verificable.

**Próxima evolución:** `Unreleased`

El historial posterior deberá construirse exclusivamente a partir de cambios reales, verificables y trazables.