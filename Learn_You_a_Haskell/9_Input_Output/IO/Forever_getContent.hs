import Data.Char

main = do
    s <- getContents
    putStrLn (map toUpper s)
