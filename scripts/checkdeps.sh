#!/bin/sh

# cores
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

COMMANDS="mcopy mdir mmd mkfs.fat gcc ld as ar"

echo "Checking dependencies..."

for cmd in $COMMANDS; do
  if command -v "$cmd" >/dev/null 2>&1; then
    echo -e "${GREEN}[OK]${NC} $cmd found"
  else
    echo -e "${RED}[MISSING]${NC} $cmd not found"
  fi
  sleep 0.1
done

echo "Dependency check finished."

