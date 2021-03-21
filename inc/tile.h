/**
 * tile.h
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#ifndef TILE_H_
#define TILE_H_

/**
 * tile_t: Tile type representing a tile in the game world.
 * @member symb Unicode symbol used to represent the tile on screen
 **/
typedef struct tile {
    const char *symb;
} tile_t;

#endif // TILE_H_
