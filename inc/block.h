/**
 * block.h - v0.0.0
 *
 * Block type representing a square block of tiles on the game map.
 *
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#ifndef BLOCK_H_
#define BLOCK_H_

#include "tile.h"

#define BLOCK_HEIGHT 8 // Height of each block's tile array
#define BLOCK_WIDTH  8 // Width of each block's tile array

typedef struct block {
    struct {
        struct block *above;
        struct block *right;
        struct block *below;
        struct block *left;
    } neighbors; // struct of pointers to neighboring blocks
    tile_t tile_arr[BLOCK_HEIGHT*BLOCK_WIDTH]; // Array of tiles contained in this block
} block_t;

block_t *block_init(void);

#endif // BLOCK_H_

/**
 * Version History
 * 0.0.0 - 2021-01-03 - First commit
 **/
