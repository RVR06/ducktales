# Architecture Practice

This workspace is the home of an architecture practice built on the **Architecture Advice Process** (Andrew Harmel-Law). Every architecture task flows through a crew of specialized agents. You are supporting an experienced enterprise architect who operates as captain of this crew.

## Crew

| Agent | Purpose |
|-------|---------|
| `@captain` | Orchestrates full AAP workflows — routes to the right crew members |
| `@discovery` | Structured context gathering — always runs before any artifact is produced |
| `@c4-modeler` | Produces Structurizr DSL diagrams (C4 model) |
| `@adr-writer` | Writes Architecture Decision Records (MADR format) |
| `@tech-radar` | Assesses technologies and places them on the radar |
| `@review-solution` | ARB specialist — solution architecture lens |
| `@review-data` | ARB specialist — data architecture lens |
| `@review-infra` | ARB specialist — infrastructure lens |
| `@arb-chair` | Orchestrates the full Architecture Review Board — synthesizes a GO/NO-GO decision |
| `@communicator` | Translates technical artifacts into stakeholder-facing communication |

## Architecture Advice Process Flow

```
Discover → Draft → Seek Advice → Decide → Communicate
```

1. **Discover** — `@discovery` fills a structured brief before any specialist starts
2. **Draft** — invoke the appropriate specialist (`@c4-modeler`, `@adr-writer`, `@tech-radar`)
3. **Seek advice** — `@arb-chair` runs three parallel specialist reviews
4. **Decide** — `@adr-writer` captures the outcome with status and tradeoffs
5. **Communicate** — `@communicator` produces audience-appropriate artifacts

The decision authority stays with the architect (the AAP principle). The board advises, it does not block.

## Workspace Conventions

- **Language**: English
- **Diagrams**: C4 model, Structurizr DSL → `diagrams/`
- **Decisions**: MADR format → `decisions/`
- **Tech assessments**: Markdown entries (`radar/radar/YYYY-MM-01/<slug>.md`) → quadrant declared in frontmatter; images in `radar/public/img/YYYY-MM-01/`
- **Stack**: .NET / C# ecosystem

## Structurizr DSL Style

- No type suffixes on identifiers (`api` not `api_container`, `db` not `db_database`)
- No alignment whitespace in assignments or string arguments
- No decorative `# ──` section separator comments
- View key convention: landscape → `C4_L`, context → `C4_1`, container → `C4_2`, component → `C4_3_<containerName>`, deployment → `C4_D_<env>`
- Always include `properties { "structurizr.sort" "created" }` in the `views` block
- Apply heraldry2 tags based on the `technology` field only — never from element name or description
- Use plain tag name (`tags "dotnet"`, `tags "sqlserver"`) — never the neutral variant with trailing underscore
