zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = (f x y) : zipWith' f xs ys

-- above recursive call is neccessary.
-- or we will have no way to stop the case where one of [a] or [b] 
-- is infinite but not both.
-- Take zipWith'' for example.
zipWith'' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith'' f xs ys = [ (f x y) | x <- xs, y <- ys ]
