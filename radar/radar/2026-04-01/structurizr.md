---
title: Structurizr DSL
ring: adopt
quadrant: tools
tags: [PRACTITIONER]
---

[![](https://img.shields.io/badge/documentation-0c7cba?logo=gitbook&logoColor=000&style=flat)](https://docs.structurizr.com/dsl)
[![](https://img.shields.io/badge/github-de5f85?logo=github&logoColor=000&style=flat)](https://github.com/structurizr/dsl)

Structurizr DSL is a text-based notation for describing software architecture models conforming to the C4 model (Simon Brown). A workspace file defines the full model — people, systems, containers, components, relationships — and one or more views. The DSL is rendered by the Structurizr browser client or CLI, and supports themes, styles, and auto-layout.

We ADOPT Structurizr DSL as the single format for all architecture diagrams in the practice. The `@c4-modeler` agent produces DSL exclusively; source files live under `diagrams/` and are version-controlled alongside decisions and radar entries. The heraldry2 and topology themes from [cornifer-contrib](https://github.com/rvr06/cornifer-contrib) are applied for visual consistency.

Key conventions locked in: no type suffixes on identifiers, topological declaration order for implicit relationships, per-system `#name` tags with matching `stroke` styles in the `styles` block, and the `C4_x` view key naming scheme.
