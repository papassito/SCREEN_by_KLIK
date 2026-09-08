# OUTPUT.md

# SCREEN by KLIK — Output

**Ruta:** `docs/technical/OUTPUT.md`
**Versión documental:** `0.1.0-alpha`
**Estado:** `PLANNED`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADO`
**Certificación:** `NO CERTIFICADO`

---

## 1. Propósito

Este documento define las bases técnicas del subsistema responsable de convertir los streams codificados y los datos asociados en un **resultado final de grabación**.

`OUTPUT` representa la última etapa técnica del pipeline:

```text
CAPTURE
   ↓
PROCESSING
   ↓
ENCODING
   ↓
OUTPUT
   ↓
FINAL RECORDING
```

Su responsabilidad termina cuando el resultado ha sido escrito y validado según el contrato establecido.

---

## 2. Alcance

`OUTPUT` deberá contemplar conceptualmente:

* recepción de streams codificados;
* integración con el contenedor;
* escritura;
* finalización;
* flush;
* validación;
* metadata;
* errores;
* archivos parciales;
* recuperación;
* integridad;
* almacenamiento;
* comunicación del resultado.

No define:

* codec;
* encoder;
* captura;
* UI;
* selección de región;
* ubicación definitiva de archivos.

---

## 3. Responsabilidades

### OUTPUT sí es responsable de:

* construir o finalizar el resultado;
* escribir datos;
* controlar la finalización;
* detectar errores de escritura;
* validar el resultado;
* comunicar el estado final.

### OUTPUT no es responsable de:

* capturar pantalla;
* capturar audio;
* capturar cámara;
* seleccionar fuentes;
* codificar los frames;
* controlar la interfaz.

---

## 4. Flujo conceptual

```text
ENCODED VIDEO
      │
ENCODED AUDIO
      │
      ▼
OUTPUT / MUXING
      │
      ▼
TEMPORARY RESULT
      │
      ▼
FINALIZATION
      │
      ▼
VALIDATION
      │
      ▼
COMMIT
      │
      ▼
FINAL RECORDING
```

La arquitectura concreta de muxing permanece `TBD`.

---

## 5. Contenedor

El contenedor o contenedores soportados permanecen:

**`TBD`**

No deberá confundirse:

```text
CODEC
≠
ENCODER
≠
CONTAINER
≠
FILE EXTENSION
```

La extensión deberá corresponder al formato real.

---

## 6. Escritura

La escritura deberá considerar:

* buffering;
* errores parciales;
* interrupciones;
* falta de espacio;
* permisos;
* cancelación;
* cierre;
* almacenamiento no disponible.

No deberá asumirse que una escritura exitosa garantiza automáticamente un archivo final válido.

---

## 7. Finalización

La finalización deberá asegurar que el contenedor y los streams queden en un estado consistente.

Conceptualmente:

```text
WRITING
   ↓
STOP INPUT
   ↓
FLUSH
   ↓
FINALIZE
   ↓
VALIDATE
   ↓
COMMIT
```

Si la finalización falla, el resultado deberá marcarse de forma explícita.

---

## 8. Resultado parcial

Debe distinguirse:

* `COMPLETE`
* `PARTIAL`
* `FAILED`
* `CANCELLED`
* `RECOVERABLE`

Un archivo parcialmente escrito no deberá presentarse como grabación completa.

---

## 9. Validación

La validación deberá determinar, según el formato:

* existencia;
* tamaño razonable;
* estructura;
* legibilidad;
* streams presentes;
* metadata necesaria;
* finalización correcta.

El mecanismo exacto permanece `TBD`.

---

## 10. Integridad

Cuando corresponda, podrá validarse:

* tamaño;
* estructura;
* timestamps;
* duración;
* codec;
* container;
* legibilidad.

Los mecanismos adicionales de integridad deberán justificarse por requisito.

---

## 11. Metadata

La metadata que pueda acompañar una grabación permanece `TBD`.

Deberá evitarse almacenar información innecesaria.

La metadata técnica deberá distinguirse de información personal o sensible.

---

## 12. Espacio y almacenamiento

`OUTPUT` deberá reaccionar ante:

* almacenamiento lleno;
* dispositivo desconectado;
* permisos insuficientes;
* filesystem no disponible;
* error de escritura.

El comportamiento deberá ser explícito y observable.

---

## 13. Cancelación

Una cancelación deberá impedir que un resultado incompleto sea presentado como completo.

El sistema deberá determinar si:

* elimina el temporal;
* conserva un resultado parcial;
* permite recuperación;
* marca el resultado como cancelado.

La política final permanece `TBD`.

---

## 14. Seguridad

Deberán protegerse:

* rutas;
* archivos;
* permisos;
* temporales;
* resultados;
* metadata.

No deberá permitirse escritura arbitraria fuera de destinos autorizados.

---

## 15. Privacidad

Las grabaciones deberán tratarse como información potencialmente sensible.

`OUTPUT` no deberá:

* crear copias innecesarias;
* enviar grabaciones sin autorización;
* registrar contenido audiovisual;
* mantener temporales indefinidamente.

---

## 16. Compatibilidad

El resultado deberá verificarse por:

* plataforma;
* filesystem;
* contenedor;
* codec;
* encoder;
* configuración.

La compatibilidad deberá demostrarse mediante pruebas.

---

## 17. Pruebas

Deberán contemplarse:

* grabación mínima;
* grabación prolongada;
* audio + video;
* cámara + pantalla;
* cancelación;
* falta de espacio;
* error de escritura;
* archivo parcial;
* finalización;
* validación;
* recuperación;
* almacenamiento externo;
* corrupción controlada;
* compatibilidad multiplataforma.

---

## 18. Evidencia

Una validación deberá conservar, cuando corresponda:

* plataforma;
* configuración;
* formato;
* tamaño;
* duración;
* streams;
* resultado de validación;
* errores;
* archivo producido.

---

## 19. Gaps

| ID          | Gap                    |
| ----------- | ---------------------- |
| GAP-OUT-001 | Container selection    |
| GAP-OUT-002 | Muxing strategy        |
| GAP-OUT-003 | Finalization contract  |
| GAP-OUT-004 | Validation mechanism   |
| GAP-OUT-005 | Partial-result policy  |
| GAP-OUT-006 | Storage failure policy |
| GAP-OUT-007 | Metadata policy        |
| GAP-OUT-008 | Atomic commit          |
| GAP-OUT-009 | Recovery               |
| GAP-OUT-010 | Compatibility matrix   |

---

## 20. Estado actual

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

## 21. Regla de integridad

> **OUTPUT no termina cuando deja de recibir datos; termina cuando existe un resultado final verificable o un estado explícito de fallo/parcialidad.**
