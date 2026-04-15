# ADR-0001: Adopt VS Code Copilot Agent Framework as Architecture Practice Platform

![](https://img.shields.io/badge/ID-0001-834187)
![](https://img.shields.io/badge/last_updated-04/15/2026-de5f85)
![](https://img.shields.io/badge/status-accepted-19967d)
![](https://img.shields.io/badge/author-romain.vasseur-ef8d22)

## Decision Outcome

**Chosen option**: Option 1 — VS Code Copilot `.agent.md` files

**Rationale**: This option delivers a working, specialised crew immediately with zero code and zero infrastructure. It operates entirely within the corporate Copilot boundary. The `.agent.md` declarative format maps directly to the crew manifest and supports subagent delegation, making Phase 2 chaining natural. Options 2 and 3 require upfront investment that is premature before the crew's value is validated. Option 4 lacks the routing and role isolation that make the Architecture Advice Process operable as an agent workflow.

### Positive Consequences

- Full crew operational in Phase 1 with no code
- Agents are version-controlled, team-shareable, and discoverable via the agent picker
- Personas and constraints are explicit and auditable in source files
- .NET / Semantic Kernel path (Phase 3) remains available when automation is warranted — the `.agent.md` files become the specification for KernelFunction wrappers

### Accepted Tradeoffs

- Agent orchestration in Phase 1 is manual — the architect sequences agents; no automated workflow runner
- Parallel reviewer invocation in `@arb-chair` depends on Copilot's subagent dispatch capability, which is model-dependent
- No persistent memory between sessions in Phase 1 — context must be re-supplied or referenced by file

---

## Context and Problem Statement

The architecture practice relies on AI assistance for recurring, high-value tasks: producing C4 diagrams in Structurizr DSL, writing Architecture Decision Records, evaluating technologies for the radar, and running structured design reviews. The current approach uses ad-hoc prompting with copy-pasted instructions and no shared structure.

As the practice grows in scope and rigour — adopting Andrew Harmel-Law's Architecture Advice Process — the tooling must scale accordingly: opinionated, structured, repeatable, and operating within the boundaries of the corporate environment (corporate Copilot endpoint, no external services).

## Decision Drivers

- All tooling must operate within the corporate VS Code Copilot flavour — no external LLM APIs or third-party services
- Agents must be independently operable and composable without boilerplate code in Phase 1
- The stack preference for automation phases (Phase 3+) is .NET / C#
- Each agent must be highly specialised — single responsibility, clearly bounded outputs
- The Architecture Advice Process must be the structural backbone: Discover → Draft → Seek Advice → Decide → Communicate
- Architect retains decision authority; agents advise

## Considered Options

1. **VS Code Copilot `.agent.md` files** — declarative agent definitions, zero code, runs in existing corporate Copilot
2. **Python + CrewAI** — code-first crew framework, requires Python runtime and external API access
3. **Semantic Kernel C# host (standalone)** — code-first, .NET native, but requires upfront development investment before any agent can run
4. **Prompt library only** — curated `.prompt.md` files without agent routing, no orchestration

## Options Analysis

### Option 1: VS Code Copilot `.agent.md` files

**Pros:**
- Runs immediately, zero additional tooling
- Corporate boundary respected by design
- Declarative format is readable and maintainable by non-developers

**Cons:**
- No automated orchestration in Phase 1 — captain is the human
- Dependent on Copilot model capabilities for subagent dispatch

### Option 2: Python + CrewAI

**Pros:**
- Mature crew orchestration with true parallel execution
- Rich tool ecosystem (file I/O, web, vector memory)

**Cons:**
- Requires Python runtime and external API keys — blocked by corporate constraints
- Upfront development investment before first agent runs

### Option 3: Semantic Kernel C# host (standalone)

**Pros:**
- Native .NET / C#, consistent with team stack
- Full control over orchestration, memory, and tool registration

**Cons:**
- Significant upfront investment before any agent is usable
- Premature optimisation before crew design is validated

### Option 4: Prompt library only

**Pros:**
- Simplest possible form — no new primitives to learn

**Cons:**
- No routing, no delegation, no role isolation
- Scales poorly as scope grows — becomes a pile of disconnected prompts

## Advice Received

| Advisor | Role | Key Input |
|---------|------|-----------|
| GitHub Copilot | AI pair programmer | Confirmed `.agent.md` + `copilot-instructions.md` support subagent dispatch; recommended minimal toolsets per role |

## Links

- [Architecture Advice Process — Andrew Harmel-Law](https://medium.com/nick-tune-tech-strategy-blog/architectural-advice-process-d4d06e2a40d)
- [ARB using agents reference](https://arb-using-agents.vercel.app/)
- [crew-manifest.yaml](../crew-manifest.yaml) — declarative crew charter and journey roadmap
- [copilot-instructions.md](../.github/copilot-instructions.md) — workspace-level crew configuration
