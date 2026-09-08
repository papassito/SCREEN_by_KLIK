# SCREEN by KLIK — Privacy

**Documento:** `docs/security/PRIVACY.md`
**Proyecto:** SCREEN by KLIK
**Categoría:** Privacy
**Estado:** `PLANNED`
**Versión documental:** `0.1.0-alpha`
**Implementación:** `NO IMPLEMENTADA`
**Pruebas:** `NO EJECUTADAS`
**Validación:** `NO VALIDADA`
**Certificación:** `NO CERTIFICADA`

---

# 1. Propósito

Este documento define los principios de privacidad aplicables a SCREEN by KLIK.

El objetivo es establecer cómo deberá tratarse la información que pueda ser procesada por la aplicación, especialmente aquella derivada de:

* pantalla;
* audio;
* micrófono;
* cámara;
* grabaciones;
* archivos;
* configuración;
* logs;
* metadatos;
* información técnica.

---

# 2. Principio fundamental

SCREEN by KLIK debe aplicar:

> **Privacy by Design y Privacy by Minimization.**

La aplicación no debe recopilar, almacenar, transmitir ni procesar información que no sea necesaria para la función que el usuario ha solicitado.

---

# 3. Estado documental

Este documento define principios y requisitos.

No afirma que exista todavía una implementación concreta.

```text
DOCUMENTADO:    YES
IMPLEMENTADO:   NO
PROBADO:        NO
VALIDADO:       NO
CERTIFICADO:    NO
```

---

# 4. Categorías de información

Conceptualmente pueden existir:

| Categoría     | Ejemplo             | Tratamiento |
| ------------- | ------------------- | ----------- |
| Pantalla      | Imagen capturada    | Usuario     |
| Audio         | Sonido del sistema  | Usuario     |
| Micrófono     | Entrada de audio    | Usuario     |
| Cámara        | Imagen de cámara    | Usuario     |
| Grabación     | Archivo resultante  | Usuario     |
| Configuración | Preferencias        | Aplicación  |
| Logs          | Eventos técnicos    | Diagnóstico |
| Metadatos     | Información técnica | TBD         |

La existencia de una categoría no implica que SCREEN vaya a recopilarla fuera de la función explícitamente solicitada.

---

# 5. Pantalla

La captura de pantalla puede contener información altamente sensible.

SCREEN deberá:

* capturar solamente cuando el usuario lo solicite;
* respetar la modalidad seleccionada;
* evitar captura fuera del área autorizada;
* detener la captura cuando corresponda;
* no utilizar el contenido capturado para finalidades no autorizadas.

---

# 6. Audio

El audio puede contener conversaciones privadas.

SCREEN deberá:

* solicitar autorización;
* respetar la configuración;
* informar cuando corresponda;
* evitar captura no solicitada;
* liberar el recurso al terminar.

---

# 7. Micrófono

El micrófono deberá considerarse una fuente potencialmente sensible.

Debe existir una relación explícita entre:

```text
USER INTENT
→ PERMISSION
→ MICROPHONE ACCESS
→ RECORDING
```

---

# 8. Cámara

La cámara puede capturar personas y espacios privados.

Debe existir:

* autorización;
* indicación clara;
* acceso limitado;
* liberación del dispositivo;
* manejo correcto de errores.

---

# 9. Grabaciones

Las grabaciones pertenecen al flujo de datos del usuario.

SCREEN no debe asumir propiedad sobre su contenido.

El diseño deberá contemplar:

* ubicación;
* permisos;
* acceso;
* copia;
* exportación;
* eliminación;
* recuperación.

---

# 10. Procesamiento local

Cuando sea técnicamente viable, el procesamiento deberá realizarse localmente.

La arquitectura no debe introducir transmisión externa de:

* pantalla;
* audio;
* cámara;
* grabaciones;

sin una necesidad funcional explícita y un mecanismo autorizado.

---

# 11. Transmisión de datos

Cualquier transmisión externa deberá estar explícitamente definida.

No deberá existir una transmisión implícita o no documentada.

Actualmente:

```text
EXTERNAL DATA TRANSMISSION: TBD
```

---

# 12. Telemetría

Si se incorpora telemetría, deberá determinarse:

* qué información se recopila;
* por qué;
* durante cuánto tiempo;
* dónde;
* quién puede acceder;
* cómo se protege;
* cómo se desactiva cuando corresponda.

No deberá convertirse en un mecanismo para recopilar contenido de las grabaciones.

---

# 13. Logs

Los logs no deben contener:

* vídeos;
* capturas de pantalla;
* audio;
* contraseñas;
* tokens;
* claves;
* información personal innecesaria.

El logging debe aplicar minimización de datos.

---

# 14. Metadatos

Debe determinarse qué metadatos se generan.

Ejemplos posibles:

* duración;
* resolución;
* formato;
* timestamps;
* configuración;
* información técnica del dispositivo.

Cada categoría deberá justificarse por necesidad funcional o técnica.

---

# 15. Archivos temporales

Los archivos temporales pueden contener información equivalente a la grabación final.

Por ello deberán recibir protección equivalente durante su ciclo de vida.

---

# 16. Eliminación

La eliminación deberá contemplar:

* archivo final;
* archivo temporal;
* archivos de recuperación;
* metadatos;
* logs cuando corresponda.

No debe afirmarse eliminación segura de datos residuales sin haber definido y validado el mecanismo correspondiente.

---

# 17. Recuperación

Los mecanismos de recuperación no deberán crear copias innecesarias de información privada.

Debe existir una política clara para:

* archivos incompletos;
* temporales;
* backups;
* recovery data.

---

# 18. Acceso

El acceso a datos deberá seguir:

```text
NEED
→ AUTHORIZATION
→ ACCESS
→ USE
→ RELEASE
```

No debe existir acceso permanente innecesario.

---

# 19. Configuración

La configuración puede contener información sensible dependiendo de las funcionalidades implementadas.

Debe protegerse adecuadamente y separarse de las grabaciones.

---

# 20. Privacidad por plataforma

La política común deberá aplicarse a:

```text
DESKTOP
├── Windows
├── Linux
└── macOS

MOBILE
├── Android
└── iOS
```

Cada plataforma deberá documentar sus mecanismos y restricciones específicos.

---

# 21. Permisos

Los permisos deberán ser:

* necesarios;
* explícitos;
* comprensibles;
* limitados;
* revocables cuando la plataforma lo permita.

SCREEN deberá manejar correctamente la denegación.

---

# 22. Indicadores de estado

El usuario debe poder conocer, cuando corresponda, estados como:

```text
NOT RECORDING
RECORDING
PAUSED
STOPPING
FINALIZING
COMPLETED
FAILED
CANCELLED
```

La aplicación no debe ocultar una captura activa.

---

# 23. Privacidad y UI

La UI deberá comunicar de manera clara:

* cuándo comienza una grabación;
* qué fuentes están activas;
* cuándo se utilizan cámara/micrófono;
* cuándo termina la captura;
* dónde se guarda el resultado cuando sea relevante.

---

# 24. Compartición

Si el producto incorpora funciones de compartir/exportar, el usuario deberá controlar explícitamente la operación.

No debe existir una transferencia automática no documentada.

---

# 25. Servicios externos

Cualquier servicio externo deberá identificarse antes de formar parte de la arquitectura.

Debe documentarse:

* finalidad;
* datos enviados;
* motivo;
* dependencia;
* seguridad;
* disponibilidad;
* impacto en privacidad.

Actualmente:

```text
EXTERNAL SERVICES: TBD
```

---

# 26. Publicidad

Si en algún momento se incorpora publicidad, deberá evaluarse separadamente:

* datos utilizados;
* identificadores;
* tracking;
* terceros;
* consentimiento;
* configuración;
* impacto regulatorio.

Actualmente:

```text
ADVERTISING: TBD
```

---

# 27. Analítica

Si se incorpora analytics, deberá existir una definición explícita de:

* eventos;
* finalidad;
* minimización;
* retención;
* transmisión;
* acceso.

No deberá recopilarse el contenido de pantalla como analytics.

---

# 28. Seguridad y privacidad

La seguridad técnica y privacidad están relacionadas:

```text
SECURITY
     +
PRIVACY
     ↓
PROTECTION OF USER DATA
```

Pero no son equivalentes.

`SECURITY.md` define controles técnicos.

Este documento define principios de tratamiento de información.

---

# 29. Retención

Los períodos de retención son `TBD`.

Deberán determinarse individualmente para:

* grabaciones;
* temporales;
* logs;
* metadatos;
* diagnósticos;
* telemetría, si existe.

---

# 30. Datos residuales

Debe considerarse que una eliminación lógica no necesariamente implica eliminación física inmediata.

Cualquier afirmación sobre eliminación segura deberá estar respaldada por evidencia técnica.

---

# 31. Cumplimiento legal

Las obligaciones legales aplicables dependerán de:

* jurisdicción;
* distribución;
* usuario;
* plataforma;
* funcionalidad;
* tratamiento de datos;
* servicios externos.

Este documento no constituye por sí mismo asesoría legal.

Los requisitos jurídicos concretos deberán ser identificados y validados antes de la distribución comercial correspondiente.

---

# 32. Privacy by Default

Los valores iniciales deberán favorecer:

* mínima recopilación;
* mínima exposición;
* mínima transmisión;
* mínimo acceso;
* almacenamiento local cuando sea apropiado.

---

# 33. Pruebas de privacidad

Deberán verificarse:

* permisos;
* captura no autorizada;
* archivos temporales;
* logs;
* telemetría;
* transmisión;
* eliminación;
* recuperación;
* aislamiento entre datos.

---

# 34. Evidencia

Toda afirmación relevante deberá poder relacionarse con:

```text
PRIVACY REQUIREMENT
→ IMPLEMENTATION
→ TEST
→ RESULT
→ EVIDENCE
→ VALIDATION
```

---

# 35. Zero-Synthetic Privacy

No debe afirmarse:

```text
NO DATA COLLECTED
```

sin verificar la implementación real.

Tampoco:

```text
PRIVATE
```

simplemente porque el procesamiento se diseñó como local.

La privacidad declarada debe corresponder al comportamiento real.

---

# 36. Gaps

| ID          | Gap                             | Estado  |
| ----------- | ------------------------------- | ------- |
| GAP-PRV-001 | Definir inventario de datos     | OPEN    |
| GAP-PRV-002 | Definir flujo de datos          | OPEN    |
| GAP-PRV-003 | Definir retención               | OPEN    |
| GAP-PRV-004 | Definir eliminación             | OPEN    |
| GAP-PRV-005 | Definir telemetría              | OPEN    |
| GAP-PRV-006 | Definir servicios externos      | OPEN    |
| GAP-PRV-007 | Definir permisos por plataforma | OPEN    |
| GAP-PRV-008 | Definir requisitos legales      | OPEN    |
| GAP-PRV-009 | Crear pruebas de privacidad     | BLOCKED |
| GAP-PRV-010 | Crear evidencia                 | BLOCKED |

---

# 37. Estado actual

```text
DOCUMENTADO:    YES
IMPLEMENTADO:   NO
PROBADO:        NO
VALIDADO:       NO
CERTIFICADO:    NO
```

---

# 38. Evolución

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
```

---

# 39. Regla suprema

> SCREEN by KLIK debe tratar toda información capturada como información potencialmente sensible hasta que exista una justificación documentada para un tratamiento diferente.

**CAPTURAR SOLAMENTE LO NECESARIO.
PROCESAR SOLAMENTE LO NECESARIO.
CONSERVAR SOLAMENTE LO NECESARIO.
TRANSMITIR SOLAMENTE LO NECESARIO.**
