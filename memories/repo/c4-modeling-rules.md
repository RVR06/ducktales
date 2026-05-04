# C4 Modeling Rules — Heraldry2 Theme Integration

## Folder structure
- Every DSL workspace gets its own dedicated folder: `diagrams/<name>/<name>.dsl`
- This allows co-locating assets (SVGs, PNGs, supplementary files) alongside the DSL

## Workspace directives — always include
```dsl
!identifiers hierarchical
!impliedRelationships false
```
- `!identifiers hierarchical` scopes identifiers by parent (e.g. `sherpa.argocd`). Sibling references within the same parent resolve automatically, but cross-scope references must use the full hierarchical path (e.g. a person referencing a container: `-> sherpa.argocd`)
- `!impliedRelationships false` means system-level relationships must be stated explicitly — they are NOT auto-inferred from container-level relationships

## Relationships — always implicit
- Always use implicit relationship syntax (`-> target "desc"` inside the source element's block)
- Never use explicit relationship syntax (`source -> target "desc"` outside element blocks)
- **DRY descriptions**: don't repeat in the relationship description what the target element's name or description already conveys (e.g. `-> acr "pulls charts and images from"` not `"pulls OCI Helm charts and images from"` when ACR's description already mentions OCI/Helm)
- Order declarations so referenced identifiers are declared before the referencing element:
  1. Leaf external systems (no outbound relationships)
  2. External systems with relationships (can reference leaf externals)
  3. Primary system (can reference all externals via implicit `->`)
  4. People (declared last so they can reference systems and containers via implicit `->`)
- **Re-order on every change**: whenever a new relationship is introduced, re-check and fix declaration order so all targets are declared before their sources

## Tag naming
- All tags use `#` prefix in this workspace: `#github`, `#k8s`, `#argocd`, `#azure`, `#terraform`, `#dotnet`, etc.
- Match the **exact tag name from the heraldry2 theme**, not the technology display name (e.g. `#k8s` not `#kubernetes`)

## Styles block — do NOT duplicate theme-provided styles
- The heraldry2 theme already defines `stroke` and `icon` for every `#<tag>` it covers
- Only create custom `element "#<tag>" { stroke ... }` entries for tags that do **not** exist in the referenced themes
- Per-system `#<identifier>` tags only need a custom style when no heraldry2 tag matches

## Tag matching process
1. Fetch the heraldry2 theme JSON and extract all `tag` values
2. For each element, match its `technology` field against theme tags (case-insensitive, mapping to exact tag name)
3. Apply the matching `#<tag>` inline — the theme supplies stroke color and icon automatically
4. If no match exists, leave untagged or use a custom tag with a style entry

## Known heraldry2 tag mappings (subset)

## Technology URLs
- For every element with an identifiable open-source technology, add a `url` field linking to its GitHub/GitLab repository
- Only applies to technologies with a public source repo — skip proprietary services (e.g. GitHub, Azure Container Registry)
- Place `url` as the first line inside the element's block

| Technology | URL |
|-----------|-----|
| Kubernetes | `https://github.com/kubernetes/kubernetes` |
| ArgoCD | `https://github.com/argoproj/argo-cd` |
| gitops-promoter | `https://github.com/argoproj-labs/gitops-promoter` |
| Terraform | `https://github.com/hashicorp/terraform` |
| Helm | `https://github.com/helm/helm` |
| .NET | `https://github.com/dotnet/runtime` |
| Traefik | `https://github.com/traefik/traefik` |
| OpenTelemetry | `https://github.com/open-telemetry/opentelemetry-collector` |
| PostgreSQL | `https://github.com/postgres/postgres` |

## Known heraldry2 tag mappings (subset)
| Technology | Theme tag |
|-----------|-----------|
| Kubernetes | `#k8s` |
| ArgoCD | `#argocd` |
| GitHub | `#github` |
| Azure / ACR | `#azure` |
| Terraform | `#terraform` |
| Helm | `#helm` |
| .NET | `#dotnet` |
| PostgreSQL | `#postgresql` |
| Java | (not in heraldry2) |
| OpenTelemetry | `#otel` |
| Traefik | `#traefik` |
