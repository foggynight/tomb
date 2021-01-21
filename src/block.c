/**
 * block.c - v0.0.0
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#include <stdlib.h>

#include "block.h"
#include "error.h"

block_t *block_init(void)
{
    block_t *new_block = calloc(1, sizeof(block_t));
    if (!new_block)
        ERROR("block_init: calloc failed");

    return new_block;
}

void block_update(block_t *block)
{

}

/**
 * get_tile_index: Get the index of the tile at the position:
 *                 y_pos * BLOCK_WIDTH + x_pos
 *
 * @param y_pos 'y' position component
 * @param x_pos 'x' position component
 *
 * @return Index of the tile at the 'y-x' position
 **/
static int get_tile_index(int y_pos, int x_pos)
{
    if ((y_pos < 0 || y_pos >= BLOCK_HEIGHT)
     || (x_pos < 0 || x_pos >= BLOCK_WIDTH))
        ERROR("block_get_tile_index: Invalid position");

    return y_pos * BLOCK_WIDTH + x_pos;
}

/**
 * update_tile: Update a tile in the tile array of a block.
 *
 * @param block  Block containing the target tile
 * @param index  Index of the target tile
 * @param source Source tile to copy members from
 *
 * @note This is done by creating a tile and modifying its members, then
 *       passing a pointer to that tile to this function, which copies
 *       its members into the tile at index in the block's tile array.
 **/
static void update_tile(block_t *block, int index, tile_t *source)
{
    if (!block)
        ERROR("block_update_index: block is NULL");
    if (index < 0 || index >= TILE_COUNT)
        ERROR("block_update_index: Invalid index");
    if (!source)
        ERROR("block_update_index: source is NULL");

    block->tile_arr[index] = *source;
}
