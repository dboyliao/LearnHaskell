all' :: (a -> Bool) -> [a] -> Bool
all' _ [] = True
all' p (x:xs) = if (not.p $ x) then all' p xs else False

any' :: (a -> Bool) -> [a] -> Bool
any' _ [] = False
any' p (x:xs) = if (not.p $ x) then any' p xs else True
