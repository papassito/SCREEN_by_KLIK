# SCREEN by KLIK — Release Process

## 1. Propósito

Este documento define el proceso controlado para preparar, validar, aprobar y publicar una versión de **SCREEN by KLIK**.

El proceso establece las condiciones mínimas que deberán cumplirse antes de considerar un artefacto como una versión liberable.

El objetivo es garantizar:

- trazabilidad;
- reproducibilidad;
- integridad de los artefactos;
- validación funcional;
- validación de seguridad;
- documentación correcta;
- identificación inequívoca de la versión;
- separación entre desarrollo, validación y publicación.

**Estado General:** `PLANNED`

---

## 2. Principios de Release

Todo proceso de release deberá respetar los siguientes principios:

### 2.1 Realidad antes que documentación

Una versión no podrá declararse liberada únicamente porque exista documentación que la describa.

Deberá existir un artefacto real, validado y trazable.

### 2.2 Evidencia antes que afirmación

Cada condición crítica del release deberá poder respaldarse mediante evidencia.

No deberán declararse como realizadas actividades que únicamente estén planificadas.

### 2.3 Reproducibilidad

La generación de una versión deberá poder repetirse bajo condiciones controladas.

Cuando una diferencia de entorno pueda afectar al resultado, deberá quedar registrada.

### 2.4 Integridad

Los artefactos destinados a distribución deberán poder identificarse y verificarse posteriormente.

### 2.5 Separación de estados

Deberán distinguirse claramente:

```text
DESARROLLO
   ↓
VALIDACIÓN
   ↓
APROBACIÓN
   ↓
BUILD
   ↓
EMPAQUETADO
   ↓
RELEASE
   ↓
DISTRIBUCIÓN
```

Una etapa no deberá considerarse completada por haber ejecutado simplemente la etapa anterior.

---

## 3. Versionado

SCREEN by KLIK utilizará **Versionado Semántico (SemVer)** como esquema de identificación de versiones, sujeto a su adopción efectiva durante la implementación.

Formato principal:

```text
MAJOR.MINOR.PATCH
```

Ejemplo:

```text
1.0.0
```

Las versiones preliminares podrán utilizar identificadores como:

```text
1.0.0-alpha
1.0.0-beta
1.0.0-rc.1
```

La política exacta para incrementar `MAJOR`, `MINOR` y `PATCH` deberá mantenerse alineada con el historial real del proyecto.

**Estado:** `PLANNED`

---

## 4. Estados de una Versión

Una versión deberá atravesar estados claramente diferenciados:

```text
PLANNED
   ↓
DEVELOPMENT
   ↓
CANDIDATE
   ↓
VALIDATED
   ↓
APPROVED
   ↓
RELEASED
```

### PLANNED

La versión está prevista, pero no existe como artefacto liberable.

### DEVELOPMENT

La versión se encuentra en proceso de construcción.

### CANDIDATE

Existe un candidato identificable que puede someterse a validación.

### VALIDATED

El candidato ha superado las validaciones definidas para su alcance.

### APPROVED

La versión ha recibido autorización formal para ser publicada.

### RELEASED

Los artefactos correspondientes han sido publicados conforme al mecanismo oficial de distribución.

---

## 5. Pre-Release Checklist

Antes de iniciar una liberación deberán verificarse, como mínimo:

### 5.1 Estado del producto

- [ ] La versión objetivo está claramente identificada.
- [ ] Las funcionalidades incluidas están definidas.
- [ ] Los cambios incluidos están documentados.
- [ ] No existen cambios conocidos sin clasificar.
- [ ] Los elementos pendientes están identificados.

### 5.2 Validación funcional

- [ ] Las pruebas aplicables fueron ejecutadas.
- [ ] Los resultados fueron registrados.
- [ ] Las regresiones conocidas fueron evaluadas.
- [ ] Los flujos críticos fueron validados.
- [ ] Los errores críticos fueron resueltos o formalmente aceptados.

### 5.3 Seguridad

- [ ] Se ejecutaron las validaciones de seguridad aplicables.
- [ ] No existen vulnerabilidades críticas conocidas sin decisión explícita.
- [ ] Los secretos no forman parte de los artefactos.
- [ ] Los mecanismos de distribución fueron revisados.
- [ ] Los permisos y accesos relevantes fueron verificados.

### 5.4 Rendimiento

Cuando corresponda:

- [ ] Se ejecutaron las pruebas de rendimiento aplicables.
- [ ] Los resultados cumplen los criterios definidos.
- [ ] No existen regresiones relevantes conocidas.
- [ ] El comportamiento bajo carga fue evaluado.

### 5.5 Documentación

- [ ] `README.md` refleja el estado real.
- [ ] `CHANGELOG.md` está actualizado.
- [ ] La documentación de la versión corresponde al estado real.
- [ ] Las limitaciones conocidas están documentadas.
- [ ] Los cambios relevantes están registrados.

---

## 6. Preparación de la Versión

Una vez superadas las validaciones preliminares deberá prepararse formalmente la versión.

Esto incluye:

1. determinar el identificador de versión;
2. verificar los cambios incluidos;
3. actualizar la documentación correspondiente;
4. actualizar el historial del proyecto;
5. identificar los artefactos esperados;
6. registrar el entorno de construcción;
7. preparar la evidencia del proceso.

La actualización de la versión deberá realizarse únicamente en los lugares definidos por la arquitectura real del proyecto.

No deberán asumirse archivos, variables, scripts o mecanismos de versionado que todavía no existan.

---

## 7. CHANGELOG

El historial de cambios deberá actualizarse antes de la publicación.

La sección:

```text
[Unreleased]
```

deberá convertirse en una sección correspondiente a la versión cuando los cambios hayan sido efectivamente incluidos en ella.

El `CHANGELOG.md` deberá describir **lo que realmente cambió**, no lo que se esperaba cambiar.

No deberán incorporarse:

- funcionalidades inexistentes;
- resultados no obtenidos;
- pruebas no ejecutadas;
- certificaciones no concedidas;
- capacidades futuras presentadas como actuales.

**Documento relacionado:** `CHANGELOG.md`

---

## 8. Generación de Artefactos

Los artefactos de release deberán generarse a partir de una versión validada.

Dependiendo de la arquitectura de distribución finalmente aprobada, podrán existir diferentes tipos de artefactos, por ejemplo:

- ejecutable;
- paquete portable;
- instalador;
- archivos auxiliares;
- documentación;
- archivos de configuración de distribución.

Los formatos definitivos de distribución permanecen sujetos a definición.

**Estado:** `PLANNED`

---

## 9. Integridad de Artefactos

Cada artefacto destinado a distribución deberá poder identificarse de manera inequívoca.

Cuando corresponda, deberán registrarse:

- nombre;
- versión;
- plataforma;
- arquitectura;
- tamaño;
- fecha de generación;
- identificador de origen;
- hash de integridad;
- información de firma, si existe.

La firma digital podrá incorporarse como mecanismo de autenticidad e integridad cuando el modelo de distribución definitivo lo requiera.

No deberá considerarse obligatoria hasta que exista una política de firma aprobada.

---

## 10. Plataformas y Distribución

Las plataformas soportadas deberán estar definidas explícitamente antes de un release.

No se deberá asumir que una versión destinada a una plataforma es automáticamente compatible con otra.

Para cada plataforma deberán determinarse, cuando corresponda:

- sistema operativo;
- arquitectura;
- requisitos mínimos;
- dependencias;
- formato de distribución;
- procedimiento de instalación;
- procedimiento de actualización;
- mecanismo de verificación.

La plataforma inicial de distribución permanece:

**TBD**

---

## 11. Identificación y Trazabilidad

Una versión liberada deberá poder relacionarse con:

```text
VERSIÓN
   ↓
CAMBIOS
   ↓
FUENTE VALIDADA
   ↓
BUILD
   ↓
ARTEFACTOS
   ↓
EVIDENCIA
   ↓
RELEASE
```

La trazabilidad deberá permitir determinar qué versión produjo cada artefacto publicado.

El mecanismo técnico concreto para establecer esta relación deberá corresponder a la infraestructura de control de versiones finalmente adoptada.

---

## 12. Aprobación

Ningún artefacto deberá considerarse `RELEASED` únicamente por haber sido generado.

La aprobación deberá comprobar, como mínimo:

- versión correcta;
- validaciones completadas;
- documentación actualizada;
- integridad de artefactos;
- ausencia de bloqueadores conocidos;
- evidencia suficiente;
- cumplimiento de los criterios de release.

La aprobación deberá quedar registrada de forma trazable.

**Estado:** `PLANNED`

---

## 13. Publicación

Una vez aprobada la versión:

1. se prepararán los artefactos definitivos;
2. se verificará su integridad;
3. se publicarán mediante el mecanismo oficial definido;
4. se registrará la publicación;
5. se actualizará el estado de la versión a `RELEASED`.

El canal de distribución oficial permanece:

**TBD**

No se establece en este documento una plataforma externa específica como requisito arquitectónico.

---

## 14. Firma Digital

La firma digital podrá utilizarse para proporcionar autenticidad e integridad a los artefactos distribuidos.

Si se adopta, deberá definirse:

- autoridad responsable de la firma;
- tipo de certificado;
- custodia de claves;
- procedimiento de firma;
- validación de firma;
- renovación;
- revocación;
- procedimiento ante compromiso de claves.

Las claves privadas de firma nunca deberán formar parte del repositorio ni de los artefactos distribuidos.

**Estado:** `PLANNED / TBD`

---

## 15. Post-Release Verification

Después de la publicación deberá realizarse una verificación posterior.

Cuando corresponda, deberá comprobarse:

- disponibilidad de los artefactos;
- integridad;
- identificación correcta de la versión;
- instalación o ejecución;
- documentación publicada;
- consistencia entre versión publicada y versión aprobada.

Una publicación que falle alguna comprobación crítica deberá quedar registrada como incidente de release y no deberá considerarse completamente validada hasta resolver la discrepancia.

---

## 16. Rollback

El proceso de release deberá contemplar la posibilidad de retirar o sustituir una versión cuando se detecte un problema crítico.

El procedimiento deberá definir, según el mecanismo de distribución adoptado:

- identificación de la versión afectada;
- criterios para retirar una versión;
- disponibilidad de una versión anterior;
- sustitución del artefacto;
- comunicación del incidente;
- documentación de la corrección.

El mecanismo concreto de rollback permanece:

**TBD**

---

## 17. Release Fallido

Si una versión no cumple los criterios definidos, deberá permanecer fuera del estado `RELEASED`.

El proceso podrá regresar a:

```text
CANDIDATE
   ↓
DEVELOPMENT
```

o a cualquier estado anterior que corresponda.

No deberán utilizarse mecanismos de nomenclatura o documentación para presentar una versión fallida como liberada.

---

## 18. Relación con CHANGELOG y ROADMAP

Los documentos cumplen funciones diferentes:

### `ROADMAP.md`

Define planificación y evolución prevista.

### `CHANGELOG.md`

Registra cambios realizados.

### `RELEASE PROCESS`

Define cómo una versión pasa de estado validable a versión publicada.

Por tanto:

```text
ROADMAP
   ↓
DESARROLLO
   ↓
VALIDACIÓN
   ↓
CHANGELOG
   ↓
RELEASE PROCESS
   ↓
PUBLICACIÓN
```

Un elemento presente en `ROADMAP.md` no implica que forme parte de una versión liberada.

---

## 19. Checklist Final de Release

Antes de marcar una versión como `RELEASED`:

- [ ] Identificador de versión confirmado.
- [ ] Alcance de la versión confirmado.
- [ ] Validaciones completadas.
- [ ] Seguridad validada.
- [ ] Rendimiento validado cuando corresponda.
- [ ] Documentación actualizada.
- [ ] `CHANGELOG.md` actualizado.
- [ ] Artefactos generados.
- [ ] Artefactos verificados.
- [ ] Integridad registrada.
- [ ] Firma verificada cuando corresponda.
- [ ] Plataforma y arquitectura identificadas.
- [ ] Trazabilidad establecida.
- [ ] Aprobación registrada.
- [ ] Publicación ejecutada.
- [ ] Verificación post-release completada.
- [ ] Estado final registrado.

---

## 20. Estado Real de Implementación

**Estado actual:** `PLANNED`

### Justificación

SCREEN by KLIK se encuentra en fase de planificación y definición arquitectónica.

Actualmente no existe un producto funcional liberable ni un pipeline de distribución certificado.

Por lo tanto, no existen todavía:

- releases oficiales;
- artefactos de distribución certificados;
- instaladores oficiales;
- paquetes portables oficiales;
- canal oficial de distribución;
- política definitiva de firma digital;
- procedimiento operativo de rollback;
- plataforma de publicación oficialmente adoptada.

El proceso definido en este documento representa la **política prevista de release**, no evidencia de que dicho proceso ya haya sido ejecutado.

---

## 21. Evolución del Proceso

El proceso deberá evolucionar conforme avance el proyecto:

```text
PLANNED
   ↓
IMPLEMENTED
   ↓
VALIDATED
   ↓
OPERATIONAL
   ↓
CERTIFIED
```

Cada transición deberá estar respaldada por evidencia real.

---

## 22. Regla Suprema

> **Una versión no es un release porque tenga un número de versión. Es un release cuando existe un artefacto real, validado, trazable, aprobado y publicado mediante el mecanismo oficial del proyecto.**

La planificación define lo que se pretende hacer.

La implementación materializa el producto.

La validación demuestra que funciona conforme a los criterios establecidos.

La aprobación autoriza su publicación.

El release registra una versión real.

La documentación debe reflejar exactamente ese estado.