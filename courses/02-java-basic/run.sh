#!/usr/bin/env sh

set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SOURCE_DIR="$SCRIPT_DIR/src/main/java"
OUTPUT_DIR="$SCRIPT_DIR/build/classes"
SOURCE_LIST="$SCRIPT_DIR/build/sources.txt"

mkdir -p "$OUTPUT_DIR"
find "$SOURCE_DIR" -name '*.java' -type f | sort > "$SOURCE_LIST"

if [ ! -s "$SOURCE_LIST" ]; then
    echo "Java source file not found: $SOURCE_DIR" >&2
    exit 1
fi

javac -encoding UTF-8 -d "$OUTPUT_DIR" @"$SOURCE_LIST"
java -cp "$OUTPUT_DIR" lab.Main

