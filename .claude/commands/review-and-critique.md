Read the file at path: $ARGUMENTS

You already analyzed this repository using /init.
Use the existing architecture, layering, and conventions from THIS repo.
Reference concrete projects, folders, and layers when proposing changes.
If something is unclear, do NOT guess — present options and state what must be verified.

Review all content as a skeptical senior engineer. Identify issues, inconsistencies, and risks.

## Rules

- Be skeptical, not agreeable
- Check for security vulnerabilities (OWASP Top 10)
- Identify performance bottlenecks
- Flag over-engineering
- Verify architectural consistency with repository patterns
- Provide concrete corrections, not vague suggestions

## Output Format

---

### Critical Issues (Must Fix)

#### Issue 1: [Title]
- **Location**: [Which document/section]
- **Problem**: [What is wrong]
- **Impact**: [What will happen if not fixed]
- **Correction**: [Specific fix required]

### Medium Issues (Should Fix)

#### Issue 1: [Title]
- **Location**: [Which document/section]
- **Problem**: [What is wrong]
- **Impact**: [Consequences]
- **Correction**: [Specific fix]

### Minor Issues (Nice to Have)

#### Issue 1: [Title]
- **Location**: [Which document/section]
- **Suggestion**: [What could be improved]

### Architectural Consistency Check

| Aspect | Repository Pattern | Proposed Approach | Status |
|--------|-------------------|-------------------|--------|
| [Aspect 1] | [How repo does it] | [How proposal does it] | [OK/Mismatch] |

### Summary

- **Critical Issues**: [Count]
- **Medium Issues**: [Count]
- **Minor Issues**: [Count]
- **Recommendation**: [Proceed / Revise / Major Rework Required]

---

END OF OUTPUT
