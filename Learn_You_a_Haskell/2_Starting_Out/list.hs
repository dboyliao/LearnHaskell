#!/usr/bin/env runhaskell
head' (x:xs) = x
tail' (x:xs) = xs

last' :: [b] -> b
last' (x:xs) = if (length' xs) > 1 then last' xs else (xs !! 0)
last' [] = error "\ESC[0;31mempty list\ESC[0m"

init' :: [b] -> [b]
init' (x:xs) = if (length xs) >= 1 then ([x] ++ (init' xs)) else []
init' [] = []

length' :: [b] -> Int
length' (x:xs) = if (length xs) > 0 then (1 + length' xs) else 1
length' [] = 0

reverse' :: [b] -> [b]
reverse' (x:xs) = if (length xs) > 0 then (reverse' xs ++ [x]) else [x]
reverse' [] = []

take' :: Int -> [b] -> [b]
take' n (x:xs) = if n > 0 then [x]++(take' (n-1) xs) else []
take' n [] = []

null' :: [b] -> Bool
null' xs = if (length' xs) > 0 then False else True

drop' :: Int -> [b] -> [b]
drop' n (x:xs) = if n > 0 then (drop' (n-1) xs) else xs
drop' _ [] = []

sum' :: (Num b) => [b] -> b 
sum' (x:xs) = x + sum' xs
sum' [] = 0

product' :: (Num b) => [b] -> b
product' (x:xs) = x * (product' xs)
product' [] = 1

boomBang xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

join :: String -> [String] -> String
join by (x:xs) = if (length xs) > 0 then x ++ by ++ (join by xs) else x
join by [] = ""

replicate' :: Int -> b -> [b]
replicate' n a = [a | _ <- [1..n]]

-- concatanation
main = do 
       print ([1, 2, 3] ++ [2, 3])
       print ('A':" apple a day, keeps the doctors away")
       print ("Dboy" !! 0) -- list subscription
       print (head "Dboy") -- >> "D"
       print (head' "Dboy")
       print (tail "Dboy") -- >> "boy"
       print (tail' "Dboy")
       print (last "Dboy") -- >> "y"
       print (last' "Dboy")
       print (init "Dboy") -- >> "Dbo"
       print (init' "Dboy" )
       print (length "Dboy") -- >> 4
       print (length' "Dboy")
       print (reverse "Dboy") -- "yobD"
       print (reverse' "Dboy")
       print (take 2 "Dboy") -- "Db"
       print (take' 2 "Dboy")
       print (null []) -- True
       print (null' [])
       print (drop 3 [1, 2]) -- []
       print (drop' 3 [1, 2])
       print (sum [1, 2, 3]) -- 6
       print (sum' [1, 2, 3])
       print (product [1, 2, 3, 4]) -- 24
       print (product' [1, 2, 3, 4])
       print [1..20]
       print [20,19..1]
       print (boomBang [7..13])
       print (join " " ["hello", "world"])
       print (take 10 (cycle [1, 2, 3]))
       print (replicate' 0 3)
       print (replicate' 3 "Dboy")
-- error: print "A apple":" a day...." (`:` first argument has to be character)
