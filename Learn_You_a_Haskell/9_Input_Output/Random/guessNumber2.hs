import System.Random
import Control.Monad (when)

askForNumber :: StdGen -> IO ()
main :: IO ()
main = do
    gen <- getStdGen
    askForNumber gen

askForNumber gen = do
    putStr "Which number in the range from 1 to 10 am I thinking of? "
    let (randNum, newGen) = randomR (1, 10) gen :: (Int, StdGen)
    str <- getLine
    when (not $ null str) $ do
        let num = read str
        if randNum == num then
            putStrLn "You win!"
        else
            putStrLn $ "Wrong answer, expecting " ++ (show randNum)
    askForNumber newGen