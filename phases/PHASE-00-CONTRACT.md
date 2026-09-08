# SCREEN by KLIK
# PHASE 00 — CONTRACT

**Documento:** `PHASE-00-CONTRACT.md`  
**Fase:** 00  
**Nombre:** CONTRACT  
**Estado:** FOUNDATION / AUTHORITATIVE WITHIN PHASE  
**Proyecto:** SCREEN by KLIK

---

## 1. OBJETIVO

PHASE 00 establece las reglas fundacionales bajo las cuales se desarrollarán todas las fases posteriores de SCREEN by KLIK.

Su propósito es impedir:

- deriva arquitectónica;
- contratos duplicados;
- dependencias ocultas;
- responsabilidades ambiguas;
- implementación prematura;
- contradicciones documentales.

PHASE 00 no implementa funcionalidades de usuario.

---

## 2. AUTORIDAD

PHASE 00 está subordinada a:

```text
../docs/contracts/CONTRACT.md
```

Por lo tanto:

> PHASE 00 operacionaliza el contrato maestro, pero no puede reemplazarlo ni contradecirlo.

---

## 3. JERARQUÍA DOCUMENTAL

La jerarquía de autoridad contractual es:

```text
../docs/contracts/CONTRACT.md
    ↓
PHASE-00-CONTRACT.md
    ↓
Contratos específicos de fase (PHASE-N-CONTRACT.md)
    ↓
Requisitos de fase (PHASE-N-REQUIREMENTS.md)
    ↓
Implementación
    ↓
Pruebas
```

Documentos como `README.md`, `MANIFESTO.md`, `MAP.md`, `TRACEABILITY.md` y `CHANGELOG.md` son fundamentales para el gobierno y la navegación, pero **no constituyen autoridades contractuales** y no pueden redefinir las reglas establecidas en los contratos.

---

## 4. ALCANCE

Esta fase define:

- gobernanza contractual;
- límites entre fases;
- propiedad de responsabilidades;
- disciplina de interfaces;
- dependencias;
- trazabilidad;
- requisitos mínimos de documentación;
- criterios de preparación para implementación;
- criterios de aceptación.

---

## 5. NO OBJETIVOS

PHASE 00 no implementa:

- captura de pantalla;
- detección de displays;
- audio;
- hotkeys;
- procesamiento multimedia;
- UI funcional;
- automatización;
- lógica específica de fases posteriores.

---

## 6. PROPIEDAD

Cada artefacto del proyecto debe tener un propietario único y explícito. Se distinguen:

- **Propiedad Funcional:** La fase responsable de la capacidad.
- **Propiedad Contractual:** La fase o documento que define y posee el contrato.
- **Propiedad de Implementación:** La fase que materializa el código.
- **Propiedad de Pruebas:** La fase que valida el comportamiento.
- **Propiedad de Documentación:** La fase que mantiene la documentación asociada.

Una fase es propietaria de sus propios contratos. Los contratos transversales pueden tener un propietario de nivel superior, como `PHASE-00` o `CONTRACT.md`.

---

## 7. REGLA DE AISLAMIENTO

Una fase no debe acceder directamente a:

- variables privadas;
- estructuras internas;
- archivos internos;
- estados privados;
- funciones no contractuales

de otra fase.

La comunicación debe producirse mediante interfaces explícitas.

---

## 8. DEPENDENCIAS

Toda dependencia debe documentarse.

Una dependencia válida debe responder:

- ¿quién consume?
- ¿quién proporciona?
- ¿qué interfaz se utiliza?
- ¿qué versión o compatibilidad requiere?
- ¿qué ocurre si el proveedor falla?

Las dependencias accidentales no forman parte de la arquitectura.

---

## 9. CONTRATOS DE FASE

Cada fase debe distinguir claramente entre:

### Contrato

Define lo que el sistema garantiza.

### Requirements

Define lo que la fase debe cumplir.

### README

Explica la fase y permite comprender su propósito y funcionamiento.

### Código

Implementa las garantías definidas.

### Tests

Demuestran que las garantías se cumplen.

---

## 10. REGLA DE NO REDEFINICIÓN

Una fase puede:

- especializar;
- implementar;
- consumir;
- exponer interfaces expresamente autorizadas.

Una fase no puede:

- redefinir el contrato maestro;
- modificar unilateralmente un contrato propiedad de otra fase;
- cambiar responsabilidades de otra fase;
- introducir una arquitectura paralela;
- declarar como propio un recurso que pertenece a otra fase.
- apropiarse de un recurso perteneciente a otra fase.

---

## 11. INTERFACES

Una interfaz se considera **estable** únicamente cuando:

- tiene propietario;
- tiene contrato documentado;
- tiene versión o identificador;
- tiene consumidores identificados;
- tiene comportamiento de error definido;
- tiene pruebas contractuales (`Contract Tests`);
- forma parte de la trazabilidad.

Una interfaz no documentada o que no cumpla estos criterios no debe considerarse estable.

- entrada;
- salida;
- estado;
- error;
- timeout;
- comportamiento ante fallo;
- seguridad;
- condiciones de éxito.

---

## 12. SEGURIDAD FUNDACIONAL

Todas las fases deben asumir:

- entradas potencialmente inválidas;
- fallos de dependencias;
- condiciones de carrera;
- pérdida de recursos;
- interrupciones;
- estados inesperados.

El comportamiento por defecto ante condiciones inseguras debe ser conservador.

---

## 13. TESTING FUNDACIONAL

Toda fase posterior debe disponer de pruebas que validen su contrato y comportamiento. Se distinguen varios tipos de pruebas:

```text
- Contract Tests: Verifican que la implementación cumple el contrato expuesto.
- Unit Tests: Verifican unidades aisladas de código.
- Integration Tests: Verifican la colaboración entre componentes.
- Security Tests: Verifican vulnerabilidades y políticas de seguridad.
- Lifecycle Tests: Verifican el ciclo de vida (inicio, parada, error).
- Acceptance Tests: Verifican los criterios de aceptación.
```

Las fases con requisitos de seguridad deben incorporar además pruebas específicas de seguridad.

---

## 13. TRAZABILIDAD

Los requisitos deben poder rastrearse desde su origen hasta su evidencia.

Modelo:

```text
Requirement
    ↓
Contract
    ↓
Implementation
    ↓
Test
    ↓
Acceptance
```

La ausencia de trazabilidad debe considerarse una deuda documental.

---

## 14. CAMBIO DE CONTRATO

Un cambio contractual debe incluir:

1. identificación del contrato;
2. descripción del cambio;
3. motivo;
4. impacto;
5. fases afectadas;
6. actualización documental;
7. actualización de tests.

No se deben realizar cambios contractuales silenciosos.

---

## 15. IMPLEMENTATION READY

Una fase puede declararse:

**IMPLEMENTATION READY**

cuando:

- alcance definido;
- responsabilidades definidas;
- dependencias definidas;
- contrato definido;
- requisitos definidos;
- criterios de aceptación definidos;
- riesgos conocidos;
- contradicciones abiertas resueltas.

---

## 16. DOCUMENTATION READY

La documentación del proyecto puede declararse:

**DOCUMENTATION READY**

cuando:

- los documentos obligatorios existen;
- no existen archivos contractuales esenciales vacíos;
- las fases están identificadas;
- las responsabilidades son coherentes;
- los contratos no se contradicen;
- los requisitos están trazados;
- los documentos de fase son consistentes con el contrato maestro.

---

## 17. REGLA DE IMPLEMENTACIÓN

El código debe seguir la documentación aprobada.

Si durante la implementación aparece una necesidad que contradice el contrato:

**no debe solucionarse simplemente modificando el código.**

Debe revisarse primero el contrato correspondiente.

---

## 18. CRITERIO DE ACEPTACIÓN

PHASE 00 se considera completada cuando:

- el sistema documental tiene una jerarquía clara;
- los límites entre fases están definidos;
- las dependencias están controladas;
- las reglas de interfaz están documentadas;
- existe trazabilidad;
- existen criterios de aceptación;
- las fases posteriores pueden desarrollarse sin redefinir la arquitectura fundacional.

---

## 19. REGLA FINAL

PHASE 00 protege la arquitectura contra la deriva.

Su función no es decidir cómo debe implementarse cada funcionalidad.

Su función es garantizar que cada funcionalidad tenga:

**propietario + contrato + requisitos + implementación + pruebas + aceptación.**

---

## 20. ESTADO

**PHASE 00 — CONTRACT**

FOUNDATION CONTRACT ESTABLISHED.