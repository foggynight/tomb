/**
 * screen.c - v0.0.0
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#include <ncurses.h>

#include "block.h"
#include "screen.h"
#include "tile.h"

void screen_init(void)
{
    initscr();
    keypad(stdscr, TRUE);
    nonl();
    cbreak();
    noecho();
}

void screen_step(tile_t tile_arr[])
{
    for (int y = 0; y < BLOCK_HEIGHT; ++y)
        for (int x = 0; x < BLOCK_WIDTH; ++x)
            mvaddstr(y, x, tile_arr[y*BLOCK_WIDTH+x].symb);
    refresh();
}

void screen_kill(void)
{
    endwin();
}

/**
 * Version History
 * 0.0.0 - 2021-01-03 - First commit
 **/
