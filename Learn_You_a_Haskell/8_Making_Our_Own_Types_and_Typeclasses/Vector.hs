data Vector a = Vector a a a deriving (Show)

vPlus :: (Num t) => Vector t -> Vector t -> Vector t
vPlus (Vector x1 y1 z1) (Vector x2 y2 z2) = Vector (x1+x2) (y1+y2) (z1+z2)

dot :: (Num t) => Vector t -> Vector t -> t
dot (Vector x1 y1 z1) (Vector x2 y2 z2) = x1*x2 + y1*y2 + z1*z2
