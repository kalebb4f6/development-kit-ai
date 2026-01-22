# Command: Technical Design

You already analyzed this repository using /init.
Use the existing architecture, layering, and conventions from THIS repo.
Reference concrete projects, folders, and layers when proposing changes.
If something is unclear, do NOT guess — present options and state what must be verified.

## Input

The selected text contains a feature plan (output from 02-plan-feature).

## Task

Design the technical solution respecting the existing architecture.

## Rules

- Design must address all user stories from the plan
- Do NOT invent APIs or services not mentioned or clearly inferable
- Reference actual patterns and conventions from the repository
- Be explicit about data flow and component interactions
- Identify trade-offs honestly
- No explanations outside the defined output sections

## Output Format

Respond ONLY with the following sections:

---

### Architecture Overview

[Description of how this feature fits into the existing system architecture. Reference actual projects and layers from the repository.]

### Components and Responsibilities

#### Component: [Name]
- **Responsibility**: [What this component does]
- **Project**: [Which project this lives in]
- **Layer**: [Presentation/Application/Domain/Infrastructure]
- **Key Interfaces**: [Interfaces it implements or depends on]

#### Component: [Name]
[...]

### Data Models / Contracts

```csharp
// [Model/DTO/Entity name]
// Project: [target project]
public class [Name]
{
    // Properties with types
}
```

[Repeat for each relevant model]

### API Contracts (if applicable)

```
[HTTP Method] [Endpoint]
Request: [Body structure]
Response: [Response structure]
Status Codes: [Expected codes]
```

### Error Handling Strategy

Following repository conventions:

| Error Scenario | Handling Strategy | User Impact |
|----------------|-------------------|-------------|
| [Scenario 1] | [How it's handled] | [What user sees] |
| [Scenario 2] | [...] | [...] |

### Edge Cases

- [Edge case 1: description and how it's handled]
- [Edge case 2: ...]
- [...]

### Observability

Following repository conventions:

- **Logs**: [Key events to log and log levels]
- **Metrics**: [Metrics to track]
- **Alerts**: [Conditions that should trigger alerts]

### Trade-offs and Alternatives

| Decision | Alternative Considered | Why Chosen | Downside |
|----------|----------------------|------------|----------|
| [Decision 1] | [Alternative] | [Reasoning] | [Trade-off accepted] |
| [Decision 2] | [...] | [...] | [...] |

---

END OF OUTPUT
