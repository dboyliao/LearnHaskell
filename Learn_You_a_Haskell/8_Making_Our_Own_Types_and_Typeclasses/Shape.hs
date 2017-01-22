module Shape
(
  Shape(..),
  Point(..),
  surface,
  nudge,
) where

data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

xCoord :: Point -> Float
xCoord (Point x _) = x

yCoord :: Point -> Float
yCoord (Point _ y) = y

shiftBy :: Point -> Float -> Float -> Point
shiftBy (Point x y) dx dy = Point (x+dx) (y+dy)

surface :: Shape -> Float
surface (Circle _ radius) = pi * radius^2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = abs $ (x2 - x1) * (y2 - y1)

nudge :: Shape -> Float -> Float -> Shape
nudge (Circle p r) dx dy = Circle ( shiftBy p dx dy ) r
nudge (Rectangle p1 p2) dx dy = Rectangle ( shiftBy p1 dx dy) (shiftBy p2 dx dy)
