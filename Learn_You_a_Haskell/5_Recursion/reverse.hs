reverse' :: [t] -> [t]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]
