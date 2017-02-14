import System.IO

main = do 
    withFile "girlfriend.txt" ReadMode (\handle -> do
        hSetBuffering handle $ BlockBuffering (Just 5)
        contents <- hGetContents handle
        putStr contents)
