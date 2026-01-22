# AI Development Kit for Cursor

A prompt-based command kit for structured software development workflows that adapts to your repository architecture.

## Purpose

This kit provides a multi-step, agent-style workflow for developing features. Each command is designed to be executed sequentially, building upon the outputs of previous steps while respecting the existing architecture discovered via `/init`.

## How It Works with /init

1. Run `/init` on your repository first
2. The kit uses the discovered architecture, patterns, and conventions
3. Commands reference real projects, folders, and layers from your repo
4. No guessing - ambiguities are flagged for verification

## Default Workflow

1. **Architecture Summary** - Document repo structure (one-time)
2. **Analyze** - Understand the feature in repo context
3. **Plan** - Define user stories and acceptance criteria
4. **Design** - Create technical architecture fitting existing patterns
5. **Implement** - Break down into executable tasks
6. **Review** - Critique and identify issues
7. **Execute** - Generate final execution runbook

## Commands

| Command | Purpose |
|---------|---------|
| `00-repo-architecture-summary.md` | Document repository architecture (run once, save for reference) |
| `01-analyze-feature.md` | Analyze feature ideas in repo context |
| `02-plan-feature.md` | Convert analysis into actionable plans |
| `03-tech-design.md` | Design technical architecture |
| `04-implementation-plan.md` | Break design into executable tasks |
| `05-review-and-critique.md` | Critical review of all previous steps |
| `06-final-execution-output.md` | Generate final execution runbook |

## How to Use in Cursor

1. Run `/init` on your repository (first time only)
2. Select relevant text/code in your editor
3. Open command palette (`Ctrl+K` or `Cmd+K`)
4. Reference the command file (e.g., `@01-analyze-feature.md`)
5. Execute and follow the structured output

## Guardrails and Principles

- **Repository-aware**: Always uses actual architecture from /init
- **No hallucinations**: All assumptions listed explicitly
- **No invented APIs**: Only reference existing or clearly specified interfaces
- **Small, safe steps**: Prefer incremental changes over large rewrites
- **Verify ambiguities**: When unclear, present options and state what to verify
- **Strict outputs**: Commands produce structured outputs only
- **Reusable**: Commands work across any feature in the repository

## Requirements

- Cursor IDE
- Claude Sonnet 4.5 (or compatible model)
- Repository analyzed with /init
