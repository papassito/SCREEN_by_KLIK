# FASE 08 — CAMERA

## SCREEN by KLIK

**Producto:** SCREEN by KLIK  
**Fase:** PHASE-08  
**Nombre:** CAMERA  
**Propósito:** Integración opcional de cámara en la sesión de grabación  
**Plataforma inicial:** Windows  
**Lenguaje objetivo:** Go  
**Estado:** PLANNED  
**Implementación:** NOT IMPLEMENTED  
**Pruebas:** NOT EXECUTED  
**Validación:** NOT VALIDATED  
**Certificación:** NOT CERTIFIED  

---

# 1. PROPÓSITO

La FASE 08 define la integración de una cámara como fuente audiovisual opcional de SCREEN by KLIK.

La cámara debe poder incorporarse a una sesión de grabación sin convertirla en un requisito para grabar pantalla.

El diseño debe contemplar:

- detección de cámaras;
- selección de dispositivo;
- disponibilidad;
- formatos;
- resolución;
- frame rate;
- captura;
- timestamps;
- buffering;
- procesamiento;
- composición;
- cambio de dispositivo;
- desconexión;
- errores;
- recuperación;
- privacidad;
- rendimiento;
- pruebas.

---

# 2. OBJETIVO

Permitir conceptualmente:

```text
SCREEN
   +
CAMERA
   ↓
COMPOSED VIDEO
   ↓
ENCODING
```

La cámara será **OPCIONAL**.

Una máquina sin cámara funcional debe seguir pudiendo utilizar SCREEN para grabar pantalla.

---

# 3. ALCANCE

Incluye:

- enumeración de cámaras;
- identificación;
- disponibilidad;
- selección;
- configuración;
- adquisición de frames;
- timing;
- buffering;
- procesamiento;
- composición;
- integración con Synchronization;
- errores;
- recuperación;
- privacidad;
- rendimiento;
- pruebas;
- evidencia.

---

# 4. FUERA DE ALCANCE

No incluye directamente:

- captura de pantalla;
- detección de displays;
- audio;
- micrófono;
- encoding;
- UI completa;
- overlays;
- anotaciones;
- hotkeys;
- instalación;
- packaging.

---

# 5. DETECCIÓN DE DISPOSITIVOS

Debe distinguirse:

```text
CAMERA DETECTED
      ≠
CAMERA AVAILABLE
      ≠
CAMERA OPENABLE
      ≠
CAMERA CAPTURABLE
      ≠
CAMERA VALIDATED
```

La presencia física de una cámara no garantiza que pueda utilizarse.

---

# 6. SELECCIÓN

El usuario deberá poder seleccionar una cámara disponible.

La política exacta de selección queda:

**TBD**

Debe contemplarse:

- una cámara;
- varias cámaras;
- cámara integrada;
- cámara externa;
- dispositivo ocupado;
- dispositivo desconectado.

---

# 7. FORMATOS

El sistema deberá determinar qué formatos soporta realmente cada dispositivo.

Conceptualmente:

```text
RESOLUTION
FRAME RATE
PIXEL FORMAT
COLOR FORMAT
```

Los valores concretos permanecen:

**TBD**

No se deberá asumir que todas las cámaras soportan las mismas combinaciones.

---

# 8. CAPTURE

La captura deberá producir frames con:

- datos;
- dimensiones;
- formato;
- timestamp;
- metadatos necesarios.

Debe garantizarse ownership correcto de los buffers.

---

# 9. TIMING

Cada frame de cámara debe tener información temporal suficiente para su integración.

Debe evitarse:

- frames sin timestamp;
- timestamps regresivos;
- duplicaciones no controladas;
- desincronización;
- acumulación de latencia.

La sincronización A/V corresponde al subsistema de Synchronization.

---

# 10. BUFFERING

Los buffers deberán ser acotados.

Debe contemplarse:

```text
CAMERA FAST
CAMERA SLOW
PROCESSING SLOW
ENCODING SLOW
```

La política de backpressure queda:

**TBD**

No se permitirá crecimiento indefinido de memoria.

---

# 11. COMPOSICIÓN

La cámara podrá incorporarse visualmente al video principal.

Conceptualmente:

```text
SCREEN FRAME
     +
CAMERA FRAME
     ↓
PROCESSING
     ↓
COMPOSED FRAME
```

La posición, tamaño, forma y estilo quedan:

**TBD**

---

# 12. CONFIGURACIÓN

Opciones conceptuales:

- cámara habilitada;
- dispositivo;
- resolución;
- frame rate;
- posición;
- tamaño;
- visibilidad;
- comportamiento ante fallo.

Los nombres definitivos de configuración:

**TBD**

---

# 13. DESCONEXIÓN

Debe contemplarse la desconexión de la cámara durante una grabación.

Posibles políticas:

```text
CAMERA LOST
    ↓
DISABLE CAMERA
    ↓
CONTINUE SCREEN RECORDING
```

o:

```text
CAMERA LOST
    ↓
SESSION FAILURE
```

La política definitiva:

**TBD**

No deberá asumirse una política de recuperación sin pruebas.

---

# 14. PRIVACIDAD

La cámara requiere especial atención de privacidad.

Debe existir:

- activación explícita;
- indicación clara de uso;
- control de dispositivo;
- ausencia de transmisión externa;
- almacenamiento local.

SCREEN no deberá activar una cámara sin que exista una configuración/acción que lo autorice.

---

# 15. SEGURIDAD

La cámara debe permanecer dentro del límite local de la aplicación.

No deberá:

- transmitir imágenes;
- activar dispositivos arbitrariamente;
- acceder a dispositivos no seleccionados;
- mantener recursos después de finalizar la sesión.

---

# 16. CONCURRENCIA

Debe definirse claramente:

- quién abre la cámara;
- quién captura;
- quién detiene;
- quién libera;
- quién recibe errores.

Debe evitarse:

- double close;
- resource leaks;
- race conditions;
- acceso después de liberar.

---

# 17. RENDIMIENTO

Se deberán medir:

- CPU;
- memoria;
- frame rate;
- latencia;
- coste de composición;
- impacto sobre captura de pantalla;
- impacto sobre encoding.

No se declararán cifras sin evidencia.

---

# 18. ERRORES

Categorías mínimas:

- cámara inexistente;
- dispositivo ocupado;
- formato no soportado;
- inicialización fallida;
- captura fallida;
- frame inválido;
- desconexión;
- timeout;
- error de composición.

---

# 19. RECOVERY

Debe existir una estrategia para determinar si un fallo de cámara:

- desactiva solamente la cámara;
- degrada la sesión;
- obliga a detener la grabación.

La decisión permanece:

**TBD**

---

# 20. PRUEBAS

Deberán contemplarse:

### Dispositivos

- cámara integrada;
- cámara externa;
- múltiples cámaras;
- cámara ausente.

### Configuración

- resoluciones;
- frame rates;
- formatos.

### Sesión

- inicio;
- grabación;
- pausa;
- resume;
- stop.

### Fallos

- desconexión;
- dispositivo ocupado;
- formato inválido;
- pérdida de captura.

### Rendimiento

- sesión prolongada;
- cámara + pantalla;
- cámara + audio;
- cámara + encoding.

---

# 21. CRITERIOS DE ENTRADA

- Recording Engine definido;
- Processing definido;
- Synchronization definido;
- contratos audiovisuales disponibles;
- plataforma Windows documentada.

---

# 22. CRITERIOS DE SALIDA

La fase requiere:

- detección validada;
- selección validada;
- captura validada;
- timing validado;
- composición validada;
- errores probados;
- recuperación probada;
- privacidad validada;
- rendimiento medido;
- evidencia reproducible.

---

# 23. TRAZABILIDAD

```text
REQUIREMENT
   ↓
ARCHITECTURE
   ↓
MODULE
   ↓
COMPONENT
   ↓
PHASE-08
   ↓
IMPLEMENTATION
   ↓
TEST
   ↓
EVIDENCE
   ↓
VALIDATION
   ↓
CERTIFICATION
```

---

# 24. DECISIONES

| Decisión | Estado |
|---|---|
| Cámara opcional | DEFINIDO |
| Cámara integrada y externa | REQUIRED |
| Múltiples cámaras | TBD |
| Composición | REQUIRED |
| Synchronization | REQUIRED |
| Camera API | TBD |
| Formatos | TBD |
| Resolución | TBD |
| Frame rate | TBD |
| Posición | TBD |
| Política de desconexión | TBD |

---

# 25. ESTADO ACTUAL

**FASE 08 — PLANNED**

No existe evidencia para declarar implementación, pruebas, validación o certificación.

---

# 26. REGLA SUPREMA

> **La cámara es una capacidad opcional de SCREEN; su fallo no deberá comprometer la grabación de pantalla salvo que una política explícitamente validada determine lo contrario.**