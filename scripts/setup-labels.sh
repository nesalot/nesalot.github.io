#!/bin/bash
# Create the required GitHub Issue labels for the agent loop system.
# Run this once to set up your repo.
#
# Usage: ./scripts/setup-labels.sh

set -e

REPO="nesalot/nesalot.github.io"

echo "Creating labels on $REPO..."

# Risk labels
gh label create "risk:low"    --repo "$REPO" --color "0e8a16" --description "Low risk - safe for agent" --force
gh label create "risk:medium" --repo "$REPO" --color "fbca04" --description "Medium risk - needs care" --force
gh label create "risk:high"   --repo "$REPO" --color "d93f0b" --description "High risk - human only" --force

# Type labels
gh label create "type:bug"           --repo "$REPO" --color "d73a4a" --description "Something is broken" --force
gh label create "type:accessibility" --repo "$REPO" --color "a2eeef" --description "Accessibility issue" --force
gh label create "type:code-quality"  --repo "$REPO" --color "7057ff" --description "Code hygiene" --force
gh label create "type:docs"          --repo "$REPO" --color "0075ca" --description "Documentation or content" --force
gh label create "type:enhancement"   --repo "$REPO" --color "a4c639" --description "Improvement, not a fix" --force

# Routing labels
gh label create "agent:ready"  --repo "$REPO" --color "5319e7" --description "Safe for an agent to work on" --force
gh label create "needs:human"  --repo "$REPO" --color "e4e669" --description "Requires human judgment" --force

echo ""
echo "Done! Labels created."
