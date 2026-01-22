# Command: Implementation Plan

You already analyzed this repository using /init.
Use the existing architecture, layering, and conventions from THIS repo.
Reference concrete projects, folders, and layers when proposing changes.
If something is unclear, do NOT guess — present options and state what must be verified.

## Input

The selected text contains a technical design (output from 03-tech-design).

## Task

Break down the technical design into executable implementation tasks.

## Rules

- Tasks must be ordered by dependency (prerequisite tasks first)
- Each task must be independently completable
- Size estimates: S (< 2 hours), M (2-4 hours), L (> 4 hours)
- File paths must reference actual project structure
- Each task must have clear test requirements
- No explanations outside the defined output sections

## Output Format

Respond ONLY with the following sections:

---

### Implementation Tasks

#### Task 1: [Title]
- **Description**: [What needs to be done]
- **Scope**: [Specific boundaries of this task]
- **Size**: [S/M/L]
- **Project(s)**: [Which project(s) are affected]
- **Files to Create/Modify**:
  - `[path/to/file1.cs]` - [what changes]
  - `[path/to/file2.cs]` - [what changes]
- **Test Requirements**:
  - [ ] [Test 1 description]
  - [ ] [Test 2 description]
- **Dependencies**: [Task numbers this depends on, or "None"]

#### Task 2: [Title]
- **Description**: [...]
- **Scope**: [...]
- **Size**: [S/M/L]
- **Project(s)**: [...]
- **Files to Create/Modify**:
  - `[...]`
- **Test Requirements**:
  - [ ] [...]
- **Dependencies**: [...]

[Continue for all tasks...]

### Task Dependency Graph

```
[Task 1] ─┬─> [Task 3] ──> [Task 5]
          │
[Task 2] ─┘        ┌──> [Task 6]
                   │
[Task 4] ──────────┴──> [Task 7]
```

### Suggested Execution Order

1. [Task X] - [Brief reason why first]
2. [Task Y] - [Brief reason for order]
3. [...]

### Critical Path

The minimum sequence that determines implementation time:

```
[Task A] -> [Task B] -> [Task C]
```

---

END OF OUTPUT
