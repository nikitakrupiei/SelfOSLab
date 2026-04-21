source "$(dirname "$0")/common.sh"

section "🧠 Shell configuration"

if [ -n "$BASH_VERSION" ]; then
  SHELL_RC="$HOME/.bashrc"
else
  SHELL_RC="$HOME/.zshrc"
fi

touch "$SHELL_RC"

if ! grep -q 'rbenv init' "$SHELL_RC"; then
  echo "⚙️ Configuring rbenv in shell..."

  echo '' >> "$SHELL_RC"
  echo '# rbenv setup (auto-added by bootstrap)' >> "$SHELL_RC"
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> "$SHELL_RC"
  echo 'eval "$(rbenv init -)"' >> "$SHELL_RC"
else
  echo "✅ rbenv already configured in shell"
fi