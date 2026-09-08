# SCREEN by KLIK
# PHASE 11 — HOTKEYS

**Documento:** `PHASE-11-HOTKEYS.md`  
**Fase:** 11  
**Nombre:** HOTKEYS  
**Estado:** SPECIFICATION / IMPLEMENTATION READY  
**Proyecto:** SCREEN by KLIK

---

## 1. OBJETIVO

PHASE 11 define el subsistema responsable de la gestión de hotkeys de SCREEN by KLIK.

La fase debe proporcionar un mecanismo controlado para:

- definir hotkeys;
- validar combinaciones;
- registrar hotkeys;
- detectar conflictos;
- activar acciones;
- desregistrar hotkeys;
- gestionar lifecycle;
- manejar errores;
- liberar recursos correctamente.

---

## 2. ALCANCE

PHASE 11 es responsable exclusivamente de la infraestructura de hotkeys.

Incluye:

- definición de shortcuts;
- registro;
- desregistro;
- activación;
- dispatch;
- conflictos;
- lifecycle;
- abstracción de plataforma;
- validación;
- pruebas.

---

## 3. NO OBJETIVOS

PHASE 11 no es responsable de:

- captura de pantalla;
- detección de displays;
- procesamiento de vídeo;
- captura o reproducción de audio;
- lógica de negocio de otras fases;
- autorización general del sistema;
- renderizado general de UI.

Una hotkey puede activar una operación de otra fase, pero PHASE 11 no debe implementar internamente dicha operación.

---

## 4. MODELO CONCEPTUAL

Una hotkey debe representar, como mínimo:

```text
Hotkey
├── ID
├── Key
├── Modifiers
├── Action
├── Scope
├── Enabled
└── Lifecycle State
```

La representación concreta queda determinada por la implementación.

---

## 5. IDENTIDAD

Cada hotkey registrada debe poseer una identidad estable.

La identidad permite:

- localizarla;
- modificarla;
- desregistrarla;
- auditarla;
- diagnosticar conflictos.

No se debe depender únicamente de la combinación física de teclas como identificador lógico.

---

## 6. VALIDACIÓN

Antes de registrar una hotkey se debe validar:

- combinación de teclas;
- modificadores;
- scope;
- acción;
- estado;
- compatibilidad con la plataforma.

Una hotkey inválida no puede alcanzar el estado `registered`.

---

## 7. REGISTRO

El registro debe seguir conceptualmente:

```text
DEFINED
   ↓
VALIDATED
   ↓
REGISTERED
   ↓
ACTIVE
```

Si el registro falla:

```text
VALIDATED
   ↓
REGISTRATION_FAILED
```

No debe quedar una hotkey parcialmente registrada.

---

## 8. CONFLICTOS

El sistema debe detectar conflictos.

Un conflicto ocurre cuando dos hotkeys activas intentan utilizar la misma combinación efectiva dentro de un scope incompatible.

El comportamiento debe ser determinista.

Por defecto:

> Una nueva hotkey conflictiva debe ser rechazada.

No se permite reemplazo silencioso.

---

## 9. SCOPE

Las hotkeys pueden tener distintos ámbitos, según las capacidades de la plataforma:

- global;
- aplicación;
- ventana;
- contexto específico.

El scope forma parte del contrato de la hotkey.

Una combinación puede ser válida en un scope y conflictiva en otro.

---

## 10. DISPATCH

Cuando una hotkey activa es detectada:

```text
Input
 ↓
Hotkey Resolution
 ↓
Registration Validation
 ↓
Action Resolution
 ↓
Dispatch
 ↓
Result
```

PHASE 11 debe realizar el dispatch mediante una interfaz.

No debe invocar directamente internals privados de otra fase.

---

## 11. ACCIONES

Una hotkey debe apuntar a una acción identificable.

La acción debe ser desacoplada de la representación física de teclado.

Ejemplo conceptual:

```text
CTRL + SHIFT + S
        ↓
ACTION_CAPTURE_SCREEN
```

La fase HOTKEYS conoce la acción.

La fase propietaria conoce cómo ejecutar la acción.

---

## 12. UNREGISTER

El desregistro debe:

1. identificar la hotkey;
2. detener su activación;
3. liberar el recurso del sistema;
4. eliminar su ownership;
5. actualizar el lifecycle.

Después de `unregister`, la hotkey no debe continuar generando dispatches.

---

## 13. SHUTDOWN

Durante shutdown:

- deben detenerse las hotkeys activas;
- deben liberarse registros del sistema operativo;
- no deben quedar callbacks activos;
- no debe quedar estado parcialmente registrado;
- las operaciones concurrentes deben finalizar de forma segura.

El shutdown debe ser idempotente cuando la arquitectura lo permita.

---

## 14. CONCURRENCIA

El subsistema debe ser seguro frente a concurrencia.

Deben controlarse especialmente:

- register vs register;
- register vs unregister;
- dispatch vs unregister;
- dispatch vs shutdown;
- unregister vs shutdown.

Debe evitarse:

- double registration;
- stale handlers;
- use-after-unregister;
- registros huérfanos;
- estados inconsistentes.

---

## 15. ABSTRACCIÓN DE PLATAFORMA

Las APIs específicas del sistema operativo deben permanecer detrás de una abstracción.

La arquitectura general no debe depender directamente de:

- APIs Windows;
- APIs macOS;
- APIs Linux;
- bindings específicos.

La implementación de plataforma debe ser sustituible sin modificar el contrato superior.

---

## 16. ERRORES

Como mínimo deben distinguirse:

```text
INVALID_HOTKEY
UNSUPPORTED_HOTKEY
CONFLICT
REGISTRATION_FAILED
UNREGISTRATION_FAILED
DISPATCH_FAILED
PLATFORM_UNAVAILABLE
INVALID_LIFECYCLE_STATE
SHUTDOWN_ERROR
```

La implementación puede utilizar una taxonomía más específica.

---

## 17. SEGURIDAD

Una hotkey no constituye por sí misma un mecanismo de autorización.

Una combinación de teclas que active una operación privilegiada debe estar sujeta a las mismas reglas de autorización que cualquier otra vía de ejecución.

Debe considerarse:

- input injection;
- spoofing;
- accidental activation;
- privilegios;
- interceptación global;
- lifecycle races.

---

## 18. OBSERVABILIDAD

Deben poder diagnosticarse eventos relevantes como:

- hotkey registrada;
- hotkey desregistrada;
- conflicto;
- activación;
- dispatch;
- error;
- shutdown.

No deben registrarse innecesariamente las secuencias completas de entrada cuando ello pueda revelar información sensible.

---

## 19. TESTING

PHASE 11 debe incluir pruebas para:

### Registro

- registro válido;
- registro inválido;
- registro duplicado;
- conflicto.

### Dispatch

- dispatch correcto;
- acción inexistente;
- acción fallida;
- hotkey deshabilitada.

### Lifecycle

- unregister;
- doble unregister;
- register → unregister → register;
- shutdown;
- operaciones posteriores a shutdown.

### Concurrencia

- registros concurrentes;
- unregister concurrente;
- dispatch concurrente;
- shutdown concurrente.

### Plataforma

- plataforma soportada;
- combinación no soportada;
- API del sistema no disponible;
- fallo de registro del sistema operativo.

---

## 20. CRITERIOS DE ACEPTACIÓN

PHASE 11 se considera aceptada cuando:

- las hotkeys pueden definirse;
- las combinaciones se validan;
- los conflictos son deterministas;
- el registro es atómico desde el punto de vista del contrato;
- el dispatch utiliza interfaces explícitas;
- el desregistro libera correctamente los recursos;
- shutdown limpia todos los registros;
- la implementación de plataforma está aislada;
- los errores son identificables;
- los tests cubren lifecycle y failure paths;
- no existe acoplamiento privado con otras fases.

---

## 21. DEPENDENCIAS

Cualquier dependencia con otra fase debe estar documentada mediante el contrato de dicha fase.

PHASE 11 no puede importar o utilizar directamente internals privados de otra fase únicamente para simplificar la implementación.

---

## 22. REGLA DE INTEGRACIÓN

La relación entre HOTKEYS y otras fases debe seguir:

```text
PHASE 11
   │
   │ Action Contract
   ▼
Owning Phase
   │
   ▼
Actual Operation
```

No:

```text
PHASE 11
   │
   └──► Private Internal Function
```

---

## 23. DEFINITION OF DONE

PHASE 11 no puede declararse completa únicamente porque el sistema registre una combinación de teclas.

Debe demostrarse:

```text
Definition
      ↓
Validation
      ↓
Registration
      ↓
Activation
      ↓
Dispatch
      ↓
Unregistration
      ↓
Cleanup
      ↓
Verification
```

---

## 24. AUTORIDAD

Este documento está subordinado a:

```text
CONTRACT.md
PHASE-00-CONTRACT.md
```

Si existe una contradicción, prevalece el documento de mayor autoridad.

---

## 25. ESTADO

**PHASE 11 — HOTKEYS**

SPECIFICATION COMPLETE  
IMPLEMENTATION BOUNDARY DEFINED  
ACCEPTANCE CRITERIA DEFINED  
READY FOR IMPLEMENTATION