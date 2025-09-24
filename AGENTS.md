# Repository Guidelines

## Project Structure & Module Organization
- `config/` holds the keyboard definition: `.keymap` layers, reusable snippets in `macros.dtsi`, version tagging in `version.dtsi`, and `west.yml` for upstream pins.
- `firmware/` is generated output; expect timestamped `*-left.uf2` and `*-right.uf2` files after builds.
- `assets/` contains reference diagrams such as `key-positions.md` that map physical switches to matrix indices.
- `bin/` provides helper scripts (e.g., `get_version_local.sh`) invoked automatically by the Makefile to stamp builds.
- Root files like `Makefile`, `Dockerfile`, and `settings-reset.uf2` orchestrate containerized builds and recovery flows.

## Build, Test, and Development Commands
- `make` (alias for `make all`) builds both halves inside Podman/Docker, writing fresh UF2 images to `firmware/`.
- `make left` limits the container build to the left half for quicker iteration when only that side changed.
- `make clean_firmware` removes generated UF2 images while retaining the cached container layers.
- `make clean_image` purges the `zmk` container image; follow with `make` if upstream toolchains changed.

## Coding Style & Naming Conventions
- Use four-space indentation in DTS files; align bindings in tables for readability, mirroring existing layers.
- Declare shared behaviors and macros in `config/macros.dtsi`, and reference them with uppercase labels (`macro_ver`, `HOMEROW_MODS`).
- Keep layer identifiers descriptive (`default_layer`, `mod`) and update `display-name` fields to match user-facing labels.
- When adding JSON assets (e.g., `keymap.json`), preserve camelCase keys to stay compatible with the web configurator.

## Testing Guidelines
- Treat a successful `make` run as the baseline regression check; it recompiles both halves against the pinned ZMK fork.
- After build, review the newest UF2 filenames to confirm timestamp/commit metadata, then flash to hardware following the README sequence.
- For behavioral changes, stage them on a spare profile and validate key positions against `assets/key-positions.md` to avoid matrix mismatches.

## Commit & Pull Request Guidelines
- Follow the existing Git history: concise, sentence-case summaries (`Updated adv360.keymap`) with optional issue references (`(#643)`).
- Group related keymap edits into a single commit so reviewers can diff layer by layer.
- Open PRs with a short overview, explicit testing notes (`make`, flashed left half), and screenshots or layer exports when altering layouts.
- Link downstream issues or forum threads and note any required firmware resets (`settings-reset.uf2`) so maintainers can reproduce accurately.
