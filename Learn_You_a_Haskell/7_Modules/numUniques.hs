import Data.List (nub)
-- import Data.List hiding (sort)

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub
