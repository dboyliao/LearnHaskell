import Data.List (foldl')

data Section = Section { goA :: Int, goB :: Int, goCrossOver :: Int} deriving (Show)
type RoadSystem = [Section]
data Label = A | B | C deriving (Show)
type Path = [(Label, Int)]

goOneSection :: (Path, Path) -> Section -> (Path, Path)
goOneSection (pathA, pathB) (Section costA costB costCross) = 
    let costFromA = sum (map snd pathA)
        costFromB = sum (map snd pathB)
        directToA = costFromA + costA
        crossToA = costFromB + costB + costCross
        directToB = costFromB + costB
        crossToB = costFromA + costA + costCross
        newPathA = if directToA <= crossToA
                   then (A, costA):pathA
                   else (C, costCross):(B, costB):pathB
        newPathB = if directToB <= crossToB
                   then (B, costB):pathB
                   else (C, costCross):(A, costA):pathA
    in (newPathA, newPathB)

optimalPath :: RoadSystem -> Path
optimalPath roadSystem =
    let (optimalPathA, optimalPathB) = foldl' goOneSection ([], []) roadSystem
        costA = sum (map snd optimalPathA)
        costB = sum (map snd optimalPathB)
        finalPath = if costA <= costB
                    then optimalPathA
                    else optimalPathB
    in reverse finalPath

group :: Int -> [a] -> [[a]]
group 0 _ = undefined
group _ [] = []
group n xs = (take n xs):(group n (drop n xs))

main :: IO ()
main = do
    contents <- getContents
    let threes = group 3 $ map read (lines contents)
        roadSystem = map (\[a,b,c] -> Section a b c) threes
        finalPath = optimalPath roadSystem
        pathString = concat $ map (show . fst) finalPath
        pathCost = sum (map snd finalPath)
    putStrLn $ "Optinal path: " ++ pathString
    putStrLn $ "Cost: " ++ (show pathCost)