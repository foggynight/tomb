/**
 * error.c - v0.0.0
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#include <stdio.h>
#include <stdlib.h>

#include "error.h"
#include "screen.h"

char *error_message;

void finish(int sig)
{
    screen_kill();
    if (error_message)
        fprintf(stderr, "Error: %s\n", error_message);
    exit(sig);
}
