/**
 * screen.h
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#ifndef SCREEN_H_
#define SCREEN_H_

#include "tile.h"

void screen_init(void);
int screen_step(tile_t tile_arr[]);
void screen_kill(void);

#endif // SCREEN_H_
