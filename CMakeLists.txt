# Copyright (C) 2021 Robert Coffey
# Released under the GPLv2 license

cmake_minimum_required(VERSION 3.16.0)
project(ROGUE-LIKE_PROJECT C)

include_directories(inc)

add_executable(rogue-like src/main.c)
