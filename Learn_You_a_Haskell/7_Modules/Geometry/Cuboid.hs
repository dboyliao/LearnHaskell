module Geometry.Cuboid
(
  cuboidArea,
  cuboidVolume
) where

cuboidVolume :: Float -> Float -> Float -> Float  
cuboidVolume a b c = rectangleArea a b * c  
      
cuboidArea :: Float -> Float -> Float -> Float  
cuboidArea a b c = rectangleArea a b * 2 + rectangleArea a c * 2 + rectangleArea c b * 2  

rectangleArea :: Float -> Float -> Float  
rectangleArea a b = a * b 
