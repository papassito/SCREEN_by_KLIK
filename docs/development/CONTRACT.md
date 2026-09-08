# SCREEN by KLIK
# MASTER CONTRACT

**Documento:** `CONTRACT.md`  
**Nivel:** Maestro / Raíz  
**Estado:** AUTHORITATIVE  
**Proyecto:** SCREEN by KLIK

---

## 1. PROPÓSITO

Este documento constituye el **contrato maestro** de SCREEN by KLIK.

Define las reglas arquitectónicas, documentales, técnicas y de integración que deben respetar todas las fases del proyecto.

Ningún documento perteneciente a una fase puede contradecir, sustituir o redefinir las reglas establecidas aquí.

---

## 2. JERARQUÍA DOCUMENTAL

La autoridad documental se establece en el siguiente orden:

1. `CONTRACT.md`
2. `PHASE-00-CONTRACT.md`
3. Contratos específicos de cada fase
4. `REQUIREMENTS.md` de cada fase
5. `README.md` de cada fase
6. Documentación técnica
7. Código fuente
8. Tests y artefactos generados

Cuando exista una contradicción entre documentos, prevalece el documento de mayor nivel.

---

## 3. PRINCIPIO FUNDAMENTAL

SCREEN by KLIK se desarrolla como un sistema modular por fases.

Cada fase:

- tiene un propósito definido;
- posee límites explícitos;
- tiene responsabilidades propias;
- declara sus dependencias;
- expone únicamente las interfaces necesarias;
- mantiene su propia documentación;
- debe ser verificable independientemente.

Una fase **no puede convertirse en autoridad arquitectónica paralela**.

---

## 4. SEPARACIÓN DE RESPONSABILIDADES

Cada componente debe tener una responsabilidad única y claramente delimitada.

No se permite:

- duplicar responsabilidades entre fases;
- acceder directamente a internals de otra fase;
- crear dependencias ocultas;
- utilizar estructuras privadas como APIs accidentales;
- trasladar responsabilidades de una fase a otra sin modificar formalmente el contrato.

---

## 5. CONTRATOS

Todo comportamiento que sea consumido por otro componente debe estar definido mediante un contrato explícito.

Un contrato puede definir:

- entradas;
- salidas;
- estados;
- errores;
- eventos;
- invariantes;
- restricciones;
- seguridad;
- compatibilidad;
- condiciones de aceptación.

La implementación no constituye por sí misma un contrato.

---

## 6. ESTABILIDAD DE INTERFACES

Las interfaces públicas deben considerarse estables salvo modificación formal.

Un cambio que afecte:

- nombres;
- tipos;
- parámetros;
- respuestas;
- eventos;
- estados;
- errores;
- comportamiento observable

debe ser evaluado como posible cambio contractual.

Los cambios incompatibles requieren actualización de documentación, dependencias y pruebas afectadas.

---

## 7. DEPENDENCIAS

Toda dependencia entre fases debe ser:

- explícita;
- necesaria;
- documentada;
- verificable.

Una fase no puede depender de detalles internos de otra fase.

Cuando una dependencia sea necesaria, debe consumirse mediante la interfaz definida por el propietario de dicha funcionalidad.

---

## 8. DATOS

La propiedad de cada dato debe ser determinable.

Los componentes deben conocer:

- quién crea el dato;
- quién puede modificarlo;
- quién puede consumirlo;
- cuánto tiempo existe;
- cuál es su formato;
- qué ocurre cuando es inválido.

Los formatos de intercambio deben ser deterministas siempre que sea posible.

---

## 9. SEGURIDAD

La seguridad es transversal a todo el proyecto.

Toda implementación debe aplicar, como mínimo:

- validación de entradas;
- mínimo privilegio;
- separación de privilegios;
- límites de confianza explícitos;
- manejo seguro de errores;
- protección contra estados inconsistentes;
- no exposición innecesaria de información sensible.

Los secretos no deben almacenarse en código ni documentación.

---

## 10. LOGGING Y AUDITORÍA

Las operaciones relevantes deben poder diagnosticarse.

Cuando corresponda, deben registrarse:

- operación;
- componente;
- timestamp;
- resultado;
- error;
- identificador de correlación.

Los logs no deben contener secretos ni información sensible innecesaria.

---

## 11. CONCURRENCIA

Todo componente que mantenga estado compartido debe definir explícitamente su modelo de concurrencia.

Debe evitarse:

- race conditions;
- doble ejecución accidental;
- acceso a recursos liberados;
- estados parcialmente actualizados;
- deadlocks;
- condiciones de shutdown inconsistentes.

---

## 12. MANEJO DE ERRORES

Los errores deben tratarse como parte del contrato.

No se permite ocultar errores relevantes mediante:

- silenciamiento;
- valores por defecto peligrosos;
- recuperación arbitraria;
- estados ambiguos.

Los errores deben proporcionar suficiente información para diagnóstico sin revelar información sensible.

---

## 13. TESTING

Una fase no se considera terminada únicamente porque compile.

Debe existir evidencia de:

- comportamiento correcto;
- comportamiento inválido;
- límites;
- errores;
- recuperación;
- integración;
- seguridad cuando corresponda.

La prueba debe verificar el contrato y no solamente la implementación interna.

---

## 14. TRAZABILIDAD

Los requisitos importantes deben poder relacionarse mediante:

`Requirement → Contract → Implementation → Test → Acceptance`

Un requisito sin evidencia de implementación o prueba no debe considerarse completamente verificado.

---

## 15. DOCUMENTACIÓN DE FASE

Toda fase funcional debe poseer, como mínimo:

```text
README.md
REQUIREMENTS.md
```

Cuando la fase requiera contratos específicos, deberá disponer también de la documentación contractual correspondiente.

La documentación de una fase explica y especifica su dominio.

No redefine la arquitectura global.

---

## 16. CRITERIO DE IMPLEMENTACIÓN

Una fase puede comenzar a programarse cuando:

- su alcance está definido;
- sus responsabilidades están definidas;
- sus dependencias están identificadas;
- sus interfaces están definidas;
- sus requisitos están documentados;
- sus criterios de aceptación están definidos;
- no existen contradicciones contractuales abiertas que impidan su implementación.

---

## 17. CRITERIO DE FINALIZACIÓN

Una fase solamente puede declararse terminada cuando:

- implementación completa;
- compilación correcta;
- tests correspondientes;
- validación contractual;
- documentación actualizada;
- criterios de aceptación satisfechos.

---

## 18. CAMBIOS CONTRACTUALES

Modificar este documento constituye un cambio arquitectónico.

Todo cambio debe identificar:

1. motivo;
2. regla afectada;
3. fases afectadas;
4. dependencias afectadas;
5. documentación que debe actualizarse;
6. pruebas que deben modificarse.

---

## 19. REGLA DE PRECEDENCIA

En caso de conflicto:

**CONTRACT.md prevalece sobre cualquier documento de fase.**

Una fase no puede modificar unilateralmente una regla establecida aquí.

---

## 20. ESTADO

Este documento es parte del contrato oficial de SCREEN by KLIK.

**AUTHORITATIVE — MUST BE RESPECTED BY ALL PHASES.**