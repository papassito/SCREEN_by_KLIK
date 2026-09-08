# MANIFESTO — SCREEN by KLIK

## 1. Propósito

SCREEN by KLIK se desarrolla bajo una disciplina documental, arquitectónica y de ingeniería en la que cada decisión relevante debe ser trazable, verificable y auditable.

Este manifiesto establece los principios fundamentales que gobiernan el proyecto.

El manifiesto define **principios de gobierno**. No constituye por sí mismo una especificación funcional, técnica o de implementación.

No sustituye:

- `docs/requirements/REQUIREMENTS.md`
- `docs/architecture/ARCHITECTURE.md`
- `docs/development/MODULES.md`
- `docs/components/COMPONENTS.md`
- contratos técnicos;
- documentación de seguridad;
- documentación legal;
- documentación específica de cada fase.

Cuando un documento especializado defina un requisito, contrato o decisión concreta, dicho documento será la autoridad correspondiente conforme a la jerarquía documental establecida.

---

# 2. Principios Fundamentales

## 2.1 Documentation First

La documentación precede a la implementación.

Ninguna funcionalidad deberá comenzar su desarrollo sin que exista una definición suficiente de los elementos que correspondan a su naturaleza, incluyendo cuando sea aplicable:

- propósito;
- alcance;
- requisitos;
- responsabilidades;
- dependencias;
- contratos;
- criterios de aceptación;
- estrategia de pruebas;
- evidencia esperada.

La ausencia de información necesaria deberá declararse explícitamente como:

```text
TBD
MISSING
UNKNOWN
BLOCKED
```

No deberá completarse mediante suposiciones.

---

## 2.2 Single Source of Truth

Cada decisión deberá tener una autoridad documental identificable.

Un documento no deberá redefinir silenciosamente una decisión perteneciente a otro documento de mayor autoridad.

Cuando exista conflicto entre documentos, la discrepancia deberá resolverse documentalmente antes de utilizar cualquiera de las versiones como base de implementación.

La trazabilidad deberá permitir determinar:

```text
QUÉ SE DECIDIÓ
DÓNDE SE DECIDIÓ
QUIÉN ES LA AUTORIDAD
QUÉ DOCUMENTOS DEPENDEN DE ESA DECISIÓN
```

---

## 2.3 Contract Rule

El código implementa contratos.

El código no constituye por sí mismo la autoridad arquitectónica del proyecto.

La implementación no podrá modificar unilateralmente:

- requisitos;
- arquitectura;
- módulos;
- componentes;
- contratos;
- reglas de seguridad;
- políticas de datos;
- criterios de aceptación.

Cuando la implementación revele la necesidad de modificar una decisión documental, el cambio deberá regresar primero a la documentación correspondiente.

El flujo correcto será:

```text
DOCUMENTATION
      ↓
CONTRACT
      ↓
IMPLEMENTATION
```

No:

```text
IMPLEMENTATION
      ↓
REDEFINE CONTRACT
```

---

## 2.4 Traceability

Todo requisito relevante deberá poder rastrearse desde su origen hasta su evidencia final.

La trazabilidad conceptual seguirá:

```text
REQUIREMENT
      ↓
ARCHITECTURE
      ↓
MODULE
      ↓
COMPONENT
      ↓
TECHNICAL DOCUMENTATION
      ↓
PHASE
      ↓
IMPLEMENTATION
      ↓
TEST
      ↓
EVIDENCE
      ↓
VALIDATION
      ↓
CERTIFICATION
```

La matriz de trazabilidad es un instrumento derivado.

No podrá utilizarse para inventar requisitos, contratos, relaciones, implementaciones, pruebas o evidencias que no existan.

---

## 2.5 Modularidad

Cada fase deberá constituir una unidad documental y funcional claramente delimitada.

Una fase deberá poder:

- comprenderse;
- implementarse;
- probarse;
- validarse;
- documentarse;
- auditarse.

Sin embargo, una fase no deberá convertirse en una autoridad arquitectónica paralela.

Una fase podrá documentar cómo participa dentro del sistema, pero no podrá redefinir unilateralmente:

- la arquitectura global;
- los requisitos oficiales;
- los contratos;
- las responsabilidades de otros módulos;
- las políticas generales del proyecto.

---

## 2.6 Security by Design

La seguridad no será una característica añadida únicamente al final del desarrollo.

Los requisitos y consideraciones de seguridad deberán incorporarse, cuando correspondan, desde:

```text
REQUIREMENTS
      ↓
ARCHITECTURE
      ↓
DESIGN
      ↓
IMPLEMENTATION
      ↓
TESTING
      ↓
DEPLOYMENT
      ↓
OPERATION
      ↓
MAINTENANCE
```

Las medidas de seguridad deberán ser proporcionales al riesgo y verificables mediante evidencia cuando corresponda.

---

## 2.7 Privacy by Design

La privacidad deberá incorporarse desde el diseño.

Cuando corresponda, el proyecto deberá aplicar principios como:

- minimización de datos;
- limitación de finalidad;
- control de acceso;
- retención limitada;
- protección de información;
- trazabilidad;
- eliminación controlada.

Las capacidades de recopilación, procesamiento, almacenamiento y transmisión de datos deberán estar justificadas por una finalidad legítima del sistema.

No deberán recopilarse datos únicamente porque técnicamente sea posible hacerlo.

---

## 2.8 Evidence Before Certification

Ningún componente podrá considerarse certificado únicamente porque exista código.

La certificación requiere evidencia verificable.

El proyecto reconoce explícitamente:

```text
IMPLEMENTED
      ≠
TESTED
      ≠
VALIDATED
      ≠
CERTIFIED
```

La existencia de código no demuestra que:

- funcione correctamente;
- haya sido probado;
- cumpla los requisitos;
- haya sido validado;
- esté certificado.

Cada afirmación positiva deberá corresponder al nivel de evidencia apropiado.

---

## 2.9 Honest States

Los estados documentales deberán representar la realidad.

Entre los estados permitidos se encuentran:

```text
PLANNED
IN PROGRESS
IMPLEMENTED
NOT IMPLEMENTED
NOT EXECUTED
VALIDATED
NOT VALIDATED
CERTIFIED
NOT CERTIFIED
BLOCKED
DEPRECATED
```

También podrán utilizarse estados adicionales cuando sean necesarios para representar con precisión una condición real.

No deberá utilizarse un estado positivo cuando la evidencia correspondiente no exista.

En particular:

```text
PLANNED ≠ IMPLEMENTED
IMPLEMENTED ≠ TESTED
TESTED ≠ VALIDATED
VALIDATED ≠ CERTIFIED
```

---

## 2.10 Zero Simulation

SCREEN by KLIK no declarará como existente aquello que únicamente haya sido diseñado, propuesto o planificado.

No se considerará implementado:

- un módulo solamente documentado;
- una prueba solamente definida;
- una integración solamente planeada;
- una interfaz solamente propuesta;
- una certificación sin evidencia;
- una capacidad descrita pero no implementada;
- un resultado no ejecutado.

Los resultados hipotéticos, simulados o asumidos no deberán presentarse como evidencia real.

---

# 3. Principio de No Invención

Cuando una información necesaria no pueda verificarse, deberá declararse como tal.

Son estados válidos, según el contexto:

```text
TBD
MISSING
UNKNOWN
NOT VERIFIED
NOT AVAILABLE
BLOCKED
```

No deberá inventarse:

- un requisito;
- un identificador;
- una relación de trazabilidad;
- una API;
- una ruta;
- una función;
- un componente;
- una prueba;
- un resultado;
- una evidencia;
- una certificación.

La ausencia de información deberá permanecer visible hasta que pueda resolverse mediante una fuente autorizada.

---

# 4. Cambios Controlados

Toda modificación que afecte una decisión estructural deberá reflejarse en la documentación correspondiente.

Cuando un cambio afecte múltiples niveles, deberá evaluarse toda la cadena afectada:

```text
REQUIREMENTS
      ↓
ARCHITECTURE
      ↓
MODULES
      ↓
COMPONENTS
      ↓
TECHNICAL DOCUMENTATION
      ↓
PHASES
```

La actualización deberá realizarse en los documentos que sean realmente afectados.

No deberá modificarse documentación no relacionada únicamente para mantener una apariencia de sincronización.

---

# 5. Relación con la Implementación

La implementación deberá seguir el siguiente principio:

```text
DOCUMENTED
      ↓
APPROVED
      ↓
IMPLEMENTED
      ↓
TESTED
      ↓
EVIDENCED
      ↓
VALIDATED
      ↓
CERTIFIED
```

La existencia de una definición documental no significa automáticamente que exista aprobación, implementación o validación.

Nunca deberá utilizarse como proceso normal:

```text
CODE
  ↓
"DOCUMENTAMOS DESPUÉS"
```

Cuando una implementación descubra una necesidad de cambio, deberá activarse el proceso documental correspondiente antes de convertir dicho cambio en una nueva decisión del sistema.

---

# 6. Principio de Integridad

La documentación, arquitectura, código, pruebas y evidencia deberán representar el mismo sistema.

Si existe una discrepancia:

```text
DOCUMENTATION ≠ CODE
```

o:

```text
REQUIREMENTS ≠ IMPLEMENTATION
```

el sistema se considera inconsistente hasta que la discrepancia sea analizada y resuelta.

La resolución podrá implicar:

- corrección del código;
- corrección documental;
- actualización de requisitos;
- modificación arquitectónica;
- creación de una decisión técnica;
- declaración explícita de una incompatibilidad.

La discrepancia no deberá ocultarse.

---

# 7. Principio de Evolución

SCREEN by KLIK podrá evolucionar.

La evolución deberá ser:

- explícita;
- documentada;
- trazable;
- verificable;
- controlada;
- reversible cuando sea técnicamente posible.

La evolución no deberá destruir la trazabilidad histórica.

Los cambios históricos no deberán reinterpretarse artificialmente para hacer parecer que una decisión posterior existía desde el inicio.

---

# 8. Integridad Histórica

La documentación deberá preservar la diferencia entre:

```text
ESTADO ORIGINAL
      ↓
CAMBIO
      ↓
ESTADO POSTERIOR
```

Una nueva decisión no deberá presentarse como si hubiese sido parte de la línea base original cuando no existe evidencia de ello.

Los documentos históricos deberán distinguir entre:

- lo que existía;
- lo que fue modificado;
- lo que fue eliminado;
- lo que fue corregido;
- lo que fue creado posteriormente.

El `CHANGELOG.md` deberá registrar esta evolución de forma verificable.

---

# 9. Gobierno de Fases

Las fases existen para organizar la evolución del producto.

Una fase deberá:

- tener un propósito definido;
- establecer su alcance;
- identificar dependencias;
- definir criterios de entrada;
- definir criterios de salida;
- mantener su estado real;
- documentar sus riesgos;
- mantener su trazabilidad.

Una fase no deberá declarar como implementado aquello que no exista.

Una fase tampoco deberá convertirse en una fuente alternativa de requisitos oficiales.

Los requisitos oficiales deberán mantenerse en la documentación de requisitos correspondiente.

---

# 10. Separación de Responsabilidades

El proyecto deberá mantener separación entre:

```text
REQUIREMENTS
ARCHITECTURE
COMPONENTS
MODULES
TECHNICAL DOCUMENTATION
PHASES
IMPLEMENTATION
TESTS
EVIDENCE
VALIDATION
CERTIFICATION
```

Cada nivel tiene una función distinta.

Ningún nivel deberá absorber silenciosamente las responsabilidades de otro.

---

# 11. Documentación como Sistema de Control

La documentación no constituye únicamente material explicativo.

También funciona como mecanismo de:

- control;
- trazabilidad;
- auditoría;
- coordinación;
- prevención de contradicciones;
- gestión de cambios;
- control de alcance.

Por ello, la documentación deberá permanecer sincronizada con la realidad del proyecto.

Documentación obsoleta que contradiga el sistema deberá tratarse como una inconsistencia.

---

# 12. Auditoría

El proyecto deberá poder someterse a auditoría documental y técnica.

Una auditoría deberá poder determinar:

```text
QUÉ EXISTE
QUÉ NO EXISTE
QUÉ ESTÁ PLANEADO
QUÉ ESTÁ IMPLEMENTADO
QUÉ FUE PROBADO
QUÉ FUE VALIDADO
QUÉ FUE CERTIFICADO
QUÉ EVIDENCIA LO DEMUESTRA
```

La auditoría deberá distinguir claramente entre hechos y afirmaciones.

---

# 13. Criterio de Evidencia

La evidencia deberá ser:

- real;
- verificable;
- reproducible cuando corresponda;
- relacionada con el elemento que pretende demostrar;
- suficientemente específica;
- trazable.

No deberá utilizarse una evidencia para demostrar una condición distinta de aquella que realmente verifica.

Por ejemplo:

```text
BUILD SUCCESS
```

no demuestra automáticamente:

```text
FUNCTIONAL CORRECTNESS
```

Del mismo modo:

```text
TEST PASSED
```

no implica automáticamente:

```text
CERTIFIED
```

---

# 14. Criterio de Validación

La validación deberá determinar si el sistema o componente satisface las condiciones que le corresponden.

La validación deberá basarse en:

- requisitos;
- criterios de aceptación;
- pruebas;
- evidencia;
- condiciones de entorno;
- alcance definido.

No deberá declararse validación únicamente porque la implementación compile o porque exista una prueba aislada.

---

# 15. Criterio de Certificación

La certificación representa un estado superior a la simple implementación o ejecución de pruebas.

No deberá declararse certificación sin que exista:

- evidencia suficiente;
- pruebas correspondientes;
- validación;
- cumplimiento de los criterios aplicables;
- registro verificable del resultado.

La palabra `CERTIFIED` deberá utilizarse únicamente cuando el proceso correspondiente haya sido completado.

---

# 16. Control de Alcance

El proyecto deberá evitar la expansión silenciosa del alcance.

Una funcionalidad nueva deberá clasificarse adecuadamente como:

```text
REQUIRED
PLANNED
PROPOSED
OPTIONAL
OUT OF SCOPE
```

según corresponda a la autoridad documental aplicable.

Una idea o propuesta no deberá convertirse automáticamente en requisito.

---

# 17. Dependencias

Las dependencias entre fases, módulos y componentes deberán documentarse cuando sean relevantes para la ejecución del proyecto.

Una fase bloqueada por una dependencia deberá declararse:

```text
BLOCKED
```

y deberá identificar, cuando sea posible:

- dependencia;
- motivo;
- autoridad responsable;
- condición necesaria para desbloqueo.

No deberá ocultarse una dependencia para permitir que una fase parezca lista para implementación.

---

# 18. Cambios de Contrato

Los cambios en contratos deberán tratarse como cambios controlados.

Un cambio de contrato podrá afectar:

```text
REQUIREMENTS
ARCHITECTURE
MODULES
COMPONENTS
IMPLEMENTATION
TESTS
TRACEABILITY
```

Por ello, antes de implementarlo deberá evaluarse su impacto.

La implementación no deberá cambiar un contrato de manera silenciosa.

---

# 19. Seguridad, Privacidad y Legalidad

La seguridad, privacidad y cumplimiento legal deberán considerarse responsabilidades transversales.

No deberán tratarse como elementos puramente decorativos de la documentación.

Cuando una funcionalidad afecte:

- datos personales;
- seguridad;
- permisos;
- almacenamiento;
- transmisión;
- retención;
- eliminación;
- acceso;
- auditoría;

deberá evaluarse la documentación correspondiente.

Las políticas legales y de privacidad no deberán ser sustituidas por declaraciones contenidas únicamente en documentos técnicos.

---

# 20. Principio de Mínimo Alcance

Toda capacidad del sistema deberá operar dentro del alcance necesario para cumplir su propósito.

El proyecto deberá evitar:

- recopilación innecesaria;
- permisos innecesarios;
- dependencias innecesarias;
- exposición innecesaria;
- complejidad innecesaria;
- captura de información no requerida.

La simplicidad no deberá utilizarse como justificación para omitir controles necesarios.

---

# 21. Principio de Reproducibilidad

Cuando una validación o prueba requiera ser reproducida, deberán existir condiciones suficientes para permitir su repetición.

Cuando corresponda deberán registrarse:

- entorno;
- versión;
- configuración relevante;
- procedimiento;
- resultado;
- evidencia.

Una afirmación que no pueda reproducirse o verificarse deberá identificarse como tal.

---

# 22. Principio de No Ocultamiento

Los errores y estados negativos forman parte de la historia real del proyecto.

No deberán ocultarse:

- errores;
- pruebas fallidas;
- requisitos incumplidos;
- dependencias;
- bloqueos;
- conflictos;
- limitaciones;
- decisiones revertidas.

Un estado negativo correctamente documentado es preferible a una afirmación positiva sin evidencia.

---

# 23. Jerarquía Documental

La jerarquía conceptual del proyecto es:

```text
MANIFESTO
      ↓
REQUIREMENTS
      ↓
ARCHITECTURE
      ↓
MODULES
      ↓
COMPONENTS
      ↓
TECHNICAL DOCUMENTATION
      ↓
PHASES
      ↓
IMPLEMENTATION
      ↓
TESTS
      ↓
EVIDENCE
      ↓
VALIDATION
      ↓
CERTIFICATION
```

Esta jerarquía representa el flujo de gobierno y trazabilidad.

No significa que todos los documentos tengan autoridad sobre todos los demás.

Cada documento mantiene la autoridad correspondiente a su ámbito.

---

# 24. Autoridad Documental

El `MANIFESTO.md` establece principios.

El `REQUIREMENTS.md` establece los requisitos oficiales.

La documentación arquitectónica establece las decisiones arquitectónicas que le corresponden.

La documentación de componentes y módulos define sus respectivos ámbitos.

Los contratos técnicos establecen las interfaces y obligaciones contractuales correspondientes.

Las fases organizan la ejecución y evolución de capacidades.

La implementación materializa los contratos.

Las pruebas generan resultados.

La evidencia demuestra resultados.

La validación determina cumplimiento.

La certificación representa el estado final conforme al proceso aplicable.

Por tanto:

```text
MANIFESTO ≠ REQUIREMENTS
REQUIREMENTS ≠ ARCHITECTURE
ARCHITECTURE ≠ IMPLEMENTATION
IMPLEMENTATION ≠ EVIDENCE
EVIDENCE ≠ CERTIFICATION
```

---

# 25. Regla de Resolución de Conflictos

Cuando dos documentos presenten información incompatible:

1. deberá identificarse la contradicción;
2. deberá determinarse la autoridad documental aplicable;
3. deberá registrarse la discrepancia;
4. deberá corregirse la documentación correspondiente;
5. deberá evaluarse el impacto;
6. deberá actualizarse la trazabilidad cuando corresponda;
7. solo después deberá continuarse con la implementación afectada.

No deberá resolverse una contradicción simplemente eligiendo la opción que resulte más conveniente para implementar.

---

# 26. Regla de Cambio Mínimo

Cuando una corrección documental o técnica sea necesaria, deberá modificarse únicamente lo necesario para resolver el problema.

No deberá utilizarse una corrección como oportunidad para introducir cambios no relacionados.

Los cambios no relacionados deberán gestionarse separadamente.

---

# 27. Regla de Consistencia

Al finalizar una modificación relevante, deberá poder afirmarse que:

```text
DOCUMENTATION
      ↕
REQUIREMENTS
      ↕
ARCHITECTURE
      ↕
IMPLEMENTATION
      ↕
TESTS
      ↕
EVIDENCE
```

representan el mismo estado del sistema dentro del alcance correspondiente.

Cuando esto no sea cierto, la inconsistencia deberá permanecer visible hasta su resolución.

---

# 28. Regla de Cierre Documental

Antes de autorizar la implementación deberá existir una revisión documental suficiente para determinar:

- estructura documental;
- requisitos;
- arquitectura;
- módulos;
- componentes;
- fases;
- contratos;
- trazabilidad;
- políticas aplicables;
- criterios de prueba;
- criterios de validación.

La declaración de:

```text
DOCUMENTATION READY
```

deberá utilizarse únicamente cuando el proceso de cierre documental correspondiente haya sido completado.

Posteriormente podrá emitirse:

```text
READY FOR CODE
```

únicamente cuando las condiciones de autorización para implementación hayan sido satisfechas.

---

# 29. Relación con el CHANGELOG

Toda modificación relevante deberá registrarse en:

```text
CHANGELOG.md
```

El `CHANGELOG` deberá representar la realidad histórica del proyecto.

No deberá utilizarse para registrar como realizados:

- planes futuros;
- propuestas;
- ideas;
- resultados simulados;
- implementaciones inexistentes;
- pruebas no ejecutadas;
- validaciones no realizadas;
- certificaciones inexistentes.

Principio:

```text
CHANGELOG = HISTORICAL REALITY
```

---

# 30. Principio Fundamental de Estado

SCREEN by KLIK reconoce que:

```text
PROPUESTA
    ≠
IMPLEMENTACIÓN
    ≠
TEST
    ≠
EVIDENCIA
    ≠
VALIDACIÓN
    ≠
CERTIFICACIÓN
    ≠
PUBLICACIÓN
```

Cada estado deberá registrarse independientemente.

Ningún estado superior deberá inferirse automáticamente a partir de un estado inferior.

---

# 31. Estado del Manifiesto

```text
STATUS: ACTIVE
IMPLEMENTATION: NOT APPLICABLE
TESTING: NOT APPLICABLE
VALIDATION: NOT APPLICABLE
CERTIFICATION: NOT APPLICABLE
```

El manifiesto es un documento de gobierno y principios.

No representa una funcionalidad implementable ni una fase del producto.

---

# 32. Declaración Final

SCREEN by KLIK será desarrollado bajo una regla fundamental:

> **La realidad del sistema deberá ser siempre superior a la apariencia de la documentación.**

La documentación deberá describir la realidad.

Los contratos deberán gobernar la implementación.

La implementación deberá producir evidencia.

Las pruebas deberán producir resultados verificables.

La validación deberá determinar el cumplimiento.

La certificación deberá basarse en evidencia.

Y cuando algo no exista, no esté probado, no esté validado o no pueda demostrarse, deberá declararse exactamente como tal.

```text
DOCUMENTAR
    ↓
DEFINIR
    ↓
CONTRATAR
    ↓
IMPLEMENTAR
    ↓
PROBAR
    ↓
EVIDENCIAR
    ↓
VALIDAR
    ↓
CERTIFICAR
```

**Sin atajos documentales.  
Sin estados inventados.  
Sin evidencia simulada.  
Sin contratos redefinidos por código.**