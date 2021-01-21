/**
 * player.c - v0.0.0
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#include <stdlib.h>
#include <string.h>

#include "block.h"
#include "entity.h"
#include "error.h"

entity_t *player_init(void)
{
    // TODO: Change-able player symbol
    entity_t *new_player = entity_init(BLOCK_HEIGHT / 2,
                                       BLOCK_WIDTH / 2,
                                       "\u03A8"); // Player represented with psi

    return new_player;
}

void player_update(entity_t *player, int input)
{
    static const char *valid_inputs = "wasdWASD";
    if (!player)
        ERROR("player_update: player is NULL");
    if (!strchr(valid_inputs, input))
        ERROR("player_update: Invalid input");

    switch (input) {
        case 'w':
        case 'W':
            entity_move(player, NORTH, 1);
            break;
        case 'd':
        case 'D':
            entity_move(player, EAST, 1);
            break;
        case 's':
        case 'S':
            entity_move(player, SOUTH, 1);
            break;
        case 'a':
        case 'A':
            entity_move(player, WEST, 1);
            break;
    }
}
