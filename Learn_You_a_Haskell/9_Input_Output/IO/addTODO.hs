import System.IO
import Control.Monad (forever)

main = forever $ do 
    input <- getLine
    appendFile "TODO.txt" (input ++ "\n")
