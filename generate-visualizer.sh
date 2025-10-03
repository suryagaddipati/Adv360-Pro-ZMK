#!/usr/bin/env bash

set -e

KEYMAP_FILE="config/adv360.keymap"
TEMPLATE_FILE="keymap-visualizer-template.html"
OUTPUT_FILE="keymap-visualizer.html"
PARSER_SCRIPT="parse-keymap.py"

echo "Generating keymap visualizer..."

if [ ! -f "$KEYMAP_FILE" ]; then
    echo "Error: $KEYMAP_FILE not found"
    exit 1
fi

if [ ! -f "$PARSER_SCRIPT" ]; then
    echo "Error: $PARSER_SCRIPT not found"
    exit 1
fi

echo "Parsing keymap data from $KEYMAP_FILE..."
python3 "$PARSER_SCRIPT" > /tmp/keymap_data.js

if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Error: $TEMPLATE_FILE not found"
    exit 1
fi

echo "Generating $OUTPUT_FILE..."
awk '
    /{{KEYMAP_DATA}}/ {
        while ((getline line < "/tmp/keymap_data.js") > 0) {
            print "        " line
        }
        close("/tmp/keymap_data.js")
        next
    }
    { print }
' "$TEMPLATE_FILE" > "$OUTPUT_FILE"

rm -f /tmp/keymap_data.js

echo "✓ Visualizer generated successfully: $OUTPUT_FILE"
echo ""
echo "To view the visualizer, run:"
echo "  xdg-open $OUTPUT_FILE"
