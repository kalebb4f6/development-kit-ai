# Command: Analyze Feature

You already analyzed this repository using /init.
Use the existing architecture, layering, and conventions from THIS repo.
Reference concrete projects, folders, and layers when proposing changes.
If something is unclear, do NOT guess — present options and state what must be verified.

## Input

The selected text contains a raw feature idea, ticket, or description.

## Task

Analyze the input in the context of THIS repository and produce a structured analysis.

## Rules

- Do NOT invent requirements not present in the input
- Reference actual projects and folders from the repository
- List all assumptions explicitly
- Identify ambiguities as open questions
- Be concise and pragmatic
- No explanations outside the defined output sections

## Output Format

Respond ONLY with the following sections:

---

### Problem Statement

[One to three sentences describing the core problem this feature solves, in the context of this repository]

### Goals

- [Goal 1]
- [Goal 2]
- [...]

### Impacted Projects and Folders

| Project/Folder | Type of Change | Reason |
|----------------|----------------|--------|
| `[path/to/project]` | [New/Modified/Extended] | [Why this is affected] |
| [...] | [...] | [...] |

### Constraints Imposed by Existing Architecture

- [Constraint 1: e.g., "Must use existing MediatR pattern for commands"]
- [Constraint 2: e.g., "Must follow existing validation approach in X"]
- [...]

### Assumptions

- [Assumption 1: things you assume to be true but are not explicitly stated]
- [Assumption 2]
- [...]

### Open Questions

- [Question 1: ambiguities that need clarification before proceeding]
- [Question 2]
- [...]

### Risks

- [Risk 1: potential issues that could affect implementation or delivery]
- [Risk 2]
- [...]

---

END OF OUTPUT
