#!/bin/bash
set -u

folder="${1:-}"
if [[ -z "$folder" ]]; then
  folder="."
fi

echo "Organising: $folder"