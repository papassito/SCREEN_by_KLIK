# FASE 07 — CURSOR

## SCREEN by KLIK

**Producto:** SCREEN by KLIK  
**Fase:** PHASE-07  
**Nombre:** CURSOR  
**Propósito:** Captura, tratamiento y composición opcional del cursor del usuario  
**Plataforma inicial:** Windows  
**Lenguaje objetivo:** Go  
**Estado:** PLANNED  
**Implementación:** NOT IMPLEMENTED  
**Pruebas:** NOT EXECUTED  
**Validación:** NOT VALIDATED  
**Certificación:** NOT CERTIFIED  

---

# 1. PROPÓSITO

La FASE 07 define el tratamiento del cursor dentro de SCREEN by KLIK.

El cursor debe considerarse una señal visual adicional asociada a la captura de pantalla.

La fase debe resolver conceptualmente:

- detección de posición;
- visibilidad;
- estado;
- apariencia;
- integración con frames;
- escalado;
- DPI;
- múltiples monitores;
- composición;
- opciones del usuario;
- comportamiento durante pausa;
- rendimiento;
- sincronización;
- errores;
- pruebas.

---

# 2. OBJETIVO

Permitir que SCREEN pueda producir una grabación en la que el cursor:

- aparezca;
- no aparezca;
- pueda representarse correctamente;
- conserve posición temporal;
- respete escalado;
- respete múltiples monitores;
- pueda integrarse con el frame capturado.

La política exacta de personalización queda:

**TBD**

---

# 3. POSICIÓN ARQUITECTÓNICA

Conceptualmente:

```text
CAPTURED FRAME
      +
CURSOR STATE
      ↓
PROCESSING
      ↓
ENCODING
```

El cursor no debe alterar la responsabilidad del Capture Engine.

Capture adquiere la imagen.

Cursor proporciona información sobre el cursor.

Processing realiza la composición cuando corresponda.

---

# 4. ALCANCE

Incluye:

- posición;
- visibilidad;
- identificación;
- estado;
- timestamps;
- composición;
- escalado;
- DPI;
- multimonitor;
- configuración;
- rendimiento;
- errores;
- pruebas;
- evidencia.

---

# 5. FUERA DE ALCANCE

No incluye directamente:

- captura de pantalla;
- detección de displays;
- encoding;
- audio;
- cámara;
- anotaciones;
- overlays;
- hotkeys;
- UI completa.

---

# 6. VISIBILIDAD

Debe distinguirse:

```text
CURSOR EXISTS
CURSOR VISIBLE
CURSOR CAPTURED
CURSOR COMPOSITED
```

Estas condiciones no son necesariamente equivalentes.

---

# 7. POSICIÓN

La posición deberá estar asociada al sistema de coordenadas utilizado por la captura.

Debe contemplarse:

- coordenadas absolutas;
- coordenadas relativas;
- múltiples monitores;
- monitores con posiciones negativas;
- DPI/scaling;
- cambio de display.

No se deberá asumir que las coordenadas lógicas y físicas son idénticas.

---

# 8. MULTIMONITOR

Debe soportarse conceptualmente:

```text
DISPLAY A
DISPLAY B
DISPLAY C
```

incluyendo configuraciones donde:

- el monitor principal no esté en el origen;
- existan coordenadas negativas;
- exista diferente scaling;
- el cursor cambie entre displays.

---

# 9. DPI Y ESCALADO

El cursor debe mantener una relación espacial correcta con el frame.

Debe considerarse:

```text
SCREEN COORDINATES
       ≠
LOGICAL COORDINATES
       ≠
PHYSICAL PIXELS
```

La conversión concreta queda:

**TBD**

---

# 10. APARIENCIA

El sistema deberá considerar:

- forma;
- tamaño;
- visibilidad;
- cambios dinámicos;
- estados visuales.

No se asumirá una única apariencia de cursor.

La estrategia exacta para obtener/renderizar el cursor queda:

**TBD**

---

# 11. COMPOSICIÓN

Cuando el cursor sea visible en el resultado:

```text
FRAME
 +
CURSOR
 ↓
COMPOSITED FRAME
```

La composición debe respetar:

- posición;
- escala;
- transparencia;
- clipping;
- resolución;
- timing.

---

# 12. TIMING

La posición del cursor debe asociarse temporalmente al frame correspondiente.

Debe evitarse:

- cursor adelantado;
- cursor retrasado;
- cursor congelado;
- posición incorrecta;
- timestamp inválido.

La estrategia exacta de sincronización queda:

**TBD**

---

# 13. CAMBIO DE CURSOR

El cursor puede cambiar durante una sesión.

La arquitectura deberá permitir detectar o representar cambios cuando corresponda.

Debe contemplarse:

```text
CURSOR A
   ↓
CURSOR B
   ↓
CURSOR C
```

No deberá asumirse que el cursor permanece constante durante toda la sesión.

---

# 14. CONFIGURACIÓN

Conceptualmente deberá existir una configuración equivalente a:

```text
CURSOR ENABLED
CURSOR DISPLAY
CURSOR SIZE
CURSOR HIGHLIGHT
CURSOR STYLE
```

Los nombres definitivos y las opciones concretas:

**TBD**

No se deben inventar parámetros públicos antes de definir el contrato correspondiente.

---

# 15. RENDIMIENTO

El procesamiento del cursor no debe generar una carga desproporcionada.

Debe medirse:

- CPU;
- memoria;
- coste de composición;
- impacto sobre frame rate;
- impacto sobre encoding;
- estabilidad.

---

# 16. ERROR HANDLING

Posibles condiciones:

- cursor no detectable;
- información incompleta;
- cambio de display;
- coordenadas inválidas;
- recurso visual no disponible;
- fallo de composición.

Un fallo del cursor no debe necesariamente destruir la grabación completa si existe una política de degradación segura.

La política exacta queda:

**TBD**

---

# 17. RECOVERY

Debe contemplarse:

```text
CURSOR FAILURE
      ↓
DISABLE CURSOR COMPOSITION
      ↓
CONTINUE RECORDING
```

siempre que sea técnicamente seguro y esté definido por contrato.

No se declarará esta recuperación como garantizada hasta ser probada.

---

# 18. CONCURRENCIA

Debe evitarse que:

- captura;
- cursor;
- processing;
- recording

compitan de manera insegura por recursos compartidos.

Las responsabilidades deberán permanecer claramente separadas.

---

# 19. PRIVACIDAD

El cursor puede revelar:

- actividad del usuario;
- selección de elementos;
- interacción con aplicaciones.

No debe transmitirse esta información externamente.

---

# 20. SEGURIDAD

El subsistema no debe:

- ejecutar contenido proveniente del cursor;
- cargar recursos no confiables;
- introducir conexiones externas;
- modificar aplicaciones capturadas.

---

# 21. PRUEBAS

Se deberán contemplar:

### Posición

- centro;
- esquinas;
- bordes;
- coordenadas negativas.

### Monitores

- uno;
- dos;
- múltiples;
- diferentes DPI;
- cambio de monitor.

### Apariencia

- diferentes cursores;
- cambio de cursor;
- visibilidad.

### Timing

- movimiento rápido;
- movimiento lento;
- cursor estacionario;
- cambios frecuentes.

### Sesiones

- corta;
- prolongada.

### Fallos

- cursor no disponible;
- datos inválidos;
- fallo de composición.

---

# 22. INTEGRACIÓN

Relación:

```text
PHASE 02
DISPLAY DETECTION
      ↓
PHASE 03
CAPTURE
      ↓
PHASE 07
CURSOR
      ↓
PROCESSING
      ↓
PHASE 05
ENCODING
```

La FASE 07 debe integrarse sin modificar indebidamente las responsabilidades de Capture.

---

# 23. CRITERIOS DE ENTRADA

- Capture definido;
- Processing definido;
- coordenadas y DPI documentados;
- contrato de frame disponible;
- modelo temporal disponible.

---

# 24. CRITERIOS DE SALIDA

La fase requiere:

- detección/obtención validada;
- posición validada;
- multimonitor validado;
- DPI validado;
- composición validada;
- timing validado;
- configuración validada;
- errores probados;
- rendimiento medido;
- evidencia reproducible.

---

# 25. EVIDENCIA

Debe existir evidencia de:

- cursor visible;
- cursor oculto;
- múltiples monitores;
- DPI;
- diferentes posiciones;
- movimiento;
- cambios;
- sesiones prolongadas;
- degradación/fallo cuando corresponda.

---

# 26. TRAZABILIDAD

```text
REQUIREMENT
   ↓
ARCHITECTURE
   ↓
MODULE
   ↓
COMPONENT
   ↓
PHASE-07
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

# 27. RIESGOS

- coordenadas incorrectas;
- DPI mismatch;
- cursor desfasado;
- cambio de cursor no detectado;
- composición costosa;
- incompatibilidades de Windows;
- pérdida de información;
- comportamiento inconsistente entre displays.

---

# 28. DECISIONES

| Decisión | Estado |
|---|---|
| Cursor como señal visual independiente | DEFINIDO |
| Cursor configurable | REQUIRED |
| Multimonitor | REQUIRED |
| DPI/scaling | REQUIRED |
| Composición | REQUIRED |
| API Windows | TBD |
| Método de obtención | TBD |
| Highlight | TBD |
| Estilo | TBD |
| Política de fallback | TBD |

---

# 29. ESTADO ACTUAL

**FASE 07 — PLANNED**

No existe evidencia para declarar implementación, pruebas, validación o certificación.

---

# 30. REGLA SUPREMA

> **El cursor debe aparecer en la grabación exactamente cuando y donde corresponda; cualquier afirmación de precisión deberá estar respaldada por pruebas reales.**