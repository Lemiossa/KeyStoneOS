#!/bin/sh
IMG="$1"
SRC=$(realpath "$2")  # garante caminho absoluto

copy_recursive() {
  local DIR="$1"
  for F in "$DIR"/*; do
    [ -e "$F" ] || continue  # evita problemas com pastas vazias
    if [ -d "$F" ]; then
      mmd -i "$IMG" "::${F#$SRC/}"
      copy_recursive "$F"
    elif [ -f "$F" ]; then
      mcopy -i "$IMG" "$F" "::${F#$SRC/}"
    fi
  done
}

copy_recursive "$SRC"

