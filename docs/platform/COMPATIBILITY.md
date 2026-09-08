# SCREEN by KLIK — Platform Compatibility

**Documento:** `docs/platform/COMPATIBILITY.md`
**Proyecto:** SCREEN by KLIK
**Estado:** `PLANNED`
**Versión documental:** `0.1.0-alpha`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADA`
**Certificación:** `NO CERTIFICADA`

---

## 1. Propósito

Este documento define el marco general de compatibilidad de **SCREEN by KLIK** con las plataformas objetivo del producto.

Su función es establecer:

* qué significa ser compatible;
* qué dimensiones deben evaluarse;
* cómo se clasifican los estados de compatibilidad;
* cómo se relacionan las plataformas con las capacidades del producto;
* cómo se documentan limitaciones;
* cómo se demuestra la compatibilidad mediante evidencia;
* cómo se evita declarar soporte sin pruebas suficientes.

Este documento es **transversal**.

No sustituye las especificaciones particulares de:

* `platform/DESKTOP/WINDOWS.md`
* `platform/DESKTOP/LINUX.md`
* `platform/DESKTOP/MACOS.md`
* `platform/MOBILE/ANDROID.md`
* `platform/MOBILE/IOS.md`

---

# 2. Plataformas objetivo

SCREEN by KLIK contempla las siguientes familias:

| Familia | Plataforma | Documento    | Estado    |
| ------- | ---------- | ------------ | --------- |
| Desktop | Windows    | `WINDOWS.md` | `PLANNED` |
| Desktop | Linux      | `LINUX.md`   | `PLANNED` |
| Desktop | macOS      | `MACOS.md`   | `PLANNED` |
| Mobile  | Android    | `ANDROID.md` | `PLANNED` |
| Mobile  | iOS        | `IOS.md`     | `PLANNED` |

La existencia de un documento de plataforma **no implica soporte operativo**.

---

# 3. Principio fundamental

SCREEN by KLIK debe distinguir estrictamente entre:

```text
DISEÑADO PARA
        ≠
TEÓRICAMENTE COMPATIBLE
        ≠
IMPLEMENTADO
        ≠
PROBADO
        ≠
VALIDADO
        ≠
CERTIFICADO
        ≠
SOPORTADO EN PRODUCCIÓN
```

Una plataforma solamente podrá declararse soportada cuando exista evidencia suficiente para justificar dicha afirmación.

---

# 4. Dimensiones de compatibilidad

La compatibilidad será evaluada como mínimo en las siguientes dimensiones.

## 4.1 Sistema operativo

Debe evaluarse:

* versión;
* edición cuando sea relevante;
* arquitectura;
* actualizaciones;
* requisitos mínimos;
* restricciones del sistema;
* APIs disponibles;
* permisos;
* ciclo de vida.

---

## 4.2 CPU

Debe contemplarse:

* arquitectura;
* instrucciones requeridas;
* número de núcleos;
* rendimiento mínimo;
* compatibilidad con binarios;
* limitaciones de arquitectura.

Las arquitecturas concretas soportadas son `TBD`.

---

## 4.3 GPU

Debe contemplarse:

* presencia de GPU;
* controlador;
* capacidad de procesamiento;
* aceleración disponible;
* encoder disponible;
* memoria gráfica;
* compatibilidad con el backend seleccionado.

La presencia de una GPU no implica automáticamente aceleración utilizable.

---

## 4.4 Pantallas

Debe evaluarse:

* una pantalla;
* múltiples pantallas;
* resoluciones;
* escalado;
* DPI;
* orientación;
* frecuencia;
* cambios dinámicos;
* desconexión/conexión de pantallas.

---

## 4.5 Captura

Debe determinarse individualmente:

* pantalla completa;
* ventana;
* región;
* monitor específico;
* múltiples monitores;
* cambios de resolución;
* cambios de escala;
* cambios de fuente;
* captura durante cambios del sistema.

La disponibilidad exacta depende de la plataforma.

---

# 5. Audio

La compatibilidad de audio debe considerar:

* dispositivos de entrada;
* dispositivos de salida;
* micrófonos;
* captura del sistema;
* mezcla;
* selección de dispositivo;
* cambios dinámicos;
* frecuencia de muestreo;
* canales;
* latencia;
* pérdida de dispositivo.

No se debe asumir que todas las plataformas proporcionan el mismo acceso al audio del sistema.

---

# 6. Cámara

La cámara será evaluada respecto a:

* detección;
* selección;
* resolución;
* formato;
* adquisición;
* permisos;
* cambios de dispositivo;
* desconexión;
* errores;
* ciclo de vida.

La cámara puede ser opcional dependiendo del producto y plataforma.

---

# 7. Encoding

Debe evaluarse:

* codecs disponibles;
* formatos;
* encoder por software;
* encoder por hardware;
* parámetros;
* perfiles;
* compatibilidad;
* rendimiento;
* calidad;
* estabilidad;
* fallback.

La compatibilidad de un codec no implica necesariamente compatibilidad con hardware encoding.

---

# 8. Almacenamiento

Debe contemplarse:

* filesystem;
* espacio disponible;
* permisos;
* rutas;
* nombres de archivos;
* caracteres especiales;
* archivos grandes;
* escritura sostenida;
* errores de I/O;
* almacenamiento extraíble;
* almacenamiento limitado.

En plataformas móviles las restricciones de almacenamiento requieren evaluación específica.

---

# 9. Permisos

La compatibilidad debe considerar permisos para:

* captura de pantalla;
* audio;
* micrófono;
* cámara;
* almacenamiento;
* archivos;
* dispositivos;
* ejecución;
* funcionalidades especiales.

Los permisos deben solicitarse solamente cuando sean necesarios.

---

# 10. Ciclo de vida

Debe evaluarse el comportamiento durante:

* inicio;
* grabación;
* pausa;
* reanudación;
* detención;
* suspensión;
* reanudación del sistema;
* bloqueo;
* cambio de usuario;
* cierre de sesión;
* finalización;
* terminación inesperada.

Esto es especialmente relevante en plataformas móviles.

---

# 11. Compatibilidad funcional

La compatibilidad funcional responde:

> ¿La característica existe y funciona correctamente en esta plataforma?

Ejemplos:

* captura de pantalla;
* selección de región;
* grabación;
* audio;
* micrófono;
* cámara;
* cursor;
* anotaciones;
* overlays;
* hotkeys;
* encoding;
* exportación.

---

# 12. Compatibilidad de rendimiento

Una característica puede funcionar y aun así presentar rendimiento insuficiente.

Debe diferenciarse:

```text
FUNCIONA
        ≠
FUNCIONA CON RENDIMIENTO ACEPTABLE
```

Deben considerarse:

* FPS;
* CPU;
* GPU;
* RAM;
* latencia;
* dropped frames;
* throughput;
* temperatura;
* consumo energético;
* almacenamiento.

---

# 13. Compatibilidad de estabilidad

Debe evaluarse:

* sesiones cortas;
* sesiones prolongadas;
* carga elevada;
* almacenamiento casi lleno;
* pérdida de dispositivos;
* cambios de resolución;
* cambios de audio;
* fallos del encoder;
* recuperación.

---

# 14. Estados

Los estados oficiales de compatibilidad son:

| Estado         | Significado                                  |
| -------------- | -------------------------------------------- |
| `SUPPORTED`    | Soporte declarado y respaldado por evidencia |
| `VERIFIED`     | Verificado bajo una configuración concreta   |
| `COMPATIBLE`   | Funciona según pruebas disponibles           |
| `PARTIAL`      | Compatibilidad limitada                      |
| `UNSUPPORTED`  | No soportado                                 |
| `UNKNOWN`      | Información insuficiente                     |
| `UNDETERMINED` | No puede determinarse todavía                |
| `BLOCKED`      | La validación está bloqueada                 |

---

# 15. Matriz de compatibilidad

La matriz deberá evolucionar conforme exista implementación y evidencia.

| Plataforma | Captura | Audio | Cámara | Encoding | GPU | UI  | Estado  |
| ---------- | ------- | ----- | ------ | -------- | --- | --- | ------- |
| Windows    | TBD     | TBD   | TBD    | TBD      | TBD | TBD | PLANNED |
| Linux      | TBD     | TBD   | TBD    | TBD      | TBD | TBD | PLANNED |
| macOS      | TBD     | TBD   | TBD    | TBD      | TBD | TBD | PLANNED |
| Android    | TBD     | TBD   | TBD    | TBD      | TBD | TBD | PLANNED |
| iOS        | TBD     | TBD   | TBD    | TBD      | TBD | TBD | PLANNED |

`TBD` significa que todavía no existe una decisión o evidencia suficiente.

---

# 16. Matriz de configuración

La compatibilidad debe evaluarse por configuración real cuando sea necesario:

```text
PLATAFORMA
+ VERSIÓN
+ ARQUITECTURA
+ CPU
+ GPU
+ DRIVER
+ PANTALLA
+ AUDIO
+ CÁMARA
+ CODEC
+ CONFIGURACIÓN
= CONFIGURACIÓN DE PRUEBA
```

Una certificación sobre una configuración no debe extrapolarse automáticamente a todas las demás.

---

# 17. Pruebas negativas

La compatibilidad debe incluir pruebas de fallo.

Ejemplos:

* GPU incompatible;
* encoder no disponible;
* cámara ausente;
* micrófono desconectado;
* almacenamiento insuficiente;
* permisos denegados;
* pantalla desconectada;
* cambio de resolución;
* dispositivo de audio perdido;
* interrupción durante escritura;
* encoder fallido.

---

# 18. Privacidad y seguridad

Una característica compatible técnicamente no se considerará aceptable si viola los requisitos de seguridad o privacidad.

Las plataformas deberán respetar:

* mínimo privilegio;
* permisos explícitos;
* protección de datos;
* ausencia de captura no autorizada;
* manejo seguro de archivos;
* protección de credenciales;
* protección de logs;
* eliminación controlada.

---

# 19. Evidencia

Toda afirmación importante de compatibilidad deberá poder relacionarse con:

```text
PLATAFORMA
→ CONFIGURACIÓN
→ CARACTERÍSTICA
→ PRUEBA
→ RESULTADO
→ EVIDENCIA
→ ESTADO
```

No se utilizarán simulaciones como evidencia de soporte real.

---

# 20. Política Zero-Synthetic

SCREEN by KLIK no debe convertir:

```text
SIN PRUEBA
```

en:

```text
COMPATIBLE
```

Ni:

```text
NO DISPONIBLE
```

en:

```text
FUNCIONA
```

Los estados `UNKNOWN`, `UNDETERMINED` y `BLOCKED` son estados válidos.

---

# 21. Certificación

La certificación debe realizarse por plataforma y configuración cuando corresponda.

Certificar Windows no certifica Linux.

Certificar Android no certifica iOS.

Certificar una GPU no certifica todas las GPUs.

Certificar una versión del sistema no certifica automáticamente todas las versiones.

---

# 22. Relación documental

```text
ARCHITECTURE
      │
      ▼
COMPATIBILITY
      │
 ┌────┼────┬────┬────┐
 ▼    ▼    ▼    ▼    ▼
WIN LINUX MAC ANDROID IOS
      │
      ▼
TECHNICAL
      │
      ▼
TESTING
      │
      ▼
EVIDENCE
      │
      ▼
CERTIFICATION
```

---

# 23. Gaps

| ID           | Gap                                      | Estado  |
| ------------ | ---------------------------------------- | ------- |
| GAP-COMP-001 | Definir versiones mínimas por plataforma | OPEN    |
| GAP-COMP-002 | Definir arquitecturas soportadas         | OPEN    |
| GAP-COMP-003 | Definir matriz de captura                | OPEN    |
| GAP-COMP-004 | Definir matriz de audio                  | OPEN    |
| GAP-COMP-005 | Definir matriz de codecs                 | OPEN    |
| GAP-COMP-006 | Definir matriz de hardware encoding      | OPEN    |
| GAP-COMP-007 | Definir dispositivos de prueba           | OPEN    |
| GAP-COMP-008 | Definir criterios de rendimiento         | OPEN    |
| GAP-COMP-009 | Definir criterios de certificación       | OPEN    |
| GAP-COMP-010 | Crear evidencia de compatibilidad        | BLOCKED |

---

# 24. Estado actual

```text
DOCUMENTADO:    YES
IMPLEMENTADO:   NO
PROBADO:        NO
VALIDADO:       NO
CERTIFICADO:    NO
```

---

# 25. Evolución

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
SUPPORTED
```

---

# 26. Regla suprema

> SCREEN by KLIK no declarará compatibilidad basándose únicamente en intención, documentación teórica o expectativa técnica.

**La compatibilidad debe demostrarse.**
