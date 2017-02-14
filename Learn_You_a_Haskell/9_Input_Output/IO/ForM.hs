import Control.Monad

main = do
    colors <- forM [1, 2, 3, 4] (\n -> do
        putStrLn $ "Which color do you associate with the number " ++ show n ++ "?"
        color <- getLine
        return color)
    putStrLn "We get: "
    mapM_ putStrLn colors

