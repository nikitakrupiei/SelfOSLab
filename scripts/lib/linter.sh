source "$(dirname "$0")/common.sh"

section "🧹 SwiftLint"

if ! command -v swiftlint &> /dev/null; then
  echo "❌ SwiftLint not installed"
   echo "🍺 Installing SwiftLint via Homebrew..."
   brew install swiftlint
else
  echo "✅ SwiftLint already installed"
  swiftlint version
fi