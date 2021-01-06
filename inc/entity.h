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

/**
 * entity_t: An entity in the game world.
 * @member pos    y-x position of the entity in its containing block
 * @member symbol Unicode symbol representing the entity
 **/
typedef struct entity {
    struct {
        int y;
        int x;
    } pos;
    const char *symbol;
} entity_t;

/**
 * entity_init: Initialize an entity.
 * @param y_pos  y position of the entity in its containing block
 * @param x_pos  x position of the entity in its containing block
 * @param symbol Unicode symbol representing the entity
 **/
entity_t *entity_init(int y_pos, int x_pos, const char *symbol);

#endif // ENTITY_H_

/**
 * Version History
 * 0.0.0 - 2021-01-06 - First commit
 **/
