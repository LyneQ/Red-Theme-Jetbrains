#!/usr/bin/env bash
set -euo pipefail

# Build IntelliJ theme plugin JAR from src/main/resources/
# Output: dist/red-<version>.jar

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RES_DIR="$ROOT_DIR/src/main/resources"
PLUGIN_XML="$RES_DIR/META-INF/plugin.xml"

if [[ ! -f "$PLUGIN_XML" ]]; then
  echo "Error: $PLUGIN_XML not found" >&2
  exit 1
fi

# Extract version from plugin.xml
VERSION="$(sed -n 's:.*<version>\(.*\)</version>.*:\1:p' "$PLUGIN_XML" | head -n1)"
if [[ -z "${VERSION:-}" ]]; then
  echo "Warning: Could not parse <version> from plugin.xml. Using 0.0.0" >&2
  VERSION="0.0.0"
fi

DIST_DIR="$ROOT_DIR/dist"
mkdir -p "$DIST_DIR"
OUT_JAR="$DIST_DIR/red-$VERSION.jar"

# Recreate the jar
rm -f "$OUT_JAR"
(
  cd "$RES_DIR"
  # Ensure required entries exist
  for p in META-INF theme; do
    if [[ ! -e "$p" ]]; then
      echo "Error: required path '$RES_DIR/$p' is missing" >&2
      exit 1
    fi
  done
  # A plugin can be distributed as a .jar with the same internal structure as the .zip
  zip -r "$OUT_JAR" META-INF theme >/dev/null
)

echo "Built plugin: $OUT_JAR"