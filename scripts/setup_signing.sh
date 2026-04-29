#!/bin/bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
source "$DIR/lib/common.sh"
PROJECT_ROOT="$(cd "$DIR/.." && pwd)"
cd "$PROJECT_ROOT/SelfOSLab"

section "🔐 iOS Signing setup started..."



echo "📦 Installing dependencies..."
bundle install

echo "🔑 Syncing certificates with match..."

bundle exec fastlane ios dev_match

echo "✅ Signing setup completed successfully"