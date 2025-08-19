# tetris_mips_asm

A fully playable **Tetris-style** game written in **MIPS assembly** for the **MARS** simulator.
It uses the Bitmap Display and Keyboard MMIO tools for graphics and input, includes scoring, a persistent high score (per run), speedups as you clear lines, and a game-over screen with retry. 🎮🧱

## Features

- **Playfield:** 16×32 virtual grid rendered on a 32×32 tile screen (each tile = 8×8 pixels)
- **Seven tetrominoes (I, J, L, O, S, T, Z)** with rotation tables (0–3)
- **WASD controls** + **Q to quit**, **R to retry** on game over
- **Soft drop** (`S`) and **safe rotation** (`W`, rotation denied if it would collide)
- **Line clearing** with rows above shifting down
- **Score** (1 point per cleared line) and **High Score** shown in side panel
- **Gravity timer** that speeds up: interval decreases by 300 ms every `LINES_PER_LEVEL` lines (until `MIN_GRAVITY`)
- **UI text & numbers** rendered via a compact 3×5 pixel font (digits + needed letters)

---

## Controls

| Key   | Action                        |
| ----- | ----------------------------- |
| **A** | Move left                     |
| **D** | Move right                    |
| **S** | Soft drop (one row)           |
| **W** | Rotate (clockwise)            |
| **Q** | Quit                          |
| **R** | Retry (from Game Over screen) |

> Arrow keys are **not** used; input is ASCII from MMIO.

---

## Requirements

- **MARS** (MIPS Assembler and Runtime Simulator), v4.5 or newer recommended
  (Uses MARS syscalls: **30** = current time (ms), **32** = sleep (ms), **42** = random int range.)
- **Bitmap Display** Tool and **Keyboard & Display MMIO** Tool enabled and connected

---

## Run Instructions (MARS)

1. **Open your `.asm` file** in MARS.
2. **Tools → Bitmap Display**

   - Unit width/height: **8**
   - Display width/height: **256 × 256**
   - Base address: **`0x10008000`**
   - Click **Connect to MIPS**.

3. **Tools → Keyboard and Display MMIO Simulator**

   - Click **Connect to MIPS**.

4. **Assemble** the program (F3) and **Run** (F5).
   You should see the board, walls, and the side panels (Next/Score/HI). Use **WASD** to play.

---

## Memory-Mapped I/O

These are configured at the top of the program (you can change them if you like):

```asm
ADDR_DSPL: .word 0x10008000   # MARS Bitmap Display base address
ADDR_KBRD: .word 0xffff0000   # Keyboard MMIO (status @ +0, data @ +4)
```

**Keyboard MMIO:**

- `0xFFFF0000` — status (non-zero if a key is available)
- `0xFFFF0004` — ASCII of the last key

---

## Color & Screen Model

- Color format: **`0x00RRGGBB`**
- Screen is a **32×32 tile grid** (256×256 pixels @ 8×8 per tile)
- Playfield occupies **16×32** tiles, offset **3** tiles from the left (walls at columns 2 and 19)
- Side panels (Next / Score / HI) live on the right side

Key color constants (examples):

```asm
COLOR_BG_GRAY_LIGHT: .word 0x00606060
COLOR_BG_GREY_DARK:  .word 0x00202020
COLOR_BG_WALL:       .word 0x00ffee00
COLOR_FROZEN_BLOCK:  .word 0x0022c55e
COLOR_I:             .word 0x0000ffff  # cyan
...
COLOR_TEXT_ORANGE:   .word 0x00FF8800
```

---

## Gameplay Constants (tweakable)

```asm
LINES_PER_LEVEL: .word 1     # lines needed to speed up (set to 5 for classic feel)
GRAVITY_INTERVAL: .word 1000 # ms between gravity drops at start
MIN_GRAVITY: .word 100       # fastest gravity (ms)
```

**Speedup rule:** Whenever `LINES_CLEARED % LINES_PER_LEVEL == 0`,
`GRAVITY_INTERVAL -= 300` (but never faster than `MIN_GRAVITY`).

---

## Code Tour (high-level)

- **`main`**
  Initializes the playfield, draws the scene, sets the gravity timer, spawns the first piece, then enters `game_loop`.

- **`game_loop`**
  Draws the static scene + frozen blocks, draws the active tetromino, shows **Score** and **HI**, handles `handle_input` and `apply_gravity`, then sleeps briefly.

- **Drawing**

  - `draw_scene` paints background, walls, side panels, and iterates through `PLAYFIELD` to draw frozen blocks.
  - `draw_tetromino` renders the active piece at `(CURRENT_PIECE_X, CURRENT_PIECE_Y)` using its current rotation table.
  - `draw_digit`, `draw_string`, `draw_char` render 3×5 font glyphs for UI (score, “GAME OVER”, “RETRY (R)”, “HI”).

- **Input** (`handle_input`)
  Reads MMIO keyboard, applies move/rotate if **no collision** at the candidate position.

- **Gravity** (`apply_gravity`)
  Uses syscall 30 (time) to drop automatically every `GRAVITY_INTERVAL` ms; if blocked, calls `freeze_piece`, `check_and_clear_lines`, `spawn_new_piece`.

- **Collision & Freezing**

  - `check_collision` bounds-checks (walls/floor) and tests against `PLAYFIELD`.
  - `freeze_piece` writes the active tetromino’s blocks into `PLAYFIELD`.

- **Line Clearing** (`check_and_clear_lines`)
  Scans rows from bottom → top, clears full lines, calls `shift_rows_down`, increments `SCORE` and `LINES_CLEARED`, and updates speed with `update_speed`.
  Row 0 is handled specially by `clear_top_row`.

- **High Score & Game Over**

  - `update_high_score` compares current `SCORE` vs `HIGH_SCORE`.
  - `spawn_new_piece` checks for immediate collision (blocked spawn ⇒ **Game Over**).
  - `game_over_loop` draws the **GAME / OVER / RETRY (R)** screen; waits for **R** (restart) or **Q** (quit).
  - `restart_game` resets all state and clears the playfield.

---

## Data Tables

- **Rotation tables:** `ROTATIONS_I`, `ROTATIONS_J`, … each points to 4 shape definitions (O repeats).
- **Shapes:** `SHAPE_*_*` store 4 block (x,y) offsets for each rotation.
- **Colors:** `ALL_COLORS_TABLE` maps piece type → piece color.
- **Playfield:** `PLAYFIELD` is a **512-word** buffer (`16 × 32`, `.space 2048` bytes).
- **Fonts:** `FONT_TABLE` (digits 0–9) and individual letter glyphs (A,E,G,H,I,M,O,R,T,V,Y, parentheses, space).

## Acknowledgments

- Runs on the excellent **MARS** simulator.
- Inspired by classic Tetris mechanics; this educational version focuses on clean MIPS control flow, MMIO, and data-driven rendering.
