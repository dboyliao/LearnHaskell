#!/usr/bin/env runhaskell

bmiTell :: (RealFloat a) => a -> String
bmiTell 0.0 = "What!?"
bmiTell bmi 
    | bmi <= 18.5 = "underweight"
    -- you can use ',' to seperate multiple predictates in one guard
    | bmi > 18.5, bmi <= 25.0 = "normal" 
    | bmi <= 30 = "fat"
    -- otherwise is simply defined as True to catch all other cases
    | otherwise = "exetremely fat"

-- the size of indentation does not matter
-- as long as all statements of one expression have the same indentations.
testFunc x
  | x > 3 = "larger than 3!"
  | otherwise = "otherwise!"

main = do 
       print (bmiTell 10)
       print (bmiTell 23)
