import System.Environment -- getArgs, getProgName
import System.Directory -- removeFile
import System.IO
import Data.List -- delete

type Action = ([String] -> IO ())
subcommands :: [(String, Action)]
subcommands = [("add", addTask),
               ("remove", removeTask),
               ("list", listTask),
               ("help", help)]

main = do
    (subcommand:args) <- getArgs
    let (Just action) = lookup subcommand subcommands
    action args

addTask :: Action
addTask [fileName, task] = appendFile fileName (task ++ "\n")

removeTask :: Action
removeTask [fileName, taskNumString] = do
    handle <- openFile fileName ReadMode
    (tempFilePath, tempHandle) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let tasks = lines contents
        taskNum = read taskNumString
        newTasks = delete (tasks !! taskNum) tasks
    removeFile fileName
    hPutStr tempHandle $ unlines newTasks
    renameFile tempFilePath fileName
    hClose handle
    hClose tempHandle 

listTask :: Action
listTask [fileName] = do
    handle <- openFile fileName ReadMode
    contents <- hGetContents handle
    -- above two lines can be replaced with 'contens <- readFile fileName'
    let tasks = lines contents
        numTasks = zipWith (\n task -> (show n) ++ " - " ++ task) [1..] tasks
    putStr $ unlines numTasks
    hClose handle

help :: Action
help [] = do
    progName <- getProgName
    putStrLn "Usage:"
    putStrLn $ progName ++ " list todo.txt  # list all tasks"
    putStrLn $ progName ++ " add todo.txt 'new task' # add new task"
    putStrLn $ progName ++ " remove todo.txt 3 # remove the 3rd task"
