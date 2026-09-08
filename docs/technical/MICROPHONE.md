# MICROPHONE.md

# SCREEN by KLIK — Microphone

**Ruta:** `docs/technical/MICROPHONE.md`
**Versión documental:** `0.1.0-alpha`
**Estado:** `PLANNED`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADO`
**Certificación:** `NO CERTIFICADO`

---

## 1. Propósito

Este documento define las bases técnicas específicas para la captura de **micrófono** en SCREEN by KLIK.

El micrófono se considera una fuente de audio independiente que deberá poder:

* detectarse;
* seleccionarse;
* autorizarse;
* inicializarse;
* capturarse;
* sincronizarse;
* detenerse;
* recuperarse ante fallos cuando sea posible.

La arquitectura general de audio se encuentra en:

`docs/technical/AUDIO.md`

---

## 2. Alcance

Este documento contempla:

* descubrimiento de dispositivos;
* selección;
* permisos;
* inicialización;
* configuración;
* captura;
* timestamps;
* buffers;
* sincronización;
* pérdida del dispositivo;
* recuperación;
* errores;
* recursos;
* privacidad;
* seguridad;
* plataformas;
* pruebas.

---

## 3. Flujo conceptual

```text
MICROPHONE DEVICE
       ↓
DISCOVERY
       ↓
SELECTION
       ↓
PERMISSION
       ↓
INITIALIZATION
       ↓
AUDIO CAPTURE
       ↓
TIMESTAMP
       ↓
BUFFERING
       ↓
PROCESSING
       ↓
SYNC
       ↓
ENCODING
       ↓
OUTPUT
```

---

## 4. Descubrimiento

El sistema deberá poder identificar los dispositivos disponibles según las capacidades de la plataforma.

Conceptualmente:

```text
AVAILABLE
UNAVAILABLE
INVALID
UNKNOWN
```

No deberá asumirse que el dispositivo predeterminado del sistema es necesariamente el seleccionado por el usuario.

---

## 5. Selección

La selección deberá diferenciar entre:

* dispositivo predeterminado;
* dispositivo explícitamente seleccionado;
* dispositivo desconectado;
* dispositivo no disponible.

El comportamiento ante desaparición del dispositivo permanece `TBD`.

---

## 6. Permisos

La captura del micrófono requiere consideración explícita de permisos.

El sistema deberá distinguir:

```text
PERMISSION GRANTED
PERMISSION DENIED
PERMISSION NOT REQUESTED
PERMISSION RESTRICTED
UNKNOWN
```

La implementación dependerá de cada plataforma.

---

## 7. Inicialización

La inicialización deberá validar, cuando corresponda:

* dispositivo;
* formato;
* sample rate;
* canales;
* representación;
* buffer;
* timestamps;
* permisos.

Los parámetros concretos permanecen `TBD`.

---

## 8. Formato de audio

Deberán definirse posteriormente:

* sample rate;
* número de canales;
* profundidad;
* representación;
* formato interno;
* buffer size;
* clock source.

No se fija todavía ninguna combinación concreta.

---

## 9. Captura

Durante la captura deberán preservarse:

* orden temporal;
* timestamps;
* continuidad;
* integridad de las muestras.

Los buffers deberán estar limitados.

No deberá permitirse crecimiento indefinido durante una sesión prolongada.

---

## 10. Sincronización

El micrófono deberá sincronizarse con:

* pantalla;
* cámara;
* otros flujos de audio.

Deberán contemplarse:

* clock drift;
* latencia;
* buffering;
* pausas;
* reanudaciones;
* pérdida de muestras;
* diferencias de frecuencia.

---

## 11. Latencia

La latencia deberá medirse y controlarse.

Deberán distinguirse:

```text
CAPTURE LATENCY
BUFFER LATENCY
PROCESSING LATENCY
ENCODING LATENCY
TOTAL A/V LATENCY
```

Los límites aceptables permanecen `TBD`.

---

## 12. Pérdida del dispositivo

Si el micrófono desaparece durante la grabación:

```text
ACTIVE
  ↓
DEVICE LOST
  ↓
RECOVERY / DEGRADED / FAILED
```

El comportamiento concreto deberá definirse.

No deberá simularse audio inexistente.

---

## 13. Recuperación

La recuperación podrá depender de:

* disponibilidad del dispositivo;
* permisos;
* plataforma;
* estado de la grabación;
* capacidad de reinicialización.

El sistema deberá reportar claramente si:

* recuperó el micrófono;
* continuó sin micrófono;
* produjo resultado parcial;
* falló la grabación.

---

## 14. Pause / Resume

Durante una pausa deberá preservarse la coherencia temporal.

La arquitectura deberá definir posteriormente:

* detener captura;
* mantener dispositivo abierto;
* liberar dispositivo;
* descartar muestras;
* reinicializar.

No se fija una estrategia todavía.

---

## 15. Errores

Se deberán contemplar:

* dispositivo inexistente;
* dispositivo ocupado;
* permiso denegado;
* formato no soportado;
* inicialización fallida;
* pérdida de dispositivo;
* buffer overflow;
* timeout;
* cancelación;
* error de plataforma.

---

## 16. Recursos

El subsistema deberá controlar:

* memoria;
* buffers;
* handles;
* streams;
* dispositivos;
* threads/tasks;
* CPU.

Toda adquisición de recurso deberá tener una estrategia de liberación.

---

## 17. Seguridad

El acceso al micrófono deberá estar explícitamente autorizado.

SCREEN no deberá:

* capturar micrófono sin autorización;
* ocultar el estado de captura;
* almacenar audio fuera del flujo autorizado;
* registrar contenido de audio en logs.

---

## 18. Privacidad

El audio del micrófono puede contener información altamente sensible.

Deberán aplicarse:

* minimización;
* consentimiento/autorización según plataforma y producto;
* control del usuario;
* almacenamiento limitado;
* eliminación conforme a política.

La especificación general se encuentra en `docs/security/PRIVACY.md`.

---

## 19. Plataformas

Deberá validarse individualmente en:

* Windows;
* Linux;
* macOS;
* Android;
* iOS.

Las diferencias pueden afectar:

* permisos;
* dispositivos;
* lifecycle;
* background;
* interrupciones;
* audio focus;
* suspensión;
* energía;
* APIs disponibles.

---

## 20. Rendimiento

La captura deberá evitar interferir significativamente con:

* screen capture;
* camera capture;
* encoding;
* UI.

Deberán medirse:

* CPU;
* memoria;
* buffer utilization;
* latency;
* dropped samples;
* estabilidad.

---

## 21. Pruebas

Deberán contemplarse:

* micrófono disponible;
* micrófono ausente;
* permiso concedido;
* permiso denegado;
* cambio de dispositivo;
* desconexión;
* reconexión;
* pausas;
* reanudaciones;
* grabación prolongada;
* sincronización;
* errores;
* cancelación;
* plataformas.

---

## 22. Evidencia

Una validación real deberá registrar, cuando corresponda:

* dispositivo;
* plataforma;
* configuración;
* duración;
* sample rate;
* canales;
* resultado;
* sincronización;
* errores;
* evidencia audiovisual.

No deberán inventarse resultados.

---

## 23. Gaps

| ID          | Gap                     |
| ----------- | ----------------------- |
| GAP-MIC-001 | API de captura          |
| GAP-MIC-002 | Formatos soportados     |
| GAP-MIC-003 | Device discovery        |
| GAP-MIC-004 | Permission model        |
| GAP-MIC-005 | Buffer policy           |
| GAP-MIC-006 | Clock / synchronization |
| GAP-MIC-007 | Device recovery         |
| GAP-MIC-008 | Background behavior     |
| GAP-MIC-009 | Platform matrix         |
| GAP-MIC-010 | Testing matrix          |

---

## 24. Estado actual

| Elemento          | Estado            |
| ----------------- | ----------------- |
| Documentación     | `DOCUMENTED`      |
| Diseño conceptual | `PLANNED`         |
| Implementación    | `NO IMPLEMENTADA` |
| Pruebas           | `NO EJECUTADAS`   |
| Evidencia         | `NO DISPONIBLE`   |
| Validación        | `NO VALIDADO`     |
| Certificación     | `NO CERTIFICADO`  |

---

## 25. Evolución

```text
PLANNED
   ↓
DESIGNED
   ↓
IMPLEMENTED
   ↓
TESTED
   ↓
VALIDATED
   ↓
CERTIFIED
   ↓
INTEGRATED
```

---

## 26. Regla de integridad

> **SCREEN no deberá afirmar que captura micrófono correctamente hasta demostrarlo en la plataforma y configuración correspondientes.**

El silencio, la ausencia de dispositivo o una captura parcial deberán representarse como estados reales, nunca como datos sintéticos.
