import Data.Char -- toUpper

main = do
    putStrLn "Enter your first name "
    firstName <- getLine
    putStrLn "Enter your last name "
    lastName <- getLine
    let bigFirst = map toUpper firstName
        bigLast = map toUpper lastName
    -- `in` keyword is not needed here.
    -- All variable after `let` in do block
    -- will be visible for later on expressions.
    putStrLn $ "hey " ++ bigFirst ++ " " ++ bigLast ++ ", how are you?"
    putStrLn bigFirst -- bigFirst is still visible here.
