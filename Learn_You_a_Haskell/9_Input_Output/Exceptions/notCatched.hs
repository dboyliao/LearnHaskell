import System.IO.Error
import qualified Control.Exception as E

main :: IO ()
main = do
    notCatch `E.catch` handler'
    notCatch `catchIOError` handler
    notCatch `E.catch` handler' -- this line will not be evaluated since the program fails
                                -- on previous line.

notCatch :: IO ()
notCatch = do
    E.throw $ E.AssertionFailed "You can't catch me. Bang!!"

handler :: IOError -> IO ()
handler _ = do
    putStrLn "handled!"

handler' :: E.AssertionFailed -> IO ()
handler' e = do
    putStrLn $ "handled: " ++ (show e)