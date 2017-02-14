import System.Random

main = do
    gen <- getStdGen
    putStrLn $ take 40 (randomRs ('a', 'z') gen)
    gen' <- getStdGen -- gen' is the same as gen (since getStdGen returns a global random generator)
    putStrLn $ take 40 (randomRs ('a', 'z') gen')

-- you should see two identical strings printed out.
