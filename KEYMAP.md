# Kinesis Advantage 360 Pro - Keymap Documentation

This document describes the custom keymap configuration with detailed explanations of all layers and tap/hold behaviors.

## Behavior Overview

All tap/hold behaviors use the following timing configuration:
- **Tapping term**: 200ms
- **Quick tap**: 175ms
- **Flavor**: tap-preferred

## Layer Structure

| Layer | Name | Purpose | Access Method |
|-------|------|---------|---------------|
| 0 | Base | Default typing layer | Default active |
| 1 | Keypad | Numeric keypad functionality | Toggle with `tog 1` |
| 2 | Function | Function keys (F1-F12) | Hold `mo 2` keys |
| 3 | Mod | System controls, Bluetooth, RGB | Hold `mo 3` key |
| 4 | Symbol | Symbols and shifted numbers | Hold V or M |
| 5 | Number | Number row (1-0) | Hold C or comma |

## Layer 0: Base Layer

### Regular Keys
```
= 1 2 3 4 5 [tog1]           [mo3] 6 7 8 9 0 -
^ Q W E R T                         Y U I O P \
⎋ A S D F G                         H J K L ; '
⎇ Z X C V B                         N M , . / ⎇
```

### Tap/Hold Behaviors

#### Home Row Modifiers
| Key | Tap | Hold | Position |
|-----|-----|------|----------|
| A | a | Left GUI (⌘/⊞) | Left pinky |
| S | s | Left Ctrl | Left ring |
| L | l | Right Ctrl | Right ring |
| ; | ; | Right GUI (⌘/⊞) | Right pinky |

#### Additional Modifiers
| Key | Tap | Hold | Position |
|-----|-----|------|----------|
| D | d | Left Shift | Left middle |
| K | k | Right Shift | Right middle |

#### Layer Access
| Key | Tap | Hold | Position |
|-----|-----|------|----------|
| V | v | Symbol Layer (4) | Left ring (bottom) |
| M | m | Symbol Layer (4) | Right ring (bottom) |
| C | c | Number Layer (5) | Left middle (bottom) |
| , | , | Number Layer (5) | Right middle (bottom) |

#### Thumb Cluster
| Key | Tap | Hold | Position |
|-----|-----|------|----------|
| Inner Left | TAB | Left Ctrl | Left thumb |
| Inner Right | TAB | Right Ctrl | Right thumb |
| Outer Left | TAB | Left Shift | Left thumb |
| Outer Right | TAB | Right Shift | Right thumb |

### Navigation Keys
- **Left thumb area**: Space, Escape, Home, Left, Right, Grave, Caps
- **Right thumb area**: Enter, Backspace, Page Up, Up, Down, Left/Right brackets
- **Function access**: `mo 2` in bottom corners

## Layer 1: Keypad Layer

Provides numeric keypad functionality while maintaining most base layer behaviors.

### Keypad Numbers
```
= 1 2 3 4 5 [tog1]           [mo3] 6 NUM = ÷ × -
^ Q W E R T                         Y 7 8 9 - \
⎋ A S D F G                         H 4 5 6 + '
⎇ Z X C V B                         N 1 2 3 ⏎ ⎇
```

### Key Differences from Base Layer
- **Right side numbers**: Standard keypad layout (7-8-9, 4-5-6, 1-2-3)
- **Right thumb**: KP_N0 (keypad 0) instead of some navigation
- **Math operators**: ÷, ×, +, - in appropriate positions
- **Same modifiers**: All tap/hold behaviors preserved

### Tap/Hold Behaviors
All behaviors from base layer are maintained:
- Home row modifiers (A, S, L, semicolon)
- Shift keys (D, K/KP_N5)
- Layer access (V, M/KP_N1, C, comma/KP_N2)
- Thumb cluster (TAB/Ctrl, TAB/Shift)

## Layer 2: Function Layer

Access via `mo 2` (momentary layer 2) keys in bottom corners.

### Function Keys
```
F1 F2 F3 F4 F5 F6 [tog1]           [mo3] F7 F8 F9 F10 F11 F12
```

All other keys are transparent (`&trans`) and pass through to the base layer.

## Layer 3: Mod Layer

System control layer accessed via `mo 3` key (top right).

### Bluetooth Controls
```
⌀ BT1 BT2 BT3 BT4 BT5                           ⌀ ⌀ ⌀ ⌀ ⌀ ⌀
⌀ ⌀   ⌀   ⌀   ⌀   ⌀   [BOOT]           [BOOT] ⌀ ⌀ ⌀ ⌀ ⌀ ⌀
🔓 ⌀   ⌀   ⌀   ⌀   ⌀           BT_CLR   🔋     ⌀ ⌀ ⌀ ⌀ ⌀ ⌀
⌀ ⌀   ⌀   ⌀   VER  ⌀                           ⌀ ⌀ ⌀ ⌀ ⌀ ⌀
⌀ ⌀   ⌀   ⌀   ⌀              ⌀ ⌀ ⌀    ⌀ BL↑ RGB        BL+ BL- ⌀ ⌀ ⌀
```

### Controls
- **BT1-BT5**: Bluetooth device selection
- **BT_CLR**: Clear Bluetooth bonds
- **BOOT**: Enter bootloader mode
- **🔓**: Studio unlock
- **🔋**: Battery status
- **VER**: Version macro
- **BL**: Backlight controls (toggle, increase, decrease)
- **RGB**: RGB underglow toggle

## Layer 4: Symbol Layer

Accessed by holding V or M keys.

### Symbol Layout
```
⌀   ⌀   ⌀   ⌀   ⌀   ⌀                           ⌀   ⌀   ⌀   ⌀   ⌀   ⌀   ⌀
⌀   ⌀   ⌀   ⌀   ⌀   ⌀                           ⌀   ⌀   -   _   [   ]   ⌀
⌀   !   @   #   $   %                   ⇥       ^   &   *   (   )   ⌀
⌀   ⌀   ⌀   ⌀   ⌀   ⌀                           ⌀   ⌀   <   >   ?   ⌀
⌀   ⌀   ⌀   ⌀   ⌀       +   "   ⌀   ⌀   '   =       ⌀   ⌀   ⌀   ⌀   ⌀
```

### Symbol Groups
- **Left side**: Shifted numbers 1-5 (!@#$%)
- **Right side**: Shifted numbers 6-0 (^&*())
- **Punctuation**: Brackets, quotes, operators
- **Math**: Plus, equals, minus, underscore
- **Comparison**: Less than, greater than, question mark

## Layer 5: Number Layer

Accessed by holding C or comma keys.

### Number Layout
```
⌀   ⌀   ⌀   ⌀   ⌀   ⌀                           ⌀   ⌀   ⌀   ⌀   ⌀   ⌀   ⌀
⌀   ⌀   ⌀   ⌀   ⌀   ⌀                           ⌀   ⌀   ⌀   ⌀   ⌀   ⌀   ⌀
⌀   1   2   3   4   5                           6   7   8   9   0   ⌀
⌀   ⌀   ⌀   ⌀   ⌀   ⌀                           ⌀   ⌀   ⌀   ⌀   ⌀   ⌀
⌀   ⌀   ⌀   ⌀   ⌀       ⌀   ⌀   ⌀   ⌀   ⌀   ⌀       ⌀   ⌀   ⌀   ⌀   ⌀
```

Provides easy access to number row (1-0) on the home row for numeric input.

## Usage Tips

### Efficient Typing Patterns
1. **Home row modifiers**: Keep hands in position, use holds for modifiers
2. **Symbol access**: Hold V or M with one hand, type symbols with the other
3. **Numbers**: Hold C or comma for quick number access
4. **Navigation**: Use thumb cluster for common operations (TAB, Ctrl)

### Layer Combinations
- **Shift + symbols**: Use D/K hold + V/M hold for shifted symbols
- **Ctrl + anything**: Use S hold or thumb Ctrl for shortcuts
- **Numbers + modifiers**: Combine C/comma hold with home row modifiers

### Ergonomic Benefits
- **Reduced pinky strain**: Shift moved from pinkies to D/K
- **Better symbol access**: V/M instead of F/J reduces conflicts
- **Thumb utilization**: TAB in stronger thumb positions
- **Balanced layers**: Both hands can access most functionality

## Troubleshooting

### Common Issues
- **Accidental layer activation**: Check hold timing (200ms)
- **Missing characters**: Ensure you're on correct layer
- **Modifier conflicts**: Use single modifier holds, avoid double-holds

### Hold Timing
If keys are too sensitive or not sensitive enough, adjust:
- `tapping-term-ms`: Increase for less sensitivity
- `quick_tap_ms`: Adjust for double-tap behavior

## Layer Colors

Each layer has associated LED colors for visual feedback:
- Layer 0 (Base): Black/Off
- Layer 1 (Keypad): White
- Layer 2 (Function): Blue
- Layer 3 (Mod): Green
- Layer 4 (Symbol): Red
- Layer 5 (Number): Magenta