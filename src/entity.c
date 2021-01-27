/**
 * entity.c
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#include <stdlib.h>

#include "entity.h"
#include "error.h"

entity_t *entity_init(int y_pos, int x_pos, const char *symb)
{
    entity_t *new_entity = malloc(sizeof(entity_t));
    if (!new_entity)
        ERROR("entity_init: malloc failed");

    new_entity->pos.y = y_pos;
    new_entity->pos.x = x_pos;
    new_entity->symb = symb;

    return new_entity;
}

void entity_move(entity_t *targ, enum cardinal_direction dir, int mag)
{
    if (!targ)
        ERROR("entity_move: targ is NULL");

    switch (dir) {
        case NORTH: {
            targ->pos.y -= mag;
        } break;
        case EAST: {
            targ->pos.x += mag;
        } break;
        case SOUTH: {
            targ->pos.y += mag;
        } break;
        case WEST: {
            targ->pos.x -= mag;
        } break;
    }
}
