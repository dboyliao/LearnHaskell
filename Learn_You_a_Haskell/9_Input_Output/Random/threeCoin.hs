import System.Random

main :: IO ()
main = do
    -- gen <- getStdGen
    let gen = mkStdGen 100
    let (firstToss, secondToss, thirdToss) = threeCoin gen
    putStrLn $ "first toss: " ++ (show firstToss)
    putStrLn $ "second toss: " ++ (show secondToss)
    putStrLn $ "third toss: " ++ (show thirdToss)

threeCoin :: StdGen -> (Bool, Bool, Bool)
threeCoin gen = 
    let (firstToss, newGen) = random gen
        (secondToss, newGen') = random newGen
        (thirdToss, _) = random newGen'
    in (firstToss, secondToss, thirdToss)
