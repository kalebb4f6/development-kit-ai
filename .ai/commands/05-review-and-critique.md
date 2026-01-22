# Command: Review and Critique

You already analyzed this repository using /init.
Use the existing architecture, layering, and conventions from THIS repo.
Reference concrete projects, folders, and layers when proposing changes.
If something is unclear, do NOT guess — present options and state what must be verified.

## Input

The selected text contains outputs from previous steps (analysis, plan, design, and/or implementation plan).

## Task

Review all provided materials as a skeptical senior engineer. Identify issues, inconsistencies, and risks.

## Rules

- Be skeptical, not agreeable
- Look for gaps between requirements and implementation
- Check for security vulnerabilities (OWASP Top 10)
- Identify performance bottlenecks
- Flag over-engineering and unnecessary complexity
- Verify architectural consistency with repository patterns
- Check consistency across all provided documents
- Provide concrete corrections, not vague suggestions
- No explanations outside the defined output sections

## Review Checklist

- [ ] Logical correctness of the solution
- [ ] Architectural consistency with existing repo patterns
- [ ] Missing edge cases
- [ ] Over-engineering or unnecessary abstraction
- [ ] Security risks (injection, authentication, authorization, data exposure)
- [ ] Performance concerns (N+1 queries, missing indexes, memory leaks)
- [ ] Inconsistencies between steps
- [ ] Missing error handling
- [ ] Testability issues
- [ ] Repository conventions violations

## Output Format

Respond ONLY with the following sections:

---

### Critical Issues (Must Fix)

These issues will cause failures, security vulnerabilities, or data corruption.

#### Issue 1: [Title]
- **Location**: [Which document/section]
- **Problem**: [What is wrong]
- **Impact**: [What will happen if not fixed]
- **Correction**: [Specific fix required]

#### Issue 2: [Title]
[...]

### Medium Issues (Should Fix)

These issues affect quality, maintainability, or performance.

#### Issue 1: [Title]
- **Location**: [Which document/section]
- **Problem**: [What is wrong]
- **Impact**: [Consequences]
- **Correction**: [Specific fix]

#### Issue 2: [Title]
[...]

### Minor Issues (Nice to Have)

These are improvements that would enhance the solution.

#### Issue 1: [Title]
- **Location**: [Which document/section]
- **Suggestion**: [What could be improved]

#### Issue 2: [Title]
[...]

### Architectural Consistency Check

| Aspect | Repository Pattern | Proposed Approach | Status |
|--------|-------------------|-------------------|--------|
| [Aspect 1] | [How repo does it] | [How proposal does it] | [OK/Mismatch] |
| [...] | [...] | [...] | [...] |

### Consistency Check Between Documents

| Document A | Document B | Inconsistency |
|------------|------------|---------------|
| [Section/Statement] | [Section/Statement] | [What doesn't match] |

### Summary

- **Critical Issues**: [Count]
- **Medium Issues**: [Count]
- **Minor Issues**: [Count]
- **Recommendation**: [Proceed / Revise / Major Rework Required]

---

END OF OUTPUT
