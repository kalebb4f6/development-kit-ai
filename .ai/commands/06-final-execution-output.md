# Command: Final Execution Output

You already analyzed this repository using /init.
Use the existing architecture, layering, and conventions from THIS repo.
Reference concrete projects, folders, and layers when proposing changes.
If something is unclear, do NOT guess — present options and state what must be verified.

## Input

The selected text contains all previous outputs (analysis, plan, design, implementation plan, and review).

## Task

Synthesize all previous steps into a clean, final execution runbook that a developer can follow step-by-step.

## Rules

- Resolve ALL issues identified in the review
- Eliminate any inconsistencies between documents
- Produce a CLEAN, FINAL output ready for execution
- No ambiguity - every step must be actionable
- Reference actual file paths and projects
- Include validation checkpoints
- No explanations outside the defined output sections

## Output Format

Respond ONLY with the following sections:

---

### Final Implementation Checklist

Pre-implementation requirements that must be verified:

- [ ] [Requirement 1: e.g., "Database migrations are up to date"]
- [ ] [Requirement 2: e.g., "Required NuGet packages are available"]
- [ ] [Requirement 3]
- [ ] [...]

### Execution Steps

Follow these steps in order. Do not skip steps.

#### Step 1: [Title]

**Action**: [Precise action to take]

**Project**: [Target project]

**Files**:
- Create/Modify: `[path/to/file.cs]`

**Code**:
```csharp
// Key code to implement (if applicable)
```

**Validation**:
- [ ] [How to verify this step is complete]

---

#### Step 2: [Title]

**Action**: [...]

**Project**: [...]

**Files**:
- [...]

**Code**:
```csharp
// [...]
```

**Validation**:
- [ ] [...]

---

[Continue for all steps...]

### Validation Checklist

After all steps are complete, verify:

- [ ] Solution builds without errors
- [ ] All unit tests pass
- [ ] All integration tests pass
- [ ] No compiler warnings
- [ ] Code follows repository conventions
- [ ] [Feature-specific validation 1]
- [ ] [Feature-specific validation 2]
- [ ] [...]

### Test Execution Plan

#### Unit Tests
```bash
dotnet test [project] --filter [filter]
```
Expected: [What should pass]

#### Integration Tests
```bash
dotnet test [project] --filter [filter]
```
Expected: [What should pass]

#### Manual Test Scenarios

| Scenario | Steps | Expected Result |
|----------|-------|-----------------|
| [Scenario 1] | [Steps to execute] | [Expected outcome] |
| [Scenario 2] | [...] | [...] |

### Definition of Done

This feature is complete when:

- [ ] All execution steps are completed
- [ ] All validation checklist items pass
- [ ] All tests in the test execution plan pass
- [ ] Code review approved
- [ ] Code is merged to [target branch]
- [ ] [Additional DoD criteria specific to this feature]
- [ ] [...]

### Rollback Instructions

If issues are discovered after deployment:

1. [Step 1: Immediate action]
2. [Step 2: Verification]
3. [Step 3: Communication]

---

END OF OUTPUT
