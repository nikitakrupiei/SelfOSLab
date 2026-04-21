source "$(dirname "$0")/common.sh"

section "🧱 Xcode"

if ! xcode-select -p &> /dev/null; then
  echo "❌ Xcode not installed"
  echo "👉 Install Xcode from App Store"
  exit 1
else
  echo "✅ Xcode already installed"
fi