replicate' :: (Ord i, Num i, Enum i) => i -> t -> [t]
replicate' i a
    | i < 0 = []
    | otherwise = [a | j <- [1..i]]

