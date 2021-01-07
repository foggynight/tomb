/**
 * block.h - v0.0.0
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#ifndef BLOCK_H_
#define BLOCK_H_

#include "tile.h"

#define BLOCK_HEIGHT 8 // Height of each block in cells
#define BLOCK_WIDTH  8 // Width of each block in cells

/**
 * block_t: Block type containing pointers to neighboring blocks and an
 *          array of tiles representing tiles in the game world.
 * @member neighbors Struct of pointers to neighboring blocks
 * @member tile_arr  Array of tiles, sized: BLOCK_HEIGHT*BLOCK_WIDTH
 **/
typedef struct block {
    struct {
        struct block *above,
                     *right,
                     *below,
                     *left;
    } neighbors;
    tile_t tile_arr[BLOCK_HEIGHT*BLOCK_WIDTH];
} block_t;

/**
 * block_init: Allocate and initialize a block.
 * @note Zeroes out the members of the block
 * @return Pointer to the new block
 **/
block_t *block_init(void);

/**
 * block_get_tile_index: Get the index of the tile at the position:
 *                       y_pos * BLOCK_WIDTH + x_pos
 * @param y_pos y position component
 * @param x_pos x position component
 * @return Index of the tile at the y-x position
 **/
int block_get_tile_index(int y_pos, int x_pos);

#endif // BLOCK_H_

/**
 * Version History
 * 0.0.0 - 2021-01-03 - First commit
 **/
