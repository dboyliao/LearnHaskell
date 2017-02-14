main = do
    contents <- getContents
    putStr (shortLineOnly contents)

shortLineOnly contents = 
    let allLines = lines contents
        shortLines = filter (\line -> length line < 10) allLines
        -- result = unlines shortLines
    in (unlines shortLines) -- result
