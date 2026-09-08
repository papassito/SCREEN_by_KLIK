# SCREEN by KLIK — macOS Platform

**Documento:** `docs/platform/DESKTOP/MACOS.md`
**Plataforma:** macOS
**Familia:** Desktop
**Estado:** `PLANNED`
**Versión documental:** `0.1.0-alpha`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADA`
**Certificación:** `NO CERTIFICADA`

---

## 1. Propósito

Este documento define las consideraciones específicas para SCREEN by KLIK en macOS.

La plataforma debe tratarse como un entorno con capacidades propias y restricciones específicas.

---

# 2. Arquitectura

```text
SCREEN
  │
  ▼
SHARED CONTRACTS
  │
  ▼
MACOS PLATFORM
  │
  ├── SCREEN CAPTURE
  ├── AUDIO
  ├── CAMERA
  ├── GPU
  ├── ENCODING
  └── FILESYSTEM
```

---

# 3. Versiones

Las versiones mínimas y soportadas son `TBD`.

No se declarará compatibilidad general con macOS sin una matriz de versiones validada.

---

# 4. Arquitecturas CPU

Debe contemplarse la coexistencia de diferentes arquitecturas de hardware.

Arquitecturas soportadas: `TBD`.

---

# 5. Captura de pantalla

Debe contemplarse:

* pantalla completa;
* monitor;
* región;
* ventana;
* múltiples pantallas;
* cambios de resolución;
* escala;
* cambios dinámicos.

La tecnología concreta de captura permanece `TBD`.

---

# 6. Permisos de captura

macOS puede requerir autorización específica para determinadas capacidades.

SCREEN debe:

* solicitar solamente permisos necesarios;
* detectar permisos ausentes;
* informar claramente al usuario;
* no asumir autorización;
* manejar la denegación de manera segura.

---

# 7. Multi-monitor

Debe evaluarse:

* identificación;
* geometría;
* resolución;
* escala;
* orientación;
* conexión;
* desconexión;
* cambios dinámicos.

---

# 8. Audio

Debe evaluarse:

* micrófono;
* entrada;
* salida;
* audio del sistema;
* selección;
* permisos;
* cambios;
* sincronización.

La tecnología concreta permanece `TBD`.

---

# 9. Cámara

Debe contemplarse:

* detección;
* permisos;
* adquisición;
* formatos;
* resolución;
* selección;
* desconexión.

---

# 10. GPU

Debe contemplarse:

* GPU integrada;
* GPU dedicada cuando exista;
* arquitecturas de hardware;
* drivers;
* aceleración;
* encoding;
* fallback.

---

# 11. Encoding

Debe evaluarse:

* codecs;
* software encoding;
* hardware encoding;
* perfiles;
* calidad;
* rendimiento;
* fallback.

La tecnología concreta permanece `TBD`.

---

# 12. Filesystem

Debe contemplarse:

* sandboxing cuando corresponda;
* permisos;
* rutas;
* almacenamiento;
* archivos grandes;
* errores;
* archivos temporales;
* finalización segura.

---

# 13. Ciclo de vida

Debe manejar:

```text
START
READY
RECORDING
PAUSED
STOPPING
FINALIZING
COMPLETED
```

y:

```text
FAILED
CANCELLED
PARTIAL
RECOVERY
```

---

# 14. Suspensión

Debe evaluarse:

* sleep;
* wake;
* bloqueo;
* cierre de sesión;
* cambio de usuario;
* terminación de aplicación.

---

# 15. UI

La UI deberá considerar:

* convenciones de macOS;
* accesibilidad;
* escalado;
* ventanas;
* permisos;
* menús;
* shortcuts;
* ciclo de vida.

Framework: `TBD`.

---

# 16. Seguridad

Debe respetarse:

* mínimo privilegio;
* permisos explícitos;
* protección de archivos;
* protección de configuración;
* manejo seguro de secretos;
* seguridad de procesos.

---

# 17. Rendimiento

Debe medirse:

* CPU;
* GPU;
* memoria;
* FPS;
* encoding;
* almacenamiento;
* energía;
* temperatura cuando sea relevante;
* estabilidad.

---

# 18. Pruebas

La matriz deberá considerar:

* versiones;
* arquitectura;
* hardware;
* GPU;
* pantallas;
* audio;
* cámara;
* permisos;
* encoding;
* sesiones largas.

---

# 19. Gaps

| ID          | Gap                              | Estado  |
| ----------- | -------------------------------- | ------- |
| GAP-MAC-001 | Definir versiones mínimas        | OPEN    |
| GAP-MAC-002 | Definir arquitecturas            | OPEN    |
| GAP-MAC-003 | Definir mecanismo de captura     | OPEN    |
| GAP-MAC-004 | Definir audio                    | OPEN    |
| GAP-MAC-005 | Definir cámara                   | OPEN    |
| GAP-MAC-006 | Definir GPU/encoding             | OPEN    |
| GAP-MAC-007 | Definir permisos                 | OPEN    |
| GAP-MAC-008 | Definir filesystem/configuración | OPEN    |
| GAP-MAC-009 | Definir matriz hardware          | OPEN    |
| GAP-MAC-010 | Crear pruebas                    | BLOCKED |

---

# 20. Estado actual

```text
DOCUMENTADO:    YES
IMPLEMENTADO:   NO
PROBADO:        NO
VALIDADO:       NO
CERTIFICADO:    NO
```

---

# 21. Regla

> El soporte de macOS deberá demostrarse sobre configuraciones concretas y no asumirse por compatibilidad teórica.
