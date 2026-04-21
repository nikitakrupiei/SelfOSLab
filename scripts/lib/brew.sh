source "$(dirname "$0")/common.sh"

section "🍺 Homebrew"

if ! command -v brew &> /dev/null; then
  echo "📦 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew already installed"
fi

# Fix PATH (Apple Silicon safe)
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Verify
if command -v brew &> /dev/null; then
  echo "✅ Homebrew OK"
  brew --version
else
  echo "❌ Brew not available after install"
  exit 1
fi