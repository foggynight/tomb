/**
 * Block.hpp - v0.0.0
 *
 * Block struct representing a square block of tiles on the game map.
 *
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 */

#ifndef BLOCK_HPP_
#define BLOCK_HPP_

#include <vector>

#include <Tile.hpp>

const int BLOCK_WIDTH = 256;  // Width of each Block's Tile array
const int BLOCK_HEIGHT = 256; // Height of each Block's Tile array

struct Block {
public:
    std::vector<Block*> neighbourVec(8);    // Vector of pointers to neighbouring blocks
    Tile tileArr[BLOCK_WIDTH*BLOCK_HEIGHT]; // Array of Tiles contained in this block
};

#endif // BLOCK_HPP_

/**
 * Version History
 * 0.0.0 - 2021-01-03 - First commit
 */
