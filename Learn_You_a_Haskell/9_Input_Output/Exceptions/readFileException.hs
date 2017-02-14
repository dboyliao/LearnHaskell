import System.Environment -- getArgs
import System.IO (readFile) -- readFile
import System.IO.Error -- catchIOError

main :: IO ()
main = do
    tryBlock `catchIOError` ioCatchHandler

tryBlock :: IO ()
tryBlock = do
    (fileName:_) <- getArgs
    content <- readFile fileName
    putStrLn $ "Content of " ++ fileName ++ ":\n" ++ content

ioCatchHandler :: IOError -> IO ()
ioCatchHandler err 
    | isDoesNotExistError err = do
        let Just fileName = ioeGetFileName err
        putStrLn $ "File not found: " ++ fileName
    | otherwise = do 
        putStrLn "Unexpected Error"
        putStrLn $ "Error:\n    " ++ (show err)