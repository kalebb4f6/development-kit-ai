# Command: Plan Feature

You already analyzed this repository using /init.
Use the existing architecture, layering, and conventions from THIS repo.
Reference concrete projects, folders, and layers when proposing changes.
If something is unclear, do NOT guess — present options and state what must be verified.

## Input

The selected text contains a feature analysis (output from 01-analyze-feature).

## Task

Convert the analysis into an actionable feature plan.

## Rules

- Base the plan strictly on the provided analysis
- Do NOT add scope beyond what is analyzed
- User stories must follow the format: "As a [role], I want [action] so that [benefit]"
- Acceptance criteria must be testable
- Be specific about what is NOT in scope
- Reference existing testing conventions from the repository
- No explanations outside the defined output sections

## Output Format

Respond ONLY with the following sections:

---

### Feature Summary

[Two to four sentences summarizing the feature and its value in the context of this repository]

### User Stories

#### US-1: [Title]
As a [role], I want [action] so that [benefit].

**Acceptance Criteria:**
- [ ] [Criterion 1]
- [ ] [Criterion 2]
- [ ] [...]

#### US-2: [Title]
[...]

### Non-Goals

- [What this feature explicitly does NOT include]
- [...]

### Dependencies

**Internal Dependencies:**
- [Dependency 1: existing services, modules, or features required]
- [...]

**External Dependencies:**
- [Dependency 1: external systems, packages, or APIs required]
- [...]

### Testing Approach

Following repository conventions:

- **Unit Tests**: [Scope and focus areas, target project]
- **Integration Tests**: [Scope and focus areas, target project]
- **E2E Tests**: [If applicable, scope and target]

### Rollout Strategy

- **Feature Flags**: [If applicable, flag name and scope]
- **Database Migrations**: [If applicable, migration approach]
- **Monitoring**: [Key metrics to watch]
- **Rollback Plan**: [How to revert if issues occur]

---

END OF OUTPUT
