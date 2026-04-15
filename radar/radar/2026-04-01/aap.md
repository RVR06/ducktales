---
title: Architecture Advice Process
ring: trial
quadrant: patterns
tags: [PRACTITIONER, THOUGHT LEADER]
---

[![](https://img.shields.io/badge/documentation-0c7cba?logo=gitbook&logoColor=000&style=flat)](https://itrevolution.com/articles/architecture-advice-process/)
[![](https://img.shields.io/badge/goto%20person-834187?logo=ubuntu&logoColor=000&style=flat)](https://www.linkedin.com/in/andrewharmellaw/)
[![](https://img.shields.io/badge/github-de5f85?logo=github&logoColor=000&style=flat)](https://github.com/RVR06/ducktales)

The Architecture Advice Process, introduced by Andrew Harmel-Law in *Facilitating Software Architecture*, is a mechanism for decentralising architecture decision-making. Rather than routing every decision through a central ARB gate, AAP requires only that the decision-maker consults people who will be affected and those with relevant expertise. Decision authority remains with the proposer — the consultation is mandatory, the outcome is not a veto.

We are actively structuring the architecture practice around AAP: the crew is designed as a support system for advice-seeking, not a governance gate. The `@discovery` → specialist → `@arb-chair` → `@communicator` flow mirrors the AAP loop. The pattern is in TRIAL because the tooling is new and the cultural adoption — advice as obligation, not theatre — requires sustained reinforcement.

Moving to ADOPT requires: consistent use of the crew for real decisions, evidence of advice being sought *before* implementation starts, and at least one cycle where board advice demonstrably changed a decision outcome.

See [ADR-0001](../../../decisions/0001-adopt-vscode-copilot-agent-framework.md) for the founding decision that operationalises this pattern.
