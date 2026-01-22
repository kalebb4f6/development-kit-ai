Read the file at path: $ARGUMENTS

You already analyzed this repository using /init.
Use the existing architecture, layering, and conventions from THIS repo.
Reference concrete projects, folders, and layers when proposing changes.
If something is unclear, do NOT guess — present options and state what must be verified.

Break down the technical design into executable implementation tasks.

## Rules

- Tasks ordered by dependency (prerequisites first)
- Each task independently completable
- Size: S (< 2h), M (2-4h), L (> 4h)
- File paths must reference actual project structure
- Each task must have test requirements

## Output Format

---

### Implementation Tasks

#### Task 1: [Title]
- **Description**: [What needs to be done]
- **Scope**: [Boundaries of this task]
- **Size**: [S/M/L]
- **Project(s)**: [Affected projects]
- **Files to Create/Modify**:
  - `[path/to/file.cs]` - [what changes]
- **Test Requirements**:
  - [ ] [Test 1]
- **Dependencies**: [Task numbers or "None"]

### Task Dependency Graph

```
[Task 1] ──> [Task 2] ──> [Task 3]
```

### Suggested Execution Order

1. [Task X] - [Reason]
2. [Task Y] - [Reason]

### Critical Path

```
[Task A] -> [Task B] -> [Task C]
```

---

END OF OUTPUT
