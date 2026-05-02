#!/bin/bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
source "$DIR/lib/common.sh"

section "🚀 Setup started"
echo "✈️ Fasten your seatbelts. We're taking off..."
echo "⚙️ Initializing dev environment..."



bash "$DIR/lib/brew.sh"
bash "$DIR/lib/gitHooks.sh"
bash "$DIR/lib/xcode.sh"
bash "$DIR/lib/linter.sh"
bash "$DIR/lib/formatter.sh"
bash "$DIR/lib/ruby.sh"
bash "$DIR/lib/shellConfig.sh"
bash "$DIR/lib/fastlane.sh"
bash "$DIR/lib/tuist.sh" 
bash "$DIR/lib/tuistGenerate.sh" 



section "🎉 Done"

echo "✨ Environment is ready"
echo "🧠 Stay sharp"
echo "🚀 Happy coding!"