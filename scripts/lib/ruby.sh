source "$(dirname "$0")/common.sh"

section "💎 Ruby"

REQUIRED_RUBY=$(grep ruby "ROOT_DIR/env.versions" | cut -d'=' -f2)

echo "📌 Installed Ruby:"
ruby -v
echo "📌 Required Ruby:  $REQUIRED_RUBY"

if ! command -v rbenv &> /dev/null; then
  echo "📦 Installing rbenv..."
  brew install rbenv ruby-build
else
  echo "✅ Ruby exists → skipping initial install"
fi

eval "$(rbenv init -)"

if ! rbenv versions | grep -q "$REQUIRED_RUBY"; then
  echo "📦 Installing Ruby $REQUIRED_RUBY..."
  rbenv install -s "$REQUIRED_RUBY"
else 
  echo "✅ Ruby version OK → skipping update"
fi

rbenv global "$REQUIRED_RUBY"
rbenv rehash

eval "$(rbenv init -)"