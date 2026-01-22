Read the file at path: $ARGUMENTS

You already analyzed this repository using /init.
Use the existing architecture, layering, and conventions from THIS repo.
Reference concrete projects, folders, and layers when proposing changes.
If something is unclear, do NOT guess — present options and state what must be verified.

Design the technical solution respecting the existing architecture.

## Rules

- Design must address all user stories from the plan
- Do NOT invent APIs or services not mentioned
- Reference actual patterns from the repository
- Be explicit about data flow and component interactions

## Output Format

---

### Architecture Overview

[How this feature fits into the existing system architecture]

### Components and Responsibilities

#### Component: [Name]
- **Responsibility**: [What this component does]
- **Project**: [Which project this lives in]
- **Layer**: [Presentation/Application/Domain/Infrastructure]
- **Key Interfaces**: [Interfaces it implements or depends on]

### Data Models / Contracts

```csharp
// Project: [target project]
public class [Name]
{
    // Properties
}
```

### API Contracts (if applicable)

```
[HTTP Method] [Endpoint]
Request: [Body structure]
Response: [Response structure]
Status Codes: [Expected codes]
```

### Error Handling Strategy

| Error Scenario | Handling Strategy | User Impact |
|----------------|-------------------|-------------|
| [Scenario 1] | [How handled] | [What user sees] |

### Edge Cases

- [Edge case 1]

### Observability

- **Logs**: [Key events]
- **Metrics**: [Metrics to track]
- **Alerts**: [Alert conditions]

### Trade-offs and Alternatives

| Decision | Alternative | Why Chosen | Downside |
|----------|-------------|------------|----------|
| [Decision 1] | [Alternative] | [Reasoning] | [Trade-off] |

---

END OF OUTPUT
