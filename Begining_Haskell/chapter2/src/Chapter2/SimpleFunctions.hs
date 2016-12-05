module Chapter2.SimpleFunctions where

firstOrEmpty :: [[Char]] -> [Char]
firstOrEmpty lst = if not (null lst) then head lst else "empty"

(+++) :: [a] -> [a] -> [a]
xs +++ xs' = if null xs {- test emptyness -}
              then xs'   -- base case
              else (head xs):(tail xs +++ xs')
