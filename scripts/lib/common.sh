section() {
  echo ""
  echo "=============================="
  echo "$1"
  echo "=============================="
  echo ""
}

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
IOS_DIR="$ROOT_DIR/SelfOSLab"