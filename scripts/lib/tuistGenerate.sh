source "$(dirname "$0")/common.sh"

section "🏗️ Tuist Generate"

if [ ! -d "$IOS_DIR" ]; then
  echo "❌ iOS project not found: $IOS_DIR"
  exit 1
fi

echo "📁 Switching to: $IOS_DIR"
cd "$IOS_DIR"

echo "⚙️ Running tuist generate..."
tuist generate