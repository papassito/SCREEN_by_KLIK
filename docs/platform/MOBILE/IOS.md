# SCREEN by KLIK — iOS Platform

**Documento:** `docs/platform/MOBILE/IOS.md`
**Plataforma:** iOS
**Familia:** Mobile
**Estado:** `PLANNED`
**Versión documental:** `0.1.0-alpha`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADA`
**Certificación:** `NO CERTIFICADA`

---

# 1. Propósito

Este documento define las consideraciones específicas de SCREEN by KLIK para iOS.

iOS debe considerarse una plataforma independiente debido a sus propias restricciones de:

* captura;
* permisos;
* ciclo de vida;
* background;
* almacenamiento;
* audio;
* cámara;
* energía;
* distribución.

---

# 2. Arquitectura

```text
SCREEN MOBILE
      │
      ▼
SHARED CONTRACTS
      │
      ▼
IOS PLATFORM
      │
 ┌────┼────┐
 ▼    ▼    ▼
CAPTURE AUDIO CAMERA
      │
      ▼
 PROCESSING
      │
      ▼
  ENCODING
      │
      ▼
  OUTPUT
```

---

# 3. Versiones

Versiones mínimas y soportadas: `TBD`.

---

# 4. Arquitecturas

Debe contemplarse la arquitectura de hardware soportada por la versión de iOS correspondiente.

La matriz exacta será `TBD`.

---

# 5. Captura

Debe determinarse:

* qué modalidades de captura son posibles;
* permisos;
* duración;
* restricciones;
* orientación;
* resolución;
* comportamiento al cambiar de aplicación;
* comportamiento ante interrupciones.

---

# 6. Permisos

SCREEN deberá detectar y manejar explícitamente permisos para:

* captura;
* micrófono;
* cámara;
* archivos/datos cuando corresponda.

La aplicación nunca deberá asumir que los permisos están disponibles.

---

# 7. Ciclo de vida

Debe contemplarse:

```text
ACTIVE
   ↓
BACKGROUND
   ↓
SUSPENDED
   ↓
TERMINATED
```

El comportamiento durante una grabación debe definirse explícitamente.

---

# 8. Audio

Debe evaluarse:

* micrófono;
* rutas de audio;
* interrupciones;
* permisos;
* cambios;
* sincronización.

---

# 9. Cámara

Debe contemplarse:

* frontal;
* trasera;
* selección;
* orientación;
* resolución;
* permisos;
* interrupciones.

---

# 10. Encoding

Debe evaluarse:

* hardware;
* software;
* codecs;
* perfiles;
* bitrate;
* resolución;
* consumo energético;
* temperatura;
* estabilidad.

---

# 11. GPU

Debe evaluarse:

* capacidad;
* aceleración;
* encoder;
* memoria;
* compatibilidad por dispositivo.

---

# 12. Almacenamiento

Debe contemplarse:

* espacio disponible;
* archivos grandes;
* ubicación;
* permisos;
* exportación;
* errores;
* recuperación.

---

# 13. Energía

Debe medirse:

* consumo;
* temperatura;
* rendimiento;
* comportamiento bajo batería baja;
* duración de sesiones.

---

# 14. Interrupciones

Debe contemplarse:

* llamadas;
* cambios de audio;
* notificaciones;
* bloqueo;
* cambio de aplicación;
* suspensión;
* terminación.

---

# 15. Orientación

Debe contemplarse:

* portrait;
* landscape;
* rotación;
* cambios durante una sesión;
* composición.

---

# 16. UI

La interfaz deberá respetar:

* interacción táctil;
* dimensiones;
* accesibilidad;
* orientación;
* ciclo de vida;
* permisos.

Framework y arquitectura UI: `TBD`.

---

# 17. Seguridad

Debe aplicarse:

* mínimo privilegio;
* permisos explícitos;
* protección de archivos;
* protección de configuración;
* no acceso innecesario a información personal.

---

# 18. Rendimiento

Debe medirse:

* CPU;
* GPU;
* RAM;
* FPS;
* encoding;
* almacenamiento;
* batería;
* temperatura;
* estabilidad.

---

# 19. Compatibilidad por dispositivo

La compatibilidad debe probarse por combinación de:

```text
IOS VERSION
+ DEVICE
+ CPU/GPU
+ DISPLAY
+ AUDIO
+ CAMERA
+ STORAGE
```

---

# 20. Distribución

El modelo de distribución es `TBD`.

Debe contemplarse:

* firma;
* distribución;
* actualización;
* permisos;
* restricciones del ecosistema;
* validación previa a publicación.

---

# 21. Pruebas

Deben incluirse:

* dispositivos representativos;
* versiones;
* diferentes capacidades;
* batería;
* almacenamiento;
* interrupciones;
* permisos;
* captura;
* audio;
* cámara;
* encoding;
* sesiones prolongadas.

---

# 22. Gaps

| ID          | Gap                           | Estado  |
| ----------- | ----------------------------- | ------- |
| GAP-IOS-001 | Definir versiones mínimas     | OPEN    |
| GAP-IOS-002 | Definir dispositivos objetivo | OPEN    |
| GAP-IOS-003 | Definir captura               | OPEN    |
| GAP-IOS-004 | Definir audio                 | OPEN    |
| GAP-IOS-005 | Definir cámara                | OPEN    |
| GAP-IOS-006 | Definir encoding              | OPEN    |
| GAP-IOS-007 | Definir ciclo de vida         | OPEN    |
| GAP-IOS-008 | Definir almacenamiento        | OPEN    |
| GAP-IOS-009 | Definir distribución          | OPEN    |
| GAP-IOS-010 | Crear matriz de pruebas       | BLOCKED |

---

# 23. Estado actual

```text
DOCUMENTADO:    YES
IMPLEMENTADO:   NO
PROBADO:        NO
VALIDADO:       NO
CERTIFICADO:    NO
```

---

# 24. Regla

> iOS solamente podrá declararse compatible cuando las capacidades declaradas hayan sido implementadas, probadas y validadas dentro de las restricciones reales de la plataforma.
