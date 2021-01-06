/**
 * main.c - v0.0.0
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#include <locale.h>
#include <signal.h>
#include <stdlib.h>

#include "block.h"
#include "map.h"
#include "player.h"
#include "screen.h"

static void finish(int sig);

int main()
{
    signal(SIGINT, finish);
    setlocale(LC_ALL, "en_US.UTF-8");

    /* Initialize map */
    map_t map;
    map.root = map.walk = block_init();

    /* Initialize player */
    player_t *player = player_init(0, 0, "@");

    /* Initialize screen */
    screen_init();

    /* Game loop */
    for (;;) {
        screen_step(map.walk->tile_arr);
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
