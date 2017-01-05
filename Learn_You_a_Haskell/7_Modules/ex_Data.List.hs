import qualified Data.List

ex_intersperse = Data.List.intersperse '.' "Dboy" -- "D.b.o.y"
ex_intercalate = Data.List.intercalate " " ["Hello", "world"] -- "Hello world"

transpose' :: (Eq a) => [[a]] -> [[a]]
transpose' rows
    | [] `elem` rows = []
transpose' [] = []
transpose' rows = (map head' rows) : transpose' (map tail' rows)
    where 
        head' (x:_) = x
        tail' (_:xs) = xs

deleteAll :: (Eq a) => a -> [a] -> [a]
deleteAll x xs
    | x `elem` xs = deleteAll x (Data.List.delete x xs)
    | otherwise = xs
