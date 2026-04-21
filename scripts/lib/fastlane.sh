source "$(dirname "$0")/common.sh"

section "🚀 Fastlane"

REQUIRED_FASTLANE=$(grep fastlane "$ROOT_DIR/env.versions" | cut -d'=' -f2)

if command -v fastlane &> /dev/null; then
  INSTALLED_FASTLANE=$(ruby -S fastlane --version | tail -n 1 | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')
else
  INSTALLED_FASTLANE=""
fi

echo "📌 Installed fastlane: $INSTALLED_FASTLANE"
echo "📌 Required fastlane:  $REQUIRED_FASTLANE"

# якщо нема або різна версія → ставимо
if [ -z "$INSTALLED_FASTLANE" ]; then
  echo "📦 Fastlane not found → installing $REQUIRED_FASTLANE..."
  gem install fastlane -v "$REQUIRED_FASTLANE"

elif [ "$INSTALLED_FASTLANE" != "$REQUIRED_FASTLANE" ]; then
  echo "⚠️ Version mismatch → installing required version"
  gem install fastlane -v "$REQUIRED_FASTLANE"

else
  echo "✅ Fastlane version OK → skipping install"
fi
