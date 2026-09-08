# FASE 10 — ANNOTATIONS

## SCREEN by KLIK

**Producto:** SCREEN by KLIK  
**Fase:** PHASE-10  
**Nombre:** ANNOTATIONS  
**Propósito:** Incorporación de anotaciones visuales sobre el contenido grabado  
**Plataforma inicial:** Windows  
**Lenguaje objetivo:** Go  
**Estado:** PLANNED  
**Implementación:** NOT IMPLEMENTED  
**Pruebas:** NOT EXECUTED  
**Validación:** NOT VALIDATED  
**Certificación:** NOT CERTIFIED  

---

# 1. PROPÓSITO

La FASE 10 define las anotaciones visuales que pueden incorporarse durante una sesión de SCREEN.

Las anotaciones permiten señalar, remarcar o explicar visualmente partes del contenido.

Ejemplos conceptuales:

- líneas;
- flechas;
- rectángulos;
- círculos;
- texto;
- resaltados.

La lista definitiva:

**TBD**

---

# 2. OBJETIVO

Permitir que una anotación pueda:

- crearse;
- posicionarse;
- modificarse;
- mostrarse;
- ocultarse;
- desaparecer;
- integrarse temporalmente;
- componerse sobre el video.

---

# 3. ALCANCE

Incluye:

- modelo de anotación;
- tipos;
- geometría;
- posición;
- tamaño;
- estilo;
- color;
- transparencia;
- duración;
- lifecycle;
- composición;
- rendimiento;
- errores;
- pruebas;
- evidencia.

---

# 4. FUERA DE ALCANCE

No incluye:

- captura;
- encoding;
- audio;
- cámara;
- hotkeys;
- UI completa;
- edición posterior avanzada;
- video editor.

Las anotaciones son parte del proceso de grabación/composición.

---

# 5. MODELO

Conceptualmente:

```text
ANNOTATION
├── TYPE
├── GEOMETRY
├── STYLE
├── VISIBILITY
├── START TIME
└── END TIME
```

La estructura concreta:

**TBD**

---

# 6. TIPOS

Tipos candidatos:

```text
ARROW
LINE
RECTANGLE
CIRCLE
TEXT
HIGHLIGHT
```

Estos tipos son **PROPUESTOS**, no funcionalidades implementadas.

---

# 7. COORDENADAS

Las anotaciones deben utilizar un sistema de coordenadas compatible con el frame.

Debe contemplarse:

- pantalla;
- región;
- ventana;
- escalado;
- DPI;
- resolución final.

---

# 8. TIMING

Una anotación puede ser:

- permanente;
- temporal;
- activada durante un periodo;
- eliminada antes del final.

Debe preservarse su relación temporal con el video.

---

# 9. ESTADO

Conceptualmente:

```text
CREATED
 ↓
ACTIVE
 ↓
UPDATED
 ↓
HIDDEN / REMOVED
```

El modelo exacto:

**TBD**

---

# 10. COMPOSICIÓN

```text
FRAME
 +
ANNOTATIONS
 ↓
COMPOSITED FRAME
```

La composición deberá ser determinista.

---

# 11. RENDIMIENTO

Debe evaluarse el impacto de:

- número de anotaciones;
- complejidad geométrica;
- texto;
- transparencia;
- cambios por frame;
- resolución.

No se establecerán límites numéricos sin pruebas.

---

# 12. CONFIGURACIÓN

Las opciones concretas quedan:

**TBD**

Podrán contemplarse:

- tipo;
- tamaño;
- posición;
- estilo;
- duración;
- visibilidad.

---

# 13. ERRORES

Posibles errores:

- geometría inválida;
- coordenadas fuera de rango;
- recurso de texto no disponible;
- fallo de render;
- configuración inválida.

---

# 14. RECOVERY

Un error de anotación no debería necesariamente detener la grabación completa.

La política de degradación:

**TBD**

---

# 15. SEGURIDAD

El sistema no deberá permitir que una anotación:

- ejecute código;
- acceda a recursos arbitrarios;
- establezca conexiones;
- modifique el sistema.

---

# 16. PRIVACIDAD

Las anotaciones pueden contener texto introducido por el usuario.

Ese contenido debe permanecer local y formar parte de la grabación únicamente cuando el usuario lo haya creado.

---

# 17. PRUEBAS

Se deberán probar:

- cada tipo;
- múltiples anotaciones;
- movimiento;
- duración;
- eliminación;
- texto;
- escalado;
- DPI;
- resolución;
- alta carga;
- sesiones prolongadas;
- errores.

---

# 18. INTEGRACIÓN

```text
USER ACTION
     ↓
ANNOTATION
     ↓
PROCESSING
     ↓
SYNCHRONIZATION
     ↓
ENCODING
```

La UI y Hotkeys podrán generar acciones posteriormente, pero no forman parte de la implementación de esta fase.

---

# 19. CRITERIOS DE ENTRADA

- Processing definido;
- modelo de coordenadas disponible;
- lifecycle de Recording definido;
- contrato temporal disponible.

---

# 20. CRITERIOS DE SALIDA

- modelo validado;
- tipos implementados y probados;
- timing validado;
- composición validada;
- rendimiento medido;
- errores probados;
- evidencia reproducible.

---

# 21. TRAZABILIDAD

```text
REQUIREMENT
   ↓
ARCHITECTURE
   ↓
MODULE
   ↓
COMPONENT
   ↓
PHASE-10
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

# 22. DECISIONES

| Decisión | Estado |
|---|---|
| Annotations como composición | DEFINIDO |
| Timing | REQUIRED |
| Geometría | REQUIRED |
| Texto | PROPOSED |
| Flechas | PROPOSED |
| Líneas | PROPOSED |
| Rectángulos | PROPOSED |
| Círculos | PROPOSED |
| Highlight | PROPOSED |
| Modelo definitivo | TBD |
| API de render | TBD |
| Política de fallo | TBD |

---

# 23. ESTADO ACTUAL

**FASE 10 — PLANNED**

No existe evidencia para declarar implementación, pruebas, validación o certificación.

---

# 24. REGLA SUPREMA

> **Las anotaciones deben ser temporales, reproducibles y espacialmente correctas; ninguna capacidad se considerará terminada sin evidencia de su comportamiento real.**