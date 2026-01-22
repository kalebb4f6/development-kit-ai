You already analyzed this repository using /init.
Use the existing architecture, layering, and conventions from THIS repo.
Reference concrete projects, folders, and layers when proposing changes.
If something is unclear, do NOT guess — present options and state what must be verified.

Create a concise, factual summary of the repository architecture based strictly on /init findings. This document should be saved and referenced for all future features.

## Rules

- Base ALL findings on actual /init analysis
- Do NOT invent patterns or layers not present in the repository
- If a pattern is ambiguous, state what needs verification
- Be concise and factual

## Output Format

---

### Solution and Project List

| Project | Responsibility | Layer |
|---------|---------------|-------|
| [Project.Name] | [What this project does] | [Presentation/Application/Domain/Infrastructure/Tests] |

### Layering Model

[Describe the layering approach if present: Clean Architecture, Onion, N-Tier, or None]

**Layer Dependencies:**
```
[Layer A] → [Layer B] → [Layer C]
```

### Architectural Patterns

Patterns observed in this repository (ONLY if actually present):

- [ ] CQRS
- [ ] DDD (Domain-Driven Design)
- [ ] Clean Architecture
- [ ] Mediator Pattern
- [ ] Repository Pattern
- [ ] Unit of Work
- [ ] Event Sourcing
- [ ] Other: [specify]

**Evidence**: [Where each pattern is implemented]

### Where New Code Should Live

| Code Type | Target Location | Example |
|-----------|----------------|---------|
| API Controllers | `[path]` | `[existing example]` |
| Application Services | `[path]` | `[existing example]` |
| Domain Entities | `[path]` | `[existing example]` |
| DTOs/Contracts | `[path]` | `[existing example]` |
| Infrastructure | `[path]` | `[existing example]` |
| Unit Tests | `[path]` | `[existing example]` |
| Integration Tests | `[path]` | `[existing example]` |

### Testing Conventions

- **Test Framework**: [xUnit/NUnit/MSTest]
- **Mocking Library**: [Moq/NSubstitute/FakeItEasy]
- **Naming Convention**: [e.g., MethodName_Scenario_ExpectedResult]
- **Test Organization**: [By feature/By layer/Mixed]

### Known Constraints and Quirks

- [Constraint 1]
- [Quirk 1]

### Verification Needed

- [ ] [Item requiring manual verification]

---

END OF OUTPUT
