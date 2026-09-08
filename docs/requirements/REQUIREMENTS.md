# SCREEN by KLIK — Requirements

**Documento:** Requirements  
**Producto:** SCREEN by KLIK  
**Versión documental:** 0.1.0-alpha  
**Estado:** APPROVED FOR ARCHITECTURAL DEVELOPMENT  
**Implementación:** NO INICIADA  
**Testing:** NO EJECUTADO  
**Validación:** NO EJECUTADA  
**Certificación:** NO EJECUTADA  

---

# 1. Propósito

Este documento define los requisitos funcionales, no funcionales, técnicos, de seguridad, privacidad, compatibilidad, rendimiento, recuperación y aceptación de **SCREEN by KLIK**.

Este documento define **QUÉ debe hacer el sistema** y establece las condiciones que deberán poder verificarse mediante pruebas y evidencia.

No define por sí mismo:

- implementación concreta;
- estructura definitiva de paquetes;
- funciones internas;
- APIs internas;
- bibliotecas;
- algoritmos específicos no exigidos;
- herramientas de build;
- instaladores concretos;
- mecanismos de distribución.

Cuando un requisito utilice términos como `debe`, se considera obligatorio.

Cuando un elemento sea futuro, opcional o condicionado, deberá indicarse expresamente.

---

# 2. Principios de requisitos

SCREEN by KLIK deberá desarrollarse bajo los siguientes principios:

1. Local-first.
2. Privacidad por diseño.
3. Seguridad por defecto.
4. Separación de responsabilidades.
5. Modularidad.
6. Trazabilidad.
7. Verificabilidad.
8. Integridad de archivos.
9. Uso controlado de recursos.
10. Manejo explícito de errores.
11. Evidencia antes de validación.
12. No asumir compatibilidad sin pruebas.
13. No presentar como implementado aquello que solamente está especificado.
14. No introducir dependencias sin justificación técnica y de licencia.
15. La implementación deberá respetar los contratos y la arquitectura aprobados.

---

# 3. Alcance del producto

SCREEN by KLIK es una aplicación de escritorio cuyo objetivo principal es permitir al usuario capturar y grabar actividad de pantalla localmente.

## 3.1 Alcance inicial

El producto deberá contemplar:

- grabación de pantalla;
- grabación de monitor;
- grabación de ventana;
- grabación de región;
- configuración multimonitor;
- captura de audio del sistema;
- captura de micrófono;
- grabación simultánea de audio del sistema y micrófono;
- controles de grabación;
- pausa y reanudación;
- cancelación;
- codificación;
- almacenamiento local;
- generación de archivos de vídeo;
- screenshots;
- selección de fuentes;
- configuración;
- hotkeys;
- cursor;
- cámara opcional;
- overlays y anotaciones como capacidades previstas;
- recuperación ante determinados fallos;
- validación del resultado.

## 3.2 Fuera del alcance inicial

Queda fuera del alcance inicial:

- edición de vídeo post-grabación;
- streaming en tiempo real hacia plataformas externas;
- almacenamiento obligatorio en la nube;
- procesamiento obligatorio en servidores externos;
- colaboración multiusuario;
- plataforma SaaS obligatoria;
- edición avanzada de audio;
- publicación automática en plataformas externas.

---

# 4. Requisitos funcionales principales

| ID | Requisito |
|---|---|
| REQ-F-001 | El sistema debe permitir iniciar una sesión de grabación de pantalla. |
| REQ-F-002 | El sistema debe permitir detener una sesión de grabación. |
| REQ-F-003 | El sistema debe permitir pausar una sesión de grabación. |
| REQ-F-004 | El sistema debe permitir reanudar una sesión pausada. |
| REQ-F-005 | El sistema debe permitir cancelar una sesión de grabación. |
| REQ-F-006 | El sistema debe permitir seleccionar la fuente de pantalla que será capturada. |
| REQ-F-007 | El sistema debe permitir configurar las fuentes de audio antes de iniciar una grabación. |
| REQ-F-008 | El sistema debe generar un archivo local como resultado de una grabación finalizada correctamente. |
| REQ-F-009 | El sistema debe permitir realizar capturas de pantalla estáticas. |
| REQ-F-010 | El sistema debe proporcionar una interfaz de usuario para controlar las funciones principales. |
| REQ-F-011 | El sistema debe informar al usuario del estado actual de la sesión de grabación. |
| REQ-F-012 | El sistema debe permitir configurar los parámetros principales de captura, audio, salida y grabación. |

---

# 5. Captura de pantalla

| ID | Requisito |
|---|---|
| REQ-CAP-001 | La captura debe producir un flujo temporalmente ordenado de frames de vídeo. |
| REQ-CAP-002 | Cada frame capturado debe disponer de información temporal suficiente para permitir la sincronización. |
| REQ-CAP-003 | El sistema debe detectar y contabilizar, cuando sea posible, la pérdida de frames. |
| REQ-CAP-004 | La pérdida de frames no debe provocar por sí misma el fallo catastrófico de la sesión. |
| REQ-CAP-005 | El ciclo de vida del subsistema de captura debe estar controlado por la sesión de grabación. |
| REQ-CAP-006 | El subsistema de captura debe liberar los recursos utilizados cuando la captura finalice. |
| REQ-CAP-007 | El sistema debe manejar explícitamente errores de inicialización, captura, pérdida de fuente y finalización. |
| REQ-CAP-008 | El sistema debe soportar la captura de las fuentes de pantalla contempladas en la sección de fuentes. |

---

# 6. Fuentes de pantalla

| ID | Requisito |
|---|---|
| REQ-SRC-001 | El sistema debe permitir seleccionar un monitor disponible como fuente de captura. |
| REQ-SRC-002 | El sistema debe permitir seleccionar entre múltiples monitores cuando exista una configuración multimonitor. |
| REQ-SRC-003 | El sistema debe permitir seleccionar una ventana de aplicación como fuente de captura. |
| REQ-SRC-004 | El sistema debe permitir seleccionar una región rectangular como fuente de captura. |
| REQ-SRC-005 | El sistema debe identificar las fuentes disponibles antes de permitir su selección. |
| REQ-SRC-006 | El sistema debe detectar cuando una fuente seleccionada deja de estar disponible. |
| REQ-SRC-007 | Una fuente inválida no debe iniciar una sesión de grabación como si fuera válida. |

---

# 7. Selección de región

| ID | Requisito |
|---|---|
| REQ-REG-001 | El sistema debe proporcionar una herramienta visual para seleccionar una región rectangular. |
| REQ-REG-002 | La región seleccionada debe disponer de coordenadas y dimensiones válidas. |
| REQ-REG-003 | La selección debe considerar correctamente el sistema de coordenadas utilizado por la plataforma. |
| REQ-REG-004 | La selección debe funcionar en configuraciones multimonitor soportadas. |
| REQ-REG-005 | El usuario debe poder confirmar la selección. |
| REQ-REG-006 | El usuario debe poder cancelar la selección. |
| REQ-REG-007 | Una región fuera de los límites válidos no debe ser enviada al motor de captura como región válida. |

---

# 8. Audio del sistema

| ID | Requisito |
|---|---|
| REQ-AUD-001 | El sistema debe poder capturar el audio reproducido por el sistema operativo cuando la plataforma y configuración lo permitan. |
| REQ-AUD-002 | La captura de audio del sistema debe ser opcional. |
| REQ-AUD-003 | Los datos de audio deben disponer de información temporal suficiente para sincronización A/V. |
| REQ-AUD-004 | El sistema debe poder realizar una grabación sin audio del sistema. |
| REQ-AUD-005 | La ausencia de una fuente de audio del sistema no debe provocar por sí misma el fallo de una grabación que no requiere dicha fuente. |
| REQ-AUD-006 | El sistema debe detectar y comunicar los errores relevantes de inicialización y captura de audio. |
| REQ-AUD-007 | El audio capturado debe pasar por una representación interna definida y consistente antes de su codificación. |

---

# 9. Micrófono

| ID | Requisito |
|---|---|
| REQ-MIC-001 | El sistema debe permitir enumerar los dispositivos de micrófono disponibles. |
| REQ-MIC-002 | El usuario debe poder seleccionar el micrófono utilizado para la grabación. |
| REQ-MIC-003 | La captura del micrófono debe ser opcional. |
| REQ-MIC-004 | El sistema debe permitir grabar simultáneamente micrófono y audio del sistema. |
| REQ-MIC-005 | El sistema debe funcionar sin micrófono cuando el usuario no haya seleccionado uno. |
| REQ-MIC-006 | La ausencia o pérdida de un micrófono debe producir un estado explícito y no silencioso. |
| REQ-MIC-007 | Los datos del micrófono deben disponer de información temporal suficiente para sincronización. |

---

# 10. Cámara

La cámara es una capacidad opcional.

| ID | Requisito |
|---|---|
| REQ-CAM-001 | La arquitectura debe permitir incorporar una fuente de cámara de vídeo. |
| REQ-CAM-002 | El sistema debe permitir seleccionar una cámara disponible cuando esta funcionalidad esté implementada. |
| REQ-CAM-003 | La cámara debe respetar los permisos requeridos por la plataforma. |
| REQ-CAM-004 | La cámara debe poder incorporarse como fuente audiovisual independiente. |
| REQ-CAM-005 | El sistema debe permitir una composición picture-in-picture cuando dicha capacidad esté implementada. |
| REQ-CAM-006 | Un fallo de la cámara no debe provocar por sí mismo la pérdida de la grabación principal de pantalla y audio. |
| REQ-CAM-007 | La cámara debe disponer de información temporal suficiente para sincronización con los demás flujos. |

---

# 11. Sesión de grabación

| ID | Requisito |
|---|---|
| REQ-REC-001 | El sistema debe representar explícitamente el estado de una sesión de grabación. |
| REQ-REC-002 | Una sesión debe tener estados claramente diferenciados para preparación, grabación, pausa, detención, finalización y resultado. |
| REQ-REC-003 | El sistema debe impedir transiciones de estado inválidas. |
| REQ-REC-004 | El sistema debe coordinar captura, procesamiento, sincronización, codificación y salida durante una sesión. |
| REQ-REC-005 | El sistema debe mantener la asociación entre los datos capturados y su sesión correspondiente. |
| REQ-REC-006 | El usuario debe poder cancelar una sesión activa. |
| REQ-REC-007 | Una sesión cancelada no debe presentarse como una grabación finalizada correctamente. |
| REQ-REC-008 | El sistema debe liberar los recursos asociados a la sesión cuando esta termine. |

---

# 12. Sincronización audiovisual

| ID | Requisito |
|---|---|
| REQ-SYNC-001 | El sistema debe utilizar información temporal para sincronizar vídeo y audio. |
| REQ-SYNC-002 | El sistema debe mantener una referencia temporal consistente durante una sesión. |
| REQ-SYNC-003 | El sistema debe detectar, cuando sea posible, desviaciones temporales relevantes entre flujos. |
| REQ-SYNC-004 | La pausa y reanudación no deben introducir una desincronización no controlada. |
| REQ-SYNC-005 | El archivo final debe mantener sincronizados los flujos de vídeo y audio dentro de los límites definidos para la configuración validada. |

---

# 13. Pausa y reanudación

| ID | Requisito |
|---|---|
| REQ-PAUSE-001 | El usuario debe poder pausar una grabación activa. |
| REQ-PAUSE-002 | Durante la pausa no deben incorporarse nuevos datos de captura como si la sesión continuara grabando. |
| REQ-PAUSE-003 | El usuario debe poder reanudar una sesión pausada. |
| REQ-PAUSE-004 | La reanudación debe mantener la identidad de la misma sesión. |
| REQ-PAUSE-005 | La reanudación debe preservar la coherencia temporal del resultado final. |
| REQ-PAUSE-006 | Una transición de pausa o reanudación inválida debe ser rechazada de forma explícita. |

---

# 14. Codificación

| ID | Requisito |
|---|---|
| REQ-ENC-001 | El sistema debe convertir los datos audiovisuales destinados a salida en streams codificados. |
| REQ-ENC-002 | El sistema debe soportar al menos un códec de vídeo estándar validado para la configuración objetivo. |
| REQ-ENC-003 | El sistema debe soportar al menos un códec de audio estándar cuando la grabación incluya audio. |
| REQ-ENC-004 | El sistema debe integrar los streams codificados en un contenedor de salida compatible con la configuración seleccionada. |
| REQ-ENC-005 | El sistema debe detectar errores de inicialización y ejecución del codificador. |
| REQ-ENC-006 | El sistema debe poder cancelar la codificación de una sesión cancelada. |
| REQ-ENC-007 | El sistema debe liberar los recursos del codificador al finalizar o cancelar una sesión. |

---

# 15. Hardware acceleration

| ID | Requisito |
|---|---|
| REQ-HW-001 | La arquitectura debe permitir utilizar codificación mediante hardware cuando esté disponible y sea compatible. |
| REQ-HW-002 | El sistema debe poder determinar si existe una capacidad de codificación por hardware utilizable. |
| REQ-HW-003 | La ausencia de hardware acceleration no debe impedir una configuración compatible que pueda ejecutarse mediante software. |
| REQ-HW-004 | El sistema debe disponer de un mecanismo de fallback hacia codificación por software cuando corresponda. |
| REQ-HW-005 | Un fallo del codificador por hardware debe producir un estado explícito. |
| REQ-HW-006 | El uso de hardware acceleration solo podrá declararse soportado después de las pruebas correspondientes. |

---

# 16. Salida y archivos

| ID | Requisito |
|---|---|
| REQ-OUT-001 | El usuario debe poder seleccionar el directorio de salida de las grabaciones. |
| REQ-OUT-002 | El sistema debe generar nombres de archivo que eviten colisiones no intencionadas. |
| REQ-OUT-003 | El sistema debe utilizar un mecanismo temporal para evitar presentar un archivo incompleto como resultado final. |
| REQ-OUT-004 | El archivo temporal debe finalizarse antes de considerarse resultado definitivo. |
| REQ-OUT-005 | El resultado final debe colocarse en la ubicación de salida seleccionada. |
| REQ-OUT-006 | El sistema debe validar el resultado final antes de marcar la grabación como completada cuando la validación sea técnicamente posible. |
| REQ-OUT-007 | Una salida inválida no debe presentarse como grabación exitosa. |
| REQ-OUT-008 | El sistema debe manejar explícitamente errores de escritura, almacenamiento y finalización. |

---

# 17. Integridad de archivos

| ID | Requisito |
|---|---|
| REQ-INT-001 | Una grabación incompleta no debe presentarse como resultado final válido. |
| REQ-INT-002 | El sistema debe finalizar correctamente el contenedor de salida antes de declarar completada la grabación. |
| REQ-INT-003 | La validación debe comprobar, como mínimo, que el resultado cumple las condiciones mínimas de integridad definidas para el formato utilizado. |
| REQ-INT-004 | Los archivos temporales de sesiones fallidas deben poder distinguirse de los archivos finales. |
| REQ-INT-005 | El sistema no debe sobrescribir intencionadamente una grabación existente sin una acción o política explícita que lo permita. |

---

# 18. Screenshots

| ID | Requisito |
|---|---|
| REQ-SHOT-001 | El sistema debe permitir capturar una imagen estática de una fuente de pantalla soportada. |
| REQ-SHOT-002 | El sistema debe permitir guardar la captura en almacenamiento local. |
| REQ-SHOT-003 | El sistema debe evitar colisiones accidentales de nombres de archivo. |
| REQ-SHOT-004 | El sistema debe aplicar las mismas reglas de validación de rutas y almacenamiento definidas para los archivos de salida. |

---

# 19. Cursor

| ID | Requisito |
|---|---|
| REQ-CUR-001 | El sistema debe permitir configurar si el cursor será incluido en la grabación. |
| REQ-CUR-002 | El comportamiento del cursor debe ser coherente con la fuente de captura seleccionada. |
| REQ-CUR-003 | La configuración del cursor debe aplicarse de manera verificable a la sesión correspondiente. |

---

# 20. Overlays y anotaciones

| ID | Requisito |
|---|---|
| REQ-ANO-001 | La arquitectura debe permitir incorporar overlays audiovisuales sin requerir una reestructuración fundamental del pipeline. |
| REQ-ANO-002 | La arquitectura debe permitir incorporar anotaciones en tiempo real como capacidad futura. |
| REQ-ANO-003 | Debe distinguirse entre elementos de UI que no forman parte de la grabación y elementos que sí serán incorporados al resultado. |
| REQ-ANO-004 | La implementación de anotaciones y overlays no forma parte del requisito mínimo de la primera versión salvo que una fase aprobada lo active. |

---

# 21. Hotkeys

| ID | Requisito |
|---|---|
| REQ-HK-001 | El usuario debe poder iniciar una grabación mediante un atajo de teclado global cuando la plataforma lo permita. |
| REQ-HK-002 | El usuario debe poder detener una grabación mediante un atajo configurable. |
| REQ-HK-003 | El usuario debe poder pausar y reanudar mediante atajos configurables. |
| REQ-HK-004 | Los atajos deben poder configurarse por el usuario. |
| REQ-HK-005 | El sistema debe detectar conflictos entre atajos configurados cuando sea técnicamente posible. |
| REQ-HK-006 | Un atajo no disponible o inválido no debe presentarse como activo. |
| REQ-HK-007 | Los atajos deben respetar las restricciones de seguridad y permisos de la plataforma. |

---

# 22. UI/UX

| ID | Requisito |
|---|---|
| REQ-UI-001 | La UI debe permitir iniciar una grabación sin una secuencia innecesariamente compleja de pasos. |
| REQ-UI-002 | La UI debe mostrar el estado actual de la sesión de grabación. |
| REQ-UI-003 | La UI debe mostrar, como mínimo, los estados relevantes de preparación, grabación, pausa, finalización, cancelación y error. |
| REQ-UI-004 | La UI debe permitir seleccionar una fuente de pantalla disponible. |
| REQ-UI-005 | La UI debe permitir configurar las fuentes de audio. |
| REQ-UI-006 | La UI debe permitir acceder a las configuraciones disponibles para el usuario. |
| REQ-UI-007 | La UI no debe depender directamente de APIs nativas de captura. |
| REQ-UI-008 | La UI no debe asumir como exitoso un estado que el subsistema correspondiente no haya confirmado. |
| REQ-UI-009 | Los errores relevantes deben comunicarse al usuario de forma comprensible. |

---

# 23. Configuración

| ID | Requisito |
|---|---|
| REQ-CFG-001 | El usuario debe poder configurar la resolución de captura cuando la plataforma y fuente lo permitan. |
| REQ-CFG-002 | El usuario debe poder configurar la frecuencia de frames cuando la configuración lo permita. |
| REQ-CFG-003 | El usuario debe poder configurar parámetros de calidad o bitrate cuando sean aplicables. |
| REQ-CFG-004 | El usuario debe poder seleccionar el dispositivo de micrófono. |
| REQ-CFG-005 | El usuario debe poder activar o desactivar el audio del sistema. |
| REQ-CFG-006 | El usuario debe poder activar o desactivar el micrófono. |
| REQ-CFG-007 | El usuario debe poder seleccionar el directorio de salida. |
| REQ-CFG-008 | La configuración persistente debe conservarse entre sesiones de la aplicación. |
| REQ-CFG-009 | La configuración inválida no debe provocar una inicialización insegura o indefinida. |
| REQ-CFG-010 | El sistema debe proporcionar valores predeterminados válidos para una configuración inicial soportada. |

---

# 24. Rendimiento

| ID | Requisito |
|---|---|
| REQ-PERF-001 | El sistema debe minimizar el impacto innecesario sobre CPU, GPU, memoria, almacenamiento y dispositivos durante la grabación. |
| REQ-PERF-002 | Los buffers utilizados para el pipeline deben tener límites controlados. |
| REQ-PERF-003 | El sistema debe disponer de un comportamiento definido ante saturación de buffers. |
| REQ-PERF-004 | El sistema no debe permitir crecimiento ilimitado de memoria debido a acumulación de frames o audio. |
| REQ-PERF-005 | El pipeline debe disponer de mecanismos de backpressure o control equivalente cuando sean necesarios. |
| REQ-PERF-006 | El sistema debe evitar copias innecesarias de grandes bloques de datos cuando exista una alternativa técnicamente segura. |
| REQ-PERF-007 | Las grabaciones prolongadas no deben producir crecimiento de memoria no controlado. |
| REQ-PERF-008 | El comportamiento ante saturación de CPU, GPU, memoria o almacenamiento debe ser controlado y observable. |

Los valores cuantitativos de consumo máximo deberán definirse mediante pruebas y criterios de aceptación de la fase correspondiente.

---

# 25. Compatibilidad Windows

Windows es la plataforma inicial del producto.

| ID | Requisito |
|---|---|
| REQ-WIN-001 | La plataforma objetivo inicial debe ser Windows 10 versión 1803 o superior, sujeto a validación de soporte en la matriz de compatibilidad. |
| REQ-WIN-002 | Las capacidades principales de captura deberán utilizar mecanismos de plataforma apropiados para la configuración soportada. |
| REQ-WIN-003 | La captura de audio del sistema deberá utilizar un mecanismo de loopback compatible con Windows. |
| REQ-WIN-004 | El acceso a capacidades protegidas deberá respetar los mecanismos de permisos y privacidad de Windows. |
| REQ-WIN-005 | El código dependiente de Windows debe estar aislado de la lógica independiente de plataforma. |
| REQ-WIN-006 | Las configuraciones multimonitor deberán probarse en hardware real. |
| REQ-WIN-007 | Las configuraciones de GPU deberán probarse en hardware real representativo. |
| REQ-WIN-008 | Los dispositivos de audio deberán probarse en hardware real. |
| REQ-WIN-009 | La compatibilidad declarada deberá corresponder exclusivamente a configuraciones realmente verificadas. |

Los mecanismos concretos de API y sus bindings deberán quedar definidos en la arquitectura y diseño de implementación correspondientes.

---

# 26. Seguridad

| ID | Requisito |
|---|---|
| REQ-SEC-001 | La aplicación no debe transmitir grabaciones o datos del usuario a servicios externos sin una acción explícita y autorizada del usuario. |
| REQ-SEC-002 | La aplicación no debe instalar software adicional sin autorización correspondiente. |
| REQ-SEC-003 | El funcionamiento básico no debe requerir privilegios administrativos innecesarios. |
| REQ-SEC-004 | La aplicación debe aplicar el principio de mínimo privilegio. |
| REQ-SEC-005 | Los archivos temporales y de configuración deben protegerse contra accesos no autorizados cuando la plataforma lo permita. |
| REQ-SEC-006 | Las rutas de entrada y salida deben validarse para evitar operaciones de archivos no autorizadas. |
| REQ-SEC-007 | Los errores no deben revelar secretos o información técnica innecesaria. |
| REQ-SEC-008 | Las credenciales, tokens, claves o secretos, si existieran, no deben registrarse en logs. |
| REQ-SEC-009 | La UI no debe considerarse una frontera de seguridad. |
| REQ-SEC-010 | Los cambios de estado críticos deben poder diagnosticarse mediante mecanismos de observabilidad apropiados sin exponer contenido sensible. |

---

# 27. Privacidad

| ID | Requisito |
|---|---|
| REQ-PRIV-001 | El procesamiento principal de las grabaciones debe realizarse localmente por defecto. |
| REQ-PRIV-002 | El almacenamiento principal de las grabaciones debe ser local por defecto. |
| REQ-PRIV-003 | El funcionamiento principal no debe depender de una conexión a Internet. |
| REQ-PRIV-004 | El sistema no debe transmitir automáticamente el contenido capturado a servidores externos. |
| REQ-PRIV-005 | El usuario debe conservar control sobre las grabaciones generadas. |
| REQ-PRIV-006 | El sistema debe minimizar la recopilación de datos que no sean necesarios para su funcionamiento. |
| REQ-PRIV-007 | Cualquier telemetría futura deberá ser explícitamente definida antes de su implementación. |
| REQ-PRIV-008 | La telemetría, si se implementa, deberá ser opcional y transparente para el usuario. |
| REQ-PRIV-009 | Los logs no deben contener innecesariamente contenido de pantalla, audio, cámara, grabaciones o información sensible. |

---

# 28. Manejo de errores

| ID | Requisito |
|---|---|
| REQ-ERR-001 | Los errores relevantes deben manejarse explícitamente. |
| REQ-ERR-002 | Los errores no deben ignorarse silenciosamente cuando afecten al resultado de la operación. |
| REQ-ERR-003 | Los errores críticos para la grabación deben comunicarse claramente al usuario. |
| REQ-ERR-004 | La falta de espacio de almacenamiento debe detectarse y manejarse explícitamente cuando sea posible. |
| REQ-ERR-005 | La pérdida de una fuente debe producir un estado conocido. |
| REQ-ERR-006 | La pérdida de una fuente opcional no debe detener automáticamente la sesión principal cuando el contrato de esa fuente establezca independencia. |
| REQ-ERR-007 | La cancelación debe distinguirse de un fallo. |
| REQ-ERR-008 | Una operación incompleta no debe reportarse como exitosa. |
| REQ-ERR-009 | Los recursos deben liberarse después de errores y cancelaciones. |

---

# 29. Recuperación

| ID | Requisito |
|---|---|
| REQ-RECOV-001 | El sistema debe detectar sesiones que hayan terminado de forma anormal cuando disponga de información suficiente para hacerlo. |
| REQ-RECOV-002 | Los archivos temporales de sesiones abortadas deben poder identificarse. |
| REQ-RECOV-003 | El sistema debe intentar preservar los datos recuperables de una sesión interrumpida cuando técnicamente sea viable. |
| REQ-RECOV-004 | Una recuperación no debe sobrescribir silenciosamente un archivo final válido. |
| REQ-RECOV-005 | El resultado de una recuperación debe clasificarse explícitamente como recuperado, parcial, fallido o descartado. |
| REQ-RECOV-006 | La limpieza de archivos temporales debe evitar eliminar datos potencialmente recuperables sin una política definida. |

---

# 30. Integridad y consistencia

| ID | Requisito |
|---|---|
| REQ-INTG-001 | El sistema debe distinguir entre datos temporales y resultados finales. |
| REQ-INTG-002 | Una sesión no debe marcarse como `COMPLETED` antes de que el resultado requerido haya sido finalizado y validado según las reglas aplicables. |
| REQ-INTG-003 | Las transiciones críticas de una sesión deben mantener un estado consistente. |
| REQ-INTG-004 | Un fallo durante la finalización debe impedir que el resultado sea reportado como correctamente finalizado. |
| REQ-INTG-005 | La validación del resultado debe formar parte del proceso de finalización cuando sea técnicamente posible. |

---

# 31. Testing

| ID | Requisito |
|---|---|
| REQ-TEST-001 | La lógica crítica independiente de plataforma debe disponer de pruebas unitarias apropiadas. |
| REQ-TEST-002 | Los flujos entre componentes principales deben disponer de pruebas de integración apropiadas. |
| REQ-TEST-003 | El pipeline de captura, procesamiento, codificación y salida debe probarse de extremo a extremo. |
| REQ-TEST-004 | Deben existir pruebas negativas para errores de captura, audio, almacenamiento, codificación y configuración. |
| REQ-TEST-005 | Deben probarse las transiciones principales del ciclo de vida de grabación. |
| REQ-TEST-006 | Deben probarse pausa y reanudación. |
| REQ-TEST-007 | Debe probarse la cancelación. |
| REQ-TEST-008 | Deben probarse configuraciones multimonitor. |
| REQ-TEST-009 | Deben probarse configuraciones reales de GPU. |
| REQ-TEST-010 | Deben probarse dispositivos reales de audio. |
| REQ-TEST-011 | Deben realizarse pruebas de grabaciones prolongadas. |
| REQ-TEST-012 | Deben realizarse pruebas de recuperación cuando dicha capacidad esté implementada. |
| REQ-TEST-013 | La validación de compatibilidad Windows debe realizarse sobre hardware real. |
| REQ-TEST-014 | Cada requisito que requiera evidencia de ejecución debe quedar vinculado a dicha evidencia mediante trazabilidad. |

---

# 32. Restricciones técnicas

| ID | Restricción |
|---|---|
| REQ-CONST-001 | El lenguaje principal del producto será Go. |
| REQ-CONST-002 | La plataforma inicial será Windows. |
| REQ-CONST-003 | No se introducirán dependencias externas sin justificación técnica y de licencia. |
| REQ-CONST-004 | Debe evitarse el estado global mutable innecesario. |
| REQ-CONST-005 | Las responsabilidades dependientes de plataforma deberán permanecer aisladas de la lógica independiente de plataforma. |
| REQ-CONST-006 | La implementación deberá respetar los contratos y límites arquitectónicos aprobados. |
| REQ-CONST-007 | No deberán introducirse dependencias, APIs o servicios no aprobados únicamente para solucionar problemas puntuales sin revisión arquitectónica. |

---

# 33. Portabilidad futura

La portabilidad futura no constituye soporte actual.

| ID | Requisito |
|---|---|
| REQ-FUT-001 | La arquitectura no debe impedir una futura implementación para macOS. |
| REQ-FUT-002 | La arquitectura no debe impedir una futura implementación para Linux. |
| REQ-FUT-003 | Las dependencias específicas de Windows deben permanecer aisladas. |
| REQ-FUT-004 | La futura portabilidad deberá evaluarse mediante requisitos y pruebas específicos de cada plataforma. |
| REQ-FUT-005 | La existencia de documentación para otra plataforma no implica que dicha plataforma esté implementada o soportada. |

---

# 34. Extensibilidad futura

| ID | Requisito |
|---|---|
| REQ-FUT-010 | La arquitectura debe permitir incorporar anotaciones en tiempo real. |
| REQ-FUT-011 | La arquitectura debe permitir incorporar overlays adicionales. |
| REQ-FUT-012 | La arquitectura debe permitir ampliar las fuentes audiovisuales sin modificar innecesariamente el núcleo de grabación. |
| REQ-FUT-013 | La posibilidad de plugins o extensiones deberá tratarse como una capacidad futura y no se considerará requisito de la primera versión. |

---

# 35. Requisitos de instalación y ejecución

| ID | Requisito |
|---|---|
| REQ-INST-001 | El usuario debe poder instalar y ejecutar una versión validada del producto. |
| REQ-INST-002 | La instalación no debe requerir privilegios administrativos cuando técnicamente sea posible mantener el funcionamiento básico sin ellos. |
| REQ-INST-003 | El mecanismo de instalación debe respetar los requisitos de seguridad de la plataforma. |
| REQ-INST-004 | La instalación debe dejar el producto en un estado verificable de ejecución. |
| REQ-INST-005 | La desinstalación no debe eliminar grabaciones del usuario sin una acción explícita o política claramente definida. |

---

# 36. Criterios generales de aceptación

| ID | Criterio |
|---|---|
| REQ-ACC-001 | Un usuario puede instalar y ejecutar una versión validada de SCREEN by KLIK en una configuración Windows soportada. |
| REQ-ACC-002 | El usuario puede seleccionar un monitor, ventana o región soportada. |
| REQ-ACC-003 | El usuario puede iniciar una grabación. |
| REQ-ACC-004 | El usuario puede pausar una grabación. |
| REQ-ACC-005 | El usuario puede reanudar una grabación. |
| REQ-ACC-006 | El usuario puede detener una grabación. |
| REQ-ACC-007 | El usuario puede cancelar una grabación. |
| REQ-ACC-008 | Una grabación finalizada correctamente produce un archivo reproducible en el formato validado. |
| REQ-ACC-009 | Cuando se habilita audio, el archivo final contiene el audio correspondiente a la configuración seleccionada. |
| REQ-ACC-010 | El vídeo y audio del resultado final mantienen sincronización dentro de los límites de aceptación establecidos por las pruebas. |
| REQ-ACC-011 | El sistema puede completar una grabación de al menos 15 minutos sin fallo funcional atribuible al producto. |
| REQ-ACC-012 | Una grabación cancelada no se presenta como grabación completada correctamente. |
| REQ-ACC-013 | Un fallo de almacenamiento no produce un falso estado de éxito. |
| REQ-ACC-014 | Una fuente de captura inválida no inicia una grabación válida. |
| REQ-ACC-015 | Una configuración de hardware acceleration no soportada puede utilizar el mecanismo de fallback validado. |
| REQ-ACC-016 | Las funciones críticas de la versión inicial quedan cubiertas por pruebas y evidencia documentada. |

---

# 37. Criterios de calidad

Un requisito no se considerará validado únicamente porque:

- compile el programa;
- exista una función;
- exista un archivo;
- la UI muestre un botón;
- el sistema produzca bytes;
- una prueba manual aislada parezca correcta.

La validación deberá demostrar:

1. comportamiento funcional;
2. manejo de errores;
3. integridad del resultado;
4. compatibilidad de la configuración;
5. rendimiento cuando corresponda;
6. estabilidad;
7. seguridad;
8. privacidad;
9. trazabilidad;
10. evidencia reproducible.

---

# 38. Estados de los requisitos

Los requisitos podrán utilizar los siguientes estados:

- `PLANNED`
- `APPROVED`
- `IMPLEMENTED`
- `PARTIAL`
- `TESTED`
- `VALIDATED`
- `CERTIFIED`
- `BLOCKED`
- `DEPRECATED`
- `REMOVED`

La existencia de un requisito en este documento **no significa que esté implementado**.

---

# 39. Trazabilidad

Cada requisito deberá poder relacionarse, cuando corresponda, con:

`REQUISITO → ARQUITECTURA → COMPONENTE → MÓDULO → FASE → IMPLEMENTACIÓN → PRUEBA → EVIDENCIA → VALIDACIÓN → CERTIFICACIÓN`

La matriz maestra de trazabilidad se mantiene en:

`docs/development/TRACEABILITY.md`

Un requisito sin implementación no deberá presentar evidencia de implementación.

Un requisito sin prueba no deberá presentarse como probado.

Un requisito sin evidencia no deberá presentarse como validado.

---

# 40. Evidencia

La evidencia deberá ser real y verificable.

Se consideran estados válidos:

- `UNKNOWN`
- `UNDETERMINED`
- `NOT IMPLEMENTED`
- `NOT EXECUTED`
- `BLOCKED`
- `FAILED`
- `PARTIAL`
- `PASSED`
- `VALIDATED`
- `CERTIFIED`

No deberán utilizarse datos inventados, resultados simulados presentados como reales, métricas ficticias o certificaciones sin evidencia.

---

# 41. Cambios de requisitos

Todo cambio de requisito deberá:

1. identificarse;
2. justificarse;
3. analizar su impacto;
4. actualizar la trazabilidad;
5. revisar arquitectura y fases afectadas;
6. actualizar pruebas cuando corresponda;
7. conservar el historial documental.

Un cambio de requisito no deberá introducirse únicamente para justificar una implementación existente.

---

# 42. Autoridad del documento

Este documento constituye la especificación autorizada de requisitos de SCREEN by KLIK.

La implementación deberá cumplir los requisitos aprobados.

Cuando exista conflicto entre implementación y requisito:

**el conflicto debe reportarse y resolverse documentalmente.**

La implementación no modifica unilateralmente el requisito.

---

# 43. Regla de integridad

SCREEN by KLIK no deberá aparentar estar:

- más avanzado;
- más completo;
- más compatible;
- más seguro;
- más estable;
- más optimizado;
- más probado;
- más validado;
- más certificado

de lo que la evidencia real permita demostrar.

**NO INVENTAR.  
NO OCULTAR.  
NO PARCHEAR.  
NO CERTIFICAR SIN EVIDENCIA.**

---

# 44. Estado actual

| Área | Estado |
|---|---|
| Requirements | DOCUMENTED |
| Architecture | DOCUMENTED |
| Components | DOCUMENTED |
| Technical specifications | DOCUMENTED |
| UI specifications | DOCUMENTED |
| Security | DOCUMENTED |
| Privacy | DOCUMENTED |
| Testing strategy | DOCUMENTED |
| Implementation | NOT STARTED |
| Automated tests | NOT EXECUTED |
| Platform validation | NOT EXECUTED |
| Performance validation | NOT EXECUTED |
| Security validation | NOT EXECUTED |
| Certification | NOT EXECUTED |

**SCREEN by KLIK permanece en fase documental/arquitectónica hasta que exista evidencia de implementación y validación.**