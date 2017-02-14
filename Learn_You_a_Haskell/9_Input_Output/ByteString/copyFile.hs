import System.Environment
import qualified Data.ByteString.Lazy as BString

copyFile :: FilePath -> FilePath -> IO ()
main :: IO()
main = do
    (srcPath:destPath:_) <- getArgs
    putStrLn $ "Copy from " ++ srcPath ++ " to " ++ destPath
    copyFile srcPath destPath

copyFile srcPath destPath = do
    content <- BString.readFile srcPath
    BString.writeFile destPath content
