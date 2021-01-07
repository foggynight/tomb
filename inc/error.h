/**
 * error.h - v0.0.0
 * Copyright (C) 2021 Robert Coffey
 * Released under the GPLv2 license
 **/

#ifndef ERROR_H_
#define ERROR_H_

#include <signal.h>
#include <string.h>

extern char *error_message;

/**
 * ERROR: Print an error message and raise an interrupt signal.
 * @param X String containing an error message
 **/
#define ERROR(X) do {\
    error_message = strdup(X);\
    raise(SIGINT);\
} while (0)

/**
 * finish: Call exit function with argument sig.
 * @param sig Exit code to pass to exit function
 **/
void finish(int sig);

#endif // ERROR_H_

/**
 * Version History
 * 0.0.0 - 2021-01-07 - First commit
 **/
