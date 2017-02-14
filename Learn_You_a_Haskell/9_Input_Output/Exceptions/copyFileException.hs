import qualified Data.ByteString.Lazy as BString
import System.IO.Error (catchIOError, isDoesNotExistError, ioeGetFileName)
import System.Environment (getArgs)

main :: IO()
main = do
    (srcPath:destPath:_) <- getArgs
    (copyFile srcPath destPath) `catchIOError` ioHandler

copyFile :: FilePath -> FilePath -> IO ()
copyFile srcPath destPath = do
    content <- BString.readFile srcPath
    BString.writeFile destPath content

ioHandler :: IOError -> IO ()
ioHandler e 
    | isDoesNotExistError e = do
        let Just fileName = ioeGetFileName e
        putStrLn $ "File not found: " ++ fileName
    | otherwise = do
        putStrLn "Unexpected Exception"
        putStrLn $ "Error:\n    " ++ (show e)