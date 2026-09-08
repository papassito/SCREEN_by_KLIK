# SCREEN by KLIK — Installation

## 1. Propósito

Este documento define los principios y métodos previstos para la instalación, distribución, actualización y desinstalación de **SCREEN by KLIK**.

Su objetivo es establecer una estrategia de distribución clara, segura, reproducible y compatible con la arquitectura del producto, sin congelar prematuramente herramientas o mecanismos que todavía no hayan sido evaluados y aprobados.

**Estado General:** `PLANNED`

---

## 2. Principios de Instalación

Los mecanismos de instalación y distribución deberán respetar los siguientes principios:

- **Simplicidad:** la instalación deberá requerir la menor cantidad razonable de pasos.
- **Integridad:** los artefactos instalados deberán corresponder a una versión identificable.
- **Seguridad:** la instalación no deberá introducir permisos innecesarios.
- **Reversibilidad:** deberá existir un mecanismo controlado de desinstalación o retiro.
- **Preservación de datos:** la desinstalación no deberá eliminar grabaciones ni datos personales del usuario salvo autorización explícita.
- **Trazabilidad:** deberá ser posible identificar qué versión fue instalada.
- **Separación de aplicación y datos:** los archivos de la aplicación deberán distinguirse de las grabaciones y demás datos generados por el usuario.
- **Compatibilidad:** el mecanismo deberá respetar las restricciones de la plataforma objetivo.

---

## 3. Métodos de Distribución Previstos

Se contemplan inicialmente dos modalidades:

1. **Distribución mediante instalador.**
2. **Distribución portable.**

Estas modalidades representan una estrategia prevista y no implican que ambas deban existir obligatoriamente en la primera versión pública.

La decisión definitiva deberá basarse en:

- requisitos del producto;
- plataforma objetivo;
- experiencia de instalación;
- seguridad;
- mantenimiento;
- actualización;
- pruebas;
- evidencia obtenida durante la implementación.

**Estado:** `PLANNED`

---

# 4. Instalador

## 4.1. Objetivo

El instalador deberá proporcionar un mecanismo controlado para incorporar SCREEN by KLIK al sistema del usuario.

Deberá permitir, según las capacidades finalmente aprobadas:

- instalar la aplicación;
- seleccionar o confirmar la ubicación de instalación;
- crear accesos directos cuando corresponda;
- registrar la aplicación para su posterior desinstalación;
- instalar los recursos necesarios;
- identificar correctamente la versión instalada.

La tecnología concreta del instalador permanece:

**TBD**

No se establece actualmente una dependencia obligatoria de Inno Setup, NSIS u otra herramienta específica.

---

## 4.2. Ubicación de Instalación

La ubicación de instalación deberá:

- ser identificable;
- respetar las convenciones de la plataforma;
- evitar conflictos con permisos;
- permitir una actualización controlada;
- mantener separadas las grabaciones y datos del usuario.

La ruta definitiva deberá determinarse durante la implementación y validarse en las plataformas objetivo.

**Estado:** `TBD`

---

## 4.3. Accesos Directos

Cuando corresponda, el instalador podrá crear accesos directos para facilitar el acceso a la aplicación.

Estos podrán incluir, según el diseño definitivo:

- Menú Inicio;
- Escritorio;
- otros mecanismos soportados por la plataforma.

Los accesos directos creados por la instalación deberán poder identificarse y eliminarse durante la desinstalación.

**Estado:** `PLANNED`

---

## 4.4. Registro de Instalación

Cuando la plataforma requiera o proporcione un mecanismo formal para registrar aplicaciones instaladas, SCREEN by KLIK podrá utilizarlo.

El registro deberá limitarse a la información necesaria para:

- identificar la instalación;
- conocer la versión;
- permitir una desinstalación adecuada;
- facilitar operaciones de mantenimiento.

No deberán almacenarse datos innecesarios.

**Estado:** `PLANNED / TBD`

---

# 5. Desinstalación

La desinstalación deberá retirar los elementos pertenecientes a la instalación de SCREEN by KLIK.

Como mínimo, deberá contemplar:

- archivos de aplicación;
- componentes instalados;
- accesos directos creados por la aplicación;
- registros de instalación correspondientes.

La desinstalación **no deberá eliminar automáticamente**:

- grabaciones del usuario;
- archivos personales;
- configuraciones que el usuario haya decidido conservar;
- otros datos de usuario.

Si posteriormente se ofrece una opción para eliminar datos personales, deberá existir una confirmación explícita y una descripción clara de lo que será eliminado.

**Estado:** `PLANNED`

---

# 6. Datos de Usuario

SCREEN by KLIK deberá diferenciar conceptualmente entre:

```text
APLICACIÓN
   │
   ├── Archivos del producto
   ├── Recursos de ejecución
   └── Componentes de instalación
       
DATOS DEL USUARIO
   │
   ├── Grabaciones
   ├── Configuración
   └── Preferencias
```

Esta separación será fundamental para evitar que una actualización o desinstalación destruya información generada por el usuario.

Las ubicaciones físicas definitivas de estos datos permanecen:

**TBD**

---

# 7. Versión Portable

## 7.1. Objetivo

La modalidad portable deberá permitir ejecutar SCREEN by KLIK sin requerir un proceso de instalación tradicional.

El paquete podrá distribuirse, por ejemplo, mediante un archivo comprimido que contenga los componentes necesarios para ejecutar una versión determinada.

El formato definitivo de distribución permanece:

**TBD**

---

## 7.2. Características Esperadas

La modalidad portable deberá procurar:

- facilidad de extracción;
- ejecución directa;
- ausencia de un proceso de instalación convencional;
- mínima modificación del sistema anfitrión;
- identificación clara de la versión;
- separación adecuada entre aplicación y datos del usuario.

La necesidad de privilegios elevados deberá evaluarse según las capacidades que finalmente implemente SCREEN by KLIK.

No deberá afirmarse que la aplicación será universalmente ejecutable sin privilegios administrativos hasta que dicha condición haya sido validada en los escenarios correspondientes.

---

## 7.3. Configuración Portable

La configuración de una versión portable deberá contar con una política explícita de almacenamiento.

No deberá asumirse automáticamente que la aplicación puede escribir en la misma carpeta donde reside el ejecutable.

La ubicación de configuración deberá considerar:

- permisos del usuario;
- restricciones del sistema operativo;
- posibilidad de ejecutar desde medios de solo lectura;
- portabilidad;
- persistencia;
- separación de datos personales.

La política definitiva permanece:

**TBD**

---

# 8. Actualización

El sistema de distribución deberá contemplar una estrategia de actualización cuando exista más de una versión publicada.

La actualización deberá preservar, salvo indicación explícita:

- grabaciones;
- configuraciones;
- preferencias;
- datos del usuario.

Deberá evitarse que una actualización sustituya o elimine accidentalmente información personal.

El mecanismo de actualización automática, si se adopta, permanece:

**TBD**

La existencia de versiones instalables no implica automáticamente que exista actualización automática.

---

# 9. Integridad de los Paquetes

Antes de distribuir un paquete deberá poder verificarse su correspondencia con la versión que representa.

Cuando corresponda, deberán registrarse:

- nombre del paquete;
- versión;
- plataforma;
- arquitectura;
- tamaño;
- hash de integridad;
- información de firma;
- origen del artefacto.

La firma digital podrá utilizarse como mecanismo adicional de autenticidad e integridad cuando forme parte de la política definitiva de distribución.

**Estado:** `PLANNED`

---

# 10. Compatibilidad de Plataforma

La instalación deberá validarse en las plataformas oficialmente soportadas por SCREEN by KLIK.

Para cada plataforma deberán determinarse:

- versión mínima del sistema operativo;
- arquitectura;
- requisitos de hardware;
- dependencias;
- permisos requeridos;
- comportamiento del instalador;
- comportamiento de la versión portable;
- comportamiento de la desinstalación.

La plataforma objetivo inicial permanece:

**TBD**

---

# 11. Errores de Instalación

Los errores durante la instalación deberán:

- detener la operación cuando sea necesario;
- informar claramente el problema;
- evitar dejar un estado parcialmente instalado sin identificar;
- permitir recuperación o limpieza cuando corresponda;
- conservar la integridad de los datos existentes del usuario.

Una instalación parcialmente ejecutada no deberá presentarse como instalación exitosa.

---

# 12. Seguridad

El proceso de instalación deberá evaluarse frente a riesgos como:

- ejecución de artefactos no autorizados;
- modificación indebida de ubicaciones protegidas;
- escalamiento innecesario de privilegios;
- sustitución de archivos;
- paquetes manipulados;
- dependencias comprometidas;
- persistencia no autorizada;
- eliminación accidental de datos.

La instalación deberá solicitar únicamente los privilegios necesarios para las operaciones realmente requeridas.

---

# 13. Validación

Antes de certificar un mecanismo de instalación deberán validarse, como mínimo:

- instalación limpia;
- instalación sobre una versión compatible, cuando corresponda;
- actualización;
- desinstalación;
- conservación de datos;
- comportamiento con permisos restringidos;
- integridad de los artefactos;
- ejecución posterior a la instalación;
- recuperación ante instalación fallida.

Para la modalidad portable deberán validarse adicionalmente:

- extracción;
- ejecución;
- persistencia de configuración;
- permisos;
- funcionamiento desde diferentes ubicaciones;
- comportamiento cuando la ubicación de ejecución no sea escribible.

**Estado:** `PLANNED`

---

# 14. Relación con Release Process

La instalación no constituye por sí misma un release.

La relación correcta será:

```text
BUILD
   ↓
ARTEFACTO
   ↓
VALIDACIÓN
   ↓
EMPAQUETADO
   ↓
INSTALACIÓN / DISTRIBUCIÓN
   ↓
RELEASE
```

Los paquetes de instalación deberán generarse a partir de artefactos previamente validados.

La publicación de un instalador no deberá convertir automáticamente un artefacto no validado en una versión oficial.

---

# 15. Relación con Build Process

El proceso de instalación depende de artefactos generados mediante el proceso de construcción correspondiente.

Por tanto:

```text
BUILD PROCESS
      ↓
ARTEFACTO VALIDADO
      ↓
PACKAGING
      ↓
INSTALLATION
```

La construcción y la instalación deberán permanecer conceptualmente separadas.

Un build exitoso no implica que el instalador sea válido.

Un instalador funcional no implica que el producto completo esté certificado.

---

# 16. Checklist de Instalación

### Instalador

- [ ] Artefacto de instalación identificado.
- [ ] Versión identificada.
- [ ] Plataforma identificada.
- [ ] Arquitectura identificada.
- [ ] Integridad verificada.
- [ ] Firma verificada cuando corresponda.
- [ ] Instalación limpia validada.
- [ ] Ubicación de instalación validada.
- [ ] Accesos directos validados.
- [ ] Registro de instalación validado cuando corresponda.
- [ ] Desinstalación validada.
- [ ] Datos del usuario preservados.
- [ ] Errores de instalación evaluados.

### Portable

- [ ] Paquete identificado.
- [ ] Integridad verificada.
- [ ] Versión identificada.
- [ ] Extracción validada.
- [ ] Ejecución validada.
- [ ] Política de configuración validada.
- [ ] Permisos evaluados.
- [ ] Datos del usuario preservados.
- [ ] Comportamiento sin privilegios elevados validado cuando corresponda.

---

# 17. Estado Real de Implementación

**Estado actual:** `PLANNED`

### Justificación

SCREEN by KLIK se encuentra actualmente en fase de planificación y definición arquitectónica.

No existe todavía:

- un instalador oficial;
- un paquete portable oficial;
- un mecanismo de actualización operativo;
- un procedimiento de desinstalación implementado;
- un canal oficial de distribución;
- una política definitiva de almacenamiento de configuración;
- una plataforma de distribución certificada.

Por lo tanto, este documento define **la estrategia prevista**, no capacidades actualmente disponibles.

---

# 18. Evolución

La estrategia de instalación deberá evolucionar conforme avance el proyecto:

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
RELEASED
```

Cada transición deberá estar respaldada por evidencia correspondiente.

---

# 19. Regla Suprema

> **La instalación debe facilitar la distribución del producto sin comprometer la seguridad, la integridad de la aplicación ni los datos del usuario.**

Un instalador no deberá considerarse terminado porque exista un paquete.

Una versión portable no deberá considerarse válida porque pueda descomprimirse.

La instalación deberá ser **reproducible, verificable y reversible**, y su comportamiento deberá demostrarse mediante pruebas reales.

**Estado del documento:** `PLANNED`