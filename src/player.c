/**
 * player.c - v0.0.0
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#include <stdlib.h>

#include "block.h"
#include "entity.h"

entity_t *player_init(void)
{
    // TODO: Change-able player symbol
    entity_t *new_player = entity_init(BLOCK_HEIGHT / 2,
                                       BLOCK_WIDTH / 2,
                                       "\u03A8"); // Player represented with psi

    return new_player;
}

void player_update(entity_t *player, int input);
{

}

/**
 * Version History
 * 0.0.0 - 2021-01-07 - First commit
 **/


