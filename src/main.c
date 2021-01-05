/**
 * main.c - v0.0.0
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 */

#include <locale.h>
#include <signal.h>
#include <stdlib.h>

#include "block.h"
#include "map.h"
#include "screen.h"

static void finish(int sig);

int main()
{
    signal(SIGINT, finish);
    setlocale(LC_ALL, "en_US.UTF-8");

    map_t game_map;
    game_map.root = game_map.walk = block_init();
    game_map.walk->tile_arr[0].symbol = "\u03C6";

    screen_init();

    for (;;) {
        screen_step(game_map.walk->tile_arr);
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
 */
