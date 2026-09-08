# SCREEN by KLIK — Windows Platform

**Documento:** `docs/platform/DESKTOP/WINDOWS.md`
**Plataforma:** Windows
**Familia:** Desktop
**Estado:** `PLANNED`
**Versión documental:** `0.1.0-alpha`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADA`
**Certificación:** `NO CERTIFICADA`

---

## 1. Propósito

Este documento define los requisitos y consideraciones específicas de SCREEN by KLIK para Windows.

Windows es una plataforma objetivo de escritorio.

El documento establece las fronteras entre:

* componentes compartidos;
* capacidades específicas de Windows;
* recursos del sistema;
* permisos;
* captura;
* audio;
* cámara;
* GPU;
* encoding;
* filesystem;
* UI;
* instalación;
* diagnóstico.

No congela todavía APIs nativas concretas.

---

# 2. Principio de arquitectura

La arquitectura debe mantener:

```text
SCREEN
  │
  ▼
SHARED CONTRACTS
  │
  ▼
WINDOWS PLATFORM
  │
  ▼
NATIVE CAPABILITIES
```

Los detalles específicos de Windows no deben contaminar innecesariamente las capas superiores.

---

# 3. Estado

Este documento describe una plataforma objetivo.

No constituye evidencia de que SCREEN by KLIK ya funcione en Windows.

---

# 4. Sistema operativo

Deben determinarse:

* versión mínima;
* versiones soportadas;
* arquitectura;
* edición cuando sea relevante;
* requisitos de actualización;
* restricciones del sistema.

Todos estos valores permanecen `TBD`.

---

# 5. Arquitecturas CPU

La plataforma deberá determinar qué arquitecturas serán soportadas.

Posibles arquitecturas deberán evaluarse según la implementación final.

Estado:

```text
SUPPORTED ARCHITECTURES: TBD
MINIMUM CPU: TBD
```

---

# 6. Captura de pantalla

La implementación Windows deberá contemplar, cuando sea viable:

* pantalla completa;
* monitor específico;
* región;
* ventana;
* múltiples monitores;
* cambios de resolución;
* cambios de escala;
* cambios de monitor;
* cambios dinámicos durante la sesión.

La tecnología concreta de captura permanece `TBD`.

---

# 7. Multi-monitor

Debe contemplarse:

* identificación de monitores;
* monitor principal;
* resolución individual;
* posición relativa;
* escala;
* orientación;
* desconexión;
* conexión durante una sesión.

Debe evitarse asumir que todos los monitores comparten resolución o DPI.

---

# 8. DPI y escalado

Windows puede utilizar diferentes niveles de escalado.

SCREEN debe determinar cómo manejar:

* DPI;
* escalado;
* coordenadas;
* regiones;
* ventanas;
* cursor;
* overlays;
* anotaciones.

El contrato exacto permanece `TBD`.

---

# 9. Captura de ventana

La captura de una ventana deberá considerar:

* identificación;
* ventana minimizada;
* ventana parcialmente visible;
* cambios de tamaño;
* cambios de posición;
* ventanas protegidas;
* ventanas que no pueden ser capturadas;
* cierre de la ventana.

---

# 10. Audio

La plataforma debe contemplar:

* micrófono;
* dispositivos de entrada;
* dispositivos de salida;
* captura de audio del sistema;
* selección de dispositivo;
* cambios de dispositivo;
* pérdida de dispositivo;
* sincronización audio/video.

La API de audio permanece `TBD`.

---

# 11. Cámara

La cámara deberá contemplar:

* enumeración;
* selección;
* permisos;
* resolución;
* formato;
* adquisición;
* desconexión;
* recuperación.

La integración concreta permanece `TBD`.

---

# 12. GPU

Debe evaluarse:

* GPU integrada;
* GPU dedicada;
* múltiples GPUs;
* drivers;
* memoria;
* capacidades de encoding;
* aceleración;
* pérdida del dispositivo.

La estrategia transversal está definida en:

`platform/TRANSVERSAL/HARDWARE-ACCELERATION.md`

---

# 13. Encoding

Debe contemplarse:

```text
CAPTURE
   ↓
PROCESSING
   ↓
ENCODING
   ├── HARDWARE
   └── SOFTWARE FALLBACK
```

La selección de codecs, APIs y encoders permanece `TBD`.

---

# 14. Filesystem

Debe contemplarse:

* rutas de usuario;
* permisos;
* archivos temporales;
* archivos finales;
* archivos grandes;
* caracteres especiales;
* errores de escritura;
* espacio insuficiente;
* recuperación de archivos incompletos.

La ubicación definitiva de configuración y datos permanece `TBD`.

---

# 15. Permisos

SCREEN debe solicitar únicamente los permisos necesarios.

La implementación deberá considerar:

* permisos del usuario;
* elevación;
* acceso a dispositivos;
* captura;
* archivos;
* cámara;
* micrófono.

No se debe asumir que la aplicación requiere privilegios administrativos.

---

# 16. Hotkeys

Debe contemplarse:

* hotkeys internas;
* conflictos;
* registro;
* desregistro;
* teclas no disponibles;
* comportamiento durante grabación.

La implementación concreta está definida en la documentación técnica de hotkeys.

---

# 17. Cursor

Debe determinarse cómo capturar:

* cursor normal;
* movimiento;
* visibilidad;
* múltiples monitores;
* escalado;
* cursor durante cambios de pantalla.

---

# 18. UI

La UI debe respetar las convenciones apropiadas de Windows sin comprometer el contrato común del producto.

Debe evaluarse:

* DPI;
* accesibilidad;
* ventanas;
* menús;
* shortcuts;
* notificaciones;
* ciclo de vida.

Framework concreto: `TBD`.

---

# 19. Ciclo de vida

Debe manejarse correctamente:

```text
START
  ↓
INITIALIZE
  ↓
READY
  ↓
RECORDING
  ↓
STOPPING
  ↓
FINALIZING
  ↓
COMPLETED
```

También:

```text
FAILED
CANCELLED
RECOVERY
PARTIAL
```

---

# 20. Suspensión y bloqueo

Debe determinarse el comportamiento frente a:

* bloqueo de sesión;
* suspensión;
* reanudación;
* cierre de sesión;
* cambio de usuario;
* apagado;
* reinicio.

El comportamiento deberá documentarse y probarse.

---

# 21. Drivers

Los drivers pueden modificar:

* captura;
* GPU;
* encoding;
* audio;
* cámara;
* estabilidad.

La matriz de drivers será `TBD`.

---

# 22. Compatibilidad degradada

SCREEN deberá poder identificar situaciones donde una capacidad no esté disponible.

Ejemplo conceptual:

```text
HARDWARE ENCODING UNAVAILABLE
          ↓
SOFTWARE ENCODING
```

siempre que el fallback sea técnicamente válido.

---

# 23. Diagnóstico

Los problemas específicos de Windows deberán poder identificarse sin registrar secretos ni contenido de grabaciones.

Los eventos relevantes deben poder correlacionarse con:

* sesión;
* componente;
* operación;
* resultado;
* error.

---

# 24. Seguridad

Debe aplicarse:

* mínimo privilegio;
* validación de entradas;
* protección de archivos;
* protección de configuración;
* protección de credenciales;
* manejo seguro de procesos;
* no ejecución innecesaria como administrador.

---

# 25. Rendimiento

Debe medirse:

* CPU;
* GPU;
* memoria;
* FPS;
* frames descartados;
* throughput;
* latencia;
* almacenamiento;
* estabilidad de sesiones largas.

---

# 26. Pruebas específicas

Deberán contemplarse:

* un monitor;
* múltiples monitores;
* diferentes resoluciones;
* diferentes escalas;
* GPU integrada;
* GPU dedicada;
* encoder hardware;
* fallback software;
* micrófono conectado/desconectado;
* cámara conectada/desconectada;
* almacenamiento insuficiente;
* permisos denegados;
* bloqueo;
* suspensión;
* recuperación.

---

# 27. Gaps

| ID          | Gap                                    | Estado  |
| ----------- | -------------------------------------- | ------- |
| GAP-WIN-001 | Definir versión mínima                 | OPEN    |
| GAP-WIN-002 | Definir arquitecturas CPU              | OPEN    |
| GAP-WIN-003 | Seleccionar mecanismo de captura       | OPEN    |
| GAP-WIN-004 | Seleccionar mecanismo de audio         | OPEN    |
| GAP-WIN-005 | Seleccionar integración de cámara      | OPEN    |
| GAP-WIN-006 | Definir backend GPU                    | OPEN    |
| GAP-WIN-007 | Definir encoders                       | OPEN    |
| GAP-WIN-008 | Definir comportamiento ante suspensión | OPEN    |
| GAP-WIN-009 | Definir matriz de hardware             | OPEN    |
| GAP-WIN-010 | Crear pruebas Windows                  | BLOCKED |

---

# 28. Estado actual

```text
DOCUMENTADO:    YES
IMPLEMENTADO:   NO
PROBADO:        NO
VALIDADO:       NO
CERTIFICADO:    NO
```

---

# 29. Regla

> Windows es una plataforma objetivo, no una plataforma certificada, hasta que exista evidencia reproducible que demuestre el soporte declarado.
