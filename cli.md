You are an expert DevTools engineer.

We are inside a Git repository opened in Cursor, and /init has been run so you know the codebase.
Your job is to CREATE a fully working local AI bootstrapper for this repo.

You must generate ALL files needed so that I can run a single command to install it into this project.

====================
GOAL
====================
Create a project-local CLI tool named `kb-ai` that provides:

1) `kb-ai setup`
   - checks if Ollama exists
   - starts Ollama service if available (best effort)
   - pulls these models: qwen2.5:7b, llama3.1:8b, deepseek-coder:6.7b
   - performs a sanity check by calling the Ollama API

2) `kb-ai init-kit`
   - creates (or updates) `.ai/README.md`
   - creates (or updates) `.ai/commands/*.md` (agent kit prompts)
   - creates a `features/` folder
   - IMPORTANT: if `.ai/` and/or `.claude/` already exist, DO NOT delete them.
     Merge safely:
     - never overwrite existing files without creating a `.bak` backup
     - if a file exists, create a `*.new` variant next to it and mention it

3) `kb-ai feature run --title "..." --input feature.txt`
   - generates:
     features/<slug>/01-analysis.md
     features/<slug>/02-plan.md
     features/<slug>/03-review.md
     features/<slug>/04-runbook.md
   - uses Ollama local API: http://localhost:11434/api/chat
   - uses model qwen2.5:7b by default (allow --model override)

====================
INSTALLATION EXPERIENCE
====================
Create a script that I can run like this:

`./scripts/kb-ai install`

This script must:
- install/build kb-ai into `./bin/kb-ai` (project-local)
- ensure executable permissions
- print next steps

The installation must not require Docker.
Prefer Go for portability (single static binary).
If Go is not available, provide a fallback: build-less bash version.

====================
FILES TO CREATE
====================
You must create:

- scripts/kb-ai            (installer script)
- tools/kb-ai/             (Go module with source code)
- bin/                     (ignored, but created by installer)
- .ai/README.md
- .ai/commands/
    00-repo-architecture-summary.md
    01-analyze-feature.md
    02-plan-feature.md
    03-tech-design.md
    04-implementation-plan.md
    05-review-and-critique.md
    06-final-execution-output.md

OPTIONAL:
- If `.claude/commands` exists, also mirror the same commands there using the same content,
  applying the same safe merge/backup rules.

Also create or update:
- .gitignore (add /bin if not present)

====================
PROMPT CONTENT REQUIREMENTS
====================
All commands must assume /init was run and must:
- use repo architecture and conventions from this repo
- never invent architecture; if unclear, present options and what to verify
- be concise and executable
- output in markdown with fixed sections as defined in each command

Add this global header at the top of EVERY command file:

"You already analyzed this repository using /init.
Use the existing architecture, layering, and conventions from THIS repo.
Reference concrete projects/folders/layers when proposing changes.
If something is unclear, do NOT guess — present options and state what must be verified."

====================
OUTPUT RULES
====================
Return ONLY the created/updated file tree and the full content for each file.
No explanations. No commentary. No missing files.

BEGIN
