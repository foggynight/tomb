/**
 * screen.c - v0.0.0
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 */

#include <ncurses.h>

#include "screen.h"

void screen_init(void)
{
    initscr();
    keypad(stdscr, TRUE);
    nonl();
    cbreak();
    noecho();

    if (has_colors()) {
        start_color();
        init_pair(1, COLOR_RED, COLOR_BLACK);
        attrset(COLOR_PAIR(1));
    }
}

void screen_step(void)
{
    static int dag = 0;
    mvaddch(dag%24, dag, getch());
    refresh();
    ++dag;
}

void screen_kill(void)
{
    endwin();
}

/**
 * Version History
 * 0.0.0 - 2021-01-03 - First commit
 */
