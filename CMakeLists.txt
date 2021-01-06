# Copyright (C) 2021 Robert Coffey
# Released under the GPLv2 license

cmake_minimum_required(VERSION 3.0.0)
project(ROGUE-LIKE_PROJECT C)

set(CURSES_NEED_NCURSES TRUE)
set(CURSES_NEED_WIDE TRUE)
find_package(Curses REQUIRED)

include_directories(inc
                    dep/rtb/inc
                    ${CURSES_INCLUDE_DIRS})

add_executable(rogue-like
               src/block.c
               src/main.c
               src/map.c
               src/player.c
               src/screen.c)

target_link_libraries(rogue-like ${CURSES_LIBRARIES})
