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

int block_get_tile_index(int y_pos, int x_pos)
{
    if ((y_pos < 0 || y_pos >= BLOCK_HEIGHT)
     || (x_pos < 0 || x_pos >= BLOCK_WIDTH))
        ERROR("block_get_tile_index: Invalid position");
    return y_pos * BLOCK_WIDTH + x_pos;
}

void block_update_tile(block_t *block, int index, tile_t *source)
{
    if (!block)
        ERROR("block_update_index: block is NULL");
    if (index < 0 || index >= TILE_COUNT)
        ERROR("block_update_index: Invalid index");
    if (!source)
        ERROR("block_update_index: source is NULL");
    block->tile_arr[index] = *source;
}

/**
 * Version History
 * 0.0.0 - 2021-01-05 - First commit
 **/
