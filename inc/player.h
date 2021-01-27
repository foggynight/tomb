/**
 * player.h
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#ifndef PLAYER_H_
#define PLAYER_H_

#include "entity.h"

entity_t *player_init(void);
void player_update(entity_t *player, int input);

#endif // PLAYER_H_
