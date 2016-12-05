maximum' :: (Ord a) => [a] -> a
maximum' [] = error "empty array"
maximum' [x] = x
maximum' (x:xs)
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum' xs

maximum'' :: (Ord a) => [a] -> a
maximum'' [] = error "empty array"
maximum'' [x] = x
maximum'' (x:xs) = max x (maximum'' xs)
