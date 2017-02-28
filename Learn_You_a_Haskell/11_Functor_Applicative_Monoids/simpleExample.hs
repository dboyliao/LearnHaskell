import System.IO

main :: IO()
main = do
    putStr "enter some text: "
    hFlush stdout
    line <- fmap reverse getLine
    putStrLn $ "reversed text: " ++ line
    main 
