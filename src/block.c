/**
 * block.c - v0.0.0
 *
 * Block type representing a square block of tiles on the game map.
 *
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 */

#include <stdlib.h>
#include <rtb/log.h>

#include "block.h"

block_t *block_init(void)
{
    block_t *new_block = calloc(1, sizeof(block_t));
    if (!new_block)
        rtb_elog("block_init: calloc failed");
    return new_block;
}

/**
 * Version History
 * 0.0.0 - 2021-01-05 - First commit
 */