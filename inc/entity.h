/**
 * entity.h - v0.0.0
 *
 * Declarations of entity_t and associated functions.
 *
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#ifndef ENTITY_H_
#define ENTITY_H_

enum cardinal_direction {
    NORTH,
    EAST,
    SOUTH,
    WEST
}

/**
 * entity_t: An entity in the game world.
 * @member pos  y-x position of the entity in its containing block
 * @member symb Unicode symb representing the entity
 **/
typedef struct entity {
    struct {
        int y;
        int x;
    } pos;
    const char *symb;
} entity_t;

/**
 * entity_init: Initialize an entity.
 * @param y_pos y position of the entity in its containing block
 * @param x_pos x position of the entity in its containing block
 * @param symb  Unicode symbol representing the entity
 **/
entity_t *entity_init(int y_pos, int x_pos, const char *symb);

/**
 * entity_move: Move an entity, updating its pos member.
 * TODO: Pack dir and mag together
 * @param targ Target entity to move
 * @param dir  Direction of motion in cardinal direction
 * @param mag  Magnitude of motion in number of tiles
 **/
void entity_move(entity_t *targ, enum cardinal_direction dir, int mag);

#endif // ENTITY_H_

/**
 * Version History
 * 0.0.0 - 2021-01-06 - First commit
 **/
