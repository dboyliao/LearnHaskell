largestDivisibleBy :: (Integral a) => a -> a
largestDivisibleBy 0 = error "zero division"
largestDivisibleBy n = head (filter p [100000,99999..])
    where p x = x `mod` n == 0

largestDivisibleByFrom :: (Integral a) => a -> a -> a
largestDivisibleByFrom 0 _ = error "zero division"
largestDivisibleByFrom n f = head (filter p [f,(f-1)..])
    where p x = x `mod` n == 0

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile' p (x:xs) = if (p x) then x:(takeWhile' p xs) else []

collatzChain :: (Integral a) => a -> [a]
collatzChain 0 = []
collatzChain 1 = [1]
collatzChain n 
    | even n = n:(collatzChain (n`div` 2))
    | odd n = n:(collatzChain (3*n+1))
