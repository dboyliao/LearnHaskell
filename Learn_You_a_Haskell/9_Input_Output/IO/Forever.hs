import Control.Monad -- forever
import Data.Char
import System.IO -- stdout, hFlush

main = forever $ do 
    putStr "Give me some input: "
    hFlush stdout
    -- in compiled program, line output will be buffered until it gets a '\n'.
    -- See https://mail.haskell.org/pipermail/haskell/2006-September/018430.html
    putStr "hello (not buffered)\n" -- this will not be buffered.
    l <- getLine
    putStrLn $ map toUpper l
