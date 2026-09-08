# FASE 09 — OVERLAYS

## SCREEN by KLIK

**Producto:** SCREEN by KLIK  
**Fase:** PHASE-09  
**Nombre:** OVERLAYS  
**Propósito:** Definición y composición de elementos visuales superpuestos durante la grabación  
**Plataforma inicial:** Windows  
**Lenguaje objetivo:** Go  
**Estado:** PLANNED  
**Implementación:** NOT IMPLEMENTED  
**Pruebas:** NOT EXECUTED  
**Validación:** NOT VALIDATED  
**Certificación:** NOT CERTIFIED  

---

# 1. PROPÓSITO

La FASE 09 define el subsistema conceptual de overlays de SCREEN by KLIK.

Un overlay es un elemento visual que puede aparecer sobre el contenido grabado.

Ejemplos conceptuales:

- cámara;
- indicadores;
- elementos informativos;
- elementos visuales configurables.

Los overlays deben ser tratados como composición visual, no como parte de la captura original.

---

# 2. OBJETIVO

Permitir conceptualmente:

```text
CAPTURED CONTENT
      +
OVERLAY CONTENT
      ↓
COMPOSITION
      ↓
ENCODING
```

La composición debe ser determinista y temporalmente coherente.

---

# 3. ALCANCE

Incluye:

- modelo de overlay;
- lifecycle;
- posición;
- tamaño;
- visibilidad;
- composición;
- z-order;
- transparencia;
- timing;
- resolución;
- DPI;
- rendimiento;
- errores;
- configuración;
- pruebas;
- evidencia.

---

# 4. FUERA DE ALCANCE

No incluye directamente:

- captura de pantalla;
- cámara;
- cursor;
- anotaciones;
- encoding;
- UI completa;
- hotkeys;
- output.

La cámara puede proporcionar contenido a un overlay, pero Camera mantiene la responsabilidad sobre la captura del dispositivo.

---

# 5. MODELO

Conceptualmente:

```text
BASE FRAME
   │
   ├── Overlay A
   ├── Overlay B
   ├── Overlay C
   └── Overlay N
        │
        ▼
   COMPOSITED FRAME
```

El número máximo:

**TBD**

---

# 6. POSICIÓN

Debe soportarse una política consistente de coordenadas.

Debe contemplarse:

- resolución;
- scaling;
- DPI;
- multimonitor;
- región capturada;
- contenido escalado.

No se deberá asumir que las coordenadas de pantalla son idénticas a las coordenadas del frame final.

---

# 7. Z-ORDER

Cuando existan múltiples overlays deberá existir un orden determinista.

Conceptualmente:

```text
BASE
 ↓
OVERLAY 1
 ↓
OVERLAY 2
 ↓
OVERLAY N
```

La política exacta:

**TBD**

---

# 8. TRANSPARENCIA

Debe contemplarse:

- alpha;
- transparencia;
- elementos parcialmente transparentes;
- composición sobre video.

La implementación concreta queda:

**TBD**

---

# 9. TIMING

Un overlay puede:

- existir durante toda la sesión;
- aparecer;
- desaparecer;
- cambiar;
- reaccionar a eventos.

Los timestamps deben permitir determinar cuándo está activo.

---

# 10. RENDIMIENTO

La composición debe permanecer dentro de límites razonables de:

- CPU;
- GPU;
- memoria;
- tiempo por frame.

Debe evitarse reconstruir innecesariamente elementos estáticos en cada frame.

---

# 11. CONFIGURACIÓN

Opciones conceptuales:

- enabled;
- position;
- size;
- opacity;
- order;
- visibility;
- source.

Valores concretos:

**TBD**

---

# 12. ERRORES

Debe contemplarse:

- overlay inválido;
- posición inválida;
- recurso faltante;
- composición fallida;
- memoria insuficiente;
- formato incompatible.

---

# 13. RECOVERY

Un overlay no crítico debería poder degradarse sin destruir necesariamente la grabación.

Política definitiva:

**TBD**

---

# 14. SEGURIDAD

Los recursos utilizados por overlays deben validarse.

No deberá permitirse que un overlay:

- ejecute contenido;
- establezca conexiones externas;
- acceda arbitrariamente a archivos;
- modifique contenido fuera de su responsabilidad.

---

# 15. PRIVACIDAD

Los overlays pueden incorporar información potencialmente sensible.

La aplicación debe dejar claro qué información terminará dentro de la grabación.

---

# 16. CONCURRENCIA

Debe evitarse modificar un overlay mientras está siendo compuesto sin sincronización adecuada.

Debe existir ownership claro de:

- configuración;
- recursos;
- estado;
- composición.

---

# 17. PRUEBAS

Se deberán contemplar:

- overlay único;
- múltiples overlays;
- transparencia;
- cambios dinámicos;
- movimiento;
- escalado;
- DPI;
- resolución;
- sesión prolongada;
- errores;
- composición bajo carga.

---

# 18. INTEGRACIÓN

```text
CAPTURE
   ↓
PROCESSING
   ↑
OVERLAYS
   ↑
CAMERA / OTHER SOURCES
   ↓
SYNCHRONIZATION
   ↓
ENCODING
```

Processing mantiene la responsabilidad de composición.

---

# 19. CRITERIOS DE ENTRADA

- Processing definido;
- Camera disponible cuando corresponda;
- contrato de frames definido;
- modelo de coordenadas definido.

---

# 20. CRITERIOS DE SALIDA

- modelo validado;
- composición validada;
- timing validado;
- transparencia validada;
- errores probados;
- rendimiento medido;
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
PHASE-09
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
| Overlays como composición | DEFINIDO |
| Transparencia | REQUIRED |
| Z-order | REQUIRED |
| Timing | REQUIRED |
| DPI/scaling | REQUIRED |
| Número máximo | TBD |
| API de composición | TBD |
| Recursos soportados | TBD |
| Política de fallo | TBD |

---

# 23. ESTADO ACTUAL

**FASE 09 — PLANNED**

No existe evidencia de implementación, pruebas, validación o certificación.

---

# 24. REGLA SUPREMA

> **Un overlay debe ser una capa controlada y determinista de composición; nunca debe modificar de forma impredecible el contenido base de la grabación.**