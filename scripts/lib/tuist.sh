source "$(dirname "$0")/common.sh"

section "🧩 Tuist"

REQUIRED_TUIST=$(grep tuist "$ROOT_DIR/env.versions" | cut -d'=' -f2)

if command -v tuist &> /dev/null; then
  INSTALLED_TUIST=$(tuist version | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')
else
  INSTALLED_TUIST=""
fi

echo "📌 Installed tuist: $INSTALLED_TUIST"
echo "📌 Required tuist:  $REQUIRED_TUIST"

if [ "$INSTALLED_TUIST" != "$REQUIRED_TUIST" ]; then
  echo "📦 Installing Tuist $REQUIRED_TUIST..."
  brew install tuist@$REQUIRED_TUIST
else
  echo "✅ Tuist version OK"
fi