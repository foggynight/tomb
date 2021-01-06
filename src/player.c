/**
 * player.c - v0.0.0
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#include <stdlib.h>

#include <rtb/log.h>

#include "player.h"

player_t *player_init(int y_pos, int x_pos, char *symbol)
{
    player_t *new_player = malloc(sizeof(player_t));
    if (!new_player)
        rtb_elog("player_init: calloc failed");

    new_player->pos.y = y_pos;
    new_player->pos.x = x_pos;
    new_player->symbol = "@";

    return new_player;
}

/**
 * Version History
 * 0.0.0 - 2021-01-05 - First commit
 **/
