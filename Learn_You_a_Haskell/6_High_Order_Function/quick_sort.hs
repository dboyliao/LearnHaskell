quick_sorts :: (Ord a) => [a] -> [a]
quick_sorts [] = []
quick_sorts (x:xs) = smaller ++ [x] ++ larger
    where smaller = quick_sorts (filter (<= x) xs)
          larger = quick_sorts (filter (>x) xs)

slice :: [a] -> Int -> Int -> [a]
slice [] _ _ = []
slice xs f t
    | f >= t = []
    | otherwise = take (t - f + 1) (drop f xs)

