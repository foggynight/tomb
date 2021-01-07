/**
 * tile.h - v0.0.0
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

/**
 * tile_t: Tile type representing a tile in the game world.
 * @member symb Unicode symbol used to represent the tile on screen
 **/
#ifndef TILE_H_
#define TILE_H_

typedef struct tile {
    const char *symb;
} tile_t;

#endif // TILE_H_

/**
 * Version History
 * 0.0.0 - 2021-01-03 - First commit
 **/
