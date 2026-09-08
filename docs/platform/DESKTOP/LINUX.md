# SCREEN by KLIK — Linux Platform

**Documento:** `docs/platform/DESKTOP/LINUX.md`
**Plataforma:** Linux
**Familia:** Desktop
**Estado:** `PLANNED`
**Versión documental:** `0.1.0-alpha`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADA`
**Certificación:** `NO CERTIFICADA`

---

## 1. Propósito

Este documento define la estrategia y los requisitos de plataforma para ejecutar SCREEN by KLIK sobre Linux.

Linux no debe tratarse como una única configuración homogénea.

La compatibilidad puede variar según:

* distribución;
* versión;
* arquitectura;
* entorno de escritorio;
* servidor/compositor gráfico;
* drivers;
* GPU;
* stack de audio;
* permisos;
* sesión gráfica.

---

# 2. Arquitectura

```text
SCREEN
  │
  ▼
SHARED CONTRACTS
  │
  ▼
LINUX PLATFORM
  │
  ├── GRAPHICS
  ├── AUDIO
  ├── CAMERA
  ├── GPU
  └── FILESYSTEM
```

Los detalles específicos de Linux deben permanecer dentro de la capa de plataforma siempre que sea posible.

---

# 3. Distribuciones

Las distribuciones oficialmente soportadas serán `TBD`.

Deberán evaluarse al menos:

* versión;
* arquitectura;
* sistema gráfico;
* drivers;
* dependencias;
* disponibilidad de capacidades requeridas.

No se declarará “Linux soportado” únicamente por funcionar en una distribución.

---

# 4. Arquitecturas

Las arquitecturas CPU soportadas son `TBD`.

Deben considerarse:

* compatibilidad binaria;
* rendimiento;
* disponibilidad de dependencias;
* packaging;
* hardware acceleration.

---

# 5. Entorno gráfico

La captura puede depender del entorno gráfico y de la tecnología utilizada por la sesión.

Debe evaluarse:

* escritorio;
* compositor;
* servidor gráfico;
* permisos;
* captura de pantalla;
* captura de ventana;
* región;
* multi-monitor.

Las tecnologías concretas permanecen `TBD`.

---

# 6. Captura

Debe contemplarse:

* pantalla completa;
* monitor específico;
* región;
* ventana;
* múltiples monitores;
* cambios de resolución;
* cambios de escala;
* cambios de sesión.

La disponibilidad exacta deberá verificarse por configuración.

---

# 7. Multi-monitor

Debe contemplarse:

* identificación;
* geometría;
* resolución;
* orientación;
* escala;
* conexión/desconexión;
* cambios dinámicos.

---

# 8. Audio

Linux presenta posibles variaciones según el stack de audio disponible.

Debe evaluarse:

* micrófono;
* audio de sistema;
* dispositivos de entrada;
* dispositivos de salida;
* selección;
* cambios;
* pérdida de dispositivo;
* sincronización.

Stack concreto: `TBD`.

---

# 9. Cámara

Debe contemplarse:

* detección;
* permisos;
* adquisición;
* formatos;
* resolución;
* selección;
* desconexión;
* recuperación.

Tecnología concreta: `TBD`.

---

# 10. GPU

Debe evaluarse:

* fabricante;
* driver;
* GPU integrada;
* GPU dedicada;
* múltiples GPUs;
* aceleración;
* encoder;
* fallback.

La estrategia transversal se encuentra en:

`platform/TRANSVERSAL/HARDWARE-ACCELERATION.md`

---

# 11. Encoding

Debe evaluarse:

* software encoding;
* hardware encoding;
* codecs;
* perfiles;
* drivers;
* disponibilidad por GPU;
* fallback.

Nada se considera disponible hasta ser validado.

---

# 12. Filesystem

Debe contemplarse:

* permisos;
* rutas;
* archivos grandes;
* nombres;
* almacenamiento;
* filesystem montado;
* dispositivos extraíbles;
* errores;
* espacio insuficiente.

---

# 13. Permisos

Linux puede presentar diferencias importantes según configuración y sesión.

SCREEN debe operar con el mínimo privilegio necesario.

---

# 14. Desktop environments

El soporte por entorno deberá ser explícito cuando existan diferencias funcionales.

El conjunto de entornos soportados es `TBD`.

---

# 15. Sesiones gráficas

Debe evaluarse el comportamiento cuando:

* la sesión comienza;
* termina;
* cambia;
* se bloquea;
* se suspende;
* se reanuda.

---

# 16. Distribución

El método de distribución para Linux es `TBD`.

No se debe asumir todavía:

* formato de paquete;
* repositorio;
* paquete universal;
* binario portable;
* sandboxing.

---

# 17. Dependencias

Las dependencias específicas de Linux deben documentarse y justificarse.

No se deben agregar dependencias únicamente para resolver síntomas locales.

---

# 18. Rendimiento

Debe medirse:

* CPU;
* GPU;
* memoria;
* FPS;
* frames descartados;
* encoding;
* I/O;
* estabilidad;
* sesiones largas.

---

# 19. Diagnóstico

Los logs deben identificar:

* distribución;
* versión;
* arquitectura;
* componente;
* operación;
* estado;
* error;

cuando dicha información sea necesaria y segura.

---

# 20. Seguridad

Debe contemplarse:

* mínimo privilegio;
* permisos;
* aislamiento;
* protección de archivos;
* ejecución segura;
* dependencias confiables;
* no exposición innecesaria.

---

# 21. Pruebas

Deberán contemplarse matrices por:

```text
DISTRIBUTION
+ VERSION
+ DESKTOP
+ GRAPHICS STACK
+ GPU
+ DRIVER
+ AUDIO
+ CONFIGURATION
```

---

# 22. Gaps

| ID          | Gap                             | Estado  |
| ----------- | ------------------------------- | ------- |
| GAP-LNX-001 | Definir distribuciones objetivo | OPEN    |
| GAP-LNX-002 | Definir versiones               | OPEN    |
| GAP-LNX-003 | Definir arquitecturas           | OPEN    |
| GAP-LNX-004 | Definir stack gráfico           | OPEN    |
| GAP-LNX-005 | Definir captura                 | OPEN    |
| GAP-LNX-006 | Definir audio                   | OPEN    |
| GAP-LNX-007 | Definir cámara                  | OPEN    |
| GAP-LNX-008 | Definir GPU/encoding            | OPEN    |
| GAP-LNX-009 | Definir distribución            | OPEN    |
| GAP-LNX-010 | Crear matriz de pruebas         | BLOCKED |

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

> “Linux” no constituye por sí mismo una configuración certificable. El soporte deberá definirse y demostrarse sobre configuraciones concretas.
