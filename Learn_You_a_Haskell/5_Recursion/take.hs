take' :: (Ord i, Num i) => i -> [t] -> [t]
take' i _
    | i <= 0 = []
take' _ [] = []
take' n (x:xs) = x: take' (n-1) xs
