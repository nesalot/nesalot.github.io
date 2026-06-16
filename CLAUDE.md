# CLAUDE.md

## Project Overview

This is a GitHub Pages site served from the `master` branch at nesalot.github.io. It consists of a landing page (`index.html`) and a hidden demo page (`demo/index.html`).

## Repository Structure

- `index.html` — Main landing page (DO NOT MODIFY)
- `demo/index.html` — Demo portfolio page (agent work happens here)
- `css/styles.css` — Styles for the landing page
- `CNAME` — Custom domain config (DO NOT MODIFY)
- `.claude/skills/` — Agent skills for the loop system
- `.github/workflows/` — GitHub Actions for the agent loops
- `scripts/` — Utility scripts

## Agent Loop System

This repo runs two autonomous agent loops:

### Manager Loop
- Scans `demo/index.html` for bugs, accessibility issues, and code quality problems
- Creates GitHub Issues with appropriate labels
- Can ONLY create/update issues — cannot push code or modify files

### Worker Loop
- Picks up issues labeled `agent:ready` + `risk:low`
- Creates a branch, makes the fix, opens a PR
- Maximum 3 issues per run

## Labels

Issues use these labels for coordination:

**Risk:** `risk:low`, `risk:medium`, `risk:high`
**Type:** `type:bug`, `type:accessibility`, `type:code-quality`, `type:docs`, `type:enhancement`
**Routing:** `agent:ready`, `needs:human`

## Guardrails

- NEVER push directly to `master`
- NEVER modify `index.html` (the main landing page) or `CNAME`
- ALWAYS create a branch and open a PR for changes
- ONLY work on issues labeled `agent:ready`
- Maximum 3 issues per worker run
- The worker agent reviews its own diff with a sub-agent before opening a PR
