/**
 * map.c - v0.0.0
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#include <stdlib.h>

#include "block.h"
#include "error.h"
#include "map.h"

map_t *map_init(void)
{
    map_t *new_map = malloc(sizeof(map_t));
    if (!new_map)
        ERROR("map_init: malloc failed");

    new_map->root = new_map->walk = block_init();

    return new_map;
}
