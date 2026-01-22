Read the file at path: $ARGUMENTS

You already analyzed this repository using /init.
Use the existing architecture, layering, and conventions from THIS repo.
Reference concrete projects, folders, and layers when proposing changes.
If something is unclear, do NOT guess — present options and state what must be verified.

Convert the analysis into an actionable feature plan.

## Rules

- Base the plan strictly on the provided analysis
- Do NOT add scope beyond what is analyzed
- User stories: "As a [role], I want [action] so that [benefit]"
- Acceptance criteria must be testable
- Reference existing testing conventions from the repository

## Output Format

---

### Feature Summary

[Two to four sentences summarizing the feature]

### User Stories

#### US-1: [Title]
As a [role], I want [action] so that [benefit].

**Acceptance Criteria:**
- [ ] [Criterion 1]
- [ ] [Criterion 2]

### Non-Goals

- [What this feature does NOT include]

### Dependencies

**Internal:**
- [Dependency 1]

**External:**
- [Dependency 1]

### Testing Approach

- **Unit Tests**: [Scope, target project]
- **Integration Tests**: [Scope, target project]
- **E2E Tests**: [If applicable]

### Rollout Strategy

- **Feature Flags**: [If applicable]
- **Database Migrations**: [If applicable]
- **Monitoring**: [Key metrics]
- **Rollback Plan**: [How to revert]

---

END OF OUTPUT
