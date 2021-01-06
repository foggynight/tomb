/**
 * player.h - v0.0.0
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#ifndef PLAYER_H_
#define PLAYER_H_

typedef struct player {
    struct {
        int y;
        int x;
    } pos;
    char *symbol;
} player_t;

player_t *player_init(int y_pos, int x_pos, const char *symbol);

#endif // PLAYER_H_

/**
 * Version History
 * 0.0.0 - 2021-01-05 - First commit
 **/
