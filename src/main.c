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
#include "map.h"
#include "screen.h"

/**
 * finish: Call exit function with argument sig.
 * @param sig Exit code to pass to exit function
 **/
static void finish(int sig);

int main(void)
{
    signal(SIGINT, finish);           // Call finish on interrupt signal
    setlocale(LC_ALL, "en_US.UTF-8"); // Enable UTF-8 support for C strings

    /* Initialize source tile */
    tile_t source_tile;
    source_tile.symb = "@";

    /* Initialize player */
    entity_t *player = entity_init(0, 0, "@");

    /* Initialize map */
    map_t *map = map_init();
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

        switch (input) {
            case 'w': entity_move(player, NORTH, 1); break;
            case 'd': entity_move(player, EAST, 1); break;
            case 's': entity_move(player, SOUTH, 1); break;
            case 'a': entity_move(player, WEST, 1); break;
        }

        source_tile.symb = "@";
        block_update_tile(map->walk,
                          block_get_tile_index(player->pos.y, player->pos.x),
                          &source_tile);
    }
}

static void finish(int sig)
{
    screen_kill();
    exit(sig);
}

/**
 * Version History
 * 0.0.0 - 2021-01-03 - First commit
 **/
