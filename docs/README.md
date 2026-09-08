# Documentation — SCREEN by KLIK

## 1. Propósito

La carpeta `docs/` contiene la documentación técnica, arquitectónica, operacional, de desarrollo, seguridad, privacidad y legal de SCREEN by KLIK.

Su objetivo es proporcionar una fuente organizada y auditable de conocimiento del sistema.

---

# 2. Principio de Autoridad

Cada documento debe tener una responsabilidad claramente definida.

La documentación no deberá duplicar innecesariamente decisiones pertenecientes a otros documentos.

Cuando una decisión ya exista en una autoridad superior, deberá ser referenciada.

---

# 3. Estructura

```text
docs/
│
├── README.md
│
├── architecture/
│   └── ARCHITECTURE.md
│
├── components/
│   └── COMPONENTS.md
│
├── development/
│   ├── MODULES.md
│   ├── FUNCTIONS.md
│   ├── CHANGELOG.md
│   └── TRACEABILITY.md
│
├── legal/
│   ├── README.md
│   ├── PRIVACY.md
│   ├── TERMS.md
│   ├── DATA_RETENTION.md
│   └── SECURITY_POLICY.md
│
└── ...
```

---

# 4. Documentación Raíz

Los documentos raíz establecen el marco general:

| Documento | Responsabilidad |
|---|---|
| `README.md` | Identidad y entrada principal del proyecto |
| `ROADMAP.md` | Evolución y fases |
| `REQUIREMENTS.md` | Requisitos maestros |
| `MANIFESTO.md` | Principios del proyecto |
| `MAP.md` | Mapa documental |

---

# 5. Arquitectura

La documentación arquitectónica define la estructura del sistema.

Incluye:

- arquitectura;
- módulos;
- componentes;
- relaciones;
- responsabilidades;
- límites;
- dependencias.

La arquitectura no debe ser redefinida desde una fase individual.

---

# 6. Desarrollo

`docs/development/` contiene documentación relacionada con el proceso de ingeniería.

Incluye:

- módulos;
- funciones;
- cambios;
- trazabilidad;
- decisiones de desarrollo.

---

# 7. Legal y Políticas

`docs/legal/` mantiene separada la documentación legal y normativa de la documentación técnica.

Incluye, según corresponda:

- privacidad;
- términos;
- retención de datos;
- políticas de seguridad;
- otros documentos normativos.

---

# 8. Relación con las Fases

Las fases físicas se encuentran fuera de `docs/`:

```text
phases/
```

Cada fase debe contener documentación autónoma:

```text
PHASE-XX/
├── README.md
└── REQUIREMENTS.md
```

---

# 9. Regla de Integridad

La documentación deberá representar el estado real del proyecto.

No deberá declararse:

```text
IMPLEMENTED
TESTED
VALIDATED
CERTIFIED
```

sin evidencia correspondiente.

---

# 10. Estado

```text
STATUS: ACTIVE
DOCUMENTATION SYSTEM: DEFINED
LEGAL REVIEW: PENDING WHERE APPLICABLE
CERTIFICATION: NOT APPLICABLE
```