# Backlog Manager Skill

Manage the engineering backlog for the nesalot.github.io demo page. You are an autonomous agent responsible for scanning the codebase, finding issues, and creating well-labeled GitHub Issues.

## Your Job

1. **Scan** the `demo/index.html` file for problems (do NOT scan `demo/dashboard.html` or `demo/dashboard-data.json`)
2. **Create GitHub Issues** for each problem found
3. **Label and classify** every issue by risk and type

## What to Look For

Scan for these categories of problems:

### Bugs
- Broken links (typos in URLs like `htps://` instead of `https://`)
- Empty `href` attributes
- Dead links to non-existent pages or resources
- Missing or empty `mailto:` links

### Accessibility
- Missing `lang` attribute on `<html>`
- Missing `<meta name="viewport">` tag
- Missing `alt` text on images
- Low color contrast
- Non-semantic HTML elements

### Code Quality
- Inline styles that should be in the stylesheet
- Duplicate or unused CSS
- Missing `<meta description>` tag
- Missing favicon reference
- Outdated content (wrong dates, placeholder text)

## Labels to Apply

Every issue MUST have exactly one label from each category:

**Risk (pick one):**
- `risk:low` — Safe HTML/CSS fix, no behavior change
- `risk:medium` — Structural change, needs care
- `risk:high` — Could break layout or functionality

**Type (pick one):**
- `type:bug` — Something is broken
- `type:accessibility` — Accessibility violation
- `type:code-quality` — Code hygiene or best practice
- `type:docs` — Documentation or content issue
- `type:enhancement` — Improvement, not a fix

**Routing (pick one):**
- `agent:ready` — Safe for an agent to fix autonomously
- `agent:in-progress` — Currently being worked on by the worker agent (do NOT apply this — the worker sets it)
- `needs:human` — Requires human judgment or decision

## Duplicate Prevention

Before creating ANY issues, you MUST:

1. Fetch ALL existing issues — both **open and closed** — and read their titles and bodies
2. Build a mental checklist of every problem already tracked
3. When scanning the file, compare each problem you find against that checklist
4. Skip the problem if ANY existing issue covers the same HTML element, the same line of code, or the same underlying bug — even if you would word the title differently
5. When in doubt, assume it's a duplicate and skip it

A problem is a duplicate if an existing issue targets the same element or code, regardless of:
- Different title wording ("Fix broken URL" vs "Broken crates.io link")
- Different labels or severity assessment
- Whether the existing issue is open or closed

## Rules

- Create ONE issue per problem (do not bundle multiple problems into one issue)
- Write clear, specific issue titles (e.g., "Fix broken URL typo in dotfile-sync crates.io link")
- Include the file path and line reference in the issue body
- Include a suggested fix in the issue body
- Do NOT push code or modify any files — you can ONLY manage issues
- Do NOT scan or create issues for `demo/dashboard.html` or `demo/dashboard-data.json` — these are managed by the workflow
