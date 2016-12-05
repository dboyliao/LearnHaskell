quick_sort :: (Ord a) => [a] -> [a]
quick_sort [] = []
quick_sort (x:xs) = smaller ++ [x] ++ larger
                    where smaller = quick_sort [e | e <- xs, e <= x]
                          larger = quick_sort [e | e <- xs, e > x]
