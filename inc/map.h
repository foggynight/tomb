/**
 * map.h
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#ifndef MAP_H_
#define MAP_H_

typedef struct map {
    block_t *root; // Root block of the game map
    block_t *walk; // Block currently containing the player
} map_t;

map_t *map_init(void);

#endif // MAP_H_
