/**
 * main.c - v0.0.0
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#include <locale.h>
#include <signal.h>
#include <stdlib.h>

#include "block.h"
#include "entity.h"
#include "error.h"
#include "map.h"
#include "player.h"
#include "screen.h"

int main(void)
{
    signal(SIGINT, finish);           // Call finish on interrupt signal
    setlocale(LC_ALL, "en_US.UTF-8"); // Enable UTF-8 support for C strings

    /* Initialize source tile */
    tile_t source_tile;

    /* Initialize map */
    map_t *map = map_init();

    /* Initialize player */
    entity_t *player = player_init();

    /* Add player to tile array */
    source_tile.symb = "@";
    block_update_tile(map->walk,
                      block_get_tile_index(player->pos.y, player->pos.x),
                      &source_tile);

    /* Initialize screen */
    screen_init();

    /* Game loop */
    for (;;) {
        int input = screen_step(map->walk->tile_arr);

        source_tile.symb = "";
        block_update_tile(map->walk,
                          block_get_tile_index(player->pos.y, player->pos.x),
                          &source_tile);

        player_update(player, input);

        source_tile.symb = "@";
        block_update_tile(map->walk,
                          block_get_tile_index(player->pos.y, player->pos.x),
                          &source_tile);
    }
}
