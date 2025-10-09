#!/usr/bin/env bash

set -euo pipefail

# --- Input validation ---
if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

BASE_DIR="$1"

if [[ ! -d "$BASE_DIR" ]]; then
  echo "Error: '$BASE_DIR' is not a directory."
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_FILE="$SCRIPT_DIR/repos.txt"

origins=()
no_origin=()

# --- Scan for Git repositories ---
for dir in "$BASE_DIR"/*; do
  if [[ -d "$dir/.git" ]]; then
    origin=$(git -C "$dir" config --get remote.origin.url || true)
    repo_name=$(basename "$dir")

    if [[ -n "$origin" ]]; then
      origins+=("$origin")
    else
      no_origin+=("$repo_name")
    fi
  fi
done

# --- Display results ---
echo
echo "=== Repositories with origins ==="
if [[ ${#origins[@]} -gt 0 ]]; then
  printf '%s\n' "${origins[@]}"
else
  echo "(none)"
fi

echo
echo "=== Repositories with NO origin ==="
if [[ ${#no_origin[@]} -gt 0 ]]; then
  printf '%s\n' "${no_origin[@]}"
else
  echo "(none)"
fi
echo

# --- Ask user to write repos.txt ---
if [[ ${#origins[@]} -gt 0 ]]; then
  read -rp "Overwrite repos.txt with the list of origins? (y/N): " confirm
  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    printf '%s\n' "${origins[@]}" > "$OUTPUT_FILE"
    echo "✅ Repos written to: $OUTPUT_FILE"
  else
    echo "❌ Skipped writing to repos.txt"
  fi
else
  echo "⚠️ No origins found — nothing to write."
fi