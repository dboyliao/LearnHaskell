module Geometry.Cube
( 
  cubeVolume,
  cubeArea,
) where

import qualified Geometry.Cuboid as Cuboid 

cubeVolume :: Float -> Float  
cubeVolume side = Cuboid.cuboidVolume side side side  

cubeArea :: Float -> Float  
cubeArea side = Cuboid.cuboidArea side side side  
