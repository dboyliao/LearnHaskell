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

solveRP :: (Num a, Read a, Fractional a) => String -> Maybe a
solveRP = head . foldl solver [] . words
    where -- solver :: [Maybe a] -> String -> [Maybe a] -- why comment out this line is an error?
          solver (Nothing:_) _ = [Nothing]
          solver (Just x:Just y:ys) "*" = Just (x*y):ys
          solver (Just x:Just y:ys) "+" = Just (x+y):ys
          solver (Just x:Just y:ys) "-" = Just (y-x):ys
          solver (Just x:Just y:ys) "/" = Just (y/x):ys
          solver xs numStr = (readMaybe numStr):xs