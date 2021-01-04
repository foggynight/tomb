# Copyright (C) 2021 Robert Coffey
# Released under the GPLv2 license

cmake_minimum_required(VERSION 3.0.0)
project(ROGUE-LIKE_PROJECT C)

find_package(Curses REQUIRED)
include_directories(inc ${CURSES_INCLUDE_DIR})

add_executable(rogue-like src/main.c)
target_link_libraries(rogue-like ${CURSES_LIBRARIES})
