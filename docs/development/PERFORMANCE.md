# SCREEN by KLIK — Performance

## 1. Propósito

Este documento define los principios, objetivos y criterios de rendimiento de **SCREEN by KLIK**, así como la estrategia prevista para medir, analizar y optimizar el comportamiento del sistema.

El objetivo principal es garantizar que la aplicación pueda realizar sus funciones de captura, procesamiento y generación de grabaciones sin producir una degradación innecesaria de la experiencia del usuario ni comprometer la estabilidad del sistema anfitrión.

**Estado General:** `PLANNED`

---

## 2. Principios de Rendimiento

SCREEN by KLIK deberá diseñarse bajo los siguientes principios:

- **Medición antes de optimización:** ninguna optimización deberá justificarse únicamente mediante suposiciones.
- **Rendimiento observable:** las características relevantes del sistema deberán poder medirse mediante métricas verificables.
- **Uso responsable de recursos:** CPU, memoria, GPU, almacenamiento y demás recursos deberán utilizarse de manera controlada.
- **Estabilidad sostenida:** el rendimiento deberá evaluarse tanto durante operaciones breves como durante sesiones prolongadas.
- **Degradación controlada:** cuando los recursos disponibles sean insuficientes, el sistema deberá degradar su comportamiento de manera controlada y observable.
- **Ausencia de crecimiento ilimitado:** ninguna cola, buffer, estructura temporal o recurso equivalente deberá crecer indefinidamente.
- **Separación entre rendimiento y funcionalidad:** una optimización no podrá introducir una regresión funcional o de seguridad para considerarse válida.

---

## 3. Objetivos de Rendimiento

### 3.1 Bajo Impacto

La aplicación deberá procurar un impacto razonablemente bajo sobre el sistema anfitrión, especialmente sobre las aplicaciones que el usuario está grabando.

El impacto real deberá determinarse mediante mediciones realizadas en condiciones de prueba definidas.

No se establece en esta fase un porcentaje universal de utilización de CPU, memoria o GPU como requisito definitivo.

**Estado:** `PLANNED`

---

### 3.2 Uso Controlado de Memoria

El sistema deberá evitar:

- fugas de memoria;
- crecimiento indefinido de buffers;
- acumulación no controlada de frames;
- retención innecesaria de recursos;
- crecimiento progresivo del consumo durante sesiones prolongadas.

La validación deberá incluir pruebas de duración suficiente para detectar degradaciones que no sean visibles durante ejecuciones breves.

**Estado:** `PLANNED`

---

### 3.3 Uso Controlado de CPU

El procesamiento deberá distribuirse de forma eficiente cuando la arquitectura y la plataforma lo permitan.

La utilización de múltiples núcleos podrá considerarse cuando produzca una mejora real y medible, pero el paralelismo no constituye por sí mismo un objetivo.

Deberá evitarse:

- saturación innecesaria;
- competencia excesiva entre componentes;
- sincronización ineficiente;
- trabajo redundante;
- procesamiento de datos que ya no sean necesarios.

**Estado:** `PLANNED`

---

### 3.4 Aceleración de Hardware

Cuando la plataforma y la infraestructura disponible lo permitan, SCREEN by KLIK podrá utilizar capacidades de aceleración de hardware para determinadas operaciones de procesamiento o codificación.

La aceleración por hardware no deberá considerarse una dependencia universal hasta que las plataformas objetivo, los requisitos funcionales y la compatibilidad real hayan sido definidos y validados.

La arquitectura deberá permitir distinguir entre:

- procesamiento mediante hardware;
- procesamiento mediante software;
- disponibilidad de aceleración;
- indisponibilidad o incompatibilidad de una capacidad concreta.

**Estado:** `PLANNED`

---

## 4. Estrategia de Medición

El principio fundamental será:

> **Medir primero. Optimizar después.**

Las decisiones de optimización deberán estar respaldadas por evidencia obtenida en condiciones de prueba reproducibles.

La estrategia de medición deberá contemplar, cuando resulte aplicable:

- captura;
- procesamiento;
- codificación;
- escritura del resultado;
- utilización de recursos;
- estabilidad durante sesiones prolongadas;
- comportamiento ante sobrecarga;
- pérdida de datos;
- latencia entre etapas.

Las herramientas concretas de profiling y diagnóstico se seleccionarán de acuerdo con la implementación real y la plataforma objetivo.

Las herramientas de profiling de Go, incluyendo `pprof`, podrán utilizarse cuando la implementación y el escenario de prueba lo justifiquen, pero no constituyen por ahora una dependencia arquitectónica obligatoria.

**Estado:** `PLANNED`

---

## 5. Métricas Clave

Durante la validación deberán considerarse, como mínimo, las siguientes categorías de métricas:

### 5.1 Procesamiento

- utilización de CPU;
- utilización de GPU cuando corresponda;
- carga por componente;
- tiempo de procesamiento por unidad de trabajo.

### 5.2 Memoria

- consumo de RAM;
- crecimiento de memoria durante el tiempo;
- tamaño de buffers;
- asignaciones relevantes;
- comportamiento después de finalizar una sesión.

### 5.3 Captura y Procesamiento de Vídeo

- frecuencia de captura;
- frecuencia efectiva de procesamiento;
- frecuencia efectiva de codificación;
- frames perdidos;
- frames descartados;
- diferencias entre producción y consumo de datos.

### 5.4 Latencia

- latencia entre etapas;
- tiempo de procesamiento;
- tiempo de espera;
- retrasos acumulados;
- latencia de generación del resultado final.

### 5.5 Almacenamiento

Cuando corresponda:

- velocidad de escritura;
- utilización de almacenamiento;
- crecimiento del archivo;
- comportamiento ante almacenamiento insuficiente;
- errores de escritura.

---

## 6. Backpressure y Control de Flujo

El procesamiento de datos deberá contemplar mecanismos que eviten que una etapa más rápida genere una acumulación ilimitada de trabajo para una etapa más lenta.

La arquitectura podrá utilizar:

- buffers acotados;
- colas limitadas;
- mecanismos de bloqueo;
- descarte controlado;
- sincronización entre productores y consumidores;
- otros mecanismos equivalentes adecuados a la implementación.

No se establece en esta fase una tecnología concreta para implementar el control de flujo.

El comportamiento ante saturación deberá ser definido explícitamente.

Cuando resulte necesario descartar información, deberá distinguirse entre:

- descarte esperado;
- descarte por saturación;
- pérdida inesperada;
- error de procesamiento.

**Estado:** `PLANNED`

---

## 7. Minimización de Copias

Los datos de captura pueden representar volúmenes significativos de información.

Por ello, durante la implementación deberán evaluarse estrategias para evitar copias innecesarias de grandes bloques de datos.

La minimización de copias deberá considerarse únicamente cuando exista evidencia de que dichas operaciones representan un coste relevante.

No deberá introducirse complejidad prematura únicamente para reducir una copia cuya influencia sobre el rendimiento sea irrelevante.

**Principio:**

> **Primero corrección y estabilidad; después optimización demostrada.**

**Estado:** `PLANNED`

---

## 8. Sesiones Prolongadas

El rendimiento no deberá evaluarse únicamente mediante ejecuciones cortas.

Las pruebas deberán contemplar, cuando corresponda:

- sesiones prolongadas;
- crecimiento de memoria;
- estabilidad de buffers;
- acumulación de recursos;
- degradación progresiva;
- estabilidad de captura;
- estabilidad de procesamiento;
- estabilidad de escritura.

El objetivo será detectar problemas que solamente aparezcan después de un periodo significativo de operación.

**Estado:** `PLANNED`

---

## 9. Comportamiento Bajo Sobrecarga

El sistema deberá definir y validar su comportamiento cuando los recursos disponibles sean insuficientes para mantener las condiciones ideales de operación.

Entre los escenarios posibles se encuentran:

- CPU insuficiente;
- GPU no disponible o saturada;
- memoria insuficiente;
- almacenamiento lento;
- almacenamiento agotado;
- procesamiento más lento que la captura;
- interrupciones o errores en una etapa del pipeline.

El sistema deberá evitar que una condición de sobrecarga provoque crecimiento ilimitado de recursos o un estado silenciosamente inconsistente.

**Estado:** `PLANNED`

---

## 10. Benchmarks

Los benchmarks deberán utilizarse para evaluar componentes o rutas críticas cuando exista una implementación funcional que pueda medirse.

Podrán evaluarse, según corresponda:

- captura;
- procesamiento;
- conversión;
- codificación;
- escritura;
- sincronización;
- transferencia de datos;
- operaciones de alto coste.

Los benchmarks deberán:

1. definir qué se está midiendo;
2. establecer las condiciones de ejecución;
3. producir resultados reproducibles;
4. permitir comparación entre versiones;
5. evitar conclusiones basadas en una única ejecución aislada.

La existencia de un benchmark no implica por sí misma que exista un requisito de rendimiento aprobado.

**Estado:** `PLANNED`

---

## 11. Criterios de Optimización

Una optimización deberá justificarse mediante:

- problema identificado;
- métrica afectada;
- evidencia obtenida;
- cambio realizado;
- resultado posterior;
- ausencia de regresiones relevantes.

No deberán aceptarse optimizaciones basadas exclusivamente en:

- intuición;
- preferencias personales;
- complejidad aparente;
- suposiciones sobre el hardware;
- expectativas teóricas no verificadas.

Toda optimización significativa deberá conservar trazabilidad respecto del problema que intenta resolver.

---

## 12. Rendimiento vs. Corrección

El rendimiento nunca tendrá prioridad sobre:

- integridad de la grabación;
- estabilidad;
- seguridad;
- consistencia del estado;
- correcta liberación de recursos;
- comportamiento predecible ante errores.

Una mejora de rendimiento que provoque corrupción, pérdida injustificada de información, inestabilidad o vulnerabilidades deberá considerarse una regresión y no una mejora válida.

---

## 13. Validación de Rendimiento

La validación deberá ejecutarse sobre escenarios representativos de las plataformas objetivo.

Cada evaluación deberá identificar, cuando corresponda:

- hardware;
- sistema operativo;
- configuración;
- condiciones de captura;
- resolución;
- frecuencia de captura;
- duración de la prueba;
- condiciones de almacenamiento;
- condiciones de carga;
- resultados obtenidos.

Los umbrales definitivos de aceptación deberán establecerse antes de la certificación de rendimiento y deberán estar respaldados por evidencia.

---

## 14. Certificación

El estado `CERTIFIED` no podrá asignarse únicamente porque la aplicación funcione o compile correctamente.

La certificación de rendimiento deberá requerir evidencia suficiente de que:

- las métricas relevantes fueron medidas;
- los escenarios definidos fueron ejecutados;
- los resultados cumplen los criterios establecidos;
- no existen problemas conocidos de degradación progresiva;
- el comportamiento bajo carga es aceptable;
- no existen regresiones relevantes derivadas de las optimizaciones realizadas.

La certificación deberá corresponder a una configuración y plataforma claramente identificadas.

---

## 15. Relación con ROADMAP

La estrategia de rendimiento deberá integrarse con la fase correspondiente del roadmap oficial del proyecto.

La referencia a una fase de `ROADMAP.md` deberá interpretarse como planificación hasta que exista evidencia de ejecución real.

Por tanto:

`ROADMAP → PLANIFICACIÓN`

no equivale a:

`ROADMAP → IMPLEMENTACIÓN → VALIDACIÓN → CERTIFICACIÓN`

Cada transición deberá quedar respaldada por evidencia.

---

## 16. Estado Real de Implementación

**Estado actual:** `PLANNED`

### Justificación

No existe actualmente una implementación funcional de SCREEN by KLIK que permita realizar mediciones reales de rendimiento.

Por lo tanto, en este momento:

- no existen benchmarks certificados;
- no existen métricas reales de rendimiento;
- no existen umbrales de aceptación certificados;
- no existe evidencia de consumo de CPU;
- no existe evidencia de consumo de memoria;
- no existe evidencia de utilización de GPU;
- no existe evidencia de FPS efectivos;
- no existe evidencia de frames perdidos;
- no existe evidencia de latencia del pipeline;
- no existe certificación de rendimiento.

Los objetivos y mecanismos descritos en este documento constituyen **criterios de diseño y planificación**, no resultados obtenidos.

---

## 17. Evolución del Estado

El estado de este documento deberá evolucionar conforme exista evidencia:

```text
PLANNED
   ↓
IMPLEMENTED
   ↓
MEASURED
   ↓
VALIDATED
   ↓
CERTIFIED
```

Un estado posterior no deberá declararse sin cumplir las condiciones correspondientes.

---

## 18. Regla Suprema

> **El rendimiento de SCREEN by KLIK deberá demostrarse mediante mediciones, no mediante suposiciones.**

La documentación podrá definir objetivos.

La implementación podrá materializar esos objetivos.

Las pruebas deberán medirlos.

La evidencia deberá demostrar los resultados.

La certificación deberá autorizar únicamente aquello que haya sido realmente validado.

**Estado del documento:** `PLANNED`