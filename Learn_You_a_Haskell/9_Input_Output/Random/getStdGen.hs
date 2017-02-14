import System.Random

main = do
    gen <- getStdGen
    putStr $ take 30 (randomRs ('a', 'z') gen)
