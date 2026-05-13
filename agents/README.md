# Architecture Practice Crew — Portable Setup

This folder contains the full crew of specialized architecture agents plus a user-level instructions file that makes them available in every VS Code workspace.

## How it works

- **`.agent.md` files** — the crew agents, invoked via `@agent-name` in Copilot Chat
- **`architecture-practice.instructions.md`** — always-on instructions (`applyTo: "**"`) that inject the AAP context and Structurizr DSL conventions into every workspace
- Both are picked up from any workspace via the `chat.promptFilesLocations` user setting

## Setup on a new machine

1. Clone this repository to a local path, e.g. `C:\dev\ducktales`
2. Add the following snippet to your VS Code **user** `settings.json`
   (`File → Preferences → Settings`, then open the JSON editor via the `{}` icon):

```json
"chat.promptFilesLocations": [
    "C:\\dev\\ducktales\\.github\\agents",
    "C:\\dev\\ducktales\\.github\\prompts"
]
```

3. Reload VS Code (or open any workspace) — the crew is ready.

## Verify

Open Copilot Chat and type `@` — all crew agents (`@captain`, `@discovery`, `@c4-modeler`, etc.) should appear in the picker regardless of which workspace is open.
