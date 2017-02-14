import System.Random
import Text.Printf

askForNumber :: IO Int
main :: IO ()
main = do
    gen <- newStdGen
    num <- askForNumber
    let (ans, _) = randomR (0, 10) gen :: (Int, StdGen)
    if ans == num 
    then do
        let msg = printf "Correct: %d" ans :: String
        print msg
    else do
        let msg = printf "Incorrect: %d v.s %d" ans num :: String
        print msg
    main

askForNumber = do
    putStrLn "Guess a number from 0 ~ 10"
    str <- getLine
    let num = read str
    return num