-- main = putStrLn "Hello world!"
main = do
    putStrLn "Enter your name here: "
    name <- getLine
    putStrLn ("Hello, " ++ name)
