# SCREEN by KLIK — Matriz de Trazabilidad

## 1. Propósito

Este documento define el mecanismo de trazabilidad de **SCREEN by KLIK** entre los requisitos formalizados, la arquitectura, los módulos, la documentación, las fases de desarrollo, la implementación y las pruebas.

Su objetivo es permitir determinar, para cada requisito:

- dónde está definido;
- qué componente o módulo lo materializa;
- qué documentación lo desarrolla;
- en qué fase está previsto;
- dónde está implementado;
- cómo se valida;
- cuál es su estado real.

La matriz constituye un mecanismo de **control de cobertura y consistencia**, no un sustituto de los documentos que definen los requisitos, la arquitectura o las pruebas.

**Estado General:** `POPULATING`

---

## 2. Fuente de Autoridad

La fuente oficial de los identificadores de requisitos `REQ-*` será:

```text
docs/requirements/REQUIREMENTS.md
```

La matriz no podrá crear, modificar ni inventar identificadores de requisitos.

Los requisitos deberán existir primero en su documento fuente.

Por tanto:

```text
REQUIREMENTS.md
       ↓
IDENTIFICADORES REQ-*
       ↓
MATRIZ DE TRAZABILIDAD
```

La matriz consume los requisitos; no los define.

---

## 3. Estado Actual

**ESTADO: `POPULATING`**

La población de la matriz ha sido desbloqueada tras la formalización del documento de requisitos `docs/requirements/REQUIREMENTS.md`.

El proceso actual consiste en vincular los 244 requisitos identificados con sus correspondientes artefactos a lo largo del ciclo de vida del proyecto (arquitectura, implementación, pruebas, etc.).

Este es un documento vivo que se actualizará a medida que el proyecto avance.

---

## 4. Cadena de Trazabilidad

La trazabilidad completa deberá seguir, cuando corresponda, la siguiente cadena:

```text
REQUISITO
    ↓
COMPONENTE
    ↓
MÓDULO
    ↓
ARQUITECTURA
    ↓
DOCUMENTACIÓN
    ↓
FASE
    ↓
IMPLEMENTACIÓN
    ↓
PRUEBA
    ↓
EVIDENCIA
    ↓
ESTADO
```

No todos los requisitos necesariamente tendrán exactamente los mismos elementos intermedios.

Por ejemplo, un requisito documental, de seguridad o de configuración puede no corresponder directamente a una única función o archivo.

La matriz deberá reflejar la relación real y no forzar una estructura artificial.

---

## 5. Estructura de la Matriz

La estructura prevista será:

| Requisito ID | Tipo | Componente | Módulo | Arquitectura / Documento | Fase | Implementación | Prueba | Evidencia | Estado |
|---|---|---|---|---|---|---|---|---|---|
| `REQ-*` | `FUNCTIONAL / NON-FUNCTIONAL / SECURITY / OTHER` | `TBD` | `TBD` | `TBD` | `TBD` | `MISSING` | `MISSING` | `MISSING` | `PLANNED` |

Los valores `TBD`, `MISSING` y equivalentes deberán utilizarse únicamente para representar estados reales conocidos.

No deberán utilizarse para ocultar información que ya debería estar disponible.

---

## 6. Definición de Campos

### 6.1 Requisito ID

Identificador oficial procedente de:

```text
docs/requirements/REQUIREMENTS.md
```

Ejemplo:

```text
REQ-F-001
```

---

### 6.2 Tipo

Clasificación del requisito según la taxonomía establecida por `REQUIREMENTS.md`.

Podrá incluir, según la clasificación definitiva:

- `FUNCTIONAL`
- `NON-FUNCTIONAL`
- `SECURITY`
- `PERFORMANCE`
- `USABILITY`
- `COMPATIBILITY`
- `OPERATIONAL`
- `OTHER`

La taxonomía definitiva deberá coincidir con la fuente oficial.

---

### 6.3 Componente

Identifica el componente del sistema relacionado con el requisito.

El componente deberá existir realmente en la arquitectura aprobada o estar marcado explícitamente como planificado.

---

### 6.4 Módulo

Identifica el módulo responsable o relacionado con el requisito.

No deberá asignarse un requisito a un módulo inexistente únicamente para completar una fila.

---

### 6.5 Arquitectura / Documentación

Identifica el documento que define o desarrolla técnicamente la responsabilidad correspondiente.

Puede incluir documentos de:

- arquitectura;
- módulos;
- interfaces;
- seguridad;
- rendimiento;
- errores;
- almacenamiento;
- plataforma;
- operación;
- otros documentos técnicos aplicables.

---

### 6.6 Fase

Identifica la fase del `ROADMAP.md` asociada con el requisito.

La existencia de una fase en el roadmap no significa que el requisito haya sido implementado.

La relación representa planificación hasta que exista evidencia de ejecución.

---

### 6.7 Implementación

Cuando exista una implementación real, deberá registrarse la referencia concreta correspondiente.

Antes de existir dicha implementación deberá utilizarse:

```text
MISSING
```

o el estado que corresponda.

No deberán inventarse nombres de archivos, funciones, paquetes, clases, módulos u otros artefactos.

---

### 6.8 Prueba

Identifica la prueba o mecanismo de validación que cubre el requisito.

Cuando todavía no exista una prueba deberá registrarse:

```text
MISSING
```

No deberá afirmarse cobertura simplemente porque exista intención de crear una prueba.

---

### 6.9 Evidencia

Identifica la evidencia que demuestra la validación del requisito.

Dependiendo del tipo de requisito, puede corresponder a:

- resultado de prueba;
- benchmark;
- inspección;
- validación funcional;
- evidencia de seguridad;
- registro de ejecución;
- resultado de certificación;
- otro mecanismo verificable.

Una prueba planificada no constituye evidencia.

---

### 6.10 Estado

Representa el estado real de trazabilidad del requisito.

El estado deberá derivarse de la evidencia disponible.

---

## 7. Estados de Trazabilidad

Se establecen los siguientes estados conceptuales:

### `PLANNED`

El requisito existe y está planificado, pero todavía no existe implementación validada.

### `PARTIAL`

Existe una cobertura parcial, pero el requisito todavía no está completamente satisfecho.

### `IMPLEMENTED`

Existe una implementación que materializa el requisito.

Esto no implica que haya sido validada.

### `TESTED`

Existe una prueba ejecutada relacionada con el requisito.

Esto no implica necesariamente que el requisito haya sido certificado.

### `VALIDATED`

La evidencia disponible demuestra que el requisito cumple los criterios establecidos.

### `CERTIFIED`

El requisito forma parte de un conjunto formalmente certificado conforme al proceso de certificación del proyecto.

### `BLOCKED`

Existe un impedimento que evita continuar la trazabilidad o validación.

### `MISSING`

Falta una contraparte necesaria para establecer la trazabilidad.

### `DEPRECATED`

El requisito o su cobertura han sido sustituidos conforme al control documental del proyecto.

### `REMOVED`

El requisito ha sido formalmente retirado.

---

## 8. Regla de No Invención

La matriz deberá representar únicamente información verificable.

Está prohibido completar una relación mediante la invención de:

- requisitos;
- componentes;
- módulos;
- archivos;
- funciones;
- pruebas;
- resultados;
- evidencias;
- certificaciones.

Si una contraparte todavía no existe, deberá indicarse mediante el estado correspondiente.

Ejemplo correcto:

```text
REQ-F-001
Implementación: MISSING
Prueba: MISSING
Estado: PLANNED
```

Ejemplo incorrecto:

```text
REQ-F-001
Implementación: recorder.go
Prueba: TestRecorder
Estado: VALIDATED
```

cuando esos artefactos todavía no existen.

---

## 9. Cobertura de Requisitos

La matriz deberá permitir identificar al menos cuatro niveles de cobertura:

### 9.1 Cobertura Documental

El requisito está relacionado con documentación que define su comportamiento.

```text
REQUISITO → DOCUMENTACIÓN
```

### 9.2 Cobertura Arquitectónica

El requisito tiene una responsabilidad identificada dentro de la arquitectura.

```text
REQUISITO → ARQUITECTURA → COMPONENTE/MÓDULO
```

### 9.3 Cobertura de Implementación

Existe una materialización real del requisito.

```text
REQUISITO → IMPLEMENTACIÓN
```

### 9.4 Cobertura de Validación

Existe una prueba o mecanismo de validación con evidencia suficiente.

```text
REQUISITO → PRUEBA → EVIDENCIA
```

La cobertura documental o arquitectónica no deberá confundirse con cobertura de implementación.

La implementación tampoco deberá confundirse con validación.

---

## 10. Trazabilidad Bidireccional

La matriz deberá permitir recorrer la trazabilidad en ambos sentidos.

### Desde el requisito

```text
REQ-*
 ↓
Componente
 ↓
Módulo
 ↓
Implementación
 ↓
Prueba
 ↓
Evidencia
```

### Desde una implementación

```text
Implementación
 ↓
Módulo
 ↓
Componente
 ↓
REQ-*
```

Esto permitirá detectar tanto:

- requisitos sin implementación;
- como implementaciones que no estén justificadas por ningún requisito conocido.

---

## 11. Detección de Gaps

La matriz deberá utilizarse para identificar inconsistencias y vacíos.

Ejemplos:

### Requisito sin arquitectura

```text
REQ → MISSING
```

### Requisito con arquitectura pero sin implementación

```text
REQ → COMPONENTE → MISSING
```

### Requisito implementado pero sin prueba

```text
REQ → IMPLEMENTACIÓN → MISSING TEST
```

### Prueba sin requisito asociado

```text
TEST → NO REQ
```

### Implementación sin requisito asociado

```text
IMPLEMENTACIÓN → NO REQ
```

Estos casos deberán quedar visibles y no ocultarse mediante estados artificiales.

---

## 12. Relación con Otros Documentos

La matriz deberá mantener coherencia con:

```text
README.md
MANIFESTO.md
MAP.md
docs/requirements/REQUIREMENTS.md
docs/architecture/ARCHITECTURE.md
docs/components/COMPONENTS.md
docs/development/MODULES.md
ROADMAP.md
docs/development/TESTING.md
docs/development/PERFORMANCE.md
docs/development/ERROR_HANDLING.md
CHANGELOG.md
docs/development/RELEASE_PROCESS.md
```

No todos estos documentos necesariamente existirán simultáneamente en todas las fases del proyecto.

La matriz deberá reflejar únicamente los documentos que realmente existan y estén aprobados.

---

## 13. Control de Cambios

Cuando un requisito sea:

- agregado;
- modificado;
- dividido;
- fusionado;
- sustituido;
- deprecado;
- eliminado;

deberá revisarse su impacto sobre la matriz.

Una modificación de requisito podrá afectar:

```text
REQUISITO
 ↓
ARQUITECTURA
 ↓
MÓDULOS
 ↓
IMPLEMENTACIÓN
 ↓
PRUEBAS
 ↓
EVIDENCIA
```

La matriz deberá actualizarse para evitar relaciones obsoletas.

---

## 14. Consistencia

La matriz deberá considerarse inconsistente cuando, por ejemplo:

- un `REQ-*` no exista en `REQUIREMENTS.md`;
- una implementación referenciada no exista;
- una prueba referenciada no exista;
- una evidencia no pueda localizarse;
- un documento referenciado haya sido eliminado;
- un requisito figure como `VALIDATED` sin evidencia suficiente;
- un requisito figure como `CERTIFIED` sin certificación correspondiente.

Una inconsistencia no deberá corregirse inventando información.

Deberá investigarse y documentarse.

---

## 15. Validación de la Matriz

Antes de considerar la matriz válida deberá verificarse:

- [ ] Todos los `REQ-*` proceden de la fuente oficial.
- [ ] No existen identificadores inventados.
- [ ] Las relaciones arquitectónicas son reales o están explícitamente marcadas como planificadas.
- [ ] Las referencias de implementación existen cuando se declaran.
- [ ] Las pruebas referenciadas existen cuando se declaran.
- [ ] La evidencia puede identificarse.
- [ ] Los estados corresponden a la evidencia disponible.
- [ ] No existen requisitos declarados como validados sin evidencia.
- [ ] No existen relaciones obsoletas conocidas.
- [ ] Los documentos relacionados son coherentes.

---

## 16. Estado de la Matriz

### Estado actual

```text
BLOCKED_FOR_POPULATION
```

### Motivo

La fuente oficial de requisitos:

```text
docs/requirements/REQUIREMENTS.md
```

todavía no se encuentra disponible como catálogo formal de requisitos dentro del alcance de este documento.

Por ello, la matriz no deberá ser poblada mediante ejemplos que puedan confundirse con requisitos reales.

---

## 17. Próximo Estado

Una vez creado y aprobado `REQUIREMENTS.md`, el proceso deberá continuar:

```text
REQUIREMENTS.md
       ↓
EXTRACCIÓN DE REQ-*
       ↓
MATRIZ INICIAL
       ↓
MAPEO ARQUITECTÓNICO
       ↓
MAPEO DE MÓDULOS
       ↓
MAPEO DE IMPLEMENTACIÓN
       ↓
MAPEO DE PRUEBAS
       ↓
EVIDENCIA
       ↓
VALIDACIÓN
```

Cada etapa deberá ejecutarse únicamente cuando exista información real para establecer la relación correspondiente.

---

## 18. Regla Suprema

> **La matriz de trazabilidad no sirve para hacer que el proyecto parezca completo; sirve para demostrar qué está realmente cubierto y qué todavía falta.**

Un requisito sin implementación deberá aparecer como tal.

Una implementación sin prueba deberá aparecer como tal.

Una prueba sin evidencia deberá aparecer como tal.

Una evidencia insuficiente no deberá convertirse en `VALIDATED`.

Y ningún elemento inexistente deberá ser creado documentalmente para cerrar una brecha.

**Estado del documento:** `PLANNED`

**Estado de población:** `BLOCKED_FOR_POPULATION`