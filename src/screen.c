/**
 * screen.c
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

int screen_step(tile_t tile_arr[])
{
    erase();
    for (int y = 0; y < BLOCK_HEIGHT; ++y)
        for (int x = 0; x < BLOCK_WIDTH; ++x)
            mvaddstr(y, x, tile_arr[y*BLOCK_WIDTH+x].symb);
    refresh();
    return getch();
}

void screen_kill(void)
{
    endwin();
}
