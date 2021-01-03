/**
 * block.h - v0.0.0
 *
 * Block type representing a square block of tiles on the game map.
 *
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 */

#ifndef BLOCK_H_
#define BLOCK_H_

#include "tile.h"

#define BLOCK_WIDTH     256 // Width of each block's tile array
#define BLOCK_HEIGHT    256 // Height of each block's tile array
#define NEIGHBOUR_COUNT 8   // Number of neighbours of each block

typedef struct block {
    tile_t tile_arr[BLOCK_WIDTH*BLOCK_HEIGHT];      // Array of tiles contained in this block
    struct block_t *neighbour_arr[NEIGHBOUR_COUNT]; // Array of pointers to neighbouring blocks
} block_t;

#endif // BLOCK_H_

/**
 * Version History
 * 0.0.0 - 2021-01-03 - First commit
 */
