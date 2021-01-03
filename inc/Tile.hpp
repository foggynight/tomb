/**
 * Tile.hpp - v0.0.0
 *
 * Tile struct representing an individual tile on the game map.
 *
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 */

#ifndef TILE_HPP_
#define TILE_HPP_

struct Tile {
    wchar_t symbol;  // Symbol used to represent the Tile on screen
    int colour[2];   // Foreground and background colours of the Tile
    int position[2]; // x-y position of the Tile in its containing Block
};

#endif // TILE_HPP_

/**
 * Version History
 * 0.0.0 - 2021-01-03 - First commit
 */
