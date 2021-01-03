/**
 * tile.h - v0.0.0
 *
 * Tile type representing an individual tile on the game map.
 *
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 */

#ifndef TILE_H_
#define TILE_H_

#include <stddef.h>

typedef struct tile {
    wchar_t symbol;  // Symbol used to represent the tile on screen
    int colour[2];   // Foreground and background colours of the tile
    int position[2]; // x-y position of the tile in its containing block
} tile_t;

#endif // TILE_H_

/**
 * Version History
 * 0.0.0 - 2021-01-03 - First commit
 */
