source "$(dirname "$0")/common.sh"

section "🔧 Setting up git hooks..."

git config core.hooksPath scripts/git-hooks

chmod +x scripts/git-hooks/pre-commit
chmod +x scripts/lint.sh

echo "🎉 Git hooks installed"
