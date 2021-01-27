/**
 * block.h
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
 *
 * @member neighbors  Struct of pointers to neighboring blocks
 * @member entity_arr Array of entities
 * @member tile_arr   Array of tiles
 *
 * @note The game view will always be composed of a single block.
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
 * @return Pointer to the new block
 * @note Block members are initialized to zero
 **/
block_t *block_init(void);

/**
 * block_update: Update a block's tile array based on its entity array.
 * @param block Target block to update
 **/
void block_update(block_t *block);

#endif // BLOCK_H_
