/**
 * entity.c - v0.0.0
 *
 * Function definitions associated with the entity_t type.
 *
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#include <stdlib.h>

#include <rtb/log.h>

#include "entity.h"

entity_t *entity_init(int y_pos, int x_pos, const char *symbol)
{
    entity_t *new_entity = malloc(sizeof(entity_t));
    if (!new_entity)
        rtb_elog("entity_init: malloc failed");

    new_entity->pos.y = y_pos;
    new_entity->pos.x = x_pos;
    new_entity->symbol = symbol;

    return new_entity;
}

/**
 * Version History
 * 0.0.0 - 2021-01-06 - First commit
 **/
