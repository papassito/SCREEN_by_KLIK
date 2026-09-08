# FILES.md

# SCREEN by KLIK — Files

**Ruta:** `docs/technical/FILES.md`
**Versión documental:** `0.1.0-alpha`
**Estado:** `PLANNED`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADO`
**Certificación:** `NO CERTIFICADO`

---

## 1. Propósito

Este documento define las bases técnicas para la gestión de archivos utilizada por SCREEN by KLIK.

Incluye:

* rutas;
* archivos temporales;
* almacenamiento;
* escritura;
* creación;
* finalización;
* integridad;
* permisos;
* errores;
* recuperación;
* limpieza.

No define todavía una ubicación física definitiva para los archivos.

---

## 2. Alcance

El subsistema deberá contemplar conceptualmente:

* configuración de rutas;
* creación de directorios;
* validación de destinos;
* archivos temporales;
* archivos finales;
* nombres de archivo;
* escritura segura;
* atomicidad cuando sea aplicable;
* espacio disponible;
* permisos;
* errores;
* limpieza;
* recuperación;
* protección contra path traversal;
* integridad del resultado.

---

## 3. Principio fundamental

La aplicación no deberá asumir que:

* existe un directorio;
* existe espacio suficiente;
* tiene permisos de escritura;
* una ruta es segura;
* un archivo parcial es válido;
* una escritura terminó correctamente.

Todo deberá verificarse.

---

## 4. Flujo conceptual

```text
CONFIGURATION
      ↓
DESTINATION VALIDATION
      ↓
DIRECTORY VALIDATION
      ↓
TEMPORARY OUTPUT
      ↓
WRITE
      ↓
FLUSH / FINALIZE
      ↓
VALIDATE
      ↓
COMMIT / RENAME
      ↓
FINAL FILE
```

El flujo concreto dependerá de la plataforma y de la implementación.

---

## 5. Ubicación de archivos

Las ubicaciones definitivas permanecen:

**`TBD`**

Debe distinguirse entre:

```text
APPLICATION FILES
CONFIGURATION
TEMPORARY FILES
RECORDINGS
LOGS
DIAGNOSTICS
CACHE
```

No se deberá asumir que todos deben residir en el mismo directorio.

---

## 6. Directorios

Antes de utilizar un directorio deberán validarse, según corresponda:

* existencia;
* tipo;
* accesibilidad;
* permisos;
* capacidad;
* disponibilidad.

La creación automática de directorios deberá ser explícita y segura.

---

## 7. Nombres de archivo

Los nombres deberán protegerse contra:

* caracteres inválidos;
* path traversal;
* rutas absolutas no autorizadas;
* componentes inesperados;
* colisiones;
* nombres excesivamente largos;
* incompatibilidades entre plataformas.

No deberá aceptarse una ruta de usuario como segura simplemente porque provenga de la interfaz gráfica.

---

## 8. Extensiones

La extensión del archivo deberá corresponder al formato real generado.

No deberá utilizarse una extensión para aparentar compatibilidad con un formato que realmente no corresponde.

---

## 9. Archivos temporales

Los archivos temporales podrán utilizarse para:

* grabaciones en progreso;
* encoding;
* composición;
* recuperación;
* operaciones intermedias.

Deberán contemplarse:

* ubicación segura;
* nombres no colisionables;
* limpieza;
* recuperación;
* límites de tamaño;
* comportamiento ante cierre inesperado.

---

## 10. Archivo parcial

Durante una grabación:

```text
PARTIAL FILE
     ≠
FINAL RECORDING
```

Un archivo parcial no deberá declararse como resultado completo.

Los estados conceptuales podrán incluir:

* `CREATING`
* `WRITING`
* `FINALIZING`
* `COMPLETE`
* `PARTIAL`
* `FAILED`
* `CANCELLED`
* `RECOVERABLE`

La implementación definitiva queda `TBD`.

---

## 11. Atomicidad

Cuando la plataforma y el formato lo permitan, las operaciones críticas deberán minimizar la posibilidad de presentar un archivo incompleto como archivo final.

Conceptualmente:

```text
TEMP FILE
   ↓
VALIDATE
   ↓
COMMIT
   ↓
FINAL FILE
```

La estrategia física de commit permanece `TBD`.

---

## 12. Espacio disponible

Antes y durante operaciones relevantes deberá considerarse:

* espacio disponible;
* crecimiento esperado;
* tamaño de buffers;
* archivos temporales;
* tamaño final;
* errores de almacenamiento.

El agotamiento de espacio deberá producir un estado explícito.

---

## 13. Escritura

Las operaciones de escritura deberán considerar:

* errores parciales;
* interrupciones;
* buffering;
* flush;
* cierre;
* cancelación;
* pérdida del dispositivo;
* permisos.

Una llamada de escritura exitosa no deberá interpretarse automáticamente como garantía de persistencia final.

---

## 14. Integridad

Cuando sea aplicable, deberá validarse:

* existencia;
* tamaño;
* estructura;
* legibilidad;
* formato;
* finalización;
* metadata necesaria.

Hashes u otros mecanismos de integridad podrán utilizarse cuando exista un requisito que los justifique.

---

## 15. Seguridad

El subsistema deberá proteger contra:

* path traversal;
* escritura fuera de destinos autorizados;
* sobrescritura accidental;
* nombres maliciosos;
* enlaces o referencias peligrosas cuando correspondan;
* permisos incorrectos;
* archivos temporales expuestos.

Las medidas concretas serán definidas durante diseño e implementación.

---

## 16. Privacidad

Las grabaciones deben tratarse como información potencialmente sensible.

El subsistema deberá evitar:

* copias innecesarias;
* duplicación no controlada;
* almacenamiento oculto;
* retención indefinida de temporales;
* exposición accidental.

La eliminación deberá respetar las políticas definidas en `PRIVACY.md`.

---

## 17. Recuperación

Después de:

* cierre inesperado;
* pérdida de energía;
* crash;
* cancelación;
* falta de espacio;
* pérdida de dispositivo;

el sistema deberá determinar si existen datos recuperables.

No deberá prometerse recuperación si el formato o el estado real no lo permiten.

---

## 18. Limpieza

La limpieza deberá distinguir:

```text
TEMPORARY
RECOVERABLE
FINAL
FAILED
CANCELLED
```

Nunca deberá eliminarse automáticamente un archivo potencialmente valioso sin una política explícita.

---

## 19. Concurrencia

Las operaciones sobre archivos deberán considerar:

* dos grabaciones simultáneas;
* nombres concurrentes;
* procesos concurrentes;
* cierre simultáneo;
* acceso a un archivo en finalización.

La política de concurrencia permanece `TBD`.

---

## 20. Compatibilidad

El comportamiento del filesystem varía entre:

* Windows;
* Linux;
* macOS;
* Android;
* iOS.

Deberán validarse diferencias en:

* rutas;
* permisos;
* almacenamiento;
* sandboxing;
* nombres;
* acceso;
* lifecycle;
* disponibilidad.

---

## 21. Pruebas

Deberán contemplarse posteriormente:

* creación;
* escritura;
* permisos;
* ruta inválida;
* espacio insuficiente;
* nombre inválido;
* colisión;
* cancelación;
* crash;
* recuperación;
* limpieza;
* archivos parciales;
* almacenamiento externo;
* concurrencia.

---

## 22. Gaps

| ID          | Gap                      |
| ----------- | ------------------------ |
| GAP-FIL-001 | Ubicación de grabaciones |
| GAP-FIL-002 | Ubicación temporal       |
| GAP-FIL-003 | Política de nombres      |
| GAP-FIL-004 | Atomicidad               |
| GAP-FIL-005 | Integridad               |
| GAP-FIL-006 | Recuperación             |
| GAP-FIL-007 | Limpieza                 |
| GAP-FIL-008 | Permisos                 |
| GAP-FIL-009 | Concurrencia             |
| GAP-FIL-010 | Política multiplataforma |

---

## 23. Estado actual

| Elemento       | Estado            |
| -------------- | ----------------- |
| Documentación  | `DOCUMENTED`      |
| Diseño         | `PLANNED`         |
| Implementación | `NO IMPLEMENTADA` |
| Pruebas        | `NO EJECUTADAS`   |
| Evidencia      | `NO DISPONIBLE`   |
| Validación     | `NO VALIDADO`     |
| Certificación  | `NO CERTIFICADO`  |

---

## 24. Regla de integridad

> **Un archivo existente no implica que sea un resultado válido.**

SCREEN deberá diferenciar claramente entre datos temporales, parciales, recuperables y resultados finales.
