.data
# Immutable Data
ADDR_DSPL:
    .word 0x10008000
ADDR_KBRD:
    .word 0xffff0000
   
  
# Colors
COLOR_BLACK:
    .word 0x00000000
COLOR_BG_GRAY_LIGHT:
    .word 0x00606060
COLOR_BG_GREY_DARK:
    .word 0x00202020
COLOR_BG_WALL:
    .word 0x00ffee00
    #.word 0x00f9f5fe

COLOR_PANEL_NEXT:      # New color for the "Next Piece" panel
    .word 0x00008000     # Dark Green
COLOR_PANEL_SCORE:     # New color for the "Score" panel
    .word 0x00800000     # Dark Red

COLOR_FROZEN_BLOCK:
    .word 0x0022c55e     # Grey for landed pieces

# --- NEW: Tetromino Colors ---
COLOR_I: .word 0x0000ffff # Cyan
COLOR_J: .word 0x000000ff # Blue
COLOR_L: .word 0x00ffa500 # Orange
COLOR_O: .word 0x00ffff00 # Yellow
COLOR_S: .word 0x0000ff00 # Green
COLOR_T: .word 0x00800080 # Purple
COLOR_Z: .word 0x00ff0000 # Red

COLOR_TEXT_ORANGE: .word 0x00FF8800

# Game State Variables
CURRENT_PIECE_X:
    .word 10 # Updated starting X to be centered in the new play area
CURRENT_PIECE_Y:
    .word 1
# CURRENT_PIECE_ORIENTATION:
#    .word 0              # 0 = horizontal, 1 = vertical

CURRENT_PIECE_TYPE: .word 0  # 0=I, 1=J, 2=L, 3=O, 4=S, 5=T, 6=Z
CURRENT_PIECE_ORIENTATION: .word 0 # 0, 1, 2, or 3
CURRENT_PIECE_COLOR: .word 0
SCORE:              .word 0
LINES_CLEARED:      .word 0   # Total lines cleared
LINES_PER_LEVEL:    .word 1   # Speed increases every 5 lines
MIN_GRAVITY:        .word 100 # Fastest possible gravity in ms



# --- NEW: Gravity Timer ---
LAST_GRAVITY_TIME: .word 0      # Stores the system time of the last gravity drop
GRAVITY_INTERVAL:  .word 1000   # Gravity happens every 1000 ms (1 second)


# --- NEW ROTATION DATA STRUCTURES ---
# Master table pointing to the rotation table for each piece type
MASTER_SHAPE_TABLE:
    .word ROTATIONS_I, ROTATIONS_J, ROTATIONS_L, ROTATIONS_O, ROTATIONS_S, ROTATIONS_T, ROTATIONS_Z

# Color table (unchanged)
ALL_COLORS_TABLE:
    .word COLOR_I, COLOR_J, COLOR_L, COLOR_O, COLOR_S, COLOR_T, COLOR_Z


# --- Rotation tables for each piece ---
ROTATIONS_I: .word SHAPE_I_0, SHAPE_I_1, SHAPE_I_0, SHAPE_I_1
ROTATIONS_J: .word SHAPE_J_0, SHAPE_J_1, SHAPE_J_2, SHAPE_J_3
ROTATIONS_L: .word SHAPE_L_0, SHAPE_L_1, SHAPE_L_2, SHAPE_L_3
ROTATIONS_O: .word SHAPE_O_0, SHAPE_O_0, SHAPE_O_0, SHAPE_O_0
ROTATIONS_S: .word SHAPE_S_0, SHAPE_S_1, SHAPE_S_0, SHAPE_S_1
ROTATIONS_T: .word SHAPE_T_0, SHAPE_T_1, SHAPE_T_2, SHAPE_T_3
ROTATIONS_Z: .word SHAPE_Z_0, SHAPE_Z_1, SHAPE_Z_0, SHAPE_Z_1

# --- All Shape Data (all orientations) ---
# I-Piece
SHAPE_I_0: .word 0,1, 1,1, 2,1, 3,1 # Horizontal
SHAPE_I_1: .word 1,0, 1,1, 1,2, 1,3 # Vertical
# J-Piece
SHAPE_J_0: .word 0,0, 0,1, 1,1, 2,1
SHAPE_J_1: .word 1,0, 2,0, 1,1, 1,2
SHAPE_J_2: .word 0,1, 1,1, 2,1, 2,2
SHAPE_J_3: .word 1,0, 1,1, 0,2, 1,2
# L-Piece
SHAPE_L_0: .word 2,0, 0,1, 1,1, 2,1
SHAPE_L_1: .word 1,0, 1,1, 1,2, 2,2
SHAPE_L_2: .word 0,1, 1,1, 2,1, 0,2
SHAPE_L_3: .word 0,0, 1,0, 1,1, 1,2
# O-Piece
SHAPE_O_0: .word 0,0, 1,0, 0,1, 1,1
# S-Piece
SHAPE_S_0: .word 1,0, 2,0, 0,1, 1,1
SHAPE_S_1: .word 0,0, 0,1, 1,1, 1,2
# T-Piece
SHAPE_T_0: .word 0,1, 1,1, 2,1, 1,0
SHAPE_T_1: .word 1,0, 0,1, 1,1, 1,2
SHAPE_T_2: .word 1,2, 0,1, 1,1, 2,1
SHAPE_T_3: .word 1,0, 1,1, 2,1, 1,2
# Z-Piece
SHAPE_Z_0: .word 0,0, 1,0, 1,1, 2,1
SHAPE_Z_1: .word 1,0, 0,1, 1,1, 0,2

# --- NEW: Font data for displaying numbers ---
# A table of pointers to the data for each digit (0-9)
FONT_TABLE:
    .word FONT_0, FONT_1, FONT_2, FONT_3, FONT_4, FONT_5, FONT_6, FONT_7, FONT_8, FONT_9

# Pixel data for a 3x5 font. 1s are drawn, 0s are blank.
# The data is stored as 5 words, one for each row.
# Binary: 111 = 7, 101 = 5, 010 = 2, 110 = 6, 001 = 1, 100 = 4
FONT_0: .word 7, 5, 5, 5, 7 # 0
FONT_1: .word 2, 6, 2, 2, 7 # 1
FONT_2: .word 7, 1, 7, 4, 7 # 2
FONT_3: .word 7, 1, 7, 1, 7 # 3
FONT_4: .word 5, 5, 7, 1, 1 # 4
FONT_5: .word 7, 4, 7, 1, 7 # 5
FONT_6: .word 7, 4, 7, 5, 7 # 6
FONT_7: .word 7, 1, 2, 2, 2 # 7
FONT_8: .word 7, 5, 7, 5, 7 # 8
FONT_9: .word 7, 5, 7, 1, 7 # 9

## NEW: Game state, high score, and UI text data
HIGH_SCORE:     .word 0           # Persists across games
GAME_OVER_FLAG: .word 0           # 0 = playing, 1 = game over

GAMEOVER_TEXT:  .asciiz "GAME OVER"
RETRY_TEXT:     .asciiz "RETRY (R)"
HI_TEXT:        .asciiz "HI"

# --- NEW: Font data for letters needed in the UI ---
# Using the same 3x5 pixel format as the numbers.
FONT_A: .word 7, 5, 7, 5, 5
FONT_E: .word 7, 4, 6, 4, 7
FONT_G: .word 7, 4, 5, 5, 7
FONT_H: .word 5, 5, 7, 5, 5
FONT_I: .word 7, 2, 2, 2, 7
FONT_M: .word 5, 7, 7, 5, 5
FONT_O: .word 7, 5, 5, 5, 7
FONT_R: .word 7, 5, 6, 5, 5
FONT_T: .word 7, 2, 2, 2, 2
FONT_V: .word 5, 5, 5, 5, 2
FONT_Y: .word 5, 5, 7, 2, 2
FONT_L_PAREN: .word 4, 2, 2, 2, 4   # 100,010,010,010,100
FONT_R_PAREN: .word 1, 2, 2, 2, 1   # 001,010,010,010,001
FONT_SPACE:   .word 0, 0, 0, 0, 0 # A blank character

# --- NEW: The Virtual Playfield ---
# An array of 512 words (16x32) to represent the game board.
# 0 = empty, 1 = occupied by a frozen piece.
PLAYFIELD:
    .space 2048  # 16 * 32 = 512 words. 512 * 4 bytes/word = 2048 bytes.

GAME_TEXT:        .asciiz "GAME"
OVER_TEXT:        .asciiz "OVER" 
RETRY_ONLY_TEXT:  .asciiz "RETRY"
R_PARENS_TEXT:    .asciiz ")R("

##############################################################################
# Mutable Data
##############################################################################

##############################################################################
# Code
##############################################################################
.text
.globl main


# Run the Tetris game.

main:
    # --- One-Time Game Setup ---
    jal  initialize_playfield
    jal  draw_scene

    # --- NEW: Initialize Gravity Timer ---
    # We need to set the initial time so the first drop doesn't happen instantly.
    li   $v0, 30         # Syscall 30: System Time
    syscall              # Get current time in $a0
    la   $t0, LAST_GRAVITY_TIME
    sw   $a0, 0($t0)     # Store it as the initial time

    # --- Spawn the first piece ---
    jal  spawn_new_piece

#-----------------------------------------------------------------------------

# GENERAL NOTES

# 1. 0x00RRGGBB, where RR, GG, and BB are the hexadecimal values for
#    the red, green, and blue components.
#
#    Black: 0x00000000 
#    White: 0x00FFFFFF
#    Dark Grey: 0x001c1c1c
#    Blue: 0x000000FF 

# 2. 32x32 grid of units (256 pixels / 8 pixels per unit = 32)

#-----------------------------------------------------------------------------

# WHAT ARE TEMPORARIES DOING

# t0 - store the address of the current unit im looking at 
# t1 - stores the current color 
# t2 - Counter for units i need to pain
# t3 - will store tempories (starting wall address)

#-----------------------------------------------------------------------------


## MODIFIED: game_loop
game_loop:
    ## NEW: Check if the game is over. If so, branch to the game over loop.
    la   $t0, GAME_OVER_FLAG
    lw   $t0, 0($t0)
    bne  $t0, $zero, game_over_loop

    # Erase the screen by redrawing the entire static scene
    jal  draw_scene

    # Display the current score and the high score
    jal  draw_score
    jal  draw_high_score      ## NEW: Call the high score drawing function

    # --- Draw the current tetromino ---
    # (The rest of the original drawing logic remains the same)
    la   $s0, CURRENT_PIECE_TYPE
    lw   $s0, 0($s0)
    la   $s1, CURRENT_PIECE_ORIENTATION
    lw   $s1, 0($s1)

    sll  $t0, $s0, 2
    la   $t1, MASTER_SHAPE_TABLE
    add  $t1, $t1, $t0
    lw   $t1, 0($t1)
    sll  $t0, $s1, 2
    add  $a0, $t1, $t0
    lw   $a0, 0($a0)

    la   $t0, CURRENT_PIECE_X
    lw   $a1, 0($t0)
    la   $t0, CURRENT_PIECE_Y
    lw   $a2, 0($t0)

    jal  draw_tetromino

    # Handle player input and gravity
    jal  handle_input
    jal  apply_gravity

    # Frame delay
    li   $v0, 32
    li   $a0, 100
    syscall

    b    game_loop


#-----------------------------------------------------------------------------
# draw_scene: Draws the static board AND all frozen pieces from the playfield.
#-----------------------------------------------------------------------------
draw_scene:
    # --- Function Setup: Load all colors ---
    # (This part is the same as before)
    la   $t0, ADDR_DSPL
    lw   $t0, 0($t0)
    la   $t1, COLOR_BLACK
    lw   $t1, 0($t1)
    la   $t2, COLOR_BG_WALL
    lw   $t2, 0($t2)
    la   $t3, COLOR_BG_GREY_DARK
    lw   $t3, 0($t3)
    la   $t4, COLOR_BG_GRAY_LIGHT
    lw   $t4, 0($t4)
    la   $t5, COLOR_PANEL_NEXT
    lw   $t5, 0($t5)
    la   $t6, COLOR_PANEL_SCORE
    lw   $t6, 0($t6)

    # --- Draw the static background, walls, and panels ---
    # (This nested loop is the same as before)
    li   $s0, 0
scene_outer_loop:
    li   $s1, 0
scene_inner_loop:
    blt  $s1, 2, draw_black
    beq  $s1, 2, draw_wall_color
    blt  $s1, 19, handle_play_area
    beq  $s1, 19, draw_wall_color
    beq  $s1, 20, draw_black
    blt  $s1, 31, handle_side_panel
    j    draw_black
handle_play_area:
    beq  $s0, 31, draw_wall_color
    add  $t7, $s0, $s1
    andi $t7, $t7, 1
    beq  $t7, $zero, draw_dark_grey
    j    draw_light_grey
handle_side_panel:
    blt  $s0, 20, draw_green_panel
    blt  $s0, 22, draw_black
    j    draw_red_panel
draw_black:
    sw   $t1, 0($t0)
    j    scene_continue
draw_wall_color:
    sw   $t2, 0($t0)
    j    scene_continue
draw_dark_grey:
    sw   $t3, 0($t0)
    j    scene_continue
draw_light_grey:
    sw   $t4, 0($t0)
    j    scene_continue
draw_green_panel:
    sw   $t5, 0($t0)
    j    scene_continue
draw_red_panel:
    sw   $t6, 0($t0)
    j    scene_continue
scene_continue:
    addi $t0, $t0, 4
    addi $s1, $s1, 1
    blt  $s1, 32, scene_inner_loop
    addi $s0, $s0, 1
    blt  $s0, 32, scene_outer_loop

    # --- NEW: Draw all frozen pieces from the PLAYFIELD array ---
    la   $s0, PLAYFIELD              # $s0 = pointer to the start of the playfield
    li   $s1, 512                    # $s1 = counter for all 512 cells
    li   $s2, 0                      # $s2 = index of the current cell (0 to 511)
    la   $t1, COLOR_FROZEN_BLOCK
    lw   $t1, 0($t1)                 # $t1 = color for frozen blocks

draw_playfield_loop:
    lw   $t0, 0($s0)                 # Load the value from the current playfield cell
    beq  $t0, $zero, check_next_cell # If it's 0 (empty), skip drawing

    # This cell is occupied (1), so we need to draw a block.
    # Calculate the (x,y) of this cell in the playfield.
    li   $t0, 16
    divu $s2, $t0                    # Use divu for unsigned division
    mflo $t2                         # $t2 = y = index / 16
    mfhi $t3                         # $t3 = x = index % 16
    
    # Calculate the screen memory address for this (x,y)
    addi $t3, $t3, 3                 # Add screen x-offset for the playfield
    li   $t4, 32
    mul  $t4, $t2, $t4
    add  $t4, $t4, $t3
    mul  $t4, $t4, 4
    la   $t0, ADDR_DSPL
    lw   $t0, 0($t0)
    add  $t0, $t0, $t4               # $t0 = final memory address to draw
    
    # Draw the frozen block
    sw   $t1, 0($t0)

check_next_cell:
    addi $s0, $s0, 4                 # Move to the next cell in the playfield array
    addi $s2, $s2, 1                 # Increment index
    addi $s1, $s1, -1                # Decrement counter
    bne  $s1, $zero, draw_playfield_loop

    jr   $ra


#-----------------------------------------------------------------------------
# draw_line: Draws a vertical or horizontal line.
# Arguments:
#   $a0 - Starting X coordinate
#   $a1 - Starting Y coordinate
#   $a2 - Length of the line (in units)
#   $a3 - Direction (0 for horizontal, 1 for vertical)
#-----------------------------------------------------------------------------
draw_line:
    # Calculate starting memory address from (x, y) coordinates
    # address = base + (y * 32 + x) * 4
    li   $t5, 32
    mul  $t4, $a1, $t5         # $t4 = y * 32
    add  $t4, $t4, $a0         # $t4 = y * 32 + x
    mul  $t4, $t4, 4           # $t4 = (y * 32 + x) * 4 (final byte offset)

    la   $t0, ADDR_DSPL
    lw   $t0, 0($t0)           # $t0 = base address
    add  $t0, $t0, $t4         # $t0 = starting memory address for the line

    # Get the wall color
    la   $t1, COLOR_BG_WALL
    lw   $t1, 0($t1)

    # Determine address increment based on direction
    li   $t5, 4                # Default increment for horizontal lines
    bne  $a3, 1, setup_line_loop # If not vertical, skip ahead
    li   $t5, 128              # Increment for vertical lines

setup_line_loop:
    move $t2, $a2              # $t2 = line length (our counter)

line_loop:
    sw   $t1, 0($t0)           # Draw one unit of the line
    add  $t0, $t0, $t5         # Move pointer by horizontal or vertical increment
    addi $t2, $t2, -1          # Decrement counter
    bne  $t2, $zero, line_loop # Loop until line is drawn

    jr   $ra
    

#-----------------------------------------------------------------------------
# draw_tetromino: Draws the current piece with its current color and position.
# Arguments:
#   $a0 - Pointer to the piece's shape data
#   $a1 - X coordinate (within the 16-wide playfield)
#   $a2 - Y coordinate (within the 32-high playfield)
#-----------------------------------------------------------------------------
draw_tetromino:
    # --- Prologue: Save registers ---
    addi $sp, $sp, -16
    sw   $ra, 12($sp)
    sw   $s0, 8($sp)
    sw   $s1, 4($sp)
    sw   $s2, 0($sp)

    # Load the CURRENT piece's color
    la   $t1, CURRENT_PIECE_COLOR
    lw   $t1, 0($t1)

    li   $t2, 4
    move $t7, $a0

draw_tetromino_loop:
    lw   $t3, 0($t7)
    lw   $t4, 4($t7)

    # Compute absolute screen coordinates
    add  $s0, $a1, $t3         # abs_x = piece_x + rel_x
    add  $s1, $a2, $t4         # abs_y = piece_y + rel_y
    
    # Add the playfield's offset from the left edge of the screen
    addi $s0, $s0, 3           # The playfield starts at column 3

    # Compute final memory address from (abs_x, abs_y)
    li   $s2, 32               # Screen width is 32 units
    mul  $s2, $s1, $s2         # y_offset = abs_y * screen_width
    add  $s2, $s2, $s0         # index = y_offset + abs_x
    mul  $s2, $s2, 4           # byte_offset = index * 4

    la   $t0, ADDR_DSPL
    lw   $t0, 0($t0)
    add  $t0, $t0, $s2

    sw   $t1, 0($t0)

    addi $t7, $t7, 8
    addi $t2, $t2, -1
    bne  $t2, $zero, draw_tetromino_loop

    # --- Epilogue: Restore registers ---
    lw   $s2, 0($sp)
    lw   $s1, 4($sp)
    lw   $s0, 8($sp)
    lw   $ra, 12($sp)
    addi $sp, $sp, 16
    jr   $ra


#-----------------------------------------------------------------------------
# handle_input: Handles movement and safe rotation.
#-----------------------------------------------------------------------------
handle_input:
    # --- Prologue ---
    addi $sp, $sp, -24
    sw   $ra, 20($sp)
    sw   $s0, 16($sp)
    sw   $s1, 12($sp)
    sw   $s2, 8($sp)
    sw   $s3, 4($sp)
    sw   $s4, 0($sp)

    la   $k0, ADDR_KBRD
    lw   $k0, 0($k0)
    lw   $k1, 0($k0)
    beq  $k1, $zero, input_done

    lw   $t5, 4($k0)

    # --- Load current piece state ---
    la   $s0, CURRENT_PIECE_TYPE
    lw   $s0, 0($s0)
    la   $s1, CURRENT_PIECE_ORIENTATION
    lw   $s1, 0($s1)
    la   $s2, CURRENT_PIECE_X
    lw   $a1, 0($s2)
    la   $s3, CURRENT_PIECE_Y
    lw   $a2, 0($s3)

    # Find the pointer to the current shape data and put in $a0
    sll  $t0, $s0, 2
    la   $t1, MASTER_SHAPE_TABLE
    add  $t1, $t1, $t0
    lw   $t1, 0($t1)
    sll  $t0, $s1, 2
    add  $a0, $t1, $t0
    lw   $a0, 0($a0)

    # --- Check for 'w' (rotate) ---
    li   $t0, 0x77
    bne  $t5, $t0, check_a

    # Calculate next orientation: (current + 1) % 4
    addi $s4, $s1, 1
    li   $t0, 4
    rem  $s4, $s4, $t0 # $s4 = next_orientation

    # Get the shape data for the NEXT orientation
    sll  $t0, $s0, 2
    la   $t1, MASTER_SHAPE_TABLE
    add  $t1, $t1, $t0
    lw   $t1, 0($t1)
    sll  $t0, $s4, 2
    add  $a0, $t1, $t0
    lw   $a0, 0($a0) # $a0 now points to the shape data for the ROTATED piece

    # Check for collision with the rotated shape
    jal  check_collision
    bne  $v0, $zero, input_done      # If collision, do nothing
    
    # No collision, so update the orientation
    la   $t0, CURRENT_PIECE_ORIENTATION
    sw   $s4, 0($t0)
    j    input_done

check_a:
    li   $t0, 0x61
    bne  $t5, $t0, check_d
    addi $a1, $a1, -1
    jal  check_collision
    bne  $v0, $zero, input_done
    sw   $a1, 0($s2)
    j    input_done

check_d:
    li   $t0, 0x64
    bne  $t5, $t0, check_s
    addi $a1, $a1, 1
    jal  check_collision
    bne  $v0, $zero, input_done
    sw   $a1, 0($s2)
    j    input_done

check_s:
    li   $t0, 0x73
    bne  $t5, $t0, check_q
    move $s4, $a2 # Save original Y
    addi $a2, $a2, 1
    jal  check_collision
    bne  $v0, $zero, land_piece
    sw   $a2, 0($s3)
    j    input_done

land_piece:
    move $a2, $s4 # Restore original Y
    jal  freeze_piece
    jal  check_and_clear_lines
    jal  spawn_new_piece
    j    input_done
    
check_q:
    li   $t0, 0x71
    bne  $t5, $t0, input_done
    jal  exit_game

input_done:
    # --- Epilogue ---
    lw   $s4, 0($sp)
    lw   $s3, 4($sp)
    lw   $s2, 8($sp)
    lw   $s1, 12($sp)
    lw   $s0, 16($sp)
    lw   $ra, 20($sp)
    addi $sp, $sp, 24
    jr   $ra

#-----------------------------------------------------------------------------
# --- NEW ---
# apply_gravity: Automatically moves the piece down every second based on
#                the system clock.
#-----------------------------------------------------------------------------
apply_gravity:
    # --- Prologue: Save registers we will modify ---
    addi $sp, $sp, -28
    sw   $ra, 24($sp)
    sw   $s0, 20($sp)
    sw   $s1, 16($sp)
    sw   $s2, 12($sp)
    sw   $s3, 8($sp)
    sw   $s4, 4($sp)
    sw   $a0, 0($sp) # Save $a0 because the time syscall overwrites it

    # --- Check if one second has passed since the last drop ---
    li   $v0, 30         # Syscall 30: System Time
    syscall              # Get current time in $a0
    move $s0, $a0        # $s0 = current_time

    la   $t0, LAST_GRAVITY_TIME
    lw   $s1, 0($t0)     # $s1 = last_gravity_time

    la   $t0, GRAVITY_INTERVAL
    lw   $s2, 0($t0)     # $s2 = interval (1000)

    sub  $t0, $s0, $s1   # elapsed_time = current_time - last_gravity_time
    blt  $t0, $s2, gravity_exit # If elapsed time < interval, do nothing and exit

    # --- Time to move down! Update the timer first ---
    la   $t0, LAST_GRAVITY_TIME
    sw   $s0, 0($t0)     # last_gravity_time = current_time

    # --- Load current piece state (similar to handle_input) ---
    la   $s0, CURRENT_PIECE_TYPE
    lw   $s0, 0($s0)
    la   $s1, CURRENT_PIECE_ORIENTATION
    lw   $s1, 0($s1)
    la   $s2, CURRENT_PIECE_X
    lw   $a1, 0($s2)     # $a1 = current X
    la   $s3, CURRENT_PIECE_Y
    lw   $a2, 0($s3)     # $a2 = current Y

    # Get the pointer to the current shape data for collision check
    sll  $t0, $s0, 2
    la   $t1, MASTER_SHAPE_TABLE
    add  $t1, $t1, $t0
    lw   $t1, 0($t1)
    sll  $t0, $s1, 2
    add  $a0, $t1, $t0
    lw   $a0, 0($a0) # $a0 has the shape pointer

    # --- Logic to move down one step (adapted from handle_input's 's' key) ---
    move $s4, $a2          # Save original Y position in $s4
    addi $a2, $a2, 1       # Tentative new Y = current Y + 1
    
    jal  check_collision   # Check for collision at (X, new Y) with shape in $a0
    
    bne  $v0, $zero, gravity_lands_piece # If collision ($v0=1), branch to land it
    
    # No collision, so just update the Y coordinate
    sw   $a2, 0($s3)
    j    gravity_exit      # And we're done for this tick

gravity_lands_piece:
    # The piece collided with something below, so it needs to land.
    # The arguments for freeze_piece need to be (shape_ptr, X, original_Y)
    # $a0 (shape ptr) and $a1 (X) are already correct.
    # We need to use the original Y coordinate from before the downward move attempt.
    move $a2, $s4          # Restore original Y for freezing
    jal  freeze_piece
    jal  check_and_clear_lines
    jal  spawn_new_piece

gravity_exit:
    # --- Epilogue: Restore saved registers ---
    lw   $a0, 0($sp)
    lw   $s4, 4($sp)
    lw   $s3, 8($sp)
    lw   $s2, 12($sp)
    lw   $s1, 16($sp)
    lw   $s0, 20($sp)
    lw   $ra, 24($sp)
    addi $sp, $sp, 28
    jr   $ra

#-----------------------------------------------------------------------------
# initialize_playfield: Clears the virtual game board by filling it with zeros.
#-----------------------------------------------------------------------------
initialize_playfield:
    # --- Prologue: Save registers ---
    addi $sp, $sp, -4
    sw   $s0, 0($sp)

    la   $s0, PLAYFIELD      # $s0 = starting address of the playfield array
    li   $t0, 512            # $t0 = total number of cells to clear (16 * 32)
    li   $t1, 0              # The value to store (0 for empty)

init_loop:
    sw   $t1, 0($s0)         # Store 0 in the current cell
    addi $s0, $s0, 4        # Move to the next word in the array
    addi $t0, $t0, -1       # Decrement counter
    bne  $t0, $zero, init_loop # Loop until all cells are cleared

    # --- Epilogue: Restore registers ---
    lw   $s0, 0($sp)
    addi $sp, $sp, 4
    jr   $ra


#-----------------------------------------------------------------------------
# spawn_new_piece: Randomly selects a new tetromino and resets its state.
#                  Also checks for game over (if spawn position is blocked).
#-----------------------------------------------------------------------------
spawn_new_piece:
    # --- Prologue ---
    addi $sp, $sp, -20
    sw   $ra, 16($sp)
    sw   $a0, 12($sp)  # Save input registers
    sw   $a1, 8($sp)
    sw   $a2, 4($sp)
    sw   $v0, 0($sp)

    # --- Get a random piece TYPE (0-6) ---
    li   $v0, 42          # Random syscall
    li   $a0, 0
    li   $a1, 7
    syscall               # $a0 = 0 to 6

    # Store the new piece type
    la   $t3, CURRENT_PIECE_TYPE
    sw   $a0, 0($t3)

    # --- Use the random type to get the color ---
    move $t0, $a0
    sll  $t0, $t0, 2
    la   $t1, ALL_COLORS_TABLE
    add  $t1, $t1, $t0
    lw   $t1, 0($t1)
    lw   $t2, 0($t1)
    la   $t3, CURRENT_PIECE_COLOR
    sw   $t2, 0($t3)

    # --- Reset position and orientation ---
    li   $t0, 10                      # Starting X position
    la   $t1, CURRENT_PIECE_X
    sw   $t0, 0($t1)

    li   $t0, 1                       # Starting Y position
    la   $t1, CURRENT_PIECE_Y
    sw   $t0, 0($t1)

    li   $t0, 0                       # Initial orientation
    la   $t1, CURRENT_PIECE_ORIENTATION
    sw   $t0, 0($t1)

    # --- Check for Collision Immediately After Spawn (Game Over Check) ---
    # Get shape pointer for orientation 0
    la   $t0, CURRENT_PIECE_TYPE
    lw   $t0, 0($t0)
    sll  $t0, $t0, 2
    la   $t1, MASTER_SHAPE_TABLE
    add  $t1, $t1, $t0
    lw   $t1, 0($t1)        # $t1 points to orientation array
    lw   $a0, 0($t1)        # $a0 = pointer to orientation 0 shape

    # Load X and Y position
    la   $t2, CURRENT_PIECE_X
    lw   $a1, 0($t2)
    la   $t2, CURRENT_PIECE_Y
    lw   $a2, 0($t2)

    # Call collision check
    jal  check_collision    # Returns 1 in $v0 if blocked

    beq  $v0, $zero, spawn_ok    # If no collision, proceed

    # --- Game Over Logic ---
    jal  update_high_score       # Optional: Save high score
    li   $t0, 1
    la   $t1, GAME_OVER_FLAG
    sw   $t0, 0($t1)             # GAME_OVER_FLAG = 1
    j    spawn_done

spawn_ok:
    # Normal continuation if no collision

spawn_done:
    # --- Epilogue ---
    lw   $v0, 0($sp)
    lw   $a2, 4($sp)
    lw   $a1, 8($sp)
    lw   $a0, 12($sp)
    lw   $ra, 16($sp)
    addi $sp, $sp, 20
    jr   $ra


#-----------------------------------------------------------------------------
# check_collision: Checks if a piece at a given location would collide with
#                  walls, the floor, or frozen pieces in the playfield.
# Arguments:
#   $a0 - Pointer to the piece's shape data
#   $a1 - The potential X coordinate to check
#   $a2 - The potential Y coordinate to check
# Returns:
#   $v0 - 1 if there is a collision, 0 otherwise.
#-----------------------------------------------------------------------------
check_collision:
    # --- Prologue: Save registers ---
    addi $sp, $sp, -20
    sw   $ra, 16($sp)
    sw   $s0, 12($sp)
    sw   $s1, 8($sp)
    sw   $s2, 4($sp)
    sw   $s3, 0($sp)

    li   $t2, 4              # Counter for the 4 blocks of the piece
    move $t7, $a0             # Use a temporary copy of the shape pointer

collision_check_loop:
    lw   $t3, 0($t7)           # rel_x
    lw   $t4, 4($t7)           # rel_y

    # Compute the absolute (x,y) of the block in the playfield
    add  $s0, $a1, $t3         # abs_x = piece_x + rel_x
    add  $s1, $a2, $t4         # abs_y = piece_y + rel_y

    # --- CHECK 1: Wall Collision ---
    # Check if abs_x is out of bounds ( < 0 or >= 16)
    blt  $s0, $zero, collision_found # if (abs_x < 0) -> collision
    li   $t0, 16
    bge  $s0, $t0, collision_found   # if (abs_x >= 16) -> collision
    
    # --- CHECK 2: Floor Collision ---
    # Check if abs_y is out of bounds ( >= 31)
    li   $t0, 31
    bge  $s1, $t0, collision_found   # if (abs_y >= 31) -> collision
    
    # --- CHECK 3: Playfield Collision ---
    # Calculate the index in the PLAYFIELD array: index = y * 16 + x
    li   $s2, 16
    mul  $s2, $s1, $s2         # y * 16
    add  $s2, $s2, $s0         # (y * 16) + x
    sll  $s2, $s2, 2           # Convert from word index to byte offset
    
    la   $s3, PLAYFIELD
    add  $s3, $s3, $s2         # $s3 = address of the cell in the playfield
    
    lw   $t0, 0($s3)           # Load the value from the playfield cell
    beq  $t0, 1, collision_found   # If the cell is 1, it's occupied -> collision

    # --- Continue to the next block ---
    addi $t7, $t7, 8           # Move to the next coordinate pair in shape data
    addi $t2, $t2, -1          # Decrement block counter
    bne  $t2, $zero, collision_check_loop

    # If we get here, all 4 blocks are in a valid position
    li   $v0, 0                # Return 0 (no collision)
    j    collision_check_done

collision_found:
    li   $v0, 1                # Return 1 (collision)

collision_check_done:
    # --- Epilogue: Restore registers ---
    lw   $s3, 0($sp)
    lw   $s2, 4($sp)
    lw   $s1, 8($sp)
    lw   $s0, 12($sp)
    lw   $ra, 16($sp)
    addi $sp, $sp, 20
    jr   $ra

#-----------------------------------------------------------------------------
# freeze_piece: Marks the current piece's position as occupied in the PLAYFIELD array.
# Arguments:
#   $a0 - Pointer to the piece's shape data
#   $a1 - The final X coordinate of the piece
#   $a2 - The final Y coordinate of the piece
#-----------------------------------------------------------------------------
freeze_piece:
    # --- Prologue: Save registers ---
    addi $sp, $sp, -16
    sw   $ra, 12($sp)
    sw   $s0, 8($sp)
    sw   $s1, 4($sp)
    sw   $s2, 0($sp)

    li   $t2, 4              # Counter for the 4 blocks of the piece
    move $t7, $a0             # Use a temporary copy of the shape pointer

freeze_loop:
    lw   $t3, 0($t7)           # rel_x
    lw   $t4, 4($t7)           # rel_y

    # Compute the absolute (x,y) of the block in the playfield
    add  $s0, $a1, $t3         # abs_x = piece_x + rel_x
    add  $s1, $a2, $t4         # abs_y = piece_y + rel_y

    # Calculate the index in the PLAYFIELD array: index = y * 16 + x
    li   $s2, 16
    mul  $s2, $s1, $s2
    add  $s2, $s2, $s0
    sll  $s2, $s2, 2

    la   $t0, PLAYFIELD
    add  $t0, $t0, $s2         # $t0 = address of the cell in the playfield
    
    # Mark the cell as occupied by storing a 1
    li   $t1, 1
    sw   $t1, 0($t0)

    # --- Continue to the next block ---
    addi $t7, $t7, 8
    addi $t2, $t2, -1
    bne  $t2, $zero, freeze_loop

    # --- Epilogue: Restore registers ---
    lw   $s2, 0($sp)
    lw   $s1, 4($sp)
    lw   $s0, 8($sp)
    lw   $ra, 12($sp)
    addi $sp, $sp, 16
    jr   $ra

#-----------------------------------------------------------------------------
# shift_rows_down: Shifts all rows above a cleared line down by one.
# Arguments:
#   $a0 - The Y-coordinate of the line that was cleared.
#-----------------------------------------------------------------------------
shift_rows_down:
    # --- Prologue: Save registers ---
    addi $sp, $sp, -12
    sw   $s0, 8($sp)
    sw   $s1, 4($sp)
    sw   $s2, 0($sp)

    move $s0, $a0            # $s0 = y_cleared

shift_outer_loop: # Loop through rows from y_cleared down to 1
    li   $s1, 0              # x = 0

shift_inner_loop: # Loop through each column in the row
    # Calculate address of the cell ABOVE: PLAYFIELD[y-1][x]
    move $t0, $s0            # y
    addi $t0, $t0, -1        # y - 1
    li   $t1, 16
    mul  $t0, $t0, $t1
    add  $t0, $t0, $s1       # index = (y-1) * 16 + x
    sll  $t0, $t0, 2
    la   $t2, PLAYFIELD
    add  $t2, $t2, $t0       # Address of PLAYFIELD[y-1][x]
    lw   $t3, 0($t2)         # $t3 = value from the cell above

    # Calculate address of the CURRENT cell: PLAYFIELD[y][x]
    move $t0, $s0
    li   $t1, 16
    mul  $t0, $t0, $t1
    add  $t0, $t0, $s1       # index = y * 16 + x
    sll  $t0, $t0, 2
    la   $t2, PLAYFIELD
    add  $t2, $t2, $t0       # Address of PLAYFIELD[y][x]

    # Copy the value from the cell above into the current cell
    sw   $t3, 0($t2)

    addi $s1, $s1, 1
    blt  $s1, 16, shift_inner_loop # Continue until row is copied

    addi $s0, $s0, -1
    bgt  $s0, $zero, shift_outer_loop # Continue until all rows above are shifted

    # --- NEW: Clear row 0 after shifting ---
    li   $s1, 0              # x = 0
clear_row0_loop:
    li   $t0, 0              # value = 0
    # address of PLAYFIELD[0][x]
    move $t2, $zero          # y = 0
    li   $t3, 16
    mul  $t2, $t2, $t3       # 0 * 16
    add  $t2, $t2, $s1       # x
    sll  $t2, $t2, 2
    la   $t3, PLAYFIELD
    add  $t3, $t3, $t2
    sw   $t0, 0($t3)
    addi $s1, $s1, 1
    blt  $s1, 16, clear_row0_loop

    # --- Epilogue: Restore registers ---
    lw   $s2, 0($sp)
    lw   $s1, 4($sp)
    lw   $s0, 8($sp)
    addi $sp, $sp, 12
    jr   $ra


## MODIFIED: check_and_clear_lines
check_and_clear_lines:
    # --- Prologue: Save registers ---
    addi $sp, $sp, -16
    sw   $ra, 12($sp)
    sw   $s0, 8($sp)
    sw   $s1, 4($sp)
    sw   $t0, 0($sp)

    li   $s0, 30             # Start scanning from the second to last row (y=30)

check_row_loop:
    bge  $s0, $zero, continue_check_row_loop # Ensure we don't check negative rows
    j    check_lines_done                   # Exit if we've gone past the top

continue_check_row_loop:
    li   $s1, 0              # x = 0
    li   $t0, 1              # is_full_line = true (1)

check_col_loop:
    move $t1, $s0
    li   $t2, 16
    mul  $t1, $t1, $t2
    add  $t1, $t1, $s1
    sll  $t1, $t1, 2
    la   $t2, PLAYFIELD
    add  $t2, $t2, $t1
    lw   $t3, 0($t2)
    beq  $t3, $zero, line_not_full
    addi $s1, $s1, 1
    blt  $s1, 16, check_col_loop

line_is_full:
    # --- Add point to score ---
    la   $t0, SCORE
    lw   $t1, 0($t0)
    addi $t1, $t1, 1
    sw   $t1, 0($t0)

    # --- Increment lines cleared and adjust speed ---
    la   $t0, LINES_CLEARED
    lw   $t1, 0($t0)
    addi $t1, $t1, 1
    sw   $t1, 0($t0)
    jal  update_speed

    ## --- NEW: Handle clearing row 0 as a special case ---
    bne  $s0, $zero, shift_normally # If y is not 0, shift normally
    # This is row 0, so we just clear it
    jal  clear_top_row
    j    line_not_full # After clearing row 0, continue scan from row -1 (which will exit)

shift_normally:
    # --- Shift rows down ---
    move $a0, $s0
    jal  shift_rows_down
    # Re-check the same row index since it now has new blocks
    addi $s0, $s0, 1

line_not_full:
    addi $s0, $s0, -1
    j    check_row_loop

check_lines_done:
    # --- Epilogue: Restore registers ---
    lw   $t0, 0($sp)
    lw   $s1, 4($sp)
    lw   $s0, 8($sp)
    lw   $ra, 12($sp)
    addi $sp, $sp, 16
    jr   $ra


#-----------------------------------------------------------------------------
# draw_digit: Draws a single 3x5 digit at a given screen location.
#-----------------------------------------------------------------------------
draw_digit:
    # --- Prologue ---
    addi $sp, $sp, -16
    sw   $ra, 12($sp)
    sw   $s0, 8($sp)
    sw   $s1, 4($sp)
    sw   $s2, 0($sp)

    # Get the pointer to the correct font data
    sll  $t0, $a0, 2
    la   $t1, FONT_TABLE
    add  $t1, $t1, $t0
    lw   $s0, 0($t1)      # $s0 = pointer to the font data for this digit

    li   $s1, 0           # Row index (y_offset), from 0 to 4

digit_row_loop:
    lw   $t0, 0($s0)      # $t0 = pixel data for the current row
    li   $s2, 2           # Column index starts at 2 (right)

digit_col_loop:
    andi $t1, $t0, 1      # Check the rightmost bit of the row data
    beq  $t1, $zero, skip_pixel

    # This bit is a 1, so we need to draw it.
    # Calculate screen coordinates for this pixel
    add  $t1, $a1, $s2    # screen_x = base_x + col_index
    add  $t2, $a2, $s1    # screen_y = base_y + row_index

    # Calculate final memory address
    li   $t3, 32
    mul  $t3, $t2, $t3
    add  $t3, $t3, $t1
    sll  $t3, $t3, 2
    la   $t4, ADDR_DSPL
    lw   $t4, 0($t4)
    add  $t4, $t4, $t3
    la   $t5, COLOR_TEXT_ORANGE
    lw   $t5, 0($t5)
    sw   $t5, 0($t4)

skip_pixel:
    srl  $t0, $t0, 1      # Move to the next bit (pixel) in the row data
    addi $s2, $s2, -1     # Decrement column index (move left)
    bge  $s2, $zero, digit_col_loop # Loop while column is >= 0

    addi $s0, $s0, 4      # Move to the next row of font data
    addi $s1, $s1, 1      # row_index++
    blt  $s1, 5, digit_row_loop

    # --- Epilogue ---
    lw   $s2, 0($sp)
    lw   $s1, 4($sp)
    lw   $s0, 8($sp)
    lw   $ra, 12($sp)
    addi $sp, $sp, 16
    jr   $ra

#-----------------------------------------------------------------------------
# draw_score: Displays the current score in the side panel.
# This is a robust version that handles scores of any length.
#-----------------------------------------------------------------------------
## REPLACE ENTIRE FUNCTION
draw_score:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    la   $t0, SCORE
    lw   $a0, 0($t0)        # value
    li   $a1, 21            # panel left
    li   $a2, 10            # panel width
    li   $a3, 24            # vertically centered
    jal  draw_number_centered

    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra


extract_and_draw:
    li   $t0, 10          # Must be reset before each division
    divu $s0, $t0         # Divide score by 10
    mflo $s0              # New score = quotient
    mfhi $a0              # Digit to draw = remainder

    move $a1, $s1         # X position
    move $a2, $s2         # Y position
    jal  draw_digit       # Draw the digit

    addi $s1, $s1, -4     # Move left for the next digit

    bne  $s0, $zero, extract_and_draw

draw_score_cleanup:
    # --- Epilogue ---
    lw   $s2, 0($sp)
    lw   $s1, 4($sp)
    lw   $s0, 8($sp)
    lw   $ra, 12($sp)
    addi $sp, $sp, 16
    jr   $ra


#-----------------------------------------------------------------------------
# update_speed: Checks if the game should level up and increases gravity.
#-----------------------------------------------------------------------------
update_speed:
    # --- Prologue ---
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    # --- Load required values ---
    la   $t0, LINES_CLEARED
    lw   $t0, 0($t0)      # $t0 = total lines cleared

    la   $t1, LINES_PER_LEVEL
    lw   $t1, 0($t1)      # $t1 = lines needed to level up (e.g., 5)

    # Check if LINES_CLEARED is 0 (can't divide by zero)
    beq  $t0, $zero, update_speed_exit

    # Check if LINES_CLEARED % LINES_PER_LEVEL == 0
    rem  $t2, $t0, $t1    # $t2 = remainder
    bne  $t2, $zero, update_speed_exit # If not a multiple, don't speed up

    # --- It's time to speed up! ---
    la   $t3, GRAVITY_INTERVAL
    lw   $t4, 0($t3)      # $t4 = current gravity interval

    la   $t5, MIN_GRAVITY
    lw   $t5, 0($t5)      # $t5 = minimum gravity interval

    # Don't speed up if already at max speed
    ble  $t4, $t5, update_speed_exit

    # Decrease the interval (e.g., subtract 100ms)
    addi $t4, $t4, -300
    sw   $t4, 0($t3)      # Store the new, faster interval

update_speed_exit:
    # --- Epilogue ---
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra


## NEW: game_over_loop
# A separate loop that runs when the game is over. It displays the
# game over screen and waits for the player to press 'r' to retry or 'q' to quit.
game_over_loop:
    # Display the "GAME OVER" screen text
    jal draw_game_over_screen

    # Check for keyboard input
    la   $k0, ADDR_KBRD
    lw   $k0, 0($k0)
    lw   $k1, 0($k0)
    beq  $k1, $zero, wait_for_input # If no key pressed, wait

    lw   $t5, 4($k0) # Read the key press

    # Check for 'r' (retry)
    li   $t0, 0x72 # ASCII for 'r'
    beq  $t5, $t0, do_restart

    # Check for 'q' (quit)
    li   $t0, 0x71 # ASCII for 'q'
    beq  $t5, $t0, exit_game

    # If another key is pressed, just keep looping
    j    wait_for_input

wait_for_input:
    # --- NEW: Add small delay to avoid CPU spinning ---
    li   $v0, 32
    li   $a0, 80
    syscall
    j    game_over_loop

do_restart:
    jal restart_game
    j game_loop # Jump back to the main game loop to start again

## NEW: restart_game
# Resets all game state variables to their initial values for a new game.
restart_game:
    # --- Prologue ---
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    # Reset score and lines
    li   $t0, 0
    la   $t1, SCORE
    sw   $t0, 0($t1)
    la   $t1, LINES_CLEARED
    sw   $t0, 0($t1)

    # Reset gravity interval
    li   $t0, 1000
    la   $t1, GRAVITY_INTERVAL
    sw   $t0, 0($t1)

    # Reset the gravity timer (prevents instant drop on restart)
    li   $v0, 30
    syscall
    la   $t0, LAST_GRAVITY_TIME
    sw   $a0, 0($t0)

    # Reset the game over flag
    li   $t0, 0
    la   $t1, GAME_OVER_FLAG
    sw   $t0, 0($t1)

    # Clear the playfield
    jal initialize_playfield

    # --- Epilogue ---
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra

## NEW: update_high_score
# Compares the final score with the high score and updates if it's greater.
update_high_score:
    la   $t0, SCORE
    lw   $s0, 0($t0) # $s0 = current score

    la   $t1, HIGH_SCORE
    lw   $s1, 0($t1) # $s1 = current high score

    bgt  $s0, $s1, new_high_score # if (score > high_score)
    jr   $ra                     # Otherwise, just return

new_high_score:
    sw   $s0, 0($t1) # Update HIGH_SCORE with the new score
    jr   $ra

## NEW: draw_high_score
# Displays the "HI" text and the high score value in the top right panel.

## REPLACE ENTIRE FUNCTION
## REPLACE ENTIRE FUNCTION
draw_high_score:
    addi $sp, $sp, -12
    sw   $ra, 8($sp)
    sw   $s0, 4($sp)
    sw   $s1, 0($sp)

    # "HI" centered in 10-wide panel: label width=8 -> x = 21 + (10-8)/2 = 22
    la   $a0, HI_TEXT
    li   $a1, 22            # x
    li   $a2, 2             # y
    jal  draw_string

    # value on next line, centered
    la   $t0, HIGH_SCORE
    lw   $a0, 0($t0)        # value
    li   $a1, 21            # panel left
    li   $a2, 10            # panel width
    li   $a3, 8             # y = 2 + 6 (5px high + 1px gap)
    jal  draw_number_centered

    lw   $s1, 0($sp)
    lw   $s0, 4($sp)
    lw   $ra, 8($sp)
    addi $sp, $sp, 12
    jr   $ra




####


draw_game_over_screen:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    # Redraw background
    jal  draw_scene

    # Keep panels stable during game over
    jal  draw_score
    jal  draw_high_score

    # --- Centered text with 6-row spacing ---
    # Choose a base so all 4 lines fit: 8,14,20,26 (each line is 5px tall)
    # "GAME" width = 4 chars * 4 stride = 16 -> center x = (32-16)/2 = 8
    la   $a0, GAME_TEXT
    li   $a1, 8       # x
    li   $a2, 8       # y
    jal  draw_string

    la   $a0, OVER_TEXT
    li   $a1, 8       # x
    li   $a2, 14      # y = 8 + 6
    jal  draw_string

    # "RETRY" width = 5*4 = 20 -> center x = 6
    la   $a0, RETRY_ONLY_TEXT
    li   $a1, 6
    li   $a2, 20      # y = 14 + 6
    jal  draw_string

    # "(R)" width = 3*4 = 12 -> center x = 10
    la   $a0, R_PARENS_TEXT
    li   $a1, 10
    li   $a2, 26      # y = 20 + 6
    jal  draw_string

    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra



## NEW: draw_string
# Draws a null-terminated string at a given screen location.
# Arguments:
#   $a0 - Address of the null-terminated string
#   $a1 - Starting X coordinate (in units)
#   $a2 - Starting Y coordinate (in units)
draw_string:
    # --- Prologue ---
    addi $sp, $sp, -16
    sw   $ra, 12($sp)
    sw   $s0, 8($sp) # String address
    sw   $s1, 4($sp) # Current X
    sw   $s2, 0($sp) # Current Y

    move $s0, $a0
    move $s1, $a1
    move $s2, $a2

draw_string_loop:
    lb   $a0, 0($s0) # Load character
    beq  $a0, $zero, draw_string_done # If null terminator, we're done

    # Prepare arguments for draw_char
    # $a0 already has the character
    move $a1, $s1
    move $a2, $s2
    jal  draw_char

    addi $s1, $s1, 4  # Move X position right for the next character (3px wide + 1px space)
    addi $s0, $s0, 1  # Move to next char in string
    j    draw_string_loop

draw_string_done:
    # --- Epilogue ---
    lw   $s2, 0($sp)
    lw   $s1, 4($sp)
    lw   $s0, 8($sp)
    lw   $ra, 12($sp)
    addi $sp, $sp, 16
    jr   $ra

## FIXED: draw_char
# Draws a single character. This is a helper for draw_string.
# It uses a big if-else chain to find the right font data.
# Arguments:
#   $a0 - The ASCII character to draw
#   $a1 - X coordinate
#   $a2 - Y coordinate

## REPLACEMENT FUNCTION: draw_char
draw_char:
    # Save original X/Y
    addi $sp, $sp, -8
    sw   $a1, 4($sp)
    sw   $a2, 0($sp)

    move $t6, $a0           # keep ASCII char for comparisons
    la   $a0, FONT_SPACE    # default font (space)

    # Map ASCII to font pointer (compare against $t6)
    li   $t0, 'A'
    beq  $t6, $t0, char_is_A
    li   $t0, 'E'
    beq  $t6, $t0, char_is_E
    li   $t0, 'G'
    beq  $t6, $t0, char_is_G
    li   $t0, 'H'
    beq  $t6, $t0, char_is_H
    li   $t0, 'I'
    beq  $t6, $t0, char_is_I
    li   $t0, 'M'
    beq  $t6, $t0, char_is_M
    li   $t0, 'O'
    beq  $t6, $t0, char_is_O
    li   $t0, 'R'
    beq  $t6, $t0, char_is_R
    li   $t0, 'T'
    beq  $t6, $t0, char_is_T
    li   $t0, 'V'
    beq  $t6, $t0, char_is_V
    li   $t0, 'Y'
    beq  $t6, $t0, char_is_Y
    li   $t0, '('
    beq  $t6, $t0, char_is_LParen
    li   $t0, ')'
    beq  $t6, $t0, char_is_RParen
    li   $t0, ' '
    beq  $t6, $t0, char_is_Space
    j    draw_char_found_font

char_is_A:
    la   $a0, FONT_A
    j    draw_char_found_font
char_is_E:
    la   $a0, FONT_E
    j    draw_char_found_font
char_is_G:
    la   $a0, FONT_G
    j    draw_char_found_font
char_is_H:
    la   $a0, FONT_H
    j    draw_char_found_font
char_is_I:
    la   $a0, FONT_I
    j    draw_char_found_font
char_is_M:
    la   $a0, FONT_M
    j    draw_char_found_font
char_is_O:
    la   $a0, FONT_O
    j    draw_char_found_font
char_is_R:
    la   $a0, FONT_R
    j    draw_char_found_font
char_is_T:
    la   $a0, FONT_T
    j    draw_char_found_font
char_is_V:
    la   $a0, FONT_V
    j    draw_char_found_font
char_is_Y:
    la   $a0, FONT_Y
    j    draw_char_found_font
char_is_LParen:
    la   $a0, FONT_L_PAREN
    j    draw_char_found_font
char_is_RParen:
    la   $a0, FONT_R_PAREN
    j    draw_char_found_font
char_is_Space:
    la   $a0, FONT_SPACE
    j    draw_char_found_font

draw_char_found_font:
    move $t0, $a0
    lw   $a1, 4($sp)       # restore X
    lw   $a2, 0($sp)       # restore Y

    # Inline draw loop with COLOR_TEXT_ORANGE
    addi $sp, $sp, -16
    sw   $ra, 12($sp)
    sw   $s0, 8($sp)
    sw   $s1, 4($sp)
    sw   $s2, 0($sp)

    move $s0, $t0
    li   $s1, 0

char_row_loop:
    lw   $t0, 0($s0)
    li   $s2, 2

char_col_loop:
    andi $t1, $t0, 1
    beq  $t1, $zero, char_skip
    add  $t1, $a1, $s2
    add  $t2, $a2, $s1
    li   $t3, 32
    mul  $t3, $t2, $t3
    add  $t3, $t3, $t1
    sll  $t3, $t3, 2
    la   $t4, ADDR_DSPL
    lw   $t4, 0($t4)
    add  $t4, $t4, $t3
    la   $t5, COLOR_TEXT_ORANGE
    lw   $t5, 0($t5)
    sw   $t5, 0($t4)

char_skip:
    srl  $t0, $t0, 1
    addi $s2, $s2, -1
    bge  $s2, $zero, char_col_loop
    addi $s0, $s0, 4
    addi $s1, $s1, 1
    blt  $s1, 5, char_row_loop

    # Epilogue
    lw   $s2, 0($sp)
    lw   $s1, 4($sp)
    lw   $s0, 8($sp)
    lw   $ra, 12($sp)
    addi $sp, $sp, 16

    addi $sp, $sp, 8
    jr   $ra

    
## NEW: clear_top_row
# Manually clears the top row (y=0) of the playfield. This is a special
# case because there are no rows above it to shift down.
clear_top_row:
    la   $s0, PLAYFIELD  # $s0 = starting address of the playfield
    li   $t0, 16         # $t0 = 16 cells to clear
    li   $t1, 0          # The value to store (0 for empty)

clear_top_row_loop:
    sw   $t1, 0($s0)     # Store 0 in the current cell
    addi $s0, $s0, 4     # Move to the next word in the array
    addi $t0, $t0, -1    # Decrement counter
    bne  $t0, $zero, clear_top_row_loop # Loop until all 16 cells are cleared

    jr   $ra   


# a0 = nonnegative value
# v0 = digit count (1 if value==0)
count_digits:
    addi $sp, $sp, -8
    sw   $ra, 4($sp)
    sw   $a0, 0($sp)

    bne  $a0, $zero, cd_loop_prep
    li   $v0, 1
    j    cd_done
cd_loop_prep:
    li   $v0, 0
cd_loop:
    addi $v0, $v0, 1
    li   $t0, 10
    divu $a0, $t0
    mflo $a0
    bne  $a0, $zero, cd_loop

cd_done:
    lw   $a0, 0($sp)
    lw   $ra, 4($sp)
    addi $sp, $sp, 8
    jr   $ra

# Draw number centered in a panel.
# a0=value, a1=panel_left_x, a2=panel_width, a3=y
draw_number_centered:
    addi $sp, $sp, -24
    sw   $ra, 20($sp)
    sw   $s0, 16($sp)   # value
    sw   $s1, 12($sp)   # left
    sw   $s2, 8($sp)    # width
    sw   $s3, 4($sp)    # y
    sw   $s4, 0($sp)    # digit count

    move $s0, $a0
    move $s1, $a1
    move $s2, $a2
    move $s3, $a3

    move $a0, $s0
    jal  count_digits
    move $s4, $v0               # digits

    # W = 4*digits - 1  (each digit is 3 wide + 1 space, except last)
    li   $t0, 4
    mul  $t0, $t0, $s4
    addi $t0, $t0, -1           # t0 = W

    # leftmost_x = left + ((panel_width - W)/2)
    sub  $t1, $s2, $t0
    sra  $t1, $t1, 1
    add  $t1, $s1, $t1          # t1 = leftmost_x

    # rightmost digit's left x = leftmost_x + 4*(digits-1)
    addi $t2, $s4, -1
    li   $t3, 4
    mul  $t2, $t2, $t3
    add  $s1, $t1, $t2          # s1 = current x (rightmost digit pos)

    # Draw right-to-left
    bne  $s0, $zero, dnc_loop
    li   $a0, 0                 # special case value==0
    move $a1, $s1
    move $a2, $s3
    jal  draw_digit
    j    dnc_done

dnc_loop:
    li   $t3, 10
    divu $s0, $t3
    mfhi $a0                    # remainder = digit
    mflo $s0                    # quotient
    move $a1, $s1
    move $a2, $s3
    jal  draw_digit
    addi $s1, $s1, -4
    bne  $s0, $zero, dnc_loop

dnc_done:
    lw   $s4, 0($sp)
    lw   $s3, 4($sp)
    lw   $s2, 8($sp)
    lw   $s1, 12($sp)
    lw   $s0, 16($sp)
    lw   $ra, 20($sp)
    addi $sp, $sp, 24
    jr   $ra


#-----------------------------------------------------------------------------
# exit_game: Terminates the program.
#-----------------------------------------------------------------------------
exit_game:
    li   $v0, 10                 # Service 10 is "exit"
    syscall