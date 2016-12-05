isLarger :: (Num a, Ord a) => a -> a -> Bool
isLarger x y = (compare x y) == LT

isLargerThan10 = isLarger 10
-- isLargerThan10 10  == False
-- isLargerThan10 20 == True
