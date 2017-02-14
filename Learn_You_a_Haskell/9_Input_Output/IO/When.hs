import Control.Monad -- when

main = do
    c <- getChar
    when (c /= ' ') $ do
        putChar c
        main
