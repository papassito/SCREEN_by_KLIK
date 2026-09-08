# MAP — SCREEN by KLIK

## 1. Propósito

Este documento establece el mapa físico y la navegación topográfica del repositorio de **SCREEN by KLIK**.

Su función es permitir localizar rápidamente cada documento y determinar dónde debe consultarse la información correspondiente a cada dominio del proyecto.

`MAP.md` es un **índice estructural y de navegación**.

No constituye una autoridad funcional, arquitectónica, contractual, legal ni de implementación.

No redefine:

- requisitos;
- arquitectura;
- módulos;
- componentes;
- contratos;
- políticas;
- fases;
- pruebas;
- validaciones;
- certificaciones.

La autoridad de cada dominio permanece en su documento correspondiente.

---

# 2. Principio de Navegación

La documentación de SCREEN by KLIK se organiza por **responsabilidad documental**.

La pregunta:

> "¿Dónde está definida esta información?"

debe resolverse siguiendo este mapa y no mediante suposiciones.

La regla general es:

```text
MAP
 │
 ├── identifica dónde buscar
 │
 └── NO redefine qué debe decir el documento encontrado
```

---

# 3. Mapa Maestro del Repositorio

```text
SCREEN-BY-KLIK/
│
├── MANIFESTO.md
│   └── Principios fundamentales y reglas de gobierno del proyecto
│
├── README.md
│   └── Identidad, propósito y contexto general del producto
│
├── ROADMAP.md
│   └── Orden de evolución y progresión planificada del proyecto
│
├── CHANGELOG.md
│   └── Historial documental verificable de cambios realizados
│
├── MAP.md
│   └── Mapa maestro de navegación del repositorio
│
├── docs/
│   │
│   ├── README.md
│   │   └── Índice general de la documentación especializada
│   │
│   ├── requirements/
│   │   └── REQUIREMENTS.md
│   │       └── Autoridad oficial de requisitos
│   │
│   ├── architecture/
│   │   └── ARCHITECTURE.md
│   │       └── Autoridad arquitectónica
│   │
│   ├── components/
│   │   └── COMPONENTS.md
│   │       └── Definición y organización de componentes
│   │
│   ├── development/
│   │   ├── MODULES.md
│   │   │   └── Definición de módulos
│   │   │
│   │   ├── FUNCTIONS.md
│   │   │   └── Definición documental de funciones
│   │   │
│   │   └── TRACEABILITY.md
│   │       └── Matriz derivada de trazabilidad
│   │
│   ├── contracts/
│   │   └── CONTRACT.md
│   │       └── Contratos y reglas de integridad técnica
│   │
│   └── legal/
│       └── ...
│           └── Políticas, privacidad, licencias y documentación legal
│
└── phases/
    │
    ├── PHASE-00-CONTRACT/
    │   └── README.md
    │
    ├── PHASE-01-FOUNDATION/
    │   └── README.md
    │
    ├── PHASE-02-DISPLAY-DETECTION/
    │   └── README.md
    │
    ├── PHASE-03-...
    │   └── README.md
    │
    ├── PHASE-04-AUDIO/
    │   └── README.md
    │
    ├── PHASE-05-...
    │   └── README.md
    │
    ├── PHASE-06-...
    │   └── README.md
    │
    ├── PHASE-07-...
    │   └── README.md
    │
    ├── PHASE-08-...
    │   └── README.md
    │
    ├── PHASE-09-...
    │   └── README.md
    │
    ├── PHASE-10-...
    │   └── README.md
    │
    ├── PHASE-11-HOTKEYS/
    │   └── README.md
    │
    ├── PHASE-12-...
    │   └── README.md
    │
    ├── PHASE-13-...
    │   └── README.md
    │
    ├── PHASE-14-...
    │   └── README.md
    │
    ├── PHASE-15-...
    │   └── README.md
    │
    ├── PHASE-16-...
    │   └── README.md
    │
    ├── PHASE-17-...
    │   └── README.md
    │
    ├── PHASE-18-...
    │   └── README.md
    │
    ├── PHASE-19-...
    │   └── README.md
    │
    └── PHASE-20-FINAL-CERTIFICATION/
        └── README.md
```

> **Nota:** Los nombres representados como `PHASE-XX-...` son marcadores topográficos. No constituyen nombres oficiales hasta que hayan sido verificados contra la estructura real del repositorio.

---

# 4. Documentación de Raíz

## 4.1 `MANIFESTO.md`

Define los principios fundamentales que gobiernan el proyecto.

Responsabilidad:

- principios;
- gobierno documental;
- integridad;
- trazabilidad;
- honestidad de estados;
- documentación antes de implementación;
- seguridad y privacidad como principios;
- reglas de evolución.

No sustituye los documentos especializados.

---

## 4.2 `README.md`

Documento de entrada general al proyecto.

Responsabilidad:

- identidad del producto;
- propósito;
- contexto general;
- orientación inicial;
- navegación de alto nivel.

No sustituye los documentos de autoridad especializados.

---

## 4.3 `ROADMAP.md`

Describe la progresión planificada del proyecto.

Responsabilidad:

- orden de trabajo;
- evolución;
- prioridades;
- secuencia planificada;
- estado general del roadmap.

El roadmap no convierte automáticamente una propuesta en implementación.

---

## 4.4 `CHANGELOG.md`

Registra la evolución histórica verificable del proyecto.

Responsabilidad:

- cambios realizados;
- correcciones;
- modificaciones documentales;
- cambios de estructura;
- acontecimientos históricos verificables.

No debe utilizarse para convertir planes futuros en hechos históricos.

---

## 4.5 `MAP.md`

Este documento.

Responsabilidad:

- ubicación;
- navegación;
- estructura física;
- relación topográfica entre documentos y directorios.

No es una autoridad de contenido.

---

# 5. Documentación Especializada

El directorio `docs/` contiene la documentación especializada del proyecto.

Su organización separa las diferentes responsabilidades documentales.

---

## 5.1 Requirements

```text
docs/
└── requirements/
    └── REQUIREMENTS.md
```

### Autoridad

`docs/requirements/REQUIREMENTS.md`

Es la autoridad oficial para los requisitos del sistema.

Aquí deben consultarse:

- requisitos funcionales;
- requisitos no funcionales;
- restricciones;
- criterios definidos como requisitos;
- identificadores oficiales de requisitos.

Otros documentos no deben inventar requisitos ni modificar silenciosamente su significado.

---

# 6. Arquitectura

```text
docs/
└── architecture/
    └── ARCHITECTURE.md
```

### Autoridad

`docs/architecture/ARCHITECTURE.md`

Define la arquitectura del sistema.

Es el lugar correspondiente para consultar:

- modelo arquitectónico;
- límites;
- relaciones arquitectónicas;
- responsabilidades arquitectónicas;
- decisiones estructurales;
- dependencias arquitectónicas;
- principios técnicos de organización.

Las fases no deben convertirse en una segunda arquitectura.

---

# 7. Componentes

```text
docs/
└── components/
    └── COMPONENTS.md
```

### Autoridad

`docs/components/COMPONENTS.md`

Define los componentes del sistema y su organización documental.

Las fases pueden utilizar componentes, pero no redefinir globalmente su responsabilidad.

---

# 8. Desarrollo

```text
docs/
└── development/
    ├── MODULES.md
    ├── FUNCTIONS.md
    └── TRACEABILITY.md
```

---

## 8.1 `MODULES.md`

Define los módulos reconocidos por el sistema.

Su autoridad corresponde al dominio de módulos.

---

## 8.2 `FUNCTIONS.md`

Documenta las funciones reconocidas por el proyecto cuando corresponda.

No debe utilizarse para inventar funciones que no hayan sido definidas por la documentación de autoridad correspondiente.

---

## 8.3 `TRACEABILITY.md`

Contiene la matriz de trazabilidad derivada.

Su función es relacionar información ya existente en las autoridades documentales.

La trazabilidad debe representar relaciones reales.

No puede crear por sí misma:

- requisitos;
- módulos;
- componentes;
- contratos;
- implementaciones;
- pruebas;
- evidencias;
- validaciones;
- certificaciones.

La cadena de referencia es:

```text
REQUIREMENT
    ↓
ARCHITECTURE
    ↓
MODULE
    ↓
COMPONENT
    ↓
TECHNICAL DOCUMENTATION
    ↓
PHASE
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

Cuando una relación no esté demostrada, debe conservarse como estado no verificado o pendiente, según corresponda.

---

# 9. Contratos

```text
docs/
└── contracts/
    └── CONTRACT.md
```

`CONTRACT.md` constituye la autoridad para los contratos y reglas de integridad técnica que correspondan a este dominio.

Los contratos establecen límites que la implementación debe respetar.

La implementación no puede modificar unilateralmente un contrato.

El flujo correcto es:

```text
CONTRACT
   ↓
IMPLEMENTATION
```

y no:

```text
IMPLEMENTATION
   ↓
REDEFINE CONTRACT
```

---

# 10. Legal

```text
docs/
└── legal/
    └── ...
```

Este directorio contiene la documentación relacionada con:

- privacidad;
- políticas;
- licencias;
- términos;
- cumplimiento;
- responsabilidades legales;
- documentación normativa aplicable.

La documentación legal mantiene su propia autoridad.

La documentación técnica no debe sustituirla ni reinterpretarla como si fuera una especificación técnica.

---

# 11. Fases

```text
phases/
```

El directorio `phases/` contiene las unidades autónomas de evolución del proyecto.

Cada fase debe estar encapsulada en su propio directorio:

```text
phases/
└── PHASE-XX-NAME/
    └── README.md
```

La estructura permite que cada fase pueda:

- definir su propósito;
- establecer su alcance;
- declarar dependencias;
- documentar entradas y salidas;
- definir estado;
- declarar riesgos;
- identificar requisitos aplicables;
- identificar componentes y módulos relacionados;
- establecer criterios de entrada;
- establecer criterios de salida;
- documentar pruebas previstas;
- documentar evidencia requerida;
- mantener su propia documentación.

Sin embargo, una fase **no constituye una autoridad paralela** para:

- requisitos globales;
- arquitectura global;
- contratos globales;
- políticas;
- componentes globales;
- módulos globales.

Cuando exista conflicto entre una fase y una autoridad superior, el conflicto debe resolverse en la autoridad correspondiente.

---

# 12. Estructura Interna de una Fase

La estructura mínima esperada es:

```text
PHASE-XX-NAME/
└── README.md
```

El `README.md` de la fase constituye su punto de entrada documental.

Una fase podrá incorporar documentación adicional cuando exista una necesidad real y documentada.

No deberán crearse archivos adicionales únicamente para aparentar mayor madurez documental.

La estructura debe crecer por necesidad, no por simulación.

---

# 13. Estado de las Fases

La presencia física de un directorio de fase **no implica que la fase esté implementada**.

La topología del repositorio y el estado de implementación son conceptos independientes.

Ejemplo:

```text
phases/
└── PHASE-11-HOTKEYS/
    └── README.md
```

significa que existe una unidad documental para esa fase.

No significa necesariamente:

```text
IMPLEMENTED
TESTED
VALIDATED
CERTIFIED
```

Cada fase debe declarar explícitamente su estado.

---

# 14. Navegación por Pregunta

Para localizar la autoridad adecuada:

| Pregunta | Documento |
|---|---|
| ¿Cuáles son los principios del proyecto? | `MANIFESTO.md` |
| ¿Qué es SCREEN by KLIK? | `README.md` |
| ¿Cuál es el orden de evolución? | `ROADMAP.md` |
| ¿Qué cambió históricamente? | `CHANGELOG.md` |
| ¿Dónde está un documento? | `MAP.md` |
| ¿Cuál es el requisito oficial? | `docs/requirements/REQUIREMENTS.md` |
| ¿Cómo está diseñado el sistema? | `docs/architecture/ARCHITECTURE.md` |
| ¿Cuáles son los componentes? | `docs/components/COMPONENTS.md` |
| ¿Cuáles son los módulos? | `docs/development/MODULES.md` |
| ¿Cuáles son las funciones documentadas? | `docs/development/FUNCTIONS.md` |
| ¿Cómo se relacionan requisitos y demás elementos? | `docs/development/TRACEABILITY.md` |
| ¿Cuáles son los contratos? | `docs/contracts/CONTRACT.md` |
| ¿Dónde está la documentación legal? | `docs/legal/` |
| ¿Dónde está documentada una fase? | `phases/PHASE-XX-NAME/README.md` |

---

# 15. Regla de Autoridad

El mapa solamente indica **dónde buscar**.

La autoridad se determina por el dominio documental.

En términos generales:

```text
MANIFESTO
    │
    ├── principios
    │
    ▼
REQUIREMENTS
    │
    ├── requisitos
    │
    ▼
ARCHITECTURE
    │
    ├── arquitectura
    │
    ├── MODULES
    │
    └── COMPONENTS
          │
          ▼
    TECHNICAL DOCUMENTATION
          │
          ▼
        PHASES
          │
          ▼
    IMPLEMENTATION
          │
          ▼
        TESTS
          │
          ▼
       EVIDENCE
          │
          ▼
      VALIDATION
          │
          ▼
     CERTIFICATION
```

Esta representación describe el flujo documental y de ingeniería.

No significa que `MAP.md` sea autoridad sobre ninguno de esos dominios.

---

# 16. Regla de No Invención

El mapa no debe inventar elementos del repositorio.

No deberán incorporarse como existentes:

- archivos que no existan;
- directorios que no existan;
- fases no verificadas;
- requisitos no registrados;
- módulos no definidos;
- componentes no definidos;
- contratos no existentes;
- implementaciones no realizadas.

Cuando la estructura futura sea relevante para explicar la organización, deberá distinguirse explícitamente como:

```text
PLANNED
```

o:

```text
TBD
```

según corresponda.

---

# 17. Diferencia entre Topología y Estado

El mapa responde:

> ¿Dónde está?

El estado documental responde:

> ¿Qué existe?

El estado de implementación responde:

> ¿Está implementado?

El estado de pruebas responde:

> ¿Está probado?

La evidencia responde:

> ¿Puede demostrarse?

La validación responde:

> ¿Cumple?

La certificación responde:

> ¿Ha sido certificado?

Por lo tanto:

```text
EXISTENCIA DEL ARCHIVO
        ≠
IMPLEMENTACIÓN
        ≠
TEST
        ≠
EVIDENCIA
        ≠
VALIDACIÓN
        ≠
CERTIFICACIÓN
```

---

# 18. Regla de Consistencia

El mapa debe mantenerse consistente con la estructura física real del repositorio.

Cuando cambie la topología:

1. identificar el cambio;
2. actualizar `MAP.md`;
3. revisar los enlaces afectados;
4. revisar `docs/README.md`;
5. revisar documentos que dependan de la ruta modificada;
6. actualizar `CHANGELOG.md` cuando corresponda;
7. revisar trazabilidad si el cambio afecta referencias documentales.

Ningún cambio estructural debe dejar deliberadamente rutas obsoletas.

---

# 19. Relación con TRACEABILITY

`MAP.md` y `TRACEABILITY.md` tienen responsabilidades diferentes.

```text
MAP
↓
¿Dónde está el documento?

TRACEABILITY
↓
¿Cómo se relacionan los elementos documentados?
```

`MAP.md` no debe convertirse en una matriz de trazabilidad.

`TRACEABILITY.md` no debe convertirse en un mapa físico del repositorio.

Cada documento conserva su responsabilidad.

---

# 20. Relación con CHANGELOG

`MAP.md` representa la estructura vigente del repositorio.

`CHANGELOG.md` representa la historia de los cambios realizados.

Por lo tanto:

```text
MAP
    ↓
ESTRUCTURA VIGENTE

CHANGELOG
    ↓
HISTORIA DEL CAMBIO
```

El mapa no debe utilizarse para reconstruir artificialmente la historia.

El changelog no debe utilizarse para describir como histórico algo que todavía no ocurrió.

---

# 21. Regla de Navegación Documental

Ante cualquier duda documental, debe seguirse este orden:

```text
1. IDENTIFICAR EL DOMINIO
        ↓
2. CONSULTAR MAP.md
        ↓
3. LOCALIZAR LA AUTORIDAD
        ↓
4. CONSULTAR EL DOCUMENTO DE AUTORIDAD
        ↓
5. CONSULTAR DOCUMENTACIÓN DERIVADA
        ↓
6. CONSULTAR LA FASE CORRESPONDIENTE
```

No debe invertirse el flujo para convertir una documentación secundaria en autoridad.

---

# 22. Regla de Mantenimiento

Cada modificación de estructura deberá conservar:

- navegación válida;
- rutas coherentes;
- referencias correctas;
- autoridad documental clara;
- separación de responsabilidades;
- integridad histórica;
- trazabilidad cuando corresponda.

El objetivo no es mantener un árbol bonito.

El objetivo es mantener un repositorio **navegable, verificable y auditable**.

---

# 23. Estado del Documento

```text
DOCUMENT: MAP.md

ROLE:
  Repository topology and navigation map

AUTHORITY:
  Structural/navigation authority only

FUNCTIONAL AUTHORITY:
  NONE

ARCHITECTURAL AUTHORITY:
  NONE

CONTRACT AUTHORITY:
  NONE

IMPLEMENTATION:
  NOT APPLICABLE

TESTING:
  NOT APPLICABLE

VALIDATION:
  NOT APPLICABLE

CERTIFICATION:
  NOT APPLICABLE
```

---

# 24. Declaración Final

`MAP.md` existe para que SCREEN by KLIK pueda responder de forma inequívoca:

> **¿Dónde está la información que estoy buscando?**

El mapa localiza.

Los documentos especializados definen.

Los contratos delimitan.

La arquitectura estructura.

Los requisitos establecen qué debe cumplirse.

Las fases organizan la evolución.

La implementación materializa.

Las pruebas verifican.

La evidencia demuestra.

La validación determina cumplimiento.

La certificación establece un estado certificado.

Por tanto:

```text
MAP ≠ REQUIREMENTS
MAP ≠ ARCHITECTURE
MAP ≠ CONTRACT
MAP ≠ TRACEABILITY
MAP ≠ IMPLEMENTATION
MAP ≠ CERTIFICATION
```

**MAP.md es el mapa del sistema documental, no una autoridad paralela del sistema.**