#!/bin/bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
source "$DIR/lib/common.sh"

section "🧹 SwiftLint

echo "👉 Lint App"
swiftlint lint --path SelfOSLab/SelfOSLab/SelfOSLab/Sources || exit 1

echo "👉 Lint Platform"
swiftlint lint --path Platform/Sources || exit 1

echo "✅ All SwiftLint checks passed"