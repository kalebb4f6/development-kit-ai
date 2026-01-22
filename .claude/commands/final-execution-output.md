Read the file at path: $ARGUMENTS

You already analyzed this repository using /init.
Use the existing architecture, layering, and conventions from THIS repo.
Reference concrete projects, folders, and layers when proposing changes.
If something is unclear, do NOT guess — present options and state what must be verified.

Synthesize all previous steps into a clean, final execution runbook.

## Rules

- Resolve ALL issues from the review
- Eliminate inconsistencies between documents
- No ambiguity - every step must be actionable
- Reference actual file paths and projects
- Include validation checkpoints

## Output Format

---

### Final Implementation Checklist

- [ ] [Pre-requirement 1]
- [ ] [Pre-requirement 2]

### Execution Steps

#### Step 1: [Title]

**Action**: [Precise action]

**Project**: [Target project]

**Files**:
- Create/Modify: `[path/to/file.cs]`

**Code**:
```csharp
// Key code
```

**Validation**:
- [ ] [How to verify]

---

[Continue for all steps...]

### Validation Checklist

- [ ] Solution builds without errors
- [ ] All unit tests pass
- [ ] All integration tests pass
- [ ] Code follows repository conventions

### Test Execution Plan

#### Unit Tests
```bash
dotnet test [project] --filter [filter]
```

#### Integration Tests
```bash
dotnet test [project] --filter [filter]
```

#### Manual Test Scenarios

| Scenario | Steps | Expected Result |
|----------|-------|-----------------|
| [Scenario 1] | [Steps] | [Expected outcome] |

### Definition of Done

- [ ] All execution steps completed
- [ ] All validation items pass
- [ ] All tests pass
- [ ] Code review approved
- [ ] Merged to [target branch]

### Rollback Instructions

1. [Step 1: Immediate action]
2. [Step 2: Verification]
3. [Step 3: Communication]

---

END OF OUTPUT
