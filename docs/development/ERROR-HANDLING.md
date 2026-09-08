# SCREEN by KLIK — Error Handling

## 1. Propósito

Este documento define la estrategia de manejo de errores de **SCREEN by KLIK**.

Su objetivo es establecer cómo deberán detectarse, clasificarse, propagarse, registrarse, recuperarse y comunicarse los errores que puedan producirse durante la ejecución del sistema.

La estrategia deberá garantizar:

- comportamiento predecible;
- propagación explícita;
- diagnóstico suficiente;
- recuperación controlada;
- terminación segura;
- trazabilidad;
- protección de recursos;
- comunicación clara del estado al usuario.

**Estado general: `PLANNED`**

---

# 2. Principios fundamentales

## 2.1 Propagación explícita

Los errores deberán tratarse explícitamente.

No deberán ignorarse errores relevantes.

Una operación deberá informar de forma clara si:

```text
SUCCESS
FAILURE
CANCELLED
TIMEOUT
PARTIAL
```

cuando dichos estados sean aplicables.

Las excepciones a la propagación deberán estar justificadas por la naturaleza de la operación y no utilizarse para ocultar fallos.

**Estado: `PLANNED`**

---

## 2.2 Contexto suficiente

Cuando un error atraviese varias capas del sistema, deberá conservarse suficiente contexto para determinar:

- qué operación falló;
- dónde ocurrió;
- qué recurso estaba involucrado;
- cuál fue la causa conocida;
- qué componente resultó afectado;
- si existe posibilidad de recuperación.

El contexto agregado no deberá destruir la causa original.

Cuando la implementación utilice Go, podrá utilizar los mecanismos estándar del lenguaje para conservar la cadena causal de errores.

**Estado: `PLANNED`**

---

## 2.3 No utilizar errores como control normal de flujo

Los errores deberán representar condiciones anómalas o resultados que requieren tratamiento.

No deberán utilizarse mecanismos de error para ocultar estados normales de funcionamiento.

Cuando una condición sea un resultado esperado del sistema, deberá modelarse como tal en el contrato correspondiente.

**Estado: `PLANNED`**

---

# 3. Uso de `panic`

`panic` no deberá utilizarse como mecanismo normal para manejar errores operacionales.

No deberá utilizarse para situaciones como:

- archivo inexistente;
- dispositivo no disponible;
- permisos insuficientes;
- almacenamiento lleno;
- cámara desconectada;
- captura no disponible;
- configuración inválida;
- interrupción del usuario;
- timeout;
- dependencia temporalmente no disponible.

Las condiciones verdaderamente irreversibles deberán ser tratadas de acuerdo con la arquitectura y con una estrategia de terminación segura.

El uso de `panic` deberá considerarse excepcional y justificable.

**Estado: `PLANNED`**

---

# 4. Clasificación de errores

SCREEN by KLIK deberá utilizar una clasificación coherente de errores.

Como mínimo se contemplan las siguientes categorías:

```text
OPERATIONAL
CONFIGURATION
RESOURCE
DEPENDENCY
SECURITY
CANCELLATION
TIMEOUT
INTERNAL
FATAL
```

La clasificación definitiva podrá ampliarse durante la implementación cuando exista una necesidad demostrable.

---

# 5. Errores operacionales

Son errores producidos durante operaciones normales del sistema.

Ejemplos:

- archivo no disponible;
- dispositivo desconectado;
- fallo de captura;
- fallo temporal de escritura;
- recurso ocupado;
- formato no compatible.

Deberán tratarse según el contexto de la operación.

**Estado: `PLANNED`**

---

# 6. Errores de configuración

Son condiciones producidas por una configuración inválida, incompleta o incompatible.

Ejemplos:

- parámetros inválidos;
- ruta inexistente;
- configuración incompatible;
- recurso requerido no configurado;
- formato de configuración incorrecto.

Cuando una configuración sea indispensable para iniciar una capacidad crítica, el sistema deberá impedir que dicha capacidad se presente como disponible.

**Estado: `PLANNED`**

---

# 7. Errores de recursos

Incluyen fallos relacionados con recursos necesarios para ejecutar una operación.

Ejemplos:

- almacenamiento insuficiente;
- memoria insuficiente;
- dispositivo ocupado;
- recurso no disponible;
- imposibilidad de crear un recurso;
- imposibilidad de liberar correctamente un recurso.

Los errores de recursos críticos deberán provocar una respuesta segura y proporcional al impacto real.

**Estado: `PLANNED`**

---

# 8. Errores de dependencias

Una dependencia externa o interna puede encontrarse:

```text
AVAILABLE
UNAVAILABLE
DEGRADED
FAILED
DISCONNECTED
```

Una dependencia no disponible no deberá interpretarse automáticamente como un fallo total del sistema.

Deberá determinarse si la dependencia afecta:

- una capacidad crítica;
- una capacidad opcional;
- una capacidad secundaria.

La respuesta deberá corresponder al impacto real.

**Estado: `PLANNED`**

---

# 9. Errores de seguridad

Los errores relacionados con seguridad deberán tratarse con especial precaución.

Ejemplos:

- autorización insuficiente;
- autenticación inválida;
- acceso no permitido;
- recurso protegido;
- credencial inválida;
- violación de una política de seguridad.

El sistema deberá adoptar un comportamiento seguro ante estos estados.

No deberá revelar información sensible innecesaria en mensajes dirigidos al usuario.

**Estado: `PLANNED`**

---

# 10. Cancelación

La cancelación solicitada por el usuario o por el sistema deberá diferenciarse de un fallo.

Conceptualmente:

```text
CANCELLED ≠ FAILED
```

Una operación cancelada correctamente no deberá registrarse como un error de sistema.

La cancelación deberá permitir:

- detener la operación;
- liberar recursos;
- cerrar correctamente componentes;
- conservar la integridad del resultado;
- comunicar el estado final.

**Estado: `PLANNED`**

---

# 11. Timeouts

Las operaciones potencialmente bloqueantes o de duración indefinida deberán contar con límites temporales cuando la arquitectura lo requiera.

Un timeout deberá identificarse explícitamente:

```text
TIMEOUT
```

y no confundirse automáticamente con:

```text
FAILED
```

El comportamiento posterior dependerá de la naturaleza de la operación.

Podrá contemplar:

- reintento;
- degradación;
- cancelación;
- interrupción de la operación;
- notificación;
- escalamiento.

Los límites temporales concretos deberán definirse durante la implementación.

**Estado: `PLANNED`**

---

# 12. Operaciones recuperables

Una operación podrá continuar después de un error únicamente cuando exista una política explícita que determine que la recuperación es segura.

Ejemplos potenciales:

- fallo de una cámara opcional;
- pérdida temporal de una fuente secundaria;
- fallo de una operación no crítica;
- dependencia auxiliar no disponible.

El sistema no deberá continuar silenciosamente cuando la integridad de la grabación principal esté comprometida.

**Estado: `PLANNED`**

---

# 13. Operaciones fatales

Un error será considerado fatal cuando continuar la operación pueda:

- producir un resultado inválido;
- perder datos;
- corromper el resultado;
- comprometer la integridad de la sesión;
- generar un estado inconsistente;
- provocar un comportamiento inseguro.

Ejemplos potenciales:

- imposibilidad crítica de almacenar la grabación;
- fallo irreversible de una capacidad esencial;
- corrupción detectada en un recurso indispensable.

Ante un error fatal, la sesión deberá finalizar de manera controlada.

Conceptualmente:

```text
CRITICAL ERROR
      ↓
STOP SAFELY
      ↓
RELEASE RESOURCES
      ↓
PRESERVE EVIDENCE
      ↓
REPORT STATE
```

**Estado: `PLANNED`**

---

# 14. Error recuperable vs error fatal

La clasificación deberá depender del impacto real sobre la operación.

```text
ERROR
  │
  ├── RECOVERABLE
  │      ↓
  │   CONTINUE / RETRY / DEGRADE
  │
  └── FATAL
         ↓
      STOP SAFELY
```

No deberá declararse una condición como recuperable únicamente para evitar detener el proceso.

La prioridad será preservar la integridad de la operación.

---

# 15. Cancelación y operaciones de larga duración

Las operaciones prolongadas o potencialmente bloqueantes deberán disponer de un mecanismo de cancelación apropiado.

Cuando la implementación utilice Go, `context.Context` podrá emplearse como mecanismo estándar para:

- cancelación;
- deadlines;
- propagación de señales de terminación.

El uso concreto y obligatorio de `context.Context` deberá definirse de acuerdo con la arquitectura de cada componente.

**Estado: `PLANNED`**

---

# 16. Cadena causal

Cuando exista una causa original identificable, ésta deberá conservarse durante la propagación del error.

Conceptualmente:

```text
ORIGINAL ERROR
      ↓
COMPONENT CONTEXT
      ↓
OPERATION CONTEXT
      ↓
HIGHER LAYER
      ↓
USER / AUDIT
```

El sistema no deberá sustituir una causa conocida por un mensaje genérico que impida el diagnóstico.

---

# 17. Identificación de errores

Cuando la implementación necesite distinguir categorías o causas específicas, deberá utilizar mecanismos consistentes con el lenguaje y la arquitectura.

En Go podrán utilizarse mecanismos estándar como:

```text
errors.Is()
errors.As()
```

cuando sean apropiados.

No deberá dependerse exclusivamente de comparar textos de mensajes para determinar la naturaleza de un error.

**Estado: `PLANNED`**

---

# 18. Reintentos

Los reintentos no deberán aplicarse automáticamente a todos los errores.

Antes de reintentar deberá determinarse:

- si la operación es idempotente;
- si el error puede ser temporal;
- cuántos intentos son razonables;
- cuánto tiempo debe transcurrir;
- qué ocurre después del último intento.

Un reintento no deberá convertir un fallo controlable en una repetición infinita.

**Estado: `PLANNED`**

---

# 19. Registro y auditoría

Los errores relevantes deberán poder registrarse con suficiente información para facilitar:

- diagnóstico;
- trazabilidad;
- análisis de regresión;
- auditoría;
- soporte;
- identificación de patrones.

Los registros no deberán contener secretos ni información sensible innecesaria.

Cuando corresponda, deberá conservarse:

```text
TIMESTAMP
COMPONENT
OPERATION
ERROR CLASS
ERROR
CONTEXT
SEVERITY
RESULT
```

La estructura definitiva del registro será definida por la arquitectura y los contratos correspondientes.

**Estado: `PLANNED`**

---

# 20. Comunicación al usuario

El usuario deberá recibir información suficiente para comprender el estado de la operación.

Los mensajes deberán ser:

- claros;
- útiles;
- proporcionales;
- accionables cuando corresponda.

No deberán exponerse detalles internos innecesarios que puedan comprometer seguridad o dificultar la comprensión.

Debe distinguirse entre:

```text
ERROR TÉCNICO
```

y:

```text
MENSAJE DE USUARIO
```

El mensaje técnico puede contener información adicional que no deba mostrarse directamente al usuario.

---

# 21. Integridad de la grabación

Los errores ocurridos durante una sesión deberán evaluarse respecto de la integridad del resultado.

Una sesión parcialmente completada no deberá presentarse automáticamente como completa.

Cuando corresponda, el resultado deberá identificarse como:

```text
COMPLETE
PARTIAL
FAILED
CANCELLED
```

La clasificación definitiva deberá formar parte del contrato de la sesión de grabación.

**Estado: `PLANNED`**

---

# 22. Liberación de recursos

Ante cualquier salida normal, cancelación o error, deberán liberarse los recursos adquiridos por la operación.

Esto incluye, cuando corresponda:

- dispositivos;
- archivos;
- memoria;
- buffers;
- procesos;
- conexiones;
- sesiones;
- recursos de captura;
- recursos de codificación.

El manejo de errores no deberá provocar fugas de recursos.

**Estado: `PLANNED`**

---

# 23. Fallo seguro

Cuando el sistema no pueda continuar de manera confiable, deberá adoptar el estado seguro correspondiente.

```text
NO CONFIDENCE
      ↓
NO FALSE SUCCESS
      ↓
SAFE FAILURE
```

Nunca deberá ocultarse un fallo para mantener artificialmente una apariencia de funcionamiento normal.

---

# 24. Relación con la arquitectura

Este documento depende de:

```text
README.md
   ↓
MANIFESTO.md
   ↓
MAP.md
   ↓
ARCHITECTURE.md
   ↓
REQUIREMENTS.md
   ↓
CONTRACTS.md
   ↓
ERROR HANDLING
```

Las decisiones concretas deberán respetar los documentos superiores.

Si existe una contradicción, deberá reportarse antes de adoptar una solución unilateral.

---

# 25. Validación

Cuando comience la implementación, el manejo de errores deberá validarse mediante pruebas apropiadas.

Entre ellas podrán incluirse:

- errores operacionales;
- recursos agotados;
- dispositivos no disponibles;
- cancelación;
- timeout;
- errores de configuración;
- errores de seguridad;
- recuperación;
- fallos fatales;
- liberación de recursos;
- propagación causal;
- regresión.

No deberá declararse una política validada sin evidencia de las pruebas correspondientes.

**Estado: `PLANNED`**

---

# 26. Estado real del proyecto

**Estado general: `PLANNED`**

Este documento define actualmente una política y una estrategia de diseño.

La implementación concreta de estas reglas se realizará cuando comiencen las fases correspondientes del desarrollo de SCREEN by KLIK.

No existe todavía evidencia suficiente para declarar esta estrategia implementada o certificada.

---

# 27. Regla Suprema

> **Un error nunca debe transformarse en una falsa apariencia de éxito.**

SCREEN by KLIK deberá:

```text
DETECTAR
   ↓
CLASIFICAR
   ↓
CONTEXTUALIZAR
   ↓
PROPAGAR
   ↓
RECUPERAR O DETENER
   ↓
LIBERAR RECURSOS
   ↓
REGISTRAR
   ↓
COMUNICAR
```

La respuesta deberá corresponder siempre a la gravedad y al impacto real del error.

**Estado actual: `PLANNED`**