#!/bin/bash
set -e

section() {
  echo ""
  echo "=============================="
  echo "$1"
  echo "=============================="
  echo ""
}

section "🚀 Setup started"
echo "✈️ Fasten your seatbelts. We're taking off..."
echo "⚙️ Initializing dev environment..."






# ------------------------------
# Homebrew
# ------------------------------
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






# ------------------------------
# Xcode
# ------------------------------
section "🧱 Xcode"

if ! xcode-select -p &> /dev/null; then
  echo "❌ Xcode not installed"
  echo "👉 Install Xcode from App Store"
  exit 1
else
  echo "✅ Xcode already installed"
fi






# ------------------------------
# Ruby setup
# ------------------------------
section "💎 Ruby"

REQUIRED_RUBY=$(grep ruby env.versions | cut -d'=' -f2)

if ! command -v rbenv &> /dev/null; then
  echo "📦 Installing rbenv..."
  brew install rbenv ruby-build
fi

# правильний init
eval "$(rbenv init - zsh)"

if ! rbenv versions | grep -q "$REQUIRED_RUBY"; then
  echo "📦 Installing Ruby $REQUIRED_RUBY..."
  rbenv install -s "$REQUIRED_RUBY"
fi

rbenv global "$REQUIRED_RUBY"
rbenv rehash

eval "$(rbenv init - zsh)"

echo "🔍 Ruby version:"
ruby -v






section "🧠 Shell configuration"

if ! grep -q 'rbenv init' ~/.zshrc; then
  echo "⚙️ Configuring rbenv in shell..."

  echo '' >> ~/.zshrc
  echo '# rbenv setup (auto-added by bootstrap)' >> ~/.zshrc
  echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc
else
  echo "✅ rbenv already configured in shell"
fi

echo "⚠️ Restart your terminal to apply changes"






section "🎉 Done"