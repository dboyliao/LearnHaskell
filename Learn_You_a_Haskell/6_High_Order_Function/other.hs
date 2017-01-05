allneg = map (negate . abs) [5,-3,-6,7,-3,2,-19,24]
allneg2 = map (negate . sum . tail) [[1..5],[3..6],[1..7]] -- [-14,-15,-27]

sum' :: (Num a) => [a] -> a
sum' [] = error "empty list"
sum' [x] = x
sum' (x:xs) = x + sum' xs

sum'' :: (Num a) => [a] -> a
sum'' xs = foldl (+) 0 xs

fn = ceiling . negate . tan . cos . max 50 

oddSquareSum :: Integer  
oddSquareSum =   
    let oddSquares = filter odd $ map (^2) [1..]  
        belowLimit = takeWhile (<10000) oddSquares  
    in  sum belowLimit  
