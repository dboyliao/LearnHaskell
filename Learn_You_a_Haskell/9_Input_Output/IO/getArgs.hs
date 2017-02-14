import System.Environment -- getArgs
import Data.List

main = do 
    args <- getArgs
    progName <- getProgName
    putStrLn $ "The porgram name: " ++ progName
    putStrLn "The arguments:"
    mapM putStrLn args
