# FASE 12 — UI

## SCREEN by KLIK

**Producto:** SCREEN by KLIK
**Fase:** PHASE-12
**Nombre:** UI
**Propósito:** Definición e implementación de la interfaz de usuario de SCREEN
**Plataforma inicial:** Windows
**Lenguaje objetivo:** Go
**Estado:** PLANNED
**Implementación:** NOT IMPLEMENTED
**Pruebas:** NOT EXECUTED
**Validación:** NOT VALIDATED
**Certificación:** NOT CERTIFIED

---

# 1. PROPÓSITO

La FASE 12 define la interfaz gráfica de usuario de SCREEN by KLIK.

La UI debe proporcionar una experiencia clara, directa y profesional para controlar la grabación sin asumir responsabilidades internas de captura, audio, encoding o almacenamiento.

La interfaz debe actuar como **capa de interacción y presentación**, no como núcleo funcional de la aplicación.

---

# 2. OBJETIVO

La UI deberá permitir al usuario:

* configurar la grabación;
* seleccionar fuente;
* iniciar;
* pausar;
* reanudar;
* detener;
* acceder a opciones;
* visualizar estado;
* recibir errores;
* conocer el estado de la sesión;
* acceder a funcionalidades disponibles;
* revisar información relevante del resultado.

---

# 3. PRINCIPIO FUNDAMENTAL

La UI no debe controlar directamente los recursos internos.

Arquitectura:

```text
USER
 ↓
UI
 ↓
APPLICATION COMMAND
 ↓
DOMAIN / RECORDING ENGINE
 ↓
SPECIALIZED MODULES
```

No:

```text
UI
 ↓
NATIVE CAPTURE API
```

---

# 4. ALCANCE

Incluye:

* ventana principal;
* controles;
* estados;
* configuración;
* selección de fuente;
* indicadores;
* mensajes;
* errores;
* accesibilidad;
* interacción;
* responsive behavior dentro del desktop;
* integración con hotkeys;
* integración con Recording Engine;
* pruebas;
* evidencia.

---

# 5. FUERA DE ALCANCE

No incluye directamente:

* implementación del Capture Engine;
* implementación de Audio;
* implementación de Camera;
* Encoding;
* Output;
* lógica interna de Processing;
* APIs nativas multimedia.

---

# 6. VISTA PRINCIPAL

La interfaz deberá representar como mínimo:

```text
SCREEN
────────────────────────────
SOURCE
AUDIO
CAMERA
OPTIONS

        ● RECORD

STATUS
DURATION
OUTPUT
────────────────────────────
```

El diseño visual definitivo:

**TBD**

---

# 7. ESTADOS VISIBLES

La UI deberá reflejar el estado real de la aplicación.

Ejemplo:

```text
IDLE
STARTING
RECORDING
PAUSED
STOPPING
FINALIZING
VALIDATING
COMPLETED
FAILED
CANCELLED
RECOVERY
```

Nunca deberá mostrar `RECORDING` si el Recording Engine no está realmente en ese estado.

---

# 8. CONFIGURACIÓN

La UI deberá presentar configuraciones disponibles sin inventar opciones no soportadas por el backend.

Conceptualmente:

* fuente;
* región;
* audio;
* micrófono;
* cámara;
* cursor;
* encoding;
* output;
* hotkeys;
* preferencias.

---

# 9. SELECCIÓN DE FUENTE

Debe permitir seleccionar entre las fuentes realmente disponibles.

Debe distinguir:

```text
DETECTED
AVAILABLE
CAPTURABLE
VALIDATED
```

Una fuente no disponible no debe presentarse como seleccionable.

---

# 10. GRABACIÓN

El control principal debe respetar el estado del Recording Engine.

Ejemplo:

```text
IDLE
 → START

RECORDING
 → PAUSE
 → STOP

PAUSED
 → RESUME
 → STOP
```

---

# 11. ERRORES

Los errores deben presentarse en lenguaje comprensible.

Debe existir separación entre:

```text
USER MESSAGE
      +
TECHNICAL DIAGNOSTIC
```

La UI no deberá exponer:

* secretos;
* rutas internas innecesarias;
* stack traces completos;
* información sensible.

---

# 12. ACCESIBILIDAD

La UI deberá considerar:

* navegación mediante teclado;
* foco visible;
* etiquetas claras;
* contraste suficiente;
* tamaños adecuados;
* mensajes no dependientes exclusivamente del color;
* lectura mediante tecnologías de accesibilidad cuando sea compatible.

---

# 13. HOTKEYS

La UI deberá permitir configurar y visualizar los hotkeys definidos por la FASE 11.

La UI no deberá implementar por sí misma el mecanismo nativo de captura global.

---

# 14. DIAGNÓSTICOS

Cuando corresponda, la UI podrá presentar:

* estado;
* dispositivo;
* fuente;
* duración;
* advertencias;
* errores;
* estado de finalización.

Los diagnósticos técnicos completos pertenecen al subsistema correspondiente.

---

# 15. PRIVACIDAD

La UI deberá indicar claramente cuándo se utilizan:

* pantalla;
* audio;
* micrófono;
* cámara.

No deberá activar dispositivos silenciosamente.

---

# 16. RENDIMIENTO

La interfaz no debe bloquearse durante:

* captura;
* encoding;
* finalización;
* validación.

Las operaciones largas deberán mantener la aplicación interactiva cuando técnicamente corresponda.

---

# 17. CONCURRENCIA

La UI deberá manejar eventos provenientes de:

* Recording Engine;
* hotkeys;
* errores;
* cambios de dispositivo;
* finalización.

No debe existir una segunda ejecución accidental de una operación ya activa.

---

# 18. PRUEBAS

Se deberán probar:

* startup;
* selección;
* configuración;
* start;
* pause;
* resume;
* stop;
* errores;
* recovery;
* hotkeys;
* accesibilidad;
* sesiones prolongadas;
* resolución de ventana;
* interacción durante finalización.

---

# 19. CRITERIOS DE ENTRADA

* Application definido;
* Recording Engine definido;
* Configuration definido;
* Hotkeys definido;
* estados disponibles.

---

# 20. CRITERIOS DE SALIDA

* UI implementada;
* estados correctamente representados;
* comandos validados;
* errores validados;
* accesibilidad evaluada;
* interacción validada;
* evidencia reproducible.

---

# 21. DECISIONES

| Decisión                                    | Estado   |
| ------------------------------------------- | -------- |
| UI separada del dominio                     | DEFINIDO |
| UI no controla APIs multimedia directamente | REQUIRED |
| Estado visible                              | REQUIRED |
| Accesibilidad                               | REQUIRED |
| Diseño visual definitivo                    | TBD      |
| Framework UI                                | TBD      |
| Arquitectura de navegación                  | TBD      |
| Tema visual                                 | TBD      |

---

# 22. ESTADO ACTUAL

**FASE 12 — PLANNED**

No existe evidencia para declarar implementación, pruebas, validación o certificación.

---

# 23. REGLA SUPREMA

> **La interfaz debe representar fielmente el estado real de SCREEN y nunca simular una operación que el núcleo de la aplicación no haya confirmado.**
