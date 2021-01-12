/**
 * block.h - v0.0.0
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#ifndef BLOCK_H_
#define BLOCK_H_

#include "entity.h"
#include "tile.h"

#define BLOCK_HEIGHT 8 // Height of each block in tiles
#define BLOCK_WIDTH  8 // Width of each block in tiles
#define TILE_COUNT (BLOCK_HEIGHT*BLOCK_WIDTH) // Number of tiles per block
#define MAX_ENTITY_COUNT TILE_COUNT           // Max number of entities per block

/**
 * block_t: Block type containing pointers to neighboring blocks and an
 *          array of tiles representing tiles in the game world.
 * @note The game view will always be composed of a single block.
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
    entity_t entity_arr[MAX_ENTITY_COUNT];
    tile_t tile_arr[TILE_COUNT];
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
 * @param y_pos 'y' position component
 * @param x_pos 'x' position component
 * @return Index of the tile at the 'y-x' position
 **/
int block_get_tile_index(int y_pos, int x_pos);

/**
 * block_update_tile: Update a tile in the tile array of a block.
 * @note This is done by creating a tile and modifying its members, then
 *       passing a pointer to that tile to this function, which copies
 *       its members into the tile at index in the block's tile array.
 * @param block  Block containing the target tile
 * @param index  Index of the target tile
 * @param source Source tile to copy members from
 **/
void block_update_tile(block_t *block, int index, tile_t *source);

#endif // BLOCK_H_

/**
 * Version History
 * 0.0.0 - 2021-01-03 - First commit
 **/
