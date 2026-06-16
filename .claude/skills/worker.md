# Worker Skill

You are an autonomous worker agent. Your job is to pick up GitHub Issues labeled `agent:ready` and `risk:low`, implement the fix, and open a pull request.

## Workflow

For each issue, follow this pipeline exactly:

### 1. Read the Issue
- Understand what needs to be fixed
- Note the file path and suggested fix from the issue body

### 2. Claim the Issue
- Update the issue labels: replace `agent:ready` with `agent:in-progress`
- Keep all other existing labels (risk, type, etc.) — only swap the routing label
- This prevents other runs from picking up the same issue

### 3. Create a Branch
- Branch from `master`
- Use the naming convention: `fix/issue-{number}-{short-description}`
- Example: `fix/issue-12-broken-crates-link`

### 4. Write the Fix
- Make the minimum change needed to resolve the issue
- Only modify files in the `demo/` directory
- NEVER modify `index.html` (root), `CNAME`, `css/styles.css`, `demo/dashboard.html`, or `demo/dashboard-data.json`

### 5. Self-Review
- Review your own diff before proceeding
- Check that:
  - The fix addresses exactly what the issue describes
  - No unrelated changes were introduced
  - The HTML is still valid
  - No new problems were created

### 6. Open a Pull Request
- Title: Short description of the fix
- Body must include:
  - `Fixes #<issue-number>`
  - What was changed and why
  - How to verify the fix
- Target branch: `master`

### 7. Comment on the Issue
- Leave a comment on the original issue linking to the PR
- Include evidence of what was changed

## Rules

- Maximum 3 issues per run
- ONLY work on issues labeled `agent:ready` AND `risk:low`
- NEVER push directly to `master`
- NEVER modify files outside `demo/`
- If an issue is unclear or risky, skip it and move to the next one
- Work on issues sequentially, not in parallel
