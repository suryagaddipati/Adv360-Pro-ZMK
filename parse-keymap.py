#!/usr/bin/env python3

import re
import json

def parse_keymap(file_path):
    with open(file_path, 'r') as f:
        content = f.read()

    layers = []
    layer_names = []

    layer_pattern = r'(\w+)\s*\{\s*display-name\s*=\s*"([^"]+)";\s*(?:status\s*=\s*"[^"]+";)?\s*bindings\s*=\s*<([^>]+)>;'

    matches = re.finditer(layer_pattern, content, re.DOTALL)

    for match in matches:
        layer_id = match.group(1)
        display_name = match.group(2)
        bindings_text = match.group(3)

        if 'status = "reserved"' in match.group(0):
            continue

        bindings = []
        for binding in re.findall(r'&[^\s]+(?:\s+[^\s&]+)*', bindings_text):
            bindings.append(binding.strip())

        layers.append(bindings)
        layer_names.append(display_name)

    return {
        "layers": layers,
        "layer_names": layer_names
    }

if __name__ == "__main__":
    keymap_data = parse_keymap("config/adv360.keymap")

    print("const keymapData = " + json.dumps(keymap_data, indent=2) + ";")
