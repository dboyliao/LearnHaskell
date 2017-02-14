import System.IO
import System.Directory
import Data.List

main = do
    handle <- openFile "todo.txt" ReadMode
    (tempFilePath, tempHandler) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
    putStrLn "Here are your todo items:"
    putStr $ unlines numberedTasks
    putStrLn "Which one do you want to delete?"
    numString <- getLine
    let number = read numString
        newTodoItems = delete (todoTasks !! number) todoTasks
    hPutStr tempHandler $ unlines newTodoItems
    hClose handle
    hClose tempHandler
    removeFile "todo.txt"
    renameFile tempFilePath "todo.txt"
