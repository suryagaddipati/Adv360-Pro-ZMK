# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Building Firmware
- `make` or `make all` - Build firmware for both left and right halves using Docker/Podman
- `make left` - Build firmware only for the left half (faster iteration)
- `make clean_firmware` - Remove generated UF2 files while keeping Docker image
- `make clean_image` - Remove Docker image (useful after ZMK updates)
- `make clean` - Remove both firmware files and Docker image

### Build Process
The build system uses containerized compilation with zmkfirmware/zmk-build-arm:stable. Generated firmware files are timestamped and include git commit hashes (format: `YYYYMMDDHHMM-COMMIT-{left|right}.uf2`).

GitHub Actions automatically build on push/PR with two variants:
- Legacy build (no ZMK Studio)
- Clique build (with ZMK Studio support)

## Architecture Overview

### ZMK Fork and Configuration
This repository uses a custom ZMK fork (refil/zmk:adv360-z3.5-2) with Advantage 360 Pro specific features:
- LED indicators for layers, modifiers, and caps/num/scroll lock
- Custom behaviors and macros
- Hardware-specific device tree configurations

### Key Configuration Files
- `config/adv360.keymap` - Main keymap with layer definitions, behaviors, and key bindings
- `config/macros.dtsi` - Reusable macro definitions
- `config/version.dtsi` - Version information (auto-generated)
- `config/west.yml` - ZMK fork and revision pinning
- `config/info.json` & `config/keymap.json` - Web configurator compatibility

### Project Structure
- `config/boards/arm/adv360/` - Hardware definition files (.yaml, .zmk.yml, defconfig)
- `firmware/` - Generated UF2 files (ignored by git)
- `assets/key-positions.md` - Physical key matrix positions for combo/behavior configuration
- `bin/` - Build helper scripts for version stamping

## Keymap Development

### Layer System
The keyboard supports 32 layers with LED color coding. Layer 0 uses black/off LEDs, while subsequent layers cycle through predefined colors on left/right modules.

### Behavior Definitions
Common behaviors defined in the keymap:
- `hm` (homerow_mods) - Home row modifier keys with 200ms tapping term
- `sym` (symbol_mods) - Symbol layer access with tap-preferred flavor
- `num` (number_mods) - Number layer access with hold-tap behavior

### Key Positions
Use `assets/key-positions.md` for exact matrix positions when defining:
- Combos
- Conditional layers
- Advanced behaviors requiring specific key references

## Configuration Options

### Hardware Features
- N-Key Rollover: Modify `CONFIG_ZMK_HID_KEYBOARD_EXTENDED_REPORT` in defconfig files
- Battery Reporting: Toggle `CONFIG_BT_BAS` in adv360_left_defconfig
- LED Colors: Set `CONFIG_ZMK_RGB_UNDERGLOW_MOD_COLOR` for modifier indicators

### Testing and Flashing
1. Build firmware with `make`
2. Follow README flashing instructions (Mod+macro1 for left, Mod+macro3 for right)
3. Use `settings-reset.uf2` for major firmware transitions
4. Check layer colors and behaviors after flashing

## Development Guidelines

### Code Style
- Use 4-space indentation in DTS files
- Align key bindings in tabular format for readability
- Keep layer names descriptive with matching display-name fields
- Preserve JSON formatting for web configurator compatibility

### Version Control
- Commits should be concise and descriptive (e.g., "Updated adv360.keymap")
- Group related keymap changes into single commits
- Include testing notes in PR descriptions
- Reference key position changes when modifying layouts

### Beta Testing
To test beta ZMK features, modify the `revision:` field in `config/west.yml` to point to beta branches. Always check for compatibility notes and submit feedback to the base ZMK repository.