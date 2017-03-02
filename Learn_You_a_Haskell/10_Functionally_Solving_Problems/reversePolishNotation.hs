{-# LANGUAGE ScopedTypeVariables #-}
-- Reverse Polish notation calculator
import System.IO (hFlush, stdout)
import Text.Read (readMaybe)

main :: IO()
main = do
    putStr "Enter an expression "
    hFlush stdout
    userInput <- getLine
    case (solveRP userInput :: Maybe Float) of
        Nothing -> putStrLn "Nothing!"
        Just answer -> putStrLn (show answer)
    main

solveRP :: forall a. (Num a, Read a, Fractional a) => String -> Maybe a
solveRP = head . foldl solver [] . words
    where solver :: [Maybe a] -> String -> [Maybe a] -- why comment out this line is an error?
          solver (Nothing:_) _ = [Nothing]
          solver (Just x:Just y:ys) "*" = Just (x*y):ys
          solver (Just x:Just y:ys) "+" = Just (x+y):ys
          solver (Just x:Just y:ys) "-" = Just (y-x):ys
          solver (Just x:Just y:ys) "/" = Just (y/x):ys
          solver xs numStr = (readMaybe numStr):xs
-- {-# LANGUAGE ScopedTypeVariables #-} will enable scoped type variables extension
-- for those function you want to apply this extension with, add `forall` in the 
-- function type declairation.