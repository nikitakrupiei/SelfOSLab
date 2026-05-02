source "$(dirname "$0")/common.sh"

section "🦾 SwiftFormat"

if ! command -v swiftformat &> /dev/null; then
   echo "❌ SwiftFormat not installed"
   echo "🍺 Installing SwiftFormat via Homebrew..."
   brew install swiftformat
else
  echo "✅ SwiftFormat already installed"
  swiftformat version
fi