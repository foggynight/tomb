(in-package :tomb)

(defstruct tile
  "Tile structure representing a tile in a world; tiles are a single cell of
space in a world, and are the smallest amount of space which an entity can
occupy.

Tiles have a position which is inferred from their position in their containing
data structure, a symbol used to represent the tile on-screen, and attributes
which determine how the tile interacts with entities in a world."
  symbol)
