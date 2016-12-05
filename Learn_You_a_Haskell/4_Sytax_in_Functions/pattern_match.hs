#!/usr/bin/env runhaskell

lucky :: (Integral a) => a -> String
lucky 7 = "Lucky 7!!"
lucky x = "Not 7"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n-1)

addVector :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVector (x, y) (x', y') = (x + x', y + y')

capital :: String -> String
capital [] = error "\ESC[0;31mEmpty string\ESC[0m"
capital all@(x:xs) = "The capital of " ++ all ++ " is " ++ [x]

main = do
       print (lucky 1)
       print (lucky 7)
       print (factorial 10)
       print (addVector (1, 2) (2, 2))
       print (capital "Dboy")

