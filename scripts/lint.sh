#!/bin/bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
source "$DIR/lib/common.sh"

section "🧹 SwiftLint"

echo "👉 Lint all App"
swiftlint lint --strict || exit 1

echo "✅ All SwiftLint checks passed"