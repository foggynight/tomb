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
    int color_pair; // ncurses color pair containing fore/back-ground colors
    wchar_t symbol; // Unicode symbol representing the tile on screen
} tile_t;

#endif // TILE_H_

/**
 * Version History
 * 0.0.0 - 2021-01-03 - First commit
 */
