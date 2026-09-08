# SCREEN by KLIK — Android Platform

**Documento:** `docs/platform/MOBILE/ANDROID.md`
**Plataforma:** Android
**Familia:** Mobile
**Estado:** `PLANNED`
**Versión documental:** `0.1.0-alpha`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADA`
**Certificación:** `NO CERTIFICADA`

---

# 1. Propósito

Este documento define las consideraciones específicas para SCREEN by KLIK en Android.

Android no debe tratarse como una versión móvil simplificada del producto de escritorio.

La plataforma tiene restricciones propias de:

* ciclo de vida;
* permisos;
* batería;
* almacenamiento;
* background;
* captura;
* audio;
* cámara;
* hardware;
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
ANDROID PLATFORM
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

La versión mínima de Android será `TBD`.

Las versiones soportadas deberán definirse explícitamente.

---

# 4. Arquitecturas

Debe contemplarse:

* arquitectura CPU;
* ABI;
* GPU;
* encoder;
* fabricante;
* modelo;
* versión del sistema.

---

# 5. Captura de pantalla

Debe determinarse qué modalidades serán soportadas:

* pantalla completa;
* regiones;
* ventanas cuando sea aplicable;
* orientación;
* cambios de resolución;
* cambios de configuración.

Las capacidades exactas dependen de las restricciones del sistema.

---

# 6. Permisos

SCREEN deberá manejar explícitamente:

* captura;
* micrófono;
* cámara;
* almacenamiento cuando corresponda;
* notificaciones cuando sean necesarias para la operación.

Nunca se asumirán permisos concedidos.

---

# 7. Ciclo de vida

El diseño debe considerar:

```text
FOREGROUND
   ↓
RECORDING
   ↓
BACKGROUND
   ↓
SUSPENDED / TERMINATED
```

La continuidad de una grabación durante cambios de estado deberá ser definida y probada.

---

# 8. Batería

La grabación puede representar una carga significativa.

Debe medirse:

* consumo;
* temperatura;
* duración;
* comportamiento bajo ahorro energético;
* comportamiento con batería baja.

---

# 9. Audio

Debe contemplarse:

* micrófono;
* audio disponible del sistema cuando la plataforma lo permita;
* selección;
* permisos;
* cambios;
* pérdida del dispositivo lógico.

---

# 10. Cámara

Debe contemplarse:

* cámara frontal;
* cámara trasera;
* selección;
* orientación;
* resolución;
* permisos;
* desconexión lógica;
* cambios de configuración.

---

# 11. Encoding

Debe evaluarse:

* software;
* hardware;
* codecs;
* perfiles;
* resolución;
* bitrate;
* consumo;
* temperatura;
* fallback.

---

# 12. GPU

La presencia y capacidades de GPU varían ampliamente.

Debe evaluarse:

* fabricante;
* modelo;
* driver;
* aceleración;
* encoder;
* estabilidad.

---

# 13. Almacenamiento

Debe contemplarse:

* almacenamiento interno;
* almacenamiento externo cuando aplique;
* espacio insuficiente;
* límites;
* permisos;
* archivos grandes;
* recuperación.

---

# 14. Orientación

Debe manejarse correctamente:

* portrait;
* landscape;
* rotación;
* cambio durante grabación;
* dimensiones del vídeo.

El comportamiento exacto será `TBD`.

---

# 15. Interrupciones

Deben contemplarse:

* llamada;
* notificación;
* cambio de aplicación;
* bloqueo;
* batería baja;
* pérdida de permisos;
* falta de almacenamiento;
* terminación del proceso.

---

# 16. UI

La interfaz deberá adaptarse a:

* pantallas pequeñas;
* densidad;
* orientación;
* navegación táctil;
* accesibilidad;
* permisos;
* ciclo de vida.

---

# 17. Seguridad

Debe aplicarse:

* mínimo privilegio;
* permisos explícitos;
* protección de grabaciones;
* protección de configuración;
* no acceso innecesario a datos del dispositivo.

---

# 18. Rendimiento

Debe medirse:

* FPS;
* CPU;
* GPU;
* RAM;
* almacenamiento;
* temperatura;
* batería;
* frames descartados;
* latencia.

---

# 19. Compatibilidad por fabricante

La matriz deberá considerar que diferentes fabricantes pueden modificar:

* gestión de procesos;
* batería;
* permisos;
* cámara;
* GPU;
* almacenamiento;
* background.

---

# 20. Pruebas

Deberán existir matrices por:

```text
ANDROID VERSION
+ DEVICE
+ CPU
+ GPU
+ DISPLAY
+ CAMERA
+ AUDIO
+ STORAGE
+ POWER STATE
```

---

# 21. Gaps

| ID          | Gap                            | Estado  |
| ----------- | ------------------------------ | ------- |
| GAP-AND-001 | Definir versión mínima         | OPEN    |
| GAP-AND-002 | Definir ABI                    | OPEN    |
| GAP-AND-003 | Definir captura                | OPEN    |
| GAP-AND-004 | Definir audio                  | OPEN    |
| GAP-AND-005 | Definir cámara                 | OPEN    |
| GAP-AND-006 | Definir encoding               | OPEN    |
| GAP-AND-007 | Definir background behavior    | OPEN    |
| GAP-AND-008 | Definir almacenamiento         | OPEN    |
| GAP-AND-009 | Definir dispositivos de prueba | OPEN    |
| GAP-AND-010 | Crear matriz Android           | BLOCKED |

---

# 22. Estado actual

```text
DOCUMENTADO:    YES
IMPLEMENTADO:   NO
PROBADO:        NO
VALIDADO:       NO
CERTIFICADO:    NO
```

---

# 23. Regla

> Android debe tratarse como una plataforma independiente con sus propias restricciones y evidencia de compatibilidad.
