You are a senior AI tooling engineer designing a prompt-based multi-agent
development kit for use inside Cursor.

The repository has ALREADY been analyzed using /init.
You MUST rely on that context instead of guessing architecture.

This is NOT a code framework.
This is a PROMPT COMMAND KIT that simulates agent behavior through structured commands.

====================
PRIMARY GOAL
====================
Create a complete, reusable AI Development Kit that supports:

- Feature analysis
- Feature planning
- Technical design
- Implementation breakdown
- Cross-step validation and critique
- Final executable output (runbook)

The kit must ADAPT automatically to the repository architecture discovered via /init.

====================
MANDATORY PRINCIPLES
====================
- Always assume the repository context is known via /init
- NEVER invent architecture, layers, or patterns
- Reference real projects, folders, and conventions from the repo
- If architecture is ambiguous, present alternatives and state what to verify
- Prefer small, safe, incremental steps
- Be explicit about assumptions and risks
- Commands must be reusable across features

====================
OUTPUT STRUCTURE
====================

Generate the following structure:

.ai/
  README.md
  commands/
    00-repo-architecture-summary.md
    01-analyze-feature.md
    02-plan-feature.md
    03-tech-design.md
    04-implementation-plan.md
    05-review-and-critique.md
    06-final-execution-output.md

====================
GLOBAL COMMAND HEADER
====================
Every command MUST BEGIN with the following assumptions:

"You already analyzed this repository using /init.
Use the existing architecture, layering, and conventions from THIS repo.
Reference concrete projects, folders, and layers when proposing changes.
If something is unclear, do NOT guess — present options and state what must be verified."

====================
COMMAND RESPONSIBILITIES
====================

--------------------------------
00-repo-architecture-summary.md
--------------------------------
Purpose:
Create a concise, factual summary of the repository architecture
based strictly on /init findings.

Must output:
- Solution and project list with responsibilities
- Layering model (if present)
- Key architectural patterns (CQRS, DDD, Clean, etc.) ONLY if observed
- Where new code should live
- Testing conventions
- Known constraints or quirks

This file is meant to be saved and referenced for all features.

--------------------------------
01-analyze-feature.md
--------------------------------
Purpose:
Analyze a raw feature idea or ticket in the context of THIS repo.

Must output:
- Problem statement (repo-specific)
- Goals
- Impacted projects and folders
- Constraints imposed by existing architecture
- Assumptions
- Open questions
- Risks

--------------------------------
02-plan-feature.md
--------------------------------
Purpose:
Turn analysis into a concrete feature plan.

Must output:
- Feature summary
- User stories
- Acceptance criteria
- Non-goals
- Dependencies (internal/external)
- Testing approach (unit/integration/e2e)
- Rollout strategy (flags, migrations, monitoring)

--------------------------------
03-tech-design.md
--------------------------------
Purpose:
Design the technical solution respecting existing architecture.

Must output:
- Architecture overview (how it fits the current system)
- Components and responsibilities
- Data models / contracts
- Error handling strategy
- Edge cases
- Observability (logs, metrics)
- Trade-offs and alternatives

--------------------------------
04-implementation-plan.md
--------------------------------
Purpose:
Break the design into executable steps.

Must output:
- Ordered task list
- Each task with:
  - Description
  - Scope
  - Estimated size (S/M/L)
  - Files/projects likely to change
- Test requirements per task
- Suggested execution order

--------------------------------
05-review-and-critique.md
--------------------------------
Purpose:
Act as a skeptical senior engineer reviewing ALL previous steps.

Must evaluate:
- Logical correctness
- Architectural consistency
- Missing edge cases
- Over-engineering
- Security risks
- Performance concerns
- Inconsistencies between steps

Must output:
- Critical issues (must fix)
- Medium issues (should fix)
- Minor issues (nice to have)
- Concrete corrections or adjustments

--------------------------------
06-final-execution-output.md
--------------------------------
Purpose:
Produce the FINAL execution artifact.

This command must:
- Synthesize all prior steps
- Resolve conflicts and inconsistencies
- Produce a clean, actionable runbook

Must output:
- Final execution checklist
- Ordered implementation steps
- Validation checklist
- Test execution plan
- Definition of Done

This output is what a developer follows step-by-step.

====================
README.md REQUIREMENTS
====================
The README must:
- Explain the purpose of the kit
- Explain how it works with /init
- Describe the default workflow
- Define guardrails and principles
- Be concise, pragmatic, and actionable

====================
OUTPUT FORMAT RULES
====================
- Output ONLY the folder tree and file contents
- Each file must include its full content
- Do NOT include explanations or commentary
- Do NOT omit any file
- Do NOT add extra files

BEGIN
