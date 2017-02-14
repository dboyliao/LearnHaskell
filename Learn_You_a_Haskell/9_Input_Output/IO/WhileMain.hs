main = do
    line <- getLine
    if (null line)
        then do 
            return ()
        else do
            putStrLn $ "You entered: " ++ line
            main
