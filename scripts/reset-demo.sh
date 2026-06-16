#!/bin/bash
# Reset the demo page to its original "broken" state for a demo.
# Run this before presenting to restore all intentional bugs.
#
# Usage: ./scripts/reset-demo.sh

set -e

DEMO_COMMIT="dcba400"

echo "Resetting demo/index.html to original broken state..."
git checkout "$DEMO_COMMIT" -- demo/index.html
git add demo/index.html
git commit -m "Reset demo page for demo run"
git push origin master

echo ""
echo "Closing all open issues and PRs..."
gh issue list --state open --json number --jq '.[].number' | while read -r num; do
  gh issue close "$num" --reason "not planned" --comment "Closed for demo reset."
done

echo ""
echo "Done! Demo page is reset. You can now run the agent loops."
echo "  1. Go to Actions tab -> Manager Loop -> Run workflow"
echo "  2. Wait for it to finish creating issues"
echo "  3. Go to Actions tab -> Worker Loop -> Run workflow"
echo "  4. Review the PRs that get created"
